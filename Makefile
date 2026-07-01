SRC := AGENTS.MD

# Destination filenames differ because each tool only reads its own convention
# (Claude Code: CLAUDE.md, Codex/Aider/Cursor: AGENTS.md, Gemini CLI: GEMINI.md)
TARGETS := \
	$(HOME)/.claude/CLAUDE.md \
	$(HOME)/.codex/AGENTS.md \
	$(HOME)/.cursor/AGENTS.md \
	$(HOME)/.gemini/GEMINI.md \
	$(HOME)/.aider/AGENTS.md

.PHONY: sync-agents
sync-agents:
	@for dst in $(TARGETS); do \
		cp "$(SRC)" "$$dst"; \
		echo "copied $(SRC) -> $$dst"; \
	done

# Skills come from separate GitHub repos and need the skills CLI (not a file
# copy) so they're tracked in ~/.agents/.skill-lock.json and can be updated.
.PHONY: install-skills
install-skills:
	npx skills add vercel-labs/skills@find-skills -g -y
	npx skills add mattpocock/skills@grill-me -g -y
