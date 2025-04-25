Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 943862356CD
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 08:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745568461; cv=none; b=UNxdqckVwnzjGKvyP53oKu7bULQQzkVMSQfL4nZO5uHvn3YM7qtixMdOqYBedn6zp7RTOUqxzHPP864uau6xBW1GwbjtrEdTfr9xFtMS/88yc4ojac9xOa+UBM2v2WV9I6Qf0SZ6p3FqZPFvnGTNH6zsi9ms1CISM3xY23ubyUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745568461; c=relaxed/simple;
	bh=9du/cqVmLABi3S4H7ZzYui0a7J0RxPnHiR8v0eg+GN0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YXNE8q7NUT9YB15mf2ZA2j1R+fUy/PAUUEMOxJoJEINkJl77Ulgiqa3DM3ZclJdc/Fe5mKDOlG7pCNZ6bzO6OhYdZ53lSS/kTplK1CuZ6bFUpaIYv6JdyQ1EZGk+1Bck5qiaEDqJ38DeiOWSL4+mXc5WVULuN7YRQYYH2QsaGqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=06u9WB11; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="06u9WB11"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43d0359b1fcso12959155e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 01:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1745568458; x=1746173258; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1WF9R1PkrWxK/cwLXU/35vaxB2tRI8rlJl2KnNgRvug=;
        b=06u9WB11yeFjOEXvumQCtZa/Y7L34FubxjwlIs7sJ9qQA7jRuQGjcwFNqy3IWih0j6
         NyFjgg7M6LhuhZyxB65WpfGFYwjFVg8iYv7lbyfImyn/NUjiob2KXrnRiceo7s5YOlDP
         YuW38CSglFy/P5j0C8r71cmN+cquvJ/t/jDXWnnZC9QhxlyHkURT6knOhC6Zr43Z8MXk
         i231yFBWlfikmtuWGbtPb6YknEdWO3rmTZZHjM88WHmc5RH+xOJwE5whZXvkkMjah27V
         JQIdSN2NTI8oxLvOpNt2Jot1IdoPfNBbuSOhxfhD+zfNRUq/dRn1VbvPTLfmV4xYu1nh
         qpDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745568458; x=1746173258;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1WF9R1PkrWxK/cwLXU/35vaxB2tRI8rlJl2KnNgRvug=;
        b=GYSBdcg8aGoK1RddWVzKRi+Gi80Ao4tREUjfKA+a7k51vWxIoDIfgW4ou/nAszovTM
         La0Ge89romp++hA9IVQCkoWjhtNgRTqWfWJTajhJ568Y+uuzHUJk6XkOylv1celjyP74
         piOeYSb1ZMa5hZSXhOyEw9zZRjPDBgkt9wGBX03l1RREaofmIS0CGpuX+RMMyvo6VYgZ
         YEZIBuywGuzwsILp4HTwnec7gXzFnyCAlQykASGcogFVBpH5vnvpPUQOUU/Y66sfqzq/
         UOkH2vbPvo5Lq3/UCGxjetm1fDwP8PwBUdlNgCesmqyyQsYiqoSYx5MxU5hD3fO/u3al
         V8fg==
X-Forwarded-Encrypted: i=1; AJvYcCUgtc5D1AgHLb0Mnogw/IxBLAd1JEQWGoJTNWGouO8rJzzZZBrBoSywemsE7HNS23eYeYYy5nxj2IJLOZs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzi7rRzm72CJSSKOfT3HdnKjkOry0Cqe+Aq98XjUybALCFzM7Xa
	Xk7KoD/bmTxaIIa6BjmbZrf4l1ImugAan9Ei1X3RKRzYTCEwS6YlCLNyLpv/QmLbgbhiqSjRYJP
	3
X-Gm-Gg: ASbGncvMHcWn0NckvU9GoIsisBWC07BrYpvhXUWGaTjfPqBNSVMwb9ScgT07GAm8Uwm
	xPBsovnwpKtPGy66ICC59T44BNNdA/H/6Fkna9TNjPmnsKoy+sXEEJJ5n2eIOTXNB9kVPaVRbn6
	I+9ctWSEF4xSKxQflkPI+OxImDp3Btd4g6+85tLzKrFtK3lGkJ4luL3uXBwc3gDo/ob41gbugmr
	EbxQ7vqEqQeZrm2n2zt6ErDLkzxXIu3EZOHXap5HEGpvGEJ4624QGfOazteyeoUVzOeS2r0snuL
	CJ+xz3eiriLyK62Jps0k8rK1JDv+5gUrwffGCDFwhatZc86D+iZDRFeMcT1cEISfftkHpOdPWWU
	eMe1zuGw1n8/e23QxRA52PdPm+uO36eK83T8bgp+IIHaosIe+MYvfmsFA
X-Google-Smtp-Source: AGHT+IG/sz31Wny+TtyIaDzEEdUt0YMeO0mUdD924acJQ9OoByTsHsI0o1wsRu2TPR3UpEE0kePClQ==
X-Received: by 2002:a05:600c:58d7:b0:43d:fa5f:7d04 with SMTP id 5b1f17b1804b1-4409c52a44dmr43791425e9.16.1745568457579;
        Fri, 25 Apr 2025 01:07:37 -0700 (PDT)
Received: from [100.64.0.4] (2a02-8388-6584-6400-d322-7350-96d2-429d.cable.dynamic.v6.surfer.at. [2a02:8388:6584:6400:d322:7350:96d2:429d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e461casm1593513f8f.74.2025.04.25.01.07.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 01:07:37 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 25 Apr 2025 10:07:29 +0200
Subject: [PATCH v3 5/5] arm64: dts: qcom: qcm6490-fairphone-fp5: Add
 DisplayPort sound support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-fp5-dp-sound-v3-5-7cb45180091b@fairphone.com>
References: <20250425-fp5-dp-sound-v3-0-7cb45180091b@fairphone.com>
In-Reply-To: <20250425-fp5-dp-sound-v3-0-7cb45180091b@fairphone.com>
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

