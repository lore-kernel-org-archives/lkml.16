Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18C7D1DDC28
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 18:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743617324; cv=none; b=lTsGTxIP9ssP/7oKUBzDKrRmeS7B5K8hwyQ8mXTO4KlplUJU+eq/FOKgJThafi0+W6F9hWg2dddzvAW1rc3j6k0MUPCXKLPcYsJ0KeCDLcWWqHwxu1gQbaM3jg85pd0MsIxd+VKuNzR/rT01cHgLHP4NJrrT6n54i8/urLabjNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743617324; c=relaxed/simple;
	bh=1t1Hz/lUYgNxRKvMyt+OF3tJQ1f5kTX7iHV7edkdQA0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K65fj7zzU6dpXMu/WLCbBONitU4xq155mLAJEz/1nD9+lIv1LftY35uf4YdXVQV1ixV5ImSnYb99c8qxGvsBfk65p87gl1ZmUUrTngKSx1IjbBH/mNDmDhX6UhRDbtHExX04+e8vApJTh4Uhhhc83mmdGSl4At0SDuskQReFmJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=byEak+uR; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="byEak+uR"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-abbb12bea54so12421866b.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 11:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743617320; x=1744222120; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0yRARSwgynvlM2xSRbd7Y1AqU2ZXEdz4XPqJsdLFLgo=;
        b=byEak+uRnwNM/hc/3Y4bdZM9cjurpqu+9KsmqESPM0N2aOTh9EjfhNCOVs83egeTIJ
         yrOwyXCr4Jew3TThnxl/9VgLGbAvBDK4CJjacJL9kkT82nzT4xog3abjxGW9ZjUhRKSa
         hMTaN9bkdHrmsi9B7CiuNouI/4/gPB6a4+I1yOJzXgkPRtxyxVMYUKlwkb3l7NOK2b0c
         O1d/IyhBG+7ddnEGWyB+ADh1/NDEEc1qSaZEoBvW0boO/1YIaBo7otrlXvLF+GtzSjHF
         1peh6BAbmnxHppb13qJmYsCfn/ht5lmQQHCHT0qmYh+E2OcFA7kJjnrLWVtHsSYMbqgZ
         bx7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743617320; x=1744222120;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0yRARSwgynvlM2xSRbd7Y1AqU2ZXEdz4XPqJsdLFLgo=;
        b=porkNmYd+ZjVqAeJ7UDuH6dbGpBiW84DaomESBm6YM9uLkf2zf/cCQm1t+6KJM8TUX
         feSxDkUveisJjehgFb4FVq+PyLud/XV8KKOo2qvWt6Q2Dp6uKl45VY6CK0PzMeH6KUKm
         rEi6i91BPJdqToXBWAoINLx4vAaH3GtlF7pgtZow9pf0l4RdsllPZBmPfT2aRRBmm7AU
         huNG9j+Rd/Sr5gHj2sEB2twhlwkGBVxLhzJCJ8F76p0ZzCySwMy+8bRUxUw2RAaGG/ap
         TUJKqPjVHNiEzqIDPTp+CvGHfQynZ5ahY4PFaSBY/yXNdk06WQnOAega9/RmDCfPqFAn
         I6oQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhlgy7S+2frTaJISus28Kll5iVZmExP9+ZGS2ToCDj0/+/bUyZsPtOWJ80no1cKC4qaXSqar1Ba69tJv4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOcUBgJfvM9izxVA8dalVbfqS1uOElriSMDTYhs35uL5ioi3Q7
	Dt8Be+m4bHPodjFCqzeN1B2B36ac2ImLS6pGb9FQIhAbrOKWse1N
X-Gm-Gg: ASbGncsC1rkz6bxM/kAvC5m4RuyTLxgYgm1oflmgGHasCV/o7Df9ZZ/aqkkgZYhUpQd
	CvD5mdG00OtSaf9ZkJXKDdcoH0WLOKrHsVPGGdKDLhEWf/cRSYyFFs4WpfZ+74izEvPtCdtzqd5
	mmXGXjEvaNweqNSFC4puiPn1i8zMVf9enwfQ4TPRZgC+P7c5tZnUubeUtiSmHgY7ule7H3J3xI6
	8WVTsncNpEhztdG22JQ/qJ7wBhR9nyxV+Me6YCipvm8u8Y3R6LDVmcWLEtrKCwV0hGBcz8T7U68
	sSiQ7u81ZIu7MswZus/AEcLj6BdHNXnmWQoCuTRmrZnodBo8Du1KMQ==
X-Google-Smtp-Source: AGHT+IFsqn5JmRl8mlveBk7xkd3l7pSMvDjBT2o+ZWGQcHFuTHjuMcIjdL4sKhsrvmocOtXxqmYi9A==
X-Received: by 2002:a17:906:48c6:b0:ac7:391a:e158 with SMTP id a640c23a62f3a-ac7391ae2a1mr1379759166b.59.1743617320061;
        Wed, 02 Apr 2025 11:08:40 -0700 (PDT)
Received: from localhost.localdomain ([46.248.82.114])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac71961f8cfsm942503866b.123.2025.04.02.11.08.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 11:08:39 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: x86@kernel.org,
	linux-kernel@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH -tip 4/4] x86/idle: Remove CONFIG_AS_TPAUSE
Date: Wed,  2 Apr 2025 20:08:08 +0200
Message-ID: <20250402180827.3762-4-ubizjak@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20250402180827.3762-1-ubizjak@gmail.com>
References: <20250402180827.3762-1-ubizjak@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is no point to have CONFIG_AS_TPAUSE when the emitted assembly
is always the same. Remove TPAUSE insn mnemonic and leave only the
equivalent byte-wise definition. This will be changed back to
insn mnemonic once binutils 2.31.1 is the minimum version to
build the kernel.

Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
---
 arch/x86/Kconfig.assembler   |  4 ----
 arch/x86/include/asm/mwait.h | 11 ++---------
 2 files changed, 2 insertions(+), 13 deletions(-)

diff --git a/arch/x86/Kconfig.assembler b/arch/x86/Kconfig.assembler
index 6d20a6ce0507..fa8858546d5e 100644
--- a/arch/x86/Kconfig.assembler
+++ b/arch/x86/Kconfig.assembler
@@ -15,10 +15,6 @@ config AS_SHA256_NI
 	def_bool $(as-instr,sha256msg1 %xmm0$(comma)%xmm1)
 	help
 	  Supported by binutils >= 2.24 and LLVM integrated assembler
-config AS_TPAUSE
-	def_bool $(as-instr,tpause %ecx)
-	help
-	  Supported by binutils >= 2.31.1 and LLVM integrated assembler >= V7
 
 config AS_GFNI
 	def_bool $(as-instr,vgf2p8mulb %xmm0$(comma)%xmm1$(comma)%xmm2)
diff --git a/arch/x86/include/asm/mwait.h b/arch/x86/include/asm/mwait.h
index 65228861b894..5141d2acc0ef 100644
--- a/arch/x86/include/asm/mwait.h
+++ b/arch/x86/include/asm/mwait.h
@@ -133,16 +133,9 @@ static __always_inline void mwait_idle_with_hints(unsigned long eax, unsigned lo
  */
 static inline void __tpause(u32 ecx, u32 edx, u32 eax)
 {
-	/* "tpause %ecx, %edx, %eax" */
-	#ifdef CONFIG_AS_TPAUSE
-	asm volatile("tpause %%ecx"
-		     :
-		     : "c"(ecx), "d"(edx), "a"(eax));
-	#else
+	/* "tpause %ecx" */
 	asm volatile(".byte 0x66, 0x0f, 0xae, 0xf1"
-		     :
-		     : "c"(ecx), "d"(edx), "a"(eax));
-	#endif
+		     :: "c" (ecx), "d" (edx), "a" (eax));
 }
 
 #endif /* _ASM_X86_MWAIT_H */
-- 
2.42.0

