Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE1122FF33
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 07:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745564939; cv=none; b=DA5Lg4ZdW3tD06UhKaeGnlzHAP3X5yf/oNLYGpMsh79AWS5XasojQf8jXD4rZ60lPucYkjwKQFKMlVNuhogqKIu9D7harRnPHc3O5PXcTvCsjV5lTer1FwLo2ITrtG4xHjm07/SZ1uqNJOSR28unkDBjuJ2d28jGCBHOOtAOzjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745564939; c=relaxed/simple;
	bh=LA7q9pHIp9WcS0ADH7ddcSsLNvm3BotUh4LJ/goiaag=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UwHrvNwnLxFoi0jy/ezdlmZ6Fpo/g1w/9FEclzrnGhqveRPZcSE5e6cB4R0i4O/HDoS4nZbUCYfPKpNrsUvBOmbN0xbAJr/5P74w2HEfgCR4Mvbz+JZwENNt1JY0Iwy2EQTs5YaeB4eJiRtmV9Vze0lcobXRhUOtdCAKd5U/U1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=XCoVsl5Z; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="XCoVsl5Z"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43d04dc73b7so16787005e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 00:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1745564935; x=1746169735; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mm0mORpqXwGhjKCx6UTWDuYwmgBU3yr6fMoZERP6FVU=;
        b=XCoVsl5ZxXwuomrxsqaEHsivgCge0RZPjrPu23jrVlGpFiC/k86I+zPjAHowiux/5L
         5QvX4wtz/hrjEY4FSXtIftAWc6lmn3FVySpCHbeHMnSX723/np7uYB1Ymdk7pPGImEf6
         hIuRh7g0iUXvvn7rn5iKawAOGQsVQukJYDnp5qr3eqvoXaW7faDlKNMla+PT9mbvu3ln
         G7LxInQQnBN/5+zAQDz3j+JYY9P55SZQyv+48ctbym9iH7XhAb8n5OnakM6DRCYGUOS0
         WP+j6fHLhZXb6qOK/XvpFg26VAtoiq8tKy2RZgxee7NQxJeFCfqLkOVzbN7N7DNQWReI
         /TJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745564935; x=1746169735;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mm0mORpqXwGhjKCx6UTWDuYwmgBU3yr6fMoZERP6FVU=;
        b=ZI2ZfRHjxsZjUXJxSg8LL5XM/lgIFIRcYwSgW7bq8DJcy9xZgWnSJxf8nL3w5qTnEU
         CN3xkAk7WxlbDY+vblIe081HY/9EeqgtaL+9RuS6fy+Dl8ulzNVaFJA+fQC9dSYL/01w
         ZoYD0bjKiWIW9ZjqEcqaVpoW+a+BA/RBRIU4o4qxjB1/LBiGKu4t7qXb9ABrH9tqiyl8
         vwVfyQQEJoxxu7g/atuOmh3ijDkZv22oGg1jW//T8+lGGu8g+XE4p23ZvGlUMCkRfaIp
         f5okwdBkw06pY31WTnh/2Wm/pMmw+y1oE9HM6xRqXoleAkw34QuTPLz6xnlQj7zYgOFc
         7JRw==
X-Forwarded-Encrypted: i=1; AJvYcCVeC153ME5Yyzd9iLA137NmHUd4VRWVV/ZpGBkNNcvC/FBb7JguPM0SXAySEhxi2LEGWjZW6OgrCeia8Ss=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOHPE7XLrpkc9YiAwdUJI1IWDXEN3/FZc+06L43k87NsudwPQi
	9mhlPE16lcl4Ahs/++8SkAo1bpNyyzKmmQaK2AjmqB6kDGMGlZHVneU4xdU8Y6w=
X-Gm-Gg: ASbGncsGzIkdI2TzwpfXPUvyb8OWng+qjjUKAFxg4+KF8B3ydgSpgS3OoAIvq7Ro8+N
	vXGqOqjdegshX4rBZF3LwCLOeuF1Q1vc5VEYtX8ti8tOJjJENNBBR3o3LecnVGKdd6OWKJ2QEN3
	vWN6P1uwp641aGAwNCbbeMgWf83Z8OPaGTBZ+W0aQGHJcLuYidFQ0IDbyEt1oNtXYDMTp3hIWlg
	egrYl1Bex4PMjaYFUL4gMkVt5oe5dn0YqShnueIAnS23BNeOdmqaNhBBi3uXbiERi4Q0uGz7SJX
	8UOfPV41gI86MH5v9bqieC8+vB3a0obJygsFmX5D4seGe4AbDl1cFh8SUcpPfD/qVA6Cri9N19X
	zoYo+O5JDiViR/lIj7i0ElJ4+M9G337SpKDkkYpy4WbkbtfBGfEqBze1n
X-Google-Smtp-Source: AGHT+IGLT5RMGJOi31Z4EljlBM6Dn6ye/misUQytVMeOZB5sQxwZhioVj8uoLgVjDj0pdiM3s3HzmQ==
X-Received: by 2002:a05:600c:4ec6:b0:440:66a4:8d1a with SMTP id 5b1f17b1804b1-440a65ba116mr6484755e9.7.1745564935206;
        Fri, 25 Apr 2025 00:08:55 -0700 (PDT)
Received: from [100.64.0.4] (2a02-8388-6584-6400-d322-7350-96d2-429d.cable.dynamic.v6.surfer.at. [2a02:8388:6584:6400:d322:7350:96d2:429d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2ad112sm46202735e9.24.2025.04.25.00.08.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 00:08:54 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 25 Apr 2025 09:08:14 +0200
Subject: [PATCH v3 3/4] arm64: dts: qcom: qcm6490-fairphone-fp5: Add
 OCP96011 audio switch
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-fp5-pmic-glink-dp-v3-3-cc9c2aeb42fb@fairphone.com>
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

Add a node for the OCP96011 on the board which is used to handle USB-C
analog audio switch and handles the SBU mux for DisplayPort-over-USB-C.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
index ea9f5517e8a083e37c4b7432322bd6d18fea84a5..e0470be9142caa4bac4285a191725bbd60e706fa 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
@@ -750,7 +750,19 @@ vreg_l7p: ldo7 {
 	};
 
 	/* Pixelworks @ 26 */
-	/* FSA4480 USB audio switch @ 42 */
+
+	typec-mux@42 {
+		compatible = "ocs,ocp96011", "fcs,fsa4480";
+		reg = <0x42>;
+
+		interrupts-extended = <&tlmm 7 IRQ_TYPE_LEVEL_LOW>;
+
+		vcc-supply = <&vreg_bob>;
+
+		mode-switch;
+		orientation-switch;
+	};
+
 	/* AW86927FCR haptics @ 5a */
 };
 

-- 
2.49.0

