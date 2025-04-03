Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D81C2E3385
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 12:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743684678; cv=none; b=oqrfDO3O0Ksf6Tyx3rGnWQIfmEahx+cpxXutePUaw9Vc26c49poYWFTaUFTGifdKJVSJXmBeaeDmls3srDpMpUrQb1lRu8GE5IowbDj2Wc8Y9EawVzkLf0rq8N3OyG+3wvZqZ/w0fVyrC5Kk/2PXjB8JPOU0IpKLt+g+0ZsMRfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743684678; c=relaxed/simple;
	bh=goDJOm2WtH3P76uOTy+Ogm1vvi1nHLbS9KmvqmiPc0k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ft07t/TamytSI/JYAg9Gtn9mYughyFcT8DT3KfNYj6ziTktfeSFSMYH6KO2WxTGpkfdOMlqyeibvzkjJfYuRKsilGiuaqYhvTefhGmrZOg6KpcXifWTzrdjCX7A5c0+Eq+uBfgUX++WE3gEq3M9Jhz5CqJJRlOMDwTbjtYqMQ+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PoVsJ7D7; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PoVsJ7D7"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ac2dfdf3c38so161234366b.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 05:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743684674; x=1744289474; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/HODa0fMEkQK7P4UL+fQYUBWzJ2WYl+i0BBb1rGI3xY=;
        b=PoVsJ7D77KfZk5fjXcY7DVIO5Cs93w1Cu8eMaMPVcTzfJqpJAF3Y8ANei+AoJAUm6w
         evapWHrDQMgcNSemm4yBcfxMNLKyJu/c7ZlL1Khd41sjmeIf6eecE2wk927pvczLtKi3
         m4EKQL4xm/tPHuNV43LRB/xkGaWhVnVIA1Fe0XEYoWMy/tAgK7jEG5QqcL66zHdCU8Wc
         iiNJp5mcBzyrBnujwpu45N3+jpW4/IfvhavjfRH/hLKYNw2cMtFWQRoV33a/2iAHF2TT
         I4wQAQC9TSt8GnnFM14wMP67srByHNPxJdU7vdNri/T+5t9Eewqfv+7Wrq7QSW6HXN2r
         kt+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743684674; x=1744289474;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/HODa0fMEkQK7P4UL+fQYUBWzJ2WYl+i0BBb1rGI3xY=;
        b=UZsRdNz4A461Z3F8XtWp7MTzggaQ/HnL2bUQwXj+4T/TC7G1Rxz5uADLbA2NK+6V4m
         Y9flSDvu4fwscYewcqc4OKTZaCKIC5zC2TktyDxhs2q4E8ZMprmvsUF6A9h/KRnWfPCg
         4rF2Au+4hrhbFtj6zRxxa/ZqwrodNBw53CQQ4OiDE5OSpTekQVlrQTIMcyfPwN1ZY0nz
         HfpufLYCzweVZQLeq7BbdtjcVIrips3/uHcH9NCaMSCU43m1SmTF5nPHYVghtNkklZah
         uUww8Fw4hFz+NNna1HY3ZjyQGK6AYQSjXx0QPJkfgT/zor53AMT5obYSwU+l/PTk0yMK
         omFA==
X-Forwarded-Encrypted: i=1; AJvYcCW0rUPktn/k4kqZ4m7ldsuDvG6pwkYsD+Hul66BzLejoBMbschN6/ECiyKMYs5Gx3pjHefsPv6ZPCbRsGM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUnaZ7OKAiocEFiojJI1VCeAxLfiy7+26scAr0FptV1VrDrC5p
	q+HjbRrhqkLER4AjWJTozj2DDGICFqv0PehhgX6XjLk5/oV/oa1C
X-Gm-Gg: ASbGncvVZcQZ9cvFY8k+OQ9BB8P7frdax+OP4iLj1dqAW/AtjGXTC8uvDXqmksmtMiw
	g+4ukTs9zb/qfw3QmCSTr4NtqzqV3+yFabalv4OX0RWfQ4MSxLrv8Xt8Dwf2pHVsAYGbGR6hqj4
	Tu2UaSQAc44uNlalPTQOJeKMKVRrqwZGnVHPKreOegU/NNoSMGRKzrBW0DhIAQL3lnnKJDTHHkT
	6XRvs3lI8NxKEJnRSSuVEevJhy+wsIbcAY4/2lC2gejRqzmXYdLouznvpHsPOYlXVbH0nq0eACc
	O9KSqkb2jky/3NkJy8XSpEcIL61pHf0/l4iR
X-Google-Smtp-Source: AGHT+IGn8RWitN/YS5UgGxUr27qx/wG+Hd7bJ2UpBYOwe3t7/0//MWZ1nlKAp4++Py+28p/gXgEAwg==
X-Received: by 2002:a17:907:2cc5:b0:ac3:3d10:6f with SMTP id a640c23a62f3a-ac7bc066a2dmr166310266b.8.1743684674287;
        Thu, 03 Apr 2025 05:51:14 -0700 (PDT)
Received: from fedora.. ([193.77.86.199])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7bfe5d3d8sm89292966b.31.2025.04.03.05.51.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 05:51:13 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: x86@kernel.org,
	linux-kernel@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH -tip v3] x86/idle: Use MONITOR and MWAIT mnemonics in <asm/mwait.h>
Date: Thu,  3 Apr 2025 14:50:45 +0200
Message-ID: <20250403125111.429805-1-ubizjak@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Current minimum required version of binutils is 2.25,
which supports MONITOR and MWAIT instruction mnemonics.

Replace the byte-wise specification of MONITOR and
MWAIT with these proper mnemonics.

No functional change intended.

Note: LLVM assembler is not able to assemble correct forms of MONITOR
and MWAIT instructions with explicit operands and reports [1]:

  error: invalid operand for instruction
          monitor %rax,%ecx,%edx
                       ^~~~

Use instruction mnemonics with implicit operands to
work around this issue.

[1] https://lore.kernel.org/oe-kbuild-all/202504030802.2lEVBSpN-lkp@intel.com/

Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
---
v3: Use instruction mnemonics with implicit operands.
---
 arch/x86/include/asm/mwait.h | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/arch/x86/include/asm/mwait.h b/arch/x86/include/asm/mwait.h
index 6a2ec2083043..26b68ee5b6a5 100644
--- a/arch/x86/include/asm/mwait.h
+++ b/arch/x86/include/asm/mwait.h
@@ -27,9 +27,9 @@
 
 static __always_inline void __monitor(const void *eax, u32 ecx, u32 edx)
 {
-	/* "monitor %eax, %ecx, %edx;" */
-	asm volatile(".byte 0x0f, 0x01, 0xc8;"
-		     :: "a" (eax), "c" (ecx), "d"(edx));
+	/* Use the instruction mnemonic with implicit operands, as the LLVM
+	   assembler fails to assemble the mnemonic with explicit operands. */
+	asm volatile("monitor" :: "a" (eax), "c" (ecx), "d" (edx));
 }
 
 static __always_inline void __monitorx(const void *eax, u32 ecx, u32 edx)
@@ -43,9 +43,9 @@ static __always_inline void __mwait(u32 eax, u32 ecx)
 {
 	mds_idle_clear_cpu_buffers();
 
-	/* "mwait %eax, %ecx;" */
-	asm volatile(".byte 0x0f, 0x01, 0xc9;"
-		     :: "a" (eax), "c" (ecx));
+	/* Use the instruction mnemonic with implicit operands, as the LLVM
+	   assembler fails to assemble the mnemonic with explicit operands. */
+	asm volatile("mwait" :: "a" (eax), "c" (ecx));
 }
 
 /*
@@ -95,9 +95,8 @@ static __always_inline void __mwaitx(u32 eax, u32 ebx, u32 ecx)
 static __always_inline void __sti_mwait(u32 eax, u32 ecx)
 {
 	mds_idle_clear_cpu_buffers();
-	/* "mwait %eax, %ecx;" */
-	asm volatile("sti; .byte 0x0f, 0x01, 0xc9;"
-		     :: "a" (eax), "c" (ecx));
+
+	asm volatile("sti; mwait" :: "a" (eax), "c" (ecx));
 }
 
 /*
-- 
2.49.0

