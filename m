Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C028C26F44C
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 09:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751363778; cv=none; b=WLxVmeFlouaicoiZj10XC7kdQzlBBS1ikoaiRWQNsTwY/Zqpg6/zQzKqCqJjSVoqAGHTUXlp5sffqEFX3PlMJWHaJTI117KDphQg4tbFv8eoSH1g214p6MBEavYamPoSW1PpRwn8xH3dovbFxvst+UCwCdC//AaQ+QqSOpnff/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751363778; c=relaxed/simple;
	bh=xF4E+wLpBrCDPdne7UnT/kYkYiCN+THyoEn+1oE1lWM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=PmPYnXDIdj6V2fEn1s5TKndUcJxHaW3jcQD931PxoO54ea2DHJq8iS4XenP6xpewpDzSywEodFOn1YTgYEpJ5EhC+dimYGrSlNPrnZbA8hFAnUfnXIwbi8sBPgmjgUL0WS7B5lXUN7rNOBaQ8zhGP5M7mw7/3WuWUY8+10yvlbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=I/ErP+KD; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="I/ErP+KD"
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5619thRb3596178;
	Tue, 1 Jul 2025 04:55:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1751363743;
	bh=3RXaQORbxtoj9Fu7g8UHnM4Dxh2k339q95lY0dJwUs0=;
	h=From:To:CC:Subject:Date;
	b=I/ErP+KDHWxNJDQWg5x/MC1Tpm8LnYYT26K+IQu2QMOO/9Um2JRR4WgyjrO06Lg+2
	 YfZKGOwtGLG5b9VA+zh0bvtFHXe+MI21yuhiMUr+B4Rtc0Sy8kRh+Ac9oegUwY4GY0
	 3p1IdaO5bqGVrqz/Uf7ednwPk/oqVP+Lc3yI4UGA=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5619th1x3972640
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 1 Jul 2025 04:55:43 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 1
 Jul 2025 04:55:42 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 1 Jul 2025 04:55:42 -0500
Received: from localhost (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.167])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5619tfi51072943;
	Tue, 1 Jul 2025 04:55:42 -0500
From: Jayesh Choudhary <j-choudhary@ti.com>
To: <jyri.sarha@iki.fi>, <maarten.lankhorst@linux.intel.com>,
        <mripard@kernel.org>, <tzimmermann@suse.de>,
        <dri-devel@lists.freedesktop.org>, <devarsht@ti.com>,
        <tomi.valkeinen@ideasonboard.com>, <mwalle@kernel.org>
CC: <airlied@gmail.com>, <simona@ffwll.ch>, <linux-kernel@vger.kernel.org>,
        <j-choudhary@ti.com>
Subject: [PATCH v3 0/3] Decouple max_pclk check from constant display feats
Date: Tue, 1 Jul 2025 15:25:38 +0530
Message-ID: <20250701095541.190422-1-j-choudhary@ti.com>
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

In an effort to make the existing compatibles more usable, we are
removing the max_pclk_khz form dispc_features structure and doing the
correspondig checks using "curr_max_pclk[]".

Changes are fully backwards compatible.

After integration of OLDI support[0], we need additional patches in
oldi to identify the VP that has OLDI. We have to do this since
OLDI driver owns the VP clock (its serial clock) and we cannot perform
clock operations on those VP clock from tidss driver. This issue was
also reported upstream when DSI fixes[1] had some clock related calls
in tidss driver. When "clk_round_rate()" is called, ideally it should
have gone to "sci_clk_determine_rate()" to query DM but it doesn't since
clock is owned by OLDI not tidss.

So add a member is_oldi_vp[] in tidss_device structure to identify this
and avoid performing clock operations for VP if it has OLDI panel.
For the same checks in OLDI driver, atomic_check() hook is added to its
bridge_funcs.
In the atomic_check() chain, first the bridge_atomic_check() is called
and then crtc_atomic_check() is called. So mode clock is first checked
in oldi driver and then skipped in tidss driver.

Had the tidss_oldi structure been exposed to tidss_dispc.c, we could
have directly checked VP type in dispc but since the structure is defined
in tidss_oldi.c , we have to add additional member to tidss_device
structure.

[0]: https://lore.kernel.org/all/20250528122544.817829-1-aradhya.bhatia@linux.dev/
[1]: https://lore.kernel.org/all/DA6TT575Z82D.3MPK8HG5GRL8U@kernel.org/

Changelog v2->v3:
- Add changes for OLDI
- Rename max_pclk as it is misleading
- Change commit message to make it more appropriate
- Drop unnecessary zero initialization

v2 patch link:
https://lore.kernel.org/all/20250618100509.20386-1-j-choudhary@ti.com/

Changelog v1->v2:
- Rebase it on linux-next after OLDI support series as all of its
  patches are reviewed and tested and it touches one of the functions
  used.
  
v1 patch link:
https://lore.kernel.org/all/20250618075804.139844-1-j-choudhary@ti.com/

Jayesh Choudhary (3):
  drm/tidss: oldi: Add property to identify OLDI supported VP
  drm/tidss: Remove max_pclk_khz from tidss display features
  drm/tidss: oldi: Add atomic_check hook for oldi bridge

 drivers/gpu/drm/tidss/tidss_dispc.c | 77 +++++++++++------------------
 drivers/gpu/drm/tidss/tidss_dispc.h |  1 -
 drivers/gpu/drm/tidss/tidss_drv.h   |  4 ++
 drivers/gpu/drm/tidss/tidss_oldi.c  | 26 ++++++++++
 4 files changed, 59 insertions(+), 49 deletions(-)

-- 
2.34.1

