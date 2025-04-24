Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B25DC215078
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 08:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745484490; cv=none; b=rr91Q2c9zLDWvLQrfSLZv/gfj7C9Y/kq35Z+ZBsdPONdYk3adZTy514lAQck8fYke96k85LgOBfh3yWMI43mM36g1TGO5RvHZxcLNpC3R1zx/zkLTLMReUoYdMhSlRyfGfNiUcLSdXsYfivkjau6RcYRJvsynpjabbj6BjLaJtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745484490; c=relaxed/simple;
	bh=vXjz4hOLTpgU5jbVh6VigWCb9ovYngyk2paVsl+ClIE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CRMH5rr8BCe8HEK4fP1dLIjTqdvcpkCBfVjnwKsmQYdTgE4VP5d4s1g7vuZ4okXU8Dod3XXo6GibSALU1kYLJ3sNR62fQMzHKbYMxPl1PhHN1KbMLbzZXr0ThmgsiYys94N5MMJR2Jc0zTwJup4R6YhamBm93I078KQbRZR3UXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eW1kquGS; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eW1kquGS"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5f4aee67d24so80679a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 01:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745484487; x=1746089287; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XlI4MSNJQrAzEP1cSUjdjx1DigpO/B9fZ6xgtIKJgwY=;
        b=eW1kquGSZOR54+twA4GPa7xfl1h4z4Uwri/GeAuQzvxao3OCRiApBlh51usW3W1uqq
         5IeXqlcpBfINKVbkFbQBwWWqzhJrkf0e4DOQcDn3aNqTAsYEBJ37rkMhZf6tBiptc7jN
         dCwGvYU1JvPUiGQve6PKH4uwLyalvIUVGNSYEpgZeHdyF31wIwg3BGahOeR7S46nY5/2
         tJmQhaWpHkrJh6febaNxIDmlLjZDIfEm9dNLMUBAbpfv9+/cD11gvvvElqsvXfbaxbTU
         cpiG8fgZxlotlicWuuOiS4k2MhjldB+T+kAsd5DnJfWBx5V2JivliI3tjLHZe70bro8o
         678g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745484487; x=1746089287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XlI4MSNJQrAzEP1cSUjdjx1DigpO/B9fZ6xgtIKJgwY=;
        b=fkSlyo1oCafmm7N/9AMLfIVa7QGj2tp3H6uHT40PjajOKGamqel9Wg1DlcSU46FzfT
         iVqFF7cqMq/mlgF99Wj+u3IstV+0Y7QrK8Xf4te53ywKgfHmPX4IbA/lKR9ax1SAWIx3
         /aVk/z8LY96ZM1qeFgqNtJttS1UKU5FUvcWhQMOAhKZXgdfDoff4ur8JA2XaI54/Xmwf
         fMElCt+PaF7m6ggxarLhgUtLtv78ZRgwNx7XZDsNzgu3yZAcIkTCMgx2ZMZZuctLluX8
         zgapSJSOcMUZPXxdVucx8DFU+gHJb39BOUe0a4fLV/XrTL1YCa6CGScjGZwKDXJ8mz+i
         zxrw==
X-Forwarded-Encrypted: i=1; AJvYcCVt3g+Xvj2M9BqvybpwV3sCL3BadBl/5YL81WsW0FvyZ58GyBWrRuouj/JTc77MgXMCMMQQ4G9CIPBdXYA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxjg7+abKBy0jUZJ9RjXJjRLDoWNEemAvCAaUo5trcehoFf6WCZ
	PjTJDHhdb+N1XC12HAfTRt7oKjeu0cP8+xecFvYclBi+WQhNR+J/DDncQVzts0Q=
X-Gm-Gg: ASbGncuHIqEbvCXxG+nKUowGSwHtfL1Ne/XhGy2ANp4NIowRSy1SRx2bfUoZPRXSvyV
	zI/qZ+tGIcWLCl2EcADmQHZWJVwTESh5GKzr3xu12JPXSOEuLURqQzNxJY21CuiXDyMkr6M/wKa
	Q3MSiNsB2V5hAXi5PmQPp9j6JykBBEc87E1CFb9y+PVSAUa0Ww7Cwq57qPt0ocxIEl7Zwi4FpjK
	IDuVkeuGtRb+rqldQyLYOEElQmXuJA+PGTj8lpcUkqKgSuaPgeV7gY4LN38mQlr85V3wBh4Yzip
	Fob5E7TtYJZEBMzhyLHRfrd4FK+AlRk6JGm1hLuDCdRCRS2t9w==
X-Google-Smtp-Source: AGHT+IG88LOYVsDqLk364RnZfDnVj+T3Ptml8aT8MgM2ZSYv7HiItMyaObLOH5qjcMxgbUE4cd3WrQ==
X-Received: by 2002:a05:6402:1d48:b0:5f6:d491:20ca with SMTP id 4fb4d7f45d1cf-5f6ddcf7f3bmr612417a12.2.1745484487068;
        Thu, 24 Apr 2025 01:48:07 -0700 (PDT)
Received: from kuoka.. ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f6f45fd3c1sm118998a12.3.2025.04.24.01.48.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 01:48:06 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Christoph Niedermaier <cniedermaier@dh-electronics.com>,
	Marek Vasut <marex@denx.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel@dh-electronics.com
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] ARM: dts: nxp: Align wifi node name with bindings
Date: Thu, 24 Apr 2025 10:48:00 +0200
Message-ID: <20250424084800.105300-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250424084800.105300-1-krzysztof.kozlowski@linaro.org>
References: <20250424084800.105300-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit 3c3606793f7e ("dt-bindings: wireless: bcm4329-fmac: Use
wireless-controller.yaml schema"), bindings expect 'wifi' as node name:

  imx7d-remarkable2.dtb: bcrmf@1: $nodename:0: 'bcrmf@1' does not match '^wifi(@.*)?$'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/nxp/imx/imx6qp-prtwd3.dts     | 2 +-
 arch/arm/boot/dts/nxp/imx/imx7d-remarkable2.dts | 2 +-
 arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi       | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6qp-prtwd3.dts b/arch/arm/boot/dts/nxp/imx/imx6qp-prtwd3.dts
index fbe260c9872e..cad985e341a1 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qp-prtwd3.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6qp-prtwd3.dts
@@ -384,7 +384,7 @@ &usdhc2 {
 	#address-cells = <1>;
 	#size-cells = <0>;
 
-	brcmf: bcrmf@1 {
+	brcmf: wifi@1 {
 		reg = <1>;
 		compatible = "brcm,bcm4329-fmac";
 	};
diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-remarkable2.dts b/arch/arm/boot/dts/nxp/imx/imx7d-remarkable2.dts
index eec526a96311..ff9d50942884 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7d-remarkable2.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx7d-remarkable2.dts
@@ -374,7 +374,7 @@ &usdhc2 {
 	cap-power-off-card;
 	status = "okay";
 
-	brcmf: bcrmf@1 {
+	brcmf: wifi@1 {
 		reg = <1>;
 		compatible = "brcm,bcm4329-fmac";
 	};
diff --git a/arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi b/arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi
index 2c52e67e5c14..a6903ef2b093 100644
--- a/arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi
+++ b/arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi
@@ -299,7 +299,7 @@ &ssp1 {
 	keep-power-in-suspend;
 	status = "okay";
 
-	wlan@1 {
+	wifi@1 {
 		reg = <1>;
 		compatible = "brcm,bcm4329-fmac";
 	};
-- 
2.45.2

