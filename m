Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF043BB44;
	Tue, 29 Apr 2025 07:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745911630; cv=none; b=InHrUM+31d4x5N/oPkx8NDCnzKgNqQqFfVkaFd4+/AnYhVIHm0MQJBqqKlFSE8EMi6UaHrOGWliUHT4TpZSZKIjNm4pKfZEQEubAmVkWcoTUkFVp9m3e77Ey8QHQomqaS+3T67MRsgSmocZ/XNeWgleZrFgmDrhPzX3wvGO+C/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745911630; c=relaxed/simple;
	bh=PPmnkQ3JbwLCvSqAb4byxZCPpNnLjebvNe2uLSOWf0E=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=JJ0wq+cmsmuTIzMANN09egk+V/8xaXmY3apqti0xrY0x8Fx1DWqArd1B65/BUUI1Cyz+Cr6y4kDaAoRVMprWK0KDiTGFWPvVdBRfXEMtZf3J5qhe/j0zsdyEYtwe6NBiWODQH5OIOIV8wILNoV8bTORbybp9qETPvEwfPP/C2wA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=deKrmW0C; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="deKrmW0C"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53T7QlpD3785291
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 29 Apr 2025 02:26:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745911607;
	bh=RyhhKHcQn/OtgTmNOO+AF/jrAuW0rpCyeN4utPF33Kc=;
	h=From:To:CC:Subject:Date;
	b=deKrmW0CpxxomB5UltntmFvpnqIFK7vxG9so3tJrwKj3hGGJN8Ld/vxMr3n/aEZT2
	 vktX/z50+bfRE7UUFpkGBrE+IjvGT0xnz/IiS6wNnp7zIaAynmeEXXCW2esskFYDv0
	 NehrjlZrn5ddm+QmxIU5fcdKihJHgBRGpkFirKRU=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53T7QlEE026072
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 29 Apr 2025 02:26:47 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 29
 Apr 2025 02:26:46 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 29 Apr 2025 02:26:46 -0500
Received: from localhost (chintan-thinkstation-p360-tower.dhcp.ti.com [172.24.227.220])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53T7QjXR088302;
	Tue, 29 Apr 2025 02:26:46 -0500
From: Chintan Vankar <c-vankar@ti.com>
To: Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Tero Kristo
	<kristo@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>, Nishanth Menon
	<nm@ti.com>
CC: <srk@ti.com>, <s-vadapalli@ti.com>, <danishanwar@ti.com>,
        <c-vankar@ti.com>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v4 0/2] Add bootph-all property to necessary nodes to enable ethernet boot for AM68-SK, J722s and AM62p-SK
Date: Tue, 29 Apr 2025 12:56:42 +0530
Message-ID: <20250429072644.2400295-1-c-vankar@ti.com>
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

This series adds bootph-all property to necessary nodes to enable
ethernet boot support for AM68-SK, J722s and AM62p-SK.

This series is based on linux-next tagged next-20250428.

Link to v3:
https://lore.kernel.org/r/20250425051055.2393301-1-c-vankar@ti.com/

Changes from v3 to v4:
- As per Nishanth's suggestion, moved nodes which require "bootph-all"
  property into board specific file for AM68-SK.

Chintan Vankar (2):
  arm64: dts: ti: k3-am68-sk-base-board: Add bootph-all property to
    enable Ethernet boot
  arm64: dts: ti: k3-am62p*/k3-j722s: Add bootph-all property to enable
    Ethernet boot

 .../boot/dts/ti/k3-am62p-j722s-common-main.dtsi      |  3 +++
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts              |  2 ++
 arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts     | 12 ++++++++++++
 arch/arm64/boot/dts/ti/k3-j722s-evm.dts              |  3 +++
 4 files changed, 20 insertions(+)

-- 
2.34.1

