Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 025C62FB2;
	Sat,  5 Apr 2025 00:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743812135; cv=none; b=fBSzWho6tD1v8kC5V54r0FNxMPJl47pZo27vcRsFPFusAunTbxqC2t1MJ5TUlUOifWClha2FEApaW0pM0E9E8Mp2IgYqSO0Tmg3jcD8llk8mICvadJhiMjGxIWUfv0Z2FcR+R8ZiBprHtNNno4OSORscZek1n42Y5yxefo0+KIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743812135; c=relaxed/simple;
	bh=uFR/fqFEyryfV8WtLTk6FtyGkz+FUGyA2syaYBYehAg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZIvPCQAOH1TB+ue5X80VuBl/+/Q4kpuZ/q1NCDuDx7Aj6kLWyr7avgMM+UEdJ5tPX2Bw4+Z8yev9I0eNRxLkKbcc6jLsiZEzzHzC41eJNB1e1V8B1QPLV8X27R9Gxm94NnxeXfZZS+JOMgsiNFg3mzYW0m1naEB8fxebrDrj4UU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Yn7lu6MB; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Yn7lu6MB"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5350FJC54072977
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 4 Apr 2025 19:15:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1743812119;
	bh=OTq4UdWHJFuAiM+oo3eenuRmPm/h270vOixLYg4RaqU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Yn7lu6MB1NQ0tJUs8fT8GatJUGtD1LVGJtDoU9YDQoTDiWRuCltM+4pajt9vTZpKx
	 bGk8m/ZECY46EL7fnVy4O7fqodHRKc0zQDwmKlHIbXvT5UFsNa6wukhsJ/y5Ogc5mN
	 c5IJSXl249i1Fg9okbZqbBapS9i90qaph0IzX1z0=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5350FJU1038172
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 4 Apr 2025 19:15:19 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 4
 Apr 2025 19:15:19 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 4 Apr 2025 19:15:18 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5350FI5j065952;
	Fri, 4 Apr 2025 19:15:18 -0500
From: Judith Mendez <jm@ti.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Hari Nagalla <hnagalla@ti.com>,
        Beleswar
 Padhi <b-padhi@ti.com>, Andrew Davis <afd@ti.com>,
        Markus Schneider-Pargmann
	<msp@baylibre.com>
Subject: [PATCH v6 10/11] arm64: dts: ti: k3-am62a7-sk: Reserve main_rti4 for C7x DSP
Date: Fri, 4 Apr 2025 19:15:17 -0500
Message-ID: <20250405001518.1315273-11-jm@ti.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250405001518.1315273-1-jm@ti.com>
References: <20250405001518.1315273-1-jm@ti.com>
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

The main rti4 watchdog timer is used by the C7x DSP, so reserve the
timer in the linux device tree.

Signed-off-by: Hari Nagalla <hnagalla@ti.com>
Signed-off-by: Judith Mendez <jm@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
index 8d7645bb90337..032f1f18d184e 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
@@ -830,3 +830,8 @@ &c7x_0 {
 			<&c7x_0_memory_region>;
 	status = "okay";
 };
+
+/* main_rti4 is used by C7x DSP */
+&main_rti4 {
+	status = "reserved";
+};
-- 
2.49.0

