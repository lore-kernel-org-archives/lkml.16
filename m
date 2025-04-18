Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 775BA19EED3
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 08:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744963706; cv=none; b=MoxbjlnIisYccBjs9IiN5IBxB6kog41g1wYurT0lBWUfRVxPMp5oRhMG8JDOUDRPSFFNrOZ4aOYxKHblAenmrslF6V/XOiLZ/FuJIqUYyGIiMfR5UiSWyjOyp/7QDs4NMrmdyknI5l5AxdS6Op50sO6UAyP0r7voDtZeaMDVoRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744963706; c=relaxed/simple;
	bh=pHLdPwpG7ED1nJUaIAbB+vu4ndwXsLcPqg2Awe9uTVE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Lp+djFIyIq2RoUFRbyu6xTqaw6Pvh+A29NO0roVVmX0wUBBNhCN7rp0u6wCY4v50OtGvmGBNl5HZ7ihn8f39ZeQIut8YliaAceBbNTABqP00Xa1l4kf5MTwcgwCiW3qjugwbJN0r1tMYSMr1sC48qe4prsKibYDw15fdyH/BVgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JItlBYc3; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JItlBYc3"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ac28e66c0e1so214177166b.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 01:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744963702; x=1745568502; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k8Ma0xCwgAtR2FBTtOTEBvtcYdTg2Z2T0oecOIQKk4w=;
        b=JItlBYc3cY57vqtwL3asgUsGe7jVmzjMgkQl14ek/Mg1XIfyzD4GPEuLYnkgp6aIuT
         u7tKilmMaIf1bfUOLPWV3jnEBiHvGzCBi2DfIQjdc1GxO9D/JbFoyW5qNWxGQmSs2prJ
         gcV6B4DBbTV/equz88au/iAa81BBIyhnzFqw22Oiv+oQND12uJNBussEZF/5S+ReV5rf
         /6QOXvFqtPwMd75ta7+TVp2UTSGLU7U8zP9xX1Sc5PV8VR6UNiyD0E63qUVvyP1Qzg4N
         ryhFH8qh+1Y2F8IXq2dku3l92XzCANGYKE7W8m9b9NmwDaagDay6hFtzFYv+QykrHanY
         JL9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744963702; x=1745568502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k8Ma0xCwgAtR2FBTtOTEBvtcYdTg2Z2T0oecOIQKk4w=;
        b=Y93gNRHZ2NfHRr0mZmTCL68IDpPf4sxVNDZiyrvde1F3Y9hOmrvW1q3mbg1w1X6cSL
         KFBIlZvKHnJaesT3iVXZ+1L3XNGVFnZffmT4a5K4l2sBj8TqSSTiJHeVMnlMxUL0ea2o
         xS0wkIvNCUxUvwOBRE/8NU7zIS7+vWiLwn+4ny5uE6cGynonJreVoQJrgJd7eIpe+PXo
         HCoQGxfp0ZUM2xTDrtN0ZeNIZwJJ9LH8m3o6C5Vn6ZGrvfnKVTNzKtsMt7+NPkNjaCIx
         vC8BcSpk8kOpmIsDDvNHZlPfwXxnrxviK/sLCgAmrf2EUd38qSHNjgfxpc2OyaX4VVEl
         kXyw==
X-Forwarded-Encrypted: i=1; AJvYcCVFUpRTi2p083DrPBGy47/WlmAW7q7UdJLA6fxKCF+05+buK1aACdSSX/fPR0PkfafARAxHV32ac4EeWkk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/rqfOspr6S1/g7YyJvEo6XUy26lnWx33T1ZfwX+lWg9kDtzdu
	U5O9J6+Xy4SDQ+g7BucomMeSJ2mXDACiNeJk4e4pqytGQn61lToo
X-Gm-Gg: ASbGncvPIxukjdB3Rg0dExVDFT+5emUe6vVddSK6vLDlwwum1RJ015gGsFKGz9mzXlz
	GFZ7K7zjR9T5ULQuUeOHtOtaFXWuv5KMcdvYrw+J0dM708UXur0xQppkXcnGk+G8b/jNTK36s2g
	gRWyNCOk/I096b7tyfqttK7HSZzNowgbGVfOsj5fEZs7f3qVR+5SH83M4SkLxnFPlSLcO6pPZky
	KpeR9Q8FEjiKInFBHDkZGWRHW+xjgnzgP8HZc1YH7EaAB3yy8oCqjmHFdT+EB6CxVEPcLdLMTId
	uX/MZz84ai+oSBeU5yRDZ00QCnGiN80g
X-Google-Smtp-Source: AGHT+IEd5vHUhrwlYgKkpSCb/VYIDdXYwxFTSy7F68fl7UGn/aNEahUqfVGXGWt2AnSs8aMukt6C0g==
X-Received: by 2002:a17:906:f5a5:b0:acb:6ec0:12ec with SMTP id a640c23a62f3a-acb74b87d49mr161457466b.35.1744963702343;
        Fri, 18 Apr 2025 01:08:22 -0700 (PDT)
Received: from fedora.. ([193.77.86.199])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ef49ff9sm90053366b.158.2025.04.18.01.08.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 01:08:21 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: x86@kernel.org,
	linux-kernel@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>,
	Nikolay Borisov <nik.borisov@suse.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH -tip v2 2/2] x86/asm: Replace "REP; NOP" with PAUSE mnemonic
Date: Fri, 18 Apr 2025 10:07:44 +0200
Message-ID: <20250418080805.83679-2-ubizjak@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250418080805.83679-1-ubizjak@gmail.com>
References: <20250418080805.83679-1-ubizjak@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Current minimum required version of binutils is 2.25,
which supports PAUSE instruction mnemonic.

Replace "REP; NOP" with this proper mnemonic.

No functional change intended.

Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
Reviewed-by: Nikolay Borisov <nik.borisov@suse.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
---
v2: Rename rep_nop() to native_pause() first.
---
 arch/x86/boot/boot.h                  | 2 +-
 arch/x86/include/asm/vdso/processor.h | 4 ++--
 arch/x86/kernel/relocate_kernel_64.S  | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/x86/boot/boot.h b/arch/x86/boot/boot.h
index f3771a6373c7..60580836daf7 100644
--- a/arch/x86/boot/boot.h
+++ b/arch/x86/boot/boot.h
@@ -34,7 +34,7 @@
 extern struct setup_header hdr;
 extern struct boot_params boot_params;
 
-#define cpu_relax()	asm volatile("rep; nop")
+#define cpu_relax()	asm volatile("pause")
 
 static inline void io_delay(void)
 {
diff --git a/arch/x86/include/asm/vdso/processor.h b/arch/x86/include/asm/vdso/processor.h
index 895333b52cb3..7000aeb59aa2 100644
--- a/arch/x86/include/asm/vdso/processor.h
+++ b/arch/x86/include/asm/vdso/processor.h
@@ -7,10 +7,10 @@
 
 #ifndef __ASSEMBLER__
 
-/* REP NOP (PAUSE) is a good thing to insert into busy-wait loops. */
+/* PAUSE is a good thing to insert into busy-wait loops. */
 static __always_inline void native_pause(void)
 {
-	asm volatile("rep; nop" ::: "memory");
+	asm volatile("pause" ::: "memory");
 }
 
 static __always_inline void cpu_relax(void)
diff --git a/arch/x86/kernel/relocate_kernel_64.S b/arch/x86/kernel/relocate_kernel_64.S
index 1d6355227bf6..ea604f4d0b52 100644
--- a/arch/x86/kernel/relocate_kernel_64.S
+++ b/arch/x86/kernel/relocate_kernel_64.S
@@ -405,7 +405,7 @@ SYM_CODE_START_LOCAL_NOALIGN(pr_char_8250)
 	inb	%dx, %al
 	testb	$XMTRDY, %al
 	jnz	.Lready
-	rep nop
+	pause
 	jmp .Lxmtrdy_loop
 
 .Lready:
@@ -426,7 +426,7 @@ SYM_CODE_START_LOCAL_NOALIGN(pr_char_8250_mmio32)
 	movb	(LSR*4)(%rdx), %ah
 	testb	$XMTRDY, %ah
 	jnz	.Lready_mmio
-	rep nop
+	pause
 	jmp .Lxmtrdy_loop_mmio
 
 .Lready_mmio:
-- 
2.49.0

