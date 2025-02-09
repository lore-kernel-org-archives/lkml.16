Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDA9B1B415A
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 05:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739077647; cv=none; b=TYBhvD2hAeWHK+4YbnbsuuEiUF4GdYSvVVN2P+BseGtMh96mFpHPVTZpNXDsYA6mEVocktLFwQA1uNHICNvqpQ7Y4TzQ92dOaxjjA8tNJXKsM0awqUXjAMK/WB9jzzx3xyyZXGBKI512o/k8qStMicfj4jL8tHWKEcEAy2Yoy6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739077647; c=relaxed/simple;
	bh=rBkvGR/qHrfxPlnsg0QzXfiNTIC9RTO2ROzJ5dKz7zg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E4h9NxYkfL9Zxqvnn2lZOnji/Me8HvQ7gJRgNVkLKgMru4ZCy7MJGC/yLeKpGR83ai9tth22l0sPOvLVZT2V/NrPXim4pBUmE/qvJXbFekhi/T0urQ3JZdeEbFPkAWBsJsyt3CSncYwMPGbtPv4F98QjMl9FeeP8vNtNoCR3OAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aPzqkLMW; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aPzqkLMW"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5450622b325so739135e87.1
        for <linux-kernel@vger.kernel.org>; Sat, 08 Feb 2025 21:07:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739077644; x=1739682444; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EfNMfzUAvdO5axXrtOPa21BH0I19Ed6M3V+EZ2kcNQY=;
        b=aPzqkLMWbFX+7NFvOmEk2laOqFOFfeDjqCedQUpe2La/Ysrc9V08RAhrJ8NY22NYbV
         lgUrp8qss3uZjh2Pqgk+Oni9M7/s6l52Yji1bRmkgP/vTYUtbUJrNl/oPaL+nKlv1Iut
         1S92mWsas8hjc2FZpstSHE+iBzKXQiD1WrySs5pavDGsnH0ThULdY76s34TNG9bJzPNd
         pU1rs0KhY2CTNTVnQMi4kfOcVKk3cY3/niA8QB0s8lRXxoT/5Ug+NXJ08QzWDgDnRJFU
         zsTUeJqjIic7OxzKq5KdvHwE+7vye+DU4K02KbGZsKopWZuituIy/8fK/fdei9NNR1PO
         Tuhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739077644; x=1739682444;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EfNMfzUAvdO5axXrtOPa21BH0I19Ed6M3V+EZ2kcNQY=;
        b=NJtbuwGVE8oo4uTa75zbLFBREwDMYQqmVI8If6j1/xtmZeuOs3u4nCq//4WzOt/Ezs
         7tNu44+rFeu3i2/mtq4lNitY2jr6AZkiNrPoJuH3ZQBDG15nLr73ppORoFQe3pkLpG0c
         jxKEfxVJfjlnw6OcpWt7A2vLpa0ZyNjqQxn6BU3H470b81YVyUG7dfzI1vsQhwZe2/w1
         0eDG3RnKNhLuEeR7fUUHd6y7UIcFH7JzPE6n7ObIE25yjZIJDqUeFhBNJ9QYYiIqM2wz
         5xW/I8uRCSUqO6ubqTypnnQcjS/e9ugQe8tJTH36pqa42mXsr+1tIwBMJjQSgleMwZg7
         QPPA==
X-Forwarded-Encrypted: i=1; AJvYcCXU6JdiNBgv3EYa2apSDKx4xt+GFc1SbxKwJvkyqa6L7yVEKL8zQ98Q8HpnN+zaOq89giDL+nu/4sio/c4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxbhdNABacNIQ4yXQEtPzcfG4TEBpbtefs2oPUiXv5mbudcDuu
	GE1CsYjWQNvRVzKso2q3Z5dS33/s/PSgAxErt3dsRwckUdw5EFHZiGaQG0K5pFU=
X-Gm-Gg: ASbGncsTXADOjLEzn3Ck+SOcKaZHD1e5uEu2vk6w6YSGQjY9V58j501+SOtfz64NJnP
	CIep9YpAbJDb4HHPvCd+XxK7GLe+bdv9KjSYfnNQTMVw1VeMZNrQ2XFkqPGQP5pmInU222EqszN
	LILPB62AZIFSZL+KJK3jP/ZrnmU0lWwyWtxfSUDsCQ3Ze7+oFMhBns0X9wsNabVy4Ogf8EpM3Y2
	5PHAppE5sCYVdV2FzWXf+WHADLNV6TBHoktxARe/4F3MJ56ZT9RRH2R4Wh2xozsxM71+BbpgDDs
	ymHovekjddbr12gStBPtF+s=
X-Google-Smtp-Source: AGHT+IEAJIpGx/KtWJ3FoMRxqCJZCMQixEialyC+rYX1C/PQUXahOHBcURaFNniiUGHQYiTxLHEVSg==
X-Received: by 2002:ac2:568e:0:b0:543:e4a3:7c3d with SMTP id 2adb3069b0e04-54414aa8782mr2874988e87.29.1739077643911;
        Sat, 08 Feb 2025 21:07:23 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54506ef1733sm245576e87.1.2025.02.08.21.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 21:07:22 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 09 Feb 2025 07:05:00 +0200
Subject: [PATCH v4 16/16] ARM: dts: qcom: apq8064-ifc6410: drop HDMI HPD
 GPIO
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250209-fd-hdmi-hpd-v4-16-6224568ed87f@linaro.org>
References: <20250209-fd-hdmi-hpd-v4-0-6224568ed87f@linaro.org>
In-Reply-To: <20250209-fd-hdmi-hpd-v4-0-6224568ed87f@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=806;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=rBkvGR/qHrfxPlnsg0QzXfiNTIC9RTO2ROzJ5dKz7zg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnqDfkPKZGcgzKdMYQrmr8xg29SeVv5ZTbQNhMP
 Xm71FFkyTSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ6g35AAKCRCLPIo+Aiko
 1UN1B/9p99p14mAy2cJWH8bo5AHu/xitIDMYADBNYVdsUQXslx1MuCaXPHSz/9EQQ9j45ItPAmv
 EzCEf17MZ//D1/qHLqCjloL9Ltx37KTjBGPz1FUsmmbU8crIut7dokT0vvrXN6tGLdefXI/Hxuc
 awkE7CsVIlujLKcvm1MIvFQt1sbsJ9STP7ppIKasGV7yZiTxpCfT5SglZtHAbrupQBqNjuOhnWd
 3K8IniuWpKDQQBT71UqooHwEvF5Y9+OSbX8IlfDHj0Wp18urN40IFGX3Er+qj4JGg0EX+RWVWF7
 5mfvkADq0u6kX/boHk9kXmppgY4vT3pNzviaOXQ+R8XuVeKu
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

There is no need to specify separate HPD gpio for the HDMI block. Use
built-in HPD in order to detect if the monitor is plugged or not.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom/qcom-apq8064-ifc6410.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064-ifc6410.dts b/arch/arm/boot/dts/qcom/qcom-apq8064-ifc6410.dts
index b3ff8010b14985c55c580e0083a5c8ea23c03962..717bfd74edb75b278eaf5ab37954fcede1f7ffb0 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8064-ifc6410.dts
+++ b/arch/arm/boot/dts/qcom/qcom-apq8064-ifc6410.dts
@@ -138,7 +138,6 @@ &gsbi7_serial {
 
 &hdmi {
 	core-vdda-supply = <&pm8921_hdmi_switch>;
-	hpd-gpios = <&tlmm_pinmux 72 GPIO_ACTIVE_HIGH>;
 	status = "okay";
 };
 

-- 
2.39.5

