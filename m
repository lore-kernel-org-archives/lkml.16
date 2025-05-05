Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B3FC1FDA6A;
	Mon,  5 May 2025 11:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746446249; cv=none; b=YdU8p1wRUTLleihX3JKy9bg4O+ATNMssivnsHBk2E9Ghr9n7puol2APH7D0cuD3dW88wB1nsZv1IzRrWXKs4nv06+Fna6tMYdqYjnrq1ehPGsSvyZ4mjQ/NboF99XvGwlODEiO5CyvPl+rW81h/Oq//0w46XMcNvtkbOmgK9/cQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746446249; c=relaxed/simple;
	bh=3+EnjSI9w18ildeqWfGN0ba2kDXK8lRVWEMurXNZB8U=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hGp19Y1mxk6nwcjIDEXLXcNutnfmLbm/dIO4swSkIQ/4TbK9ElP/DiJOvKRJfGyqkjJJzgqMJG1wwsxh688nLZkg4Wk7jny0X8bUY6BZ+Yuqy1m/no98SRiNamgk8PpjYf/d/YhMomixBD2Ldc6OVo5lOuxqTFvEP7/5LVxRy4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=QgxPXOhO; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="QgxPXOhO"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 545BvCE8239928
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 5 May 2025 06:57:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746446232;
	bh=LEgb0yk2iXz9tDNUVR6UA9scLwOsFWEtbAU0MsUUQeY=;
	h=From:To:CC:Subject:Date;
	b=QgxPXOhOSBpu+eCCv7vc2TdnMvCwbM9b9EOLlkSN/K0BfbV3271Z5GOZSp33M+5z2
	 hYTrH46IsH+/8qdL0HzQKigGjE39oxHA3RwvjkZ0TunHh6+LJSbGjDOOTJkCNK8Bc0
	 +msQJwOwZB80NcqIf7qM+JUUfOpou2+6I7/xqni8=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 545BvCVs004349
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 5 May 2025 06:57:12 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 5
 May 2025 06:57:11 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 5 May 2025 06:57:11 -0500
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [172.24.227.115])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 545Bv79x004832;
	Mon, 5 May 2025 06:57:08 -0500
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <vaishnav.a@ti.com>, <u-kumar1@ti.com>, <r-donadkar@ti.com>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <jai.luthra@linux.dev>, <linux-kernel@vger.kernel.org>,
        <y-abhilashchandra@ti.com>
Subject: [PATCH 0/2] Add overlays for IMX219 and OV5640 on J722S
Date: Mon, 5 May 2025 17:26:58 +0530
Message-ID: <20250505115700.500979-1-y-abhilashchandra@ti.com>
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

This series adds IMX219 and OV5640 overlays to enable support
for 4 sensors on J722S. This provides a reference for a user to
enable a different sensor on any of the ports.

These two patches were initially part of [1], but were dropped
due to a few warnings reported by Rob. Hence, they are now sent
as a separate patch series with all warnings fixed.

[1]: https://lore.kernel.org/all/20250218185452.600797-1-vaishnav.a@ti.com/

Test logs:
IMX219: https://gist.github.com/Yemike-Abhilash-Chandra/a797689069bf60dcbcba9612094f9b53
OV5640: https://gist.github.com/Yemike-Abhilash-Chandra/84b9d8f9b93025b4348e31c95efd261f

Vaishnav Achath (2):
  arm64: dts: ti: k3-j722s-evm: Add overlay for quad IMX219
  arm64: dts: ti: k3-j722s-evm: Add overlay for TEVI OV5640

 arch/arm64/boot/dts/ti/Makefile               |   9 +
 ...k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtso | 339 +++++++++++++++++
 .../k3-j722s-evm-csi2-quad-tevi-ov5640.dtso   | 358 ++++++++++++++++++
 3 files changed, 706 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-j722s-evm-csi2-quad-tevi-ov5640.dtso

-- 
2.34.1

