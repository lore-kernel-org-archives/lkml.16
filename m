Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C1E254B17;
	Tue, 11 Feb 2025 18:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739298107; cv=none; b=n+DjSdA5/W5T/8YuXwfhfyzs0ro8cmApwv+gQqh/RITBSo93TARKf2bKcw73/l9AqviIO8s063L05+Qm5RMXcBMWWwaeKgQAcKapFPplEpUPS2SVQeVforL2vOANxDNr5ns0msIGqUxvWOKxYCKCNeSgZhwN9ShZN81Dp9Qdll8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739298107; c=relaxed/simple;
	bh=aXHOEUDaIALsHAwjUOUQ+Qgz8ovgVK0TiK4RDtyaye4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=PYV/VxLlbZD66+aj4FMHZDDVdcPY+tCMKHUDll6O7Q8CqTSvp7khdgqqGSFksr2YYJFux3fzk/kRZyGDA+Ff0ipVbMw4aZJnAjZ9ASH2T5htGCJ/9U01GVioheOTl8ZfJACwkwHIQq+Ry//gdJFj8Nk0XLPqbPMzAGVxjkBGPAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=inkb7GJ6; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="inkb7GJ6"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51BILbIl3651464
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 11 Feb 2025 12:21:37 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1739298097;
	bh=xgT68oBSvMvFIgoMW0HNCWc1N34sOE6MI7TSV3ERtwA=;
	h=From:To:CC:Subject:Date;
	b=inkb7GJ6Ed4GDxTP8Ag4QfYwbkweZ+f4Ct5u/P5PBh2k2BhgcCR01NUGKA1G1WRNF
	 arsKer/mjI/M4Rcu9HVsZPj6gZwhTfu1Vk6HW442gRYgPqI+yC9tLg4z+ujtM1IZGU
	 lizoLTNS0RL1ltHnZIIO3NpnZSL6Q8PGR2xOtdag=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51BILbr5065006
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 11 Feb 2025 12:21:37 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 11
 Feb 2025 12:21:36 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 11 Feb 2025 12:21:36 -0600
Received: from localhost (chintan-thinkstation-p360-tower.dhcp.ti.com [172.24.227.220])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51BILaZr022669;
	Tue, 11 Feb 2025 12:21:36 -0600
From: Chintan Vankar <c-vankar@ti.com>
To: Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Tero Kristo
	<kristo@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>, Nishanth Menon
	<nm@ti.com>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <s-vadapalli@ti.com>,
        <srk@ti.com>, <c-vankar@ti.com>
Subject: [PATCH v4 0/2] Add support for CPSW3G port 2 on AM62A7-SK
Date: Tue, 11 Feb 2025 23:51:32 +0530
Message-ID: <20250211182134.1500867-1-c-vankar@ti.com>
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

This series adds support for CPSW3G MAC port 2 with the SK-Ethernet-DC01
Add-On daughtercard. Also, the missing alias for CPSW3G MAC Port 1 is
added to the am62a7-sk board file in order to allow kernel to fetch MAC
address populated by U-Boot for CPSW3G MAC Port 1.

This series is based on linux-next tagged next-20250210.

Link to v3:
https://lore.kernel.org/r/20240429101739.2770090-1-c-vankar@ti.com/

Changes from v3 to v4:
- No changes, rebased the series on top of latest linux-next branch.

Siddharth Vadapalli (2):
  arm64: dts: ti: k3-am62a7-sk: Add alias for CPSW3G MAC port 1
  arm64: dts: ti: k3-am62a7: Add overlay for second CPSW3G Port

 arch/arm64/boot/dts/ti/Makefile               |  3 +
 .../dts/ti/k3-am62a7-sk-ethernet-dc01.dtso    | 62 +++++++++++++++++++
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts       |  1 +
 3 files changed, 66 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62a7-sk-ethernet-dc01.dtso

-- 
2.34.1

