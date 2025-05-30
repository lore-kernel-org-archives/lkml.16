Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C009B22DA02
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 11:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748604001; cv=none; b=LYU5lFwfaXUMMm7P3YaZxmrH90PzQZwGzNpPh7GnUvX+ziYKvmqJAX7FE+sc3FTLsq532C+s6YIJBa6/OnNSkY9ft+iiFjXTHF5z+G76l4i7+eV/qrRaDZXCvaoSoMCclBBaIG8G2Rg/URiHet4WanlGN9RjuHxpMWjV0ZX5Cuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748604001; c=relaxed/simple;
	bh=cJm/K+5ybBRW7zIlcZTsIL5CDJmvxF4XRCkMKcNx2xg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sepR08O+WilemmxNehv/OXdTupAEU/vRHERu3Km+Fp7BSL2WURwNBMsN49QgBE0LePfLKuIP7KGeQCvOlHwv8fl2K1cyBdB5N4PFghIWtlqDFEFH96YNpfhYPrn2t6C7cgQLN1hdwh0mdGKf0kiPUqNQOVG3ZzfPiJwaslWtkGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=c1qOAHoZ; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="c1qOAHoZ"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-441c99459e9so12417735e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 04:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1748603998; x=1749208798; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cvGP/3CRa2t4gXiy9Fv9ps8S84kk+BXASAtnC9F87rA=;
        b=c1qOAHoZOali2+86hu4/HQqGYiUOBvUVfixgoNaMCPswQA1v/JRhBa6S5OcrnWAOnk
         sReqUrPuC/e/CJg/i7YmqrkSrA5EbILVgatmfypS2pop+Ei2vVrj7Jm5lGqD69V21iVR
         oBwaMNDMUOa+6aiaW2eJhdNj6X6DMzkeAe/zkJO0FWGu0tWGvK0WMitc+ELducFYHjDw
         +l73YQwXHH15JKDMbpE99E9XpRAvT83YyjDTByycnt8L02fUrstuvxs+RXuTZnh9OPIJ
         iEP3MXMgDzwgp95W3waajw9LtPSVUdeShAbuo6K7yetj0E/vwaky40S1Mo5BPtJQVrCw
         GryA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748603998; x=1749208798;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cvGP/3CRa2t4gXiy9Fv9ps8S84kk+BXASAtnC9F87rA=;
        b=Bu3LYYyyMqRaDfiDiIzJPInAOFs4QHdnHku+NjzULp+ZgP1VS4LL3EFC4Fr+JFZZyl
         yaY91Bpnv1umkL0h8fK41h88jY9icdESFDeuiWx7bh95HQvJ4pc1jXaqEAbDsox8rIl+
         vu+Sqs/geO5M8/EX0KllHX5oEgDtKzRqCW3N/LzVqXtXUx5jhscevlxaXLGWUFRLVrcO
         +NibUynPejaOUxS7Mhj4seB5eloAXdxCBLsXerbNEb+/9ui0gu+uXherIGLFpqnvWIZR
         g3tWqcZ18izyllpF/hksRNvtwet+GgH/9fx3YIvnm93u7DtJGPZyF1rcBdUZHz8yiuAE
         agEQ==
X-Forwarded-Encrypted: i=1; AJvYcCXiTNI/PTy26H/UQQ4B3MvbKZ0aK36JzuFcqvoOrtoK87S4vltoROF6Wrg0H40Ac8K4lwcgqVHXPAvQlAw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTHPssac/Txj0QPEHX7b/C4YL3AtzQkMrjEHxW6gidf02qYyUH
	1Fe317BEaYu9j9Lek0j8kV73DM/mt3rnchj7PggjpjtirxS9mPxMNbCkNiRYXVDvU1Y=
X-Gm-Gg: ASbGncvCnkTyJN5yJSQ3Qmb/dKpqKejUbtWvTnipWVNiThF1ZS+mAGTpEFfA0Yr4X1r
	QK+EkHupwcG7/R/BX74XvjeyJurWhXTKuh0m2Po9I11bLMeBi3ER3f8JvX4du187g9zHqc5tAuR
	1Ug11MxIWpUjsJ2uJP+S7NGBBvCTxQ7UCEKzJ3fD02xe0MijsDGr3ufHkJuljPd/P8G95wJ55au
	lCxguzjMMkWpyAEpDZsNTN6ucZ2/sS4j+cjGt4XnmSGKdf8Rzzw64GRkT8nb74f70y8v1z58H4t
	I2xLLgOEBlxFqR4thIIzWxm5g/YdARlx1urZDSx3wFZCB22h8aHOEHiVbr41fTLQyQyrP7enOGd
	vERr3Yw==
X-Google-Smtp-Source: AGHT+IGxApXe/sZJcFH1MLc5rJG+X9SmRJKeviScP7B6tRgI49wzs/sJ62PD40lFB7+X06xl6Ik4Pg==
X-Received: by 2002:a05:600c:3582:b0:43c:fbba:41ba with SMTP id 5b1f17b1804b1-450d655b02amr21460665e9.28.1748603998156;
        Fri, 30 May 2025 04:19:58 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450dc818f27sm3986435e9.18.2025.05.30.04.19.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 04:19:57 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: bhelgaas@google.com,
	lpieralisi@kernel.org,
	kw@linux.com,
	manivannan.sadhasivam@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de
Cc: claudiu.beznea@tuxon.dev,
	linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	john.madieu.xa@bp.renesas.com,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 7/8] arm64: dts: renesas: rzg3s-smarc: Enable PCIe
Date: Fri, 30 May 2025 14:19:16 +0300
Message-ID: <20250530111917.1495023-8-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250530111917.1495023-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250530111917.1495023-1-claudiu.beznea.uj@bp.renesas.com>
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

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

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

