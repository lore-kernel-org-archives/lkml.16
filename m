Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 166BB5CB8;
	Sat, 19 Apr 2025 02:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745030243; cv=none; b=rrZcpkHoAkWa56m13M+3J42xTVZTOJ0dtLIfScoOOUgMI62O3lbTNmA8Y56iH+0tPr4h7OBVXMtfIf81QxdR7MHhllf/19gNXx+upMjLVu3JQr6/gOuouLwGVLL7oV8hWwiE/3HCkrf0sb4GI0q2RZCHi5c2HE1I7uJtRhNJ/jM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745030243; c=relaxed/simple;
	bh=tfrXw1DjRTmeGExSbf1IaMbXWS34iw2WemWDqIBxo/Q=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=ULQsM7ilL/IcA2apbpSROiMNFTJmPX1OYAVpD8dx0LACgOxP36AIZtGzW4LQyhg25lTbsN1pwfH4gKpu1dLKsjRJVaTyG7e19WHG0WwnriWT1UBllbTu5jI4UDWziVZTCYi2wXZe+5WSijcq6qHFqnqL+VcHNn5RCaH1DZ2l0Gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OIursNo6; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OIursNo6"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7c55500cf80so184163485a.1;
        Fri, 18 Apr 2025 19:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745030240; x=1745635040; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=z5xMW6JQzRFC3RypkMpl7HC+Ok1HS+DBoXUN4t3IzPg=;
        b=OIursNo6woC3T10i6le0rDlL4FHMpPw/nNewS0g3w4VBgEUukQXDhMn8qhos8lpLgn
         oUyUCEbljL68LaCrqb4yrUuy1+Ms9WbuNIhJVEy8n1wtRao6KZHMUnjn0KwH32fhBknV
         cbRLGE6DP4UMdgoUROSydOBEPNSEV+4HwzFz5xA71EjItulHKcfVqBm49lYUS20WeBr7
         rrETExrwR0eW2X7wLFy5fL1pPnmHpxBo0J+v82f74gIJk8/9h1NOSmwty9CaSXHCgMSe
         Xl5kJMGXxMBXOr+140yP5WJ5g32auS0NPJAcwnOy/vCQsmQI8S9KP/ORZojTRXHSCJGN
         pmxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745030240; x=1745635040;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z5xMW6JQzRFC3RypkMpl7HC+Ok1HS+DBoXUN4t3IzPg=;
        b=ojqiWAz6uaXpFkDdhdOSmASurTL3yxoI4bKIfxLYNMB9FvRKh6RHEFe10eB7C8PKyZ
         7EvqM1sscUiYUG0ERs68jKUtRi7YrjYL7EWVIEkLwF2VH0LbHuXYRqq297bguIHW1Ou7
         +EK6uOAMuVmli/MMBJP7xyyHVi3dc1rdTh+/8cSWfKqeQjwV2KQaeMUfwgjV/If8JN99
         YrxxKQnx+E3Bs7RX3kHlb1wrA/WkWdvZ7ql32l0CZeDm99HjgWgGcr+pUMmNpZcmaQlk
         qWkn1CrrAGtMby+mgMMz2XE0Qk/ouPCGzbUGwiT7Nr2C58M3+EmEg/2ebhTqcpJi5Q8+
         4NFg==
X-Forwarded-Encrypted: i=1; AJvYcCXCZ4G54maYVKLl8ILa+0ZcyK/dEYu//eqkZXGbjk/SsUBcC9JuukXaDjVhwX3p7HzbyVs9z7UIHMIy7vs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0YmX0nCo0gIBEZ6fTzWCnq5XSBwCYobwId6ElGd3uPfWyfmxc
	WzuH0g71vIP3tBiVV55/Olak6YJgY+82snjy6jdAgBee2y/LQVohKe7Y1TAK
X-Gm-Gg: ASbGncsXZeN5SnZK3fWJ7661K8DciYS9AZMcp1fyD8F/UxKUTkr9hQCzAT80FoUXbhy
	Y0XOdzQ20cc+V65uv4aHwdPa8LeK8ZWEY0aTn4UnJ9EqgjyAvatU2HUae8SO/sfwyAI/VlPmoib
	fw63nvtIZIRDoHVjsQd40hfrPMrzDgl0I9Pybj7uN2CA4bXMSI9+X1z4VIOSS0DZYi9382BELbE
	6itTEkS38IijF0/79Zh1jV05VtubBfosGLFblArhqg60jCaCJTj0ovMQxaF/fUBxkhjf9kZHNza
	LGiW1fjGio/y2cFwBOclw99/0PHIkT1DDEGztIlTC+IlRSeuYF4T
X-Google-Smtp-Source: AGHT+IHye/ATWWxQYKG94Z32CtV6NgziY9q4KsfM+OTqg+TdECswRmqN026PmdK91mfchx0mVjT56Q==
X-Received: by 2002:a05:620a:4413:b0:7c5:5e9f:eb2d with SMTP id af79cd13be357-7c92803945fmr784446185a.44.1745030240096;
        Fri, 18 Apr 2025 19:37:20 -0700 (PDT)
Received: from localhost.localdomain ([216.237.233.165])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c925b4ddb2sm169612985a.88.2025.04.18.19.37.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 19:37:19 -0700 (PDT)
From: John Clark <inindev@gmail.com>
To: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Marcin Juszkiewicz <mjuszkiewicz@redhat.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	John Clark <inindev@gmail.com>
Subject: [PATCH] arm64: dts: rockchip: rk3588-nanopc-t6: fix usb-c port functionality
Date: Fri, 18 Apr 2025 22:37:15 -0400
Message-Id: <20250419023715.16811-1-inindev@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The USB-C port on the NanoPC-T6 was not providing VBUS (vbus5v0_typec
regulator disabled, gpio-58 out lo) due to misconfiguration. The
original setup with regulator-always-on and regulator-boot-on forced
the port on, masking the issue, but removing these properties revealed
that the fusb302 driver was not enabling the regulator dynamically.

Changes:
- Removed regulator-always-on and regulator-boot-on from vbus5v0_typec
  and vbus5v0_usb to allow driver control.
- Changed power-role from "source" to "dual" in the usb-c-connector
  to support OTG functionality.
- Add pd-revision = /bits/ 8 <0x2 0x0 0x1 0x2>; to the FUSB302MPX node
  to specify USB Power Delivery (PD) Revision 2.0, Version 1.2,
  ensuring the driver correctly advertises PD capabilities and
  negotiates power roles (source/sink) per the FUSB302MPX’s supported
  PD protocol.
- Added op-sink-microwatt and sink-pdos for proper sink mode
  configuration (1w min, 15w max).
- Add typec-power-opmode = "3.0A"; to enable 3.0A (15W) fallback for
  non-PD USB-C devices with the FUSB302MPX.
- Set try-power-role to "source" to prioritize VBUS enablement.
- Adjusted usb_host0_xhci dr_mode from "host" to "otg" and added
  usb-role-switch for dual-role support.

Testing:
- Verified VBUS (5V) delivery to a sink device (USB thumb drive).
- Confirmed USB host mode with lsusb detecting connected devices.
- Validated USB device mode with adb devices when connected to a PC.
- Tested dual-role (OTG) functionality with try-power-role set to
  "source" and "sink"; "source" prioritizes faster VBUS activation.
- Validated functionality with a mobile device, including USB Power
  Delivery, file transfer, USB tethering, MIDI, and image transfer.
- Tested USB-C Ethernet adapter compatibility, ensuring proper
  operation in host mode.
- Tested USB-C hub compatibility, ensuring proper operation in host mode.

Signed-off-by: John Clark <inindev@gmail.com>
---
 .../boot/dts/rockchip/rk3588-nanopc-t6.dtsi   | 21 ++++++++++---------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
index cecfb788bf9e..8f2bd30786d9 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
@@ -174,8 +174,6 @@ vbus5v0_typec: regulator-vbus5v0-typec {
 		gpio = <&gpio1 RK_PD2 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&typec5v_pwren>;
-		regulator-always-on;
-		regulator-boot-on;
 		regulator-name = "vbus5v0_typec";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
@@ -188,8 +186,6 @@ vbus5v0_usb: regulator-vbus5v0-usb {
 		gpio = <&gpio4 RK_PB0 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&usb5v_pwren>;
-		regulator-always-on;
-		regulator-boot-on;
 		regulator-name = "vbus5v0_usb";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
@@ -465,24 +461,30 @@ regulator-state-mem {
 };
 
 &i2c6 {
-	clock-frequency = <200000>;
 	status = "okay";
 
-	fusb302: typec-portc@22 {
+	usbc0: usb-typec@22 {
 		compatible = "fcs,fusb302";
 		reg = <0x22>;
 		interrupt-parent = <&gpio0>;
 		interrupts = <RK_PD3 IRQ_TYPE_LEVEL_LOW>;
-		pinctrl-0 = <&usbc0_int>;
 		pinctrl-names = "default";
+		pinctrl-0 = <&usbc0_int>;
 		vbus-supply = <&vbus5v0_typec>;
+		status = "okay";
 
 		connector {
 			compatible = "usb-c-connector";
 			data-role = "dual";
 			label = "USB-C";
-			power-role = "source";
+			/* fusb302 supports PD Rev 2.0 Ver 1.2 */
+			pd-revision = /bits/ 8 <0x2 0x0 0x1 0x2>;
+			power-role = "dual";
+			op-sink-microwatt = <1000000>;
+			sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
 			source-pdos = <PDO_FIXED(5000, 2000, PDO_FIXED_USB_COMM)>;
+			try-power-role = "source";
+			typec-power-opmode = "3.0A";
 
 			ports {
 				#address-cells = <1>;
@@ -1135,9 +1137,8 @@ &usb_host0_ohci {
 };
 
 &usb_host0_xhci {
-	dr_mode = "host";
-	status = "okay";
 	usb-role-switch;
+	status = "okay";
 
 	port {
 		usb_host0_xhci_drd_sw: endpoint {
-- 
2.39.5

