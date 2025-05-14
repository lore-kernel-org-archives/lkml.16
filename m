Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44DE8222578
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 08:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747211125; cv=none; b=I3pRXO0SKxOdfwmWSg9mYA9FKw8s57YgGAzaRBF8isK8QnzpJ3kn7I8OldTuMrSEni4i2QokldGTktwlPJ3mU8mJee7RkUa8gObX51FoMEApHu6vkj2MYsdUOKUapVwF3i/qRy8iq8bOrnCEgcNX+xfUFFOKjl+7j/20FY0eDu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747211125; c=relaxed/simple;
	bh=HsVCl1yxLXvhDf43Nd0AQkKlThmkNlDCATxWj7ZdQkI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SkC5z4yoeU3FwCryrnCgtRGQfP8tpLjRmftjeWSINxFdnLpL3UIJ8P65k3CVgaD7WUmQhxstXBlc5+HywNg02NtB6zapUKmcdv73kKCzCcRSIvM37A9Bb+DATzDV1dtRw0q1AVs5R32KtQxOTaSIyPrGlmigoRdJP7x0lyUT0qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=KzT5z9f7; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="KzT5z9f7"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-441ab63a415so68513175e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 01:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1747211121; x=1747815921; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9TYuMpa3lECo5TxM+RObwV30bGxY9a5ZOYB/MAe2Vms=;
        b=KzT5z9f7Qstqz5gASosUohW/1QNFGY0+HWwUOUpUlOyFZeMoSWrkg9Vr3bh4oI4yPy
         2u//ffd3cu8aPjU5v3FM+are4v2QR0ApQViZ5LxkdQoXxUJww0OmIJuUbBo2NsCAWz/k
         gg7nlW/c1kfeD25x1lflH+7wE1jMLEgkk8euk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747211121; x=1747815921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9TYuMpa3lECo5TxM+RObwV30bGxY9a5ZOYB/MAe2Vms=;
        b=nWt+S6AJKclTOd2xTOZGS2wy/KXerz0IUS3xYCGX+SX7JSEQtlzXiTuef41hwAnGEo
         Jbux+t1RRuvQbruQ/iU+L6jYXqHEo8b8V+qwYZidTLYmgk49YQC8QZR1f0DspDa1Gwda
         sfYEH0ezpqum22kNQAqQk//pC3NOWxSDbmJBqbbQEYE8Nxek4fU55Zu+Ae/fepYd3JLl
         F8boGt89lxA8ixLwSgATBroElt9XW/86xBjF3F0AMWcUjfsLxJRzl43GZOUDJfBjPx56
         0T9Pv9KBFEeYLJgtWXh7lyBm+JALw6RQnWhL5CuTxvxC999AeZodWh4W8Xh9VQyTPoYs
         Q4eA==
X-Gm-Message-State: AOJu0Yzn1OqAuzplkMk++NADO0sAGUUP1duZru7euvs11BJx0SCxvtDs
	mFcxLAvH+HOX18jC5VmEL852N/COqKWXICaI/3aRFq9DvVKbsv7BDQE8knZFFaJ0Eus/dgEFc+2
	UJck=
X-Gm-Gg: ASbGnctF9l1dUGMkEfUXIHDAsOiiK70kHTBnaR9TbmFCZIab9i6urHqdqSE7aB0aJSA
	0v2hdDNKTlGBu1qYZX1Tkn6GGSBbuEMzUAzMF1edZbpCgg2rMeXpYTA1Xpd/s+Ha+bCtoue6FD9
	lUYOKySjVPFR5EHMayeXpRF6kQcvzsnkrbpay8CJGwk4t1/R2s5eyW8y/rNQBOTBVYU+8qLilCb
	RuLm4uMLMAkf+7loLFY9FdQupxaNIUNLdVTj6hk0P0wgmfqBOlC6c/TQ/mnCtW4iprAMJvfhmOC
	ymCaevE9BpFg1umuaU/hiUcF2+efWmikyhNV8yBRwk+XODdAfWnkptoWsLhq9hvN3AfkVPJZv8s
	wOcgJyOlCrQrosjw9ze6KGrNLcEOYpYKwqtI34rMBKAX4E+cXF7CKQQ==
X-Google-Smtp-Source: AGHT+IElgZGelBk5zT2GgVn2jS8QC31s8cj0ziUv3wJ5MYE4/n7YxAgcmx5VnwG5fRUicYlfJQi+aA==
X-Received: by 2002:a05:600c:3c8e:b0:43d:fa59:af97 with SMTP id 5b1f17b1804b1-442f2179bd8mr15288665e9.32.1747211121301;
        Wed, 14 May 2025 01:25:21 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.client.m3-hotspots.de ([46.189.28.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442ebda7d2csm30987365e9.3.2025.05.14.01.25.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 01:25:20 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Simon Holesch <simon.holesch@bshg.com>,
	Karthikdatt Anantharamrao <karthikdatt.anantharamrao@in.bosch.com>,
	michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Wolfgang Birkner <wolfgang.birkner@bshg.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 7/9] arm64: dts: imx8mn-bsh-smm-s2-common: Set minimum value for VDD_3V3
Date: Wed, 14 May 2025 10:25:01 +0200
Message-ID: <20250514082507.1983849-8-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250514082507.1983849-1-dario.binacchi@amarulasolutions.com>
References: <20250514082507.1983849-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wolfgang Birkner <wolfgang.birkner@bshg.com>

Buck4 is called Buck6 in the BD71847 datasheet. This buck supports
2.6...3.3V. Set the minimum allowed value.

Signed-off-by: Wolfgang Birkner <wolfgang.birkner@bshg.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
index 81fa0a8767e2..04112a83b1d3 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
@@ -144,7 +144,7 @@ buck3_reg: BUCK3 {
 			buck4_reg: BUCK4 {
 				/* PMIC_BUCK6 - VDD_3V3 */
 				regulator-name = "buck4";
-				regulator-min-microvolt = <3000000>;
+				regulator-min-microvolt = <2600000>;
 				regulator-max-microvolt = <3300000>;
 				regulator-boot-on;
 				regulator-always-on;
-- 
2.43.0

