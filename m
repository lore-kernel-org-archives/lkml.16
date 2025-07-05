Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C63F229B28
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 16:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751731316; cv=none; b=lTIgSqpZVwcyMJ+LmP4+GKogDHVltAs0Zpc1dMlVKTBiM0Nt5i27OOunQjTtBvwIVDMu/Q009ZRaFHiRDb7ui/6kMnIxvC4tGKrykaKR1D8wDLuEAtV7pzEZFP6RHqeSxaf6kCEe7FVf0vausgKBXgYeZ47QrW8+2p16CqmOGU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751731316; c=relaxed/simple;
	bh=hZs4sz8oMPEiGhhqApXBtCYQcDxESo4pq1mV1+Z7Z2w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WrvuQY758aytD2A+Mlza24t+YB5GwJb0W9lj9t1oHZD+0U8rZQidi3aPJ3VzUeQguwLo0MobYBIrnqjvJrQgB0pQThEqbsOoQapCA8StoLHKLjc8gLR5fK7smv3qJPu5ZUeC1xuMU1bclU/DTpffpA9rNF9GEHjwGhzOJVCxX44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZrdUxIbU; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZrdUxIbU"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4539cd7990cso10021485e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 05 Jul 2025 09:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751731314; x=1752336114; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=epJPa/pBL6IXn229DAd6lGt1WeXWNm9UUZm5IBc/kEc=;
        b=ZrdUxIbUxBDPTh8BI7bWA5Trshh40xz5hqMSrID7dmACJxUaqX8rOJN8KBBB4xbbgk
         AIkqlyyuHLHBGAWMHSAqYQiXtmPupwJ3aCFX1u2LlkT0ZcSF5c9Jmvewl5kRouUSY6hv
         UJvMTWbIqUcz7Q+6INmZFYCCgT+hxx1Xmrs6vhR+i1WCqyApGz4277xyWsGBO34NEyyy
         ytupiFz2pLCkLQfUgi05/iDfA65MEbrAsJCihknpRCdQ3C9A9Dl5vKMpKGOpuzETOazy
         O9nhEp1+g1dUT1CF/pxvch5QBX9jiJPW10Y7a62qKg41LjXOawctpkrDoYKjQkO+j0aI
         +vzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751731314; x=1752336114;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=epJPa/pBL6IXn229DAd6lGt1WeXWNm9UUZm5IBc/kEc=;
        b=hrtzbIqW+DtL/VJ+VsTOmLdsKl+HxbEWNKyoTgPTDdOqMNgYWHaD6VveLkVlWs0AzF
         wnC3NbggaHk798Ln7dpn92kUl6lGxSR1Y0P6P+cDixXhKS2vGQqd14qipoNY63YOnzHe
         SOYPINRCfumy5Oas+iUW9HwIcDgsMaS7prrHQB11/+xWbDSRNikERt26xn6GyDtN8sMK
         jtOGulUcqXZUpRjKYJkef20Nl8pEx/T3SbWecxsq68OsjqL/bygpwc4vy76+9nrY39VS
         hydsAsbBFVBeGJ5h9shP7ujXjU1D1ddCcn8eF2u3GpQTKoggUk6gEizp5q5f42yRqT5Y
         RbNw==
X-Forwarded-Encrypted: i=1; AJvYcCWV4of4UltmU70supaikOD6iXg0kTmtMd9YZhz5E9SDg8DClFVyfYIG5ecPyTDtsTrGeD9Jqw8P1UgqN+k=@vger.kernel.org
X-Gm-Message-State: AOJu0YzyMyYICMdngS/BPvK2+wSz+c2xnCj7A26T05HffIH2Ye70eFM5
	6adpbVTMGLk/NAem1WCJ3tjmyTqbOai2hBFxefBvkfUD7uFlfSHL2gbcQZsSMuORf81SmFuEc0w
	xbiIN
X-Gm-Gg: ASbGncvZ4/WQ76U1JmshRmQwn14hsRYNqEkFlM79U73P77EAiUnBElqIE0L5pJ51bTX
	kB3yoBUWTqiI9rk+yl8ivbGMLUkvzW0PePt13FSTYmtbVtl8RiGqe3V9+WMMq9nHhm9hg8nXwxa
	6ad7SN3y0UZX5Y6poE7KReaqAgzWsi9gSyUV84UfARTS3wpC/zzPCPsdB/QaDgKtGe/sMR1SpOh
	rgNnraSkAgXiU8bJJSDMsX3xoht5V3gmeO8cNhBASGGYrcR77EvRTq94nfrpZL8+MysBbPhtFvo
	2KfQ+OFbRpm5HzUnYsFLZem5yXqk7o1JKA6oVtIPeCT5i1ClDmuZffU7Z++F0peIpCldj5nzM2n
	D8uZQ7qSq+N7d
X-Google-Smtp-Source: AGHT+IHbUECiaM5U973bLrl71KctT6rG2xVj0aWGuJ/GI+YA+y0FmSvIk0joYcGbvDd7mLvqZogN8w==
X-Received: by 2002:a7b:c006:0:b0:453:8e3d:26ef with SMTP id 5b1f17b1804b1-454b1f4f177mr48011405e9.6.1751731313497;
        Sat, 05 Jul 2025 09:01:53 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454b16990aasm57709375e9.32.2025.07.05.09.01.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 09:01:53 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: daniel.lezcano@linaro.org,
	tglx@linutronix.de
Cc: ghennadi.procopciuc@oss.nxp.com,
	S32@nxp.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 18/20] clocksource/drivers/pit: Rename the VF PIT to NXP PIT
Date: Sat,  5 Jul 2025 18:01:24 +0200
Message-ID: <20250705160129.3688026-18-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250705160129.3688026-1-daniel.lezcano@linaro.org>
References: <20250705160129.3688026-1-daniel.lezcano@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PIT acronym stands for Periodic Interrupt Timer which is found on
different NXP platforms not only on the Vybrid Family. Change the name
to be more generic for the NXP platforms in general. That will be
consistent with the NXP STM driver naming convention.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 drivers/clocksource/Kconfig                             | 9 ++++++---
 drivers/clocksource/Makefile                            | 2 +-
 drivers/clocksource/{timer-vf-pit.c => timer-nxp-pit.c} | 0
 3 files changed, 7 insertions(+), 4 deletions(-)
 rename drivers/clocksource/{timer-vf-pit.c => timer-nxp-pit.c} (100%)

diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
index 6f7d371904df..0fd662f67d29 100644
--- a/drivers/clocksource/Kconfig
+++ b/drivers/clocksource/Kconfig
@@ -474,11 +474,14 @@ config FSL_FTM_TIMER
 	help
 	  Support for Freescale FlexTimer Module (FTM) timer.
 
-config VF_PIT_TIMER
-	bool "Vybrid Family Programmable timer" if COMPILE_TEST
+config NXP_PIT_TIMER
+	bool "NXP Periodic Interrupt Timer" if COMPILE_TEST
 	select CLKSRC_MMIO
 	help
-	  Support for Periodic Interrupt Timer on Freescale Vybrid Family SoCs.
+	  Support for Periodic Interrupt Timer on Freescale / NXP
+	  SoCs. This periodic timer is found on the Vybrid Family and
+	  the Automotive S32G2/3 platforms. It contains 4 channels
+	  where two can be coupled to form a 64 bits channel.
 
 config SYS_SUPPORTS_SH_CMT
 	bool
diff --git a/drivers/clocksource/Makefile b/drivers/clocksource/Makefile
index 205bf3b0a8f3..77a0f08eb43b 100644
--- a/drivers/clocksource/Makefile
+++ b/drivers/clocksource/Makefile
@@ -49,7 +49,7 @@ obj-$(CONFIG_CLKSRC_LPC32XX)	+= timer-lpc32xx.o
 obj-$(CONFIG_CLKSRC_MPS2)	+= mps2-timer.o
 obj-$(CONFIG_CLKSRC_SAMSUNG_PWM)	+= samsung_pwm_timer.o
 obj-$(CONFIG_FSL_FTM_TIMER)	+= timer-fsl-ftm.o
-obj-$(CONFIG_VF_PIT_TIMER)	+= timer-vf-pit.o
+obj-$(CONFIG_NXP_PIT_TIMER)	+= timer-nxp-pit.o
 obj-$(CONFIG_CLKSRC_QCOM)	+= timer-qcom.o
 obj-$(CONFIG_MTK_TIMER)		+= timer-mediatek.o
 obj-$(CONFIG_MTK_CPUX_TIMER)	+= timer-mediatek-cpux.o
diff --git a/drivers/clocksource/timer-vf-pit.c b/drivers/clocksource/timer-nxp-pit.c
similarity index 100%
rename from drivers/clocksource/timer-vf-pit.c
rename to drivers/clocksource/timer-nxp-pit.c
-- 
2.43.0

