Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21F6721D3E1
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 14:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748528751; cv=none; b=cV6izQADOVAlPh4tjkyvjpEbc09EpK1FnJYo678DSdGSdiO5UiwhlN1UD3tor/Bo7pPP/uaUf2+ldo3g/sq2wU7BuQVQ7vgTx147T5ve0U/Kz8NmQqYrwuAh2hAqKd+2gAxfCQ5PlncfM7M4hZffMrw37FoXVIwfxTwPIKh4zYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748528751; c=relaxed/simple;
	bh=5q/Nt03mW2tHN1oqlNyTEbWsrQ7GhC569w51AxZGonc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=c1vHSIjnLoYtLHdQ3bIlcugG71Ueg/7S9vfwIO3cnj8wvmGMRrsKgUD9Ph7/x9Cd+9slhZJj8wRSNvafi6FMq0/ohmX2W8uJriO7JxbnTKlzWQ/4y4xlp9aAL5BVwCpJeKJnxW58UvJhDdx59D/16/k+OgtFdAOQdNnmFY/1KMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=NXeHWYWk; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="NXeHWYWk"
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54TEPKYa2393261;
	Thu, 29 May 2025 09:25:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1748528720;
	bh=dY8BfBTTWayfadhN1o+/naocUo6MT0YpRR4g2Uwl7JY=;
	h=From:To:CC:Subject:Date;
	b=NXeHWYWkg1qkdYRtRnUQfCjHqOGVoQO+pU4k47qKmnZ3tvVoSVx00HXEXHJ6MWVv8
	 BnxNUUVcsCa+nSfxlMT43olyu9QJGd7IURyoXajFoLWKSXETJI1tggBLIJG9EorZEf
	 DrLBv294Ola0EBcEwIGnigYZu4T0I2ikO1sygTRE=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54TEPK2a090740
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 29 May 2025 09:25:20 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 29
 May 2025 09:25:18 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 29 May 2025 09:25:18 -0500
Received: from localhost (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.14])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 54TEPHml1703962;
	Thu, 29 May 2025 09:25:18 -0500
From: Jayesh Choudhary <j-choudhary@ti.com>
To: <dianders@chromium.org>, <andrzej.hajda@intel.com>,
        <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
        <Laurent.pinchart@ideasonboard.com>, <dri-devel@lists.freedesktop.org>,
        <tomi.valkeinen@ideasonboard.com>, <andyshrk@163.com>
CC: <jonas@kwiboo.se>, <jernej.skrabec@gmail.com>,
        <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
        <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
        <lumag@kernel.org>, <lyude@redhat.com>, <andy.yan@rock-chips.com>,
        <mordan@ispras.ru>, <linux@treblig.org>, <viro@zeniv.linux.org.uk>,
        <a-bhatia1@ti.com>, <javierm@redhat.com>,
        <linux-kernel@vger.kernel.org>, <devarsht@ti.com>,
        <j-choudhary@ti.com>
Subject: [PATCH v3 0/5] MHDP8546 fixes related to DBANC usecase
Date: Thu, 29 May 2025 19:55:12 +0530
Message-ID: <20250529142517.188786-1-j-choudhary@ti.com>
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

With the introduction of DBANC framework, the connector is no longer
initialised in bridge_attach if that flag is set by the display
controller.

This series does some cleanup for legacy !(DRM_BRIDGE_ATTACH_NO_CONNECTOR)
usecase and adds fixes for DRM_BRIDGE_ATTACH_NO_CONNECTOR usecase.

v2 patch lnk:
<https://lore.kernel.org/all/20250521073237.366463-1-j-choudhary@ti.com/>

Changelog v2->v3:
- Add mode_valid in drm_bridge_funcs to a separate patch
- Remove "if (mhdp->connector.dev)" conditions that were missed in v2
- Split out the move of drm_atomic_get_new_connector_for_encoder()
  to a separate patch
- Drop "R-by" considering the changes in v2[1/3]
- Add Fixes tag to first 4 patches:
  commit c932ced6b585 ("drm/tidss: Update encoder/bridge chain connect model")
  This added DBANC flag in tidss while attaching bridge to the encoder
- Drop RFC prefix

Jayesh Choudhary (5):
  drm/bridge: cadence: cdns-mhdp8546-core: Remove legacy support for
    connector initialisation in bridge
  drm/bridge: cadence: cdns-mhdp8546*: Change drm_connector from
    structure to pointer
  drm/bridge: cadence: cdns-mhdp8546-core: Set the mhdp connector
    earlier in atomic_enable()
  drm/bridge: cadence: cdns-mhdp8546-core: Add mode_valid hook to
    drm_bridge_funcs
  drm/bridge: cadence: cdns-mhdp8546-core: Reduce log level for DPCD
    read/write

 .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 232 ++++--------------
 .../drm/bridge/cadence/cdns-mhdp8546-core.h   |   2 +-
 .../drm/bridge/cadence/cdns-mhdp8546-hdcp.c   |   8 +-
 3 files changed, 48 insertions(+), 194 deletions(-)

-- 
2.34.1

