Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2DF222B5AB
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 07:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747812807; cv=none; b=gFm/pz5TIYXdKMD7mzEmbvj6HDGroosbeniuSMnGbrFSpHGMLZ0Ps3bSJLfZVfk+f4pD5YDg+KJryusxiE/MCRn58ir9hGkM0fRbqH8AVllnbjFw2ogUEZcaUe6hEayfYC0GGYbgXlHoyvUUCoGd5p+o0Nl+UxsJWogX69pZnUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747812807; c=relaxed/simple;
	bh=4xy0GtmVIfQ2QmtWEg3U4POfKZANBBL/YbFJJPsQhnk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=t4LhAUuXJr/aGxyMrO00k+iqG9q8viWS6ccFjG+eJf8HOgbUAIR0fya27JW63cP5NLf1xXK8O7R4OSRys11MVbHZUeSY5+gGUlpQiK6E0nSILQsPqHRHgJyrcR5F0n9bPXSdq0fMGkhdf3KgJ9YdhHhRI9Rjgp2H1m4tGq4xoTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=wMajyIMe; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="wMajyIMe"
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54L7Wksa1453531;
	Wed, 21 May 2025 02:32:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1747812766;
	bh=wnVuh0PbidAUtWt49KC5+f9+/6VHlmPLQ1bqwa8wfnc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=wMajyIMekHJWqr+Pv4nTna5cTslglswOn4SuQvPcRWTt3+ZBtm/xaNquyoz7IbJ9M
	 5RIDw+BjiIah3HKS00MygD8Ukp2wa8THFiyaI16F8iCE8R4Prp2YmSdcMygbN81rfD
	 wQABbkUjmur5sKTXZHDiTp5yuVwER2KB5eHDL/XM=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54L7Wk0I551191
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 21 May 2025 02:32:46 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 21
 May 2025 02:32:45 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 21 May 2025 02:32:45 -0500
Received: from localhost (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com [10.24.72.182])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54L7WimM068593;
	Wed, 21 May 2025 02:32:45 -0500
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
Subject: [RFC PATCH v2 3/3] drm/bridge: cadence: cdns-mhdp8546-core: Reduce log level for DPCD read/write
Date: Wed, 21 May 2025 13:02:37 +0530
Message-ID: <20250521073237.366463-4-j-choudhary@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250521073237.366463-1-j-choudhary@ti.com>
References: <20250521073237.366463-1-j-choudhary@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Reduce the log level for cdns_mhdp_dpcd_read and cdns_mhdp_dpcd_write
errors in cdns_mhdp_transfer function as in case of failure, there is
flooding of these prints along with other indicators like EDID failure
logs which are fairly intuitive in themselves rendering these error logs
useless.
Also, the caller functions for the cdns_mhdp_transfer in drm_dp_helper.c
(which calls it 32 times), has debug log level in case transfer fails.
So having a superseding log level in cdns_mhdp_transfer seems bad.

Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
---
 drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
index 5388e62f230b..71d35d0d3e74 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
@@ -782,7 +782,7 @@ static ssize_t cdns_mhdp_transfer(struct drm_dp_aux *aux,
 			if (!ret)
 				continue;
 
-			dev_err(mhdp->dev,
+			dev_dbg(mhdp->dev,
 				"Failed to write DPCD addr %u\n",
 				msg->address + i);
 
@@ -792,7 +792,7 @@ static ssize_t cdns_mhdp_transfer(struct drm_dp_aux *aux,
 		ret = cdns_mhdp_dpcd_read(mhdp, msg->address,
 					  msg->buffer, msg->size);
 		if (ret) {
-			dev_err(mhdp->dev,
+			dev_dbg(mhdp->dev,
 				"Failed to read DPCD addr %u\n",
 				msg->address);
 
-- 
2.34.1

