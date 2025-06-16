Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB41221FF5E;
	Mon, 16 Jun 2025 23:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750116237; cv=none; b=IhZHpuURgf5c6FBgPMqQEjZk2zj4dxlXfM+pT8bpmTmp+2+AwX0BxwrLKopWyXF00Ku46J2QTswc1sGXlzcb4+Zjbvv+l6QNHYwE34w6dL2UrHkOvtYjdNBHPPHC4oZk1pkNGbOoa2PdDL9A5SmhUF5zJgkYOcp2DIxzJIOg7lU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750116237; c=relaxed/simple;
	bh=9oGmaMe+uzcsSsY7ftL58AxNBVK5Bb/mQeUx0vxOhdA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=RlG9IV+ig4Vx8JZ1NLZxyAFI9JDuvehdsjuQXZCn8EMgGfbMiwzBS3O0m+iS0B3McGJXs3dkRCyL8qi7sGDK5ZH+DUKnIULdeYLKnBc71Tm5LQxCWFBd30tusNTJFMFpWA+LConeiQ1KOL6Qx94eTTq6akaasuAuoSqxecyUFdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EqoxVGeh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EqoxVGeh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CAB2C4CEEA;
	Mon, 16 Jun 2025 23:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750116237;
	bh=9oGmaMe+uzcsSsY7ftL58AxNBVK5Bb/mQeUx0vxOhdA=;
	h=From:Date:Subject:To:Cc:From;
	b=EqoxVGehertI4Mz/aBzh9Pw1jln4/63OAHAGuu+LzEgL7ayLvKz+ByVWTTB+/u3FC
	 K41t60eO7XcpV3JWpFRBP+LWbbxvzEV8LhPg8dSQUo/Mr06lshUJCuL1m219MhdiDJ
	 JN9lWuw+bGksVy29iJY15llxpYiVKrtJfFHEOqBdU6GWlwPLFshXJcxo7h7xyi0hLq
	 TWN+2VzjqUE1uBY86z+uNK7kES/tDSj+eJ5BRFAZoCAGNco3jR7x3CFixA3p8SE2M7
	 o8tyfc9aiNYwFJBehzwlrhs2twndvZ3NMUFt86pMei8bM0wY+krlnc4WRYgtRoC4m2
	 +rdNxjw30RR6g==
From: Nathan Chancellor <nathan@kernel.org>
Date: Mon, 16 Jun 2025 16:23:40 -0700
Subject: [PATCH] loongarch: Use '.ascii' instead of '.string' in
 __BUGVERBOSE_LOCATION
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-loongarch-fix-warn-cond-llvm-ias-v1-1-6c6d90bb4466@kernel.org>
X-B4-Tracking: v=1; b=H4sIAHunUGgC/x2N0QqDMAwAf0XybKCWWpi/MnzoYtRATUcKbiD++
 8oeD467CyqbcIWpu8D4lCpFGwx9B7Qn3RhlaQze+dHFIWIuRbdktOMqX/wkU6SiC+Z8Hiip4us
 xhtV5CiEStMzbuJn/xXO+7x+1NQ5ucgAAAA==
X-Change-ID: 20250616-loongarch-fix-warn-cond-llvm-ias-b954f02c446c
To: Ingo Molnar <mingo@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, 
 WANG Xuerui <kernel@xen0n.name>
Cc: Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3504; i=nathan@kernel.org;
 h=from:subject:message-id; bh=9oGmaMe+uzcsSsY7ftL58AxNBVK5Bb/mQeUx0vxOhdA=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDBkBy7st7RXPHs2tLfvzLKnmSWFhTNQKBZ5flzt4C2+qr
 F99Qiuro5SFQYyLQVZMkaX6sepxQ8M5ZxlvnJoEM4eVCWQIAxenAEzk6yVGhnWyO+t3R559y7bl
 TcqPjvitDq+eb1ymvqmPR8PqZ2lG7jtGhhefl+lHdiyaKCpnL7m+W2Lpgk1LBM2dV51UthTuesE
 axQQA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

After commit 5d476f66e6ad ("bugs/LoongArch: Concatenate 'cond_str' with
'__FILE__' in __BUG_ENTRY(), to extend WARN_ON/BUG_ON output"), building
loongarch with clang's integrated assembler fails with:

  block/blk-throttle.c:205:2: error: unexpected token
    205 |         WARN_ON_ONCE(!bio);
        |         ^
  include/asm-generic/bug.h:119:3: note: expanded from macro 'WARN_ON_ONCE'
    119 |                 __WARN_FLAGS("["#condition"] ",                 \
        |                 ^
  arch/loongarch/include/asm/bug.h:47:2: note: expanded from macro '__WARN_FLAGS'
     47 |         __BUG_FLAGS(cond_str, BUGFLAG_WARNING|(flags), ANNOTATE_REACHABLE(10001b));\
        |         ^
  arch/loongarch/include/asm/bug.h:42:23: note: expanded from macro '__BUG_FLAGS'
     42 |         asm_inline volatile (__stringify(ASM_BUG_FLAGS(cond_str, flags)) extra);
        |                              ^
  ...
  <inline asm>:1:134: note: instantiated into assembly here
      1 |         .pushsection __bug_table, "aw"; .align 2; 10000: .long 10001f - .; .pushsection .rodata.str, "aMS", @progbits, 1; 10002: .string "[""!bio""] " "block/blk-throttle.c"; .popsection; .long 10002b - .; .short 205; .short (1 << 0)|((1 << 1) | ((9) << 8)); .popsection; 10001: break 1;.pushsection .discard.annotate_insn,"M",@progbits,8
        |                                                                                                                                             ^

clang's integrated assembler only supports concatenating strings with
'.ascii'. There was discussion of allowing '.string' / '.asciz' but it
was decided against [1] because it was undesirable to match the behavior
of released binutils at the time, where

  .asciz "foo" "bar"

was treated like

  "foo\0bar\0"

instead of the more intuitive to C programmers

  "foobar\0"

and diverging from that behavior was seen as risky and unnecessary. GNU
binutils updated its handling of '.asciz' and '.string' to the more
intuitive option in 2.36 [2] after this was brought up to them in
passing.

Convert LoongArch's __BUGVERBOSE_LOCATION from '.string' to '.ascii'
with a manually added NUL, similar to commit 707f853d7fa3 ("module:
Provide EXPORT_SYMBOL_GPL_FOR_MODULES() helper") for the same reason,
which clears up the build error and results in no changes in output for
builds with GNU binutils.

Fixes: 5d476f66e6ad ("bugs/LoongArch: Concatenate 'cond_str' with '__FILE__' in __BUG_ENTRY(), to extend WARN_ON/BUG_ON output")
Link: https://reviews.llvm.org/D91460#2398228 [1]
Link: https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=3d955acb36f483c05724181da5ffba46b1303c43 [2]
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 arch/loongarch/include/asm/bug.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/loongarch/include/asm/bug.h b/arch/loongarch/include/asm/bug.h
index cad807b100ad..d090a5bec5eb 100644
--- a/arch/loongarch/include/asm/bug.h
+++ b/arch/loongarch/include/asm/bug.h
@@ -11,7 +11,7 @@
 #else
 #define __BUGVERBOSE_LOCATION(file, line)			\
 		.pushsection .rodata.str, "aMS", @progbits, 1;	\
-	10002:	.string file;					\
+	10002:	.ascii file "\0";				\
 		.popsection;					\
 								\
 		.long 10002b - .;				\

---
base-commit: d298bb98d65f964288bb87feef014da1baafedda
change-id: 20250616-loongarch-fix-warn-cond-llvm-ias-b954f02c446c

Best regards,
--  
Nathan Chancellor <nathan@kernel.org>

