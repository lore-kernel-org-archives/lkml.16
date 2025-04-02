Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE2D23BF83
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 14:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743604603; cv=none; b=MctBtK9AM/BaUXqTbIBuOiCGQIl0ItDKqF5KogBtDmqy/bWrl7lPsepdzmnPXaoxSLc3v0eyPa5Qz62rkDuOev89TlhIiwZPTtr5EAlqdLnq3W6WxWdMg4TrSJMAaBeDNUOrEsesLHhrQTKDrqAAXBsmH+wxAJosU8eZ7TnjdXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743604603; c=relaxed/simple;
	bh=NM+r1eddNSJ+PhsAt5mpIMaaO5aqtw1lqIQpoUzxeuo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mO6XhcMUyJx2Q+Yj8ehkeMkbptgQmqxalfSdtoRptU+QExQONxXQOauXBWPZ9UwI2J9d/+v+EMTgXr40I3vvN/ZPMbfaxTTv4dYEaF7tib5GYEyABDJHYtTXRuAEpiTJJVJ0zPFifZviwDhyIhGfUrMwtOy0OxtI9hEIptTAXdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EihaTqL4; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EihaTqL4"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-39c1efbefc6so1767492f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 07:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743604600; x=1744209400; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WlNr7s9//ER/SikIA2XjkSmK+up9sy8cyHVWwjM89l8=;
        b=EihaTqL4a6U473j/OG+Dr4vfcb3duGGsQ3R+pZ8968I0BXBBV+dxuE5iYpHVgLzUEf
         8kzsNTh6JmZeFaVQGbEHikK0wzYL/KHXNTY1jx+ZqfKhWNM13n2UeLf/4Y/kHD8ZzyKt
         BjEd78lo+vDVilZyi/xC1EnEFofRHvW+f7gi4foDDk/NvjEUBR+BfKeDToJg7uaOjlCx
         K4XH4ObbTlbKw/57M4PkNo9K2jUC1CUmW4RseEgNHXrERfHwAy3UBhBIUDn9QFogbV1b
         FnmkTnahLbtkQySgifBau66tEZOM3XzivavSOD2n2AeM1JLCqFCLtPonpOES9THsuw5D
         MU/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743604600; x=1744209400;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WlNr7s9//ER/SikIA2XjkSmK+up9sy8cyHVWwjM89l8=;
        b=TuoAH5pSCy1aeXo3liCjOwt7/BD2FROMF2BrfgtuwBoH1SRn58insJN9pZYCfSeajF
         pxVDDwoTTaawE08HZYzxI7H8p6i1n54sbEEZWFPUK+8IX4l76+Nc18oe1ew+hvlcR2oE
         B3wyLc3E3CValvlqsqJSnVo1Cz/5Ir/JWYxZoMmuX0hgDRkue/Xm9mRHFZhA4+LBjr3o
         RZqZWERObOul9wCLQubBHU6QvsByMt8L020/f+8zYypusR4QZPpqxCvs1BANq8WJryBt
         ZO0MPmWH6gynfskOJqpLYPxR90XoI6lqAqBL8AjlhR5wS7igK1oOMVK+cHvxu2QNiUym
         11zQ==
X-Forwarded-Encrypted: i=1; AJvYcCVOKz6BvKNbgvQ5MXit2yhnXH0pG1tyeYO4UH4iJkaFDRpJrT9O5iVM+SqxRQkSyUwvut5w0zc1ROV/1AQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz44X+wDXDmLPGeQwnozDPCkucichTfaIHmvaUfydznXbK8O+W8
	fb2/qNHL2dM7V9rLWmBdv9naVK0HywxZarcPNCpIBNu/rCxxHKXw58lOkGaaJY8=
X-Gm-Gg: ASbGnctzZG+Bs/v5EyeMiRr4DtslMS7D0HM2rmF5+tdf53MFwbEtObpC55PL+dmP6AB
	RDFW7vfwelBk8cyn5cSNLnhEJ390wGCdIBrZJXwZad+vOY5uFIvexjjXEXGxuoonReEM5lmIbb0
	8jByhXGM4I94rztB7CBD8GKnGYtlje4lD4OBGhzh9pWOupssRNb/vplsGpi18WT1nBolnOO1Ver
	weI88kP55wvlEbqXXaNBjCNJCZgDUsP4DFi/7pvP+ZeN0OcSg7etwt8PBWjM/2nDS1EnRf2nCkg
	DB6YjC2vxXrxN9qRiuA0G0frUXgcO5JUQhJst+yQaoHwqXp+sGL5rGh6
X-Google-Smtp-Source: AGHT+IFcoBoCC9BmmEOzMP3U/FDnU+7IhugBotKCAX7qSMOx6S3uyBr/tGFAZRODEe1ztN7QMsfesw==
X-Received: by 2002:a5d:5f55:0:b0:391:22e2:cd21 with SMTP id ffacd0b85a97d-39c297e41bamr2609766f8f.36.1743604599866;
        Wed, 02 Apr 2025 07:36:39 -0700 (PDT)
Received: from localhost ([213.215.212.194])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39c0b66d29csm17396769f8f.60.2025.04.02.07.36.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 07:36:39 -0700 (PDT)
From: Christopher Obbard <christopher.obbard@linaro.org>
Date: Wed, 02 Apr 2025 15:36:34 +0100
Subject: [PATCH v5 3/3] arm64: dts: qcom: x1e78100-t14s-oled: add edp panel
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250402-wip-obbardc-qcom-t14s-oled-panel-v5-3-ff33f4d0020f@linaro.org>
References: <20250402-wip-obbardc-qcom-t14s-oled-panel-v5-0-ff33f4d0020f@linaro.org>
In-Reply-To: <20250402-wip-obbardc-qcom-t14s-oled-panel-v5-0-ff33f4d0020f@linaro.org>
To: Douglas Anderson <dianders@chromium.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Johan Hovold <johan@kernel.org>, 
 Rui Miguel Silva <rui.silva@linaro.org>, Abel Vesa <abel.vesa@linaro.org>, 
 devicetree@vger.kernel.org, 
 Christopher Obbard <christopher.obbard@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1087;
 i=christopher.obbard@linaro.org; h=from:subject:message-id;
 bh=NM+r1eddNSJ+PhsAt5mpIMaaO5aqtw1lqIQpoUzxeuo=;
 b=owEBbQKS/ZANAwAKAWNNxPBocEb4AcsmYgBn7Ut0ZIzB+XdAppA9QOZwn9n08ERbMN6V7fJpA
 8Wz4niUuIOJAjMEAAEKAB0WIQTxi9yLbCX5CqI9UXRjTcTwaHBG+AUCZ+1LdAAKCRBjTcTwaHBG
 +J6YEACTC2p9NkWyqoxpsfbz8IAmvp9I25A0PJ8pwu+woG61rttN5y0Dbq5kye4TA+O64PyRgMm
 4Jb7rcXJxkvK8q/+/ZEH2ZgUER8H2sOXLYvmmqKbqNzHnURqGHahQ7okHtiavXEs0HVIB9KTQHx
 beTZ7pS001+OWS0Dtd+1TtLWnQbqK0wr0DID1wKN0Sw6kIIXGTwzEA7TGw5wzOfqxiy6EuimjSc
 enu/AZ7oRhc+0ksmUjEvlnwo+DehQ5r1QIA0d0ZF2x0CK60zx6YH7OrFU+y0u65xpGckL72ljCZ
 GtmMPsdIyKoJWw1B9vnFZm371LQN8SKeAPQr2+DKLyY3eRN++a338cgsvakO3YqOEKxI7PGjv4Z
 EjSW5iDSQ6TiCD+Ljwhl223FUrZ7rGtd0ChlctmkW3GjuEw8cBcv8r012oM9kp5BlzV0X91g+SB
 2JVtduFeu6MOhK7liW2i0m2l188EkvEju8T9gfTLmfy3ux03W2FnmIF8QkMnXnsJrtkfpnRldAe
 zaZM+YCPV8pRcjuq4uWTExmbFKHQkYeuYiL0hxsUI2EWbSd4dG2tum7RSaqIWo7G3f9HFcIVUIw
 nO4nJlY82B8fJhUImzNkkULIrXBI70WtYrzOC41CYzgt/LQCg5LVdp+rM50Ngc3WpOpj8YiGPkP
 nk9FjQewWQBW4rQ==
X-Developer-Key: i=christopher.obbard@linaro.org; a=openpgp;
 fpr=F18BDC8B6C25F90AA23D5174634DC4F0687046F8

Add the Samsung ATNA40YK20 eDP panel to the device tree for the
Snapdragon T14s OLED model.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dts b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dts
index be65fafafa736a0401a5872c40f69cb20cfbbd90..d524afa12d19b2a6f22a24b9bed6b6b40248375f 100644
--- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dts
+++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dts
@@ -10,3 +10,11 @@ / {
 	compatible = "lenovo,thinkpad-t14s-oled", "lenovo,thinkpad-t14s",
 		     "qcom,x1e78100", "qcom,x1e80100";
 };
+
+&panel {
+	compatible = "samsung,atna40yk20", "samsung,atna33xc20";
+	enable-gpios = <&pmc8380_3_gpios 4 GPIO_ACTIVE_HIGH>;
+
+	pinctrl-0 = <&edp_bl_en>;
+	pinctrl-names = "default";
+};

-- 
2.49.0

