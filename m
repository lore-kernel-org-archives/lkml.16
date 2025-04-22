Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 499EFEBE;
	Tue, 22 Apr 2025 00:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745280539; cv=none; b=NbAvlXt/DsiIgncluvc7zVL77gER/FXWzwWnSF0qCPvo8ij4KMshC7vf4DZbYnJ7puZzxW+w81SQLxtDRy0kG/S98EBwishdnlsU3YD03aK7Weztlg50uVI5jg0bcPTf2clV0NSeXwD4Zk06mF694qbGL36fheRyPkg57Yu/v90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745280539; c=relaxed/simple;
	bh=YY54tgkQFhCudXs7uOwpM8co2M2SuDOPaAeaY9JI8f0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=B0yzFWa3pnhK14QiwMuBtcf0nDEaZozD26srGPpATkpglTHNAWR0nyXEaA0y2DzF4ZU1L9+2Y78NL1CYCdO/Wofdp314Y9eQeI/3EFBuUSf9RphfFUlCyIbhim5MqfzulSrn2NNYuQQ5ujm2TZo18H4ivPruo7IdaylT2ka47qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=ZVVyCv95; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ZVVyCv95"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53M08qBJ1768572
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 21 Apr 2025 19:08:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745280532;
	bh=ppfOZ3b4VAis2haDcJCJJLYqMkr6zwiaDTGpizkuOXE=;
	h=From:To:CC:Subject:Date;
	b=ZVVyCv95JQTAWUYI2XMDMCjEsjK9tyuZv4sI+TfqRw/stNqtMWLBWXcUvp8vbBeoG
	 4W27KiS4IlgYLverNbiKBzD+kuiYih8qPyFgM8wuM35JzyFlkjfeG7n5fQrpmg45of
	 2R2a3b8s6wbuMQsGBGdlNuI+XiyzuEnQFrPgFXVM=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53M08qen102104
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 21 Apr 2025 19:08:52 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 21
 Apr 2025 19:08:52 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 21 Apr 2025 19:08:52 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53M08pDE065170;
	Mon, 21 Apr 2025 19:08:51 -0500
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra
	<vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH 0/3] Enable PWMs
Date: Mon, 21 Apr 2025 19:08:48 -0500
Message-ID: <20250422000851.4118545-1-jm@ti.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

This patch series enables PWM signal outputs on am625 SK,
am62 lp SK, am62a7 SK, and am62p5 SK boards.

For am625 SK and am62 lp SK, add pinmux, eCAP, and eHRPWM
nodes in the k3-am62x-sk-common.dtsi so as to not duplicate
nodes in the board files.

Judith Mendez (3):
  arm64: dts: ti: k3-am62p5-sk: Enable PWM
  arm64: dts: ti: k3-am62a7-sk: Enable PWM
  arm64: dts: ti: k3-am625-sk: Enable PWM

 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts       | 40 ++++++++++++++
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts       | 54 +++++++++++++++++++
 .../arm64/boot/dts/ti/k3-am62x-sk-common.dtsi | 40 ++++++++++++++
 3 files changed, 134 insertions(+)

-- 
2.49.0

