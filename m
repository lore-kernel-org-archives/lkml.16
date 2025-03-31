Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 995C12206B8
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 23:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743462057; cv=none; b=LktRaFZvaPR2PsWEI4sodyAuqatJzFFzYK/WvrG0L6gXoROWFP96jRSIlrMOlPfYoMANNOJdEXKkQHidBa69Lwhb8nVvvaVn2MBIZ5Ag5BVF9gaT6qKFTVH4UFVjTUkTtPdSZ73T3mYTyD1uNfOr84wR1x3b9uyi1xkaW8Z/wGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743462057; c=relaxed/simple;
	bh=BHqjnEz8Bqub0+5tOgaodvHpe7VxxoEtAWRFbgVwkX4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=PsPL5Gn1d/UUQLFMOr/1Y/fRib5K1WlAsFtTVWRnGMFxyRem4znzdV2DyVyIPW3sC3Lw/ICNdZVgGg1fC4tZHbMXzFJWKMJqJTGJHSTawYXPXE/uWa9TbWhdJcK5kn68MdSs7H24ZAGxNXEm2qHDsXmMRFBeTBtYcU6AVIifw3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--willmcvicker.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JVzwCa07; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--willmcvicker.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JVzwCa07"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2ff7cf599beso9012273a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 16:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743462055; x=1744066855; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=vqQfU5MFNX+M9dMbS6b209zYYBr6gV4W0L8ERj/h45U=;
        b=JVzwCa07ULKllNkA4NAq28yzX29CDrNJkwpPA9OcKklGFxso2haopT1HH19HZvpRmo
         /hH+FHfWhfZfTiCidtD1MevbqeqeT/wcaeyYgEjLnz8dvh0d09SxtavLKghSlJJsOMn6
         HXnyvbDbYdwFdmWBEGCxxuRm0C40YOQS7iPBU22lnAr8TXZJVaWO06h1zaIfQsmsH9ZF
         YntP58HfB2w3BNu4VCq8p5SsfaGGphjm5JMmaNIceW5tJY2LOf0+PpNRvJr9eSOdIeY6
         p8gX2CHOgoP++F62MtJ4hypay1iG6pepMcquPI74iHTWOGdrpamhnsz8aU9Lv8wn1MWq
         MUNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743462055; x=1744066855;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vqQfU5MFNX+M9dMbS6b209zYYBr6gV4W0L8ERj/h45U=;
        b=eTAxSxbC0QeW+8BGgPwEc/EfP4+wDzNF+IQQTv2NKxKb0HGHaWMYl1nKxdfquYLotV
         REHYnmRef9b+ZpSFjJFqCQvp3Nnr4yEO0SzyUJkVWdA1L/GH2Dy6w13i2FTFuavUr+7r
         8N0uz9STWq44lA7FMrqLrAospK+sC3PhvbG1zNfGJBZid6VpFeBAaCU+t/7Nm0F+jLhP
         zVU/gcfMURiRYzvh1kJ1pD5NNZMB8rl430pMXUW6aQp/MH1eCWD2TDJGEF8RiXo5Nbw9
         5GkkIWhaR3/6Nf/BQv5jAdfDDDwsWyFsgIsUyYRuuQougL3zdHNQlb1fesZckximqxKv
         EB6g==
X-Forwarded-Encrypted: i=1; AJvYcCV9X/1Up7Eood8jTnBicJt2ht6apvieHwKG3YhzYxUIC77bT057GjdO5DELNZURqCdyQnenACZFbTNMUZs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbWsoOOmrYP0chCw5sZZ80nJiXBp3rKTWw0P+UqD709Xl1KLC7
	V8ylL8YhZZqWSsrK6zMCB/wWVlAPUgMcUVsulHRqvgJJPWUzSIVWPrFNvMqkrm2lhZ1YZ08qZIE
	UWT44AObX111L9IiWpM0uJHoxng==
X-Google-Smtp-Source: AGHT+IEx4n4bxYc/YGt82JQ6y5gWLCjA7rtOL1EcSQ5FOyxHXLQUeEqlUnQfPzSQjxNpXS/pD1jk7mi3qLuRMiZ4+F4=
X-Received: from pjbmj3.prod.google.com ([2002:a17:90b:3683:b0:305:2d68:2be6])
 (user=willmcvicker job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:3c06:b0:2fe:994d:613b with SMTP id 98e67ed59e1d1-3053215a3d8mr16944353a91.35.1743462055036;
 Mon, 31 Mar 2025 16:00:55 -0700 (PDT)
Date: Mon, 31 Mar 2025 16:00:28 -0700
In-Reply-To: <20250331230034.806124-1-willmcvicker@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250331230034.806124-1-willmcvicker@google.com>
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
Message-ID: <20250331230034.806124-7-willmcvicker@google.com>
Subject: [PATCH v1 6/6] arm64: exynos: Drop select CLKSRC_EXYNOS_MCT
From: Will McVicker <willmcvicker@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, 
	"=?UTF-8?q?Andr=C3=A9=20Draszik?=" <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Saravana Kannan <saravanak@google.com>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Since the Exynos MCT driver can be built as a module for some Arm64 SoCs
like gs101, drop force-selecting it as a built-in driver by ARCH_EXYNOS
and instead depend on `default y if ARCH_EXYNOS` to select it
automatically. This allows platforms like Android to build the driver as
a module if desired.

Signed-off-by: Will McVicker <willmcvicker@google.com>
---
 arch/arm64/Kconfig.platforms | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 8b76821f190f..325279193e2c 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -109,7 +109,6 @@ config ARCH_BLAIZE
 config ARCH_EXYNOS
 	bool "Samsung Exynos SoC family"
 	select COMMON_CLK_SAMSUNG
-	select CLKSRC_EXYNOS_MCT
 	select EXYNOS_PM_DOMAINS if PM_GENERIC_DOMAINS
 	select EXYNOS_PMU
 	select PINCTRL
-- 
2.49.0.472.ge94155a9ec-goog

