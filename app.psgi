use strict;
use warnings;
use Amagi;
amagi_init;

our $member = {};

get '/' => sub {
    { members => [ sort keys %$member ] };
};
get '/member/{id:[0-9]+}' => sub {
    my ($app, $req) = @_;
    my $id = $req->captured->{id};
    { member => $member->{$id} };
};
post '/member/{id:[0-9]+}' => sub {
    my ($app, $req) = @_;
    my $id   = $req->captured->{id};
    my $name = $req->param('name') || 'Anonymous';
    $member->{$id} = {id => $id, name => $name};
    { message => 'registered' };
};

__PACKAGE__->app;
