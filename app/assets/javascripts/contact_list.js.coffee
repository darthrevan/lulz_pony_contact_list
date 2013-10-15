app = angular.module('ContactList',['ngResource','ngRoute'])

rp = ($routeProvider) ->
  $routeProvider.when("/contacts/:contactId",
    templateUrl: "assets/partials/contact-detail.html"
    controller: "ContactCtrl"
  ).when("/",
    controller: "ContactListCtrl"
  ).when("/new",
    templateUrl: "assets/partials/new_contact.html",
    controller: "NewContactCtrl"
  ).otherwise redirectTo: '/'

app.config ["$routeProvider", rp]

app.factory "Contact", ($resource) ->
  $resource("contacts/:id.json", {id: "@id"},
    {get: {isArray:false, method: 'GET'}, update: {method: 'PUT'}, query: {isArray:true, method: 'GET'}})

app.factory "ContactGroup", ($resource) ->
  $resource("contact_groups/:id.json", {id: "@id"}, {get: {isArray:true, method: 'GET'}})


@ContactListCtrl = ($scope, Contact) ->
  $scope.contacts = Contact.query()

  $scope.deleteContact = (id) ->
    Contact.delete(id: id)
    $scope.contacts = Contact.query()



@ContactCtrl = ($scope, $routeParams, Contact, ContactGroup) ->
  $scope.contactId = $routeParams.contactId
  $scope.contact = Contact.get(id: $routeParams.contactId)
  $scope.contact_groups = ContactGroup.query()

  $scope.editContact = ->
    Contact.save($scope.contact)
    $scope.$parent.contacts = Contact.query()

  $scope.new_contact = {}

@NewContactCtrl = ($scope, Contact, ContactGroup) ->
  $scope.contact_groups = ContactGroup.query()
  $scope.newContact = ->
    Contact.save($scope.new_contact)
    $scope.$parent.contacts = Contact.query()
    console.log($scope.$parent)







