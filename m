Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB164267B01
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 09:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751622562; cv=none; b=U14I5c0P0VkVLEjOh/IZp4xK7uDjItpLT70tlNWOlGRAZRvetVtu3GZUdDDwk5oG+2zW7mF+lU8n3QWk4xNvQHicnajF9AegCEs7fPaSHEzz+GVyuuMRG4C3fxmG9whabLwZ5x9W0KKT+K1AtyFuZk48PRlSx6h8TjiNZyci77c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751622562; c=relaxed/simple;
	bh=Ucbo7v51fQBpSPEcmC2oC1OMdgo3BVP6CkawMLVEiv4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=J1NWVgeAABuf6worlhN4YmaC+gW7Q3AiCMP9EgZu5s5ejN25XTro/GDKSbgmI3fDyR9F1XzDahVXwm1g4W096b8sG42LWcVHHJg4ypgKOP2525nYrv4Ls1e2IMgNz4+80gXWOqYPUN1rscm88CyGdE7NE0l0KoBXFsnmXm5A4NM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=QY7rlK40; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="QY7rlK40"
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5649mrFB264764;
	Fri, 4 Jul 2025 04:48:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1751622533;
	bh=tL1i8/9vpQanxe1RfVzbrNGx7ZulJeN77FBHMNXBaRI=;
	h=From:To:CC:Subject:Date;
	b=QY7rlK40TkuwaMJ+cw/Pa2J+QCebavlYVNoTD7aE61nTnSHsUU1fuDQEoNsUFrsv/
	 7t9afAxGgRYRLrKAfv3uz6wGlHYoHmVOAe/R3l0xAMANJFC52YmmytT6gAdUQ0Rqb6
	 xnyPs/hX+7MPRPAtPkfSuUrqmxi9tjzO1uvmzIMo=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5649mr6m1645551
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 4 Jul 2025 04:48:53 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 4
 Jul 2025 04:48:52 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 4 Jul 2025 04:48:52 -0500
Received: from localhost (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.166])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5649mqaA2774006;
	Fri, 4 Jul 2025 04:48:52 -0500
From: Jayesh Choudhary <j-choudhary@ti.com>
To: <jyri.sarha@iki.fi>, <maarten.lankhorst@linux.intel.com>,
        <mripard@kernel.org>, <tzimmermann@suse.de>,
        <dri-devel@lists.freedesktop.org>, <devarsht@ti.com>,
        <tomi.valkeinen@ideasonboard.com>, <mwalle@kernel.org>
CC: <airlied@gmail.com>, <simona@ffwll.ch>, <linux-kernel@vger.kernel.org>,
        <j-choudhary@ti.com>
Subject: [PATCH v4 0/3] Decouple max_pclk check from constant display feats
Date: Fri, 4 Jul 2025 15:18:48 +0530
Message-ID: <20250704094851.182131-1-j-choudhary@ti.com>
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

Changelog v3->v4:
- Minor cosmetic fixes in code, comments and commit message
- Pick up R-by and add Fixes tag

v3 patch link:
https://lore.kernel.org/all/20250701095541.190422-1-j-choudhary@ti.com/

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
 drivers/gpu/drm/tidss/tidss_drv.h   |  7 +++
 drivers/gpu/drm/tidss/tidss_oldi.c  | 26 ++++++++++
 4 files changed, 62 insertions(+), 49 deletions(-)

-- 
2.34.1

