Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3E421F4CA1;
	Fri, 23 May 2025 20:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748031868; cv=none; b=abJzaMnkJkHP52/f14Z96x0LfopAI+EgOQMLGXu0LtZkjFZbO73AxtiT6jfh60NKjKN0ahFCbqKxmKp0S3s1s+vG+OEfDUz0V9uxOjcli7l9aDHNLTknYdVaunPrLnPbpI7DBlpO3ebANVR3pqgLrdWHukMbIYtFsbyxMOv+RAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748031868; c=relaxed/simple;
	bh=slgQ4tGw0dIzbPUtpd9MpwQXa0+Hq2+4GkuyaOoSWEw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pdC6Vh/YFyfUPOmKrMwonf1+bTb9yzC9ArRWIq3G1xbMM5K4Eai8b2WrmJKWOc7a0fbxshW5tulFsjXjEhPkNeGNFUZRedWuWtR8IlHdoTP3Ln0RYtZ93o3wdIZlz8Tv5tRPPJgd4JI20OEgCxdgZtl9uKtXisbJzoTgI1+99m0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=ss0M6cHX; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="ss0M6cHX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1748031867; x=1779567867;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=slgQ4tGw0dIzbPUtpd9MpwQXa0+Hq2+4GkuyaOoSWEw=;
  b=ss0M6cHXMdxVLphil/F/DPKUBGl7sl3zn+NQFJLF+3fE9f8l5qYNpPxL
   eSecLoArq2lXl7C4X2aSVECVxFxNkrAH2tvmxo8fImDHbSVHeUXYhlIT6
   QKmx00a95ePecXy1QxBRMXuNMwzbM+mOxKNOyWC3DgtGVNDqlMOHpvKjD
   Yv1YIopNv/4OWfyHvui6xCvm8eCP0DUJ5VDPzQBLccyeJdovRNMtqIM2O
   6n7ILuaqnohJlEYdSCTERnO5Uaao/dCQ5snJnxdn4rMIRELMYTlMA8RzV
   92bAjg2ayFMIYSFi0cJqeqIZXvV13Fkot/QTmwIRMj+h0sZnqbbvb7Lmj
   Q==;
X-CSE-ConnectionGUID: KBUIaMEtQL+E9GaMz9Liiw==
X-CSE-MsgGUID: MjZoIeOOQDCXgZgMCuSc1Q==
X-IronPort-AV: E=Sophos;i="6.15,309,1739862000"; 
   d="scan'208";a="46850862"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 23 May 2025 13:24:18 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 23 May 2025 13:23:58 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Fri, 23 May 2025 13:23:58 -0700
From: <Ryan.Wanner@microchip.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Ryan Wanner <Ryan.Wanner@microchip.com>
Subject: [PATCH v4 2/2] ARM: dts: microchip: sama7d65: Add clock name property
Date: Fri, 23 May 2025 13:24:31 -0700
Message-ID: <f6ae8a38a005e1a4e025b25ddb29113c5e65dead.1748030737.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1748030737.git.Ryan.Wanner@microchip.com>
References: <cover.1748030737.git.Ryan.Wanner@microchip.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Ryan Wanner <Ryan.Wanner@microchip.com>

Add clock-output-names to the xtal nodes, so the driver can correctly
register the main and slow xtal.

This fixes the issue of the SoC clock driver not being able to find
the main xtal and slow xtal correctly causing a bad clock tree.

Fixes: 261dcfad1b59 ("ARM: dts: microchip: add sama7d65 SoC DT")
Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 arch/arm/boot/dts/microchip/sama7d65.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/microchip/sama7d65.dtsi b/arch/arm/boot/dts/microchip/sama7d65.dtsi
index b6710ccd4c36..7b1dd28a2cfa 100644
--- a/arch/arm/boot/dts/microchip/sama7d65.dtsi
+++ b/arch/arm/boot/dts/microchip/sama7d65.dtsi
@@ -38,11 +38,13 @@ cpu0: cpu@0 {
 	clocks {
 		main_xtal: clock-mainxtal {
 			compatible = "fixed-clock";
+			clock-output-names = "main_xtal";
 			#clock-cells = <0>;
 		};
 
 		slow_xtal: clock-slowxtal {
 			compatible = "fixed-clock";
+			clock-output-names = "slow_xtal";
 			#clock-cells = <0>;
 		};
 	};
-- 
2.43.0

