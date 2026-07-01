# agents

Репозиторий хранит единый файл инструкций для LLM-инструментов и синхронизирует его в конфиги каждого инструмента.

## Структура
- `AGENTS.MD` — общие инструкции (стиль общения, предпочтения по коду, workflow)
- `Makefile` — цель `sync-agents` для копирования файла в домашние директории инструментов

## Использование
```
make sync-agents
```
Копирует `AGENTS.MD` в:
- `~/.claude/CLAUDE.md`
- `~/.codex/AGENTS.md`
- `~/.cursor/AGENTS.md`
- `~/.gemini/GEMINI.md`
- `~/.aider/AGENTS.md`

⚠️ Перезаписывает существующие файлы без бэкапа.

## Редактирование
Меняйте `AGENTS.MD`, затем запускайте `make sync-agents`, чтобы обновить все инструменты.

## Skills
Рекомендуемые Claude Code skills для работы с этим репо:
- `find-skills` — поиск и установка готовых skills (спрашивать `/find-skills` или описать нужную задачу)
- `grill-me` — детальный опрос по плану/дизайну перед реализацией (`/grill-me`)

Установка (через [skills CLI](https://skills.sh/), не копированием — так skill попадает в `~/.agents/.skill-lock.json` и его можно обновлять через `npx skills update`):
```
make install-skills
```