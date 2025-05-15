Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7439429898C
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 12:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747313958; cv=none; b=Ah6TkY/wFja77QOJs3+7uPxchBtKavdcgUes/I9V8w9bA379uDCDbAAMgZpLBwWqGf/c9KtIaRSWaGadgqyScy02UQJJICU3CcxfF935FBEvGcKNfgK+s+mZwNuf6kAowrXrmjLkEknQaK0aM2twm6Iuma6tqMEaVZRsXPUsAEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747313958; c=relaxed/simple;
	bh=OibAgO1lF+UrLS/2SrpwgUDc/nYn6zF9seSKQty2XPk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=pNPmg67YZXLoAhXWOzk6F8XgM/6bVA99jkpwQ2uFRGWIAo5A10VzZlOO31nf7ZdvSiRcZQL5BrR4seubZs6zcSd6mh1AWTNdAZnkOJGhX6fOT8hVr8VvrRKAhQzGM0GgVbks2ZkoBWspAV7lt+7TSq6dN/aN45/JnOz8NP0SxWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=SWJarbqB; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="SWJarbqB"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-440685d6afcso9959885e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 05:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1747313954; x=1747918754; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Qawhlvmv36yrM5PLXHrynEKEEyc5YE0PdfccMvrE2Y=;
        b=SWJarbqBBFHiPWCrYUdPCysLjD4CHx5I5ox6xTlD8puj8u6CIUmdLhxeoNqF5kGGq4
         PiQrGVg6toZdaz6aKdgWzTnZ6nNlPxe8U46Hnu7MNmYx4/eYsMcvYAkwosx37MT4KkCW
         F2fsezvj/QIFF9FQucom6LNfVAO6goDLcPT8E6JLK0k901Waq+AwUx53+K9jyu10w5X7
         8XEJoJSVOGJPe+REkyREO8SriQdH9jpxB5Ji/55m5+YqyrJMLuqMEyynrKj3kH8oSkGV
         C0/pSCCN7r6rc8VBdiWf2tpDv1eW4+zum65W4/eo+difKzxVinP0F32zB/ap1rRsdn06
         3/xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747313954; x=1747918754;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Qawhlvmv36yrM5PLXHrynEKEEyc5YE0PdfccMvrE2Y=;
        b=BwkwATwx0mJ//30AyDJF7ElDskfLVwr0K0v7dMnqkI0E0yHGbzhmhgAK1ag5PaXtJ+
         PvjzZHExMi0KC/lcHRZlNhKB5dC18ZiUOuye8X9rzJANs1HtIeBDNLgWIbOnxfZ93Mcc
         jgsxJIBdXOmdaCpDbqRi73jo2xlTIxO9QRDardJquny+TVKrbgAwsuTwWvmmr1VhRJGC
         /xRMRGz8nKdE3RR0ocBpTwObW9V+NVMcN+ERYgVNB/DD8sATtwVvdfgEX6q4FNCR/FK4
         sHydocReRytfqsUL85W3tUCAewhbaVik2Tou8Ufwyx+49k/tToGY2bogexh1FN0N26Wx
         /xzg==
X-Forwarded-Encrypted: i=1; AJvYcCUVFExeIYiZNiWfNQ9u9clZSTBqE1A5NtdonguviJjP/t7P2S8lPbRQbwyNUkaWpMonXpqNIKmhUu8ecY8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxzOCkQXmN6yAWeBVkNHHkCm8rYpbwXyDUx9QeBRexLhUiRldD/
	Z1EBxylvgM0pNyo/Nyq0NuUIFVsi4tT2i/RaUFKwAxD03eDCI7fbpHILu+widAc=
X-Gm-Gg: ASbGnctDSHV8ihU4Y5UF2XN1u68iAi0PpuIiyftypXkliMFPEwjGxIGfudaDipDe6wr
	FnDkF2cUsbYUiacqazCA4Wy7TJ8txScRkPIIVLtrZ1AvK09Ngl2UhWlAv5qPktL7Ci/pex2rUBf
	J9egnL1Hzq2g4sA4xNOa/+m8EADFvxLZUuvlzAKz7DOZQULNMf2u53WGtKsP0jGo4A4HaRr+7Th
	pVafnrOIUeChlFnkT5A0sAoFGcUizuML+bc7iq1k2a0CPTO4IMDAVfD2gZllUIUHiASTxC4lMGO
	g74yhAFBj1SIZ2Z5F+8pDnBqgIW/HthyWzDknDCGLE53fD0bdicO3knprPhmZiiGqw==
X-Google-Smtp-Source: AGHT+IFyeqD0A0IScg3QZihC1XrEVTucJipRcuMxEvf1pQxV8DR8pNFyFAx+gn85sF514EVzZ/V3/Q==
X-Received: by 2002:a05:600c:3554:b0:442:e109:3032 with SMTP id 5b1f17b1804b1-442f970a9bfmr25956895e9.24.1747313953125;
        Thu, 15 May 2025 05:59:13 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:82b8:c32f:4d8c:199e])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-442f39e8578sm71180475e9.29.2025.05.15.05.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 05:59:12 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 =?utf-8?q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev
In-Reply-To: <20250404-kconfig-defaults-clk-v1-0-4d2df5603332@linaro.org>
References: <20250404-kconfig-defaults-clk-v1-0-4d2df5603332@linaro.org>
Subject: Re: (subset) [PATCH 0/5] clk: Do not enable by default during
 compile testing
Message-Id: <174731395227.3761659.8617180462546520115.b4-ty@baylibre.com>
Date: Thu, 15 May 2025 14:59:12 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

Applied to clk-meson (clk-meson-next), thanks!

[1/5] clk: meson: Do not enable by default during compile testing
      https://github.com/BayLibre/clk-meson/commit/0afce85ed26c

Best regards,
--
Jerome

