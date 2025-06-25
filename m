Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A455526A1BB
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 15:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750865332; cv=none; b=HYH52ucLIfvBwxKWp/HPogo1nBf0P0NTcRRLIWg89QyKk6malfQG86n7esUyiWRk6b157vB19ZdxTQirj3ciGhdHVOFAlnppVcJ6WWi+jqzLRmvufJNAV/q+bwur0DAnG+uJj8kWWTfVJMY0C6Jh/ZkhavinJgRGBh9Z8cdP4YI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750865332; c=relaxed/simple;
	bh=DGQGEnve4/bgkJQyVwSOGe9EimBGv4nown95OAXf1bk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BCvv08kxRWpAqGZ6eSxHHb0SPR206pRfnJic5vpn4RS/3W5N0Hyh6uYLU+8viR/83cOQwcrdULk9N8XunVrioMzu4xbnCjfqHBnEVLX7u18+RMO9PdJrWohLpu6dyrDmO3swwBfTEsA8907lTqo0NvCoh+3loWD/H1b7EWS4Ifg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=GoHy6fmw; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="GoHy6fmw"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-451d6ade159so50506315e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 08:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750865329; x=1751470129; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PI3qPrTkmKZMuiNpclcJbamBpUy45L3AQm07k2EFtpk=;
        b=GoHy6fmwRcYFfI6v0eKyexJuCfgMF7byV7Jfu/cIlEuuj1MZgVZTHMuPgjRb3WhihF
         KV4L3pXgY/CeSXSntjw5c9PLxz5wmstP/lryCDi/3O7yMPJd69hr1/lAiNJRjc0UtAep
         YAx9WZvfJPXpHUUPVBHwoltOcq1hJrhpsYjVwua0d0zTLwdnVmAp+oAeJgqkbs1Xzgok
         vdgysTMrr45SOZ+sqPOb7pJ52VD20orKNLL+dPtJMvLLLBQET8AcxegQzMIpjo7FLanA
         RVJfR3m01YIkCnsEbMnyFXa6rWE5PCBENlFpD8BSmVZyHMSeTlsQTalKuedMa1uvgv4q
         orXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750865329; x=1751470129;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PI3qPrTkmKZMuiNpclcJbamBpUy45L3AQm07k2EFtpk=;
        b=CqAjKDhCWX2qmjkTRnIofD4g4dlDG9OYaZjHQOYL1QGa/gck6dNmG+eChCbXzRXF78
         7F7nMZBhwhkFiyjElyphryZYYhqtmJuYdmxYMhPkQQvk1wGGdqkS8Q1ayybzJ0c64+Nu
         Xpa5jOrBTsIxPA9JbAn+7eujwTdxCMC4bKQDxKF6vQFPxmRikNfD3jjJ7hdCDelPWaCF
         aTb/0M76+cXmD/Ldo9CH7pu7O8CxFi3Epz/W74y7QDNhxMz2JSMXNvQPCugC7BSLuLwF
         F48l8siWBYZmOaQnr83TtkBU4SC1LRKjYz3wOmWQTA9QG65LHyGhisYMHTW0axnfEl9r
         qQ5w==
X-Forwarded-Encrypted: i=1; AJvYcCUu6CJKOKDYoAZS0T7mo5mINIT2W/jh1FzGppMh4Y599FIgioKi9i+B1dlDsiMnM01XlUmaJRiY0vbxTwk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJTUai9W7kPyzmLkh4+97P6K0+ZauDH696e3jwrCmRTHRmjMQe
	2Bs0hnJ/3Vt+MZm34+Fr5G+kU6Lr4ByUPdUS6fLgsMkqvS8UA5e0Dlj5oEpimk256uY=
X-Gm-Gg: ASbGncsAIh0dXgwhrijKyK7rwcEm2O7qvLj6o7CXM2E0hOJx/ArSPeEX0Lbe+sEse7q
	lGrox1j1toTDFXZS98xJZXjy3Miq9pGoXr14fQKAYtrdAsxfNeNyO3McFJ+Wii8Thp8vfflfPrA
	OQojgjJ5aGGx9K7apK/Z8H3vqhFjBAg7Wi1WczP5Ma/5XAOW1e6tfAy+A+AlC2nD3IRg1OcDKRk
	/YYivvbcrTnnT/OVEKIXHCIkLBbxrSWKPRpp5B0+hYqjyljttM44lNyN6c/Xj1RkLExeOBdY4Sn
	xeqWfzLFZH52OXASp93aMWN9NYf3l47qeMgRY0oXpHpG02I+5S6PtyUYYCTgHs0=
X-Google-Smtp-Source: AGHT+IE8ILEBDNbFHwVn4CTLwkc5qRiSUjqDg5Sdx22jaPZhlrkws3KhJcV/ZrUUcqtIut17KcQNeQ==
X-Received: by 2002:a05:600c:8217:b0:442:f482:c429 with SMTP id 5b1f17b1804b1-45381aee7e7mr31642335e9.8.1750865328896;
        Wed, 25 Jun 2025 08:28:48 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:d216:42f3:1e7e:472e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45382366f88sm23283235e9.30.2025.06.25.08.28.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 08:28:48 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH] arm64: dts: qcom: sm6115: add debug UART pins
Date: Wed, 25 Jun 2025 17:28:38 +0200
Message-ID: <20250625152839.193672-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We should not rely on the bootloader to set up the pinmux of the debug
UART port. Let's add pin definitions for uart4 to tlmm and bind them to
the relevant device node.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm6115.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
index c8865779173ec..91fc36b59abf9 100644
--- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
@@ -721,6 +721,13 @@ qup_spi5_default: qup-spi5-default-state {
 				bias-pull-up;
 			};
 
+			qup_uart4_default: qup-uart4-default-state {
+				pins = "gpio12", "gpio13";
+				function = "qup4";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			sdc1_state_on: sdc1-on-state {
 				clk-pins {
 					pins = "sdc1_clk";
@@ -1565,6 +1572,8 @@ uart4: serial@4a90000 {
 				reg = <0x0 0x04a90000 0x0 0x4000>;
 				clock-names = "se";
 				clocks = <&gcc GCC_QUPV3_WRAP0_S4_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_uart4_default>;
 				interrupts = <GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH>;
 				interconnects = <&clk_virt MASTER_QUP_CORE_0 RPM_ALWAYS_TAG
 						 &clk_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
-- 
2.48.1

