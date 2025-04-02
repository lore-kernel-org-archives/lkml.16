Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7ED3236420
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 09:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743587928; cv=none; b=EJij916J1z6l9IBLUMXI6K6VtoTyGC/6lKF49nI8SIwmbXtP06OgmcwlqCu/gJKQT6rdhPqvaD5XZEJNrAQncvkhgCHNnggLfU90c4BzHCUIp0BtAVJEHYpxkawe3GWEYUm0/4f6wsu8dqETX8pe9fqKvsCYNRBCkUV7FWw+2HY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743587928; c=relaxed/simple;
	bh=hotZmPorZb9jdirRsPwukgzloHcJkty6Am+HrOSlUd4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=duyQPGdEugnYsgcdM/lLEyO4abg1QtgFOJ0b3D7FqPIJuyiwEQO+0PlbwDUGv+d9sZhMpuhY903z37gQ7iGYIsi27Uy7EX3xXJ8N7WrZXyFdb05ycMTZPr88hFNH6alCBnyFFNNp9tOa9qhZ/LORcqp7P9H15LO0nyc5b8woobo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HkbYJSrI; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HkbYJSrI"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3913b539aabso3797363f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 02:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743587925; x=1744192725; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=utN0oqIDcrT2zxK1IDRytgewtc+C2bsT6oGkn2JxGrw=;
        b=HkbYJSrI1hpgC8f8uG8QS6Vvt2lLuYMlykoLecNnNpycMO7I9lIorqoRCczjP/PWMw
         nR7TPOuh7A0D48BnyQmqNG5ldG+6TxM9C5MbRIhHukKW7k82cGS9tV5Jhkpj8rtDsCSH
         QlJbW8YlvRqf9Vgk3SQR7a9FZEtT+83CYu/snu34cBklc9uHEwJpczjr342EevBmFetP
         5RSwoRgP2UqtNzBCtjdy/RdvdPeHv5g7qITcdYACJ+Q9PYnQ7Air0HnS1B+tTUZUQJW7
         dW1eDFbR7rnDapCDaJh+kjxRMcLah+nCD1G4EkuLuUPyfIQI5CzIp1zDdSK7zMCzh1ie
         OW9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743587925; x=1744192725;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=utN0oqIDcrT2zxK1IDRytgewtc+C2bsT6oGkn2JxGrw=;
        b=LI4K2ISYa7ES7sOMc8blvdbbbH2mCTkqDMNL4CLuuw2KLvaoctD+wnyje21zQt5KAw
         os0bBP/LAk5cRIWaa39iHi7XINm8oeZsYnpGmUsX1T+FrxLWpxrFFv3DS6p2weP8y2ht
         Ci+zo1ckx+FqDTC0LJchFuIpzMSerpaJsrSmb944o/3HzXEWE0WgicY4Ey8wiaxDIcav
         g/2+0FI6/ZoL2qveCw8Pn4f52KGyi/p5/CkFaS3OJPuRpYt5S1tYKDDXEAqBdhIvOfp9
         b0gWg7NaKsnJ6AtnB2vCYz4rOqmB7YztUjBo2/K+uCsDOYBl7383GkZqeb0fcECtg320
         GqJg==
X-Forwarded-Encrypted: i=1; AJvYcCXtZ5PsnhxM7mCXSQdhwmj8cukXUcz15dTMsyec7cZB0B5TRtSRROjYZPfq4qGD9vKY7po2eU3ycsnbCe0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyaUa7Pn9pWIQw7cGiMnl9oRXfu/KWaFqX+ma02Bq0qNTPBaHK6
	YBIrE9/qnsocgaG0MS27xTz8fHPHyJNg5HvX+yfsU62B7/fD8cDaufMyNj7Vq3s=
X-Gm-Gg: ASbGncsd4b6kbclEB2ySC/H6j1174nSaJ4DJTD+gzcC0vB0xJ+0E9e/U/PnJuTUEGZh
	j44mWAyPS7tP/xDPPwLQmEN/GugS8hT+AQr9jIuquxtRV1tdtdH9Gie6AlMTCbwxUeZKzskliEt
	TNFcEjGhcKrL7RAEDtXDXpkNmVv13ayn17T7KXf0SpyKpwVrL+xgyw9wSV+IiGtIxL9wNBQJ7t3
	lg5dykugI6INaBfbUG+tALwEea3A8n5Mt3MCBjvPUaSP11p7WUoc3M86fwbu6mVLHfrKenfLAcz
	L6BCi+gW225d8yMZD5FkMWt0tjWswOH1XEwL1BewUKAbslkwx9ycYNnn
X-Google-Smtp-Source: AGHT+IEOQi872DGX/BWG/7PZr47mmBBiyqaeCfOJjhbYXULx0/oJQFipZz6WgGJyguMaUHkybYGruQ==
X-Received: by 2002:a05:6000:40ce:b0:39a:cd84:a77a with SMTP id ffacd0b85a97d-39c12113939mr12073691f8f.37.1743587925158;
        Wed, 02 Apr 2025 02:58:45 -0700 (PDT)
Received: from localhost ([213.215.212.194])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43eb6190bc4sm15563475e9.31.2025.04.02.02.58.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 02:58:44 -0700 (PDT)
From: Christopher Obbard <christopher.obbard@linaro.org>
Date: Wed, 02 Apr 2025 10:58:32 +0100
Subject: [PATCH v4 1/2] arm64: dts: qcom: x1e78100-t14s: add hpd gpio to dp
 controller
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250402-wip-obbardc-qcom-t14s-oled-panel-v4-1-41ba3f3739d0@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1276;
 i=christopher.obbard@linaro.org; h=from:subject:message-id;
 bh=hotZmPorZb9jdirRsPwukgzloHcJkty6Am+HrOSlUd4=;
 b=owEBbQKS/ZANAwAKAWNNxPBocEb4AcsmYgBn7QpT8Rj3nswbju+q78Oxs8w0VOLDQ283LKUHD
 N8EVUpv5Z+JAjMEAAEKAB0WIQTxi9yLbCX5CqI9UXRjTcTwaHBG+AUCZ+0KUwAKCRBjTcTwaHBG
 +D1EEACewDpImJIERkGTNf8Tnlx96rG5Pmvg98xt6EJOnyPnqlDKRa4HQyl3oFaMClcdGiaqX2t
 m5r39NWjQf65zxUHfI6QRF7zQx0EfUQfcJ5ZQXexn/spNZoWHown39IqGkKUIjMb5rMuBx1nHF+
 FknHSf9P0QcmzIkg1x08qwCgsYPbwOOyCkPcojYofZpCsvPExKsvMvY2QGnIsEP0xUg4PpY3wND
 jZ1AuF9FEpZ1TeXFwjq5gQ2iWg+20JXaJXAYRNKZJTamRE1LgmfFfwIl/0KliRKxI7MgIqzSQVK
 Qxxs4q0V8tMlkmqCBDl5A8PFtPsS1uKSSBS4yN56c7M8PaaZJjgJ5gfoCkjwWdAn5y9KVWx9rI/
 RpeXHeTgNGQOaYZzG479n7xeXnMevLNqovQwPaqdTb4o8ybKkMv4pJt1o+MOJqXUEKLMETmlt5X
 yJrFBkBdCRqnjCQ2GFwu/25fff5O0FaeBPKoW35Ps1HEXSEAIf9FCqxXI/+2GZ4E2miyr0qyuwI
 25oA9fCTOjSQ/9vHBd3AYryIi2VbKj454jGcg6PoOheT106Fje+HkI+PIl24fyy2I9vJ2FAmHqQ
 pHi5CnWJcObu/sjaK10OyMimQ+br6QMZs5rdjuWdnlEJ/B11oj+D1oUSPa/eP/oKP1mCEb+I4fN
 jD8kmL1/70sY8pA==
X-Developer-Key: i=christopher.obbard@linaro.org; a=openpgp;
 fpr=F18BDC8B6C25F90AA23D5174634DC4F0687046F8

The eDP controller has an HPD GPIO. Describe it in the device tree
for the generic T14s model, as the HPD GPIO is used in both the
OLED and LCD models which inherit this device tree.

Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
index 962fb050c55c4fd33f480a21a8c47a484d0c82b8..b0dbe4eaa77e5a6f862fd0db2a3c91db2aab5030 100644
--- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
@@ -975,6 +975,9 @@ &mdss_dp3 {
 	compatible = "qcom,x1e80100-dp";
 	/delete-property/ #sound-dai-cells;
 
+	pinctrl-names = "default";
+	pinctrl-0 = <&edp_hpd_active>;
+
 	status = "okay";
 
 	aux-bus {
@@ -1215,6 +1218,11 @@ &tlmm {
 			       <72 2>, /* Secure EC I2C connection (?) */
 			       <238 1>; /* UFS Reset */
 
+	edp_hpd_active: edp-hpd-active-state {
+		pins = "gpio119";
+		function = "edp_hot";
+	};
+
 	eusb3_reset_n: eusb3-reset-n-state {
 		pins = "gpio6";
 		function = "gpio";

-- 
2.49.0

