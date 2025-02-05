Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 621FC151985;
	Wed,  5 Feb 2025 11:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738756263; cv=none; b=VM2ATDa9cgVr5Ag/nZPSNS8/SvQd/AaLplJz7kkGN8MSBsblpHh4xIUeRd53eDqTtepReiAKJo4+GA8PVANSVRQTugTt21Qer1JzMD57LtdWDMLvS4r9liAIYsOwpSkePK2LATKyF1bctjwPHy/w8mQ00Rnx+WBmVebqi0ZvHys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738756263; c=relaxed/simple;
	bh=5g6YOzSe6fsyso+7WgRGs6/zKWKU+831tvNOxXcI50A=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Tbk1yQ0y7bnM8igmW14aDV4KPxTEob4HpKIFYyafSlaCA6Yf80OM0P2ve4yzSYau1lldw5BEe21+wX+S5wafYsYuij9M5VedWNqZ5ZVB4JQEd7y/18crOZJuNUE4IAj3Hzs7S/LEWLK6BlX8olllIaweOLwePY1Sp1C0DJhgWLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=btTndPV0; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="btTndPV0"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 515BoYGR3346430
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 5 Feb 2025 05:50:34 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738756234;
	bh=bHCZ6vkj1ClCs8UR+jdgMTD+0c/16hW0zlTlJVeP+oI=;
	h=From:To:Subject:Date;
	b=btTndPV07351tRAU28suYdXTRJYnTiPCBsaBpQ0nqtmcdQu7GXuRuSjmaLX8SbokC
	 aFQhwHrnGB/UVEh4dAiXnBEXArbE72eBqruVvEyHN03UKaJuG2FUaIBv/d+tqro238
	 roqk0USV4pZcJh1EnoJ+BLknQr6Od10z8uRsFC2E=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 515BoYmI031815
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 5 Feb 2025 05:50:34 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 5
 Feb 2025 05:50:33 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 5 Feb 2025 05:50:33 -0600
Received: from hkshenoy.dhcp.ti.com (hkshenoy.dhcp.ti.com [172.24.227.96])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 515BoPCh043245;
	Wed, 5 Feb 2025 05:50:26 -0600
From: Harikrishna Shenoy <h-shenoy@ti.com>
To: <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
        <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
        <jernej.skrabec@gmail.com>, <simona@ffwll.ch>,
        <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
        <tzimmermann@suse.de>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <jani.nikula@intel.com>, <j-choudhary@ti.com>,
        <sui.jingfeng@linux.dev>, <viro@zeniv.linux.org.uk>,
        <r-ravikumar@ti.com>, <sjakhade@cadence.com>, <yamonkar@cadence.com>,
        <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 0/2] "no-hpd" support in CDNS DP bridge driver
Date: Wed, 5 Feb 2025 17:20:23 +0530
Message-ID: <20250205115025.3133487-1-h-shenoy@ti.com>
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

In J721s2 EVM, DP0 HPD is not connected to correct HPD pin on SOC
which results in HPD detect as always connnected, so when display
is not connected driver continuously retries to read EDID and DPCD
registers.

To handle such cases add support for no hpd configuration in
cdns-mhdp driver.

Changelog v2->v3:
- update the mhdp->plugged status for no hpd configuration in
cdns_mhdp_bridge_detect()

Link to v2: 
<https://lore.kernel.org/all/20230406015207.GO9915@pendragon.ideasonboard.com/>

Rahul T R (2):
  dt-bindings: drm/bridge: Add no-hpd property
  drm: bridge: cdns-mhdp8546: Add support for no-hpd

 .../display/bridge/cdns,mhdp8546.yaml         |  6 +++
 .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 54 ++++++++++++++++---
 .../drm/bridge/cadence/cdns-mhdp8546-core.h   |  1 +
 3 files changed, 55 insertions(+), 6 deletions(-)

-- 
2.34.1

