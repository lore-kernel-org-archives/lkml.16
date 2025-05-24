Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA371EE7B6
	for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 15:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748102146; cv=none; b=ORWQJsivRdp/pIqdqaMvc0iirJT+PvenHIB3pXe7x1tHQ1KHJOGABo+/q1nAwdrFRaCb56Q5B8n/2nhjemAD+1PnuLCEVjubtGnKGPuZFcB6sPjsZMDRr823C7zzzxwUVCyRSyoCO75i5l3uvFs0zrMK53t19hbVLaaLELyfDg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748102146; c=relaxed/simple;
	bh=NswgQ1t2swuHv8wddM8n4IMJSh/NdUsfmZylZ40IPmc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nOaqqjpuhUB7owauNp36zG7j/w9w2F3U0QAU8xp4oF298CsMcNEbgppPil52dIkAlGX6ph9UNeEsEquBpbnTzs0mLJjIeH+fi9VIc+7ZFVCYwkdqM+wGDhi2gIS53ELgoJJ309FkWZM7RpFeCq6p1bAbR2peMMgMGpckNi2rU9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MAWQcNuu; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MAWQcNuu"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-233b1e4376fso8611495ad.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 08:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748102144; x=1748706944; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1FT74bOydnUw1XVZ+DksJusFTfOc0V0/ESQZbybugO8=;
        b=MAWQcNuuMgrYQDAWYFe6o4X9DuwsI2Dn2dFJvZHbk1jJmIZB7ORKm6nPCxcaovVsU0
         FUFweXJ1ZMwPWW5oyTawvPy/puox1M8j66CjtJlnGn/hWrnzc4kRFegp6+5/yojqotZt
         5T8VhaDzZ/ZaBez6QRzpaAcEbVsQRAwg1P6dB6XYmr3bbPtk/1K7MKeVH669OJ/9ikOG
         kwptaFv7nijykM38Jfj6OecdXLTVMF0Ci8xwUXwdyQI2ARHRDnWsSIjRH/O3fkRB+7wr
         OWqnb9qxOM6iR3LD8mOmg6PZp389j0hsEZ1yXPubgn8aBbv5Xlz+vZzzfA/QccZ3MgwP
         ldgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748102144; x=1748706944;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1FT74bOydnUw1XVZ+DksJusFTfOc0V0/ESQZbybugO8=;
        b=kP+rpkuEPJtCtZGOlxFJT/iq6F71yE8Xmc3a06yLAoyzG8uiid9s3y4aTjDEWZaglH
         0dBdFkLwK/9B4DMkQ9mICt6B0DYrbw+fAVt4cednZyILUr4u62P/szfNVQ7G5/ikfaBE
         0zrEj1L9u7mxbwXefNbgvJ2m8zVoM+29ptqi2SI1tB/dvjEW5a0Qs296MYLOC7NDM6rS
         /0msAdGfz2Rzt8jI17TiTVQqR3WqTmj8/pMLVzHnib+cyEOpVR8WitYjavi+RJCj8ksZ
         jqT7KjQasgh/9PXlXCLddp05OPVqKVPehdauXebOh8ZKJ13jXasjnY9v1KSRm4s4DhNt
         iqVA==
X-Forwarded-Encrypted: i=1; AJvYcCUfS3/og/zz5kuJBke+QPKnWmG6BzYJ7/K/SSqiDmYy9vU3Iyb2+EtA0+d9mbafxx5nzI6rkg1/v/SpYoc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAttubslQevrSQrdx73A4fQMhMmAqaoHpHU4n5uDsw5GRwmq/k
	7Ij1hbPjufTFhvnl9z/w/lrdSBn99NzYU6KUmzZK+wEjxxuVIMS167G9
X-Gm-Gg: ASbGncvceMviTJpUqd17a7hOObDeCBd3cOtGIjyxqA0MZah84Hk5BthHln+zwvvJFuc
	6uHwUiljl7T8hM/R+lUAaYnmiwLPS2JTpDzqUpDuB33P3sy+zPf3OvDyOYgoA6uA0pZBqd4IZcy
	XtU+FdW36RaTJ5Mx+vxqvyHuOR4EnBYnTdpVj+aKF+0J+erkdhmZYOUEyp/BZxV+mIdjSCNnpZP
	Z82ecaBfbuJL3ptsejZ1TCqYbMrdXdjm7+lZNPhzmu2JxEgNFNegcmA3qYfuBPGtEsykxr1ksXU
	G+J2bakxqTKwaW0fGKB1ztrc+N8JyGDecIiB71G41sD+LM4yt4fo4wzDL405O3C3sGCj1JY0FHi
	jxjd1WQ==
X-Google-Smtp-Source: AGHT+IEMc+IyJuKkp4oh/MfbC7nxhyOBDtktmANYUsWS5HqqsjVoXbsdcZhXdFZe8Q2T0aebh8oAAA==
X-Received: by 2002:a17:902:ef43:b0:231:c99b:9fd7 with SMTP id d9443c01a7336-23414f6e667mr51686015ad.19.1748102143957;
        Sat, 24 May 2025 08:55:43 -0700 (PDT)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-234396eaf62sm1200745ad.9.2025.05.24.08.55.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 May 2025 08:55:43 -0700 (PDT)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	akpm@linux-foundation.org
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jserv@ccns.ncku.edu.tw,
	Kuan-Wei Chiu <visitorckw@gmail.com>,
	Yu-Chun Lin <eleanor15x@gmail.com>
Subject: [PATCH v2 2/3] riscv: Optimize gcd() code size when CONFIG_RISCV_ISA_ZBB is disabled
Date: Sat, 24 May 2025 23:55:18 +0800
Message-Id: <20250524155519.1142570-3-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250524155519.1142570-1-visitorckw@gmail.com>
References: <20250524155519.1142570-1-visitorckw@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The binary GCD implementation depends on efficient ffs(), which on
RISC-V requires hardware support for the Zbb extension. When
CONFIG_RISCV_ISA_ZBB is not enabled, the kernel will never use binary
GCD, as runtime logic will always fall back to the odd-even
implementation.

To avoid compiling unused code and reduce code size, select
CONFIG_CPU_NO_EFFICIENT_FFS when CONFIG_RISCV_ISA_ZBB is not set.

$ ./scripts/bloat-o-meter ./lib/math/gcd.o.old ./lib/math/gcd.o.new
add/remove: 0/0 grow/shrink: 0/1 up/down: 0/-274 (-274)
Function                                     old     new   delta
gcd                                          360      86    -274
Total: Before=384, After=110, chg -71.35%

Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 arch/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index bbec87b79309..f085adc6f573 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -95,6 +95,7 @@ config RISCV
 	select CLINT_TIMER if RISCV_M_MODE
 	select CLONE_BACKWARDS
 	select COMMON_CLK
+	select CPU_NO_EFFICIENT_FFS if !RISCV_ISA_ZBB
 	select CPU_PM if CPU_IDLE || HIBERNATION || SUSPEND
 	select EDAC_SUPPORT
 	select FRAME_POINTER if PERF_EVENTS || (FUNCTION_TRACER && !DYNAMIC_FTRACE)
-- 
2.34.1

