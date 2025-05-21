Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 026E518BBB9
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 14:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747836642; cv=none; b=RXHY/e8TOatSwBHo3LQCr+PyyI9g1dODbVmfx5Jq2NYKh/icYkjvNHo40NRdQ02EzVHrVlftfx8fGiuZZ3BFfjvWUf5/jvB6+atWJX7m450HfSo+uLRc6SbLI+pnOGfB9JxfDREomD8bMN0XWWEYxjCXazXRevdpqbuAjQIZ8uE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747836642; c=relaxed/simple;
	bh=OQ1NjhaRqgeRJck8clk8hAkhTOm7Z0typP+i2KOU6uY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LclJpCMMfww4qOxU666VjtfGk99B2dDi3Nsv+1VGZpkoKYazmj1cDpvQlaE0YQpOdRgkyB3guqdhfiifoowE5Iouhssg/pdFzynu7dlW1+8YmWzkxL0SQzum/YbTv0IAT6YRS9b04A8DqQwkDyuVYeY7jBXSYt6lnYHFt+d98yQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=VjfA0xGd; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="VjfA0xGd"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3105ef2a08dso62915491fa.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 07:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1747836639; x=1748441439; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j2m/AQHhUKCMB2ooeH4OXmkM2QdyDkeRoTJbiJc49Qw=;
        b=VjfA0xGdXDoWq9hSZ2KqMc3b7yEDYNdulcYH+LMi+10GXsb7u7OU/QZpubAOvuf3o1
         hkn0s+Gfz3NAGOUnGJSbNm039VM+MMpQIJLry1M47eJIbV+moaFrgNxG1rzqRnpvFOv8
         CbxU2X/KeA6Z5Wo581riRsjyuRoCY75pEGfABGEZ+MhhkHGYC4tdPqNWbpW+bY/9XU9q
         7V1KQlkomcrDxazHXO3RR5JC2c5LLM+WnCXI+86584dgzytyKqUH/g12GDc5ix6bOns+
         YJ0K+tp7pvvvT90m7FwqPMJLboR+oZvN/3MWXKqE//6aeD+lazcckOawDAVTdm6Y2iKe
         tMXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747836639; x=1748441439;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j2m/AQHhUKCMB2ooeH4OXmkM2QdyDkeRoTJbiJc49Qw=;
        b=JLBDbd0sa4pZu+bko7gMDZA2CRgXxurh6qLsv/PXDLDHxoFgks4DdWNiN3qrJAFAi4
         kIEb5IlWJGg+8G4cuaj65ceQVd6sTz9OYUQ3qnmKhRoHuxG+kxnzf4ylE2HWo1F2kF3l
         89FBHNudOKZK9q/4kjyPZi9GLCE7kCIBxgIwEesKFfPPhc4DeIgBcsX8zPbFiZiJb6da
         e5st1J0qCwzx70lKQdPbbVw63eAfZo6xI52gJe4ouRTszO3MizmNys2KbFccxwk1kSEo
         8xSQRYttceLBsr9iD7Bh2Bn8qLvYJ6NGbcAvwyOmr5pWNn3vk7pe3jdBGqgiSP578XVL
         wKlg==
X-Forwarded-Encrypted: i=1; AJvYcCXP6wxd7303cHiH6igHcJSZ5bPqTvHIPq5tT8gSfLtPf6zrKm8shHOARYE3TH6CWk7GYqaE/uuiFzzKKiU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwbGXXx7Vjgg5ezTXv6WZ991h4/Geeli1F+KRqxamMbdrHv2Fpo
	pKoYDpLrHdRt+GEAtDUHtbxgwxEjFz52L1LJGHRukNN9COUpMvQ4QaDi0B0+vzCzb0GPoZQYYdd
	q1GAw
X-Gm-Gg: ASbGncu7WE+A3N+aRxGEavU4BdcYCgzBy0Bb5t4+sutQLEKghweafs/jMgJ5FbrFFjI
	w8+JaG8dA+vzDatXt6YrIzZeZYUWn3Nnpy8qZCBGoCiuz2BcNGhkdi2psSgW+2dFoMilcYBYq6J
	ErrXS4HZBZjZkiX4QKy2Ty+0KwUUx9XkQP9soRwOj74EyxaKIqU03zHeyjW+F93HPgp/W23WMbX
	hes353ZqRWlNADCEWZL1LZBRRGUw0vdqp+e5E+Sswn5DT2y5y/oVFJ282AGynZEh5aylunyaDZ+
	yIE8tLPRKOPFGjEqhH0JYWWb06xxpCrTpKX8ABmJegO0gz/zw5o4GNFumpVqhX9fqWqItNtVq2+
	7jxHi
X-Google-Smtp-Source: AGHT+IGdD+yAG7ixkuPBvb5SmYpr1MB+zCBzWTmXhHcnzFLU4L4Om8QGyJVgnGJCce8K1qT9dbWwIA==
X-Received: by 2002:a17:907:968f:b0:ad2:53fc:a884 with SMTP id a640c23a62f3a-ad52d549101mr2013009566b.29.1747836628448;
        Wed, 21 May 2025 07:10:28 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.58])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d271916sm914552866b.69.2025.05.21.07.10.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 07:10:27 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: vkoul@kernel.org,
	kishon@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	yoshihiro.shimoda.uh@renesas.com,
	kees@kernel.org,
	gustavoars@kernel.org,
	biju.das.jz@bp.renesas.com
Cc: claudiu.beznea@tuxon.dev,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	john.madieu.xa@bp.renesas.com,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v3 12/12] arm64: dts: renesas: rzg3s-smarc: Enable USB support
Date: Wed, 21 May 2025 17:09:43 +0300
Message-ID: <20250521140943.3830195-13-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250521140943.3830195-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250521140943.3830195-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Enable USB support (host, device, USB PHYs).

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- collected tags

Changes in v2:
- this was patch 15/16 in v1:
- dropped sysc enablement as it is now done in SoC dtsi file

 arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi | 57 ++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi b/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
index 5e044a4d0234..5586dd43c4d5 100644
--- a/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
@@ -92,6 +92,20 @@ &audio_clk2 {
 	clock-frequency = <12288000>;
 };
 
+&ehci0 {
+	dr_mode = "otg";
+	status = "okay";
+};
+
+&ehci1 {
+	status = "okay";
+};
+
+&hsusb {
+	dr_mode = "otg";
+	status = "okay";
+};
+
 &i2c0 {
 	status = "okay";
 
@@ -132,6 +146,15 @@ power-monitor@44 {
 	};
 };
 
+&ohci0 {
+	dr_mode = "otg";
+	status = "okay";
+};
+
+&ohci1 {
+	status = "okay";
+};
+
 &pinctrl {
 	audio_clock_pins: audio-clock {
 		pins = "AUDIO_CLK1", "AUDIO_CLK2";
@@ -207,6 +230,27 @@ ssi3_pins: ssi3 {
 			 <RZG2L_PORT_PINMUX(18, 4, 8)>, /* TXD */
 			 <RZG2L_PORT_PINMUX(18, 5, 8)>; /* RXD */
 	};
+
+	usb0_pins: usb0 {
+		peri {
+			pinmux = <RZG2L_PORT_PINMUX(5, 0, 1)>, /* VBUS */
+				 <RZG2L_PORT_PINMUX(5, 2, 1)>; /* OVC */
+		};
+
+		otg {
+			pinmux = <RZG2L_PORT_PINMUX(5, 3, 1)>; /* OTG_ID */
+			bias-pull-up;
+		};
+	};
+
+	usb1_pins: usb1 {
+		pinmux = <RZG2L_PORT_PINMUX(5, 4, 5)>, /* OVC */
+			 <RZG2L_PORT_PINMUX(6, 0, 1)>; /* VBUS */
+	};
+};
+
+&phyrst {
+	status = "okay";
 };
 
 &scif0 {
@@ -242,3 +286,16 @@ &ssi3 {
 	pinctrl-0 = <&ssi3_pins>, <&audio_clock_pins>;
 	status = "okay";
 };
+
+&usb2_phy0 {
+	pinctrl-0 = <&usb0_pins>;
+	pinctrl-names = "default";
+	vbus-supply = <&usb0_vbus_otg>;
+	status = "okay";
+};
+
+&usb2_phy1 {
+	pinctrl-0 = <&usb1_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
-- 
2.43.0

