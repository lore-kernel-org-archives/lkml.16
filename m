Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD00B221FC8
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 08:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747211123; cv=none; b=hrweQcSkoO+PuHvZY/aIdwC4dAjbDGfhxvwdKOe6jJf+DE9oTco4dldUdjprmFIGb1wWqPe4YBDm6G8EcMwlm9QsygGInhRGEiJjwD+lkYlQkrBhRs/ZWBElCqgCVnGDBhUdt8+bAkQuHuqhn7lFJDXeAQKY1oery7k+Mo65bAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747211123; c=relaxed/simple;
	bh=ZipZSEekCOwBPZ18Fcs5qi+NhaNjKzgEVYb+83pi89E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mW6L/QKcPw/BuyKIxXXO78+Yr1Mra6jPsILngkHQR1mKhW1MeIQlNYJnWQKP7Qq6bfCymkrntUhOnWGBEDPg498X5wCBqpEP6LeMWe/dv5GVej1lYioDIi3aOXlUWObxM0Rlb+tfRUA2M16ug3PwHsrFpH3KgHr8tkeT2dGehC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=OcnEbZ3Q; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="OcnEbZ3Q"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-442ec3ce724so11782275e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 01:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1747211120; x=1747815920; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aKqfhyziPKh1buAFQiruekyv9kuJ09baYGjn2NGVAIE=;
        b=OcnEbZ3Q/hL9MPq7JnFY/7xsrGc9O6QzXfOCdi8Cz4R6Fk1+rezpC32LFNFc+jBche
         zu3ZqjeIrCOWcSlbtSm1kcwe5BGGNpaALUjGrjsEiMNEBn9ZTH8qVsY6a1WxLralZqPI
         Txnd8/3sieMgT2G1Hm/bXPJuhRvhFWmCKVais=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747211120; x=1747815920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aKqfhyziPKh1buAFQiruekyv9kuJ09baYGjn2NGVAIE=;
        b=dmG4i5NiU3GukpUEZGxJXxPCjCLYK9sdzvsJUtGhk0d22oVz2hlfq9dz1s+xQRNT4Z
         UGemTE8DOBrixoaWk6EEGon8mG75Pc7iSNH3HREhGPONwam0qyOAPTc9GUTMsDJl3oDO
         LVfGtnOogOc2iXXnXKb5Kbja9BZvLbC+5+2Q2uFiAsCOvKQknrs+U5YMd0epnFG/P4w1
         GyVpH0QYuFbTIsEJmn41xZ9wMZncIC45w3xGThmMaNruNDSB2IvJ2XLnjuqNw7WPEi1R
         kkZNsRJDNzvYWSCWp8CtoHHWtsZRIkENk+P0mY4dMrnc5K6OIlfxhTSbEVX5Lhf8nmPI
         pkDA==
X-Gm-Message-State: AOJu0YyJwNcW82VlR/4QByx4EnqN4lAu0ItiuDkW1N0YFAqjwtRAn13v
	g6IuYMFEJZtmbQkbS7XRBVQB27KiSc6tqd8Q5YESSSF9WEVWqDbVmFyVs6aS07LR9blgkgS4ESs
	At88=
X-Gm-Gg: ASbGncuBrFVlYnEsNz2682aGC1IVwzUGHNZ6S+six1ZLjw4UZN8sDEGMYmy+LNgl3Yc
	RTKjyWNPA6cUjDfzDnQ2GcTcy7nNU49K8sdPk+qlu9LbnYqKNZhu1O2PK7LGzYF60Pi/7dyQx2S
	E6+QgzRQ37olMC6kOgRfqg/vRrMypqKMG2RhN9CAmdZ47t0ve/RAPjJP4LjAQgCVNCdMK4c1V+y
	kZ5zRumcafrMUGxdSBzGT0AHsiTV4nwmc5LOj4RoEsNmjKK7OQC2b0nb3CwivmhI25ft8IGN436
	KVHsgEFFpJeVsWnydyKfxfubk2IJmmfHMubQSCr35PTavlnAKm4KS0zJF5LjcwkSeQrYN5CSoqi
	lW+UTFwhRTtNcOi4N1UFNAd3k2M4GiA3yAzRMy7o2meI=
X-Google-Smtp-Source: AGHT+IHcoj4ReIr/iS8EBigcY3fpcStHE6rMJeIJaxLW28FmlfG9AFQQiTloWrHrTZYCmAs4sAUIcA==
X-Received: by 2002:a05:600c:1e2a:b0:442:d9fc:7de with SMTP id 5b1f17b1804b1-442f21696fdmr16799435e9.22.1747211119909;
        Wed, 14 May 2025 01:25:19 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.client.m3-hotspots.de ([46.189.28.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442ebda7d2csm30987365e9.3.2025.05.14.01.25.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 01:25:19 -0700 (PDT)
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
Subject: [PATCH 6/9] arm64: dts: imx8mn-bsh-smm-s2-common: Set minimum value for VDD_DRAM_VPU_GPU
Date: Wed, 14 May 2025 10:25:00 +0200
Message-ID: <20250514082507.1983849-7-dario.binacchi@amarulasolutions.com>
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

Buck3 is called Buck5 in the BD71847 datasheet. This buck supports
0.55...1.35V. Set the minimum allowed value.

Signed-off-by: Wolfgang Birkner <wolfgang.birkner@bshg.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
index fd12b97525d1..81fa0a8767e2 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
@@ -135,7 +135,7 @@ buck2_reg: BUCK2 {
 			buck3_reg: BUCK3 {
 				/* PMIC_BUCK5 - VDD_DRAM_VPU_GPU */
 				regulator-name = "buck3";
-				regulator-min-microvolt = <700000>;
+				regulator-min-microvolt = <550000>;
 				regulator-max-microvolt = <1350000>;
 				regulator-boot-on;
 				regulator-always-on;
-- 
2.43.0

