Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 787EC27932B
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 13:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744982048; cv=none; b=ecFxF1UMg5MxufpfER6fAcztafleN4aP2OhGGrrsWl1BirLXcPwL7rmBX4WU9xCXiGSaXsmV29TBqsY2ZWqzza+JOf3yuV0G+OB7J5TIMbH9Z7vf0K8ozkR4XVgGbAAZzK2MntWbzm1DAN89m4RGc8hUdg71uc27Tj5R4Gij6/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744982048; c=relaxed/simple;
	bh=7W8nlNtWeSVZAoWHnHqSB5kTMZ8gnqpruhrnUubBDVA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZHAQ05ZfBU4r2PWnvNyehQQ9Ti6GQcgmaO6jOOIeg5dFdxeIkrJ3/7K1CjMjWJqeEWvO4+G/JPixNoEjMrnxv1LPDsf3v379XIFrPmmZ6VvgBoFkh5755RK51sanewH04jUyrS5rOvOk4nxGwu2v8fkTFkpyeumQzstm9UGc2D0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=eAkgn5Q9; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="eAkgn5Q9"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ac25d2b2354so286378866b.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 06:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1744982044; x=1745586844; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s2opD8nWNn1a16aqwefGGL4ApPA8i/bb2N5C33dKCms=;
        b=eAkgn5Q9ye2e2Vof3H9Zxxsv0LeJP9fAAGs5laxIOv4OUFi2fx5QCACZYRZ1xc7FAR
         k9PGZtfBTFYAiOll6XNKqJqFtxIJJ8nfg20KnHUzemZ48ZTyZ/ITWGFqZEW7bG2Rm4Gj
         Kya4WBhcSeOcT8pyAJzSVEYMCke/7v7UycUmKbAaHwTjM4VJbYHLOF+amZEsl6YHKTym
         7LSOFXya/ftVqNcl5JkgOjDvpyvTYtvbXHRKAhtmyoYhQJk201GswqzfnsBg+5MFovGA
         2c7rvIbaTYvG+N3BYQkhdutCzPodXdJbDreqYZDY7ehxvMJzWD694U6cWKz9VuFPt53L
         iYZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744982044; x=1745586844;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s2opD8nWNn1a16aqwefGGL4ApPA8i/bb2N5C33dKCms=;
        b=A8SsHHO5iIbSSemFmexSYIZgg0I2bffy2a5Ly37/tkZl1zfGeEo2TaY5dmnyEHHL2u
         B3qg5J4q9+MyEpjb4JkAsuHm2uJR8z1BtZxqQEbC6Mk2Eg08wzn9O32NYly54ESN2u0E
         cWdWkO02rQKrPPfi5sBys5GAiSGlvy1h4f0Hc0Q9OBHSmZsmb+ExUvi1ft/qEbVyBDDg
         qHl/GTUjty91FiNa+UEuKUbaI6MoWCn7p3UaVoOUhsyERPEc1FTIuamM3RPgA0fwvLz6
         sTmtEsfNT8UcjWMFQp6n8BSrcx+O5C+PgCKtsN4L2Cz84+/qsRA0KAw1pmXhCoHDN8z7
         j+wg==
X-Forwarded-Encrypted: i=1; AJvYcCWnP90bZpshkOe3w/r6lANv24fQE64lPoMTVbusddEdj0QGfpeTgNXoy2Llxw3CBYsHbpDemqK0OTplXiY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6tX3K2ZwVr7B/Okcpa/44s/C40QzIPcYKo/MGg/4P6Do6WX3Z
	/bRFNa0vZ9R+grtxocY+aWYKPwcnIB4/NwUeXmaT1mQrNyVfWTNOTuO0mYHCRxU=
X-Gm-Gg: ASbGncvHjMihlRnG9/YsfMvRLELWeH6ND7f5ix17FpZMuUIKJ0/VSdJQy/ErRVcFmfE
	Z+eC/F/lm3OAfxn0XupKL7l1v3mW2AeBG9FS1oc/nJgiCzKvUbXYa5QU9OPmHQZ0ZvUQUigqb+7
	l29+N5AhT3vpurlKHN0GGe+hdB58wxPXyB0V3GbuIul2Omg7FJhDLoEw9tzpENkLEZlur7NAEsm
	SopMF0ilvFiX7cfzozJHA9Tax0vFH+eGE0eaLN5QomUaossJz8eJrLrCII64MQGS26yw0btvuD8
	VxsGgJZcK4NKR95t4XnoLhRJwHFFPideW0tgHUIufVzDsul+9cLQnTXjyOJtAjXI7AjR4IVnJnZ
	SM2fzJKX1qXIAPQ==
X-Google-Smtp-Source: AGHT+IFTPwO4j2zMKdap8t+bRIhg7rN6LnVakCV5EvwVUc0rb5eLZEGy0q9hARUTa5SmeCSVugZM8A==
X-Received: by 2002:a17:907:96a4:b0:abf:4708:8644 with SMTP id a640c23a62f3a-acb74d85693mr230821666b.43.1744982043795;
        Fri, 18 Apr 2025 06:14:03 -0700 (PDT)
Received: from [100.64.0.4] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ef41605sm115901966b.124.2025.04.18.06.14.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 06:14:03 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 18 Apr 2025 15:13:46 +0200
Subject: [PATCH v2 5/5] arm64: dts: qcom: qcm6490-fairphone-fp5: Add
 DisplayPort sound support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250418-fp5-dp-sound-v2-5-05d65f084b05@fairphone.com>
References: <20250418-fp5-dp-sound-v2-0-05d65f084b05@fairphone.com>
In-Reply-To: <20250418-fp5-dp-sound-v2-0-05d65f084b05@fairphone.com>
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
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2

Add the required nodes for sound playback via a connected external
display (DisplayPort over USB-C).

In user space just the following route needs to be set (e.g. using
ALSA UCM):

  amixer -c0 cset name='DISPLAY_PORT_RX Audio Mixer MultiMedia1' 1

Afterwards one can play audio on the MultiMedia1 sound device, e.g.:

  aplay -D plughw:0,0 test.wav

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

