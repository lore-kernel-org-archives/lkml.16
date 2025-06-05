Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CFBB1F4C92;
	Thu,  5 Jun 2025 06:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749105323; cv=none; b=B34WrqsZH48NRa9G/8FLKlB/cJ5wkSprKlWwYI+WaPSrvoTBIktQ6sp+9HXlj6FhWiaHHz+YlRiDy5nbowqulDbl/myIOpAwSLRbEjxwnwruMSAkBYcEworHFhADZYFOvOqhQaZw7snE4vSiiOVuD6Xm3C0oKBPS4f+MKlEfzR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749105323; c=relaxed/simple;
	bh=cXr60sN9FBBYwGnGouNmKQYCshKBhQvfEy+CevEsWjU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=BGeSL3gldWQbn6jYFoRijvxQaNFqV4Zjgj17VPDB34g3uzE56jGv6rUkT+L0qWnCWBAKTOaWVF2D8BkFZODQHoBO814+Dm3UKneETt3AAOnQuIE7Z+NFMjwBLQs270NALTUle+6F5JeyvoBKccF7T1ANOuCWocVGBDm/FdZ0Xbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Y0GRIczJ; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Y0GRIczJ"
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5556ZBIG1031472;
	Thu, 5 Jun 2025 01:35:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1749105311;
	bh=kbCOyIxCpnaE8Cfg+DoqPNyQm2IjwjvAEIhJ23+mq04=;
	h=From:To:CC:Subject:Date;
	b=Y0GRIczJqm0Ss3af5D4K+1T2sfQyU99zS98KTwu3Bq1XFLrVhudTTAs20QstMOtQH
	 wjRKNu/MNN0BiP7letipH1mb5lkwXqbo0wKLFRCaKnLQ8/PNY4L+iYy4K0IWvYuuG4
	 mjmbVUQrdtzDIWwswqXHd0r4Q30i4/J1apRpzppk=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5556ZBFR948533
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 5 Jun 2025 01:35:11 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 5
 Jun 2025 01:35:11 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 5 Jun 2025 01:35:11 -0500
Received: from a0497641-HP-Z2-Tower-G9-Workstation-Desktop-PC.dhcp.ti.com (a0497641-hp-z2-tower-g9-workstation-desktop-pc.dhcp.ti.com [10.24.69.37] (may be forged))
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5556Z7VY3168702;
	Thu, 5 Jun 2025 01:35:08 -0500
From: Neha Malcom Francis <n-francis@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>, <n-francis@ti.com>
Subject: [PATCH v4 0/2] Add support for K3 BIST
Date: Thu, 5 Jun 2025 12:05:04 +0530
Message-ID: <20250605063506.2005637-1-n-francis@ti.com>
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
currently being upstreamed in U-Boot [1] (on hold till the dt-binding
is approved here) and triggers these tests on cores. This patch series
adds the dt-binding as well as a node for BIST on J784S4 and J742S2.

Changes since v3:
https://lore.kernel.org/all/20250514072056.639346-1-n-francis@ti.com/
- Udit
	- add support for J742S2

Changes since v2:
https://lore.kernel.org/all/20250328111439.374748-1-n-francis@ti.com/
- Krzysztof
	- use existing common definition (ti,sci-dev-id) for grabbing
	  the device ID instead of redefining properties

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
  arm64: dts: ti: k3-j784s4-j742s2-main-common: Add PBIST_14 node

 .../bindings/soc/ti/ti,j784s4-bist.yaml       | 63 +++++++++++++++++++
 .../dts/ti/k3-j784s4-j742s2-main-common.dtsi  | 11 ++++
 2 files changed, 74 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/ti/ti,j784s4-bist.yaml

-- 
2.34.1

