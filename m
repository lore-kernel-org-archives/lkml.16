Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E398329CE6;
	Thu, 12 Jun 2025 00:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749688771; cv=none; b=BBjISbvHjTDZBV72N/41gZmyRaxZSJBusu9qJ0rWIr0uHd7eUZUomgWJiRKb09PtKaKidEp1NOzUr6S/kTDc9rLxRqjJ8cX1hENMwSCZacy4Qf/yGRlUUc0hcsQoy5A2Oe4S4Y3w72bPLQ75iO6B7mW4n0BuvEHdZ1VIe+v7Sf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749688771; c=relaxed/simple;
	bh=pc5IEugCvdYtSbRb0olcPUfngGpQpb1o/qW+d9x1c2I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MHgWudAw9WdKA9cjWB1o7Kb4Dstg38+OAvDsxuDBZn0vXGZA+2evh3vZT1ua3KnMlWQxqeygjCH7g600nxFDrL2oO7dENp/fjhOmCjUWN716WfH8l5JHl2JS8fITYvMKGh/heH5Ebp5I8N8nlsnfSCa6irABewBeD7rj18JeHDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fj/iBwTz; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fj/iBwTz"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7d0976776dcso42725285a.2;
        Wed, 11 Jun 2025 17:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749688769; x=1750293569; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ht07tlK7uVqjW6eAyQxL9Kr0y3ckT/a8+OLYs3oBRRE=;
        b=Fj/iBwTzZW9JnR337ujCfm2cheR2WfvYDhd7HBa/Fxt8gpkIso+qOic2a7+UOO0lFV
         G6eNJ3Yw1jPC+afweBf+phbPBzX39QCLTtmi8uukFvXa65nmNQmTwi0UOR4/7NP4ExKh
         sbT8hVQg1nzd/gc8hB0IUBWZdJ+jKIrWNballlSU2stRWCsvgPXyhiBlMlPHs9FTLemc
         FOoxTFsj4CV2oz5kiHvmyGkDUpSGyCF90LpR8TN0Ldu7FAR9raQE6kim0F0Riwaj1BYA
         UcGUMOE4PTs85exinS68s5pv81X4s6yBr9hE3gYwRweKcDKse/Zw54dD4vlhxqaYTrdg
         GQKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749688769; x=1750293569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ht07tlK7uVqjW6eAyQxL9Kr0y3ckT/a8+OLYs3oBRRE=;
        b=FbRU4jfw+0Aj+ZbP408h6496zi18Uwg1HRiNrNkdX+6pOAOGxITjvyKe2T7v/g+7jU
         LNUbT3avtrOmL3KysfXl16smnDqJkJxdhlM20ZNUQnYc/aF+Ik/bxJ7R5IBqoOi64fOa
         3X9wAIDQinu8mq7HZDav4EvlxxRoZqZodRVwQoy4uNtr4C2fQCjucrA60LHvAALvq5FO
         D/iLydAuxmB30q6IzN+nda2kYYlxSIMEmeZkSequ21kcOgqjXfa3j+iG7rLfySkuzrLV
         orQ1MXn+USNdixsDIGzFnm/Jaqs9bnKvQ25PG2m+3d9OCB7GoHqkibPkjOISmJKnVEXo
         qp3g==
X-Forwarded-Encrypted: i=1; AJvYcCWbWSC4Ln8RojCDzQ8sjyP/UBMXM/sSjS/8zZNGfN1pLlDuMUE2CX3JaZGUAeeqJAIKVatkX+prPBAY@vger.kernel.org, AJvYcCXL2AvuMoFjdk1YzeYaCrDyasi8TBoHFj3buRcDfbz+qQORBOLm7rnG2FIrlbli4QfSUbqBQW7bGaRMv7Hz@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3mbjOwN4jyKADKQqqFH8G+OW6cd9vM3j7qLPZyZjdbXxla4+S
	Wq8ShywBHXIpx+sWx+iWm/W9C2tqUkrF/jj1HLJ7dOGlIM26Pxw/0qU+
X-Gm-Gg: ASbGncsrOtw42ZTFX7ze8FNxjYnIL/SuGGB/Nu47vMNEFybc4F/VolihtQWPdk0QZlk
	0WBT6WUTSmZ4+bvpT4GLf0x5lDfGVkzm28sli2/XU0CG6wx8es9Lv2tvhIlw3cFKEgFz6vuZZrG
	DDYnpGI4GFRu3b1ztP71eYwvwiHJtwzDrtGN1cUlZmNVcDkHJUEQwIU4tELn1kePYd+JIymEueh
	po92gasV/FLIvH++xIa1vN6znwBui6uaJ13A9ekAGziol43gCUgqGxvXr4r7R1VO4fyLp4nbTEX
	De5MILHpQZ94yg0FKvQWhl1PIvJRFcrUAxEyqZqCuZ3RzV2xBpZEBS9ajK7cpIjTcOYgqWrhiVI
	e180wcwTQdc088DuC7N8OuOp7gAA3VkZBPu4m
X-Google-Smtp-Source: AGHT+IHj92rjE5qEUlCyMD3EgBcwTmr2UdNmG+KE1Nz52ks8zHt3wuxrHowijrdAL92PLvCq+AMakA==
X-Received: by 2002:a05:620a:2699:b0:7c5:49b7:237a with SMTP id af79cd13be357-7d3b360025emr167835485a.19.1749688768755;
        Wed, 11 Jun 2025 17:39:28 -0700 (PDT)
Received: from aford-System-Version.. (c-75-72-162-184.hsd1.mn.comcast.net. [75.72.162.184])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3b528c300sm35935485a.101.2025.06.11.17.39.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 17:39:28 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: aford@beaconembedded.com,
	m.felsch@pengutronix.de,
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
Subject: [PATCH V2 1/4] arm64: dts: imx8mp: drop gpcv2 vpu power-domains and clocks
Date: Wed, 11 Jun 2025 19:39:19 -0500
Message-ID: <20250612003924.178251-2-aford173@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250612003924.178251-1-aford173@gmail.com>
References: <20250612003924.178251-1-aford173@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Marco Felsch <m.felsch@pengutronix.de>

The GPCv2 G1, G2 and VC8000E power-domain don't need to reference the
VPUMIX power-domain nor their module clocks since the power and reset
handling is done by the VPUMIX blkctrl driver.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
Signed-off-by: Adam Ford <aford173@gmail.com>

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index 948b88cf5e9d..1bf15c502280 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -876,24 +876,17 @@ pgc_mediamix: power-domain@10 {
 
 					pgc_vpu_g1: power-domain@11 {
 						#power-domain-cells = <0>;
-						power-domains = <&pgc_vpumix>;
 						reg = <IMX8MP_POWER_DOMAIN_VPU_G1>;
-						clocks = <&clk IMX8MP_CLK_VPU_G1_ROOT>;
 					};
 
 					pgc_vpu_g2: power-domain@12 {
 						#power-domain-cells = <0>;
-						power-domains = <&pgc_vpumix>;
 						reg = <IMX8MP_POWER_DOMAIN_VPU_G2>;
-						clocks = <&clk IMX8MP_CLK_VPU_G2_ROOT>;
-
 					};
 
 					pgc_vpu_vc8000e: power-domain@13 {
 						#power-domain-cells = <0>;
-						power-domains = <&pgc_vpumix>;
 						reg = <IMX8MP_POWER_DOMAIN_VPU_VC8000E>;
-						clocks = <&clk IMX8MP_CLK_VPU_VC8KE_ROOT>;
 					};
 
 					pgc_hdmimix: power-domain@14 {
-- 
2.48.1

