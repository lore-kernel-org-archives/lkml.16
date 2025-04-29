Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E03D22A4E8;
	Tue, 29 Apr 2025 15:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745941326; cv=none; b=YQYg/Qm5sbIpXCqEY6UaWXQV9/V5gkoTXPJrfJldLkndyauRfNSd86tPTbIWR3ztcH4fr/nB2rMf78jsn/qLzGjXRkqvYiDXvlXI0XCTQtOlMgmCMZ2QwJ21nEA129E6/O+qp64uiHGc4/Y4a3cHij6OoqZH/XN5gK2PCvUOGNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745941326; c=relaxed/simple;
	bh=/qFCYV1d8iAvhp0rNKTRloAQBApthsG8UmnN0JdIul8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Fd5r6Ss1k49oHSN0yYgliuZpZl4FMrF8bU+dBcPz7JJ4/Wp5bCJ8ai+FPsj9jVIuVf8t/5JRrIGl2uZQw+ImblDv986xcWZ9lnvHmAzlKHyaQPbSjUi11zy12pOIwJUqhuSRIuJfgitQBjTfz0+uC78JV7M1Z8sVrrM/76tBnP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=lP1LzGL4; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="lP1LzGL4"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53TFfdHY3882243
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 29 Apr 2025 10:41:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745941299;
	bh=OxtBiS9M80qDbTd9VXJ/v1Hn5GOVpz5N+s1O0UqU32k=;
	h=From:To:CC:Subject:Date;
	b=lP1LzGL4t3TOSXM7vCrWioal767flHhPGJVCPLuuAzqnfE+QphWqi5VE2lE34Dj2k
	 jCjOEP9hMw9wCFlSDw6EW33LNZQRpj3yCoguIezdh22EJKYXE1uCa+Hd6YFL6DZtXg
	 +0JH8behbTglpWcOckmcsQNiX8vw0LdPTijVhB1I=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53TFfdod049526
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 29 Apr 2025 10:41:39 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 29
 Apr 2025 10:41:39 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 29 Apr 2025 10:41:38 -0500
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [10.24.69.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53TFfXVp030051;
	Tue, 29 Apr 2025 10:41:34 -0500
From: Rishikesh Donadkar <r-donadkar@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <vaishnav.a@ti.com>, <devarsht@ti.com>,
        <y-abhilashchandra@ti.com>, <s-jain1@ti.com>, <jai.luthra@linux.dev>,
        <jai.luthra@ideasonboard.com>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <imx@lists.linux.dev>, <r-donadkar@ti.com>
Subject: [PATCH v1 0/4] Fix dtbs_check warnings in sensor overlays
Date: Tue, 29 Apr 2025 21:11:29 +0530
Message-ID: <20250429154133.3377962-1-r-donadkar@ti.com>
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

Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>

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

