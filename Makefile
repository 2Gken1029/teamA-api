init:
	@echo "初期設定を行います"
	docker compose up -d 
	docker compose exec api-php composer install
	docker compose exec api-php php artisan key:generate
	docker compose exec api-php php artisan storage:link
	cp .githooks/pre-commit .git/hooks/pre-commit  

analyse:
	@echo "コードの静的解析・フォーマットを行います"
	docker compose exec api-php ./vendor/bin/pint
	docker compose exec api-php ./vendor/bin/phpstan analyse

down:
	@echo "コンテナを落とします"
	docker compose down
	
api:
	@echo "コンテナの中に入ります"
	docker compose exec api-php bash 
