Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3FB51D63C6
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 20:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746565066; cv=none; b=eFMaIFjlyJN4JmGY+3mIhwn5Km8ASZrRHdXL7JppBTiDdklCJ/36tLIpfEGr1sMrVIPDLIL9i/rUddGn1PMSoIN4zvGxG0pVdrXsefBL1AgbhSDnOBeljW+yFeYEDNF9+WeUJDBZ3rjDJ4wNPYvskes7VsoOXpX5/oucAkYQYmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746565066; c=relaxed/simple;
	bh=2jU8lWsHMh83BJDd6uFLy3YOaP/2xztJxNAHsH0fugM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i9XXXlDp29yHOEj03KwqnnfGr/jBoAdAiiPnrCEHHd/KEiCtVE93R03ul7rbv9DFtqDl9Ckc6NJZvc49My3wForVEkX63UeU986+BgcmFowQD9FaQr2sg9pMWPyEttjR5fh/xOZP8xahQ5ZtxekWExPb31QCcfvIjw4dqmvHfSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vyc0hNqY; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vyc0hNqY"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-39c0dfad22aso4036535f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 13:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746565063; x=1747169863; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1NZVMe0POaYy6U35iIgm7DP89EqIz3yo46LCC0chDBE=;
        b=vyc0hNqYVomWHCn6VWXwQ85OlVIKWG4/4nAD0jP7u/dTdSqz8P9DSFbL3hpfmihWCQ
         R0vpp7n+tB37OXUbYK1Qsk2UtHap7YgPRhnw0xcrJ6DNlJ4qgSIDMFZHfwB4HBTfIQKV
         Wal1EUUDsyWXZXbxm896etzarcpUKXHEWQm5BkdK/x2xvEpa4hBfcwzR35vg78pUDzUw
         WzTr3e/BI5wPWN31ZMTnspqU6iN55T/zVYB5/6NK93gq2EIvLiCJnj5V9cI300y7l4rC
         O8gnhN5b+mJDArCFbNObAAjCvYrI4WcQvDYf5hGk4RI90O09kJU5vwgs7DS5NI79jOSq
         mGhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746565063; x=1747169863;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1NZVMe0POaYy6U35iIgm7DP89EqIz3yo46LCC0chDBE=;
        b=s78L4NTvLo6K9phLBkjZnvyoVjPaNWryI2q4jy9ztKTn+eMM/q4zPpHWIy485Epmwr
         R7SX8FvftW6ZQvNHfdihm9K8DyH61HWrp69TxbhsUL7F3D3+ypO0hlbk9AZtEzIvYf9U
         v3vTwIM9HV67hxpknvbObQuKK2uUOUgQGCII8WAs00VHpMtb45UXiz06FfAHBmHfPKQ3
         Vl1q8X0OdriPd/EN2FxyAt+0hYWxG03TpGnoRJFINJ/uuZsn8gehzdx1z9vRczW0ECtS
         EbN1DdO5Yt9b3Z6UccJ/Sb0kdHf6NZn4U3vCeO2bGO5NuXFx0q32wGW6Xt0nQDci5klR
         FIBQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7njrJmT4o9AGFNaOHLc16D3n+oImdsyGYkMxayAVvR1odOboqDT1Ke3HXUGQN85gk5WRS2aTUmAawwj0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2mgz5cTd6pl71qJRabaEVKJ+yN1Y66BI5WiVtsq33sR6iungZ
	rL6zSjn+VCFM+5yZsGQNZUh/Mlx/75wt5ZBuzrVw+f+P9Ybn7M8Eum4+QcNPOjQ=
X-Gm-Gg: ASbGncuWhTkxdWQ0w2bmaS1mgjrRorUBxXBMolpxreVys2UMafscIxlX3vlDzxOUczB
	kky3RxPIsKxQS/NlBzIgjOGUuYLhZl9vJvfSsqMZhI9+xYGoA3shevh7b/gJ6P0ego0rbv6tQKS
	uGz8vibW000dvMpL7cVScYE4730BwMQdMySE0Wgzl3+QkYf8gp1PTZ3zkEa0FN3cfjepp4rm/ft
	nH/1NBhbgZqi6zgOXPe/aFxgaLqw+lm0XLHoVcTq9K6LtN10b7s/cT6iygnWiDaqst7yg5RStir
	o0T6nyXCAz4PWMbE21ESGMsj0DoKQNG1x38VKuw8TuksBt/JbSmkgmZ+5WHr4RxP0I8gx/U=
X-Google-Smtp-Source: AGHT+IE2LgXfchPINe7qYmZMcscjZaeuhqsUBxUUbkHDGnmYsw1mvqK78ndM7S/Odra7ZlA/qDu8LA==
X-Received: by 2002:a05:6000:200d:b0:3a0:7fe4:df6a with SMTP id ffacd0b85a97d-3a0b4a4a407mr683409f8f.56.1746565063049;
        Tue, 06 May 2025 13:57:43 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([145.224.65.147])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099b17022sm14671826f8f.89.2025.05.06.13.57.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 13:57:42 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 06 May 2025 21:57:29 +0100
Subject: [PATCH v4 3/5] MAINTAINERS: Add google,gs101-pmu-intr-gen.yaml
 binding file
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v4-3-9f64a2657316@linaro.org>
References: <20250506-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v4-0-9f64a2657316@linaro.org>
In-Reply-To: <20250506-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v4-0-9f64a2657316@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 tudor.ambarus@linaro.org, andre.draszik@linaro.org, willmcvicker@google.com, 
 kernel-team@android.com, Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=799;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=2jU8lWsHMh83BJDd6uFLy3YOaP/2xztJxNAHsH0fugM=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBoGne+uDVpWbiPtqvC8l54wAMhmu86vnsHamOKF
 xynba4y/G+JAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaBp3vgAKCRDO6LjWAjRy
 ui6AD/9p2LRq/9GlyZv5epsvsb1bVZNUP2tffJOJkP08VSkQ13IgvNpnnUatcND5PjHvOGQWbSs
 Ou/lL8vNTUemmdKiMlL173V6ATSTlzR1RhM1rwITk13e0bBF+MvkiT+AQhnN9/Wgm9XTOBiXzQz
 EY42gyYKH90td6EKzphaP4x5uDSxE5Zm60BX3W0CtzIphaupOR9f7xGXvm6e7e+Fs7FcxUHHAkX
 pmiFJmtaA6LHAjlBNmdtcNuoOjENA7i2zPgfSUh2nmqrkIv4XXHphtrDvXYo7+1N09cx0YS3HHj
 39aorwUyHokekqFog/Cl5UATOvqcoW3ATJGnXONwb3jCxlcAiKW5dGchzKc2v8AUkz0mg57bOdY
 F4vUzCNYyOj247R9NCKtHBnKSIy0z0pvqPLDxuoCDc+17jN/HfwXYmSNz4YxsqslRj5t2zmzdXz
 ZsN59gWSON0vdXmgzwEAk549m2UVDIiqjRGtawXD67lZz0SNfzk8KIB5Xu/1+zn9La4TC0dfBS6
 0sXlJjk//R4pPIBocwWh8BcWXztXuFEPjiMlNdL0AhvMrYSVAah0kRBIkbFXPZe+BQZiwV84urf
 409Qg39G8bFzVQPE+wkNYS3oe2U88n0wZ9NumG6CX0LuJB4RDdnNn1Ppa5quUrjr2HD0EGfnPvS
 Yo9ZfoOUWQrhA+A==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA

Add the newly added google,gs101-pmu-intr-gen.yaml file to the
Tensor section.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index b2c3be5f6131432647dd01f22bbf4bf1c8bde9e6..5b2ec4c2023f39a3dd532ac61f0075a0a1555411 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10118,6 +10118,7 @@ L:	linux-samsung-soc@vger.kernel.org
 S:	Maintained
 C:	irc://irc.oftc.net/pixel6-kernel-dev
 F:	Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
+F:	Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml
 F:	arch/arm64/boot/dts/exynos/google/
 F:	drivers/clk/samsung/clk-gs101.c
 F:	drivers/phy/samsung/phy-gs101-ufs.c

-- 
2.49.0.967.g6a0df3ecc3-goog

