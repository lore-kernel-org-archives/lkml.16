Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B9B22D7B2
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 07:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744010506; cv=none; b=orXNglRKrOtEwF79rs/YzQfzWnD/1xm8o1RRcgErJIrAGgw/f4d6mHwdZZX8ZSkUZefWd/lWvibiMMqKJDK34GapXqwbOUfjPwCNCYI78PLk21eghc6+WGG/X31QwdkXvpSZqS1vM2j64BpQQGu9jXUAdJumO1w/4oy8Wtzv+a0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744010506; c=relaxed/simple;
	bh=fAniwQ2l4Cj7KEk83CZ8a/6av2wQtDd8XL2PSrRIVME=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ukRmkHysZtWcQxZUZbWHEormPUr1dXdXjLCb+YvDj90Q3s2jwNbiHwfzH9Gbn0x6FCQcJ/tl1ldE9b+tsplgrcDcqVyulRKduRxRkZIvo3u0yDmZtJQSwYgFPdYx6bBL/s7QoWg+WajmswlbuTOqc8Cv3+DcyRnukp2YyQMtASY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QulxOSFM; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QulxOSFM"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5e61da95244so6668101a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 00:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744010502; x=1744615302; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F54nal2TDjFsjimAMiM7HlxBlU6Yyu5pByAT3w0izG0=;
        b=QulxOSFMX7qjH2oJ9Fu8WVng/bbz/89d2ntEaQN0RN21aCMkHzwulVtvEpn7vZaYqx
         bcOK33x949biTPoFwicq+Ti36ryuzFUM9amxkj+0/y2a4irc+fNrWQ1Xvy1TQjMf+UdR
         Z5BMg3REZEGhOZauSZUrFnrnJeTqPG8sQtvfBqoEzWmSgHcm+9W99rjR1CVwg4h7Lxq4
         6osMwKTtnpfyKIUQgih9jyLtUYkHFx3E26ncNU03e1upmckUCDTtHf+EybqY3S4S6KNV
         AnUbQH+SK+o5sMju7da0v89E4icLegrI14vMaZ7HUooG8GhvOEIHtq1mOfAibJBXjPEQ
         9F0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744010502; x=1744615302;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F54nal2TDjFsjimAMiM7HlxBlU6Yyu5pByAT3w0izG0=;
        b=soZcp44B1InYwDRxtP/AyHzC10Qg/dpcoZP8/03T3ebpHRadV6emQsZoQQhPrMUw75
         vTjFVsEKsdASR5W/jfRu5yWWfN1mYco2kdTyMgLmekIyGaEbMZw1IQAKB0ms81xK4p82
         BRqU9nE3pTBY2BCZlca2NdE/8hrWqVhk32aQ+CK+ohABWev/sqN7kHHWhABR8RmfV9bg
         3kQJo6oTegj/cMqEGVxIdSrL/b3qTh/t+VkbgGHnyRB6ZIC5cqsvDuqimZxvrNwcAIl5
         OrFd12LDqYwL0OHmBbiNR4VjqTDGNq98uWMQrfX5PhCWYKNBp8PXtaM3VU+JrH+32VbL
         aN7A==
X-Forwarded-Encrypted: i=1; AJvYcCUuj4mOAmZ+PjGiYkeYORWrSzTRJeFQA0rTkRK38Z7DHIPFMw0L52tP3NgYvZbTN/HgrubovKmwPyFxnq0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWd8GePKlqC36TF7lHmUTb0gdyJ3nRffZGIvtji7EQaDb+7grQ
	6ayF6cHBVHxcXJ2tgs/631T0UcraBaTCnDDtwVRbYjtRAzMT+qYA
X-Gm-Gg: ASbGnctrcjv4+8189cFMwYAxZULfxBWIEBqNdKbeNLeVaa8qW0EsTqQ2txmLT+xD0xP
	sYlyFJgNs+E1nzDmtewK4cer9uwkOfiQfYqTKVqtRyU7fJQCCvTzyXeN4Vi9J5/eXhcb0UAbfbR
	XDZk+vXQL/oi2E96HcLp1fFz6eOi8tClle5JLdN4/gBHDFtD5KPuuKtrrhY12/GAJpA/Wyw4mMS
	Iej3eNLGWVIYVJs28jkFtJ3QiLDlofCEuEtprKUM0rOHC2yi7Rwf6F88/lhiOBSZloif/xd0lle
	uZ9iYjkSrwDdGNGnlSbtq+pMF+7Y650/bWr7
X-Google-Smtp-Source: AGHT+IG6zktGRolRnsUnshN1iGHF/Lubu+TAxgdAa3h3wMA/x8jcfYEbJfLM1j4E+UsIKNmSBWKyBA==
X-Received: by 2002:a17:907:1c0e:b0:ac3:bdd2:e70c with SMTP id a640c23a62f3a-ac7d195c0e2mr1010089666b.35.1744010502037;
        Mon, 07 Apr 2025 00:21:42 -0700 (PDT)
Received: from fedora.. ([193.77.86.199])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7bfee3815sm694954066b.80.2025.04.07.00.21.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 00:21:41 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: x86@kernel.org,
	linux-kernel@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH RESEND -tip v2] x86/asm: Use asm_inline() instead of asm() in __untagged_addr()
Date: Mon,  7 Apr 2025 09:21:04 +0200
Message-ID: <20250407072129.33440-1-ubizjak@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use asm_inline() to instruct the compiler that the size of asm()
is the minimum size of one instruction, ignoring how many instructions
the compiler thinks it is. ALTERNATIVE macro that expands to several
pseudo directives causes instruction length estimate to count
more than 20 instructions.

bloat-o-meter reports minimal code size increase
(x86_64 defconfig with CONFIG_ADDRESS_MASKING, gcc-14.2.1):

  add/remove: 2/2 grow/shrink: 5/1 up/down: 2365/-1995 (370)

	Function                          old     new   delta
	-----------------------------------------------------
	do_get_mempolicy                    -    1449   +1449
	copy_nodes_to_user                  -     226    +226
	__x64_sys_get_mempolicy            35     213    +178
	syscall_user_dispatch_set_config  157     332    +175
	__ia32_sys_get_mempolicy           31     206    +175
	set_syscall_user_dispatch          29     181    +152
	__do_sys_mremap                  2073    2083     +10
	sp_insert                         133     117     -16
	task_set_syscall_user_dispatch    172       -    -172
	kernel_get_mempolicy             1807       -   -1807

  Total: Before=21423151, After=21423521, chg +0.00%

The code size increase is due to the compiler inlining
more functions that inline untagged_addr(), e.g:

task_set_syscall_user_dispatch() is now fully inlined in
set_syscall_user_dispatch():

	000000000010b7e0 <set_syscall_user_dispatch>:
	  10b7e0:	f3 0f 1e fa          	endbr64
	  10b7e4:	49 89 c8             	mov    %rcx,%r8
	  10b7e7:	48 89 d1             	mov    %rdx,%rcx
	  10b7ea:	48 89 f2             	mov    %rsi,%rdx
	  10b7ed:	48 89 fe             	mov    %rdi,%rsi
	  10b7f0:	65 48 8b 3d 00 00 00 	mov    %gs:0x0(%rip),%rdi
	  10b7f7:	00
	  10b7f8:	e9 03 fe ff ff       	jmp    10b600 <task_set_syscall_user_dispatch>

that after inlining becomes:

	000000000010b730 <set_syscall_user_dispatch>:
	  10b730:	f3 0f 1e fa          	endbr64
	  10b734:	65 48 8b 05 00 00 00 	mov    %gs:0x0(%rip),%rax
	  10b73b:	00
	  10b73c:	48 85 ff             	test   %rdi,%rdi
	  10b73f:	74 54                	je     10b795 <set_syscall_user_dispatch+0x65>
	  10b741:	48 83 ff 01          	cmp    $0x1,%rdi
	  10b745:	74 06                	je     10b74d <set_syscall_user_dispatch+0x1d>
	  10b747:	b8 ea ff ff ff       	mov    $0xffffffea,%eax
	  10b74c:	c3                   	ret
	  10b74d:	48 85 f6             	test   %rsi,%rsi
	  10b750:	75 7b                	jne    10b7cd <set_syscall_user_dispatch+0x9d>
	  10b752:	48 85 c9             	test   %rcx,%rcx
	  10b755:	74 1a                	je     10b771 <set_syscall_user_dispatch+0x41>
	  10b757:	48 89 cf             	mov    %rcx,%rdi
	  10b75a:	49 b8 ef cd ab 89 67 	movabs $0x123456789abcdef,%r8
	  10b761:	45 23 01
	  10b764:	90                   	nop
	  10b765:	90                   	nop
	  10b766:	90                   	nop
	  10b767:	90                   	nop
	  10b768:	90                   	nop
	  10b769:	90                   	nop
	  10b76a:	90                   	nop
	  10b76b:	90                   	nop
	  10b76c:	49 39 f8             	cmp    %rdi,%r8
	  10b76f:	72 6e                	jb     10b7df <set_syscall_user_dispatch+0xaf>
	  10b771:	48 89 88 48 08 00 00 	mov    %rcx,0x848(%rax)
	  10b778:	48 89 b0 50 08 00 00 	mov    %rsi,0x850(%rax)
	  10b77f:	48 89 90 58 08 00 00 	mov    %rdx,0x858(%rax)
	  10b786:	c6 80 60 08 00 00 00 	movb   $0x0,0x860(%rax)
	  10b78d:	f0 80 48 08 20       	lock orb $0x20,0x8(%rax)
	  10b792:	31 c0                	xor    %eax,%eax
	  10b794:	c3                   	ret
	  10b795:	48 09 d1             	or     %rdx,%rcx
	  10b798:	48 09 f1             	or     %rsi,%rcx
	  10b79b:	75 aa                	jne    10b747 <set_syscall_user_dispatch+0x17>
	  10b79d:	48 c7 80 48 08 00 00 	movq   $0x0,0x848(%rax)
	  10b7a4:	00 00 00 00
	  10b7a8:	48 c7 80 50 08 00 00 	movq   $0x0,0x850(%rax)
	  10b7af:	00 00 00 00
	  10b7b3:	48 c7 80 58 08 00 00 	movq   $0x0,0x858(%rax)
	  10b7ba:	00 00 00 00
	  10b7be:	c6 80 60 08 00 00 00 	movb   $0x0,0x860(%rax)
	  10b7c5:	f0 80 60 08 df       	lock andb $0xdf,0x8(%rax)
	  10b7ca:	31 c0                	xor    %eax,%eax
	  10b7cc:	c3                   	ret
	  10b7cd:	48 8d 3c 16          	lea    (%rsi,%rdx,1),%rdi
	  10b7d1:	48 39 fe             	cmp    %rdi,%rsi
	  10b7d4:	0f 82 78 ff ff ff    	jb     10b752 <set_syscall_user_dispatch+0x22>
	  10b7da:	e9 68 ff ff ff       	jmp    10b747 <set_syscall_user_dispatch+0x17>
	  10b7df:	b8 f2 ff ff ff       	mov    $0xfffffff2,%eax
	  10b7e4:	c3                   	ret

Please note a series of NOPs that get replaced with an alternative:

	    11f0:	65 48 23 05 00 00 00 	and    %gs:0x0(%rip),%rax
	    11f7:	00

Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
---
v2: Include asm dumps of inlining in the commit message.
---
 arch/x86/include/asm/uaccess_64.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/include/asm/uaccess_64.h b/arch/x86/include/asm/uaccess_64.h
index c52f0133425b..3c1bec3a0405 100644
--- a/arch/x86/include/asm/uaccess_64.h
+++ b/arch/x86/include/asm/uaccess_64.h
@@ -26,8 +26,8 @@ extern unsigned long USER_PTR_MAX;
  */
 static inline unsigned long __untagged_addr(unsigned long addr)
 {
-	asm (ALTERNATIVE("",
-			 "and " __percpu_arg([mask]) ", %[addr]", X86_FEATURE_LAM)
+	asm_inline (ALTERNATIVE("", "and " __percpu_arg([mask]) ", %[addr]",
+				X86_FEATURE_LAM)
 	     : [addr] "+r" (addr)
 	     : [mask] "m" (__my_cpu_var(tlbstate_untag_mask)));
 
-- 
2.49.0

