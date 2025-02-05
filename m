Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22F9E21A458;
	Wed,  5 Feb 2025 09:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738748724; cv=none; b=rayQpd+d3GAwqOBLie8ZojpV+ZcrVHgbid8LCIKDRZLY4xejVoic5bTCRkHjNd8iwDsscodYg16jHRqSTKkdEcfEq20z/Xi6bazbQkkyYBHZxfxYVVi/39YI5j3wQLbiLPWOc4UKpRrn0HIFdpAO1/66btAVEv2PqFrljuGOI8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738748724; c=relaxed/simple;
	bh=jLP9adXJSjXjGgnismCsuHFv2gf3SI2dGFexPu1/4NA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hFyubdEsuNsnyykrnOpAc/3z0YYLUCN3zSrVSy9CMM0iWvfjrYgE+akITIhRiGQ0QukNfIS2xDtcnFoLQUlu8UOCVeS9fYHiu7NZEnGuRXYqf5pEoCeiT8sgvQ49o32z4b64+2TG8wo4AmzJXAcgams+lmEbcvRuT76MGnp4YNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=CO+8cPQL; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="CO+8cPQL"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5159isd62510929
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 5 Feb 2025 03:44:54 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738748694;
	bh=WZp7TS9OI/YkuzBbR19MVfuH+Jn+hzsj68Bt4sSVdMw=;
	h=From:To:CC:Subject:Date;
	b=CO+8cPQL8uJCIhw2ZmiCTxfPWGhU60AzO3P+gslJ5RnXfUEA29epgckOxaroxOnyU
	 UbdwphxAACos7hzDLlWp/NZ+p5HdmuoqABPaADdiQigD+oQ9XYUAgFGACHNCkEG66M
	 LXlHS1j/0AnpsJ6awaFjPYxfx9JjSgr2nD3sPHXM=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5159isLe008311
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 5 Feb 2025 03:44:54 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 5
 Feb 2025 03:44:54 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 5 Feb 2025 03:44:54 -0600
Received: from hp-z2-tower.dhcp.ti.com (hp-z2-tower.dhcp.ti.com [172.24.227.4])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5159iniQ047178;
	Wed, 5 Feb 2025 03:44:50 -0600
From: Hrushikesh Salunke <h-salunke@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <r-gunasekaran@ti.com>,
        <rogerq@kernel.org>, <s-vadapalli@ti.com>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <h-salunke@ti.com>,
        <danishanwar@ti.com>, <srk@ti.com>
Subject: [PATCH v2] arm64: dts: ti: k3-j722s-evm: Fix USB2.0_MUX_SEL to select Type-C
Date: Wed, 5 Feb 2025 15:14:48 +0530
Message-ID: <20250205094448.586094-1-h-salunke@ti.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

J722S SOC has two usb controllers USB0 and USB1. USB0 is brought out on
the EVM as a stacked USB connector which has one Type-A and one Type-C
port. These Type-A and Type-C ports are connected to MUX so only
one of them can be enabled at a time.

Commit under Fixes, tries to enable the USB0 instance of USB to
interface with the Type-C port via the USB hub, by configuring the
USB2.0_MUX_SEL to GPIO_ACTIVE_HIGH. But it is observed on J722S-EVM
that Type-A port is enabled instead of Type-C port.

Fix this by setting USB2.0_MUX_SEL to GPIO_ACTIVE_LOW to enable Type-C
port.

Fixes: 485705df5d5f ("arm64: dts: ti: k3-j722s: Enable PCIe and USB support on J722S-EVM")
Signed-off-by: Hrushikesh Salunke <h-salunke@ti.com>
Reviewed-by: Roger Quadros <rogerq@kernel.org>
---
This patch is based on commit
5c8c229261f1 (origin/master, origin/HEAD) Merge tag 'kthreads-fixes-2025-02-04' of git://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks

Changes since v1
Collected reviewed by tag

v1: https://patchwork.kernel.org/project/linux-arm-kernel/patch/20250116125726.2549489-1-h-salunke@ti.com/

 arch/arm64/boot/dts/ti/k3-j722s-evm.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-j722s-evm.dts b/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
index d184e9c1a0a5..adee69607fdb 100644
--- a/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
+++ b/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
@@ -590,7 +590,7 @@ exp1: gpio@23 {
 		p05-hog {
 			/* P05 - USB2.0_MUX_SEL */
 			gpio-hog;
-			gpios = <5 GPIO_ACTIVE_HIGH>;
+			gpios = <5 GPIO_ACTIVE_LOW>;
 			output-high;
 		};
 
-- 
2.34.1

