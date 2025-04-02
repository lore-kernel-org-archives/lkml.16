Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9489318A93F
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 18:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743617320; cv=none; b=Mr8Jg+m7yKIHicng7cWk5SuvQ0VyCQ34vxQBwhVk8rLVCfvOF5ETsiFeJkCIXxHMgjZCovuQdfYGIMoWuCm5LWWIZ2uqHGBwseekW49SQZHYQGcxeaC96B0WgQCwnX64VmLqvX3/jPCd6A55ISeBfURkG3JvjmEYiaHuP+lXcSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743617320; c=relaxed/simple;
	bh=2+PaJol33Y0JrMvS7Y782X6FROkXUDCS/lI2I80ptb0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dYm6UckE4YQC7A4dGjZBvYgRhymM41lh5oBuu3fEiwz1L4P4++K3wwqPLbj0qwSWRVP5iC6rajbRcnHClNdVH/Hbb75Du9kP/0g+n8IeszWAOv7ogQWkrZDVkh3YOtux5qM/LvSAhArVCIorznOybOa36GJ3rBCR0SEiKvNLcME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aWgiAjVp; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aWgiAjVp"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ac29af3382dso6963566b.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 11:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743617317; x=1744222117; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jLBHcI3bNeX6Axl3nD4vxp/hrEoGyEoTXRBgKfdZmaI=;
        b=aWgiAjVpr9yx4wFrwPRcdzXYD0jI2M0iWuG4OL1JU8zhOUXSczXUOy/xCivQU8xvGe
         nj+InoFybPyuZIMS+wVFv9cONuEg9PicP//c5ghZe7iYVgZPCtFeOWlFoPqYxskY9miq
         DBNf329QbZJrmaPJW43dAYK0Gip32/WpAyltPN722bFgMcqv+WhaxzcD14TmUkI6utcS
         cqpYmnMO63evfNNuBLoVGfb1eoDrMj+kvFRt67aZYJKvjlsJmXq1NTQjext1HX6niANi
         Ei5CWK2WdV+xfR1fmw4V/rD7gxVl7vRXMDyEGJ+JExg6ySswwhBkbsqaR33AsMHRtdlE
         BBWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743617317; x=1744222117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jLBHcI3bNeX6Axl3nD4vxp/hrEoGyEoTXRBgKfdZmaI=;
        b=rNpaKFKsBWDGQFRlMxSg0/ulhcS0/SUnH6thetcwf8IP4/03FpwfcvAfCLHmZTRNaq
         A5/ETHvBHcXf2rzy79dNhMcjlnQ/AUDJQRHC1upe2zR5MztuAMhbR3jcFxnbNaYTLFrT
         scM/L+tYdUcTIT7Ewds5WEFdcNyU3MzNztrc9QORGZIwi/OYXXF2pnslC8u1n4LxyVZj
         2e3UbmU4yX6CaKKXnhsviO49rLpUoke2AjhW3CfA+LXKK//7HpVeCkCsUZYvKCVvRgax
         w2nCVGlC2Ud1DmwSonIFlHJjsjx6FGXRISI9IKR3lM/n5yUuXD6Mury9cThfHkdbpg22
         uK/g==
X-Forwarded-Encrypted: i=1; AJvYcCWs0m0XKQBbCFI4zKMhBgcFFtl1C9O2SRk2UxbePgcW72mCZ82vdm7e6KEIrnVWhNsgkJ/FTlvn9ZjQLLQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyr9jKswQR47a9qJn/8zvzyskEHHVPDRfaNZLIqv8uT54F6xF+w
	CtAp186xXoswSUaWKgBTGyeZjJyUEUFB0sKAdHRnBv9AvGYk0rN3
X-Gm-Gg: ASbGncu/OyWLGx7cplVhaltBRjNlmoVueYMd5L196+9vUurW8w2QTzfPMn0atyl0bjB
	XU6819+v1dQKVZUeWEcghiAoEmkXLzyvEYRgcy2p/AEUCEEGxCvxGJ4S5U4PIv7Xm6BNrfHKdPa
	fZeVWJ3X8gqeAHHUoFUxIIHAadBldhW1o+Qh+W/rql/iY/FnmOxhZxMskE0tEt1oksuNUFzN6cz
	enkSDzbuA3N8Ev8nnVlGydtb6ZP0cPVspkA1jS+kyN4qjZMLYo2xQ3pcAOPljFjl43TBarKhSuW
	14YxHAXGP2wVJZtl4aoMnDfWm8xIPI9dG3N3zbl6bMe1TB/7hm34r04GlgI1l0Oh
X-Google-Smtp-Source: AGHT+IFXyXYRRIayD0JzUAI2EdCLCpP6qE6lC6eLS3wq2s0WpZrwFsSSTTNzqbLUiaft07s0Zls1pA==
X-Received: by 2002:a17:907:d89:b0:abf:6d24:10bb with SMTP id a640c23a62f3a-ac738be3d4amr1579507166b.44.1743617316561;
        Wed, 02 Apr 2025 11:08:36 -0700 (PDT)
Received: from localhost.localdomain ([46.248.82.114])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac71961f8cfsm942503866b.123.2025.04.02.11.08.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 11:08:36 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: x86@kernel.org,
	linux-kernel@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH -tip 2/4] x86/idle: Use MONITOR and MWAIT mnemonics in <asm/mwait.h>
Date: Wed,  2 Apr 2025 20:08:06 +0200
Message-ID: <20250402180827.3762-2-ubizjak@gmail.com>
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

Current minimum required version of binutils is 2.25,
which supports MONITOR and MWAIT instruction mnemonics.

Replace the byte-wise specification of MONITOR and
MWAIT with these proper mnemonics.

No functional change intended.

Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
---
 arch/x86/include/asm/mwait.h | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/arch/x86/include/asm/mwait.h b/arch/x86/include/asm/mwait.h
index 3377869ff2e8..006b150bcb5f 100644
--- a/arch/x86/include/asm/mwait.h
+++ b/arch/x86/include/asm/mwait.h
@@ -27,9 +27,7 @@
 
 static __always_inline void __monitor(const void *eax, u32 ecx, u32 edx)
 {
-	/* "monitor %eax, %ecx, %edx;" */
-	asm volatile(".byte 0x0f, 0x01, 0xc8;"
-		     :: "a" (eax), "c" (ecx), "d"(edx));
+	asm volatile("monitor %0, %1, %2" :: "a" (eax), "c" (ecx), "d" (edx));
 }
 
 static __always_inline void __monitorx(const void *eax, u32 ecx, u32 edx)
@@ -43,9 +41,7 @@ static __always_inline void __mwait(u32 eax, u32 ecx)
 {
 	mds_idle_clear_cpu_buffers();
 
-	/* "mwait %eax, %ecx;" */
-	asm volatile(".byte 0x0f, 0x01, 0xc9;"
-		     :: "a" (eax), "c" (ecx));
+	asm volatile("mwait %0, %1" :: "a" (eax), "c" (ecx));
 }
 
 /*
@@ -95,9 +91,8 @@ static __always_inline void __mwaitx(u32 eax, u32 ebx, u32 ecx)
 static __always_inline void __sti_mwait(u32 eax, u32 ecx)
 {
 	mds_idle_clear_cpu_buffers();
-	/* "mwait %eax, %ecx;" */
-	asm volatile("sti; .byte 0x0f, 0x01, 0xc9;"
-		     :: "a" (eax), "c" (ecx));
+
+	asm volatile("sti; mwait %0, %1" :: "a" (eax), "c" (ecx));
 }
 
 /*
-- 
2.42.0

