Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7F612750F6;
	Tue, 15 Apr 2025 11:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744715660; cv=none; b=JwuVvfQORY8mRS19Mmd1W1jZDCB904FV+8JXjb/e73SpQcJ3sp3dwfg/in/RlazLWx0T5SQUsqx/9axmIe69uhFpNOAfXeQUYPOMT9O5dwppMTlga6PmtQX3+B70ZHs1s1/TGU3O5h2CP/PwDw9QnSE+FuAFBihboX15PRLPCVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744715660; c=relaxed/simple;
	bh=VSYZ2mUxG+UAY8gtPu189D6tK5iCkuGDwKXyFbDgnpM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=CUIsPH4vCqAO81Uc4nfE4l0nzIH9RzG79KFLrnZnfKQstPxklQg1XWWdRGCOredXKVTQT1yhi3dQF/zk2Z9oSRvKoLoAXAT9QEKlFLrWWRkj/p/55nT2R3HDsT8MrkROw3gYwFBJBkZ1oBx8n81JoS8MuHw1hEfCmPm6o7ZJiaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=kXFJs50T; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="kXFJs50T"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53FBDv8S2975116
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 15 Apr 2025 06:13:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744715637;
	bh=Kg2NnHcrGc9RkC6KDeqvn/0+/AwqkcPgEQ1yg+2Ozm4=;
	h=From:To:CC:Subject:Date;
	b=kXFJs50TpXcISr3WXqVtI89G9hbECLV3QTFJ+DdE41OIDlGaqbJiQ/8mePP99X7nd
	 9KGGskrNs/RPtwTJQjmJo+wu/m+sA7Uc6U+sH8Pk1F8O8BjXolz8gYx1FpvDZDVVsk
	 cDoilLMdhXU3nTDiRre6S/lkc7eeA+7e7uSJ0Og8=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53FBDvxh122629
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 15 Apr 2025 06:13:57 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 15
 Apr 2025 06:13:56 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 15 Apr 2025 06:13:56 -0500
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [172.24.227.115])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53FBDqI5051431;
	Tue, 15 Apr 2025 06:13:53 -0500
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <vaishnav.a@ti.com>, <jai.luthra@linux.dev>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <imx@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
        <u-kumar1@ti.com>, Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
Subject: [PATCH v3 0/7] Fix dtbs_check warnings in CSI overlays
Date: Tue, 15 Apr 2025 16:43:21 +0530
Message-ID: <20250415111328.3847502-1-y-abhilashchandra@ti.com>
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

There are a bunch of new warnings generated using CONFIG_OF_ALL_DTBS.
This configuration applies DTB and overlay together to generate test DTBs,
which are then validated using dtbs_check.

This patch series fixes all warnings related to sensor overlays on
jacinto platforms and a few minor warnings on sitara as well.

To fix some of the warnings, missing power regulator nodes are added on
the J721E-SK and the regulator hierarchy on the AM68-SK is corrected.

IMX219 Logs: https://gist.github.com/Yemike-Abhilash-Chandra/3a2f8d0f2f5710108d8ca82eeba17bdf
OV5640 Logs: https://gist.github.com/Yemike-Abhilash-Chandra/7801f74d28ed5895a15049ce9f0fbe60

Changelog:
Changes in v3:
- Change the PIN_INPUT to PIN_OUTPUT to control the regulator in j721e-sk.dts
- Rebase on top of next-20250415
- Collect R/B tags

Changes in v2:
- Split commits containing logically separate changes into individual patches.
- Use fixes and stable according to ./Documentation/process/stable-kernel-rules.rst
- Rebase on top of next-20250409

v2: https://lore.kernel.org/all/20250409134128.2098195-1-y-abhilashchandra@ti.com/

Yemike Abhilash Chandra (7):
  arm64: dts: ti: j721e-sk: Add DT nodes for power regulators
  arm64: dts: ti: am68-sk: Fix regulator hierarchy
  arm64: dts: ti: k3-j721e-sk: Remove clock-names property from IMX219
    overlay
  arm64: dts: ti: k3-j721e-sk: Add requiried voltage supplies for IMX219
  arm64: dts: ti: k3-am62x: Remove clock-names property from IMX219
    overlay
  arm64: dts: ti: k3-am62x: Rename I2C switch to I2C mux in IMX219
    overlay
  arm64: dts: ti: k3-am62x: Rename I2C switch to I2C mux in OV5640
    overlay

 .../boot/dts/ti/k3-am62x-sk-csi2-imx219.dtso  |  3 +-
 .../boot/dts/ti/k3-am62x-sk-csi2-ov5640.dtso  |  2 +-
 .../dts/ti/k3-am62x-sk-csi2-tevi-ov5640.dtso  |  2 +-
 .../boot/dts/ti/k3-am68-sk-base-board.dts     | 13 ++++++-
 .../dts/ti/k3-j721e-sk-csi2-dual-imx219.dtso  | 35 +++++++++++++++++--
 arch/arm64/boot/dts/ti/k3-j721e-sk.dts        | 31 ++++++++++++++++
 6 files changed, 79 insertions(+), 7 deletions(-)

-- 
2.34.1

