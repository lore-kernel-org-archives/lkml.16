Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02CDB13CF9C
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 14:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745245778; cv=none; b=lVgIVyKXurRQYAGQvAJ2V4vt5GVGOy2KhHAl+hgdzulCKOKPE6QIAKOloAL84W/htaSt1PICnaWByeKxSGZgh/3OlvO58UeqEf61pfrjvmF68niSHSUDvQqkZ3D09/lW1cl4QL4aTLcXoo/yy/0OiAqKbPqmZJG/3c4SSgef0e0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745245778; c=relaxed/simple;
	bh=roaBEJjGaKm2arNMjpZ8l/EUIQYjq3i4Wt/e2J+fStY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=b+YBcbuOB9YTe6iXP9Pi+YIWaffuLpUE+pfMJLLWAzyyMzl5cj3N7koq8rp68VfzVmobzyxbCs8Pi05W6HxQk0LUGtUcXpfccbh5df5PAkjJuLOtDwjVV9vWEXFAZUgDEwKt/CRvJqVpiHuCpPepUuLNLqF3XMfz5pcQmzgzehk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=iZsO46rh; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="iZsO46rh"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43cfebc343dso34259665e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 07:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745245775; x=1745850575; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7PqG7/ov+XLPSS/BI8rl8Yyu60TugcPqJyKJ5mLINmc=;
        b=iZsO46rh35HDaMu6qmJ8OdFhgkU81Mzj2oI8R3LxDV2m1HZUXrc8yrFsXTm77i0UFG
         OBGgrWB+seS0Hi7Sor/8hgOk+s4291QqkgbTLN2u/tY+eLz92N68K5uMFh+j3PdDHsV8
         8vc3p2WcMISUkcBf5pX2QU7dBl0FKF+zvrsEvKvobcKxy+dYznE/pD76xFwa5JIdkNr9
         pKmO36rRa4PYvR8g1IbBH5QA7Ljd7j+hcMMHCh/PE55UCrDASPv48CBD/MhXYI+jaBnX
         B3tXrIhY7kqztRKuzRjCLCiMYvJxlASBLJf0lnSnUr4RQvNNlLPR92piP1kCOe6b8hTi
         x/kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745245775; x=1745850575;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7PqG7/ov+XLPSS/BI8rl8Yyu60TugcPqJyKJ5mLINmc=;
        b=dzQiwW17lvtK5QtAYwIqxLO7XtmqMhiijxj29Hiu7mio++lfeF5vMK18A3+rMc4Ly4
         OuDA7q7sH8vDzTggRyLFN9UXya4PJxP7RnPPeuR1DxYxmdwfvYZbGR1Ja4LLGERqJkGF
         Z8sZGoxfb/3/ANkdCYkEvmw1H/ePZlD9bE5AheIBBDtgWzTZ/2/OOadMNT1EyjJjBg4l
         wUZsDM3YQp+fOzPXGw/jUuKXPRitu0xE+4nZojdxAzXWcgONfEK0Ua5NYHah6BMQ90aE
         AouJzpptXyeG9CPHLyGCcNf+F5SCIUyY9/sb45qEyc8Hj7t1XBW127BfAtW3kXMVnhGD
         iX3Q==
X-Forwarded-Encrypted: i=1; AJvYcCURb6og5V5FBO6cYLkKIQiolPo6bLtNzS90v3+GZeg+GY0A+Df5zmnIQ5YKt2jblcDSF7u2NzGrceNBprg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4x34XefoMb7pgihnMuzMG/3P4xvcweZMYeNsFx8c4m1qelSPi
	Zd/n0PHqUXTAgM0VMfw5LHm5S+Cc/bB1UySpKUW5K3071/E1DnoH1ZT2qWa/jNU=
X-Gm-Gg: ASbGncurid9cj87bEZ663hm2RGsN4/1+qJO+CZBPI5VNVkhcW5E0QnCmLGA4AonFYSx
	NrZ29e9wLpF7FxcCQxVJ5DcwZ0jDecKtOcivzHrqSNw81lliRX+5IlGOmQG0Pepn30Ez2nnu3mC
	qHAxNhBaMjp8mvzHSYWfT0v5VdnznxLE10AyOlZXodwi3X+W+yLdLOZf4Ff5d71+Yj6auQ+z0k4
	jRX7lWuFEB6DUInXuUHEvIgxNBJvExYXpWTrZPaXakAVynxhZ0WS7kJLjaQ/4u1gNeVt7gpYJH9
	i+M4TOQKGATl2X4X6HBxBSj3hcE3rx1DtEAwNTzPAvOv06rNlTngMimfbXE=
X-Google-Smtp-Source: AGHT+IFtaZI4HL07N6roaGJageZKu+pJvFMTwymIjfPu+o3nCKfh2t3UeftOSZHfxlA79jnfnWiZmg==
X-Received: by 2002:a05:600c:3b9b:b0:43c:e478:889 with SMTP id 5b1f17b1804b1-4406aa8984fmr117511685e9.0.1745245775271;
        Mon, 21 Apr 2025 07:29:35 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:3382:ef90:cd58:9e76:e88c:5cd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4406d5bbc13sm135524665e9.17.2025.04.21.07.29.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 07:29:34 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Guo Ren <guoren@linux.alibaba.com>,
	Guo Ren <guoren@kernel.org>,
	Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v3 4/4] riscv: xchg: Prefetch the destination word for sc.w
Date: Mon, 21 Apr 2025 16:24:41 +0200
Message-Id: <20250421142441.395849-5-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250421142441.395849-1-alexghiti@rivosinc.com>
References: <20250421142441.395849-1-alexghiti@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Guo Ren <guoren@linux.alibaba.com>

The cost of changing a cacheline from shared to exclusive state can be
significant, especially when this is triggered by an exclusive store,
since it may result in having to retry the transaction.

This patch makes use of prefetch.w to prefetch cachelines for write
prior to lr/sc loops when using the xchg_small atomic routine.

This patch is inspired by commit 0ea366f5e1b6 ("arm64: atomics:
prefetch the destination word for write prior to stxr").

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
Link: https://lore.kernel.org/r/20231231082955.16516-4-guoren@kernel.org
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/include/asm/cmpxchg.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
index 2ec119eb147b..0b749e710216 100644
--- a/arch/riscv/include/asm/cmpxchg.h
+++ b/arch/riscv/include/asm/cmpxchg.h
@@ -13,6 +13,7 @@
 #include <asm/hwcap.h>
 #include <asm/insn-def.h>
 #include <asm/cpufeature-macros.h>
+#include <asm/processor.h>
 
 #define __arch_xchg_masked(sc_sfx, swap_sfx, prepend, sc_append,		\
 			   swap_append, r, p, n)				\
@@ -37,6 +38,7 @@
 										\
 		__asm__ __volatile__ (						\
 		       prepend							\
+		       PREFETCHW_ASM(%5)					\
 		       "0:	lr.w %0, %2\n"					\
 		       "	and  %1, %0, %z4\n"				\
 		       "	or   %1, %1, %z3\n"				\
@@ -44,7 +46,7 @@
 		       "	bnez %1, 0b\n"					\
 		       sc_append						\
 		       : "=&r" (__retx), "=&r" (__rc), "+A" (*(__ptr32b))	\
-		       : "rJ" (__newx), "rJ" (~__mask)				\
+		       : "rJ" (__newx), "rJ" (~__mask), "rJ" (__ptr32b)		\
 		       : "memory");						\
 										\
 		r = (__typeof__(*(p)))((__retx & __mask) >> __s);		\
-- 
2.39.2

