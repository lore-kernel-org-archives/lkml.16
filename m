Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBC3A182BD;
	Sat,  5 Apr 2025 00:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743812134; cv=none; b=gwy58GeeFArltkqj/JRYXzb4URws3qTqFIXLjDJHXLzHerXHWG5R7EVJYluYuvYdjAqOJ8Siy0ZRn7y8qj4AMtk0HKAwmPnayBuFExT/RIQY3qZzUG13gQ8/5DPfGjPr5yV/Pa4gV5uWNiH3qFL7piFWudTLbJHxMJ2CFm/6UhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743812134; c=relaxed/simple;
	bh=676EeJdGm3Q/CL3ppATqn5FS/L/FgHuEr+5zetRU4mU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aZPZVdi0LUUkGQdmkny0c6/XC1cxfTZRinI0z91GL7R4YEo2KZglyMU3jdGzFEMUjjsEalr4QcdVq74AiV0DJonBnDUbibvo0Zz/GqZEM0L2Qjh6NdhRx+KQgmkWi3+6Y8BSFWBvzQrFvMcWSDe/HwVbSeyT2MQlMnsTMYlqIh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=YANhNrHV; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="YANhNrHV"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5350FI7Y3922102
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 4 Apr 2025 19:15:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1743812118;
	bh=KfuHzB09gQzDVN1YPTwSbJ0e9xT70zByEt80tSecGcE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=YANhNrHVHj4DJUR7MXUR0rke7qm5LsA6BzZAjWKxPX7z6b6wh67URXubJBSNCsNkV
	 aimEk9dMig4rUhaa5MmG/7BxgkVAfWoC5GJfFdkcgo4IaOQH1tHVznvUZHJ8LrXQcy
	 uyabcLZXBbnIIMFEw3tWgYWdQfqcr7iHorHvPob4=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5350FIdD038155
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 4 Apr 2025 19:15:18 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 4
 Apr 2025 19:15:18 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 4 Apr 2025 19:15:18 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5350FI5a065952;
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
Subject: [PATCH v6 01/11] arm64: dts: ti: k3-am62: Add ATCM and BTCM cbass ranges
Date: Fri, 4 Apr 2025 19:15:08 -0500
Message-ID: <20250405001518.1315273-2-jm@ti.com>
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

Add cbass ranges for ATCM and BTCM on am62x device, without
these, remoteproc driver fails to probe and attach to the DM
r5 core and IPC communication is broken.

Signed-off-by: Judith Mendez <jm@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62.dtsi | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62.dtsi b/arch/arm64/boot/dts/ti/k3-am62.dtsi
index bfb55ca113239..59f6dff552ed4 100644
--- a/arch/arm64/boot/dts/ti/k3-am62.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62.dtsi
@@ -86,7 +86,9 @@ cbass_main: bus@f0000 {
 			 /* Wakeup Domain Range */
 			 <0x00 0x00b00000 0x00 0x00b00000 0x00 0x00002400>, /* VTM */
 			 <0x00 0x2b000000 0x00 0x2b000000 0x00 0x00300400>,
-			 <0x00 0x43000000 0x00 0x43000000 0x00 0x00020000>;
+			 <0x00 0x43000000 0x00 0x43000000 0x00 0x00020000>,
+			 <0x00 0x78000000 0x00 0x78000000 0x00 0x00008000>, /* DM R5 ATCM*/
+			 <0x00 0x78100000 0x00 0x78100000 0x00 0x00008000>; /* DM R5 BTCM*/
 
 		cbass_mcu: bus@4000000 {
 			bootph-all;
@@ -103,7 +105,9 @@ cbass_wakeup: bus@b00000 {
 			#size-cells = <2>;
 			ranges = <0x00 0x00b00000 0x00 0x00b00000 0x00 0x00002400>, /* VTM */
 				 <0x00 0x2b000000 0x00 0x2b000000 0x00 0x00300400>, /* Peripheral Window */
-				 <0x00 0x43000000 0x00 0x43000000 0x00 0x00020000>;
+				 <0x00 0x43000000 0x00 0x43000000 0x00 0x00020000>,
+				 <0x00 0x78000000 0x00 0x78000000 0x00 0x00008000>, /* DM R5 ATCM*/
+				 <0x00 0x78100000 0x00 0x78100000 0x00 0x00008000>; /* DM R5 BTCM*/
 		};
 	};
 
-- 
2.49.0

