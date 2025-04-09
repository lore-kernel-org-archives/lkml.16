Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 790F8433C4;
	Wed,  9 Apr 2025 13:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744206117; cv=none; b=k0bbq4kYf4I7tA9Qz8cEYbA6xdRR4Yxu+VL3ERgGHD0qasitCCJMk9TNrfLYcBB28e2AVtaWZmMzTBQH4MKi+H37Kck3QfPdbnDRQ8vOILrJL5TANtH029OpZgd+Dgn2GWQlLLCi6Oh0F1Zc7LwzKXg/PVoMZmLQ9FHlziMOspM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744206117; c=relaxed/simple;
	bh=3rAJaOKgh4+IDZkzlyNd4k9ObD+frWVRnBf/L86s5pw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=FDblU4R9SbK6MyDYAvHltHUl8AGloqFlBWtM4RmzTVA0quFpHJi0VPpJuv9OZxj713cfcQqyvHNHhwB4B3qpgELtlDyrG3b09XyeXdLmq3PMnb57JDxHnC6zOZjv52z22RtyR/0H92JV+DmaMgaMO6U9+SZXch+6AlyTqZyvigg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=FeDaF9Ka; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="FeDaF9Ka"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 539DfenG843121
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 9 Apr 2025 08:41:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744206100;
	bh=z5+02e1VECt6e7j0vj6RHxQ3TukVfOXtn1DHHYQDDmQ=;
	h=From:To:CC:Subject:Date;
	b=FeDaF9Kabcjt+sbqnpuhvfMVjAtXklEqjCmUqFVhUwhmNSj7FHss9NfQzF6FCzfOh
	 QE4hZGGML4VXZDeqoDG9ROPIiyZH5u3a+mTeR/RqZGzNkxb2YTw4dVL9ZkK5EGUWU1
	 CMuJaukQYbeaI3bOOee9c/7gSj1LV/IZM1/SV0Pg=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 539DfeEA124912
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 9 Apr 2025 08:41:40 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 9
 Apr 2025 08:41:40 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 9 Apr 2025 08:41:40 -0500
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [172.24.227.115])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 539DfZvm122297;
	Wed, 9 Apr 2025 08:41:36 -0500
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <vaishnav.a@ti.com>, <jai.luthra@linux.dev>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <imx@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
        <u-kumar1@ti.com>, Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
Subject: [PATCH v2 0/7] Fix dtbs_check warnings in CSI overlays
Date: Wed, 9 Apr 2025 19:11:21 +0530
Message-ID: <20250409134128.2098195-1-y-abhilashchandra@ti.com>
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

IMX219 Logs: https://gist.github.com/Yemike-Abhilash-Chandra/1f1ee770507b31e6015ec3ef35a4da79
OV5640 Logs: https://gist.github.com/Yemike-Abhilash-Chandra/7801f74d28ed5895a15049ce9f0fbe60

Changelog:
Changes in V2:
- Split commits containing logically separate changes into individual patches.
- Use fixes and stable according to ./Documentation/process/stable-kernel-rules.rst
- Rebase on top of next-20250409

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

