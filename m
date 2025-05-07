Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B63227574
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 08:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746604933; cv=none; b=D8z7RDIY+zuDXmD9FcqqBO8JkL7lStNgtXzVSHpXlTtfsWqHSMCJ0+xVAlEocSPRGkWLAg8GZQ+7U6Z5nU/ApSgjBaI7I8H6dLw+itb24slGIQzRWdubpT6/ncD2dVnK4nJL298Zo5kFaF6kBhKITCs03nAdA7PbgHqraJX2Tv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746604933; c=relaxed/simple;
	bh=9du/cqVmLABi3S4H7ZzYui0a7J0RxPnHiR8v0eg+GN0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TlAQDI8mE5k6tjcWf9Z7M0rg1eNyHp40pjmfCLI56wiueZM1ZGV8ZEyIxKGczzLfa7JaaS6L2nazkQtt4+XXVfRjrbm+2KeNDK3KigeWCi3AlyAoDbndI4fUYk4ME6Xb6CQ9VYWNESdtDNnaDiEssmezkN0SQrFaMOMMf7Qx0wU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=aH27DY0v; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="aH27DY0v"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ace98258d4dso974107966b.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 01:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1746604929; x=1747209729; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1WF9R1PkrWxK/cwLXU/35vaxB2tRI8rlJl2KnNgRvug=;
        b=aH27DY0voTohBr8HRChz6S0/3+fyIkQNuErhKJqhM3NksMajkZlNOGHF37fKoce01q
         kfriDLkgQODwg1mMWqo5eK8LbdLAt+Olk6e8kOwX2xUdWf6Y1qW0SWgbvHCg409tYSxX
         0VUs2E+y8K4nwDHbyuYlnyM0utpsW44jWenAR4HkLc4FSbbr+4+BEukuvprHywOJ0Snk
         lsPssuBeUkPACY3HsjPPUH1YmeFKQAkG2Jgr5l6Hgtl7khiTi63b2rGMRIkg8GEFhSNA
         /A25oLwoGcx5X6UK35DzQV5tP/1cKxMvC8L4EQRzROFV8y7iFDOfgH40qL22jwNCeVw+
         kkLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746604929; x=1747209729;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1WF9R1PkrWxK/cwLXU/35vaxB2tRI8rlJl2KnNgRvug=;
        b=khrZidH/Otqs1zzrHJMvVCxclBPqAqt/AMowFAOKzq6jvRvUBF5sIdUwu9NJIsu6yM
         oj+lPIcQBsG8GmH83NRf1QhS0GSiNHUqnThzpH00mhLgzuDtMHJbbA1pEWPL16jMZF4k
         EODsAwEWE87VLyxNBtVLwq1r4s4OKDwuKFgWHOZA6AvH6DXWf/Qp7lbQfXhaK11c8hcD
         BkhKri8V4pi5SgkrSOqKlbUK52twzIrJWyGxjNCUnZjgTmvMqHGj7IKOQ1YaWZ3XsXP7
         d7/VRPteYzIPmciXlyE/q+APKFZ5kumRx08pSbsOXZ68A83eiEQ+zU1Hug7D5DLgoV38
         OBIg==
X-Forwarded-Encrypted: i=1; AJvYcCVYZcZJ1/ePdssg71chFaFED0FJiLO8OqYxY+WEzPf7QiRFZnbxD+ZpS8F124wAR6bxNBqR7Zvt1zS9aew=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzi/pH7MZEG7tCAuG8SKikHK/kOZfycBf91mavvdHGI9lxWPenW
	v7w9xtWItD0WDCMdhVTN0oJq6z2Ky78jEbny9EFwHYWrbmhWRFBVkfjacCUK7g0=
X-Gm-Gg: ASbGncsVDPi4GUPgETuXPdKkQggxO8wePgpFAxDf1sArIzzO1dUqWGwA5EiPhEwIwug
	ZU/eu9hY+Da2omZtw1/N8vvLN2CReVZJIcTHN7yexBfCEyvF2GQL3/yV9yrCpGh2Zs/EcwixUOy
	jhQ2fqZsv83jm6l9fapt+H7ucIKkAUJ6RSMdLH3YP/YSnuet8S32mjyNUeOMImySyZK57MtolkR
	vNsWhUV5gwhIBIV/1YmuqoeMMfCJ5kwjKV8bXJ0+r0nhy0Is6JkpczdfLK53jtSJ2VDAZ4Bw2UC
	7z3iYUBqWlQLT+Oz3FO/atuZnj2/d16Hxai1p4Su1KIolxEdL+I932vUkNYKNJCHXN887H+QuPf
	iBxm5saQIwmX15Q==
X-Google-Smtp-Source: AGHT+IHag0H2cbbPyO4b5Fnqc17Ebpqc1RQXUqG6LtKmBXIShvnF4nzFMo2lTa0qFSCUZEOEH+300A==
X-Received: by 2002:a17:907:d48f:b0:ad1:e7ed:c1c5 with SMTP id a640c23a62f3a-ad1e8d5f6c8mr200591666b.59.1746604929014;
        Wed, 07 May 2025 01:02:09 -0700 (PDT)
Received: from [100.64.0.4] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1894c0310sm855236066b.88.2025.05.07.01.02.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 01:02:08 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 07 May 2025 10:01:41 +0200
Subject: [PATCH v4 5/5] arm64: dts: qcom: qcm6490-fairphone-fp5: Add
 DisplayPort sound support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250507-fp5-dp-sound-v4-5-4098e918a29e@fairphone.com>
References: <20250507-fp5-dp-sound-v4-0-4098e918a29e@fairphone.com>
In-Reply-To: <20250507-fp5-dp-sound-v4-0-4098e918a29e@fairphone.com>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, 
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2

Add the required nodes for sound playback via a connected external
display (DisplayPort over USB-C).

In user space just the following route needs to be set (e.g. using
ALSA UCM):

  amixer -c0 cset name='DISPLAY_PORT_RX Audio Mixer MultiMedia1' 1

Afterwards one can play audio on the MultiMedia1 sound device, e.g.:

  aplay -D plughw:0,0 test.wav

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
index 9e8f9fb57c4723a24704a8239a86c6081910916b..e115b6a52b299ef663ccfb614785f8f89091f39d 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
@@ -14,6 +14,8 @@
 #include <dt-bindings/leds/common.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include <dt-bindings/sound/qcom,q6asm.h>
+#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
 #include "sc7280.dtsi"
 #include "pm7250b.dtsi"
 #include "pm7325.dtsi"
@@ -1147,6 +1149,35 @@ &sdhc_2 {
 	status = "okay";
 };
 
+&sound {
+	compatible = "fairphone,fp5-sndcard";
+	model = "Fairphone 5";
+
+	mm1-dai-link {
+		link-name = "MultiMedia1";
+
+		cpu {
+			sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA1>;
+		};
+	};
+
+	displayport-rx-dai-link {
+		link-name = "DisplayPort Playback";
+
+		codec {
+			sound-dai = <&mdss_dp>;
+		};
+
+		cpu {
+			sound-dai = <&q6afedai DISPLAY_PORT_RX>;
+		};
+
+		platform {
+			sound-dai = <&q6routing>;
+		};
+	};
+};
+
 &spi13 {
 	status = "okay";
 

-- 
2.49.0

