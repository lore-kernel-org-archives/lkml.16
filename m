Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 222C82DC35C
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 16:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751645695; cv=none; b=asb31+cszl2i6cV2Wqjg/GvMpjdAO4Po3p/JtomBspYNWd/gOxDQ7wkiRvUXjtU6hjqSWY9ilXt8j/30y5n7oCoYYBR5RtgonPN2yUL5qN7Grx95zq2lK/MOMglId40SL1MAdMrDl4JykWtcpMQ9awoCa3Mustl8U7QvnDEWD6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751645695; c=relaxed/simple;
	bh=WguPuQh3/mnSf62tuhpCluxDoAVKFv7lhwgnIqAg2mA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XCCjgO1lyJYOQEhkfuYanXICWom0Plt8WSRi7+UYmIy6nmmCSwlew3uziuHNPv0iCrz+7GDUZ88QKV9RVP/hgRZjt3dKNvRuWOIIoAQ1BCbJlp8Z3cvAAfftybzLlAYMK5GcSXri1P04Rih7abAxSvZsAw1ugr6309QEAT60C88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=kNsxm4aQ; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="kNsxm4aQ"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6077dea37easo1788024a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 09:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1751645691; x=1752250491; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EDg1DpjdtfK3/pj3Ed0aWvzIW/qZbuuI4Dyv55kxUjI=;
        b=kNsxm4aQzR7UeO/Sg2pPhSVSa/aBvxxcStZmcjSqc6NnX6y3RNzAaB4a45xbKHnCl6
         OjURboHgmHjDqY0UcT2awnFZGMJTtMLgk4gziU9qQ1TbNb1ouWGsB0xtNEBHanWq6CCF
         q/Y79U/XX6PK15ZK8mFb2I8UBmyDe5kH9xPMaYfoTl4Efw+y1mwOm8Q7wIfxYRT3fq/E
         E7AGP/eBjdDMmFSw8+yuMCJWyTbqmGIoBpk47m6t+rDEJKGFXtngaFACVEuEICuXj/rC
         bEI4NbTz+Aq672q6ZUiVP3nJCUIDvcghA1Ta/+BjifYq48r7l2WRJq0HWJWH+SJ4QjYo
         4GzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751645691; x=1752250491;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EDg1DpjdtfK3/pj3Ed0aWvzIW/qZbuuI4Dyv55kxUjI=;
        b=e1MpcBzMpxCCYjm/fAtLasv69Pn7aVCNMwL91bdEieCAgTEM/zMdjquQZqtPVWzOeC
         iKcrH1PkcLE39BrS4+rXil8Zf+3Suka7SsYsR9ByfDRrZjvmR3Wy7NkfkMCg1ZlXCzYR
         XzhOVtyKShK1IJo/iUH6e+Zw7lml7IQvrmnlpNDvWcRRADeGJWjzOzE1KZPjPsJR13BW
         4dgO/XNf8+0TjLWnDorOmlnLc2bN3CmGcVk5xNvaW47MEsGtJIA6+pTmyeKZyuwdLDFX
         moWLJyIqn5U+ad3M7ICuzS3GYWmjVTkr6cMhAbPch+rpFiOAZ3yGVoARI5ES2Ht28qp8
         du0A==
X-Forwarded-Encrypted: i=1; AJvYcCXvikAVuxrFDlXOh2gd5iQ9dRDwUHx601gMNxsIYqyMtDyd5LOIde8xQvbn0l5zxdqdiHkSS76yCKL0UQI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1/b7VUBQBJ/ojQQsNQ6C+T0g+E3uTjWU3fQYU+Ufysvkuw10w
	QIaZnI2J1ioKyGhoXI1Cz5rzMx3pks/PdRs9KrvoA4MuAneqTMtarZlzUqOqUsyzMAs=
X-Gm-Gg: ASbGncv7HSB773+u9e7IGX0Zom/rwkTL6e7M10HqLqq0Mk9l7IWW5YCVrUkIbWGA19I
	7I2zc5ZWOSJpZtUy/dqvBbBANhNNOmnqL4E7r4P6lXeQg4MnQARg4d9L7oed+qjJ6SVaJxGs7Bf
	MwehrXTYkwXOlW9PZwebx6fNPQhPrN5J4CwFqFoaHlnr9n0mSNGALOrP9MvO2cogPfZDByZB1ij
	OgYla19iWeCoeLogf8MDOXxChqP8a96j+0XF6CFZNUeHN/bfHYtEdgdlXCyJT8PIrxA/naZyAhQ
	W9Ubre2E6Z3IZ0KnNMjhg0Tcx5m7D/L/n9SEjqLknsi6MjY9NP5yZeDZ9b3dgxc4TNSq7IWAqfO
	eTGKWmllNFjUB30Q=
X-Google-Smtp-Source: AGHT+IEZfr0ji4LDK9KAfq64DmhYMTWRTB1pQDXq1rT0Tuj0QwG5y9ROAnPBq8wcVt6C4csWmuVLvQ==
X-Received: by 2002:a17:907:9621:b0:ae3:a717:e90c with SMTP id a640c23a62f3a-ae3fe695451mr259268966b.23.1751645691353;
        Fri, 04 Jul 2025 09:14:51 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.83])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f66d9215sm194703766b.2.2025.07.04.09.14.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 09:14:50 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: bhelgaas@google.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	lizhi.hou@amd.com
Cc: claudiu.beznea@tuxon.dev,
	linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v3 8/9] arm64: dts: renesas: rzg3s-smarc: Enable PCIe
Date: Fri,  4 Jul 2025 19:14:08 +0300
Message-ID: <20250704161410.3931884-9-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704161410.3931884-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250704161410.3931884-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The RZ Smarc Carrier-II board has PCIe headers mounted on it. Enable PCIe
support.

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- collected tags

Changes in v2:
- none

 arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi b/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
index 5e044a4d0234..6e9e78aca0b0 100644
--- a/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
@@ -132,6 +132,12 @@ power-monitor@44 {
 	};
 };
 
+&pcie {
+	pinctrl-0 = <&pcie_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
 &pinctrl {
 	audio_clock_pins: audio-clock {
 		pins = "AUDIO_CLK1", "AUDIO_CLK2";
@@ -159,6 +165,11 @@ key-3-gpio-hog {
 		line-name = "key-3-gpio-irq";
 	};
 
+	pcie_pins: pcie {
+		pinmux = <RZG2L_PORT_PINMUX(13, 2, 2)>, /* PCIE_RST_OUT_B */
+			 <RZG2L_PORT_PINMUX(13, 3, 2)>; /* PCIE_CLKREQ_B */
+	};
+
 	scif0_pins: scif0 {
 		pinmux = <RZG2L_PORT_PINMUX(6, 3, 1)>, /* RXD */
 			 <RZG2L_PORT_PINMUX(6, 4, 1)>; /* TXD */
-- 
2.43.0

