Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E46A1C6FFE;
	Thu, 10 Apr 2025 00:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744246781; cv=none; b=K5Ril8lUAqu+167TXMwUl7SvGTyxBHK5ZsDuCExtTXtta0YaEQGTnw3VRBN0CCsxIeZFWq7SwLOfLJT4stPJO+h1VlJYdlstU5X0mkD7P+BfQmItTqELgcj+qEPnqWMKPu9nqOlZfAUxhziQo+cH32hQMlwxmL6pfvMgxxCR2Y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744246781; c=relaxed/simple;
	bh=7d9WLzzdEb4qiRgysSPnoin7PNjAJJvf4izWIeRTN/c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LHT8U9xOOeGBZ7bxofb3Z0qo3kXmBj2J6ZGl3qd9VYWaaNik0Kk1JWhdTu/EhKZpKBcDHUpudzivazAiYcn8ePmyAHxa80MlPNBvE4f6D0/NYOUJgw7BFiDF6R8UcHbfBUGay3YYhlTOipzyM26pyN8LDZLj+hSTXXieXyNFaHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EtwTWdoh; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EtwTWdoh"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7c597760323so28659985a.3;
        Wed, 09 Apr 2025 17:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744246778; x=1744851578; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AETJCm92Gaddp7KArrHx6Zkppk0IpRlpsUfZE9LW2t0=;
        b=EtwTWdohMfJb9Xa0a4m/AS7//1ptMXl0PktFiktzSUK2otLAHiIYs8RbHllFnH1L5V
         OkonAm14plaeqisTrwZXZrMrTBKdSo6qaqd2wH6taEb6GRu0J06FFURN8rc/kRyAo3zD
         PcJpg4oXuau1NEH6cah/Mj8+6R4g8+GJ0EaPyDJyFWG9r/s30cctC/N2voP8xprl8h6u
         r2TdJI+8RmQY50d7bKYvPfyAeydWqbhIVG8FOJbRQGWEnKxIWMS/vurIOiOa+p3n+p+J
         h52NxkJKXkQ5v7rI6ih8+pspl+iAtwYfpTPur70Brh4HP2ek5C9oxtl4pU89i8CSCVXQ
         uHTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744246778; x=1744851578;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AETJCm92Gaddp7KArrHx6Zkppk0IpRlpsUfZE9LW2t0=;
        b=A7oyEGCmM1NWntnNzxQNjJ92fqhvK+9CN5NNjA08h+oB9i4g0FwAk3BIIQVxH3zY4+
         H1Bf2gVEmVAoJ8CndTlspsT/rF2lX1nX28/i+a363kCFMJWg+uIDZg2EZ5DDRTIefkwA
         ajJ61EAWSI/kg53fc1qugjf1Lsz5ahZqSypJOUzxw1qAFaRBeebk8UNDZR9WfA18+lxX
         kbPQjLn5tP2qTEjVftIcFMfo1IfXqW7e0gjHnHmzz2tcsxH30XpHFuleYwUkmQupQpDq
         0G9iEAlPYWbYVeV8yCnOAQxtiXEN15DKz96INtUDgfaUn1WYDhae5JXE+D/5Tyv6fXvN
         R9uw==
X-Forwarded-Encrypted: i=1; AJvYcCVbssTs/7rMn3BhvD3jvl5gTyohWaoFzgzJPtuZprivZ7+RQ4bae3pCAG0+Vgc338SUmkbyJreg1zKim67f@vger.kernel.org, AJvYcCXzGxqczmAIEMvHcz6T+PdwpsbVVxP1voZI3OBbBmVAoKV16Ox63vVFhKkwdxXVy0AMH7UNujnDwdI0@vger.kernel.org
X-Gm-Message-State: AOJu0YyuOeWAP4LJK2o9mGOjegu+dJpn+Vvgh+QQw0SAE57IOA5GsnPW
	iCMr3qu7E54/gmQhBMuhy3M88y+ZXm2D9/ot3vKhv89ur/KIQi1O
X-Gm-Gg: ASbGncuXOoL9dhyoiSHQzTyouqoSpzB0Q8/OE49eNN1vG/uuOvLwohm50k8bWPX9UPF
	SzyOYsipYxQPjCa9/c0s24lsBAUiUI5f1/13RCGZNQa3cQBbD9J7jSTGvvBLCl07HTq+kpBWZVk
	O/xjj2Bq7V93WsnPJyOXgZR9h8wmgmLrHxcU9r1WOUTrQNv5uGCmzPHyBCoSuVWXiEk9TkCcHuE
	v9JXCnoKcwTInKpN6MnUrquEKugoUpQmPijE4HRDXOySiAkhIMYY6IYs6rAJ9ucNeoy+ML4hOF1
	WraZs12NJSzoFo6KovvkHZYc20kamMGFID2hoASiZ9y1kXczGXCpdxo7QWJ/+fxymZmhwaPShbm
	L57KGQXC6hcHMvIHVNvrfgxFAZA==
X-Google-Smtp-Source: AGHT+IHuQHSJS//F0LBuhXq27KYoLsGaxUVz13ydAdOd20CQjtYTmWnqJXqodma0O0CBVkzHWRdo7A==
X-Received: by 2002:a05:620a:4310:b0:7c7:9349:e468 with SMTP id af79cd13be357-7c7a765485fmr117923285a.12.1744246778340;
        Wed, 09 Apr 2025 17:59:38 -0700 (PDT)
Received: from aford-System-Version.. (c-75-72-162-184.hsd1.mn.comcast.net. [75.72.162.184])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c7a895180esm9590685a.46.2025.04.09.17.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 17:59:37 -0700 (PDT)
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
Subject: [PATCH 7/9] arm64: dts: imx8mn-beacon: Configure Ethernet reset and IRQ GPIO
Date: Wed,  9 Apr 2025 19:59:01 -0500
Message-ID: <20250410005912.118732-7-aford173@gmail.com>
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

