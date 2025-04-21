Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC1E2206AC;
	Mon, 21 Apr 2025 21:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745271999; cv=none; b=udntW0jJrQLwDFVVl2FfD+oZAjsavUKxzrj5/5jZykTgl4JUM2SG/HSxnJBdIGzt4eCcYc3nk2Gg7aDD90jTvjASHVTicL3xt/F/Zp5gXBX3GOFg1v8ikY7fWjG8a/Z0HMFvprcuWAzT8XxF8ocoDsRVxQZiXArojJNGc7m+kr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745271999; c=relaxed/simple;
	bh=O8TJ5KvjETiGgr+rZOltXInFSKUgF+kGYNt46UN+12M=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=PG9lt05lZmEtyg7P1pATocf9k1Cf/IQns5elYe0Xgbcm5wdowyTNRgCaYKPm5rDcS18dnu7fZ3dcAHFI5GPzSQE15gtZlg190k/IF3LidzNpr3p4S6UBybXGE1BEcPY20+mEejuOIzYFJCFlklT+6Sb9f1sR/7FGxxLC11fd+dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=c+4Hg52A; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="c+4Hg52A"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53LLkMxC1749650
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 21 Apr 2025 16:46:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745271982;
	bh=8XIxO7QqZCfXEMacDLpemlFTOjp51ap9NkRRGgC2z+0=;
	h=From:To:CC:Subject:Date;
	b=c+4Hg52AMs7/eJ//ndrQq0M5JdYHCshUhQsT3Fo649frsLnc5R56wZ7YzBI4PiW7l
	 WX7u+grHeaVGufROD6xGQq+CKH0lM1m8Vm1uUALw/8bS16ETXVbtqLsWmdDGFgEMnq
	 b70T8PeLvI97mJ2ff77OpGQjp6/I7IofHT34Xt58=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53LLkMsP020838
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 21 Apr 2025 16:46:22 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 21
 Apr 2025 16:46:21 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 21 Apr 2025 16:46:21 -0500
Received: from lelvsmtp6.itg.ti.com ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53LLkLqK038764;
	Mon, 21 Apr 2025 16:46:21 -0500
From: Andrew Davis <afd@ti.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>,
        Vignesh
 Raghavendra <vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>, Jan Kiszka
	<jan.kiszka@siemens.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, Andrew Davis <afd@ti.com>
Subject: [PATCH 0/3] Fix remaining TI K3 CHECK_DTBS warnings
Date: Mon, 21 Apr 2025 16:46:17 -0500
Message-ID: <20250421214620.3770172-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hello all,

Until we resolve this thread[0] we do not have a set direction for
modeling our device's controller devices. For now as the AM654 MAIN
domain controller region is already one of the messy combination
syscon + child device containing nodes, no harm in silencing this last
DT check warning in the meantime.

Depending on the outcome of [0], this series can be safely unwound in
a couple ways without any backwards nor forwards compatibility breaks.
So no need to wait on the outcome there to take this series.

The last patch should take care of the last CHECK_DTBS warning for K3.

Thanks,
Andrew

[0] https://lore.kernel.org/lkml/6241ff00-27e6-45ab-808e-f04e39854753@ti.com/

Andrew Davis (2):
  dt-bindings: mfd: ti,j721e-system-controller: Add compatible string
    for AM654
  arm64: dts: ti: am65x: Add missing power-supply for Rocktech-rk101
    panel

Jan Kiszka (1):
  arm64: dts: ti: k3-am65-main: add system controller compatible

 .../bindings/soc/ti/ti,j721e-system-controller.yaml | 13 +++++++++++++
 arch/arm64/boot/dts/ti/k3-am65-main.dtsi            |  2 +-
 .../k3-am654-base-board-rocktech-rk101-panel.dtso   | 12 ++++++++++++
 3 files changed, 26 insertions(+), 1 deletion(-)

-- 
2.39.2

