Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC917267B6A
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 09:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744106156; cv=none; b=FtAxnFrh0S088S0aGNafCD1+7kG3XyjXAOqQaTs1BR0ZbdYLTYKaTv1HQu/OYugnurMKLoB2oMLtLIPX1r287y4uYEhJA+1yy2NHbJ9iqN9oo+HG4sDycyvqEQUpaIRRaux7EliGNzNzUxSKH/41az3Pr/onU61E/d7zo5nGUXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744106156; c=relaxed/simple;
	bh=hRU/HFc1Pri2nuvuLbbIvA1nveAWwU0ZIv2/97B6hfY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Y9p1DN24Ul0J5WTnh/giDhF0GiqRuWJ73PqaPSU6Mi3L0fh74HvpPECCeIWkzP5Lh8LJWf8iyrhaWg70RlkfBoy5qagQS7bQ07yOkdjxUUcyE7k0A9S7w7DU1leT+4dddI70G1gtQ9bXcCE+Z1qlvZ4XHJGf4QImKW+x+KBLp8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=Myx/YEni; arc=none smtp.client-ip=54.254.200.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="Myx/YEni"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1744106138;
	bh=1cOOugdxNH1dzSDvBT4rMQJc05Z5J3Plmk57TSIQEWs=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=Myx/YEnipmrFCUv3zAWbvP/JbipAxgGh/qHbcf9mPDZX+N0yy1tkTWfSjeBfRLGXu
	 6SJN899dJo+PC0xQrsz2y4yw1NFu4fKC870V+EF5yzUOxMDtvmgr4o5zkDYdCQ1GIs
	 AJx77z1lR4Y5167dY7qNXCNTxRAO34i8C1iMl0NU=
X-QQ-mid: bizesmtpip4t1744106098t470dd0
X-QQ-Originating-IP: 07VJtzU6r30JTPiI7i71igbsBf5K/zZgEQV+ByQe3qs=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 08 Apr 2025 17:54:56 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 4550505304190636974
EX-QQ-RecipientCnt: 15
From: WangYuli <wangyuli@uniontech.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr
Cc: wangyuli@uniontech.com,
	chenhuacai@kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	vincent.chen@sifive.com,
	palmerdabbelt@google.com,
	samuel.holland@sifive.com,
	zhanjun@uniontech.com,
	niecheng1@uniontech.com,
	guanwentao@uniontech.com,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH v3] riscv: KGDB: Do not inline arch_kgdb_breakpoint()
Date: Tue,  8 Apr 2025 17:54:54 +0800
Message-ID: <C5DCACA951B6211D+20250408095454.67390-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: OW4JKxETGMY2kJ8hFN/CXvEkU1HIcYPaB1rkHtb7G/L9srHrzADzOTHp
	P4Cl08WDuOi4GjaxZ2LxkgYGbMTV5BFbqnax9etwZxmJ/KkE/Amkr6czeI6ufdsQUaXK2cu
	qsw41ablMP8dhVjQDMYdWo7fjyvmybWh0YWZAUk3jfbq5hSbTN009DcQyjQ7hOZAm09npFv
	kewtj7buIor0OjbMBdKrho7zJ41xXaCUYIoJrhjnE5RoHRv3DmhUzKGIXyZtLFb4eKJwNI8
	RHXwW1RBBUwvEleFAjHpiGv3ivqn762A5fOllrzWB9n3XikWhrqbwAiBunORjTDfX+Q6fVg
	B4E5OyAHQIDKkBklro5ZBVoN/6pmo3NRfI17nHZOyzDvdnNjAKXlqPqZI13b+l31ERLRYxL
	BfapJQDTjj/ge1v2Jh52wGuScBWcsNV7UBCA8pXL/GBdzVRhsGfs17uXqONnrDKUZPuS5ax
	yktAILSfyKcO3j4mBdQvgC52T9uZy4Ue50B/G24x/szsu8gg2epTmZZfqMUP+4M1vJZAjtD
	N8E+ph3syfIsagA06gpADq4cClO+wCRmVZudjLVk20D6deqw9oJBWPaHyQpdB1BxoW7kQbo
	qRdXHCsH3Ykis8s1tA8Im0UHVNaxhkvwh3FWrG7TrUVzvgpZeXG0etgNHw4vrgAC9CINDDP
	XIEeMT7+qDRXING2qid9HBIEVtP5ifYgZek8RkaKL5ruDZbQhfSdrW01ZkUp6FoLwOKcKLx
	mgKFuuGb452e+uuW+k6KSdWsIcctxx1gFh2Kwfhhfs1JgW/AOSylAyeCqofSYepv+4zYNiS
	Xu9vNkYAH8pjJ4248GanSkpdj2F3E1zVoLGi89SUb1teeX/5jDWGoKXMoOAJYuQYHWq62oX
	WBK+uzBjWm7e3d9BQ6q+1/MuIt3V4xCUQQrKG9Symt2efBipq78XrZb2IB6slC9eUPBzyca
	hv8ZQWyBVfJ144SJCWhjeMJD05V+7Jmbdyc8grCBGcB56byTBZFaXP7mUG2FIleJQ4+bDOV
	Xio4s3flYnNsmQ9abJAMwP3E/3bfh+QoYfRS/Iqg==
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
X-QQ-RECHKSPAM: 0

The arch_kgdb_breakpoint() function defines the kgdb_compiled_break
symbol using inline assembly.

There's a potential issue where the compiler might inline
arch_kgdb_breakpoint(), which would then define the kgdb_breakinst
symbol multiple times, leading to fail to link vmlinux.o.

This isn't merely a potential compilation problem. The intent here
is to determine the global symbol address of kgdb_compiled_break,
and if this function is inlined multiple times, it would logically
be a grave error.

Link: https://lore.kernel.org/all/4b4187c1-77e5-44b7-885f-d6826723dd9a@sifive.com/
Fixes: fe89bd2be866 ("riscv: Add KGDB support")
Co-developed-by: Huacai Chen <chenhuacai@loongson.cn>
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
Signed-off-by: WangYuli <wangyuli@uniontech.com>
---
Changelog:
 *v1->v2:
    1. Add the missing __ASSEMBLY__ check and substitute
".option rvc/norvc" with ".option push/pop".
  v2->v3:
    1. Remove "extern".
    2. Restore the inadvertently deleted .option norvc to prevent
a change in semantics.
---
 arch/riscv/include/asm/kgdb.h | 9 +--------
 arch/riscv/kernel/kgdb.c      | 9 +++++++++
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/include/asm/kgdb.h b/arch/riscv/include/asm/kgdb.h
index 46677daf708b..cc11c4544cff 100644
--- a/arch/riscv/include/asm/kgdb.h
+++ b/arch/riscv/include/asm/kgdb.h
@@ -19,16 +19,9 @@
 
 #ifndef	__ASSEMBLY__
 
+void arch_kgdb_breakpoint(void);
 extern unsigned long kgdb_compiled_break;
 
-static inline void arch_kgdb_breakpoint(void)
-{
-	asm(".global kgdb_compiled_break\n"
-	    ".option norvc\n"
-	    "kgdb_compiled_break: ebreak\n"
-	    ".option rvc\n");
-}
-
 #endif /* !__ASSEMBLY__ */
 
 #define DBG_REG_ZERO "zero"
diff --git a/arch/riscv/kernel/kgdb.c b/arch/riscv/kernel/kgdb.c
index 2e0266ae6bd7..7f2d3d956167 100644
--- a/arch/riscv/kernel/kgdb.c
+++ b/arch/riscv/kernel/kgdb.c
@@ -254,6 +254,15 @@ void kgdb_arch_set_pc(struct pt_regs *regs, unsigned long pc)
 	regs->epc = pc;
 }
 
+noinline void arch_kgdb_breakpoint(void)
+{
+	asm(".global kgdb_compiled_break\n"
+	    ".option push\n"
+	    ".option norvc\n"
+	    "kgdb_compiled_break: ebreak\n"
+	    ".option pop\n");
+}
+
 void kgdb_arch_handle_qxfer_pkt(char *remcom_in_buffer,
 				char *remcom_out_buffer)
 {
-- 
2.49.0

