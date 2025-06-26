Received: from smtp11.infineon.com (smtp11.infineon.com [217.10.52.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E3E1B21BF
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 04:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.10.52.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750913915; cv=none; b=e0ul9g0qAy30p01N+MGLTHAOblJYaOxmZc2YMQgLVrqZKqbyTI6tRRBNr6INtGV4VwfnDkAdASx1aeh5F8SneeZs+J3uJShihg9iptfUSri5Ge83HlEX/n+O7XwjEpO5ZCgolKb0PNBlV2vr175TqWTGr48dIVPEh/YxkYsaGqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750913915; c=relaxed/simple;
	bh=AKzivFgfGZhK3wNXIzhi9adSJDcnzcuv1iu4Tm7CEEA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=nqtLioYfkf1H2NvLS6x80vdq2SorrIuJrhdMxRt7QpSCErCi2s+TH2PcVXw39R3bVO8JpcjJ5oYE51GZBTDnDoLxfUEp4klK21b+jao8U6q/mHVjmGg5kOAghb6tCX+CVApOhz1whMRQ3ROq8clJszXde3xkXuLxSJs+0BlMzpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infineon.com; spf=pass smtp.mailfrom=infineon.com; dkim=pass (1024-bit key) header.d=infineon.com header.i=@infineon.com header.b=TF2DmRD3; arc=none smtp.client-ip=217.10.52.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infineon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infineon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=infineon.com header.i=@infineon.com header.b="TF2DmRD3"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
  t=1750913914; x=1782449914;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=AKzivFgfGZhK3wNXIzhi9adSJDcnzcuv1iu4Tm7CEEA=;
  b=TF2DmRD3iLPuCegw1ufdAoN/wqRNnqVP33kLv3o3+S2dQJH74cbrp01e
   h23CL/QzLRVarrqDLk6EKJqgqEMW+qeHsO7C8StZ3boN31k0ZCiQjnGo2
   g9I3T5z0MkioyPHthUAxbt/IDfMhTsfHeALElsq76HL3wnrPiXWsf8uAA
   w=;
X-CSE-ConnectionGUID: K5j2phKUTJezRWT4zFKpCQ==
X-CSE-MsgGUID: jl/EDIXNRh20ITGVD0tdqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="100357279"
X-IronPort-AV: E=Sophos;i="6.16,266,1744063200"; 
   d="scan'208";a="100357279"
Received: from unknown (HELO MUCSE812.infineon.com) ([172.23.29.38])
  by smtp11.infineon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 06:57:22 +0200
Received: from MUCSE827.infineon.com (172.23.29.20) by MUCSE812.infineon.com
 (172.23.29.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Thu, 26 Jun
 2025 06:57:22 +0200
Received: from ISCN5CG14747PP.infineon.com (10.161.6.196) by
 MUCSE827.infineon.com (172.23.29.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Thu, 26 Jun 2025 06:57:20 +0200
From: Gokul Sivakumar <gokulkumar.sivakumar@infineon.com>
To: Arend van Spriel <arend.vanspriel@broadcom.com>, Johannes Berg
	<johannes.berg@intel.com>
CC: Gokul Sivakumar <gokulkumar.sivakumar@infineon.com>,
	<linux-kernel@vger.kernel.org>, <brcm80211@lists.linux.dev>,
	<wlan-kernel-dev-list@infineon.com>
Subject: [PATCH wireless-next] wifi: brcmfmac: fix P2P discovery failure in P2P peer due to missing P2P IE
Date: Thu, 26 Jun 2025 10:21:50 +0530
Message-ID: <20250626045529.6884-1-gokulkumar.sivakumar@infineon.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MUCSE804.infineon.com (172.23.29.30) To
 MUCSE827.infineon.com (172.23.29.20)

After commit bd99a3013bdc ("brcmfmac: move configuration of probe request
IEs"), the probe request MGMT IE addition operation brcmf_vif_set_mgmt_ie()
got moved from the brcmf_p2p_scan_prep() to the brcmf_cfg80211_scan().

Because of this, as part of the scan request handler for the P2P Discovery,
vif struct used for adding the Probe Request P2P IE in firmware got changed
from the P2PAPI_BSSCFG_DEVICE vif to P2PAPI_BSSCFG_PRIMARY vif incorrectly.
So the firmware stopped adding P2P IE to the outgoing P2P Discovery probe
requests frames and the other P2P peers were unable to discover this device
causing a regression on the P2P feature.

To fix this, while setting the P2P IE in firmware, properly use the vif of
the P2P discovery wdev on which the driver received the P2P scan request.
This is done by not changing the vif pointer, until brcmf_vif_set_mgmt_ie()
is completed.

Fixes: bd99a3013bdc ("brcmfmac: move configuration of probe request IEs")
Signed-off-by: Gokul Sivakumar <gokulkumar.sivakumar@infineon.com>
---
 .../net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c   | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
index 4b70845e1a26..075b99478e65 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
@@ -1545,10 +1545,6 @@ brcmf_cfg80211_scan(struct wiphy *wiphy, struct cfg80211_scan_request *request)
 		return -EAGAIN;
 	}
 
-	/* If scan req comes for p2p0, send it over primary I/F */
-	if (vif == cfg->p2p.bss_idx[P2PAPI_BSSCFG_DEVICE].vif)
-		vif = cfg->p2p.bss_idx[P2PAPI_BSSCFG_PRIMARY].vif;
-
 	brcmf_dbg(SCAN, "START ESCAN\n");
 
 	cfg->scan_request = request;
@@ -1564,6 +1560,10 @@ brcmf_cfg80211_scan(struct wiphy *wiphy, struct cfg80211_scan_request *request)
 	if (err)
 		goto scan_out;
 
+	/* If scan req comes for p2p0, send it over primary I/F */
+	if (vif == cfg->p2p.bss_idx[P2PAPI_BSSCFG_DEVICE].vif)
+		vif = cfg->p2p.bss_idx[P2PAPI_BSSCFG_PRIMARY].vif;
+
 	err = brcmf_do_escan(vif->ifp, request);
 	if (err)
 		goto scan_out;
-- 
2.43.0

