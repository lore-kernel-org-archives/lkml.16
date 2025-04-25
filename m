Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2CF2230997
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 07:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745564938; cv=none; b=gS6ovC5hX9q2xYKmUK9JiWXxSeO79+ByBPk29/9ai6IGw9yAGcQLlV6GxFKnkMrVjLTZ59RDnqOi3qoPKs+KzEjeuvOor54xaphsvnWguY7CYZ+bPZy/QM1hY5S/jUspLIjUT4jHAZ83p25Tsrw5AZolpTwTkEPHeKk23WptyYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745564938; c=relaxed/simple;
	bh=Fdj99F15NrodmliHWNzqnIaLNDZ9brmDoSEheiXAMlQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GVn3cX2/HJNUAohV4UsyBWf59YKGkCqHLj2BFKgr61BwnlxGNCvWTE3vGmG9tSqZJiLxn+IM0KqrqYZu+FDqgx4fnVT6SyWAeonu0m9hZmS8F8R+0C6vcGOIE8e2VUTyTuDZBhe03VjSo/x/ioDnqpMYNrT6ElYFnNPYZHOiCTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=Fe4XRcHX; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="Fe4XRcHX"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43cfa7e7f54so12309405e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 00:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1745564934; x=1746169734; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vypambs+vDzLekBB8IzM17TAuFHn0wmPd4bpg5X3/QI=;
        b=Fe4XRcHXWMTwmhtC6z8zpKW+zDzlBEGKcVobEE/yrz973VErnxHirWdTfYYvUEU/gY
         zHW+xM9IrAhOEr9vBWoc85a8dWkscwfCx2dj8Vq2a0lwBPwc9jXW7dX1mVyLAipobVKV
         NSPH7AVf1FPA7F12unKGm+1NxtkVs6bkSwXTtKpDNCWOG5gr4wvQKsMlGqpVBeGjMM8t
         nCqP4QFStDOX+sZGihVkIm5r4MJhp3fThLjstaw6wwt/w+1r2vi4Dg+vGJM8GEJouZMt
         U0lXiaEAXerDtMqZvxIiFd5rAAH496amvEcMJrg45SzdDcjZaTJ/MB04u3lG/tNmvkMa
         WO+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745564934; x=1746169734;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vypambs+vDzLekBB8IzM17TAuFHn0wmPd4bpg5X3/QI=;
        b=GfiFxt0LLhOA4zB6dKiq0cA4Hg48SIS/OyHRohgnigPU3cjXBWV9NrG1Ci6ibsG0wF
         v9HYFZzZhRTzsGCbZv3H3WTHRjTzCv3n5cffODhAx+M0fkYXwQkslJppPedYVHrkLJYb
         1EOhusktCbc4e4i+xfgWwIPtgynn9CsOS7AmtqHEetflGyEJ7jxMdF12KhiKO3wdSD0q
         XTwq9EI3a8nFSYKYPPRjcM6L2UcZmIwEIQFaIBypDD+6PaBXDF+wJdpYE/X1eecRTaT3
         vlDSmbZARBiyHpuE+MnnOR/a8AWY/bNWUv4/2TNd3/ALaAnNU7RB+vYIueq92d4aghg3
         itAA==
X-Forwarded-Encrypted: i=1; AJvYcCVxIyHIkpA4ijgKMqU1uKb7/9bs1LJw0N4pLxiGGAxdVjNcIKTNhOKL1HaNEnCK40sfxiyrPCOHmVRaitw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZPPfdnZ/AvP48Qwt/76lBQ4J08ucT5QUCwxjonHDIqsdH60YB
	/OhO2yNrRDtFuUaZ+iWuwwW+m5ZoIOKdy+u2bjyLFkTQI33VkDB9K9d3dQQiKTs=
X-Gm-Gg: ASbGncu25OJ15++roCZiXVhh95utvtKc7vkHpsWBSodHeUWaTmow62ycxpdObkNBale
	+G1TUU/dP3rvJO1TZbFIXD5kQ5TeutbKgr0pwV+hoEgjWGkai9jNBGkNuSIkntC9QPoRRRH9Qzt
	4BAc5SdumPM+OwvVWq1mOSVUA1tpU9/g4qXf7FYqjWSJSb2cJYTOyrZ22K5gT/0cz9miFmoVUQT
	m1XAhPxYNB5C2r2DJ9nuemkIDsGJ+LuLLaASbOb6Ep3NsrFliy2iEL4G+o5FCNv+fl+3oBBhFXk
	EqVY+IFiog4TjoSvHbm3WU9Lqy2V9u8wXCr8jVqzhP/DVkShkeQRUwybuhT5COnW8A5cJcvbRCQ
	JVFSLrGDGADdLDZYMwKvpyM/LNmIvOm7j3dd6ABmOJaIt1N8hin9eosH4
X-Google-Smtp-Source: AGHT+IGS9YIDgXntlFmkZIWZPmJJOfUr4x+N3jhTyetRa2YTZOmZBiwusqcoLISyjopO1bgF6+q5sg==
X-Received: by 2002:a05:600c:55c7:b0:43b:4829:8067 with SMTP id 5b1f17b1804b1-4409c4615e0mr38383615e9.6.1745564933891;
        Fri, 25 Apr 2025 00:08:53 -0700 (PDT)
Received: from [100.64.0.4] (2a02-8388-6584-6400-d322-7350-96d2-429d.cable.dynamic.v6.surfer.at. [2a02:8388:6584:6400:d322:7350:96d2:429d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2ad112sm46202735e9.24.2025.04.25.00.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 00:08:53 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 25 Apr 2025 09:08:13 +0200
Subject: [PATCH v3 2/4] arm64: dts: qcom: qcm6490-fairphone-fp5: Add
 PTN36502 redriver
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-fp5-pmic-glink-dp-v3-2-cc9c2aeb42fb@fairphone.com>
References: <20250425-fp5-pmic-glink-dp-v3-0-cc9c2aeb42fb@fairphone.com>
In-Reply-To: <20250425-fp5-pmic-glink-dp-v3-0-cc9c2aeb42fb@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-usb@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2

Add a node for the "Type-C USB 3.1 Gen 1 and DisplayPort v1.2 combo
redriver" found on this device.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 35 +++++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
index 0f1c83822f66f95b05d851a5d28b418ff048b09d..ea9f5517e8a083e37c4b7432322bd6d18fea84a5 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
@@ -166,6 +166,23 @@ vreg_oled_vci: regulator-oled-vci {
 		regulator-boot-on;
 	};
 
+	vreg_usb_redrive_1v8: regulator-usb-redrive-1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "USB_REDRIVE_1V8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+
+		gpio = <&tlmm 61 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		vin-supply = <&vreg_bob>;
+
+		regulator-boot-on;
+
+		pinctrl-0 = <&usb_redrive_1v8_en_default>;
+		pinctrl-names = "default";
+	};
+
 	reserved-memory {
 		cont_splash_mem: cont-splash@e1000000 {
 			reg = <0x0 0xe1000000 0x0 0x2300000>;
@@ -747,7 +764,15 @@ &i2c2 {
 &i2c4 {
 	status = "okay";
 
-	/* PTN36502 USB redriver @ 1a */
+	typec-mux@1a {
+		compatible = "nxp,ptn36502";
+		reg = <0x1a>;
+
+		vdd18-supply = <&vreg_usb_redrive_1v8>;
+
+		retimer-switch;
+		orientation-switch;
+	};
 };
 
 &i2c9 {
@@ -1182,6 +1207,14 @@ sw_ctrl_default: sw-ctrl-default-state {
 		function = "gpio";
 		bias-pull-down;
 	};
+
+	usb_redrive_1v8_en_default: usb-redrive-1v8-en-default-state {
+		pins = "gpio61";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+		output-high;
+	};
 };
 
 &uart5 {

-- 
2.49.0

