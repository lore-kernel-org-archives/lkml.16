Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 290A721773F;
	Tue, 29 Apr 2025 14:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745937446; cv=none; b=foes6EhM2thHJuB6+Sh0I6tTqCNyh316ItW3KUzV0DFyoKn7b5o1a2BYTTs+HjaYBHEYIcmAret9iI/s0D0Cw4WmZrW23wc6+3GU9oYEECIZk5QlzWJbeBjRMcqSh7GwFLnfu2/ejJ5UkngItCdAnKMud+RjLCCYRZr4W13xlAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745937446; c=relaxed/simple;
	bh=YWFgEE/pYx43RIkZxqYPeNDBpIA1GTsKMfT06yg+9FY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=rME7o+Bgic8e/W2l81sFwhqCiHvHkSPeyIoS+2kuaol7MnPX5+zBRCaEsh0T44Mj6YNOfJ9mYeL3nQ6pCmleZ6x4zCjvhw5kKb69QfxAPkt2248XgZLFPy5ZhbBzVk4b3/vfdfOpWCa25Wl4iquvk37tm+YIZD9WJ908SMggazQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=bqNzLyf9; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="bqNzLyf9"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53TEaw0f3867999
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 29 Apr 2025 09:36:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745937418;
	bh=DKk1xaSMzcGFiMWCM2d8Q1zeAjKKaHVkdez7w5iD168=;
	h=From:To:CC:Subject:Date;
	b=bqNzLyf9+Max/wk5qTUB3X8O/i8lA6biTrudCotisD35Tz+/Eo+v6Kr2612wSyZKf
	 FRI8UQFKf+fyCpIVVhSe+jgoXdQ/+Lz5ysiTq1GCQqP9vSK82wa5I4NAMWR8a7VSeZ
	 nlQtC2dHAEumm7apvuJjSZQ6PMaRBNFxQ4bXU+L0=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53TEawBI035775
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 29 Apr 2025 09:36:58 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 29
 Apr 2025 09:36:57 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 29 Apr 2025 09:36:57 -0500
Received: from localhost (ti.dhcp.ti.com [172.24.227.95] (may be forged))
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53TEav0N086083;
	Tue, 29 Apr 2025 09:36:57 -0500
From: Devarsh Thakkar <devarsht@ti.com>
To: <jyri.sarha@iki.fi>, <tomi.valkeinen@ideasonboard.com>,
        <airlied@gmail.com>, <maarten.lankhorst@linux.intel.com>,
        <mripard@kernel.org>, <tzimmermann@suse.de>,
        <dri-devel@lists.freedesktop.org>, <simona@ffwll.ch>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <praneeth@ti.com>, <vigneshr@ti.com>, <aradhya.bhatia@linux.dev>,
        <s-jain1@ti.com>, <r-donadkar@ti.com>, <j-choudhary@ti.com>,
        <h-shenoy@ti.com>, <devarsht@ti.com>
Subject: [PATCH v5 0/3] Add support for AM62L DSS
Date: Tue, 29 Apr 2025 20:06:53 +0530
Message-ID: <20250429143656.3252877-1-devarsht@ti.com>
X-Mailer: git-send-email 2.39.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

This adds support for DSS subsystem present in TI's AM62L SoC
which supports single display pipeline with DPI output which
is also routed to DSI Tx controller within the SoC.

Change Log:
V5:
- Use hw_id instead of index for places where it was missed
  so that we pick correct base address for vid region

V4:
- Update vid_info struct to keep hw_id and instantiate
  only for actually existing pipes

V3:
- Make generic infra to support truncated K3 DSS IP's
- Remove AM62A updates from AM62L DT binding updates

V2:
- Fix incorrect format of compatible string (comma instead of
  hyphen) for AM62L SoC
- Use separate register space and helper functions for AM62L
  due to minor differences in register offset/bit position differences
  for first plane

Rangediff:
V4->V5:
- https://gist.github.com/devarsht/a0e6aa7b1c19f47facd0058962e3c3c2

V3->V4:
- https://gist.github.com/devarsht/1e75c9e1ac0cdfc01703a0776e31e782

V2->V3:
- https://gist.github.com/devarsht/24fa8dd2986861efa431352d19ebbb41

V1->V2
- https://gist.github.com/devarsht/11d47f25ca9fea6976e6284330ddf443

Links to previous versions:
V4: https://lore.kernel.org/all/20250326145736.3659670-1-devarsht@ti.com/
V3: https://lore.kernel.org/all/20250306132914.1469387-1-devarsht@ti.com/
V2: https://lore.kernel.org/all/20250204061552.3720261-1-devarsht@ti.com/
V1: https://lore.kernel.org/all/20241231090432.3649158-1-devarsht@ti.com/

Test logs:
https://gist.github.com/devarsht/82505ca69f0bd5d9788bfc240d2e83d4

Devarsh Thakkar (3):
  dt-bindings: display: ti,am65x-dss: Add support for AM62L DSS
  drm/tidss: Update infrastructure to support K3 DSS cut-down versions
  drm/tidss: Add support for AM62L display subsystem

 .../bindings/display/ti/ti,am65x-dss.yaml     |  21 +-
 drivers/gpu/drm/tidss/tidss_crtc.c            |  11 +-
 drivers/gpu/drm/tidss/tidss_dispc.c           | 193 ++++++++++++++----
 drivers/gpu/drm/tidss/tidss_dispc.h           |  13 +-
 drivers/gpu/drm/tidss/tidss_drv.c             |   1 +
 drivers/gpu/drm/tidss/tidss_kms.c             |   2 +-
 drivers/gpu/drm/tidss/tidss_plane.c           |   2 +-
 7 files changed, 195 insertions(+), 48 deletions(-)

-- 
2.39.1

