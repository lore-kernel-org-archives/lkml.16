Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF3EA25B660;
	Fri,  2 May 2025 16:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746203175; cv=none; b=lCATRy07C/Kot85pkrtrwwtkRUDdtzqaFC0vULw3JRCJzCLLVG10yUaNv4CMmzXxj1a+tTcMote1u4ro2GB06lW3dpaad4G757dTI7Gi7pnQbSB16QuUeZe7Odnqx0Zqq6aAwyIVAJbG7XbekGCR9CruzhFrRYYte9xeRovechg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746203175; c=relaxed/simple;
	bh=QdXQZfyK9Q/Y2syUfh81RYqcZmYpOsj5BKFumKCCMEU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=A5knSEijL4RuyJ+XO5c+NVa02jor5gzKCstKPSs0vULDEG4jUOnJTaJtGZ1szS1dJc7PlmzWrVGK2XwaRe39dHw7u1eco0sPy9x5voS0bsGEP2x8+gYNGhwPyjScX0S3ozaMsAsYvStwHB9Xiw4rnMJGW6hS6YWkQGZiL8UNp40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=lGSX/eJq; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="lGSX/eJq"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 542GPksi448850
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 2 May 2025 11:25:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746203146;
	bh=cXXwc+BZ8KcRkIsM6RvYG2rxmbTcNTOCT+vESd/p1rM=;
	h=From:To:CC:Subject:Date;
	b=lGSX/eJqSCiEaXcRdyFM2oHAYVHEE0nHJKYD2fBr2ld3IshaWm6uMH7yjUAXL5w0J
	 v8dsj/kRGZ4PM+Gu3Og36DwMjU7pY0u3RSGG319byw0q4NflZiSUuRV0aUV7ho6gFn
	 0Yrt3SAw2pEL25qrutdaQJ4gED0gLoBcABs5a2OY=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 542GPk5q031008
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 2 May 2025 11:25:46 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 2
 May 2025 11:25:45 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 2 May 2025 11:25:45 -0500
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [10.24.69.232])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 542GPex6028994;
	Fri, 2 May 2025 11:25:41 -0500
From: Rishikesh Donadkar <r-donadkar@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <vaishnav.a@ti.com>, <devarsht@ti.com>,
        <y-abhilashchandra@ti.com>, <s-jain1@ti.com>, <jai.luthra@linux.dev>,
        <jai.luthra@ideasonboard.com>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <imx@lists.linux.dev>, <r-donadkar@ti.com>
Subject: [PATCH v2 0/4] Fix dtbs_check warnings in sensor overlays
Date: Fri, 2 May 2025 21:55:35 +0530
Message-ID: <20250502162539.322091-1-r-donadkar@ti.com>
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

Fix the follwoing dtbs_check warnings
https://gist.github.com/Rishikesh-D/ba0876a26e35c3b9662c75563b8b77ce

Test Logs:
am62a7 + imx219 : https://gist.github.com/Rishikesh-D/f32d6a0ec3cbb0f9f4f29254239d3cd2
am62a7 + tevi-ov5640 : https://gist.github.com/Rishikesh-D/21aad1db1487b884c22527d6e1432ae7
am62a7 + ov5640 : https://gist.github.com/Rishikesh-D/da4489f1813e90d840fa5ca91df5923e

am62p5 + imx219 : https://gist.github.com/Rishikesh-D/f75ac40f999fd996495f8962772761ae
am62p5 + tevi-ov5640 : https://gist.github.com/Rishikesh-D/9d117779a5373e7d6faa2db59501746f
am62p5 + ov5640 : https://gist.github.com/Rishikesh-D/70f426c89154cfeb6292081623581a98

am625 + imx219 : https://gist.github.com/Rishikesh-D/b93542292ce22e498b1039309c60fae8
am625 + tevi-ov5640 : https://gist.github.com/Rishikesh-D/62d63e3a2bbf6761cc64457d70021bb1
am625 + ov5640 : https://gist.github.com/Rishikesh-D/b3e799671675d00363c3ceac00f8977f

---
Changes in v2:
- Change the Digital core volatge to 3.3 v as mentioned in the TEVI docs
- Add links to data-sheet in the commit message
- Carry forward Reviewed-by tags

- Link to (v1): 
https://lore.kernel.org/all/20250429154133.3377962-1-r-donadkar@ti.com/#t

Rishikesh Donadkar (4):
  arm64: dts: ti: k3-am62p5-sk: Add regulator nodes for AM62P
  arm64: dts: ti: k3-am62x: Add required voltage supplies for IMX219
  arm64: dts: ti: k3-am62x: Add required voltage supplies for OV5640
  arm64: dts: ti: k3-am62x: Add required voltage supplies for
    TEVI-OV5640

 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts       | 22 +++++++++++++
 .../boot/dts/ti/k3-am62x-sk-csi2-imx219.dtso  | 31 ++++++++++++++++++
 .../boot/dts/ti/k3-am62x-sk-csi2-ov5640.dtso  | 32 +++++++++++++++++++
 .../dts/ti/k3-am62x-sk-csi2-tevi-ov5640.dtso  | 32 +++++++++++++++++++
 4 files changed, 117 insertions(+)

-- 
2.34.1

