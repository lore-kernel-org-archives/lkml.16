Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1D9720F062;
	Wed, 16 Apr 2025 01:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744765322; cv=none; b=Fq0vs9tNEgSzvGv4S+MwUuQeDmg3Q4xHUD8XPHDDPb61JypXV2njV5fktbhMsoTnQPd4+TydJZbV6Su5A2SD7HtrDR8BdsgIgJ01su/X2ArBgrRyO+MdVmqzCOIF6DwfjZqBKpskVS7vgD6o8Z25EPy/o7S/Ds/9985BwUURYPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744765322; c=relaxed/simple;
	bh=22MEmFz5mc3jlZMDV3CcSBulqEhIbycuA2+KNYtCSe4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EMi89wVFlUdlMQt8AAeLDSdxeA2MMU8VsyDO3dAztxQ0h4bxekYKeDXN7MczfNEddRsjS9p7bg7wcx/aQAZgNx8GUhA+5ya23YnNq+YCUoXHPuvEARdMyNPTgDdqvclUm3Yn2iQMOW9mhzcOtBsWdL0Pvw6Bhcu0kBlL9Ayu8OQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X2QSpC7k; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X2QSpC7k"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-476b89782c3so63666031cf.1;
        Tue, 15 Apr 2025 18:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744765319; x=1745370119; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tjo4xki33zyLm0/Rt5Gsx8yphQcMjzMQ28GgPBYaW9s=;
        b=X2QSpC7kn7Uzms2ieWjmYKMpTfsnbiG5gDrlZN0eWtPaMlczWr9bKQgBKl9MMKomhe
         jXpkrJ+n4RWp6C+xRed5LCcH/vMuwrqpHaC67TZT1CMYP8awDabOikePbD8+qVPoywXk
         fm952hwhoNXLq5uGWX3vUffNpNsyHpPpXq+PDq7I40lbRwcRArYgjWtgIfng5IgSTlA7
         oCL+qL4ULNpQoqu50IGdXo7FmsiH0g1gRe5ZOaLabOrVoNc7e7V8cDUP2GLhmZmMjZ1w
         jh3RDil8F8gsJl0E4vU6QCn8NEkhmmvtC1nC9AEBbbbsr4HTrPfi/jRp5n8eU7Z+ta/4
         ZsnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744765319; x=1745370119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tjo4xki33zyLm0/Rt5Gsx8yphQcMjzMQ28GgPBYaW9s=;
        b=U90lHd5xDPKZJwMT966k/vZNItfV1qRoZFSv+3nV78vxfLeQl44eEueEfl463Lv4Hx
         SJ9Ita1h+8wXmkPELmHE3RvSix7zN8fVS6U/YWPespL4NTAfaisuROykygkefhBlHKdP
         wpQIvTyD+wW+BF9CcwBf7BwO0O4lHPPYtXp3MsyKyeflX+UHSYyDOiUgQ4Vsho12Qr8o
         95T3b/0VmFl46xhQDhu8boceZsaruFqloSczZT08reyXhUVzspgQzW2Zq0xWby3m+wxt
         qj0L2+RPRhPeDrLx+968/vNkYwpiX1xMAR1h3hTh6S/eocyOKAnr7AQ6uo7kD+XxH3iw
         PxkA==
X-Forwarded-Encrypted: i=1; AJvYcCUCwLT+LWxXsgebFQHr0VtEUadWQQO1kQ5FtH0t99jPBKo7CmPULd7IGhvgTlX34q3fls2tRwil1dYB16LH@vger.kernel.org, AJvYcCWa/uxd7+jiY95MiXdHG19F+bFGqcQNnYdy1q4BRucH90+9mXkvrPU7gN/ynhnCcNQ3NcbU8fZ8GSfj@vger.kernel.org
X-Gm-Message-State: AOJu0YxozYarxzClJvG+ZIrUJo66iba7cOhDO0pafd2Ue4GS606fyQmq
	bdPFLWqCCbxVMViASF7QnrDi0hSDET2EljnBUZG/e7MnhC1eXRhf
X-Gm-Gg: ASbGncuv0zkdSiNLjeNKhJsIe0TNCxkHJU0w1LE+tuXxjETa0a5qTXgxDke2ZOdmulE
	K1AWESBQQfBOgYGDYdC5VssrAotjcGSIkAR2KbjWqO+8WmOubtmoNLpk7Tx/JX/PfGPyv3cFVfx
	ZMKMLAPSlycBiumC/fSr6sPzHPOBj8fWHL2JTY54EabncX0KvQKlwymZM7NmLNbSrfbYei/j02S
	fWT7eGjBaovSx25g6Y9A4+uK6GkYs7s6+KYk9g/DAAqJycJJjOL3/4zrgS7S3ZgFyLj4va0pfHk
	F3YOT4nLBTNtaRK581a6M/FA1pt9wTgKNHU2hY7XNU8Laff92YAPqfys+eSjkQMJUGL78+Ci7oy
	CZWWgHAZWY9l1SCc=
X-Google-Smtp-Source: AGHT+IGSMllLvdBmoO21PrxCrBybdmOg5B+CK/K/ej/O/jMGk3bZh3tsbpTy6til3V66e2jkSmJD/Q==
X-Received: by 2002:a05:622a:1e0c:b0:477:64b0:6a2a with SMTP id d75a77b69052e-47ad3a404aamr25266811cf.26.1744765319578;
        Tue, 15 Apr 2025 18:01:59 -0700 (PDT)
Received: from aford-System-Version.. (c-75-72-162-184.hsd1.mn.comcast.net. [75.72.162.184])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4796edc29ccsm99746291cf.77.2025.04.15.18.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 18:01:59 -0700 (PDT)
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
Subject: [PATCH V2 07/10] arm64: dts: imx8mn-beacon: Configure Ethernet PHY reset and GPIO IRQ
Date: Tue, 15 Apr 2025 20:01:33 -0500
Message-ID: <20250416010141.1785841-7-aford173@gmail.com>
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

 arch/arm64/boot/dts/freescale/imx8mn-beacon-som.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-beacon-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-beacon-som.dtsi
index bb11590473a4..b3692b367a42 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-beacon-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-beacon-som.dtsi
@@ -88,6 +88,9 @@ mdio {
 		ethphy0: ethernet-phy@0 {
 			compatible = "ethernet-phy-ieee802.3-c22";
 			reg = <0>;
+			reset-gpios = <&gpio4 22 GPIO_ACTIVE_LOW>;
+			interrupt-parent = <&gpio1>;
+			interrupts = <10 IRQ_TYPE_LEVEL_LOW>;
 		};
 	};
 };
@@ -326,6 +329,7 @@ MX8MN_IOMUXC_ENET_TXC_ENET1_RGMII_TXC	0x1f
 			MX8MN_IOMUXC_ENET_RXC_ENET1_RGMII_RXC	0x91
 			MX8MN_IOMUXC_ENET_RX_CTL_ENET1_RGMII_RX_CTL	0x91
 			MX8MN_IOMUXC_ENET_TX_CTL_ENET1_RGMII_TX_CTL	0x1f
+			MX8MN_IOMUXC_GPIO1_IO10_GPIO1_IO10             0x146
 			MX8MN_IOMUXC_SAI2_RXC_GPIO4_IO22	0x19
 		>;
 	};
-- 
2.48.1

