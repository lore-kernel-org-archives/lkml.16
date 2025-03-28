Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06DC3214205;
	Fri, 28 Mar 2025 11:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743160493; cv=none; b=CZhzz5WG65pOluKaFZl8b+81l59475nvQGcx9uCdh9l4vob6MjS9sO81eYorG62ybfCuxsyBnju1T/9Gqf6MxmOwW7c5Xu1cs8D7etWYUSAM6/nPpvVI/1dWFRcUlemOVaDdOch3JqgkazO9p5/qmhYt6Ez6H539gFWaSzrXuAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743160493; c=relaxed/simple;
	bh=1T51feJFPE7kZM0F6IZyMUjawj05EKro+rczGe7vhBw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=XdtGha4Qctx0g+He//6Isuo27Nr7CLR+/jtt/YitiL/Gk3987skwaWzvQTjYyiZXdK6EA1sCJao5zK0ycqCmroTzxJRPMy+E7sQ3zSnGn3rGck55lCAFIqZZdgMYQOUR3pEyhBqzL5/aNmjLqJoGMgIIzLvuEDLpo8ggx+9N2+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=wEIxN62M; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="wEIxN62M"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52SBEiXE2102971
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 28 Mar 2025 06:14:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1743160484;
	bh=9ghP861EMT1qEkNnFXGo6eMHzjXYl6QYHOQmMTm96Dg=;
	h=From:To:CC:Subject:Date;
	b=wEIxN62MNZCLPjpLloMEWvliQYbyAcGhX2cFCh9s2MtM6NzhK7cdOxPftr0jFlDse
	 mAB4H/TCnpBEBX6aC2G804RPsPldhuEVQm1zfcX2kM53Jp/ipUPWhNppv50CVcFtRL
	 IJgYIwVPn5C0f3wl7tr/Ww0QzAi2mRC3ILM1DhNs=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52SBEicU013878
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 28 Mar 2025 06:14:44 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 28
 Mar 2025 06:14:43 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 28 Mar 2025 06:14:43 -0500
Received: from a0497641-HP-Z2-Tower-G9-Workstation-Desktop-PC.dhcp.ti.com (a0497641-hp-z2-tower-g9-workstation-desktop-pc.dhcp.ti.com [10.24.69.37] (may be forged))
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52SBEeIp029420;
	Fri, 28 Mar 2025 06:14:40 -0500
From: Neha Malcom Francis <n-francis@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>, <n-francis@ti.com>
Subject: [PATCH v2 0/2] Add support for K3 BIST
Date: Fri, 28 Mar 2025 16:44:37 +0530
Message-ID: <20250328111439.374748-1-n-francis@ti.com>
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

BIST (Built-In Self Test) is an IP responsible for triggering hardware
circuitry tests on both logic as well as memory blocks. This driver is
currently being upstreamed in U-Boot [1] and triggers these tests on
cores. This patch series adds the dt-binding as well as a node for BIST
on J784S4.

Changes since v1:
https://lore.kernel.org/all/20241128140825.263216-1-n-francis@ti.com/
- Krzysztof
    - move from misc/ to soc/ti/
    - minor property changes
    - drop ti,bist-instance and instead opt for ti,bist-under-test
    - correct example dt

[1] https://lore.kernel.org/all/20250204123147.939917-1-n-francis@ti.com/

Neha Malcom Francis (2):
  dt-bindings: soc: ti: bist: Add BIST for K3 devices
  arm64: dts: ti: k3-j784s4-main: Add PBIST_14 node

 .../bindings/soc/ti/ti,j784s4-bist.yaml       | 67 +++++++++++++++++++
 arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi    | 11 +++
 2 files changed, 78 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/ti/ti,j784s4-bist.yaml

-- 
2.34.1

