Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D952EBB80
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 18:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750443465; cv=none; b=fc814jg3LFjyyK49YzMx+wCczyi1QRqJk29aUsQv5VqGT/fpsMYF/HggdoSsYoCqHMLz2Yve7Vaun2mPSEFSsDS49hbKjn4sPpAlFKItbLhAuiVyfMAD3ts3k+2mOixvkmqKmZmKQcPM0q86VMkRzWQx/jjEpLmKvf5OMRnWS9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750443465; c=relaxed/simple;
	bh=E5gNelm91XMJ+AZCHJOExXs098uttzq+1BtKy9LZWyY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=YY/vLfBhc51ITobvixPEzosGFZa784A+cSoKt0VagK9TzuzD9ijH/KUy9RwyfLCktSYKBaWyLp8R/SdyNyUzW517Y70hgsn+DvNCQUJS7DJKno24g2h+remrQjY2XS13ZYK4Pz5Eu1Z95qbzw3DJI+rHu5v8IUfsba6s7KfcE64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--willmcvicker.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FA5gbIpT; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--willmcvicker.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FA5gbIpT"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-748f3d4c7e7so1763728b3a.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 11:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750443463; x=1751048263; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=CMP7Kl6yow8Faa+m4ttvJDoB9/AivqWlJaRr2H7xdgs=;
        b=FA5gbIpT3eGmw5TCQRoNCphA4HGwPyXSGfUyi3jfnw5gfDmi31+PKgXC6mxizVfwLZ
         UTg4b/TtHRWSsHUAseVXbxm9uAICxsiKzbgI8aJLDRgd+l3ITvUgO/q6bpCenvhS/TMC
         8D6wHZ9fhdMCk1v8XekthBMUafOJ4dCrtDDDNUJcBRw9MXYtVImFrmHOJKG9JkmclmeO
         ZI3DvFerS0kJEQrpZg78U0Ojy8QVX3YO7mM2lbIy+PD+RpPpDtuA/1843dlmN087L/+w
         +0FtaMKfv6E29NWqumfzQH0GH9yDpiWrczZfBSEiflH/xgygxeBlxLb833C60huFB9sq
         BfGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750443463; x=1751048263;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CMP7Kl6yow8Faa+m4ttvJDoB9/AivqWlJaRr2H7xdgs=;
        b=M+C3nTctnaugLspXoADWYvkti2M2HT0LCQqykC2O6lkoyGU1cf2rFVygOaxTXgSrZ9
         Iesst3Mj8BbCCv74zF6dML/xOO/WIQMEX82jUgAVgnQUIUsyKFlhfiMM89slkRbLeFi6
         jCnKDugkyieb7zmcyqwbdgpInb99NWN1jJd+vcfajVi+g0BMAvzxJlyZ/UXbvZeFjnVn
         OJfsJ+fdAfhBAIykIhMgRw/UrS2Tz8WUDSDdepe50RBVAU2M88FXNrtkYau+GoRYMDVp
         ot3aB2q2Tn/1T10ohnLFptF/JWhuRS73pc+e6OqFOiKAH/zLGGww/ceQOpCQXw/v6ksK
         9WvA==
X-Forwarded-Encrypted: i=1; AJvYcCXz+yy7hOfdAtYF6fefGlx5BMe+8kec3IYnFMYzXHCU7+keC96AfksOqaZpUEdg7PglgMstwmaAGN70keM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSV1hyVCgJz46Uq6eSjv4aRTAvz8womde0FdlZAkonOXmY9t5o
	AHE7EtTj0LJRFMrYNrFNE0ABzzLGry2DrMLQf1dAXkc+RCpjRFStSmKSZ/lGZTCD26Ik7DBwwst
	sWqY29a8O3G0qLTffw07mCQNBBmPKGw==
X-Google-Smtp-Source: AGHT+IGm/vFj5hrKzWy2Z3pEyDUaKOhhI+CR5MlaibQ4Zvsy25uFRQsZYTONpTVOibGjQMqu8859Np1afVaE2rSP3T8=
X-Received: from pfbef10.prod.google.com ([2002:a05:6a00:2c8a:b0:749:10a2:4f64])
 (user=willmcvicker job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:2da0:b0:748:6a1f:6d3b with SMTP id d2e1a72fcca58-7490d7b8df9mr5222155b3a.19.1750443463199;
 Fri, 20 Jun 2025 11:17:43 -0700 (PDT)
Date: Fri, 20 Jun 2025 11:17:05 -0700
In-Reply-To: <20250620181719.1399856-1-willmcvicker@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250620181719.1399856-1-willmcvicker@google.com>
X-Mailer: git-send-email 2.50.0.rc2.761.g2dc52ea45b-goog
Message-ID: <20250620181719.1399856-3-willmcvicker@google.com>
Subject: [PATCH v4 2/6] clocksource/drivers/exynos_mct: Don't register as a
 sched_clock on arm64
From: Will McVicker <willmcvicker@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@google.com>
Cc: Will McVicker <willmcvicker@google.com>, Donghoon Yu <hoony.yu@samsung.com>, 
	Hosung Kim <hosung0.kim@samsung.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	John Stultz <jstultz@google.com>, Youngmin Nam <youngmin.nam@samsung.com>, 
	Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	"=?UTF-8?q?Andr=C3=A9=20Draszik?=" <andre.draszik@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The MCT register is unfortunately very slow to access, but importantly
does not halt in the c2 idle state. So for ARM64, we can improve
performance by not registering the MCT for sched_clock, allowing the
system to use the faster ARM architected timer for sched_clock instead.

The MCT is still registered as a clocksource, and a clockevent in order
to be a wakeup source for the arch_timer to exit the "c2" idle state.

Since ARM32 SoCs don't have an architected timer, the MCT must continue
to be used for sched_clock. Detailed discussion on this topic can be
found at [1].

[1] https://lore.kernel.org/linux-samsung-soc/1400188079-21832-1-git-send-email-chirantan@chromium.org/

[Original commit from https://android.googlesource.com/kernel/gs/+/630817f7080e92c5e0216095ff52f6eb8dd00727

Signed-off-by: Donghoon Yu <hoony.yu@samsung.com>
Signed-off-by: Youngmin Nam <youngmin.nam@samsung.com>
Reviewed-by: Youngmin Nam <youngmin.nam@samsung.com>
Acked-by: John Stultz <jstultz@google.com>
Tested-by: Youngmin Nam <youngmin.nam@samsung.com>
Signed-off-by: Will McVicker <willmcvicker@google.com>
---
 drivers/clocksource/exynos_mct.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/clocksource/exynos_mct.c b/drivers/clocksource/exynos_mct.c
index da09f467a6bb..96361d5dc57d 100644
--- a/drivers/clocksource/exynos_mct.c
+++ b/drivers/clocksource/exynos_mct.c
@@ -219,12 +219,18 @@ static struct clocksource mct_frc = {
 	.resume		= exynos4_frc_resume,
 };
 
+/*
+ * Since ARM devices do not have an architected timer, they need to continue
+ * using the MCT as the main clocksource for timekeeping, sched_clock, and the
+ * delay timer. For AARCH64 SoCs, the architected timer is the preferred
+ * clocksource due to it's superior performance.
+ */
+#if defined(CONFIG_ARM)
 static u64 notrace exynos4_read_sched_clock(void)
 {
 	return exynos4_read_count_32();
 }
 
-#if defined(CONFIG_ARM)
 static struct delay_timer exynos4_delay_timer;
 
 static cycles_t exynos4_read_current_timer(void)
@@ -250,12 +256,13 @@ static int __init exynos4_clocksource_init(bool frc_shared)
 	exynos4_delay_timer.read_current_timer = &exynos4_read_current_timer;
 	exynos4_delay_timer.freq = clk_rate;
 	register_current_timer_delay(&exynos4_delay_timer);
+
+	sched_clock_register(exynos4_read_sched_clock, 32, clk_rate);
 #endif
 
 	if (clocksource_register_hz(&mct_frc, clk_rate))
 		panic("%s: can't register clocksource\n", mct_frc.name);
 
-	sched_clock_register(exynos4_read_sched_clock, 32, clk_rate);
 
 	return 0;
 }
-- 
2.50.0.rc2.761.g2dc52ea45b-goog

