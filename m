Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBCC41876;
	Thu,  5 Jun 2025 06:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749105281; cv=none; b=WJ/54g8Dq9jWDb+DDrzR2vm0H3BZF+kqYkqKB5MPMwiwgU/Qk1AIxYxsWNP9tvPE6VUg8PvF7Rc9wV3l51Cwh1ymqBPgiv3GlkH76NNAe/Ch0ZNy/afqLVopDyoB/GttIJr/lsBYBVqKchtM+gPF0eeVKdQzhSpQs+cpOZDi49E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749105281; c=relaxed/simple;
	bh=HHWpE5lbbZL3wQiWIV78wYmIeZMoSTWyxTft+BH/zxM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=X1Thy0NQ/oEApdoHqyLTHQHCU/c54gNMsEj4E3/rU4megRer1s3xtgjtFecp3jZlu/fal3y31dwrIoiJsQ8UwV2tHBlMRakMWIQKDYESFdqWkpLAKgYuPPAZkuFA9+CEOAyjLQweSeYzF0QSmIEpGPzFLBf/RIwLVgYm2Rzuxsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=DIpn6Yhu; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="DIpn6Yhu"
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5556YPwI4016710;
	Thu, 5 Jun 2025 01:34:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1749105265;
	bh=j8gvwH3NIbG+weltGI6t7kllgUJfe9fjGkzv21AdfIQ=;
	h=From:To:CC:Subject:Date;
	b=DIpn6YhuJ0VgtK51IzCVAhb8vyMWRtqp6V6+jdvFqK9CeAVTH3TprR/M2KYSgaUJq
	 7FXJmEvlpiCD9GF+hhDSEQdzNNWGO94LUf9DVjl+s/cKgrfcCZQkCkLnN32ugCRCKO
	 eLNvMhzzkHjkBFDp3760shM3fIiVMAd3moMQVmkY=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5556YPFX622652
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 5 Jun 2025 01:34:25 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 5
 Jun 2025 01:34:24 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 5 Jun 2025 01:34:24 -0500
Received: from localhost (chintan-thinkstation-p360-tower.dhcp.ti.com [172.24.227.220])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5556YN7V3267399;
	Thu, 5 Jun 2025 01:34:24 -0500
From: Chintan Vankar <c-vankar@ti.com>
To: Thorsten Blum <thorsten.blum@linux.dev>, Andrew Davis <afd@ti.com>,
        Chintan Vankar <c-vankar@ti.com>, Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Peter Rosin <peda@axentia.se>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <s-vadapalli@ti.com>, <vigneshr@ti.com>, <nm@ti.com>,
        <danishanwar@ti.com>
Subject: [PATCH 0/2] Add support for new property 'mux-reg-masks-state' for mmio mux
Date: Thu, 5 Jun 2025 12:04:20 +0530
Message-ID: <20250605063422.3813260-1-c-vankar@ti.com>
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

This series extends mmio-mux driver's capability to configure driver in
with extended property.

In current driver implementation (mmio.c), driver is parsing register's
offset, mask and value from two different device tree property. In order
to configure mux register, these two properties should be synchronized
with each other, and this constraint makes it complex to modify or add 
further entries for that memory region. To simplify this, add support for 
a new property, "mux-reg-masks-state", which allows offset, mask, and 
value to be specified together as a tuple, and remove the above
constraint.

This series is based on linux next tagged next-20250604.

Link to RFC series:
https://lore.kernel.org/r/20250304102306.2977836-1-c-vankar@ti.com/

Chintan Vankar (2):
  devicetree: bindings: mux: reg-mux: Add support for new property
    'mux-reg-masks-state'
  mux: mmio: Extend mmio-mux driver to configure mux with
    mux-reg-masks-state

 .../devicetree/bindings/mux/reg-mux.yaml      |  32 +++-
 drivers/mux/mmio.c                            | 144 ++++++++++++++----
 2 files changed, 148 insertions(+), 28 deletions(-)

-- 
2.34.1

