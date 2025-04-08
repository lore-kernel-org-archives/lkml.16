Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4270C25F98B;
	Tue,  8 Apr 2025 06:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744092411; cv=none; b=MzocVu9mzA41KygxuQrwHvKV/nhw0kmy2X4V0TBe3O8LOS/MxtIa9KLgFVw0Lt6h9djZNstFR8BCzftxXlSaM4mod2dEJjAQ5yptNLqqWUDWmrmzdc4xMIrqOZikVa/RD3Ye0I104PWzMFj+PQUKWaNrQPrtNCiPHH/ugyeX9T4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744092411; c=relaxed/simple;
	bh=5Q/qbzf87+jHK3LEj1xpmiZPZoZCk+cG/M4W+faqlKw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ZBPZRBOjy3coLbpYJ5i1RBkZ8OCa5kzuXQXSG4MPOR9G7kQtE8P4cpzciBE9rn4OKmRD94zLv5xqwTjRReQmx/um1W7QZiMJhgn/a257pVtLk8VGGm7KKbwSiWL34BgyrrE1QlSbC3K3orlFLFtxdUNB0U3OszTz6awFwPRXwi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=CFRQYz03; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="CFRQYz03"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53866fL91125960
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 8 Apr 2025 01:06:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744092401;
	bh=sj/vDMjsgS3JeJqVpVc7Ee+PaOYcv9JfrYRFTbtostM=;
	h=From:To:CC:Subject:Date;
	b=CFRQYz03j5T9vR0x1RsAeWGiHVVF2hjE+90K9qzcLmcFWnx85SlOKvtihk62svUkq
	 wFPgmgbq/ZM9eEX4KsvyM5BWpR/NAqvbmbl+WkzVsKVQ3Te0VCtQjO+lL/nyiFrk+9
	 rQ4qP4vkexiQFH55Leex3KIcVp6KpVd/bHmnISMQ=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53866f2e030560
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 8 Apr 2025 01:06:41 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 8
 Apr 2025 01:06:40 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 8 Apr 2025 01:06:40 -0500
Received: from uda0492258.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.72.113])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53866bvo080076;
	Tue, 8 Apr 2025 01:06:37 -0500
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <s-vadapalli@ti.com>
Subject: [PATCH 0/2] J722S: Disable WIZ0 and WIZ1 in SoC file
Date: Tue, 8 Apr 2025 11:36:34 +0530
Message-ID: <20250408060636.3413856-1-s-vadapalli@ti.com>
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

Hello,

This series disables the "serdes_wiz0" and "serdes_wiz1" device-tree
nodes in the J722S SoC file and enables them in the board files where
they are required along with "serdes0" and "serdes1". There are two
reasons behind this change:
1. To follow the existing convention of disabling nodes in the SoC file
   and enabling them in the board file as required.
2. To address situations where a board file hasn't explicitly disabled
   "serdes_wiz0" and "serdes_wiz1" (example: am67a-beagley-ai.dts)
   as a result of which booting the board displays the following errors:
     wiz bus@f0000:phy@f000000: probe with driver wiz failed with error -12
     ...
     wiz bus@f0000:phy@f010000: probe with driver wiz failed with error -12

Series is based on linux-next tagged next-20250408.

Regards,
Siddharth.

Siddharth Vadapalli (2):
  arm64: dts: ti: k3-j722s-evm: Enable serdes_wiz0 and serdes_wiz1
  arm64: dts: ti: k3-j722s-main: Disable "serdes_wiz0" and "serdes_wiz1"

 arch/arm64/boot/dts/ti/k3-j722s-evm.dts   | 8 ++++++++
 arch/arm64/boot/dts/ti/k3-j722s-main.dtsi | 4 ++++
 2 files changed, 12 insertions(+)

-- 
2.34.1

