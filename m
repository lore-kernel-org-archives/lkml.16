Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E66827F74B
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 13:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751378232; cv=none; b=UQPPai494XVO/usgTp5TODi74XvMsxYBX8XTRWe5jxYeDbVhIvQrdzTWlBw2Jii9rYtknMlPIWUxfGY/ofmdk0DeufQlbiShGHFgkTayrR87CVoSGJtK/x/gBcPwIKngg0pj5oW3p97lsAso/bpFQR4KxrnrV6rDQ5fUeOLVpUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751378232; c=relaxed/simple;
	bh=vdVubaR2jthmhWrQkQs0ZqEnC3ZXQ6ikDWg6lQMR8+g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PzopCqT2tr0EjLkB2aKE4SSVYlN89rsnrBDzQWzMJMuTrjQ5MxuZhSb/ExZob6oi8KunWCHSZePOnDN3Z3HzKVMqVwlQgWz+mxrZ2ZXI8zaAqBdMSDV1eQIiV981sIHyZWibUYKvWTpMHGA/67/JMM4s1H6eW8qxW9TJ1iSe6Wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 68DBB2F9D;
	Tue,  1 Jul 2025 06:56:55 -0700 (PDT)
Received: from e133380.cambridge.arm.com (e133380.arm.com [10.1.197.52])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DDCC53F58B;
	Tue,  1 Jul 2025 06:57:09 -0700 (PDT)
From: Dave Martin <Dave.Martin@arm.com>
To: linux-kernel@vger.kernel.org
Cc: Oleg Nesterov <oleg@redhat.com>,
	Kees Cook <kees@kernel.org>,
	Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH 23/23] binfmt_elf: Warn on missing or suspicious regset note names
Date: Tue,  1 Jul 2025 14:56:16 +0100
Message-Id: <20250701135616.29630-24-Dave.Martin@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250701135616.29630-1-Dave.Martin@arm.com>
References: <20250701135616.29630-1-Dave.Martin@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now that all regset definitions declare an explicit note name, warn if
the note name is missing when generating a core dump.  Simplify the
fallback to always guess "LINUX", which is appropriate for all
Linux-specific notes (i.e., all newly added notes, for a long time
now).  The one standard exception (PR_FPREG) will no longer have an
"unexpected" note name overridden, but a warning will still be emitted.

Also warn if the specified note name doesn't match the legacy
pattern -- but don't bother to override the name in this case.  This
warning can be removed in future if new note types emerge that require
a specific note name that is not "LINUX".

No functional change, beyond the extra noise in dmesg and not
overriding an unexpected note name for PR_FPREG any more.

Now that all upstream arches are ported to use USER_REGSET_NOTE_TYPE(),
new regsets created by copy-pasting existing code should end up correct
by construction.

Signed-off-by: Dave Martin <Dave.Martin@arm.com>
Cc: Oleg Nesterov <oleg@redhat.com>
Cc: Kees Cook <kees@kernel.org>
Cc: Akihiko Odaki <akihiko.odaki@daynix.com>

---

***NOTE***

This patch is included here for completeness, but I expect to repost it
in a future cycle, once the arch patches have gone in.

Un-migrated arches will trigger WARNs with this patch applied, and
arches that don't specify codedump note names will always get
"LINUX" -- since the whole point is to stop guessing the note name in
the core code.

On _unpatched_ arches (only) this is a potential ABI break for the
NT_PRFPREG note (which, for historical reasons, is a "CORE" note even
though it is OS-specific on most or all arches).

Cheers
---Dave
---
 fs/binfmt_elf.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/fs/binfmt_elf.c b/fs/binfmt_elf.c
index 89063d1d9e9a..92cf005468b5 100644
--- a/fs/binfmt_elf.c
+++ b/fs/binfmt_elf.c
@@ -1750,8 +1750,13 @@ static int fill_thread_core_info(struct elf_thread_core_info *t,
 		if (is_fpreg)
 			SET_PR_FPVALID(&t->prstatus);
 
-		if (!note_name)
-			note_name = is_fpreg ? NN_PRFPREG : "LINUX";
+		/* There should be a note name, but if not, guess: */
+		if (WARN_ON_ONCE(!note_name))
+			note_name = "LINUX";
+		else
+			/* Warn on non-legacy-compatible names, for now. */
+			WARN_ON_ONCE(strcmp(note_name,
+					    is_fpreg ? "CORE" : "LINUX"));
 
 		__fill_note(&t->notes[note_iter], note_name, note_type,
 			    ret, data);
-- 
2.34.1

