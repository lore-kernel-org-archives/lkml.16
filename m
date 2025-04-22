Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E7CC27E1CF;
	Tue, 22 Apr 2025 12:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745325156; cv=none; b=Q6q4Amq/6vAyO+ce5ZO15GHD2xnH5ZM5+Sm/TRsgQ1okFdS9c/K2QwBgyTN1OjM5X1fdKDLn1PTXdrwZuJb/DsBy24poafDTwLdSFiBqSVNa+Esw2Tvna5hwNz1NbqzgYtgxBZTav2jHjwmxnMzcePHuHKf5EgnAZ7ujmevrKLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745325156; c=relaxed/simple;
	bh=9sgP1GLrd8xWh1MYaLlSOFnxK1fP+qoNG+q8Zb9gZSw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=t8DNTrXnF7/+ByXpBw368YKaZ6YFGQMJ/g54W9jXi2XedTz18nNM90Xnlx8NxkT5hCYuxjLzoRRcchzBqY2DRdLEw4Pw+uIupgXaxafr1641SLdI7N6M71Z9Fc50S25hWDRoT4nWo5LdjhMYcFnHijjzA0mpUoSlWyU1Kjm2+hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=xtvuIKG1; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="xtvuIKG1"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53MCWNaD1209452
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Apr 2025 07:32:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745325144;
	bh=VD3GYSIMc1uNyuCfaxWRQVAVN5cwNV7T99X8AnTXs+Y=;
	h=From:To:CC:Subject:Date;
	b=xtvuIKG1//K7fgM6BsFtji20vR+Auy99+my2CEufgqApdNrK7gksYNoJvJxR+cv3a
	 N24i5Smyeg/JvqHvm4GQG0PEf5H+al8yqbOUCu3S3kN1WaFPsxn4HP3eIC5rILGui4
	 /z+RKluueh2mv5X9fCtirOXl8cVYdt2YeyvseBDE=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53MCWN0T017932
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 22 Apr 2025 07:32:23 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 22
 Apr 2025 07:32:23 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 22 Apr 2025 07:32:23 -0500
Received: from uda0492258.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.72.113])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53MCWIKt117965;
	Tue, 22 Apr 2025 07:32:19 -0500
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <u-kumar1@ti.com>,
        <parth105105@gmail.com>, <parth.pancholi@toradex.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <s-vadapalli@ti.com>
Subject: [PATCH v3 0/2] J784S4/J742S2: Enable ACSPCIE0 output for PCIe1
Date: Tue, 22 Apr 2025 18:02:16 +0530
Message-ID: <20250422123218.3788223-1-s-vadapalli@ti.com>
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

This series enables the reference clock output from the ACSPCIE0 module
to the PCIe Connector corresponding to the PCIe1 instance of PCIe on
J784S4-EVM and J742S2-EVM.

Series is based on linux-next tagged next-20250417.

The previous versions of this series were a single patch. Based on the
feedback received on previous versions, the SoC and Board support has
been split in order to allow reuse for other Boards based on the same
SoC.

v2 patch:
https://lore.kernel.org/r/20250411121307.793646-1-s-vadapalli@ti.com/
Changes since v2 patch:
- The SoC and board changes have been split across:
  k3-j784s4-j742s2-main-common.dtsi and k3-j784s4-j742s2-evm-common.dtsi
  respectively.

v1 patch:
https://lore.kernel.org/r/20240715123301.1184833-1-s-vadapalli@ti.com/
Changes since v1 patch:
- Rebased patch on linux-next tagged next-20241209.
- Moved changes from "k3-j784s4-main.dtsi" to its equivalent now which
  is "k3-j784s4-j742s2-main-common.dtsi" since PCIe1 is common to both
  J742S2 and J784S4.
- Renamed "acspcie0-proxy-ctrl" to "clock-controller" to follow generic
  node naming convention.
- Added "ti,syscon-acspcie-proxy-ctrl" property at the end of the node
  since vendor specific properties should be placed at the end.

Logs validating that an NVMe SSD connected to the PCIe Connector on
J784S4-EVM receives the reference clock from the ACSPCIE0 module and is
therefore enumerated successfully:
https://gist.github.com/Siddharth-Vadapalli-at-TI/905bceb2b6c0e1fc6b80cd2ddaf5bd0e

Regards,
Siddharth.

Siddharth Vadapalli (2):
  arm64: dts: ti: k3-j784s4-j742s2-main-common: add ACSPCIE0 node
  arm64: dts: ti: k3-j784s4-j742s2-evm-common: enable ACSPCIE0 output
    for PCIe1

 arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi  | 6 ++++++
 arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi | 5 +++++
 2 files changed, 11 insertions(+)

-- 
2.34.1

