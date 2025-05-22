Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF54F29ACCE
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 17:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747935673; cv=none; b=bf//+A6iip6vNVmeRAPbp/768yThf+qRFQO2PCP/Zkz3mHmPVMgkrSVeFdU4KqGycMuOEOQtjFUwNMsrDB/t5P4eD4eVzmQ2+LRHJ9r5XuefZpGasrpAEEPDhsJMaCsGrUuEZXmbw2EM8CWvZxx3mNtKyGSWz2riF9iBydBtznQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747935673; c=relaxed/simple;
	bh=KEPTMakCA32PkhOCrneqwQED+KPaxi3ID2lG6vlGRmg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d7b4ZOURyq1qCItcYmChhN2OG2F8ALz/9o66rpdAistI1/kexRy+JCcMXQEJAfurwt8tw7pCUPBZPxHP3Wt+7XESusUxiJ/ljNb9VZKAtIn/SmrJGKVaE5mln9qYp1q+2twFBupOCWy4dkAeQNdb5SXYjGt9Xg2DxJGlB8Tj7aI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vh6eOja6; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vh6eOja6"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a35c894313so5636081f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 10:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747935665; x=1748540465; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b6zBILNgMTTruPAKW6TCbU3LqqO81pSI/MBmJZg4XxA=;
        b=vh6eOja6Pyx0N1mL7J5ArhNCbPg6RCcMCYbJEoiyyjvPI9cheM9vyZ2jmrBvBqKikP
         4zssXMDJ+pe4wiqXvYAws8tfKAix/8J23/l/urxF8Zf/Darxu+wQH6rpNkhzJy/buiZu
         PKndfdpYUHmCf42fQ1Za8OQ3eWbmc99/aDe1j1P/lTfYy5HS5GFC8lIkxafRw/RKX6ox
         h20bB29XG58Qy7LSzhzOaw4PVY1FpOPODj5AfYxzMo6hPTstKZEDP1ODIQ3f5CJy1tf8
         D4snMholPimtH+GOu8+BKka2vI8iDtkW9XR5hwd83+GD+a8siEEO2MR9KzHKxDNdQSGa
         ueeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747935665; x=1748540465;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b6zBILNgMTTruPAKW6TCbU3LqqO81pSI/MBmJZg4XxA=;
        b=IiCW+S92lfUakKUPfaqrscKiB35COk/XpwUQ3G0e3KF2FYNJShsFzUW8R+ZtMeJnjr
         HmI/psA378POyamK5g8OyohN846M5bZd1fxkWaRHOW6axIyG/nDG9AYBqwhzOwY+tFq7
         3fMlOGE1ukMRKOljQ3MKbf1aFpGtlfxkf3L9M20xLpx/hiWlfahI1s0BgOpyRlyaJNZJ
         v7vWAGs1VPSBQZcrbtgJ9vLcgNsf8es4hRdEA237BSz/L/uinbc/rvKhEfpClXiKd5fk
         v4ouwYoBe1e9fD36Hgn//bHDqegRb3ccIdGJiU3hPCpPPNdpB9Y3eeNx0rMLhP2QIdxd
         KFPw==
X-Forwarded-Encrypted: i=1; AJvYcCWZ2ptrGeRstsV0W8rG7O1Qtnc9pDxDjXv3IxxtH8GCMXiVVcvvkAdf2C+HUTMvcHGXEdaSD8bqxv9LDIE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0l9cdC9sylokTC1oQD0VHMrDiFAfvr81t805Mhh8ByikNjBn8
	2L6DfYBM6FS1sHQMtF4YHMkWSN24BmypKegXPCaAr9K7nO0lYtNuU73B6mZpQDGZpds=
X-Gm-Gg: ASbGncumHSbQnojtt4HNNrBVDnExirkePDSH4ltox0mGSJ3pNqjWNV3qG+Om0zPVJ2/
	bHflWJPEobdlOxhpKehLl8GtYzq17UHZWwj9p9kuMni2EMI9AIqWq6PiEs4A57FDFIWUTRpg4kV
	9h1DiExOFWPC+5MfzI+htLdJD9+R0J8UYtgBwQ+63OghET7s2jJKtvUCd0t8eQlA5ZOf77LzM+C
	UpMRcjjngvuEqiHGXaJvfUb77kwIG219qNcZceMtBZv9wnQei5CRHQYiediSXQhd5NgabKhrpYs
	Mkd//x/YHWPRb9qYL/4oyFY5xAuBcA6drzjlSNmv3muorPG8Frn+byB9bl+k8JJcglzQMQ==
X-Google-Smtp-Source: AGHT+IEF5HaUFQwCelNdRVlj1OZcIfPLTd/t+FpobYKsjTVhFlb/PhZuoCsEx3xvOKWYBUnoGfdrcw==
X-Received: by 2002:a05:6000:184d:b0:3a0:b84c:52b4 with SMTP id ffacd0b85a97d-3a35c809250mr25368671f8f.10.1747935665397;
        Thu, 22 May 2025 10:41:05 -0700 (PDT)
Received: from orion.home ([2a02:c7c:7213:c700:6c33:c245:91e5:a9f4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f7bae847sm109563195e9.36.2025.05.22.10.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 10:41:04 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Thu, 22 May 2025 18:41:00 +0100
Subject: [PATCH v3 10/12] arm64: dts: qcom: qrb4210-rb2: enable wsa881x
 amplifier
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-rb2_audio_v3-v3-10-9eeb08cab9dc@linaro.org>
References: <20250522-rb2_audio_v3-v3-0-9eeb08cab9dc@linaro.org>
In-Reply-To: <20250522-rb2_audio_v3-v3-0-9eeb08cab9dc@linaro.org>
To: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>, 
 linux-sound@vger.kernel.org
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.14.2

One WSA881X amplifier is connected on QRB4210 RB2 board
hence only mono speaker is supported. This amplifier is set
to work in analog mode only. Also add required powerdown
pin/gpio.

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
index 6bce63720cfffd8e0e619937fb1f365cbbbcb283..4b878e585227ee6b3b362108be96aad99acba21d 100644
--- a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
+++ b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
@@ -270,6 +270,24 @@ zap-shader {
 	};
 };
 
+&i2c1 {
+	clock-frequency = <400000>;
+	status = "okay";
+
+	wsa881x: amplifier@f {
+		compatible = "qcom,wsa8815";
+		reg = <0x0f>;
+		pinctrl-0 = <&wsa_en_active>;
+		pinctrl-names = "default";
+		clocks = <&q6afecc LPASS_CLK_ID_MCLK_2 LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+		powerdown-gpios = <&lpass_tlmm 16 GPIO_ACTIVE_LOW>;
+		mclk-gpios = <&lpass_tlmm 18 GPIO_ACTIVE_HIGH>;
+		sound-name-prefix = "SpkrMono";
+		#sound-dai-cells = <0>;
+		#thermal-sensor-cells = <0>;
+	};
+};
+
 &i2c2_gpio {
 	clock-frequency = <400000>;
 	status = "okay";
@@ -736,6 +754,14 @@ wcd_reset_n: wcd-reset-n-state {
 		drive-strength = <16>;
 		output-high;
 	};
+
+	wsa_en_active: wsa-en-active-state {
+		pins = "gpio106";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+		output-high;
+	};
 };
 
 &uart3 {

-- 
2.47.2

