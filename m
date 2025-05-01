Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9183827605A
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 06:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746082163; cv=none; b=k/2/g7duUa/a9azI9UHtvS2oxpfhzCVYdFpwvxDFpvxeC+GsjlAbCxiKrKslf+nltoZ3h25HHr6JmPTgzCoVgPr054Gq1riZgyXWSDmn/IxA44vDoS4ED1e3HqyJSNUAjRVltp9jP5VjlQww78Vo49dSx9cERC7dPWmJr4Itdys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746082163; c=relaxed/simple;
	bh=Sh5t/bH2gJJPW7SbEZodCgPiVxpAzM0Pppe4K5oZ31c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EG52QzvMQ1bVVcrZafuSBWrIEBVnMzsi5t2NS0XGP1yzcSibKcstmyFcp7+/LPzgUQIXrHzT5yRV5h3VZJiBCJu3zmL1XAIDbmRyUuN/MiNXzOCgsu3ymLq1Pg3HwzjFs6+cUoaNfKi7gJflityzNIkB10V3I/6l74UKVrFpJSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=RLXEqPSF; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="RLXEqPSF"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ac345bd8e13so100838666b.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 23:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1746082158; x=1746686958; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0Igk6ayaj75+ghid1GHXFHByChbhFXicBE1h0kwGqpQ=;
        b=RLXEqPSFeuJs6GHFR1TPT5LivPP20JVWE8EeUN1wd8cixIjHzacyJ9R7aZPT15VXpS
         BX7fl3qfm9N6Fn/v1czQauA2EamEhQz3bXk+EnWGMGSmtYfnSRp9RtwbYfoz85ol7yap
         atjPER3TuFNWp6EE4ukwqBaSu2hQovnNUHrrE2HiAJeXEZmd+NbwVckBw3qD544gE6eL
         6D8kK2j5/p+GeRSaJ3Kgd6anQvD/8gHbf1d+HeIXQxURYO6GJydJJR7T6nbXULWBozte
         lgXXyOEFT58FJkEgAYPSSmd4dEX2Nj97hBUlHZWYqnWh2ZMUVkKoyHRCiuagmQh2/42Q
         3BoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746082158; x=1746686958;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0Igk6ayaj75+ghid1GHXFHByChbhFXicBE1h0kwGqpQ=;
        b=IEb5YiWToESuR3ikvnCTIDzwZ+y9vx3L5xo9MoMEu8PW9JHmLUSIexTUP5KPV3bwXL
         ukUvIxAX5BYVbG80z/s1bEOP4UXM1VdD9yBKEV5a96pbmLEJiyj9Yl3ndPVSht6git6e
         moLlwrlLdQsTytYCnQzcP/cigrQmPzmFV4a2i5rLybscCXq/ECc0l+DbDxuiX4fREODe
         v/OHdZYBIBPt+0Cv1BiDne4I3I/NGFlpxjy0Mf7hBcwNiNcbMDef2Wbu+pDaX5DPjz6+
         Z/9VsFAe0NXqerNTNnMSNm80VMHxjL2vVBJtkLGjDORtczxpP+L47kNKLxMelD7dAOZj
         hsHA==
X-Forwarded-Encrypted: i=1; AJvYcCV6X7YcyWBLtKcbT9mx6u+KMtpymTwYquRxhtsCZMk3bPZlAVzjIXOpe8hZyvr8pvuwkt9yylNYx6o3764=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNrNq0ebepiUxEZDPPZ0HIMiZun01R6EOvJKS6nqxGIfCfiaZn
	SMHSIielkZ8YArLx4oHP1mogKgVP6li/XoRezT3VTbyNp5Ancbm6+El1xew97Bs=
X-Gm-Gg: ASbGncs/+sb9rVpdzNVu/XfRB+18c+1F1QEtKlIoHonWPMV79NnNulPCugyRE51TJEG
	sWV0JfVveQErntDnj90QvLBoE1dGxg1nWAJAd+NutwSeLHmyo1HIYyzVWsBvh2N2QUlDZOh8Bph
	Jplvc6ssP1z74md/XsrA5Fc8d/ov7MXynyxNJvDa/YbYNDapGSyA/5F/aUuFpSLNmnSQMsnULYN
	2cZSutduKxvnWqG85HtQXIpZeyDpRci+9CTMeNmrihhMpNxThjjotEAeLHRrmg4S7QPSzrzhnT+
	Yvr81UOOSITkz0epfr1L3c3wA8SOgB+HVh/GXQq9dbz2Pmu26IEIxv+vOf9L63AMIYGV+yi0CrR
	iS38=
X-Google-Smtp-Source: AGHT+IGVxD0MSnxKGSW58BMIJjAYV2RjRFnNb0AvJCsbEYNmr3gmdyyW8NV4x2iCSwgQ93sstTrkzA==
X-Received: by 2002:a17:907:1c2a:b0:ac3:4139:9346 with SMTP id a640c23a62f3a-acedc552691mr545705466b.9.1746082158623;
        Wed, 30 Apr 2025 23:49:18 -0700 (PDT)
Received: from [100.64.0.4] (31-151-138-250.dynamic.upc.nl. [31.151.138.250])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ecf8cc1sm1005486066b.89.2025.04.30.23.49.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 23:49:18 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Thu, 01 May 2025 08:48:51 +0200
Subject: [PATCH v2 5/5] arm64: dts: qcom: sm7225-fairphone-fp4: Enable USB
 audio offload support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250501-fp4-usb-audio-offload-v2-5-30f4596281cd@fairphone.com>
References: <20250501-fp4-usb-audio-offload-v2-0-30f4596281cd@fairphone.com>
In-Reply-To: <20250501-fp4-usb-audio-offload-v2-0-30f4596281cd@fairphone.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>, 
 Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Wesley Cheng <quic_wcheng@quicinc.com>, 
 Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2

Enable USB audio offloading which allows to play audio via a USB-C
headset with lower power consumption and enabling some other features.

This can be used like the following:

  $ amixer -c0 cset name='USB_RX Audio Mixer MultiMedia1' On
  $ aplay --device=plughw:0,0 test.wav

Compared to regular playback to the USB sound card no xhci-hcd
interrupts appear during playback, instead the ADSP will be handling the
USB transfers.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sm6350.dtsi              |  3 ++
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts | 36 +++++++++++++++++++++++
 2 files changed, 39 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index 92a2f6e0c3d856eb2549a89509486979a7439cd8..864874472248dbdc5ab6483108bdb286afa77de5 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -2956,6 +2956,9 @@ wifi: wifi@18800000 {
 		};
 	};
 
+	sound: sound {
+	};
+
 	thermal-zones {
 		aoss0-thermal {
 			thermal-sensors = <&tsens0 0>;
diff --git a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
index 71e87ab929551b339216a5fa583833ed8661a606..60ad7884c635ec28a3706da506c16a78b3214265 100644
--- a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
+++ b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
@@ -19,6 +19,7 @@
 #include <dt-bindings/leds/common.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include <dt-bindings/sound/qcom,q6asm.h>
 #include <dt-bindings/usb/pd.h>
 #include "sm7225.dtsi"
 #include "pm6150l.dtsi"
@@ -955,6 +956,12 @@ channel@644 {
 	};
 };
 
+&q6asmdai {
+	dai@0 {
+		reg = <MSM_FRONTEND_DAI_MULTIMEDIA1>;
+	};
+};
+
 &qup_uart1_cts {
 	/*
 	 * Configure a bias-bus-hold on CTS to lower power
@@ -1023,6 +1030,35 @@ &sdhc_2 {
 	status = "okay";
 };
 
+&sound {
+	compatible = "fairphone,fp4-sndcard";
+	model = "Fairphone 4";
+
+	mm1-dai-link {
+		link-name = "MultiMedia1";
+
+		cpu {
+			sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA1>;
+		};
+	};
+
+	usb-dai-link {
+		link-name = "USB Playback";
+
+		codec {
+			sound-dai = <&q6usbdai USB_RX>;
+		};
+
+		cpu {
+			sound-dai = <&q6afedai USB_RX>;
+		};
+
+		platform {
+			sound-dai = <&q6routing>;
+		};
+	};
+};
+
 &tlmm {
 	gpio-reserved-ranges = <13 4>, <56 2>;
 

-- 
2.49.0

