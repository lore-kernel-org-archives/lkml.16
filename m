Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4292722652E
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 11:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744025003; cv=none; b=Q6mJD2VQ2QEtWRtEgMq6+B5BfbZ9PRiAVs5sNHqBKKrXJMIuDxNXAyWC/nHEWs11+f3KZ3Z2O2CiweoodQnPwzrwkqsBhgbn3+hAqT9/eMvW96doCByJtO4++nv6t1hagekh1pet8sIpZmUiY529tFmEdEQdFfJzSqddC8zWSwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744025003; c=relaxed/simple;
	bh=9ULjJH5M27m+Ul5XupFsEMVMAitDOxAYjmbue307NqE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ehh6/T5QrNMTly/XCE8luyNZ+rFjfwZ2P/EQTtr+BkLc8YOyM8Tg3g1W1sTqfLKZ8caSirNop0My5PNShrSJwuFht62Qtk1PJHxeH0xh3XvNeamCmmek+MT7ovd4oiTebAFdSb/+lrvj6tfVakc6eKHr0Lpqaz5Jra/KzTPGz20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ONZrRj/d; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ONZrRj/d"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ac345bd8e13so709556766b.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 04:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744024999; x=1744629799; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=K75WVrnwF2RMwBZca7VabHFLHEWgEfMMiN0EHNjeDhE=;
        b=ONZrRj/dgq8EfDoaIWrqAj9k79lPcyzMza4mGSyjxvc/hHLFx/CdvkO11n6pr86YdY
         hU4PZeIA1utBwiDJPzkrA+4IDWRxxqRrlibctePpXpf4oBRjFRsDvZSoczcW2a2rBU7J
         H+pj9dIQVBNqKI4We1iYsyZbeIp3kDZVoGo2DNGOx8H6iMpQF9E4ezi/OPJwUHYSpqmN
         8h8ryQwNi0ys47qDdILsDDydHva04tzGcbL0OZuvRv04AK0vhhluJ/HIGM9j1HfE+EoZ
         9KRu4QWbN2xYRd3bchuisPkGcxznYhLkGr1bB5i9P5hu/lnv9JepUxto00FEpXtTIad7
         Sjcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744024999; x=1744629799;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K75WVrnwF2RMwBZca7VabHFLHEWgEfMMiN0EHNjeDhE=;
        b=gBSNAn4lbre+N8hwN4QoxnrXIJfUlLbAfCHbLB17mCDQAQUc2ob+iM71eQxaabsDX7
         fZDl49txm9uRtb4OmEn6m+uawn78V/BeBSnkRC+NpCvHb40UKrWvS8on/n/svMPn2257
         R6zxXrlaO2m4dTV+OV3rRfqnpMCOyXNZ3m1QSKmsmvi2r49i74Y5Djgw4YQCglcfJuYz
         9s8ZSz8zsQRuw/fzEUuVOmvsSU/Rs/XYgnzb9JN4jjVM9JPJa7n03O/K3kc7LWFJcUie
         lO2kGdQV5yelEa+maldz1ZjI/VVVq9NDS+rYyUQ06umr+j8NQMOy/XXBIq3W4ptnxt/e
         sIeg==
X-Forwarded-Encrypted: i=1; AJvYcCXuZbdksNThV0OGs0/ys0UK5Zif6c/plkKK+47JyL5eycWvQpa4l+I84QBcs/MnjECXnMmPcu8JIQ3eJ2w=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGafDGsQqUkoYG2tFp/EB+dmyRm4Ax6fKhchHpxmHfKodolrJa
	IUkomdTVN2dv7OrDEOwHv2u0bPV+6Rf1BXX0d50qq/0zYNo4H+UZqLOZNjA6
X-Gm-Gg: ASbGncuMLZdp+u7CrxY0bfqcYw2wjdUVP2mea70n7twsNVHguL8BsMPvj/mxhIamveQ
	GpSVf8vUknNM0b4dYQxZ84Vyq6KT83YGvXklhCboDzA3NR1GqQ5p6+4ayjWpeiNBWPeKoODo9Ls
	Zp1vECZnzgqKV4B5P+uTOrZkC4ZDKHVdNZ/GlZlhJWiXWXv+aTZLPFW1PL3JPgs8CpC0CVTlQaC
	2p1PMJJiJkPLzSGVRtggJPVwR/55IxdH38AQfFsMIK6wjUWHl0P3ackCDf2en5d5sNGOU9Gosr5
	JVQAzOyxOk6XUaj5Q3g/+BnQGhB0UGELyC9I
X-Google-Smtp-Source: AGHT+IF04Eagh0FV1hi3MRhHCCoP/aWp7SqK89xlJ3XA4skuerEkya5+ccgPhUHTtpPZZuFrFhLOKw==
X-Received: by 2002:a17:907:724e:b0:ac7:3918:752d with SMTP id a640c23a62f3a-ac7e77b2faamr731384266b.58.1744024999275;
        Mon, 07 Apr 2025 04:23:19 -0700 (PDT)
Received: from fedora.. ([193.77.86.199])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f087f08a98sm6583194a12.34.2025.04.07.04.23.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 04:23:18 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: x86@kernel.org,
	linux-kernel@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH] x86: Remove __FORCE_ORDER workaround
Date: Mon,  7 Apr 2025 13:23:01 +0200
Message-ID: <20250407112316.378347-1-ubizjak@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

GCC PR82602 that caused invalid scheduling of volatile asms:

  https://gcc.gnu.org/bugzilla/show_bug.cgi?id=82602

was fixed for gcc-8.1.0, the current minimum version of the
compiler, required to compile the kernel. Remove workaround
that prevented invalid scheduling for compilers, affected by
PR82602.

There were no differences between old and new kernel object file
when compiled for x86_64 defconfig with gcc-8.1.0.

Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
---
 arch/x86/include/asm/debugreg.h      | 12 ++++++------
 arch/x86/include/asm/special_insns.h | 21 +++++----------------
 2 files changed, 11 insertions(+), 22 deletions(-)

diff --git a/arch/x86/include/asm/debugreg.h b/arch/x86/include/asm/debugreg.h
index fdbbbfec745a..719d95f1ab5e 100644
--- a/arch/x86/include/asm/debugreg.h
+++ b/arch/x86/include/asm/debugreg.h
@@ -23,7 +23,7 @@ DECLARE_PER_CPU(unsigned long, cpu_dr7);
 
 static __always_inline unsigned long native_get_debugreg(int regno)
 {
-	unsigned long val = 0;	/* Damn you, gcc! */
+	unsigned long val;
 
 	switch (regno) {
 	case 0:
@@ -43,7 +43,7 @@ static __always_inline unsigned long native_get_debugreg(int regno)
 		break;
 	case 7:
 		/*
-		 * Apply __FORCE_ORDER to DR7 reads to forbid re-ordering them
+		 * Use "asm volatile" for DR7 reads to forbid re-ordering them
 		 * with other code.
 		 *
 		 * This is needed because a DR7 access can cause a #VC exception
@@ -55,7 +55,7 @@ static __always_inline unsigned long native_get_debugreg(int regno)
 		 * re-ordered to happen before the call to sev_es_ist_enter(),
 		 * causing stack recursion.
 		 */
-		asm volatile("mov %%db7, %0" : "=r" (val) : __FORCE_ORDER);
+		asm volatile("mov %%db7, %0" : "=r" (val));
 		break;
 	default:
 		BUG();
@@ -83,15 +83,15 @@ static __always_inline void native_set_debugreg(int regno, unsigned long value)
 		break;
 	case 7:
 		/*
-		 * Apply __FORCE_ORDER to DR7 writes to forbid re-ordering them
+		 * Use "asm volatile" for DR7 writes to forbid re-ordering them
 		 * with other code.
 		 *
 		 * While is didn't happen with a DR7 write (see the DR7 read
 		 * comment above which explains where it happened), add the
-		 * __FORCE_ORDER here too to avoid similar problems in the
+		 * "asm volatile" here too to avoid similar problems in the
 		 * future.
 		 */
-		asm volatile("mov %0, %%db7"	::"r" (value), __FORCE_ORDER);
+		asm volatile("mov %0, %%db7"	::"r" (value));
 		break;
 	default:
 		BUG();
diff --git a/arch/x86/include/asm/special_insns.h b/arch/x86/include/asm/special_insns.h
index 6266d6b9e0b8..ecda17efa042 100644
--- a/arch/x86/include/asm/special_insns.h
+++ b/arch/x86/include/asm/special_insns.h
@@ -10,30 +10,19 @@
 #include <linux/irqflags.h>
 #include <linux/jump_label.h>
 
-/*
- * The compiler should not reorder volatile asm statements with respect to each
- * other: they should execute in program order. However GCC 4.9.x and 5.x have
- * a bug (which was fixed in 8.1, 7.3 and 6.5) where they might reorder
- * volatile asm. The write functions are not affected since they have memory
- * clobbers preventing reordering. To prevent reads from being reordered with
- * respect to writes, use a dummy memory operand.
- */
-
-#define __FORCE_ORDER "m"(*(unsigned int *)0x1000UL)
-
 void native_write_cr0(unsigned long val);
 
 static inline unsigned long native_read_cr0(void)
 {
 	unsigned long val;
-	asm volatile("mov %%cr0,%0\n\t" : "=r" (val) : __FORCE_ORDER);
+	asm volatile("mov %%cr0,%0" : "=r" (val));
 	return val;
 }
 
 static __always_inline unsigned long native_read_cr2(void)
 {
 	unsigned long val;
-	asm volatile("mov %%cr2,%0\n\t" : "=r" (val) : __FORCE_ORDER);
+	asm volatile("mov %%cr2,%0" : "=r" (val));
 	return val;
 }
 
@@ -45,7 +34,7 @@ static __always_inline void native_write_cr2(unsigned long val)
 static __always_inline unsigned long __native_read_cr3(void)
 {
 	unsigned long val;
-	asm volatile("mov %%cr3,%0\n\t" : "=r" (val) : __FORCE_ORDER);
+	asm volatile("mov %%cr3,%0" : "=r" (val));
 	return val;
 }
 
@@ -66,10 +55,10 @@ static inline unsigned long native_read_cr4(void)
 	asm volatile("1: mov %%cr4, %0\n"
 		     "2:\n"
 		     _ASM_EXTABLE(1b, 2b)
-		     : "=r" (val) : "0" (0), __FORCE_ORDER);
+		     : "=r" (val) : "0" (0));
 #else
 	/* CR4 always exists on x86_64. */
-	asm volatile("mov %%cr4,%0\n\t" : "=r" (val) : __FORCE_ORDER);
+	asm volatile("mov %%cr4,%0" : "=r" (val));
 #endif
 	return val;
 }
-- 
2.49.0

