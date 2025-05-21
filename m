Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE9B1FF7B3
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 07:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747812795; cv=none; b=LaL02uAVvzMp2E4zTUBRhazHeCxk9d17bi8xtX3uz+uXkXQDDdLkS+uuoYL5mXLTHa6OKkFfyIqruFpO80ElaewSSuat7AfRgS7iUO7k3kEA0G2DFOPviP3NCvZxufIDtc5q077zcrvEL5lHui1FVTGxKqAyq/uouzNL/vJ7ekE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747812795; c=relaxed/simple;
	bh=8eNFkqYc1Q8avbmUfFXD/nGdSz90QYLnWsLeQWK1Klw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=G8f9bsECnUP8JRIhXPFFimfXQhPU14wOQfpQL+VsHsibuuThWA3icrWz3i5PoxHzBUekrTuhuqro5dQ5DVr7/SBGhqY9OF7+THCAFZWr2Z3ppJ/hHmYbopOLRVUoOqr7vaFg23kMUDx3RGNO4TuASJOSt/VguS0rfqGtGWCw/nE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Ujti79Wi; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Ujti79Wi"
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54L7WeEF237978;
	Wed, 21 May 2025 02:32:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1747812760;
	bh=I/pBmbcMK9Gqr1yMd2AESklnL6wyupNBCH9Ky8K4Fe8=;
	h=From:To:CC:Subject:Date;
	b=Ujti79Wit6AfDQE9DGAYbPlOfuzLqAze+UcGIs528qO/Qs/Xm3na6ZHmQWVCYA+xf
	 d2rrOgggoTce1CGcO2kdNOpnvbY1Ql7ZqWzPcnn97pfF1vCmjHhFjlQ1nnjg8N+R28
	 7DaE5nbDF8WdCAnVgMkoKUsZMgcUCV1En5qDD/D4=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54L7We0T2557592
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 21 May 2025 02:32:40 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 21
 May 2025 02:32:39 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 21 May 2025 02:32:39 -0500
Received: from localhost (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com [10.24.72.182])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54L7WcPR068559;
	Wed, 21 May 2025 02:32:38 -0500
From: Jayesh Choudhary <j-choudhary@ti.com>
To: <dianders@chromium.org>, <andrzej.hajda@intel.com>,
        <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
        <Laurent.pinchart@ideasonboard.com>, <dri-devel@lists.freedesktop.org>,
        <tomi.valkeinen@ideasonboard.com>, <alexander.stein@ew.tq-group.com>
CC: <jonas@kwiboo.se>, <jernej.skrabec@gmail.com>,
        <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
        <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
        <lumag@kernel.org>, <jani.nikula@intel.com>, <andy.yan@rock-chips.com>,
        <mordan@ispras.ru>, <linux@treblig.org>, <viro@zeniv.linux.org.uk>,
        <yamonkar@cadence.com>, <sjakhade@cadence.com>,
        <quentin.schulz@free-electrons.com>, <jsarha@ti.com>,
        <linux-kernel@vger.kernel.org>, <devarsht@ti.com>,
        <j-choudhary@ti.com>
Subject: [RFC PATCH v2 0/3] CDNS-MHDP8546 minor cleanups
Date: Wed, 21 May 2025 13:02:34 +0530
Message-ID: <20250521073237.366463-1-j-choudhary@ti.com>
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

Hello All,

These 3 patches does some fixup for the cdns-mhdp8546 bridge.
- First of all, it removes the legacy !DRM_BRIDGE_ATTACH_NO_CONNECTOR
  usecase.
- Then it fixes possible NULL POINTER in cdns_mhdp_modeset_retry_fn
  function call where the connector mutex is called. Since we cannot
  use the atomic_state in these worker threads, we cannot get to
  connector state in the worker thread. So we ensure that connector
  field is propagated before the first possible call for this worker
  thread by using pointer to the drm_connector.
- Then it reduces log level inside cdns_mhdp_transfer to avoid flooding
  of these logs.

v1 patch:
<https://lore.kernel.org/all/20250116111636.157641-1-j-choudhary@ti.com/>

Changelog v1->v2:
- Remove !DRM_BRIDGE_ATTACH_NO_CONNECTOR entirely
- Add mode_valid in drm_bridge_funcs[0]
- Fix NULL POINTER differently since we cannot access atomic_state
- Reduce log level in cdns_mhdp_transfer call

[0]: https://lore.kernel.org/all/20240530091757.433106-1-j-choudhary@ti.com/

Jayesh Choudhary (3):
  drm/bridge: cadence: cdns-mhdp8546-core: Remove legacy support for
    connector initialisation in bridge
  drm/bridge: cadence: cdns-mhdp8546*: Change drm_connector from pointer
    to structure
  drm/bridge: cadence: cdns-mhdp8546-core: Reduce log level for DPCD
    read/write

 .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 218 ++++--------------
 .../drm/bridge/cadence/cdns-mhdp8546-core.h   |   2 +-
 .../drm/bridge/cadence/cdns-mhdp8546-hdcp.c   |   8 +-
 3 files changed, 46 insertions(+), 182 deletions(-)

-- 
2.34.1

