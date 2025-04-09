Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B425155C97
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 21:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744233897; cv=none; b=sn/vCg178r1N5LflbfxiT5fi1yrksmujJbAcSFLugcd+Otren5p4Fe8jss4z7ISOLO9ViDkw2d88V+Sro6ix/u1uNQ11onq2/XE0I12HIZFmpLPinB2zl18u0MjrUFrjTtWX1CxOlxyJVjwC5CHvl5bY+oOtqIsE3KQPJ60FldQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744233897; c=relaxed/simple;
	bh=5qHiUhKixS8KNeg+C5xmkTlGkTCWShJsH/7OmzpcWYU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=YdCpfDagrNL+KO9QKvQ7pH4O6jGIhCsoVOCGtPijf84E1e2Xebw4PqwhyKjkRdFckuFodttiU9ollqJ9/VNvsDuP6xY5+aC2WNP836KeG2hngo+IkTPlgmWWBl0am+iuxcA8lopLt7oY2TVFtrVcE56Xms1e785qoRShWp7R66U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jd+lIamb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jd+lIamb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F099CC4CEE2;
	Wed,  9 Apr 2025 21:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744233896;
	bh=5qHiUhKixS8KNeg+C5xmkTlGkTCWShJsH/7OmzpcWYU=;
	h=From:Date:Subject:To:Cc:From;
	b=Jd+lIambl5W1EFHS/OCJxCyg8MT02pPmU1fan+2Xftbb6496qsiHPvkN2i73c9n/u
	 YKANI2l4wwsH7CC4rjZukNHeCOgdDh5IXZkr79iCpJ4k8bW/3SeIKZEUklNhmW5xeS
	 BWZSbWlEzp5hf7tvQqzkz5Z+RD0L8QPllpzTuvut6valBChHQmjXEuYJ2YWgPzHIX/
	 ef1osAIqVYzGkERwCewV0FfjfSZgZSPrB6I5RTeP/3811iVf9NLBLzmSj4iCJUe1Ji
	 FCl16I6PUa5yTnkTI9ZcViveXdya/RZfE+9gMOgKluBSPiEMzmXcOF8VjfesUJU+oP
	 OAd1bFCDjsgCQ==
From: Nathan Chancellor <nathan@kernel.org>
Date: Wed, 09 Apr 2025 14:24:46 -0700
Subject: [PATCH] riscv: Avoid fortify warning in syscall_get_arguments()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250409-riscv-avoid-fortify-warning-syscall_get_arguments-v1-1-7853436d4755@kernel.org>
X-B4-Tracking: v=1; b=H4sIAJ3l9mcC/x3NQQrDIBBA0asE1x0wwVDsVUoJoqMdSLXMGNsQc
 vdKl2/z/6EEmVDUbTgUYyOhkjvGy6D80+WEQKFbTXqatdEWmMQ3cK1QgFi4Utzh4zhTTiC7eLe
 uS8K6OE7bC3MVGK3Xxs7BYLiq3n0zRvr+n/fHef4AAFy66YMAAAA=
X-Change-ID: 20250409-riscv-avoid-fortify-warning-syscall_get_arguments-19c0495d4ed7
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Charlie Jenkins <charlie@rivosinc.com>
Cc: "Dmitry V. Levin" <ldv@strace.io>, Kees Cook <kees@kernel.org>, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3289; i=nathan@kernel.org;
 h=from:subject:message-id; bh=5qHiUhKixS8KNeg+C5xmkTlGkTCWShJsH/7OmzpcWYU=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDOnfni4r6WU4uXx2S0zfuZ47v+JOm9fsXT6z4db8A8ZdF
 6NuzZ8V3VHKwiDGxSArpshS/Vj1uKHhnLOMN05NgpnDygQyhIGLUwAmsqCFkaEnROBWb+up6gtF
 j/ImJ3hk/7n34HH2jhfJOy8e6H0373gHI8O1whzVRRyaT39sErr5YN//gvDTaYyJvlP71itxT6+
 NescOAA==
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

When building with CONFIG_FORTIFY_SOURCE=y and W=1, there is a warning
because of the memcpy() in syscall_get_arguments():

  In file included from include/linux/string.h:392,
                   from include/linux/bitmap.h:13,
                   from include/linux/cpumask.h:12,
                   from arch/riscv/include/asm/processor.h:55,
                   from include/linux/sched.h:13,
                   from kernel/ptrace.c:13:
  In function 'fortify_memcpy_chk',
      inlined from 'syscall_get_arguments.isra' at arch/riscv/include/asm/syscall.h:66:2:
  include/linux/fortify-string.h:580:25: error: call to '__read_overflow2_field' declared with attribute warning: detected read beyond size of field (2nd parameter); maybe use struct_group()? [-Werror=attribute-warning]
    580 |                         __read_overflow2_field(q_size_field, size);
        |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  cc1: all warnings being treated as errors

The fortified memcpy() routine enforces that the source is not overread
and the destination is not overwritten if the size of either field and
the size of the copy are known at compile time. The memcpy() in
syscall_get_arguments() intentionally overreads from a1 to a5 in
'struct pt_regs' but this is bigger than the size of a1.

Normally, this could be solved by wrapping a1 through a5 with
struct_group() but there was already a struct_group() applied to these
members in commit bba547810c66 ("riscv: tracing: Fix
__write_overflow_field in ftrace_partial_regs()").

Just avoid memcpy() altogether and write the copying of args from regs
manually, which clears up the warning at the expense of three extra
lines of code.

Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
I omitted a Fixes tag because I think this has always been an overread
if I understand correctly but it is only the addition of the checks from
commit f68f2ff91512 ("fortify: Detect struct member overflows in
memcpy() at compile-time") that it becomes a noticeable issue.

This came out of a discussion from the addition of
syscall_set_arguments(), where the same logic causes a more noticeable
fortify warning because it happens without W=1, as it is an overwrite:
https://lore.kernel.org/20250408213131.GA2872426@ax162/
---
 arch/riscv/include/asm/syscall.h | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/syscall.h b/arch/riscv/include/asm/syscall.h
index 121fff429dce66b31fe79b691b8edd816c8019e9..eceabf59ae482aa1832b09371ddb3ba8cd65f91d 100644
--- a/arch/riscv/include/asm/syscall.h
+++ b/arch/riscv/include/asm/syscall.h
@@ -62,8 +62,11 @@ static inline void syscall_get_arguments(struct task_struct *task,
 					 unsigned long *args)
 {
 	args[0] = regs->orig_a0;
-	args++;
-	memcpy(args, &regs->a1, 5 * sizeof(args[0]));
+	args[1] = regs->a1;
+	args[2] = regs->a2;
+	args[3] = regs->a3;
+	args[4] = regs->a4;
+	args[5] = regs->a5;
 }
 
 static inline int syscall_get_arch(struct task_struct *task)

---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250409-riscv-avoid-fortify-warning-syscall_get_arguments-19c0495d4ed7

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>

