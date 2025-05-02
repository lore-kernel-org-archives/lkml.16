Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A62A522F740;
	Fri,  2 May 2025 22:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746223427; cv=none; b=uNXCiAxfc5rsKn70xRfKqt+h8TFEHHf+ApSaPcD0V/dRqJ3BN24Sh8jJh6J0lExV7shA35YYV0RE7tMQgSAZy1NKZvyp/nq20WpuSW1WTKMDvZfZkcD4ygYuuC3gRWrk/8k4n9WInIzIyzfXtPeLnjbeeyZld7BTX8g6gnj/ZUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746223427; c=relaxed/simple;
	bh=Thwd6MRSD2RM8Smfp+f5EyrRhOVVFoHe54Jbtp3CDxM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eTIRVzGdzR8mOwaAK3ofh40eEul1Q7s1EvuqRjNv5el8GXU78k8N/AvkpSIBozBtFLhrMXnttCAdAQBPjnImgRhEwoIV6Yef83p0hopT6Hd4sQ2R+TLzWHg/oLHfbRyiCzbUwgS6nbsKlTd5iDuzodQIUYYSOPZ9118BH3XrUyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=NgkpgE85; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="NgkpgE85"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 542M3QPm500003
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 2 May 2025 17:03:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746223407;
	bh=FWlZZog+xI4b0spP/ZWdcQgjKse3LrOk/NzAyoIs+g4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=NgkpgE85LmgxDPGUOQ4c1US2Bzx6r52tZBPlEg39wzMR6Xj4ByW3GY6nN8cGIbm3C
	 RaV9icf/mujTY4OIoqroZMf70zZQxnZPOsEn2rahanBqh4LtKyWeWxxNATE7px4/6b
	 EMjUbphvVo782Al0UCFjusL8ay7GYIqukAYzDuws=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 542M3Q07031676
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 2 May 2025 17:03:26 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 2
 May 2025 17:03:26 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 2 May 2025 17:03:26 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 542M3PC4006849;
	Fri, 2 May 2025 17:03:26 -0500
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra
	<vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hari
 Nagalla <hnagalla@ti.com>,
        Beleswar Padhi <b-padhi@ti.com>,
        Markus
 Schneider-Pargmann <msp@baylibre.com>,
        Andrew Davis <afd@ti.com>, Devarsh
 Thakkar <devarsht@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v8 10/11] arm64: dts: ti: k3-am62a7-sk: Reserve main_rti4 for C7x DSP
Date: Fri, 2 May 2025 17:03:24 -0500
Message-ID: <20250502220325.3230653-11-jm@ti.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250502220325.3230653-1-jm@ti.com>
References: <20250502220325.3230653-1-jm@ti.com>
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
Reviewed-by: Andrew Davis <afd@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
index f811911c1325..1e9fe997868e 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
@@ -870,3 +870,8 @@ &c7x_0 {
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

