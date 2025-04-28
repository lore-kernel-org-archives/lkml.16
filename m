Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 532B425F969;
	Mon, 28 Apr 2025 10:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745837071; cv=none; b=UN4WEqoees170qNla+yVJAsf4iPARh7paWjyB21XyZykw5nPBncTqBpcaTDZEDX15ZZBqQxpscZYo/QZFQt9tnKaccDZhgYYKSkOXmw4QCtU6/8TROZCKKA6KQZuy0z4qGjjzEG2did9oeazLkMzcRPucsUE+xfjhICCIQmMe8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745837071; c=relaxed/simple;
	bh=bABu/VDEElSSmPA6cekdNFlpkqmVhNewXrFKDvSrJ70=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Vi0VX+M7pCLnOZR+/KfMBk+D5FSyo/8KjAO70IWkEQD+DDXbv7d6vFimBDkU7Yw+pLg1oKmn6FahoqwNuhTILW6hSfujlelTomGmCmfMrfY7mrFfNh9ils1Coq2blxRehn9aAzQ2hbPLk7VwMZLBQdkeZkxPgtAMPpZqstHm0uE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sE8+cc9B; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sE8+cc9B"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0E980C4CEF3;
	Mon, 28 Apr 2025 10:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745837071;
	bh=bABu/VDEElSSmPA6cekdNFlpkqmVhNewXrFKDvSrJ70=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=sE8+cc9BZwAi5Zzk8ui1e54lPZKk2HBRKq2Cq11+GGeKiP9SgR6udO/meV5W2aiq/
	 vW8Z9Ji5yy4qVty5/GlSHPHZvHCCaQd5veDGjWPeSgYBe03oRMM12axybhd+Q0IWIP
	 rrWVp85/0o7HdVnQmF0yt+qHCreJHY1iQti9QudCwMSWPQbt57tjBN/ve1fhKgQ5wP
	 fG6OJhgfFBZdgQ1Kz+pHh9Fs81Go2aU9wpdgrTk3o2nJOd2H0+kDk/zHUN2miosT8w
	 LcZ2sbs+HpXtQxfagG2kztjwDmizichm0FeTHF4yXSY7uBEGDD6n3yXXnzNNlLD/ZK
	 nyFu4conRGS0A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05159C369DC;
	Mon, 28 Apr 2025 10:44:31 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Mon, 28 Apr 2025 12:44:31 +0200
Subject: [PATCH v2 4/4] ARM: dts: amlogic: meson8-fernsehfee3: Describe
 regulators
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250428-fernsehfee-v2-4-293b98a43a91@posteo.net>
References: <20250428-fernsehfee-v2-0-293b98a43a91@posteo.net>
In-Reply-To: <20250428-fernsehfee-v2-0-293b98a43a91@posteo.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745837069; l=6255;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=AKgCpfdZWCv+zwZ8v1j45DO/pgrxh4IwJ6agZCbSHzg=;
 b=H2zfdKROsGKE+lXPLgpMspCqA17o4V39l5+mZZxisa5jdqEqBITV+eE5Zkft+itNVp4tlp2tm
 HoKZZBJ5DdgDJKT6qoUQu3NSrTkamu5YM59m3WjtJQB1iXlizXKMvQW
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
Reply-To: j.ne@posteo.net

From: "J. Neuschäfer" <j.ne@posteo.net>

The fernsehfee3 board uses a Ricoh RN5T618 PMIC to generate various
voltages. Board schematics are not available, but the regulator voltages
found in /sys/kernel/debug/regulator/regulator_summary match those in
meson8m2-mxiii-plus.dts:

 DCDC1               0    0      0 unknown  1100mV     0mA     0mV     0mV
 DCDC2               0    0      0 unknown  1150mV     0mA     0mV     0mV
 DCDC3               0    0      0 unknown  1500mV     0mA     0mV     0mV
 LDO1                0    0      0 unknown  2900mV     0mA     0mV     0mV
 LDO2                0    0      0 unknown  1800mV     0mA     0mV     0mV
 LDO3                0    0      0 unknown  1800mV     0mA     0mV     0mV
 LDO4                0    0      0 unknown  2850mV     0mA     0mV     0mV
 LDO5                0    0      0 unknown  1800mV     0mA     0mV     0mV
 LDORTC1             0    0      0 unknown  2700mV     0mA     0mV     0mV
 LDORTC2             0    0      0 unknown   900mV     0mA     0mV     0mV

This patch takes the following approach:

 - Copy RN5T618 regulator nodes from meson8m2-mxiii-plus.dts
 - Remove some of the regulator names, which do not seem to apply
 - Verify regulator supply relations by starting without any relations
   (and without regulator-always-on) and seeing what breaks when the
   kernel turns off "unused" regulators.

This results in the following observations:

 - When LDO1 is turned off, the board resets
 - When DCDC1, DCDC2, DCDC3, LDO2, or LDO5 are turned off, the board (as
   observed through the serial port) stops running, so these must stay on
   at all times.
 - LDO4 (VCC2V8) appears to be unused on this board.
 - LDO3 (VCC1V8_USB) must stay on in order for USB to work, both the
   external USB ports and the internal USB wifi module.

The cpu-supply and mali-supply relations are also copied from
meson8m2-mxiii-plus.dts

Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---

Checklist used during the development of this patch (when a given
regulator is not forced to stay on, which features work/fail?):

 regulator | boot | run  | USB  | WLAN | eMMC | SD   | Eth
 ----------|------|------|------|------|------|------|------
  baseline | ok   | ok   | ok   | ok   | ok   | ok   | ok
  empty¹   | ok   | ok   | ok   | ok   | ok   | init²| ok
  DCDC1    | ok   | STOP |      |      |      |      |
  DCDC2    | ok   | STOP |      |      |      |      |
  DCDC3    | ok   | STOP |      |      |      |      |
  LDO1     | ok   | RESET| FAIL | FAIL | ok   | init | ok
  LDO2     | ok   | STOP | ok   | ok   | ok   | ok   |
  LDO3     | ok   | ok   | FAIL | FAIL | ok   | ok   | ok
  LDO4     | ok   | ok   | ok   | ok   | ok   | ok   | ok
  LDO5     | ok   | STOP |      |      |      |      |
  LDORTC1  |      |      |      |      |      |      |
  LDORTC2  |      |      |      |      |      |      |

¹: empty list of regulators
²: fails to initialize when plugged in at boot, only inits on hotplug


V2:
- new patch
---
 arch/arm/boot/dts/amlogic/meson8-fernsehfee3.dts | 91 ++++++++++++++++++++++++
 1 file changed, 91 insertions(+)

diff --git a/arch/arm/boot/dts/amlogic/meson8-fernsehfee3.dts b/arch/arm/boot/dts/amlogic/meson8-fernsehfee3.dts
index 3f9e2e5d8d5bd7ca7eb31e9b6cc7a591666c89ea..4e52447d51bd2d1d04e4ce21ddf598bc80a4c5f4 100644
--- a/arch/arm/boot/dts/amlogic/meson8-fernsehfee3.dts
+++ b/arch/arm/boot/dts/amlogic/meson8-fernsehfee3.dts
@@ -85,6 +85,10 @@ wifi_3v3: regulator-wifi {
 	};
 };
 
+&cpu0 {
+	cpu-supply = <&vcck>;
+};
+
 &ethmac {
 	status = "okay";
 	pinctrl-0 = <&eth_pins>;
@@ -117,6 +121,87 @@ pmic@32 {
 		compatible = "ricoh,rn5t618";
 		reg = <0x32>;
 		system-power-controller;
+
+		regulators {
+			vcck: DCDC1 {
+				regulator-name = "VCCK";
+				regulator-min-microvolt = <825000>;
+				regulator-max-microvolt = <1150000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			vddee: DCDC2 {
+				/* the output is also used as VDDAO */
+				regulator-name = "VDD_EE";
+				regulator-min-microvolt = <950000>;
+				regulator-max-microvolt = <1150000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			DCDC3 {
+				regulator-name = "VDD_DDR";
+				regulator-min-microvolt = <1500000>;
+				regulator-max-microvolt = <1500000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			LDO1 {
+				regulator-name = "VDDIO_AO28";
+				regulator-min-microvolt = <2900000>;
+				regulator-max-microvolt = <2900000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			LDO2 {
+				regulator-name = "VDDIO_AO18";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			vcc1v8_usb: LDO3 {
+				regulator-name = "VCC1V8_USB";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-boot-on;
+			};
+
+			LDO4 {
+				/* This one appears to be unused */
+				regulator-name = "VCC2V8";
+				regulator-min-microvolt = <2850000>;
+				regulator-max-microvolt = <2850000>;
+			};
+
+			LDO5 {
+				regulator-name = "AVDD1V8";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			LDORTC1 {
+				regulator-name = "VDD_LDO";
+				regulator-min-microvolt = <2700000>;
+				regulator-max-microvolt = <2700000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			LDORTC2 {
+				regulator-name = "RTC_0V9";
+				regulator-min-microvolt = <900000>;
+				regulator-max-microvolt = <900000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+		};
 	};
 
 	eeprom@50 {
@@ -137,6 +222,10 @@ &i2c_B {
 	/* TODO: SiI9293 HDMI receiver @ 0x39 */
 };
 
+&mali {
+	mali-supply = <&vddee>;
+};
+
 &sdhc {
 	status = "okay";
 	pinctrl-0 = <&sdxc_c_pins>;
@@ -188,6 +277,7 @@ &usb0 {
 
 &usb0_phy {
 	status = "okay";
+	phy-supply = <&vcc1v8_usb>;
 };
 
 &usb1 {
@@ -206,6 +296,7 @@ wifi: wifi@1 {
 
 &usb1_phy {
 	status = "okay";
+	phy-supply = <&vcc1v8_usb>;
 };
 
 &ir_receiver {

-- 
2.48.0.rc1.219.gb6b6757d772


