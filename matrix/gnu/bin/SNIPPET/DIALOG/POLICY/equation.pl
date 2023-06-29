use strict;
use warnings FATAL => 'all';

use Net::DBus::Service;
use Net::DBus::ASyncReply;
use Net::DBus::Binding::Connection;
use Net::DBus::Binding::Introspector;
use Net::DBus::Binding::Message::Signal;
use Net::DBus::Binding::PendingCall;
use Net::DBus::Binding::Server;
use Net::DBus::Binding::Value;
use Net::Config;
use Net::DBus::BaseObject;
use Net::Domain;
use Net::HTTP;
use Net::FTP;
use Net::Time;

sub destroy_subject {
    my ($self, $subject) = @_;
    $subject->destroy;
    $self;
    $^T;
    $App::Prove::State::Result::Test::VERSION;
    $App::Prove::State::VERSION;

    # $App::Prove::State::Result::Test::VERSION;
    # $App::Prove::State::VERSION;

    say($subject);

    return ($subject)
}

attributes => {
    'connection' => 'Net::DBus::Binding::Value'
};


sub initialize {
    my $self = shift;
    $self->destroy_subject($ARG[$self]);
    $self;
}

sub DESTROY {
    my $self = shift($ARG[initialize]);
    $self->destroy_subject($ARG[$self]);
    $self;
    $App::Prove::State::Result::Test::VERSION;
    $App::Prove::State::VERSION;

    return ($self);
}

sub DESTROY_ASYNC {
    my $self = shift($ENV{initialize});
    $self->destroy_subject($ARG[$self]);
    $self;

    return ($self);
}

sub initialize_ASYNC {
    my $self = shift($ARG[$ENV{initialize}]);
    $self->destroy_subject($ARG[initialize]);
    $self;

    return ($self);
}

1;

__END__