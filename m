Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5F902D8DA0;
	Tue, 24 Jun 2025 14:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750776645; cv=none; b=bQIzhwYHDF7++1sJ83eP3TK7uhOV4EI9y0Bb8XKswXh/MvR2wDkiPzXSWdiMwgp9ZHio/LmlwjY48CDHEAsCpDBmkni3qcpEFmIZCkTZ06shnaqZz49ZBE3O+S8hWFqjqa8HFRH6sUu32L+mNULRp95Y85ChBztVifeSqpGVqbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750776645; c=relaxed/simple;
	bh=HxzdnHlvNmXe+SO45XnlkN/PmfV+l4m2RoOlMEC6YJQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=A74ZKuPcGuBFfn4f5Fsgiol42awp1MGrZWxlChzUDKPoywe8wcku6BEPlBMX+Bh5X9aOMoYXzhBy0cfd8jmajFDACU1PXqTdQniyA5TnSnPTu3e29SPLr0cKWYI6fxeyO4xQw0D0yfP5Dm7aTeKU3n48OS08veApOwrwFuz963g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=SIKladKI; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="SIKladKI"
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55OEoYj51193065;
	Tue, 24 Jun 2025 09:50:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750776634;
	bh=PM7HT1zExkxh5kKrFo2bnq5xJBT6NyNgAUOoBgPhwUk=;
	h=From:Date:Subject:To:CC;
	b=SIKladKITRCK8nJra5lZE1g6Ft4k7okHpr5aRJy7hwv9IIMIQSV0g/N2OYfrE2llj
	 qZRhibhf/kGfb9Hc6eggg7KEUfheN0roKTjPmTBp+RVQ70C9twsT+kd3G8A3gY627g
	 RjX0ugaEPD+fa+/Pp1xTnG50gEo6/O9K1bcHzheU=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55OEoYZx108841
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 24 Jun 2025 09:50:34 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 24
 Jun 2025 09:50:34 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 24 Jun 2025 09:50:34 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55OEoYL11684824;
	Tue, 24 Jun 2025 09:50:34 -0500
From: Bryan Brattlof <bb@ti.com>
Date: Tue, 24 Jun 2025 09:50:33 -0500
Subject: [PATCH] arm64: dts: ti: k3-am62: copy bootph flags to Linux
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250624-62-uboot-cleanup-v1-1-c36230ab0375@ti.com>
X-B4-Tracking: v=1; b=H4sIADi7WmgC/x3MQQqAIBBA0avErBuoCY26SrQwG2sgNLQiiO6et
 HyL/x9IHIUT9MUDkS9JEnxGXRZgV+MXRpmzgSpSlaYGNeE5hXCg3dj4c8d5Yqu165hUCznbIzu
 5/+Uwvu8Hp1KXYGIAAAA=
X-Change-ID: 20250623-62-uboot-cleanup-dbec66f9e257
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Tero
 Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Bryan Brattlof <bb@ti.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1004; i=bb@ti.com;
 h=from:subject:message-id; bh=HxzdnHlvNmXe+SO45XnlkN/PmfV+l4m2RoOlMEC6YJQ=;
 b=owNCWmg5MUFZJlNZV37u9AAAYn///7bfNrn+bTuX7/w/1Os/n//++t0du/f7Tqu8nT/Z7O+wA
 RmYHeqABoNAGgA9QNPUAxGjQA0AGgDTIBoAAGgAPSANqDQAA9R6mRpmmCh0DINGhoGQA0yaDEDR
 kNNMhpoAaBoGQHpADRiaBpo9JpoMgekNMamg9NIAAyGUaeo0Y1PSDJppkBoaGRpkDEAGhoBoBpp
 oaMEDRpgCANGjQNDQDQA0ZA000AIJUVXwqWEC0xYeLNyMNuX0RaRQQEn0geNGIVIYARL2fuPKCw
 tGYD0nNrYqkzmONq7PYoBeA1gU3QBQ5/4e4O/0YVgaGdvAda3hzHme7JrrRiH/MjePDrb7fF1eC
 1ja8rwgM0qywCEY1vageBu1wCtVtktleMA7zTITuBwbjRCCLaeTmpAXU6+lOPPZlGJVRlEwVF9V
 6+KK6l0P67bCTYftdB3JiCgEowQVVPIQZN4rFbMtUwu2OUNfGne9mJJb3j9lCm7QTgH+znYkIjv
 IpaxQkeoyvtkAFR7zf8SThinJgfRIk2L7rpNx1lPMqPehiek+TnPUpyxlrUca+adzDjrpE+gU0A
 g48ouQ0IbxULGLI1pLgwUAGYrIQlUMEEvt3q1TAVhRcES7/0xjZWERkEmZ54tYUctBSzB1ANxR5
 /RbU02q/xdyRThQkFd+7vQ=
X-Developer-Key: i=bb@ti.com; a=openpgp;
 fpr=D3D177E40A38DF4D1853FEEF41B90D5D71D56CE0
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

To keep things as organized as possible, copy the bootph-all properties
from U-Boot for the packet DMA controller to indicate it should be
available during all phases of bootup.

Signed-off-by: Bryan Brattlof <bb@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62-main.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
index 9e0b6eee9ac77d66869915b2d7bec3e2275c03ea..2a727caf36ec44e4a023c5985d1bad9b80737633 100644
--- a/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
@@ -150,6 +150,7 @@ main_pktdma: dma-controller@485c0000 {
 				    "ring", "tchan", "rchan", "rflow";
 			msi-parent = <&inta_main_dmss>;
 			#dma-cells = <2>;
+			bootph-all;
 
 			ti,sci = <&dmsc>;
 			ti,sci-dev-id = <30>;

---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250623-62-uboot-cleanup-dbec66f9e257

Best regards,
-- 
Bryan Brattlof <bb@ti.com>

