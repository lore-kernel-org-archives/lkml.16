Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB031F03DA
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 06:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745475737; cv=none; b=l6u2N9nUG1KugKCCJ+sPJZ/vfdBRnKKc/H4TTtvTwljZmxxz/RRPoC2qWUHdoP9ZKgH9VWrsRR+eDwhtUgOiLFpUBt6e9nY8JyQUiXnTYex0YecCpFlyumow7ade4aMq5mkGzbwMiTMJfFcfJ88+mbefH8csCKQqwdaupxsMSUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745475737; c=relaxed/simple;
	bh=6Nf3p87xmE+b+aldFiQfNcyvNboXQjvT/SrC191QSNI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AqIKyJeugw7/SWedvYUckDmubt/zQpKM3MzkogagfTrKEcp/17G2wE8luNPJ+r0LAA9Wze48FQ7x9riBspkhUQG9rqSXxuAA8l+Pc3v+dyZ1Ys+lEVlmWnwJXCuVu3XuZj0yOPhGCMB0Gi1BmFSebWtXAuiEbL6giO6hfPKi7NA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=G32Joefk; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="G32Joefk"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43d0618746bso3859815e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 23:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1745475733; x=1746080533; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HjH/2kqdCORlSdLYP6r4xpoVlQIwGobZVf64uO8zUM4=;
        b=G32Joefkn8u2AXloWY89bIco98NYmGCh1RGJEAmr57vAIzuleybEN88wEliu9YEIRn
         JRo2GYC5e6H2mPHYXMndqH9YB7bVMaySdOlRvnnbaIX2ly7rr9rTwOakrgnTFab1qpQM
         5amf2STQ3eusVRpz7iOrt78XPS+t5LhnfJfjI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745475733; x=1746080533;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HjH/2kqdCORlSdLYP6r4xpoVlQIwGobZVf64uO8zUM4=;
        b=OS9NvfaqG4LhPJdSRiNtJXmiUaaGIGaCejCYOxq6AmZ3ShVBvw1/01oeeX6WUVnpNf
         Paxb9Dq9NRh1MkPWKJ88qtZ2VXlvw1Ljltx5MFpXqz2tCVA4lTN+1h3sV1eNZUE7F/hT
         rACFd+a/srb2J9xmFf1uD04zqNN7Qgz1WoSGJVwmuXnkzaQo5KP0qO8JcMqaZ3x4xjVL
         rbAWNai6GI1PIVtOYHHFGbbzIAKBIs9wZZ7NQMyB6oPgN32YaF1Xuf2fv5/B5RSq/NaG
         JfJQDHSsW/UQyQXG/QFu4AgmzaPBChfpu74kcEgjoXx2+SJ4/uDDwcgJoEKYY6vxPhlv
         9AlQ==
X-Gm-Message-State: AOJu0Yy54z2RkqFkt/OZy4b4bNe+pPxm4+ts6gQbNup9mTyTCJX58bmQ
	he5In7orKwAJpfHQyiJy2NZhnhv3TyVrryN0eSIN+iezMe6cyPyiLvwumgNJO1DNFBl31N9RQJg
	C
X-Gm-Gg: ASbGncvGKTAlKTz8Y6R45GLbYFScZnDRtHhBjK80ib1REawjUPnPz8UwPSieyKeOZYF
	SKp96Mu77f5Meo0h5jW0KgaUQVEQsRl/DgGHFylTyTfN9i+g9faZngweOJ32/lqAQX8CCf0zQAM
	rHxvdsqkWeSCn4oJGnbVeZ2FASu+WwWcWe23cFyBm7rLg9H3DsNmu/NK5YeIzOD3T3//ivE6RXg
	9axTjbKfgMA6MDY66IrerZl2iGjf6OKyrXgknWkJECTPu6/nbZcJmeIH7HiX5T+NDU1FfjdiLW3
	gzXBk8fV0Jz3WBwmNzg3emAKGO8nyiL1DRAH+0hb2R2tU1a8o9XRNgziUe2V/agQAQ1w4NbaTCB
	yJiyn
X-Google-Smtp-Source: AGHT+IF8qsSIOhwlMtkI7iNCFFbm4c6JnD6bm4eccpoJ3Cg9vwgWn75lQjxCqfd/J1n/mFg6vXi2Gg==
X-Received: by 2002:a05:600c:3508:b0:43c:eeee:b70a with SMTP id 5b1f17b1804b1-4409bd8c247mr9014035e9.22.1745475733483;
        Wed, 23 Apr 2025 23:22:13 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.65])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2bf8dbsm7243435e9.35.2025.04.23.23.22.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 23:22:13 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Peng Fan <peng.fan@nxp.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	linux-amarula@amarulasolutions.com,
	Abel Vesa <abelvesa@kernel.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v12 08/19] arm64: dts: imx8mp: add anatop clocks
Date: Thu, 24 Apr 2025 08:21:38 +0200
Message-ID: <20250424062154.2999219-9-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250424062154.2999219-1-dario.binacchi@amarulasolutions.com>
References: <20250424062154.2999219-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add clocks to anatop node.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v4)

Changes in v4:
- New

 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index ce6793b2d57e..78d71aacd0a5 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -709,6 +709,8 @@ anatop: clock-controller@30360000 {
 				compatible = "fsl,imx8mp-anatop", "fsl,imx8mm-anatop";
 				reg = <0x30360000 0x10000>;
 				#clock-cells = <1>;
+				clocks = <&osc_32k>, <&osc_24m>;
+				clock-names = "osc_32k", "osc_24m";
 			};
 
 			snvs: snvs@30370000 {
-- 
2.43.0

