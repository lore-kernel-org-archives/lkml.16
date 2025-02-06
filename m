Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D599322DFB3
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 13:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738847303; cv=none; b=lI4rk5Yz1OB0hanRLaJzOjlNMcVt7rf4hnthX7aj1qoF0jLmq9wfmBQ0TtlQSwK+oFg7PUzPRvtLlVSE90kVLS5Ird7DYf8Ad+vcXPzRN/173CfksY+nHZkZi/VYbY4X6n6D5D5QEaNNSRewv2Ejd2CpY798z6OZaFaEAYZtRKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738847303; c=relaxed/simple;
	bh=g6CYlgIlCCDTKUM/OG+ZQtKIr6j1sM2JrhXAeW4MFQI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JJkLlp0eEhowapwJkwxABGsq/C97gpTTHhALSYWHa8ld1rqXVUtomC78zOz7BS96APAbsdYKPNwVeHNhwXhDXjgJUxikjQSFK/gi8EZhSpKZvwyastVgmvWeU3YSuWQZMNIYa4vbgpy0eg1BXp1V3PXC+rzjulFgZtN5gycHKxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dBGxZTMD; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dBGxZTMD"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5dcef821092so1001479a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 05:08:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738847300; x=1739452100; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sDAg+ppQjoLROQ6tgZmSgyH+iG6RB5+F1jMAwfLcm78=;
        b=dBGxZTMDMDZ5FnAIbPi3/45HoEQGBa54OegsADxddHG+PuhgwsX7Y5YwaLu60L3TVC
         zVJwVEXrtNHU51Wa8ulDC31IjNQ45ZCTTvVAD3tdtRRxHnBMWAraVH6iBZ5VFxIECqOT
         LO3oY1JMcoWrC8WVCqx7ks6ODRnR1S+mCE/A/yLtDF2TCfmT0WyPi6wb7qAlY6+3c1we
         FI63XGb0oAGb/PZ2N8ROmQ1zHPbsGeTjjT9tE998yQIwUeBGdhf3VlX29dhmjKaOgygm
         u9qadk/mDlkNws+6/hZNI0Z0e2ZcaWZe7GKCUWmfpUS/bmOnCJuhDLNtcrONKPiQbIN1
         Retg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738847300; x=1739452100;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sDAg+ppQjoLROQ6tgZmSgyH+iG6RB5+F1jMAwfLcm78=;
        b=YEaBrteLE2k1bUBfh777iiGiVit7x3/OfM6sXmSuGcdJKIxn0NyrF0XYn3VHha7f5a
         os438+iZdIEPD5MeSSenwI9c6rP132HKycWZYScAwhlVOR5v/tgtwML2Yrqw7K2Nx+80
         vpjCd+yKRH8tjIvbnxhwh9rFtvvTKW133xlY5tGM288F5skht1l+365LjNwrx/yCtxaF
         4+PkDPEskV2FiGDQKEic6Zgy4oh6W/alPiatGwfR1id4WjyDNmmuSkbdBCz+JDnyiRqv
         ph8rrbhyEbKD4oejsfw1Jj0eVcD9OT3GZ/GbIjWBZbANU1HlUgF/ZsR2ESeBAY+yiKlF
         HdAw==
X-Forwarded-Encrypted: i=1; AJvYcCWoxPB9bM8YtbMATC30mPQ0TOr5jCdp5wsoT0JGRQ2jftDjswgNddKBbIHg7W3AKrm99pfVh5gQzvLA7MU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwlWhetxWq7I3WJbcbAAcIvavdYfgaEj4+Rjge4iyAhcaAfXOHD
	oBS/mm9NoyDJew3t4UQsc7GgwUezKRqUrMlMMoVT/ybbtt/+hE7u0m3F/b8GPgI=
X-Gm-Gg: ASbGncvF2dOy5mvuRFtRVDanVuAjrWPJJjx+pid6U2+T0FBDdpu3FqvtnE0Bd3q1JT8
	ql5o6C5MnHvyxk5mDHnDRijF7vqUYzZOvaZ28/5q2CHouXTE3BeXP0Lm/fECF416hBAOYC1o+Pg
	l1DPvciYkSPETI+x9xxM9EP0djlgyhLgpDu9fetcH/tRbQzzvCSWC2uQnn+tLzIsfRXRO/UpnhU
	vaj5x+B+3Eului330fVYn/+DN3qbRtkSRQ/S445JQKet0a6bsuiPujLj07K5M08DtJF74c38YsR
	awS8pT105TdpaLqavs2IIWGsHXKqkaBYOtepWnSdTNORcpd6laPjhfbCStddgXvMEx+G5lOvrls
	=
X-Google-Smtp-Source: AGHT+IFTAdVpqgZ0wqgMByKwDevPfkkbqJL1+kBcqsh/Cv6cjwQ8nQLxo1utspkD+w2738TsWHLVKA==
X-Received: by 2002:a05:6402:520d:b0:5dc:d34f:a315 with SMTP id 4fb4d7f45d1cf-5dcdb729597mr7450061a12.15.1738847300001;
        Thu, 06 Feb 2025 05:08:20 -0800 (PST)
Received: from puffmais.c.googlers.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dcf1b73f8csm830235a12.8.2025.02.06.05.08.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 05:08:19 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 06 Feb 2025 13:08:18 +0000
Subject: [PATCH 1/3] arm64: dts: exynos: gs101: drop explicit regmap from
 reboot nodes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250206-gs101-renppt-dts-v1-1-cdfe993fb3c5@linaro.org>
References: <20250206-gs101-renppt-dts-v1-0-cdfe993fb3c5@linaro.org>
In-Reply-To: <20250206-gs101-renppt-dts-v1-0-cdfe993fb3c5@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0

The regmap property for syscon-poweroff and syscon-reboot is unneeded
here because the poweroff and reboot nodes are children of syscon
already. It also is deprecated.

We can just drop it to simplify the DT.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index 813f96089578..e78dcd506a5c 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -1400,14 +1400,12 @@ pmu_system_controller: system-controller@17460000 {
 
 			poweroff: syscon-poweroff {
 				compatible = "syscon-poweroff";
-				regmap = <&pmu_system_controller>;
 				offset = <0x3e9c>; /* PAD_CTRL_PWR_HOLD */
 				mask = <0x100>; /* reset value */
 			};
 
 			reboot: syscon-reboot {
 				compatible = "syscon-reboot";
-				regmap = <&pmu_system_controller>;
 				offset = <0x3a00>; /* SYSTEM_CONFIGURATION */
 				mask = <0x2>; /* SWRESET_SYSTEM */
 				value = <0x2>; /* reset value */

-- 
2.48.1.362.g079036d154-goog

