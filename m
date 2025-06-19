Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A17D87346F
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 01:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750295121; cv=none; b=Z5anVyOxiNSKl4GPNN1e4nqEdmrFSr4Qafe8rZy/gVR56mZ87n8n0TQk9OpjpJHtxfEnWGg5sbPd+QWjNz8bpj0bxP8GeZZeK26wqVKvrPs646w3VPG0Aiaynai6u8B+C6pWa3yWswN3Ls2zxdDZNmttR8UbAxaIZCcaj9RQTaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750295121; c=relaxed/simple;
	bh=kYVXC/8cL0AQKvj8r89iAh+CKfwN2fHxgsH4sOuPEN0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u6+BcPhGMoOv/GeE69lyjVTCw5fy5cgPiw31KNuDcqGJjmgiC5Vx9oUlgFzPM6Ze/72ZQlKDRacK546DkfoohwLgKY2mBHndLRNetEv6i5/dJl45q4+pRuMxJEoJRpLAMj58BjiokJ2Bwa8QKNommHDk9jlSFKUsmAuUbXCTD6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=HUrctnYf; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="HUrctnYf"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=aiBWST3oENwuiu4ri6sU6T6C/tfakFuYuXOzSTAnGKU=; b=HUrctnYf16rmM9MU
	2V+KPKyDCpSb0wK6RqmOk/xIwc+yU27XDv+TDsPVCR88Dixxk3J+zzhHRls0WAF40UarRDvMBaBBM
	M2MyS4uvMqCaKY7xKAzuuaUNnkuKfFKLas7AMBsm8ya7fx6lbGD/NIPT5DKXU6Ezr8G4gBMHZByj/
	B1LintnCxFq9IBNQkgzc3sm812fdngPyt9X7JmpIa89VrOTIoyd24l6Tv1MMsehQ9Wj4LkGjG/joo
	70VVoFbq2z8Wh1nZcKHlwj22HevXYMQzlEDkbgMCnA/7/FLVG96qmJpXBlXSLoB8kTEK/T1Z30VIy
	KxiSeTgWjh3DYUH6+A==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1uS3iF-00AWhQ-25;
	Thu, 19 Jun 2025 01:05:07 +0000
From: linux@treblig.org
To: loic.poulain@oss.qualcomm.com,
	wcn36xx@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH] wifi: wcn36xx: Remove unused wcn36xx_smd_update_scan_params
Date: Thu, 19 Jun 2025 02:05:06 +0100
Message-ID: <20250619010506.296494-1-linux@treblig.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

wcn36xx_smd_update_scan_params() last use was removed in 2020 by
commit 5973a2947430 ("wcn36xx: Fix software-driven scan")

Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/net/wireless/ath/wcn36xx/smd.c | 60 --------------------------
 drivers/net/wireless/ath/wcn36xx/smd.h |  1 -
 2 files changed, 61 deletions(-)

diff --git a/drivers/net/wireless/ath/wcn36xx/smd.c b/drivers/net/wireless/ath/wcn36xx/smd.c
index 2cf86fc3f8fe..136acc414714 100644
--- a/drivers/net/wireless/ath/wcn36xx/smd.c
+++ b/drivers/net/wireless/ath/wcn36xx/smd.c
@@ -1127,66 +1127,6 @@ int wcn36xx_smd_process_ptt_msg(struct wcn36xx *wcn,
 	return ret;
 }
 
-static int wcn36xx_smd_update_scan_params_rsp(void *buf, size_t len)
-{
-	struct wcn36xx_hal_update_scan_params_resp *rsp;
-
-	rsp = buf;
-
-	/* Remove the PNO version bit */
-	rsp->status &= (~(WCN36XX_FW_MSG_PNO_VERSION_MASK));
-
-	if (WCN36XX_FW_MSG_RESULT_SUCCESS != rsp->status) {
-		wcn36xx_warn("error response from update scan\n");
-		return rsp->status;
-	}
-
-	return 0;
-}
-
-int wcn36xx_smd_update_scan_params(struct wcn36xx *wcn,
-				   u8 *channels, size_t channel_count)
-{
-	struct wcn36xx_hal_update_scan_params_req_ex msg_body;
-	int ret;
-
-	mutex_lock(&wcn->hal_mutex);
-	INIT_HAL_MSG(msg_body, WCN36XX_HAL_UPDATE_SCAN_PARAM_REQ);
-
-	msg_body.dot11d_enabled	= false;
-	msg_body.dot11d_resolved = true;
-
-	msg_body.channel_count = channel_count;
-	memcpy(msg_body.channels, channels, channel_count);
-	msg_body.active_min_ch_time = 60;
-	msg_body.active_max_ch_time = 120;
-	msg_body.passive_min_ch_time = 60;
-	msg_body.passive_max_ch_time = 110;
-	msg_body.state = PHY_SINGLE_CHANNEL_CENTERED;
-
-	PREPARE_HAL_BUF(wcn->hal_buf, msg_body);
-
-	wcn36xx_dbg(WCN36XX_DBG_HAL,
-		    "hal update scan params channel_count %d\n",
-		    msg_body.channel_count);
-
-	ret = wcn36xx_smd_send_and_wait(wcn, msg_body.header.len);
-	if (ret) {
-		wcn36xx_err("Sending hal_update_scan_params failed\n");
-		goto out;
-	}
-	ret = wcn36xx_smd_update_scan_params_rsp(wcn->hal_buf,
-						 wcn->hal_rsp_len);
-	if (ret) {
-		wcn36xx_err("hal_update_scan_params response failed err=%d\n",
-			    ret);
-		goto out;
-	}
-out:
-	mutex_unlock(&wcn->hal_mutex);
-	return ret;
-}
-
 static int wcn36xx_smd_add_sta_self_rsp(struct wcn36xx *wcn,
 					struct ieee80211_vif *vif,
 					void *buf,
diff --git a/drivers/net/wireless/ath/wcn36xx/smd.h b/drivers/net/wireless/ath/wcn36xx/smd.h
index 2c1ed9e570bf..4e39df5589b3 100644
--- a/drivers/net/wireless/ath/wcn36xx/smd.h
+++ b/drivers/net/wireless/ath/wcn36xx/smd.h
@@ -66,7 +66,6 @@ int wcn36xx_smd_finish_scan(struct wcn36xx *wcn, enum wcn36xx_hal_sys_mode mode,
 int wcn36xx_smd_init_scan(struct wcn36xx *wcn, enum wcn36xx_hal_sys_mode mode,
 			  struct ieee80211_vif *vif);
 
-int wcn36xx_smd_update_scan_params(struct wcn36xx *wcn, u8 *channels, size_t channel_count);
 int wcn36xx_smd_start_hw_scan(struct wcn36xx *wcn, struct ieee80211_vif *vif,
 			      struct cfg80211_scan_request *req);
 int wcn36xx_smd_stop_hw_scan(struct wcn36xx *wcn);
-- 
2.49.0

