Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0FCA21148D;
	Tue,  4 Feb 2025 01:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738631817; cv=none; b=jGCUj3JBejzklwKVHIHaFzZOlF9Iu2zvNumZsSUEaluOc1tkL5CXXJP2Sn+btBZFYsvniUZB/WcbVhTrzZ35A9v2OxoX37JaTbiOFeY6AwHnQiLhOPHSwari4hLHCThfKa9dj0csOn0YS3wkm/oybxqzdtMZhmVd6Dtc5vJinP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738631817; c=relaxed/simple;
	bh=Jnh0RyGPsjTpVZt7+I3TGs5QUZPoG+x4lc22qyE4etc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=YW26JuZbaDdd6+83H2lCYSREmN5U33Dq6nMJRfgu2eB9wC4g77DYBDn/y2ZaAIMJ+TQdX/Z4YzLAntNBWRIwuEkVYCoy9kIPWb/TtUmBsNj18fJt6w7RtkQpkTouUnd3NwapfzLUpFK+WY0LPVRBVfTFOjkgHkwDSGGKbnGI480=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=mzABe3SV; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="mzABe3SV"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5141Ggdm3060147
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 3 Feb 2025 19:16:42 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738631802;
	bh=UtmN5BgPEuTeBF7wx8w6yx8g90pk8aXcP/Lae2lHXGs=;
	h=From:To:CC:Subject:Date;
	b=mzABe3SVH1Xj6PsKMPRIx4DNX6UBKUTVn+nahEfO/05ZPoCYraqcQvjAZuzptphYB
	 21xnDhwNs6bhXHecae1e6VSXMyafcPzBa8vfFVxRLw6CIPZpGbXDvqafq+gbHKXeu4
	 YgIyWSBOsgl9ZB0/rc/rsFhT5wKxt4hLNYScHXHk=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5141GgxK127298
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 3 Feb 2025 19:16:42 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 3
 Feb 2025 19:16:41 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 3 Feb 2025 19:16:41 -0600
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5141GfAO024451;
	Mon, 3 Feb 2025 19:16:41 -0600
From: Judith Mendez <jm@ti.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Andrew Davis <afd@ti.com>,
        Hari Nagalla
	<hnagalla@ti.com>
Subject: [PATCH v3 0/9] Add R5F and C7xv device nodes
Date: Mon, 3 Feb 2025 19:16:32 -0600
Message-ID: <20250204011641.1523561-1-jm@ti.com>
X-Mailer: git-send-email 2.48.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

For am62x and am62ax devices, this patch series adds device nodes
for the R5F subsystem and C7xv DSP subsystem found in their
respective voltage domain, based on the device TRMs [0][1].

This patch series also includes patches for enabling IPC for am62x,
am62ax, and am62px by reserving memory and binding the mailbox
assignments for each remote core.

Also reserve main_rti4 and main_timer2 for the C7x DSP as per
firmware requirements.

Changes since v2:
- Fix memory carvout sizes, remove leading zeros
- Reorder memory carveouts according to memory location
- Fix whitespace issues
- Fix commit headers, capitalize IPC and R5F

Links
v2: https://lore.kernel.org/linux-devicetree/20250131214611.3288742-1-jm@ti.com/
v1: https://lore.kernel.org/linux-devicetree/20250127221631.3974583-1-jm@ti.com/


[0] https://www.ti.com/lit/pdf/spruj16
[1] https://www.ti.com/lit/pdf/spruiv7

Devarsh Thakkar (3):
  arm64: dts: ti: k3-am62a-wakeup: Add R5F device node
  arm64: dts: ti: k3-am62a7-sk: Enable IPC with remote processors
  arm64: dts: ti: k3-am62p5-sk: Enable IPC with remote processors

Hari Nagalla (5):
  arm64: dts: ti: k3-am62-wakeup: Add wakeup R5F node
  arm64: dts: ti: k3-am62a-mcu: Add R5F remote proc node
  arm64: dts: ti: k3-am62x-sk-common: Enable IPC with remote processors
  arm64: dts: ti: k3-am62a7-sk: Reserve main_timer2 for C7x DSP
  arm64: dts: ti: k3-am62a7-sk: Reserve main_rti4 for C7x DSP

Jai Luthra (1):
  arm64: dts: ti: k3-am62a-main: Add C7xv device node

 arch/arm64/boot/dts/ti/k3-am62-wakeup.dtsi    |  25 +++++
 arch/arm64/boot/dts/ti/k3-am62a-main.dtsi     |  12 +++
 arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi      |  38 +++++++
 arch/arm64/boot/dts/ti/k3-am62a-wakeup.dtsi   |  25 +++++
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts       | 100 ++++++++++++++++--
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts       |  50 +++++++--
 .../arm64/boot/dts/ti/k3-am62x-sk-common.dtsi |  32 +++++-
 7 files changed, 265 insertions(+), 17 deletions(-)


base-commit: 5532b8a9ce0e80514e37a1e082824934663580a3
-- 
2.48.0

