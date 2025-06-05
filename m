Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8A29D2FB
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 15:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749138137; cv=none; b=jfQ30gW6EMpkAepyjYPHyqYdGHdWsWBI9V0KS+XGWLHMKZdnTNGBbM0CpEy8IlavnKJUbvdaRuG/OTgtzrdkEoPQCcmxKshLNSHal8U0PRKIx1+AGo7+lqS3Y5XQ3MTKp1a/JNJDOrbUqM2f4Vo7h7twTelUrl1eogaPS17CW7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749138137; c=relaxed/simple;
	bh=CGZ2voXzpuqv5BDA6GbB9RzudNSofXOj956vYmHtZYU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GOLFoKNPrYOfcUGdYfXDVLRrOV9tViFc8lbrQFff8WYmmRkLbtREBl6+o1DuDFKQ8kbvKgCFUX0WUPJ306tMyMLphaajsFuOkMFCKQ5c+yJwsdJAEgxf1QZY6cNtR8deKDrqpRY9geEFIsTWLO9K3cSNz6ZGxmZZBxPCXKL8knU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WBqKYBjo; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WBqKYBjo"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a4e749d7b2so153299f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 08:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749138134; x=1749742934; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tVdDAyLthEulzKQwcDXevtinu2TUgGTGa8O6iSAk/yI=;
        b=WBqKYBjoKZ6wbP17aFmWmgx8zMTXWnESTjM/89uDLglifOpN2xxSJvN3leSrhI8Fvi
         Sg/lvSuvDdyaGMVGj81WS8BnUxxyUDiMFirq2reIeiPWnuRVS3FOKsyRIJH8DOdLAIE1
         9CeqJANR3+VXEt4lLJT/CsczV+uMDWO3DNAD6/1gdB3f4xBaAc2t3cjeRADgxfmMFVdX
         AwZu88jfDfE28IxTlzZOmelAlRwZs2i0HRud/D2ocK+ROzowk9S+2eYifkpy3QQ4UGo5
         0iuEdtNlvIaY0KpudbTd+9sY+wGJgtSowvQPi4dgyIOn/sPD/TF0IVvwTR9LZW/HPoB2
         sp6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749138134; x=1749742934;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tVdDAyLthEulzKQwcDXevtinu2TUgGTGa8O6iSAk/yI=;
        b=JZTP+tPGnaZhjFMNYA9vTxxY9jJkcV7XIswQfxJCqOlg46Sm8S3OHS7frP6E9bvRu/
         EHG6wuaC7CT9pkDafE91vkTFdZxcxXdE9BgNRRjiDx+bJJIAW3BjRBY52YaNRVVR9EOB
         na5+YpsqVbxND41BylbPwvqzVqdZnWG9uCIb9m0jUWZ+d6Lc90RjDDFZKRyjAm19nb4H
         IbBrAfcJ/IelqBLRpm9fI2IyRZ1P775rnwBZxLz22EOxvjlHA6lsC8L9lmkZR6HOQpao
         +qKbwO9kK4czjToT329xCqN23KM6ENEDPKMPWqkcsU/ZfU3OEgsvklpQILgEzZHV/auo
         8Ikw==
X-Forwarded-Encrypted: i=1; AJvYcCUz3HB86VWz/ikCic2/yOXljpNM9aUYeJWG6VBZ6TfwBObhj/68fnCdZuKyA0U4QaYeVRoXOLSvraofR6o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/6SkLTUxn8DNFwMTpPa9HIAMfnSgwcZcW3ld+38CmDgjbl+Om
	Pl2wx+XBMhORgO341mKbVX1skSOOgHnDbYKmqGXobr37pV8vsogHb9QGdU5YdPH/GtQ=
X-Gm-Gg: ASbGncurnRGFaJJqwXdeC6JvxYO2mKFcgfEeJUHyIQ2/Z9cQZFPCNi2ijj9uXwClx5o
	bzmofvln/zP61mbm/wv5PzKh9gDepizPZ+4+CszIuTRxLGcs+2kETzvuP2TB2OBj48jFYIsph+r
	vWGeucBbueFRbUUfpcARDeeUf8e/A1p5J//BebuUylkZvo4nm84gIaTkvKTscWrw3sDHtvSsUgE
	XpLoxEKFm3ASdQUh0Hj9jiA2JKkTBH4mXo/TxouWmii42kMhrWYLiU9SgiaFvbS+aiernF9+PWk
	gls971JusP3LsXBMFUK1V9kCHdy/CL/4AK05vFADDE4WvXTAz4hd4a2xx9Nqfw==
X-Google-Smtp-Source: AGHT+IGB8zTp32oYZZKnFR48cFxcYSk+3m3Vnmwti62tsdDjgd7xtVgNTgLfDutXGVzb9zNCCp91Gg==
X-Received: by 2002:a05:6000:2584:b0:3a3:71fb:7903 with SMTP id ffacd0b85a97d-3a51d96a1c9mr2349476f8f.10.1749138133759;
        Thu, 05 Jun 2025 08:42:13 -0700 (PDT)
Received: from kuoka.. ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4f00971fasm24478343f8f.77.2025.06.05.08.42.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 08:42:13 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] arm64: defconfig: Enable camcc and videocc on Qualcomm SM8450+
Date: Thu,  5 Jun 2025 17:42:08 +0200
Message-ID: <20250605154207.141224-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1066; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=CGZ2voXzpuqv5BDA6GbB9RzudNSofXOj956vYmHtZYU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoQbrP0MkLBrJusurDZXu7SzvMY+vWTEKuGU3wz
 wI+XkSqD7GJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaEG6zwAKCRDBN2bmhouD
 17pdD/9V7wk3b2lrT0Qe1evuJIXYVc/IdidpN1nCYzjuzjxPz23EK96jOuuxge/TmZEeXoU3gtJ
 fyoXZ5D8WwmkRv7xNpVDAvBkXTrKjnRURz1NOdL70YO2X0hSrGKUR8YTJhwP5MVDx2byldP2o18
 KnpRNx9koqU8ca0JLyilAtN7fdq0W7iGhSbqaIxXDWHud396bYdOjtOhYWAnQWphX4Mym0DGejM
 X6BotoX/RCWDI5/NrkMyPPmhz+NDe4ubc13/k/IuPrUNO7opSE17lnKsPIO7wV1kbD1AWqkYz/7
 hLWKdYy1lOXPheyXWW14BFB8JezBH/EWliImfiOgkIkpS0XIXMGIxGtp4OvAABRTtVB3PiaCnQF
 6+lVoxNm16MmJabVVVN+QERrQgicvag3fQvPGZKnUM5+e5U55ksfD3+yG+wW7O2lNXw7erHuvHp
 GrMSTD0bi2hpMaXwhmeCIhNQuCoaWffKY1FKNTaAgt4wS29vgVCmZ38WH5JaQwOg50sszdP4reW
 xcaLKGfReFY2SA90GP5BI45juioEb5p1H/QJ725wmLPOTjTuSe7ddfRLVGzVqeHA7/jdTq94q1S
 +WZiqORwCBFWpwK+gTZq4r0/6W4Bc4fOagLuqXTX2PKqi6e5b8qjShL4I40FeEZZZM76FwiPEVX w/Xr1Z2j3a57WCQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Enable the drivers for camera clock controllers on Qualcomm SM8550 and
SM8650 SoC (enabled in all DTS files like SM8550-HDK or SM8650-HDK) and
video clock controllers on Qualcomm SM8450 SoC (enabled in SM8450-HDK
DTS).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 62d3c87858e1..2ffa590b962f 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1404,6 +1404,8 @@ CONFIG_SDM_DISPCC_845=y
 CONFIG_SDM_LPASSCC_845=m
 CONFIG_SDX_GCC_75=y
 CONFIG_SM_CAMCC_8250=m
+CONFIG_SM_CAMCC_8550=m
+CONFIG_SM_CAMCC_8650=m
 CONFIG_SM_DISPCC_6115=m
 CONFIG_SM_DISPCC_8250=y
 CONFIG_SM_DISPCC_8450=m
@@ -1431,6 +1433,7 @@ CONFIG_SM_VIDEOCC_8250=y
 CONFIG_SM_VIDEOCC_8550=m
 CONFIG_QCOM_HFPLL=y
 CONFIG_CLK_GFM_LPASS_SM8250=m
+CONFIG_SM_VIDEOCC_8450=m
 CONFIG_CLK_RCAR_USB2_CLOCK_SEL=y
 CONFIG_CLK_RENESAS_VBATTB=m
 CONFIG_HWSPINLOCK=y
-- 
2.45.2

