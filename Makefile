entrypoint:
	@echo ">>> choose a valid script: setup, start, stop, down generate-client, get-client, revoke-client"

# SERVER_PUBLIC_URL="server.domain.com" make setup
setup:
	docker-compose run --rm openvpn ovpn_genconfig -u "udp://${SERVER_PUBLIC_URL}"
	docker-compose run --rm openvpn ovpn_initpki

start:
	docker-compose up -d

stop:
	docker-compose stop

down:
	docker-compose down

# CLIENT_NAME="client" make generate-client
generate-client:
	docker-compose run --rm openvpn easyrsa build-client-full ${CLIENT_NAME} nopass

# CLIENT_NAME="client" make get-client
get-client:
	docker-compose run --rm openvpn ovpn_getclient ${CLIENT_NAME} > "admin-vpn_${CLIENT_NAME}.ovpn"

# CLIENT_NAME="client" make revoke-client
revoke-client:
	docker-compose run --rm openvpn ovpn_revokeclient ${CLIENT_NAME}
