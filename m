Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E37842376F7;
	Thu,  6 Feb 2025 23:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738885931; cv=none; b=NTuUcpTl7IOG4k5CY6ptYFfxP8hD/TKuICMkcO37TH8rzf1NRJl105/2Ko69jyAEKMuhU8y88YC9v7ZN+YxOiHHsSAxXLW6BhSQsSZnJ3U/kbf5ovK7awWaWVGss9lNJUirhIVQBfeZmmm2Fye5mR0U5JTP15x9/nucwiiVV9ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738885931; c=relaxed/simple;
	bh=Pguvrc2CeQhBisODMNHzsjGmQ0UIkx20ewlTiGe3aD8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a2x1j2B1X8n4cxk2HUTMsvtX/pGpD46ZQPeScEIfKvpBT5zG1TTUMT/EZv6VyKPEkmA3HmCfrceCvHd0QRGg+pKGJg3TGcCodPt3phwh5hN0lmSv5PxjXHrmV9nbwHuwKzXo9IPGiS51hOJR4AIYKwaoPLC/h0hkdMqoTKHt7yM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=ZUM3qfsd; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ZUM3qfsd"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 516Nq0c62820123
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 6 Feb 2025 17:52:01 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738885921;
	bh=ETFWxnvz873WcEnyOP2WHfA/o+tatMFY+7DGBucc+GU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=ZUM3qfsd7AX8aEzxI6xz8M4SNXoJOeDL1E4GVcxWQNVtCARQgvVcx1yed9R6FjQxU
	 dEp49PXROx0ddQW2ecyg0QCdGlqP7uJ17fuSLix0dBOAhqEpEW/twXpZ3XzgV69Q3+
	 j0bUNi/0cDmg1K4N+1CMi91p+y0qbXoypscu6uvs=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 516Nq05d026288
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 6 Feb 2025 17:52:00 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 6
 Feb 2025 17:52:00 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 6 Feb 2025 17:52:00 -0600
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 516Nq0vJ021560;
	Thu, 6 Feb 2025 17:52:00 -0600
From: Judith Mendez <jm@ti.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Andrew Davis
	<afd@ti.com>,
        Hari Nagalla <hnagalla@ti.com>, Judith Mendez <jm@ti.com>
Subject: [PATCH v4 8/9] arm64: dts: ti: k3-am62a7-sk: Reserve main_timer2 for C7x DSP
Date: Thu, 6 Feb 2025 17:51:58 -0600
Message-ID: <20250206235200.3128163-9-jm@ti.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250206235200.3128163-1-jm@ti.com>
References: <20250206235200.3128163-1-jm@ti.com>
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
Changes since v3:
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

