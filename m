Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E281E20E704;
	Wed, 16 Apr 2025 01:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744765321; cv=none; b=dFzMS6BlEfkEnttN2dPQdyqxXF1tN3bVp/UC78MrhVHBb2VvTjvOvrjc6TmqBCd9f1D11ov3fo3FEz41sRGfe+wmT0V/hNXsUyj8aTTwal0NQ5ZnDvW2fBI/iUZeff3EG0/QXwA9ma2dMXr26HLym4RRtoHqpYBO+HWYDnVeuqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744765321; c=relaxed/simple;
	bh=FPvd4mqFKus4PL6m7SnM6RmFtUcggaxSYz3gm9nlBi0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eXF2CwJPOamS1WxrLBrJJQb8KAdi0fpNV2fKvIZ+AxV+Zi9SqwJVCYv9obHHRtbF6biKqfqOuN0ANvfVNxUfmVFCjGTaxvjYPN1Ydvj3flNbqwJU9xMiiWC7NQRnQuKGPK1kgTtRPaJ7prPj00QJT3MYnGCCihByd1CDK5XNU10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GeL0G6zn; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GeL0G6zn"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4769f3e19a9so38932611cf.0;
        Tue, 15 Apr 2025 18:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744765318; x=1745370118; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AFICO/f3GRYnQyGnM8JAgOAEAAxAb7Le1DtrMpG+6/M=;
        b=GeL0G6znZZqk6x3nwQ2cIRiSz3e1Rhw0QLnwElBThzMntsuFWmkCLup3YNh2Pbo+Qq
         3+LNERUjjVRGSqunzyXut0wPE+z+Or69n/NC9ZdoqGwFUbAgpPItYxOv6ZdiknJcN7h0
         MdM5V+T7TrutlWI/+caLTw3BA1MKA9UcSan0RsDBGP3m5CON3oAusppQ0T6pkrlTu6cI
         atjwYW18EtjA2hR1myerLyECnr8Gcnli6uDHBAO5NslMPYvT7hQAyn/edRrrJrMEd7OE
         tN/wsGU3PyUvzUk27/Mq7dtxTp8ORi/FUJo2P4KkvSkc/ejvkKbB1opPKAJZUVogu6vz
         oUNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744765318; x=1745370118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AFICO/f3GRYnQyGnM8JAgOAEAAxAb7Le1DtrMpG+6/M=;
        b=bd7sfq6t4LBtU5MDxDmAm9Zkl03+OMc/Y6Vlff1pCQQEmnepDbsy/efO/U9okJ7dq8
         HIPUVfIEQFjj6LGSKcJN3cqqGZDVWoK43P9/pM7JrWk5YI1NtPXKaVINu4Jnf/wXIrYD
         SlH5an8S265Qp7MZMju5sY4lz2k9bH7NjRetdg8CoF65GMYKqvIUl4pA6VpZUIINIpZI
         1ApM1fkWGJSRw4IZLCzUpauwoX8GKzpO4aDv+P+llKeDswa2GtwR3mwfVvRSQetSpdb1
         jQI0x4JHvleweXLDfUt5NP/Dxi3v0V/HNZmmGRAp72kjYSVhgo30vSeQK7dN1YoNt57o
         wz9g==
X-Forwarded-Encrypted: i=1; AJvYcCUVuu+rwK+JlBS6gefY6x/tjooj1hwfBQUCX1vMbxnif6931F76KZR6ZNqcV0TInmnByewYe0f60lX05RiZ@vger.kernel.org, AJvYcCXSXZihvUCv6yXJ5enA5Ygr615xG5NH8NXRJSEHEo48SA/05lLYs/JVYY2ThA6DHUqd8WWFrRBFfht6@vger.kernel.org
X-Gm-Message-State: AOJu0YxTFGNMEErk7B3EbHcCRcjWI9Vbi6xhPSnlKrjxytuleKm88W3e
	ioR/HvUCNgh1FgxLvgGtY7cFwcIRnGgak1jE5MQqjcfE0qt54Vy2
X-Gm-Gg: ASbGncvEV8XBtZKJm71cq1c230H/ZuNNWwb3uA5CcD0rYFkjjFfT2lK2vjGNv5b+4bd
	Em3FFZiJyZQgpPV/cQiwDMKSAXw7NfjpkGOIMUy1rHYN+RjrAGNfu7jR89ADY9rZLwWFUPBg54a
	ugtjuTPjCeaxnIoXZcWVqwwXlV7nbOMN6zHaMzn2A/tN0pMYZvxv8ZLXF3TaBYFMkq80fnG0RxO
	v1u8sfXDRrolbowBuDv8s6QOP0vY+fgaOyLtbyX7GyfTYvj8KBUDJm3IWoDO2b/T5Ve0S1VnTZg
	EFmm5VnsuIqjTnVjfpWC6C1ogvE/hcHxm2Jq9HWbjzcp0w05H/YMllCgS06HzZO1f6dP+4wHrOZ
	zNseML07WwlkW54o=
X-Google-Smtp-Source: AGHT+IE5vymre3jMvOIqMTFZOIcLz3gAqcPHBCaqYI7xneF2ijTBn4EouQOs7gqt1Ik+3CpFQFHmTw==
X-Received: by 2002:a05:622a:114:b0:476:8cef:4f0e with SMTP id d75a77b69052e-47ad3a3b807mr19517671cf.29.1744765317693;
        Tue, 15 Apr 2025 18:01:57 -0700 (PDT)
Received: from aford-System-Version.. (c-75-72-162-184.hsd1.mn.comcast.net. [75.72.162.184])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4796edc29ccsm99746291cf.77.2025.04.15.18.01.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 18:01:57 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: aford@beaconembedded.com,
	Frank.li@nxp.com,
	Adam Ford <aford173@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2 06/10] arm64: dts: imx8mm-beacon: Configure Ethernet PHY reset and GPIO IRQ
Date: Tue, 15 Apr 2025 20:01:32 -0500
Message-ID: <20250416010141.1785841-6-aford173@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250416010141.1785841-1-aford173@gmail.com>
References: <20250416010141.1785841-1-aford173@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Ethernet PHY setup currently assumes that the bootloader will take the
PHY out of reset, but this behavior is not guaranteed across all
bootloaders. Add the reset GPIO to ensure the kernel can properly control
the PHY reset line.

Also configure the PHY IRQ GPIO to enable interrupt-driven link status
reporting, instead of relying on polling.

This ensures more reliable Ethernet initialization and improves PHY event
handling.

Signed-off-by: Adam Ford <aford173@gmail.com>
---
V2:  Update commit message. No active changes.

 arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi
index 9ba0cb89fa24..ed7a1be4a1a6 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi
@@ -78,6 +78,9 @@ mdio {
 		ethphy0: ethernet-phy@0 {
 			compatible = "ethernet-phy-ieee802.3-c22";
 			reg = <0>;
+			reset-gpios = <&gpio4 22 GPIO_ACTIVE_LOW>;
+			interrupt-parent = <&gpio1>;
+			interrupts = <10 IRQ_TYPE_LEVEL_LOW>;
 		};
 	};
 };
@@ -315,6 +318,7 @@ MX8MM_IOMUXC_ENET_TXC_ENET1_RGMII_TXC	0x1f
 			MX8MM_IOMUXC_ENET_RXC_ENET1_RGMII_RXC	0x91
 			MX8MM_IOMUXC_ENET_RX_CTL_ENET1_RGMII_RX_CTL	0x91
 			MX8MM_IOMUXC_ENET_TX_CTL_ENET1_RGMII_TX_CTL	0x1f
+			MX8MM_IOMUXC_GPIO1_IO10_GPIO1_IO10             0x146
 			MX8MM_IOMUXC_SAI2_RXC_GPIO4_IO22	0x19
 		>;
 	};
-- 
2.48.1

