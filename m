Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA5A529DB9B
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 05:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744350187; cv=none; b=jelflJhd+uY5xqxraD8uT52hwiAYnNn2uPeSvSHv4wTawkOliGZBQ6OeO1jVgkifBhj/anRCAtSBwlKZacrcftnB2cF5OzW2FjqTlG6FMflRViHRQNMgpmw4ZgqFnT7nWAeEZUQfUss5K6WM1SJLwv3gtnYNF9fNWIpYywxByMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744350187; c=relaxed/simple;
	bh=Nu2LqFQAEtnU/2I6HvpLjldth4L30txPXLQCI1B17WM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KcB+TW+L5MCF076DKgNH5ZrnFRvHOoZojcdDUC28dwxlGYxsetuitX0ZlsUNAsn5hRc9XdYlKLEDSLhk8PFsb7exV9J5Mp5B/hjCUkB6VON4fzwE0BSwEmVdRvUYWV+2wvYt3VFpU10xRgwdbSGvahI+x7yow75EDfiEhsOSSHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pYhqhbR9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pYhqhbR9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2EAAC4CEE5;
	Fri, 11 Apr 2025 05:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744350186;
	bh=Nu2LqFQAEtnU/2I6HvpLjldth4L30txPXLQCI1B17WM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pYhqhbR9nbpby6XjQMna6X8fTsQBcTx0cZciLPnHDatJVVhC3lzkQAO6wHwg1I1sB
	 /Li5A6FduXC3Mn111etpoq9BqAJMtmmTBaL+1sl5Yw12ptKDzG88efJQ2qpCd0QG4L
	 2yttU6d9qeZHUjGCTliMMIBkVTh4T+AixarlOpmZKgPC1fChTiBugY59e1NFrEDbjw
	 BEPk7iDBvTQuD2I6Tosp2Cw6vD4ackBp30KNiphg+hsapolIr1EQc4I2YAbcqLOqCo
	 VBC2ECcYuWbvlBk6nDaguA1yjSnBlbOwAcpnupCA85WVBzmvIVlOWe30UfLLHhV5ol
	 wOdKoJ79/0+UA==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 48/53] x86/alternatives: Move declarations of vmlinux.lds.S defined section symbols to <asm/alternative.h>
Date: Fri, 11 Apr 2025 07:41:00 +0200
Message-ID: <20250411054105.2341982-49-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250411054105.2341982-1-mingo@kernel.org>
References: <20250411054105.2341982-1-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move it from the middle of a .c file next to the similar declarations
of __alt_instructions[] et al.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 arch/x86/include/asm/alternative.h | 6 ++++++
 arch/x86/kernel/alternative.c      | 6 ------
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/x86/include/asm/alternative.h b/arch/x86/include/asm/alternative.h
index 4a37a8bd87fd..ef84739a77f5 100644
--- a/arch/x86/include/asm/alternative.h
+++ b/arch/x86/include/asm/alternative.h
@@ -82,6 +82,12 @@ struct alt_instr {
 
 extern struct alt_instr __alt_instructions[], __alt_instructions_end[];
 
+extern s32 __retpoline_sites[], __retpoline_sites_end[];
+extern s32 __return_sites[],	__return_sites_end[];
+extern s32 __cfi_sites[],	__cfi_sites_end[];
+extern s32 __ibt_endbr_seal[],	__ibt_endbr_seal_end[];
+extern s32 __smp_locks[],	__smp_locks_end[];
+
 /*
  * Debug flag that can be tested to see whether alternative
  * instructions were patched in already:
diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index eb3be5d3efef..cd828c236fd2 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -149,12 +149,6 @@ static void add_nop(u8 *buf, unsigned int len)
 		*buf = INT3_INSN_OPCODE;
 }
 
-extern s32 __retpoline_sites[], __retpoline_sites_end[];
-extern s32 __return_sites[], __return_sites_end[];
-extern s32 __cfi_sites[], __cfi_sites_end[];
-extern s32 __ibt_endbr_seal[], __ibt_endbr_seal_end[];
-extern s32 __smp_locks[], __smp_locks_end[];
-
 /*
  * Matches NOP and NOPL, not any of the other possible NOPs.
  */
-- 
2.45.2

