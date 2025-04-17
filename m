Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE5DE242912;
	Thu, 17 Apr 2025 12:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744891461; cv=none; b=B+HB4gs4KngOHfMTcCid2Qa3Q6UkrFoag/A7ZPPH/IVCf4ayajNo2uPW0HcB8OqkXcidfitRBcUErBqBtb+3kLttSbrFYtiS1+Kr/67oUC5mVjHDMtgNLvJP4CNeR4BOOxcH+v1Vwg4S0eENJwHbkUd6y/J+15oUl2+82zEn+ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744891461; c=relaxed/simple;
	bh=idyzSfJRd1KC3E10h0F8BgvdlVezLDki1ghCKDVY6KU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jJ5eE+FSROCSTfzpvknivlGRuSepQbgY+LneqzTm9ewEtR/sv+Q8uNhESrdWeU4uZHb8qWn0+MC9YG6aqewP4cgtqKOeKGWa4EYK3eXTA8jSFO9EX0+SNoY+gJ8U7DA+I4a9toIwxxBIrHZyHjH+lE1JbwD/AhCpndPXPzrDCo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=pp8P81wE; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="pp8P81wE"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53HC4B6N683312
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 17 Apr 2025 07:04:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744891452;
	bh=7BD3WTu9Y4pESy1qOjz0pPRJAJlKcmgN9whPwsT4Ip4=;
	h=From:To:CC:Subject:Date;
	b=pp8P81wEalKqbapSYEvKdtiUJ0leuKTn42cR90QiuylGq7lAIn0mCXWhb67K1kWTj
	 9ddbwRMASlGj0ySxVvJ78sTu/4+p+pPLeqKxRKwarZm9Qf1Ev/YpcJlUz7fDEzx8gq
	 fRSKWxdutrFeQePmcKqGcZdkx3XO3mPTCyEnAJSY=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53HC4BFg023480
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 17 Apr 2025 07:04:11 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 17
 Apr 2025 07:04:11 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 17 Apr 2025 07:04:11 -0500
Received: from uda0492258.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.72.113])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53HC47VI004789;
	Thu, 17 Apr 2025 07:04:08 -0500
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <s-vadapalli@ti.com>
Subject: [PATCH 0/7] AM64 and J7X DT: Enable PCIe 64-bit Address Space
Date: Thu, 17 Apr 2025 17:34:00 +0530
Message-ID: <20250417120407.2646929-1-s-vadapalli@ti.com>
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

The Cadence PCIe Controllers in TI's K3 SoCs namely:
AM64, J7200, J721E, J721S2 (AM68), J722S, J742S2 and J784S4 (AM69)
support two address regions:
1. 128 MB address region in the 32-bit address space
2. 4 GB address region in the 64-bit address space

Currently, the 128 MB region in the 32-bit address space is enabled in
the device-tree. This might be suitable for most of the use-cases, but
for those use-cases requiring larger address regions than 128 MB it is
necessary to switch to the 64-bit address space with the 4 GB address
region. This series implements the corresponding device-tree changes to
support the 4 GB address region as the default configuration. Existing
use-cases should continue to work without any regression.

Series is based on linux-next tagged next-20250416.

Series has been tested on AM642-EVM, J7200-EVM, J721E-EVM, J721S2-EVM,
J722S-EVM and J784S4-EVM using an NVMe SSD connected to the PCIe
Connector on the EVMs.

Test Logs:
1. AM642-EVM PCIe0
https://gist.github.com/Siddharth-Vadapalli-at-TI/5c3e2e462066ed8a976273db94e856e3
2. J7200-EVM PCIe1
https://gist.github.com/Siddharth-Vadapalli-at-TI/47e1219258b310a1ac0e4a6d7324af33
3. J721E-EVM PCIe0
https://gist.github.com/Siddharth-Vadapalli-at-TI/85abe9ea5032f8e17b2634d616bf0db3
4. J721E-EVM PCIe1
https://gist.github.com/Siddharth-Vadapalli-at-TI/3e42d0f46fe92d353c9a2ae950e4cd64
5. J721S2-EVM PCIe1
https://gist.github.com/Siddharth-Vadapalli-at-TI/7afcf78a6f2601ca9dcf92ca9164be46
6. J722S-EVM PCIe0
https://gist.github.com/Siddharth-Vadapalli-at-TI/6be87d2e2d616db34af0c00b3df66daa
7. J784S4-EVM PCIe0
https://gist.github.com/Siddharth-Vadapalli-at-TI/44f3285756c9f62c7f7d69a10a7b5888

Regards,
Siddharth.

Siddharth Vadapalli (7):
  arm64: dts: ti: k3-am64-main: switch to 64-bit address space for PCIe0
  arm64: dts: ti: k3-j7200-main: switch to 64-bit address space for
    PCIe1
  arm64: dts: ti: k3-j721e: add ranges for PCIe0 DAT1 and PCIe1 DAT1
  arm64: dts: ti: k3-j721e-main: switch to 64-bit address space for
    PCIe0 and PCIe1
  arm64: dts: ti: k3-j721s2-main: switch to 64-bit address space for
    PCIe1
  arm64: dts: ti: k3-j722s-main: switch to 64-bit address space for
    PCIe0
  arm64: dts: ti: k3-j784s4-j742s2-main-common: switch to 64-bit address
    space for PCIe0 and PCIe1

 arch/arm64/boot/dts/ti/k3-am64-main.dtsi           |  7 ++++---
 arch/arm64/boot/dts/ti/k3-j7200-main.dtsi          |  7 ++++---
 arch/arm64/boot/dts/ti/k3-j721e-main.dtsi          | 14 ++++++++------
 arch/arm64/boot/dts/ti/k3-j721e.dtsi               |  2 ++
 arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi         |  7 ++++---
 arch/arm64/boot/dts/ti/k3-j722s-main.dtsi          |  7 ++++---
 .../boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi  | 14 ++++++++------
 7 files changed, 34 insertions(+), 24 deletions(-)

-- 
2.34.1

