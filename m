Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C17512586C2
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 08:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745223328; cv=none; b=BQ97CbikUP9akAJ4oO5r+fh4y6NWKdU1+QDRVgu7EDlhhKl8XYKRsnu9PoeseXPq+DgaY14434YCc5JkYr4hauprELuYk/cI+Skm9QxWKOAYSDMYw4VW1+BTVfHsvORvN49XBbmSlVtBEEMI6HcdDvvbOe+o55+g1sT81iRJPIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745223328; c=relaxed/simple;
	bh=jAw0FXPxhOIPZrusHR9ocG5S7nn7Ms5nCJNC9ChkIcI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O3mFvxRqzd1rS7FhnMEEDZiJ8THHxYmfmNCFcw0N+EcnYmDVrWyrOghXig7yH4bctP+4cBSDlew1rqo5tJpyibjhJ5HxMSYpOtEDzNh1FziTbAaUEtq6JreMWl/DTBlo2bu39+QFkqUPJhdpTYWw1otmuojPKGy9QMMuRE4CfLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=qJ49b9VB; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="qJ49b9VB"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5f4ca707e31so5451197a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 01:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745223324; x=1745828124; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=loOwQqVV6eyMPf1rqSFcRXdY1hq6jUmDE2npYlo+V0Q=;
        b=qJ49b9VBheyDrt21ZImbLy81Z9nFydscgRCdKqXK1+zkePiiUnaV2YnL+M7oPiis0J
         0pgSoDsA5taxL2rbTw7DpUkOPjOIhmsRrX+8lbtxPKRA7RvKHmRG1RIJ+mIUP/qZ9nzm
         JSlVGwVxpVVHsRZwn02pJmrwNEPAg4ycE0r9oMt7gBfPUFcAVI2Z49LnELCaBkw5RLJ4
         cp4P4Mi/prlYnSzO+2z+G4ZyLH05il8vk6wdQTgsOo0SIPE5dSljEb/8zRxQRjVikgt7
         hLgr5crZ4I7Atb3+xzXHs1Fx8n5VyAroDDKgPqYwjwyBBBGMLMbY6wu/s1wXySLgpR1m
         wjpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745223324; x=1745828124;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=loOwQqVV6eyMPf1rqSFcRXdY1hq6jUmDE2npYlo+V0Q=;
        b=Cll5ACEjLhPp90JOeEPyraoKRSJwfc3R4xY6eN6vhgbofyMR5haVIsM4hyrdMYIwzv
         VYC9UABIJvjunpx1/hYyGPh2f/E1yJDT36sYs1ZRsub1yjO4LalTADu29xawwDK+URLn
         KRBL8Zm5iCvnN9x5nuUO9JuXFeCTg/OKJJ536DVgTHGdHdSoOd7pSv09dxlkmBCrj9xD
         M239+3Vm8GFAA2idRz2K1wFMckkvihL0oMvD18wT1FlsYmbATLXaZx5gLoqF1RWxj1z6
         Fyhz9mNtELc0QS4BvaFY4gewmPYc1oFyEPEJ+2K36zM8uTdCHOG4+2JIACKZJ2+Ge+6T
         T+8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVermzZKBr1CgxGyz2TznFX432UEuhKYsV6jh4VlefxWuj8DrdZLu8gAMbU/9OdsnrCCi3kjUFEMIxHU/c=@vger.kernel.org
X-Gm-Message-State: AOJu0YwrZD+t+LQyM1ZjakAIegmNK5UtdBVkiIR8Qn+l7wQPOGdbyXk+
	pDLHNfNhyDPXbjc2hDLGKCFonCH+KM4chL/4DP+3JnjyADsh9k6R3hlYHx4Lqrc=
X-Gm-Gg: ASbGncumqZyPmnTeNXPhebisDL65i3F2R9PHbkX3g9Sfv7Gvt96PiGa5vHhDuANRxST
	ZJYkhqUnukL8YGK2TFQkVaVnzdJzwbBbeOGFZQtHqNxlHBbWEAvhr0wibe74aao6fDLSFQaTtdq
	MJP2/KGPZsArX4devY8fRhmGbbt05v7KHM/OIgYjke1mfDNBfHTf+5/qWtH0kkgNtHNUe6v2xCI
	MDsIZsfleMZXk3ilABijLoFYklzl0PKDFr279yDgYnjvpGxRCSrjdLN68tQ8KgNdFlHAFAZLIuT
	Yuy6S2nFJJknY4n+vP9Sf5beiN80BWUFlo0=
X-Google-Smtp-Source: AGHT+IHmSv8qE9xsDFDBlcXfW/ys4qY3HMq1ZN2fPCkEkMsGzarXfrZu4d44z5xa+BrV86fjMJz6SQ==
X-Received: by 2002:a05:6402:13ce:b0:5ed:c188:8e7e with SMTP id 4fb4d7f45d1cf-5f6285e621cmr9844397a12.27.1745223324101;
        Mon, 21 Apr 2025 01:15:24 -0700 (PDT)
Received: from localhost ([2001:4091:a245:826e:c0c:4cef:7dd:26bd])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-5f625549cc7sm4407102a12.3.2025.04.21.01.15.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 01:15:23 -0700 (PDT)
From: Markus Schneider-Pargmann <msp@baylibre.com>
Date: Mon, 21 Apr 2025 10:14:23 +0200
Subject: [PATCH 5/7] arm64: dts: ti: k3-am62-lp-sk: Set wakeup-source
 system-states
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250421-topic-am62-dt-partialio-v6-15-v1-5-6ced30aafddb@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2946; i=msp@baylibre.com;
 h=from:subject:message-id; bh=jAw0FXPxhOIPZrusHR9ocG5S7nn7Ms5nCJNC9ChkIcI=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhgzWf43T82PF0hcdf9XDU1yzYsaZy9FrODrdRE8Fe1yUe
 lviqrG1o5SFQYyLQVZMkaUzMTTtv/zOY8mLlm2GmcPKBDKEgYtTACZyQ5iR4chWkQ+5H88etYp6
 uSgj8f5ZTwu+/2Ev+D9KHpleJGmRysXw3ymqyP28/3ntPffUl/wpjM74vPT/tgXrJ2qfMTLs2lg
 0nwsA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41

The CANUART pins of mcu_mcan0, mcu_mcan1, mcu_uart0 and wkup_uart0 are
powered during Partial-IO and IO+DDR and are capable of waking up the
system in these states. Specify the states in which these units can do a
wakeup on this board.

Note that the UARTs are not capable of wakeup in Partial-IO because of
of a UART mux on the board not being powered during Partial-IO. As
IO+DDR is not supported on am62, the UARTs are not added in this patch.

Add pincontrol definitions for mcu_mcan0 and mcu_mcan1 for wakeup from
Partial-IO. Add these as wakeup pinctrl entries for both devices.

Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts | 60 ++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts b/arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts
index 8e9fc00a6b3c7459a360f9e1d6bbb60e68c460ab..f19e53efabf30fc333e3a7d9832296140642fdf3 100644
--- a/arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts
@@ -232,3 +232,63 @@ &tlv320aic3106 {
 &gpmc0 {
 	ranges = <0 0 0x00 0x51000000 0x01000000>; /* CS0 space. Min partition = 16MB */
 };
+
+&mcu_mcan0 {
+	pinctrl-names = "default", "wakeup";
+	pinctrl-0 = <&mcu_mcan0_tx_pins_default>, <&mcu_mcan0_rx_pins_default>;
+	pinctrl-1 = <&mcu_mcan0_tx_pins_default>, <&mcu_mcan0_rx_pins_wakeup>;
+	wakeup-source = <&system_partial_io>,
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
+			<&system_deep_sleep>,
+			<&system_mcu_only>,
+			<&system_standby>;
+	status = "okay";
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

