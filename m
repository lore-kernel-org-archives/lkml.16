Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED5B02010F5;
	Tue,  4 Feb 2025 06:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738649789; cv=none; b=VOVHlyqw1Z4Wd17K0v3nmzi4zFc99MI/OVtTG1OaJzcBfOigtzv5jMWdoSy8IocAySnJMl3dKRQNr1jfx9OR/iHXn++vGAxK03Y2mHyAjo1Cnep0GX6L4iAl3A3+hPEsfIZzh8igQlguEU0D8PqiF6pGB8sYetwMsvboRXRB/zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738649789; c=relaxed/simple;
	bh=zjS3zd5vuTY58LmRAJm8hUGz/mIPQs9tjeo+yJzl+HY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=RW8VmBbPtqPtTPOVLusoRW4yBlV5WWwwdOIZyeNwN4CFraYOOH1MBCy0ElIiCjdV485LIEGX/OKZ5g764FAA0mlZd+Y1TJaXTNJglyUr6FsDXQv7R493p6cxvpnp9VP6qd0BNl+2+Qxko5lBzuRu3qp1vqjDf4Osjl7+JbUrkAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=khtQu4b3; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="khtQu4b3"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5146FsWT2282123
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 4 Feb 2025 00:15:54 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738649754;
	bh=zQsmjfXL3L54NtdkjfV8zRzMvCvtGgrmcg68EwqgnUw=;
	h=From:To:CC:Subject:Date;
	b=khtQu4b3lhrL3/ZCHopNqOQP5poA/i/fM2ojf/NbrEutoe41Ccoo1yVFGDPa0OJB5
	 +hGpCs63E7KUS4iC+h7LWGh+glBWvJGUna+CS8O7IT1z1Wir7C5vOHERxH8evVE184
	 vw99z7D53UJl++tDOoaq+QUJpXEoHhIeAjW6yWxs=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5146Fs2b023282
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 4 Feb 2025 00:15:54 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 4
 Feb 2025 00:15:53 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 4 Feb 2025 00:15:53 -0600
Received: from localhost (ti.dhcp.ti.com [172.24.227.95] (may be forged))
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5146FqDv075196;
	Tue, 4 Feb 2025 00:15:53 -0600
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
Subject: [PATCH v2 0/2] Add support for AM62L DSS
Date: Tue, 4 Feb 2025 11:45:50 +0530
Message-ID: <20250204061552.3720261-1-devarsht@ti.com>
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
V2:
- Fix incorrect format of compatible string (comma instead of
  hyphen) for AM62L SoC
- Use separate register space and helper functions for AM62L
  due to minor differences in register offset/bit position differences
  for first plane

Rangediff:
V1->V2
- https://gist.github.com/devarsht/11d47f25ca9fea6976e6284330ddf443

NOTE: This series needs to be applied on top of AM62A dt-binding fix:
https://lore.kernel.org/all/20250203155431.2174170-1-devarsht@ti.com/

Devarsh Thakkar (2):
  dt-bindings: display: ti,am65x-dss: Add support for AM62L DSS
  drm/tidss: Add support for AM62L display subsystem

 .../bindings/display/ti/ti,am65x-dss.yaml     |  25 +++-
 drivers/gpu/drm/tidss/tidss_dispc.c           | 140 ++++++++++++++++++
 drivers/gpu/drm/tidss/tidss_dispc.h           |   2 +
 drivers/gpu/drm/tidss/tidss_drv.c             |   1 +
 4 files changed, 167 insertions(+), 1 deletion(-)

-- 
2.39.1

