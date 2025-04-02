Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D152823643E
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 09:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743587930; cv=none; b=KIPwTDoOWD3U1O5fPOYX0WWXjt0ZktvDXOUY4YB6WYPsiDKWIbPoTC0pDnOxCCwOc+U1KiWolyCfMJmHJG/qr+T2TapTH78Tg3y8fE2oY/GjrMGIHnPeaEdJk3XHoiTn5YtZWtVjBTK5bfQPs/GpQNsB95iSJe65/mED/dBjAfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743587930; c=relaxed/simple;
	bh=NM+r1eddNSJ+PhsAt5mpIMaaO5aqtw1lqIQpoUzxeuo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aqRdTjEGtwGIeUDrHLQ/aAjQCdg7+1YOwxriMylhs/qX2caBqLcfGyQjS7nP5Om80nUY8/s2d9uwXdSaoSlm+HhN1GWsiIBsRrbect1aZm2yFE3BlV1I40pNCuP+o6I3dpyXQUXinMiNUhUor7j6RAG0Tk9up5+3FIq3Q8uBMiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=v7S1Qi5H; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="v7S1Qi5H"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43cf58eea0fso31766005e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 02:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743587926; x=1744192726; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WlNr7s9//ER/SikIA2XjkSmK+up9sy8cyHVWwjM89l8=;
        b=v7S1Qi5HGFFAs563CZQMWl7yRSgGBUi67wtBQpU/p4pohJHANrTHFbzzkQ9557edUr
         1Qau6T3EXCAVOXFZ8w0bll/VeAQ7ZwOkoFfWmIfZhk0843DBvE1gDknAlNAkgPUcsLGD
         7B7gluzfHx2OhrmUapKQWwWQC8bh6zhgpSwcxtowmpH6cN7QUEw7wW3xghl/M6eAnAJ3
         kF2Ak/PezryxI6ckhLE5IHVoykzvIM8NcHkLXV8HqeUJIflpa5pXY2ZTFPTLkC1AIjDn
         ZcWjXg020rAv3epz0p0EDMvyDGs5Pn33bNkclimlr06+2s0nfQHbhcAXzbIWbGVTepOQ
         c3hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743587926; x=1744192726;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WlNr7s9//ER/SikIA2XjkSmK+up9sy8cyHVWwjM89l8=;
        b=UHkq1TG32ySXrkfbATnf8xcxNLsEShgpctQUv06nLKcJWLOVb0AVUd5E7/YsCNXkzv
         pHUa+Xlx972vtgX4oO7zhTCnm4n/FFpJQvgBBOqulwi9bd6N+PZxz/ITu2xBY4Pvanyk
         hjx/MqsvMEpC55TOSAn1o3DbawjoOAjgupvAt5V6fzYVp/b4lCFl3hwNnCEzqH9mLmMp
         CzDDzxQ1HZHLSW9l2vYWHFMu6R+BrUIdTHHdjK0uMbShcZ96XQt9+zEi+iJjPH5WhUyT
         FyishXVRDVxi5SpsrE16oM812iQn7/syCPiK7Mi2dlgHQqZWPgbdPL77xJh8ZStC7OCI
         6G+g==
X-Forwarded-Encrypted: i=1; AJvYcCU7RpLvYmMdN68cK44Q3nj9zqp3Xw3G/rQ+b0u2Yaur4XSOHEbGEq9mhgEjc8ajuruaBI7hiG8x0Qg3vnM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVoQHKPlSYsAPy4sqlbRp460zb0TrdEzIAl660Io4GBSb2hnCl
	cKFoCZxSA90vAUJt9LlE4jFZAFMDahdfPQFe73oEh4ZAud6G+cZk66JnZ3plyL0=
X-Gm-Gg: ASbGncugao/noS+VWgD0V+g2R1ozGWmpyvn5/XhN4swX7tEF0RiSQFIt3++gLps1avt
	ny+U4oUpn7yF8wWEnTo1cEhz5qPx7T0Ox5O+5PqyX1l0JUUu8CpIatKAvqR4e9Gtl4Equ16XOYI
	wPzalFRKa6ZtP/cQTnD/Z2IaWfLNTggD3KApFVf4WNcr20I1Jqwg2S5ilieadrbywe/JOFXKwRD
	e8wS7SO59JkoX0kQSyUezcOe1wnfvzs5s4LhOUpQIdjoQ+ZDCn67jcg+CLQtJs+8mtU0oBbWBbY
	/eRL6wgJiM+ne3NSAnQ/M757VQEvKcEBzJmHDO2ET/WcZvcIxz/yHL8R
X-Google-Smtp-Source: AGHT+IFTrd+aG1QnoeDWN5Twws3fGm4IGPhSV3zclRttiqm7JC1zigHY/sr1x2gYCsORgZ8e0lDQ8g==
X-Received: by 2002:a05:600c:68a:b0:43c:f4b3:b094 with SMTP id 5b1f17b1804b1-43ea9f8dae7mr37628625e9.6.1743587926052;
        Wed, 02 Apr 2025 02:58:46 -0700 (PDT)
Received: from localhost ([213.215.212.194])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43ea8d16d35sm34705285e9.0.2025.04.02.02.58.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 02:58:45 -0700 (PDT)
From: Christopher Obbard <christopher.obbard@linaro.org>
Date: Wed, 02 Apr 2025 10:58:33 +0100
Subject: [PATCH v4 2/2] arm64: dts: qcom: x1e78100-t14s-oled: add edp panel
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250402-wip-obbardc-qcom-t14s-oled-panel-v4-2-41ba3f3739d0@linaro.org>
References: <20250402-wip-obbardc-qcom-t14s-oled-panel-v4-0-41ba3f3739d0@linaro.org>
In-Reply-To: <20250402-wip-obbardc-qcom-t14s-oled-panel-v4-0-41ba3f3739d0@linaro.org>
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
 b=owEBbQKS/ZANAwAKAWNNxPBocEb4AcsmYgBn7QpThFC4dZp45FqIClVwad+jsKVUrk56+VO/Q
 SuTYwy/5FmJAjMEAAEKAB0WIQTxi9yLbCX5CqI9UXRjTcTwaHBG+AUCZ+0KUwAKCRBjTcTwaHBG
 +Ml6D/0b9LsPEQpFxaORUDI4PxBYS0vegaZinECmfYatrMEJZ0CRoesXn4RqP0Rkz8O1l+VdZ99
 vRmgfsW0Gxp1qRzh7oxa6sEk+K5Hk7ufI4Qig7CntNHwZwfkqW3+jos1MTZypwEGK3CmpjOoPNx
 mnnwxfzaOzUxtu8iuKdI7fGFSXYYQnNGlggPuW2NkKHwuM6juYbGvyrr7Bs0L1DPiF5PpDA53sr
 V56jVUWnss6DVU4pJ9v1vsiOpJpg9BVtH/6D07SJ9o8wbM0pYair+IfFdkLLvOidUGySWODI8vm
 7BScqTbK6wWBpoxSF6q1nuZOqYatUDUHF37LBjr6A450gAcTbqJRpk/PQkV2YNkoUiOll49GriQ
 5FwnWfq1AAuRBQS/CoUrVhUfVwlLh1WIB7wELoflpqeMK7ErAtd3b6pcRle5U8m4R1RnFepnUfp
 qnOeFQDGX1M3wNQn1/NN86UR8XZdOhJjf3ZRQQqQ+fBTel/uBb6TMhJluZzU3Zi3D8UuDmYMvIg
 LXpsSwKSCJ5zcMB1oP2zL0MDpRy58QWFgg3nQMSX47RUY6RYvXfU6Qp9uxEQCNOQnVx/CdgZyz6
 dfRrpSdK724AJ6HvUuCW4jPS+ZdI2xc8NqjpIe/i21nws4gS/pO6wemnISaryic2YzSxoIqOxrZ
 XjJZSTNiPXOlmPw==
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

