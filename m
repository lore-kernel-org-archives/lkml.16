Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17C1D242D90
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 09:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749634477; cv=none; b=VyUm+bZWbax8j2NxKoXwwWN2pHQkn+ifxLCHkdD0P71Di32HAcB9M4xNq6KaWrc2rom1HQIJPpfpA4Qk85pnbWq4MTtRsQ1NByxqGbkc3eu3iGx4uFPbsOOR+3kZtXC7qif9Nm8qluBGWuAsBvV3apugDTefseXoCLQsF5qJM9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749634477; c=relaxed/simple;
	bh=JRh4yWQSKvPb+HTPm3KU+z0OTAcK+vDeUqT7eLU7d7E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=goJaBshPVMv/m0hHRACJNC2nDAJetICVUWvgwj5iih1lT8puEEnGM+I72Vte9a0BnJiL8hYzy7oiwEeyiutDx6bPpKRUl/YuWO9nu5dRDrveN1TEd4I2sCVWxi/ZilD+a81weC05VzuUlVME6OO0B1HWMseLAEvPPtNDn0uoYoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RIbrROf2; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RIbrROf2"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a507e88b0aso5773547f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 02:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749634474; x=1750239274; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=umjNWPKDERjTwunqlhctbYZ5OjrmC9Gy7QVgvFKys+c=;
        b=RIbrROf2fvWfWIAX0B2WMEi3bCl0s8v0iaia9XJCYBey+AnGF8EizYBbgtx1k3sYQU
         Zmsadauk0E4kiqUIGQISVrW55tF1CgiVecx65M0X5PTbH1auN/ECA3C37N6ERYEwgnR4
         4VQWfOwTRT7KJi/qn5savJcIQ7gLeb+BTizbwPKpI1iBLZclFwHWWecSSZCNT/a7sUrX
         E/5H4ge3NaX40cTzf72XhXxpE7BhXw4mM+KzuO2C/eDL7Nxg78Mc+zH/ddYJWNpitE00
         aL6pJgtnh98L2tWY2CymZ3xRff5cDkwUm2RyOdwGCTyv7yFoXWi7YDKODgd0TXAOcrIp
         XEgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749634474; x=1750239274;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=umjNWPKDERjTwunqlhctbYZ5OjrmC9Gy7QVgvFKys+c=;
        b=i29ZM4pzFhxvyxr9oW7Xs2STimpFaNqvubxOsHVUw37dYX1TLmyExvPTx28yjqj8uI
         XHxiCpLXjSVXkZZIlLss97CFEn9ldkkxr57uYX02OJyaMVBKtD1Ui1MmOaJo4pu9U+bh
         34/Bxq+Sg40N/Sa1QQWfa62F9jwapxVeDkaon2mVl/eZLqGORh2DCxF9SnfSkX5PpyuJ
         dAiNGshS7ro/i8jyrPr/haE4uwQi9i3Ob28dl79S8rDl3gFq9ZTT4mTFGZSOQNORD1Du
         1PgtD2jasZkA2iNhjr/LxhA69pnbDGGwBhKUJbSuTebA0maLkiaNuK2ywccfl5qVyp5V
         D8hA==
X-Forwarded-Encrypted: i=1; AJvYcCUQzFMffTdZvxXZWOhezW5xwfejZWVakiHxv6lp25Z6hOEvxdPyMTTRc//q80pogLrk1grf1nH3a6jTh3Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1Nv5a7b5tpCTnbrus9riraNFRo03aZPQIemOfTjQYA9zUgOZw
	SW9xek+BCWAUFEaDAuY4A4214OCXCLuf3ACIcOUizG7m2TgC7ABXHMh9/CWN7dmcFf4=
X-Gm-Gg: ASbGncvYajb1e0VHNrvQv0PtF26sxXaqwGBRaIIj5KkolmEi0NLWoXV9oTLiL5f91Sd
	8Wj8l0j5LiPR/jbIMN72CpEVgJ/kCEaFYeGQDhLIR++kXVdS6W1AKzaT7rAvyOHJ08WVmMzQiYg
	wQRLe5HBTB7Xar+2MA40FDjVarJNRc3s6w2OUEMSKawS8J71u4OWQLv6xKq8o6chqzzQpWhNDVb
	yxNzKcn76A6AJZ66qd5GJrkILXCiYUfADwjmFir3lgbvD/RWFlQYDJy4Nulab3+g1b9ljVAAJVB
	Ower7fXAM7VwrXZIaIwp6Sz8dK49kSGYrtwSbZ7cjEt+n4hcLgR2mFSdIq1uaykKk9OwGY8alcw
	d+L58Ru8wzcOnJo0=
X-Google-Smtp-Source: AGHT+IEWBMj7CqwS07MNQkBH5I2Kfcy9sAeVsKYwFR/3Yu7E4iKy8d8DQwqF6l9GtrYs6FgzlssFCA==
X-Received: by 2002:a05:6000:2913:b0:3a3:6e85:a529 with SMTP id ffacd0b85a97d-3a558af7c26mr1878681f8f.51.1749634474379;
        Wed, 11 Jun 2025 02:34:34 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([145.224.65.90])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453251a2303sm15467005e9.31.2025.06.11.02.34.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 02:34:33 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 11 Jun 2025 10:34:25 +0100
Subject: [PATCH v2 1/2] arm64: dts: exynos: gs101: Add 'local-timer-stop'
 to cpuidle nodes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-gs101-cpuidle-v2-1-4fa811ec404d@linaro.org>
References: <20250611-gs101-cpuidle-v2-0-4fa811ec404d@linaro.org>
In-Reply-To: <20250611-gs101-cpuidle-v2-0-4fa811ec404d@linaro.org>
To: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: William Mcvicker <willmcvicker@google.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel-team@android.com, Peter Griffin <peter.griffin@linaro.org>, 
 Will Deacon <willdeacon@google.com>, 
 Youngmin Nam <youngmin.nam@samsung.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2031;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=GNkE/x3QELPf9uEv5AeKZxVXHxNGOdHNzMbUcWU+Scg=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBoSU2k/uEPXjihPn+w3dlTSEkJlfoWeDSKU0p9w
 37LXIXg2GqJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaElNpAAKCRDO6LjWAjRy
 uoFuD/4rGwT+igTL4ZuLmclGc7CRg4Sw/1TwTnyN/BTh71f9GewP9YV0B5cusbH9f98FQClTs3t
 wlhpRQ5saF4lj4s9lSZqT9xYZvQ3Hh4gEBANrlSHI9jnXEFC9JNHy3JquCOrca1+a42gelFj9sb
 Gwu8TyFvQAepHFY2wcimsvIge+tM2W30YChXX3EPhlIrCLyqS1d5FwrI7j+1mt/OQpPBTaoKqFU
 ysYc9R9aFw6gnrpcAMNEH1Bvn5AhE60ANyd+o31h1vsELt8qaXTZF9GLhX3H9kDN8wowQnEg3MX
 iWjNvc4j7U4jLJ6RgQHVuk/jy0KodAYRcG4LcygKwimHECJFP8KYpg/SKV80OC1rSm6hWTL3PlZ
 AOFlU121+clnRJpOrm0BF9qIqDCqiAg/cO2V/X1stE7AoGqwTpEg0Df4zhhtDS3Zmvpw77XlsYT
 xxt41j0W2Q9AtOtn2qzPZ18SKm5mgWJA1xpYqxolsUIowr5acU7awSS58TA2RNoT9LizOZira5S
 sUQLhrud89K8X86RnjbzXCu+fmNwUFxJ711+rPE2rblTKwO7YakhcPKGHIUQyFo3ehSfGYMnmcr
 YbgwwmBbfsaChKEWGs8WHBP8caa8+CcpJpodG/ZfdNCpFsm3R1o6l3gak+Ohm2qCH/WG2bN3ctV
 fCxBW9dBst6tT8Q==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA

From: Will Deacon <willdeacon@google.com>

In preparation for switching to the architected timer as the primary
clockevents device, mark the cpuidle nodes with the 'local-timer-stop'
property to indicate that an alternative clockevents device must be
used for waking up from the "c2" idle state.

Signed-off-by: Will Deacon <willdeacon@google.com>
[Original commit from https://android.googlesource.com/kernel/gs/+/a896fd98638047989513d05556faebd28a62b27c]
Signed-off-by: Will McVicker <willmcvicker@google.com>
Reviewed-by: Youngmin Nam <youngmin.nam@samsung.com>
Tested-by: Youngmin Nam <youngmin.nam@samsung.com>
Fixes: ea89fdf24fd9 ("arm64: dts: exynos: google: Add initial Google gs101 SoC support")
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index 48c691fd0a3ae430b5d66b402610d23b72b144d7..94aa0ffb9a9760c58818c0417001fd187b048ea8 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -155,6 +155,7 @@ ananke_cpu_sleep: cpu-ananke-sleep {
 				idle-state-name = "c2";
 				compatible = "arm,idle-state";
 				arm,psci-suspend-param = <0x0010000>;
+				local-timer-stop;
 				entry-latency-us = <70>;
 				exit-latency-us = <160>;
 				min-residency-us = <2000>;
@@ -164,6 +165,7 @@ enyo_cpu_sleep: cpu-enyo-sleep {
 				idle-state-name = "c2";
 				compatible = "arm,idle-state";
 				arm,psci-suspend-param = <0x0010000>;
+				local-timer-stop;
 				entry-latency-us = <150>;
 				exit-latency-us = <190>;
 				min-residency-us = <2500>;
@@ -173,6 +175,7 @@ hera_cpu_sleep: cpu-hera-sleep {
 				idle-state-name = "c2";
 				compatible = "arm,idle-state";
 				arm,psci-suspend-param = <0x0010000>;
+				local-timer-stop;
 				entry-latency-us = <235>;
 				exit-latency-us = <220>;
 				min-residency-us = <3500>;

-- 
2.50.0.rc1.591.g9c95f17f64-goog

