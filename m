Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55E341A5B9A;
	Thu, 10 Apr 2025 00:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744246778; cv=none; b=dCBxWTj08UNQAQXF+fcl8PgBh/RJyW+nnbhGFdUh8s2x1cnfSuZHA0zxz9Kp5FzadceN3Q0iexmaeThe6/JIsfZG7X24OsKiQ0BXqvq64kMLDZeDhIqKpRoNdoSbbBnYki30efWBFwe7QjEA/Z4P8+XEGzP0TjvAx7kVzNgybwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744246778; c=relaxed/simple;
	bh=J7pn1mNNX0KSqr0Y6dvmvs2JaP9VVUMsG3EejmOgzrE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nT7AqYSYhHohFsRGBIG/IPtF60mWzZjv2vN8qTQMKLQqONr0lF7gHB+GAS8ZHPkvSHItk9AD6S1x7rPn1sdXXgb3M8c3XtKPa8d9kDBsVu7JH3C9ztluHsvGcGD3JxSISofN+rxezMV8Vcj3/WFbdGMNXFX9hz+bR68wOIkyqe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lXe8d3Nn; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lXe8d3Nn"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7c5b2472969so30006185a.1;
        Wed, 09 Apr 2025 17:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744246776; x=1744851576; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mujuAB2P5xapTkmLzG9rvA7e+z7OOYkqAyA+5+v8/uo=;
        b=lXe8d3Nn9tj1GkdoY0mFzmaIUTWaYT9oxabLl0rqL0Z1BN16aTFWmzN271BC4n8Cxz
         gYuZ5tcX3Z4kXhCNxJrvyoRTSFP+a41QtDGtLG2a6Cha6819yGNm2X3qoUY5DRb7YaG6
         pgTEJnNd6l6n8tsNcd0YznEuGEFlmTpRoL6ZQd2IVMLqS7LaLiGKf2kmPfKdXd7BxNga
         2Rn6T4zw3HK+fvVLscyAn7z21PVhnCFbxYbPOfiL2r2rGGvkoyKt+nJ0D1Apvj/aUbB1
         mxotruE+wac4ELFhC+ewwbl1VX9lVuH6Z+nEnvd47AAhEVNUucyGC2p1/OhWE4ISvDNu
         55Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744246776; x=1744851576;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mujuAB2P5xapTkmLzG9rvA7e+z7OOYkqAyA+5+v8/uo=;
        b=eiok2sp0zKnrJ1ov2m0/+3/sh3ny2CUUP5FuBecSuv+Plqn9f1/Gf6fXTe5tSX0XR6
         i9trR6Cob1cFAi2Hs19jRatMUcA9hcbNpj3xBQ6QL76kmshVz3cIRziBHOjH2HPvS5Ho
         9n2GxWpSZzOZC7U9Lyyc3kw4Mu5vqYnLkRB2aVVe/1dt4eJrloC1pMFhWVgmymoTJ6lm
         CiT9ixgMItB5QaOTfWP0TkopgR6z/ZE649MAV/wyj6k5mLbfl+PATBaTLfH4leOr5uqB
         G9OiIcUyWytWiVNgpiR67A4CTAcjIr4zM5kJbzo3k58hfF4YCwPq+JX4Lpao5zpqG8id
         AmYw==
X-Forwarded-Encrypted: i=1; AJvYcCUgwppL7etkSVM45hgL8IARPyVEdYOU90Q6Y8LwRhhpoIddjyl0pjjYjmfxlCbpYyZI2GZe1sJqsXn0ok8t@vger.kernel.org, AJvYcCW1dVkxU+mjXfHRg+iyCr/kJvN54+ZTlPS9nUAdXYafKHZ+5XPZ0kAt7VHcLjZjjYHwcBHabYGtVqmv@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6XG0XDTM/PRznL4EcHIr8eHESoQS/mkuNzi46xWu2om1fP4LL
	s8RtRM6VS9+OzlOVIxNe3fixP1PIlAS4Qs1zOBZVrM0GSomRXxCN
X-Gm-Gg: ASbGncufYIMc8pvMSAGAg+HsVyhI0TBfF93Ih8BTnPm9GWd+mDgX+XwSnQ/vUT2xPds
	xcEXRWzC1tCc9GaWgSNxwZl7yQBWY3OZYK8+Qw4Tjefyg80mCNtzSkKTtmKHeC+HJlmBedOnwRe
	e0+p6D9Nx2sAVX/KlHch7RAFWlqjIbckYgQFTmB8mqV3KhH1t/VfC6jRrnY+3RPMxNnFP8eN2ah
	jIei4HKAT7+0WgiqEwpxD+pUY1TtEOuXH1nUEoUKcMIQn1GdsljoZZNsiVIFlilKnp+gaUN+9eG
	WDFv09umhkfYT6oR8An2wKrT00QJHJFK24dtP7Fasepj8Mc/4rf9+dHW7geDkarbunVhoLYr4Uk
	aBmCWFEkczWKM3Qw=
X-Google-Smtp-Source: AGHT+IGiC0wxIKVAYN+qM9uXVnocF+7Ky9tlCEp6HAiLzbJqcU+48i/0+uDCdBrHmaGx1GlEDSsSmg==
X-Received: by 2002:a05:620a:d81:b0:7c5:5584:dc1b with SMTP id af79cd13be357-7c7a76d04b6mr178797085a.54.1744246776211;
        Wed, 09 Apr 2025 17:59:36 -0700 (PDT)
Received: from aford-System-Version.. (c-75-72-162-184.hsd1.mn.comcast.net. [75.72.162.184])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c7a895180esm9590685a.46.2025.04.09.17.59.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 17:59:35 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: aford@beaconembedded.com,
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
Subject: [PATCH 6/9] arm64: dts: imx8mm-beacon: Configure Ethernet reset and IRQ GPIO
Date: Wed,  9 Apr 2025 19:59:00 -0500
Message-ID: <20250410005912.118732-6-aford173@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250410005912.118732-1-aford173@gmail.com>
References: <20250410005912.118732-1-aford173@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ethernet PHY setup assumes the bootloader will pull the PHY out
of reset,but it's not guaranteed.  The PHY is also currently
setup to poll, because it does not configure the IRQ. Enable
both GPIO settings for better optimal ethernet performance.

Signed-off-by: Adam Ford <aford173@gmail.com>
---
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

