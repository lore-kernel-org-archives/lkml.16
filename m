Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9258D8634C;
	Tue,  4 Feb 2025 01:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738631810; cv=none; b=EXInpSEYtZ0CaWHnUnEOLB6vbMudnuSGfmX7f2EEiDPxNs/7k7xG85vjjNi0WzhAv+odDGw0rlMtbaXeByr8XtoUMPuR+ecQmoYuupxnQAsxutQHwUxRm2FS67PLGeSBzxX1AvpPEFv4o/f+gbUjYWa5HorunsBAcj64Rk/iOtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738631810; c=relaxed/simple;
	bh=t6mY+iSXbWxpAaStUvD4LRTVCQsFg5NAG/4wmeLZslo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Bej4H7kJoMBfoYPaR/uYstfGRz3/zVfR0P9JtKFSbxdKXtQ2Jw2zLALky2ae+pU0kO/06FqM5f5iqzydgPdrcfxMh1uCIUmZaeGefuZjlYRha0TL/E1RzsgQlzyRCSXVwEXVy883PYdvVHg4cvnJiPPlLIp1MbZWs1eDB3XTa0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=SnRc65Eg; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="SnRc65Eg"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5141Ggds3125061
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 3 Feb 2025 19:16:42 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738631802;
	bh=FzsZM9TUUpmiRCyEJvbukX43XE9qo95ptUNKugsisgI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=SnRc65EgWj4EW18wdHgHo/9dlaw4rrjXWSdE4B9ImSis0VSLn4nuePjhelZFp+GGE
	 wC5N9otTo903FIXFqC7/nxc2eNyB/4do1LQAthDkCKiosFHG2IypsAERX/CNEsgSf8
	 QoYhUE8ZDzNVEnj7s8qV0D3vBlGpXNqYrU5tZtNc=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5141GgFK055077
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 3 Feb 2025 19:16:42 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 3
 Feb 2025 19:16:42 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 3 Feb 2025 19:16:42 -0600
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5141GfAW024451;
	Mon, 3 Feb 2025 19:16:42 -0600
From: Judith Mendez <jm@ti.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Andrew Davis <afd@ti.com>,
        Hari Nagalla
	<hnagalla@ti.com>
Subject: [PATCH v3 8/9] arm64: dts: ti: k3-am62a7-sk: Reserve main_timer2 for C7x DSP
Date: Mon, 3 Feb 2025 19:16:40 -0600
Message-ID: <20250204011641.1523561-9-jm@ti.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250204011641.1523561-1-jm@ti.com>
References: <20250204011641.1523561-1-jm@ti.com>
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
Changes since v2:
- No change
---
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
index eaffbab093cc1..f03b06b7de51d 100644
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

