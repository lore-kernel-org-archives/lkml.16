Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E1EA259C8D
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 08:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745223329; cv=none; b=b7HQ2PC7XAp0XKXfM9wqx1Q8+B9MxRp/E97jLzp4UCBNoxKJ1PLuxM2Kur2h0hYn/hyEgFqD4kmDKTn608C2bywwxSlj2h3xM33PKhrE9VdTcHhRcbLEowBhcDugZjOJgOkDiJJgBCBbEKh9SBwiTiQ9/Mv85RzrW1kIVnC/1ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745223329; c=relaxed/simple;
	bh=q6o+61mgCHYyj8XEYV871sJvb6B+pphkoRdS0S2i68c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R+1efm4FRG1PR8dI4shw8WDNYpqsMK4JlsN2zq+yQqC/drLIC9qXQ/g5LN9tPbrdKLb9QUzQnEhTlVs3vhbctXirXEh1l+AURlshItw7M+uN3I1KRBuF2+LreKwy/xiqkFPio4IuZJYryaWeEHUGmm1+KFZRVYThuBh2/K+Ycgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=rleLK1lk; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="rleLK1lk"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-acb615228a4so617013266b.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 01:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745223325; x=1745828125; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vEJSvmdRFDOzL1aucFAOiHGGY6iJAkPN4C5adgEBmjM=;
        b=rleLK1lktYRgQ3Gj+DESgYVNO5m5LcRhtYubAbAxcMl9qU/41ba3sfjLqstsXqYu9N
         qdfSSoqjNl45+hZiWOmugnrfEVLheoxDkg1/WArqCNOQvV+5mybUslbS1kOt0l+Xcwl4
         JfRUYEG64Do95bt7lyCvCtsa4Yp5++NQYO83wPc7du9mcMrnQW7VVHWE1KGp8BNYvpL1
         L1Yo//IeslsjVK2gXPEAm2Lv0Y39nrUOrTqOLAnsA/O4WXNysB7mnyWGklxaPgMKV8ya
         H4mU4oofub4T5BN6vdTjaStJHRBQpCTl/a3aUHWJrpFLKZZ5J6reWDNqPdYbi91ABIko
         OoMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745223325; x=1745828125;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vEJSvmdRFDOzL1aucFAOiHGGY6iJAkPN4C5adgEBmjM=;
        b=XqD4FV431uAsBMNWE03r4xfMuo0FVo5M9qez/+32SOfZDuPF5dOHRBEj0wzwSickL4
         iR4aB92XBfO/vzo1mloezNfZAFmV/Isp77pC+wNUhyZWVkRgcxP6dV/Kae9Biye/d+Fg
         ftG3c8Rt2aoTRU1i5E+BpLyQZ0S64mr/u5T0pB7Cpd1wN/o77NfVmpUbJAk/VAW/SPp4
         CXRChrrcfgNK5cEfRHQl0iWO711jCt+ziRVHm/vuuuLg3qGlqeSA2Z/KyM3D3eYs2v75
         J8x5eOViA0ZH4Fx5VOdlexLI8MFtl6dkgi0DZ08G8kGYGqB71FdokbDyzzepZog/NJ1P
         bV8g==
X-Forwarded-Encrypted: i=1; AJvYcCWrFH54j4Aw1MmVPJCtABFOr4abJXJMO7ocZ4rgWPO6axGYRtdoUBnovn3LBzjf7du4btXh+XFDNe9H9do=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUcVipH0rz1sa9ycR2y0SgrYtZ2YK5SOFxsRmoUh4DBdtpMiZr
	XF2iM6p7Ovgsy4a54EFZLVVZKyLGuTCW9lne8ywD2T7YVn0mEC47iWfF2p+lX50=
X-Gm-Gg: ASbGncsWsxXLi6MidnDOTZ9OhNdJ46fieAyhk4CTFkVeclUNEpq7WseKRDOLz5ir+Wi
	/X9YQsK6n6qWaGFDL/Yq8o0BV2s5u7qWJY+JaUi/MhQV/cAmac5l7Q0gENXdz/Q76n4qMihVUpr
	FtBVVe3mDshk9pL6/X4tX37UHzgl3U6PGlkYpjQc7npzmZWEzJrvdTTn1uG+whiTe2/xGwtjDQ1
	0PtwjG+8SPIyifU2Na0e0YSXnwX3yJl6tIx5fa/pu86Zx3EDTpRyCzIlWSlai4uq0DJ8QMCxjeF
	NJmYCVDOWGCPtpYxfU3e9FcOiifsZxSS/60=
X-Google-Smtp-Source: AGHT+IGVk3z2U0xlHufo+U711OJEslZrNhldX39ajOT/JP2mrAwZqxZhp8lxxLXgJcXlWql7zqPhnQ==
X-Received: by 2002:a17:907:805:b0:ac6:b80b:2331 with SMTP id a640c23a62f3a-acb750d9119mr836009566b.4.1745223325308;
        Mon, 21 Apr 2025 01:15:25 -0700 (PDT)
Received: from localhost ([2001:4091:a245:826e:c0c:4cef:7dd:26bd])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-acb6ef46f71sm471684566b.128.2025.04.21.01.15.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 01:15:24 -0700 (PDT)
From: Markus Schneider-Pargmann <msp@baylibre.com>
Date: Mon, 21 Apr 2025 10:14:24 +0200
Subject: [PATCH 6/7] arm64: dts: ti: k3-am62a7-sk: Set wakeup-source
 system-states
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250421-topic-am62-dt-partialio-v6-15-v1-6-6ced30aafddb@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3107; i=msp@baylibre.com;
 h=from:subject:message-id; bh=q6o+61mgCHYyj8XEYV871sJvb6B+pphkoRdS0S2i68c=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhgzWf50TZ9c8VrRe7zT1zOYtBtOeBqSWhZ2+JmPUE3zFX
 N5ZSLKyo5SFQYyLQVZMkaUzMTTtv/zOY8mLlm2GmcPKBDKEgYtTACai8pORoWeWp92LeOX/3XXt
 kR29e+QvPl+nolzswlzdt82hv/uMNyPDh4M3XB8c3VW70OZ+f/VfgdaVD5RumsQe73hu3RBxYYE
 XIwA=
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
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts | 76 +++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
index 1c9d95696c839a51b607839abb9429a8de6fa620..724d9a6f3c575fe35496fdd9e17d6d8e33869f92 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
@@ -741,3 +741,79 @@ dpi1_out: endpoint {
 		};
 	};
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

