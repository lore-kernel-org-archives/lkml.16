Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6C304C8F
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 09:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744363898; cv=none; b=X5zaA6Qw8zh447Tcuk7NhHUMgEWyqvFDxWqA9aRP8AMzp9bSQLgg4GFT8F1Rab9xR7WbroW4lZgHNZPleB6jy1Xd5nfVCczQg5d/F9oGpcdd4gELgmGN68EaT1yKnn5H70nHs5byiX4I7TM/15yugKR5aIiQY28XGzg3y4myUME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744363898; c=relaxed/simple;
	bh=K/cjw2e3sGRJG4VezvSIokSMrvNiXovmMRVlGO4XaoM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SFwF5HxexlmS2NZJNePyptdYUSpEexpJW8aiAcBfwJLdiXjy6gdjC73TKxvbN8gmc7chZFh48ezJDM6hueY+41k1QnIAL62Gmv0QTnr2g7Sc9TZnVp5+/gWN4aZh27n8LHByi0SKg2S9QU4Wg+dcw6o9bNX7cL9z7FJBaD+0fRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iinICasV; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iinICasV"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5ed1ac116e3so2730602a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 02:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744363895; x=1744968695; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZgN03MU9sJA/W7pGyw6dWY6i9CbLwT1EBYv9i0eeapM=;
        b=iinICasVAtUmOIiqQ5RF0fDVaoORN0T+qddcF+EmSFXzhDOjaLeShfHIMvtwNkX+N2
         +Ketalcoo/Y5bXcqYRZ5cz9dUzxaorhHO33tNS6RImrRLLbz7qiltp6EiCf/aSMQFga3
         2eeUGDnugaSonlAcR5VdxtWNSLrHdPcyhMdcWDN1KoLtbx7Vxc7vNtF4htgmR/PIo+0s
         YEsGAKXeyqRGH/SLTxNw6vNTvEVaS8SPYtGtRm1gMFG52RexBl5suDCqJiSPf8J638c0
         sD1/H8XzmSCe38qO3+moFWob65DDxD4YHmnFADtxZYLBGKKqSMCM1norJ7+qSiBbkTqr
         kahQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744363895; x=1744968695;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZgN03MU9sJA/W7pGyw6dWY6i9CbLwT1EBYv9i0eeapM=;
        b=NrgnGsDj454Vd9wMBxvOJYP8SH0IXc57mOXvdJBYHurWy3updlLHHTkF56duZBksnd
         zOvJ56exKJ6L0P7BZwpanCYp14PvL7HlXuhpVh5DA7FIjY63pPGyZKcqJf4u5KfdDxJz
         vLxPrseRJeb8UkE4PFgQUOttvRM9BLCLjJFkXQYjoWvuaNaUIoed37KDxQdnHM8ilFmr
         WYtnAvqdBZdEeLGn+NuPHMn26WLAi/MAnFmdbJXkh6i5agFQ8jECH/CMIJ4pu109xvi5
         XINdKJewpGRkhM6qIWQCIQUF5fYdcGAkxI8WVRyfABst+fmjCbhbFlvpeE3nk23FYzQP
         B+kw==
X-Forwarded-Encrypted: i=1; AJvYcCUlcptT9iVQCNPCeguFnt7ekb/QIw1j+PkvXXSM0iSG4rt5Fns0SAcqYTzlfJlb08r/BIikGcJiPd2mWG0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBYyRM2cJifwNmhCqHVyBE7S4HN8l/R1IA8UZVCVKDm2MYzt1v
	HU+xWaQh3tKYKEtkZiKanEb0Ug41xXpzcgLbfZ3wJG/usZHf5wS1
X-Gm-Gg: ASbGncsljYlSPXKvF9YwFtmNIoqSSblSwqXDXKgXProPNvlVK3lDUBbMfQEuSBDiagQ
	257bPCDofwYW+c3hvemCNmgbVIWFJX6m0901j4lEIrifRTPLln+SFe+D2tAPDS+cp0TZap/l6sa
	HiPj9mAbnoHMcdrxw10/3ZiTnrSdqYUo6yk5aXgKq4bd3zwpclUM71VBZCVIg2LKpN5BaT51B99
	o5ebQP7rYCr6WanKH487z9IB7dSXRhjkuIR5PiUyPYc5NTg0Kz/AqjZmEw33lRHf6hRw7pixqW0
	Ary9uJwZ4h+k3FS8Xt7oF8qXDUJ2C9Ul4bEMvLbP/4o=
X-Google-Smtp-Source: AGHT+IFHVUkQYr9SKjehq+q9CskJLIZtsUrc39kGTWh0XF5+9aF5f1Unlb9xAzhsxg/okOylDGsVuw==
X-Received: by 2002:a05:6402:1cc1:b0:5e6:17d7:9a32 with SMTP id 4fb4d7f45d1cf-5f36f87762fmr1372904a12.18.1744363894642;
        Fri, 11 Apr 2025 02:31:34 -0700 (PDT)
Received: from fedora.. ([193.77.86.199])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f36ef5c445sm692570a12.31.2025.04.11.02.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 02:31:34 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: x86@kernel.org,
	linux-kernel@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH] x86/percpu: Refer __percpu_prefix to __force_percpu_prefix
Date: Fri, 11 Apr 2025 11:31:17 +0200
Message-ID: <20250411093130.81389-1-ubizjak@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refer __percpu_prefix to __force_percpu_prefix to avoid duplicate
definition. While there, slightly reorder definitions to a more
logical sequence, remove unneeded double quotes and move misplaced
comment to the right place.

No functional changes intended.

Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
---
 arch/x86/include/asm/percpu.h | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/arch/x86/include/asm/percpu.h b/arch/x86/include/asm/percpu.h
index 5fe314a2e73e..b0d03b6c279b 100644
--- a/arch/x86/include/asm/percpu.h
+++ b/arch/x86/include/asm/percpu.h
@@ -29,6 +29,8 @@
 
 #ifdef CONFIG_SMP
 
+#define __force_percpu_prefix	"%%"__stringify(__percpu_seg)":"
+
 #ifdef CONFIG_CC_HAS_NAMED_AS
 
 #ifdef __CHECKER__
@@ -36,23 +38,23 @@
 # define __seg_fs		__attribute__((address_space(__seg_fs)))
 #endif
 
+#define __percpu_prefix
 #define __percpu_seg_override	CONCATENATE(__seg_, __percpu_seg)
-#define __percpu_prefix		""
 
 #else /* !CONFIG_CC_HAS_NAMED_AS: */
 
+#define __percpu_prefix		__force_percpu_prefix
 #define __percpu_seg_override
-#define __percpu_prefix		"%%"__stringify(__percpu_seg)":"
 
 #endif /* CONFIG_CC_HAS_NAMED_AS */
 
-#define __force_percpu_prefix	"%%"__stringify(__percpu_seg)":"
-#define __my_cpu_offset		this_cpu_read(this_cpu_off)
-
 /*
  * Compared to the generic __my_cpu_offset version, the following
  * saves one instruction and avoids clobbering a temp register.
- *
+ */
+#define __my_cpu_offset		this_cpu_read(this_cpu_off)
+
+/*
  * arch_raw_cpu_ptr should not be used in 32-bit VDSO for a 64-bit
  * kernel, because games are played with CONFIG_X86_64 there and
  * sizeof(this_cpu_off) becames 4.
@@ -77,9 +79,9 @@
 
 #else /* !CONFIG_SMP: */
 
+#define __force_percpu_prefix
+#define __percpu_prefix
 #define __percpu_seg_override
-#define __percpu_prefix		""
-#define __force_percpu_prefix	""
 
 #define PER_CPU_VAR(var)	(var)__percpu_rel
 
@@ -97,8 +99,8 @@
 # define __my_cpu_var(var)	(*__my_cpu_ptr(&(var)))
 #endif
 
-#define __percpu_arg(x)		__percpu_prefix "%" #x
 #define __force_percpu_arg(x)	__force_percpu_prefix "%" #x
+#define __percpu_arg(x)		__percpu_prefix "%" #x
 
 /*
  * For arch-specific code, we can use direct single-insn ops (they
-- 
2.49.0

