Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D88FF253335;
	Mon, 10 Feb 2025 22:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739225753; cv=none; b=c1t7kmin5IIwSEhnego5cWJdukI1n4rMhA4EYWBN9930cEcZu4MVGKCoMVNdBmaH0PHw7SZORPkO778HcUq/GfyfLq++uM2NoOfMq5+8TcdlTEBqnFDOudMl/wJ6N9CvaUo6mmv5wRoUR9CMjA/aKlUQrFHbgMdtfN/kCZqlJnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739225753; c=relaxed/simple;
	bh=91sTacgz9p+KwjU1lskhqm8dc9JXuQ856Cv9OBvczeo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZMHBFJNFS44B5f4xVtDdkf9jbB1MVuprCFoeCNBOdTBUA1HY8B9a85uKJXN3vv2Jfh9BjF1ERo8CD/mOMRYiyc3pXnYIdey60TQ/IPOu8s85mkwXPNGkOXh8sFuEWX0FNVqJCxXQ+C8NBda3FHP71HgHQ0ujYqjtkgEhot/gEgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=efs5kKzt; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="efs5kKzt"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51AMFVdL121117
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 10 Feb 2025 16:15:31 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1739225731;
	bh=D5S5//aZhfmSjDDmMcuWe14/vJFESxxanw/t/AbW1rU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=efs5kKzt52QOnKV3daqB/l9E4wTgIzg9hnwuL8PhSw/lHNCFca0Dc0J1Q487NDdbP
	 JNuQs5JTBXReL21bWTK4p6y8Gyg7fI9T5AnpgFvOJJY1mdQrLLSIQ7hsJLKuC9S8hL
	 DNoxPO5D4jYDGISNWud2jjWGtrSK6IwEV2W9ME2k=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51AMFVqk002427
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 10 Feb 2025 16:15:31 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 10
 Feb 2025 16:15:31 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 10 Feb 2025 16:15:30 -0600
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51AMFUZA112628;
	Mon, 10 Feb 2025 16:15:30 -0600
From: Judith Mendez <jm@ti.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Andrew Davis
	<afd@ti.com>,
        Hari Nagalla <hnagalla@ti.com>, Judith Mendez <jm@ti.com>
Subject: [PATCH v5 08/10] arm64: dts: ti: k3-am62a7-sk: Reserve main_timer2 for C7x DSP
Date: Mon, 10 Feb 2025 16:15:28 -0600
Message-ID: <20250210221530.1234009-9-jm@ti.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250210221530.1234009-1-jm@ti.com>
References: <20250210221530.1234009-1-jm@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

From: Hari Nagalla <hnagalla@ti.com>

C7x DSP uses main_timer2, so mark it as reserved in linux DT.

Signed-off-by: Hari Nagalla <hnagalla@ti.com>
Signed-off-by: Judith Mendez <jm@ti.com>
---
Changes since v4:
- No change
---
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
index ac67c51caa211..11390a8742453 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
@@ -679,6 +679,11 @@ &main_uart1 {
 	status = "reserved";
 };
 
+/* main_timer2 is used by C7x DSP */
+&main_timer2 {
+	status = "reserved";
+};
+
 &usbss0 {
 	status = "okay";
 	ti,vbus-divider;
-- 
2.48.0

