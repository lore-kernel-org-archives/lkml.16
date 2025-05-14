Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFCC8219A93
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 08:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747211116; cv=none; b=dS14YIjdtU5gz9tVpeBwkpG5YL9tgFcISZSbjcEqhzdDm/dz0loDh5RNKjRm7PekWQH3qb7uUjUPWcOLUT8JjTGu+zCp7kf7MCMzWqLGTbSLT6GwjOrNN0nCSr2KaDiMFsi+qpG04kSHyaOzE98th1Lxe49bn9oVpyAXSFdPMxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747211116; c=relaxed/simple;
	bh=uiM6JF5iJm5AA3IbWqccn6aF5CeCQk9Fp9a1aKYnJ5M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LHtNDISxSGvBfHXR8jf+5Cv531qRdjez1zZALhfqVr8Kx7FvSOOArsv4VGvoLuG2fZ4InVoKatB4Xzz+/u/TGXXdk0xZp3ZSZV4cJ0fEx+aduml/mH8SsdhbkPN0Ydi0jrCxXKWvpQJMJ+XKDQjFFXeweQgRiWiIobVINh40vzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=aGfC4uLB; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="aGfC4uLB"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43ede096d73so44978945e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 01:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1747211113; x=1747815913; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=APXOpnkKR2dL3UO348/Gsh5gr4ZIHC6LxJe7czOv/OQ=;
        b=aGfC4uLBO+kz6PsptkrrgZtb1QrVkbKHOsoVdOc3VQS4YCY8iX433LWmwiSIFTMPSm
         lh6CGqDTyLW5oyFMhZlTPihEF5L536YuMZFBCyIBa2Lpl+p32bZbGIO/EDD+B/NitHyT
         FRdFoN6/s+hVrouHl250M6+9qupPV9Pz9K5Nk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747211113; x=1747815913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=APXOpnkKR2dL3UO348/Gsh5gr4ZIHC6LxJe7czOv/OQ=;
        b=OOHz12Li1//xLeAdx701YDrrl+zHKwEYNz3NLbLic/igYXArwrxxZGO+Jl5Xje8fXb
         gYoiKDIwOePqfMuCsyeVkXQJzzhGgLHAoT+jPZQXM13woWquebGvGgW1/TUDa4cVmRy8
         YYrE4jVYXp86E00R1J8d4Fi1LRHz06EHWsXpd3rIDDhrJTKQeQ2Yp4sY3BWZelLRlTpU
         LYPHX2LAj0zKJoIF4lW/pU7ofyJwA3M5jBBgOtKzprUv4+hPyMbIlnnXbAsMgKeZP30O
         +n3H7IK8HQyeYm9PIUBmbynXj4KFHJQfzHbEwjjTm0n+rIgSu2njk2Ab74Rnin7bf/9e
         zYfA==
X-Gm-Message-State: AOJu0YyGLe2uP+Wevw9JnUKIw4ggI7ZpYyUs5e1ePbMHErQCnZ6GfRuE
	9gX+f75wJHXi+yG5FyMgaOwwLI1q00qUUI3IPVoiIImFrgjRBGaHvR6M72GApiRtErtIYd/DrBJ
	M/+E=
X-Gm-Gg: ASbGnctNdnvRjbuOnbCZ1XYZlMUzRdOOI70F+Pol4klwP72k6a38W1NZd7q3wdCPXAY
	Fpax43yv3iCE+TGxqT9IPknrHm3hav+WdbmauY1yGe54emZejRPCoEk3UkcGobnX9sBhcR2ZhPt
	Iog3NhcrtV44DrrlT84daYegIgRZknmDJUdXRRMMzymjFWrdp3vLv/g1M4ugtRPVQy2PEcy7/Yg
	CfqXE2ZrSEFIJxaDIj0UY0J/TnKcl+5T+jTbHM31GbUlZjVx+WU/K9Ns50o6/EXhFerC/iNOsjx
	8BEtKh5fy2QpMcTaL9gD1c60kIvaGHfyI2fk3agqYKbuWPNsnG2Ex1ujn/2ytTcyTxBTwUikW9Z
	PsQnrBoHeJNFXmO242XNkWXMozyUtseexXCvakeUJPhg=
X-Google-Smtp-Source: AGHT+IFPJ0BA1CsQj8STL33YJFdXEivrOIUNuDI5cLI9H+T44prBBCXb/RtByLVzJ5qOgclAySopgQ==
X-Received: by 2002:a05:600c:a378:b0:43c:f050:fed3 with SMTP id 5b1f17b1804b1-442f20d9d37mr19135815e9.11.1747211112873;
        Wed, 14 May 2025 01:25:12 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.client.m3-hotspots.de ([46.189.28.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442ebda7d2csm30987365e9.3.2025.05.14.01.25.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 01:25:12 -0700 (PDT)
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
Subject: [PATCH 1/9] arm64: dts: imx8mn-bsh-smm-s2-common: Define suspend voltage threshold
Date: Wed, 14 May 2025 10:24:55 +0200
Message-ID: <20250514082507.1983849-2-dario.binacchi@amarulasolutions.com>
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

From: Michael Trimarchi <michael@amarulasolutions.com>

Voltage threshold should be adjust according to the worst case.

Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 .../boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi  | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
index bbb07c650da9..5a1ec2f6a552 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
@@ -105,6 +105,12 @@ buck1_reg: BUCK1 {
 				regulator-boot-on;
 				regulator-always-on;
 				regulator-ramp-delay = <1250>;
+
+				/* enable autosuspend threshold */
+				rohm,dvs-run-voltage = <850000>;
+				rohm,dvs-idle-voltage = <850000>;
+				rohm,dvs-suspend-voltage = <850000>;
+				rohm,no-regulator-enable-control;
 			};
 
 			buck2_reg: BUCK2 {
@@ -115,6 +121,11 @@ buck2_reg: BUCK2 {
 				regulator-boot-on;
 				regulator-always-on;
 				regulator-ramp-delay = <1250>;
+
+				/* enable autosuspend threshold */
+				rohm,dvs-run-voltage = <960000>;
+				rohm,dvs-idle-voltage = <860000>;
+				rohm,no-regulator-enable-control;
 			};
 
 			buck3_reg: BUCK3 {
-- 
2.43.0

