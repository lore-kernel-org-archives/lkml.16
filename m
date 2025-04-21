Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35E3625A2D7
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 08:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745223330; cv=none; b=hwfI8dlqQUOS+aAWdnQWMbRI8OGplPkoHWRfr4ryoxim78tTRUNT3YiV2xl02G2RXNFOCYTfScRVV+FyfJUdKNds0l/WHmNzIeaMY7viWNlGJ8Sdqp1uuwAR6C/tIs+yR8M0jH5n6rfYGHYPvLZ7Glgk+lUkHyCHeh6AyJgfG2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745223330; c=relaxed/simple;
	bh=MJ7GDc2/lXPzcfIbuMIl/StTi8QjW73NVgG9fDDiuKg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LVscwjwrW3VMZb4bpvG/4Arkcf9sB09NGMtwjz1CwYOBfX+MPouM9mw6IXDSlyNWPHcKZEw3b2Ougnh3bSHw+b4/EwPuU4C+uvo8xmdl0JOrdreyUhtKpdyj1O3cXRQT6TVbyzKwTFA0kzqcU2KYgbH3OxkmZSB2SIPUq/YZloY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=cTwY8+he; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="cTwY8+he"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5e5deb6482cso8617702a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 01:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745223326; x=1745828126; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XaPay1MzqaydVLYCPFc19eHuG2b1zJCo3mT9rCzo3yU=;
        b=cTwY8+hemE6Cr1sc9a1Z+e0b+sjrN3K4e42Qc6HARse+Z0G/v4yXGqEe0WQCC3yoJo
         pcDlxHrrar8dgTXAEEIMm7vu3Qp2svFovRvH38FcySGAGzm50JkfKQvccOxa8ZBp7l2M
         buFKV9W4P8PljaaS50wCkpEc8AHti+nMmkad+oz/QL7qe/mDXRZgTdZA30lMDsptvZXp
         I1rZsCE3LSeci+M8xpSLd6l8EZ7DnHGP8YIjyf4q7aVtdT3G9oAOnP8tqVpnEihdQQMt
         H3rOShdbQo22qUDJYOhQaZpyVi504WJIGCyx2WtcBpTy1IYAwIWpRlKjuvWPHui1/m/c
         p8VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745223326; x=1745828126;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XaPay1MzqaydVLYCPFc19eHuG2b1zJCo3mT9rCzo3yU=;
        b=Zgw8kzfIKvMCni0ttL5pA/yw4rM0uJH9Y+x1Q2kMQD+TYtJTJqHIvmNzOJ32DkwE9C
         KzbJ7nhCnA6gxAkF3gtZhlNGirDd0obcyDgbPF54C2kRAoTcpD5uf8HZA7Yj//Ae9aV0
         GJMeprRwTYn4WZT0pE0VI+4zSoAodr8z0u+6qFfOjkrbpLL2Nh25gL9W7GBfqNgQpHcS
         TWPdKr+rfmvmd+LOUadyFvrQTgxcNxP2U6TENzyPZs/FSrb7Kieal2J5IeKnqOF/b5HA
         tnno87JJx9X7Wae2s15t61rgMt3kADR280aOTskRvAhEtlIneQBn7mpjEsYLPw6VoEyU
         eu5g==
X-Forwarded-Encrypted: i=1; AJvYcCUqUb9SChNZ5B4HpbC+e7ZXa8iMcmxNil/aF3l/TeEJ8X2jlHpRhkk/kmIcxvAP4YBw/Miju7jr+LaGk6c=@vger.kernel.org
X-Gm-Message-State: AOJu0YyyC9pewkomElR28U7/jfGiNg2rUvFjO/hT17elfHWvVHDFhtMG
	Hfh56gDaYz8nKzmtobyh84JGWBthEPNZ490A3uJhLx5CJs9juc5hZ/7WjuX+Pvo=
X-Gm-Gg: ASbGncuIZCQ0o+Wb9j1clfD3MC5J9oLpaW1um4F+eg9oypub5DcYIPuO9Te1j0jGu7N
	IkbVHchRRnc31KdyKtjHThoRxHdVdOLNz8LaRT/tXK46oO0qUdEgA0bxa3CwySZ2INHH358Uppk
	bPCDsf/LPdodvaDhoAoJkbB+IRL/prf/0v533z55e72FtDKjJvfTLLT5/V5OYuNqonrde4fyt/6
	TzqM2gW9mbu72kViANmEupuA6EL5mBgD7PUWCJSRoQY/zXhTudmJw2sfgyanp+V03jwUzO3w06y
	2/wjGkgkVgbR9yQXGVyFG53TzXy410mZTcM=
X-Google-Smtp-Source: AGHT+IEz6OK/0SCaGlQ9/V1Qao7LcZ09YwhvCsSG50Lj++vLPxQthtcW3aF+/ToXm4oiTAZpR60XDg==
X-Received: by 2002:a17:907:2da7:b0:abf:174b:8ca6 with SMTP id a640c23a62f3a-acb6eeb62cemr911809366b.27.1745223326485;
        Mon, 21 Apr 2025 01:15:26 -0700 (PDT)
Received: from localhost ([2001:4091:a245:826e:c0c:4cef:7dd:26bd])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-acb6ef45784sm469002966b.129.2025.04.21.01.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 01:15:26 -0700 (PDT)
From: Markus Schneider-Pargmann <msp@baylibre.com>
Date: Mon, 21 Apr 2025 10:14:25 +0200
Subject: [PATCH 7/7] arm64: dts: ti: k3-am62p5-sk: Set wakeup-source
 system-states
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250421-topic-am62-dt-partialio-v6-15-v1-7-6ced30aafddb@baylibre.com>
References: <20250421-topic-am62-dt-partialio-v6-15-v1-0-6ced30aafddb@baylibre.com>
In-Reply-To: <20250421-topic-am62-dt-partialio-v6-15-v1-0-6ced30aafddb@baylibre.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Vishal Mahaveer <vishalm@ti.com>, 
 Kevin Hilman <khilman@baylibre.com>, Dhruva Gole <d-gole@ti.com>, 
 Sebin Francis <sebin.francis@ti.com>, Kendall Willis <k-willis@ti.com>, 
 Akashdeep Kaur <a-kaur@ti.com>, 
 Markus Schneider-Pargmann <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3129; i=msp@baylibre.com;
 h=from:subject:message-id; bh=MJ7GDc2/lXPzcfIbuMIl/StTi8QjW73NVgG9fDDiuKg=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhgzWf31bXE577XuvUtH/fe6/uiUHZrFwOk3MktddKnbhV
 M4cdqmOjlIWBjEuBlkxRZbOxNC0//I7jyUvWrYZZg4rE8gQBi5OAbiINsMvpp7gF09t7dl1HW5z
 /jBwjTm4tOtItMMcRdvP3mnKZjvYGBlu/GmOdiypMTU7GLH8kXjVzCm3pp+LEhM213qxIdym9i4
 DAA==
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41

The CANUART pins of mcu_mcan0, mcu_mcan1, mcu_uart0 and wkup_uart0 are
powered during Partial-IO and IO+DDR and are capable of waking up the
system in these states. Specify the states in which these units can do a
wakeup on this board.

Note that the UARTs are not capable of wakeup in Partial-IO because of
of a UART mux on the board not being powered during Partial-IO.

Add pincontrol definitions for mcu_mcan0 and mcu_mcan1 for wakeup from
Partial-IO. Add these as wakeup pinctrl entries for both devices.

Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts | 76 +++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
index d29f524600af017af607e2cb6122d3a581575ffc..35b950e444353c416e33344dfff42e2edeab3aba 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
@@ -683,3 +683,79 @@ &mcu_gpio0 {
 &mcu_gpio_intr {
 	status = "reserved";
 };
+
+&mcu_mcan0 {
+	pinctrl-names = "default", "wakeup";
+	pinctrl-0 = <&mcu_mcan0_tx_pins_default>, <&mcu_mcan0_rx_pins_default>;
+	pinctrl-1 = <&mcu_mcan0_tx_pins_default>, <&mcu_mcan0_rx_pins_wakeup>;
+	wakeup-source = <&system_partial_io>,
+			<&system_io_ddr>,
+			<&system_deep_sleep>,
+			<&system_mcu_only>,
+			<&system_standby>;
+	status = "okay";
+};
+
+&mcu_mcan1 {
+	pinctrl-names = "default", "wakeup";
+	pinctrl-0 = <&mcu_mcan1_tx_pins_default>, <&mcu_mcan1_rx_pins_default>;
+	pinctrl-1 = <&mcu_mcan1_tx_pins_default>, <&mcu_mcan1_rx_pins_wakeup>;
+	wakeup-source = <&system_partial_io>,
+			<&system_io_ddr>,
+			<&system_deep_sleep>,
+			<&system_mcu_only>,
+			<&system_standby>;
+	status = "okay";
+};
+
+&mcu_uart0 {
+	wakeup-source = <&system_io_ddr>,
+			<&system_deep_sleep>,
+			<&system_mcu_only>,
+			<&system_standby>;
+};
+
+&wkup_uart0 {
+	wakeup-source = <&system_io_ddr>,
+			<&system_deep_sleep>,
+			<&system_mcu_only>,
+			<&system_standby>;
+};
+
+&mcu_pmx0 {
+	mcu_mcan0_tx_pins_default: mcu-mcan0-tx-default-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x034, PIN_OUTPUT, 0) /* (D6) MCU_MCAN0_TX */
+		>;
+	};
+
+	mcu_mcan0_rx_pins_default: mcu-mcan0-rx-default-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x038, PIN_INPUT, 0) /* (B3) MCU_MCAN0_RX */
+		>;
+	};
+
+	mcu_mcan0_rx_pins_wakeup: mcu-mcan0-rx-wakeup-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x038, PIN_INPUT | WKUP_EN, 0) /* (B3) MCU_MCAN0_RX */
+		>;
+	};
+
+	mcu_mcan1_tx_pins_default: mcu-mcan1-tx-default-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x03c, PIN_OUTPUT, 0) /* (E5) MCU_MCAN1_TX */
+		>;
+	};
+
+	mcu_mcan1_rx_pins_default: mcu-mcan1-rx-default-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x040, PIN_INPUT, 0) /* (D4) MCU_MCAN1_RX */
+		>;
+	};
+
+	mcu_mcan1_rx_pins_wakeup: mcu-mcan1-rx-wakeup-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x040, PIN_INPUT | WKUP_EN, 0) /* (D4) MCU_MCAN1_RX */
+		>;
+	};
+};

-- 
2.49.0

