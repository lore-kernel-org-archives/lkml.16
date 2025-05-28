Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1351152E02
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 09:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748423965; cv=none; b=dZ+3FErucBnUN1QXzqyoM8I+poCkX4zByp3tf9O0ZZe8n+Hvko7UWNbFHV4SMMo98tUzaabck+gbMFgmtlWclhjdn8/3/5kZmBIEZRdhXjBlNB1GNt6R/XDY+E2zmdmOzti1dT3J8RQgIHS1tuwJsCBGbyB9k2koxC4Cn5k3Spw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748423965; c=relaxed/simple;
	bh=AObyPIAlkz/iEol0kDjh0nEk2Pvox4pj3DBy7SpXZ1g=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=uNeaevz3qouiYRoGxc7IQRFYLgy230hXNnaDER4IU9tWgGY1leQxuHtyblE4TaNyYs1usLAxEio4FJa29RcjDiDvZdgIKTqQiVQU2tceQSflJcyRYFkG6NuMOQ3MGjfrbij/t+3Crd9bNjVx9tpxsFQeNhd7J2FfSdWx37mbpX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RKdzr+Yg; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RKdzr+Yg"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-742c27df0daso3249466b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 02:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748423961; x=1749028761; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QN5imKHK8bvg+c1FfkOpe5yMcpVZLbQsbE6cktPXDCI=;
        b=RKdzr+YgLidcpsPEvkBH4w1KLVaT7kO1cwY7ekdA1QEag8KQgnh+ngRxkFVvwIuv8+
         FFEQbL6l4hwdZUWlnUuMdnXXJlj+7hmlQwdrqwXI+tI2kniXmspWsThOMfRhttjpZt9X
         RUGtv17Efqf6q4Sz9oLmIT5fxs2Fc8aaearTj+XImOCmExqpZ6YtcnxyDmEIXV568dgE
         8W9wya7adFfAcG1792C2Z35fs/56oHTw4qe3tTso4FB+3r3DaTObYG9qL9lXKQDHAtUe
         ahLSZ/zB9Z5cRAyKXowcYWMc7QSCRzcJ/kSTELmOEyHi3GKRQs/W0J9XqOoN6iEAsBfb
         zkEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748423961; x=1749028761;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QN5imKHK8bvg+c1FfkOpe5yMcpVZLbQsbE6cktPXDCI=;
        b=U64cmPfnOKFW1R8sfpxq8cTaBuuF+10lr+j5Zo0bkE1gZCcRu4TLTodJ8hru0xcdJ6
         c2mCAetOPOPAv8NwrYmUb1vhAHv/tVIXalmNY/sGy5VNkPMk5YtQ0HBAi/G9UCFotqPB
         1ulkXZpQxdl4mgJsFmvlXb53ORptVWSQObWtwFsZX7kLlsp004oGPgpE0bsdSQ+PXAg1
         +UmFL4AuL3z5iPRasJTMNM9w3K7QnntZhvjkcn2yPtd0ZdstiTua773wVz2hMCfCQLoU
         dfPWxzEJajDJUntn3rVFdKTXZUJjKyD4X0/rQ7rbAT/RVsG3gxQWLgo6skut33SnPBqc
         ugzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOdCs/muhnftgFZZg1275Q+HzgmMRAp5YaFKdbGMHNNNPCaZepVSQZm/2a7nPcCZMeo5U53bY6LCRL/E8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTVnAvw4S9qakCERboNhm3oHJmeXbKu2MEpcd2rpfCrPC7KnLD
	+f+wg1bpZVMwL3z3He4bvqywaL/RaYuGNWKsioP82UOkNfIBeR9J0TyO
X-Gm-Gg: ASbGncuSXONQ7Hb0RG46LlhR8QWYUAPomFbO9CnlM0OTobUO+RI/o4jTMaeaMDbj0lt
	oPGyyIOALTcSU6wEGD16MQrmNWcwOcqZ/RwWGaV22fERntLHfAmzkVKe8y/WAdt+DhRdMEJkGdF
	Q3g/fceRWTtRkLoUTaBaMzXX474/Uzie95NQ3n8xPcRDTk/6CMFZ5zhFN4+ZRFag+0baPOOfZWD
	3uUnm5cuzrfl4v5U0GoRal2BEtz2L2KwlskKG+8wR/Wm+i9uur18ttzLmgLo6vr2y9mGWfHtgEv
	nNrwK3f6/pRNU42VTLxkGCfKT3vG8826rK7xpdr851PvD2ongWRyc3OFgNOd6WNdbi7z9WFYFer
	g3irAI98wH9PH6tkFxKzdZ6M=
X-Google-Smtp-Source: AGHT+IGbdveEtu7Y+O8HQ50c+v8XrzYBayHMIbjLH7orvobtBNrjcD7mvRBPJTBfrfL8/ZvDCWvV3w==
X-Received: by 2002:a05:6a21:3992:b0:1ee:d8c8:4b82 with SMTP id adf61e73a8af0-2188c327f47mr31175262637.31.1748423961081;
        Wed, 28 May 2025 02:19:21 -0700 (PDT)
Received: from localhost.localdomain ([103.40.79.6])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2d99ed8ef9sm749598a12.69.2025.05.28.02.19.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 28 May 2025 02:19:20 -0700 (PDT)
From: Shawn Hua <shawnhuasz@gmail.com>
X-Google-Original-From: Shawn Hua <yixuanhuashawn@berkeley.edu>
To: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	dan.carpenter@linaro.org,
	pkshih@realtek.com,
	akpm@linux-foundation.org,
	yixuanhuashawn@berkeley.edu
Subject: [PATCH] staging: rtl8723bs: fix checkpatch issues in rtw_pwrctrl.c
Date: Wed, 28 May 2025 17:19:14 +0800
Message-Id: <20250528091914.2963-1-yixuanhuashawn@berkeley.edu>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patch addresses several style issues in rtw_pwrctrl.c, as reported by checkpat
ch.pl. I’ve fixed most warnings and errors, but left CamelCase and one type of CHECK unresolved.

I’m new to kernel development and submitting this for learning purposes. Please let me know if this type of patch is still helpful, or if it should be reworked or dropped.

Best regards,
Shawn Hua
-----
This patch fixes ~80 checkpatch.pl style issues, including spacing, indentation, and alignment.

Remaining issues:
- CamelCase warnings were left unchanged to avoid breaking interface consistency across related files.
- One CHECK regarding alignment with open parenthesis could not be resolved despite several attempts.

No functional changes were made.

Signed-off-by: Shawn Hua <yixuanhuashawn@berkeley.edu>
---
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c | 152 +++++++++----------
 1 file changed, 71 insertions(+), 81 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
index e67a225d4fb3..97f5792013d3 100644
--- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
+++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
@@ -8,7 +8,6 @@
 #include <hal_data.h>
 #include <linux/jiffies.h>
 
-
 void _ips_enter(struct adapter *padapter)
 {
 	struct pwrctrl_priv *pwrpriv = adapter_to_pwrctl(padapter);
@@ -30,14 +29,12 @@ void _ips_enter(struct adapter *padapter)
 		pwrpriv->rf_pwrstate = rf_off;
 	}
 	pwrpriv->bips_processing = false;
-
 }
 
 void ips_enter(struct adapter *padapter)
 {
 	struct pwrctrl_priv *pwrpriv = adapter_to_pwrctl(padapter);
 
-
 	hal_btcoex_IpsNotify(padapter, pwrpriv->ips_mode_req);
 
 	mutex_lock(&pwrpriv->lock);
@@ -56,9 +53,8 @@ int _ips_leave(struct adapter *padapter)
 		pwrpriv->ips_leave_cnts++;
 
 		result = rtw_ips_pwr_up(padapter);
-		if (result == _SUCCESS) 
+		if (result == _SUCCESS)
 			pwrpriv->rf_pwrstate = rf_on;
-		
 		pwrpriv->bips_processing = false;
 
 		pwrpriv->bkeepfwalive = false;
@@ -86,7 +82,7 @@ int ips_leave(struct adapter *padapter)
 static bool rtw_pwr_unassociated_idle(struct adapter *adapter)
 {
 	struct adapter *buddy = adapter->pbuddy_adapter;
-	struct mlme_priv *pmlmepriv = &(adapter->mlmepriv);
+	struct mlme_priv *pmlmepriv = &adapter->mlmepriv;
 	struct xmit_priv *pxmit_priv = &adapter->xmitpriv;
 
 	bool ret = false;
@@ -97,33 +93,33 @@ static bool rtw_pwr_unassociated_idle(struct adapter *adapter)
 	if (time_before(jiffies, adapter_to_pwrctl(adapter)->ips_deny_time))
 		goto exit;
 
-	if (check_fwstate(pmlmepriv, WIFI_ASOC_STATE|WIFI_SITE_MONITOR)
-		|| check_fwstate(pmlmepriv, WIFI_UNDER_LINKING|WIFI_UNDER_WPS)
-		|| check_fwstate(pmlmepriv, WIFI_AP_STATE)
-		|| check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE|WIFI_ADHOC_STATE)
+	if (check_fwstate(pmlmepriv, WIFI_ASOC_STATE | WIFI_SITE_MONITOR) ||
+	   check_fwstate(pmlmepriv, WIFI_UNDER_LINKING | WIFI_UNDER_WPS) ||
+	   check_fwstate(pmlmepriv, WIFI_AP_STATE) ||
+	   check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE | WIFI_ADHOC_STATE)
 	)
 		goto exit;
 
 	/* consider buddy, if exist */
 	if (buddy) {
-		struct mlme_priv *b_pmlmepriv = &(buddy->mlmepriv);
+		struct mlme_priv *b_pmlmepriv = &buddy->mlmepriv;
 
-		if (check_fwstate(b_pmlmepriv, WIFI_ASOC_STATE|WIFI_SITE_MONITOR)
-			|| check_fwstate(b_pmlmepriv, WIFI_UNDER_LINKING|WIFI_UNDER_WPS)
-			|| check_fwstate(b_pmlmepriv, WIFI_AP_STATE)
-			|| check_fwstate(b_pmlmepriv, WIFI_ADHOC_MASTER_STATE|WIFI_ADHOC_STATE)
+		if (check_fwstate(b_pmlmepriv, WIFI_ASOC_STATE | WIFI_SITE_MONITOR) ||
+		    check_fwstate(b_pmlmepriv, WIFI_UNDER_LINKING | WIFI_UNDER_WPS) ||
+		    check_fwstate(b_pmlmepriv, WIFI_AP_STATE) ||
+		    check_fwstate(b_pmlmepriv, WIFI_ADHOC_MASTER_STATE | WIFI_ADHOC_STATE)
 		)
 			goto exit;
 	}
 
 	if (pxmit_priv->free_xmitbuf_cnt != NR_XMITBUFF ||
-		pxmit_priv->free_xmit_extbuf_cnt != NR_XMIT_EXTBUFF) {
+	    pxmit_priv->free_xmit_extbuf_cnt != NR_XMIT_EXTBUFF) {
 		netdev_dbg(adapter->pnetdev,
 			   "There are some pkts to transmit\n");
 		netdev_dbg(adapter->pnetdev,
-			   "free_xmitbuf_cnt: %d, free_xmit_extbuf_cnt: %d\n",
-			   pxmit_priv->free_xmitbuf_cnt,
-			   pxmit_priv->free_xmit_extbuf_cnt);
+			       "free_xmitbuf_cnt: %d, free_xmit_extbuf_cnt: %d\n",
+			       pxmit_priv->free_xmitbuf_cnt,
+			       pxmit_priv->free_xmit_extbuf_cnt);
 		goto exit;
 	}
 
@@ -133,7 +129,6 @@ static bool rtw_pwr_unassociated_idle(struct adapter *adapter)
 	return ret;
 }
 
-
 /*
  * ATTENTION:
  *rtw_ps_processor() doesn't handle LPS.
@@ -164,7 +159,7 @@ void rtw_ps_processor(struct adapter *padapter)
 	if (!rtw_pwr_unassociated_idle(padapter))
 		goto exit;
 
-	if ((pwrpriv->rf_pwrstate == rf_on) && ((pwrpriv->pwr_state_check_cnts%4) == 0)) {
+	if ((pwrpriv->rf_pwrstate == rf_on) && ((pwrpriv->pwr_state_check_cnts % 4) == 0)) {
 		pwrpriv->change_rfpwrstate = rf_off;
 		{
 			ips_enter(padapter);
@@ -190,8 +185,6 @@ void traffic_check_for_leave_lps(struct adapter *padapter, u8 tx, u32 tx_packets
 	u8 bLeaveLPS = false;
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 
-
-
 	if (tx) { /* from tx */
 		xmit_cnt += tx_packets;
 
@@ -200,9 +193,9 @@ void traffic_check_for_leave_lps(struct adapter *padapter, u8 tx, u32 tx_packets
 
 		if (jiffies_to_msecs(jiffies - start_time) > 2000) { /*  2 sec == watch dog timer */
 			if (xmit_cnt > 8) {
-				if (adapter_to_pwrctl(padapter)->bLeisurePs
-				    && (adapter_to_pwrctl(padapter)->pwr_mode != PS_MODE_ACTIVE)
-				    && !(hal_btcoex_IsBtControlLps(padapter))) {
+				if (adapter_to_pwrctl(padapter)->bLeisurePs &&
+				    (adapter_to_pwrctl(padapter)->pwr_mode != PS_MODE_ACTIVE) &&
+				    !(hal_btcoex_IsBtControlLps(padapter))) {
 					bLeaveLPS = true;
 				}
 			}
@@ -213,16 +206,16 @@ void traffic_check_for_leave_lps(struct adapter *padapter, u8 tx, u32 tx_packets
 
 	} else { /*  from rx path */
 		if (pmlmepriv->LinkDetectInfo.NumRxUnicastOkInPeriod > 4/*2*/) {
-			if (adapter_to_pwrctl(padapter)->bLeisurePs
-			    && (adapter_to_pwrctl(padapter)->pwr_mode != PS_MODE_ACTIVE)
-			    && !(hal_btcoex_IsBtControlLps(padapter)))
+			if (adapter_to_pwrctl(padapter)->bLeisurePs &&
+			    (adapter_to_pwrctl(padapter)->pwr_mode != PS_MODE_ACTIVE) &&
+			    !(hal_btcoex_IsBtControlLps(padapter)))
 				bLeaveLPS = true;
 		}
 	}
 
 	if (bLeaveLPS)
 		/* rtw_lps_ctrl_wk_cmd(padapter, LPS_CTRL_LEAVE, 1); */
-		rtw_lps_ctrl_wk_cmd(padapter, LPS_CTRL_LEAVE, tx?0:1);
+		rtw_lps_ctrl_wk_cmd(padapter, LPS_CTRL_LEAVE, tx ? 0 : 1);
 }
 
 /*
@@ -246,7 +239,6 @@ void rtw_set_rpwm(struct adapter *padapter, u8 pslv)
 		if (pwrpriv->rpwm == pslv ||
 		    (pwrpriv->rpwm >= PS_STATE_S2 && pslv >= PS_STATE_S2))
 			return;
-
 	}
 
 	if ((padapter->bSurpriseRemoved) || !(padapter->hw_init_completed)) {
@@ -299,15 +291,16 @@ void rtw_set_rpwm(struct adapter *padapter, u8 pslv)
 				break;
 			}
 		} while (1);
-	} else
+	} else {
 		pwrpriv->cpwm = pslv;
+	}
 }
 
 static u8 PS_RDY_CHECK(struct adapter *padapter)
 {
 	unsigned long curr_time, delta_time;
 	struct pwrctrl_priv *pwrpriv = adapter_to_pwrctl(padapter);
-	struct mlme_priv *pmlmepriv = &(padapter->mlmepriv);
+	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 
 	if (pwrpriv->bInSuspend)
 		return false;
@@ -319,11 +312,11 @@ static u8 PS_RDY_CHECK(struct adapter *padapter)
 	if (delta_time < LPS_DELAY_TIME)
 		return false;
 
-	if (check_fwstate(pmlmepriv, WIFI_SITE_MONITOR)
-		|| check_fwstate(pmlmepriv, WIFI_UNDER_LINKING|WIFI_UNDER_WPS)
-		|| check_fwstate(pmlmepriv, WIFI_AP_STATE)
-		|| check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE|WIFI_ADHOC_STATE)
-		|| rtw_is_scan_deny(padapter)
+	if (check_fwstate(pmlmepriv, WIFI_SITE_MONITOR) ||
+	    check_fwstate(pmlmepriv, WIFI_UNDER_LINKING | WIFI_UNDER_WPS) ||
+	    check_fwstate(pmlmepriv, WIFI_AP_STATE) ||
+	    check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE | WIFI_ADHOC_STATE) ||
+	    rtw_is_scan_deny(padapter)
 	)
 		return false;
 
@@ -337,7 +330,8 @@ static u8 PS_RDY_CHECK(struct adapter *padapter)
 	return true;
 }
 
-void rtw_set_ps_mode(struct adapter *padapter, u8 ps_mode, u8 smart_ps, u8 bcn_ant_mode, const char *msg)
+void rtw_set_ps_mode(struct adapter *padapter, u8 ps_mode, u8 smart_ps,
+		     u8 bcn_ant_mode, const char *msg)
 {
 	struct pwrctrl_priv *pwrpriv = adapter_to_pwrctl(padapter);
 
@@ -348,14 +342,13 @@ void rtw_set_ps_mode(struct adapter *padapter, u8 ps_mode, u8 smart_ps, u8 bcn_a
 		if (ps_mode == PS_MODE_ACTIVE)
 			return;
 
-
 	mutex_lock(&pwrpriv->lock);
 
 	/* if (pwrpriv->pwr_mode == PS_MODE_ACTIVE) */
 	if (ps_mode == PS_MODE_ACTIVE) {
-		if (!(hal_btcoex_IsBtControlLps(padapter))
-				|| (hal_btcoex_IsBtControlLps(padapter)
-					&& !(hal_btcoex_IsLpsOn(padapter)))) {
+		if (!(hal_btcoex_IsBtControlLps(padapter)) ||
+		    (hal_btcoex_IsBtControlLps(padapter) &&
+		   !(hal_btcoex_IsLpsOn(padapter)))) {
 			pwrpriv->pwr_mode = ps_mode;
 			rtw_set_rpwm(padapter, PS_STATE_S4);
 
@@ -365,9 +358,10 @@ void rtw_set_ps_mode(struct adapter *padapter, u8 ps_mode, u8 smart_ps, u8 bcn_a
 			hal_btcoex_LpsNotify(padapter, ps_mode);
 		}
 	} else {
-		if ((PS_RDY_CHECK(padapter) && check_fwstate(&padapter->mlmepriv, WIFI_ASOC_STATE)) ||
-		    ((hal_btcoex_IsBtControlLps(padapter)) && (hal_btcoex_IsLpsOn(padapter)))
-			) {
+		if ((PS_RDY_CHECK(padapter) &&
+		    check_fwstate(&padapter->mlmepriv, WIFI_ASOC_STATE)) ||
+		   ((hal_btcoex_IsBtControlLps(padapter)) && (hal_btcoex_IsLpsOn(padapter)))
+		   ) {
 			u8 pslv;
 
 			hal_btcoex_LpsNotify(padapter, ps_mode);
@@ -410,7 +404,6 @@ s32 LPS_RF_ON_check(struct adapter *padapter, u32 delay_ms)
 	u8 bAwake = false;
 	s32 err = 0;
 
-
 	start_time = jiffies;
 	while (1) {
 		rtw_hal_get_hwreg(padapter, HW_VAR_FWLPS_RF_ON, &bAwake);
@@ -426,16 +419,16 @@ s32 LPS_RF_ON_check(struct adapter *padapter, u32 delay_ms)
 			err = -1;
 			break;
 		}
-		msleep(1);
+		msleep(20);
 	}
 
 	return err;
 }
 
-/*  */
-/* 	Description: */
-/* 		Enter the leisure power save mode. */
-/*  */
+/* */
+/* Description: */
+/* Enter the leisure power save mode. */
+/* */
 void LPS_Enter(struct adapter *padapter, const char *msg)
 {
 	struct dvobj_priv *dvobj = adapter_to_dvobj(padapter);
@@ -447,7 +440,7 @@ void LPS_Enter(struct adapter *padapter, const char *msg)
 		return;
 
 	/* Skip lps enter request if number of associated adapters is not 1 */
-	if (check_fwstate(&(dvobj->padapters->mlmepriv), WIFI_ASOC_STATE))
+	if (check_fwstate(&dvobj->padapters->mlmepriv, WIFI_ASOC_STATE))
 		n_assoc_iface++;
 	if (n_assoc_iface != 1)
 		return;
@@ -461,17 +454,19 @@ void LPS_Enter(struct adapter *padapter, const char *msg)
 			if (pwrpriv->pwr_mode == PS_MODE_ACTIVE) {
 				scnprintf(buf, sizeof(buf), "WIFI-%s", msg);
 				pwrpriv->bpower_saving = true;
-				rtw_set_ps_mode(padapter, pwrpriv->power_mgnt, padapter->registrypriv.smart_ps, 0, buf);
+				rtw_set_ps_mode(padapter, pwrpriv->power_mgnt,
+							    padapter->registrypriv.smart_ps, 0, buf);
 			}
-		} else
+		} else {
 			pwrpriv->LpsIdleCount++;
+		}
 	}
 }
 
-/*  */
-/* 	Description: */
-/* 		Leave the leisure power save mode. */
-/*  */
+/* */
+/* Description: */
+/* Leave the leisure power save mode. */
+/* */
 void LPS_Leave(struct adapter *padapter, const char *msg)
 {
 #define LPS_LEAVE_TIMEOUT_MS 100
@@ -499,7 +494,7 @@ void LPS_Leave(struct adapter *padapter, const char *msg)
 void LeaveAllPowerSaveModeDirect(struct adapter *Adapter)
 {
 	struct adapter *pri_padapter = GET_PRIMARY_ADAPTER(Adapter);
-	struct mlme_priv *pmlmepriv = &(Adapter->mlmepriv);
+	struct mlme_priv *pmlmepriv = &Adapter->mlmepriv;
 	struct pwrctrl_priv *pwrpriv = adapter_to_pwrctl(Adapter);
 
 	if (Adapter->bSurpriseRemoved)
@@ -539,7 +534,7 @@ void LeaveAllPowerSaveMode(struct adapter *Adapter)
 	if (Adapter->bSurpriseRemoved)
 		return;
 
-	if (check_fwstate(&(dvobj->padapters->mlmepriv), WIFI_ASOC_STATE))
+	if (check_fwstate(&dvobj->padapters->mlmepriv, WIFI_ASOC_STATE))
 		n_assoc_iface++;
 
 	if (n_assoc_iface) { /* connect */
@@ -549,9 +544,8 @@ void LeaveAllPowerSaveMode(struct adapter *Adapter)
 
 		LPS_Leave_check(Adapter);
 	} else {
-		if (adapter_to_pwrctl(Adapter)->rf_pwrstate == rf_off) 
+		if (adapter_to_pwrctl(Adapter)->rf_pwrstate == rf_off)
 			ips_leave(Adapter);
-		
 	}
 }
 
@@ -584,7 +578,7 @@ void LPS_Leave_check(struct adapter *padapter)
 		if (jiffies_to_msecs(jiffies - start_time) > 100)
 			break;
 
-		msleep(1);
+		msleep(20);
 	}
 }
 
@@ -619,7 +613,6 @@ void cpwm_int_hdl(struct adapter *padapter, struct reportpwrstate_parm *preportp
 
 exit:
 	mutex_unlock(&pwrpriv->lock);
-
 }
 
 static void cpwm_event_callback(struct work_struct *work)
@@ -639,7 +632,6 @@ static void rpwmtimeout_workitem_callback(struct work_struct *work)
 	struct dvobj_priv *dvobj;
 	struct pwrctrl_priv *pwrpriv;
 
-
 	pwrpriv = container_of(work, struct pwrctrl_priv, rpwmtimeoutwi);
 	dvobj = pwrctl_to_dvobj(pwrpriv);
 	padapter = dvobj->if1;
@@ -695,7 +687,6 @@ static inline void unregister_task_alive(struct pwrctrl_priv *pwrctrl, u32 tag)
 	pwrctrl->alives &= ~tag;
 }
 
-
 /*
  * Description:
  *Check if the fw_pwrstate is okay for I/O.
@@ -777,7 +768,6 @@ void rtw_unregister_task_alive(struct adapter *padapter, u32 task)
 		if (pwrctrl->cpwm > pslv)
 			if ((pslv >= PS_STATE_S2) || (pwrctrl->alives == 0))
 				rtw_set_rpwm(padapter, pslv);
-
 	}
 
 	mutex_unlock(&pwrctrl->lock);
@@ -996,7 +986,6 @@ void rtw_init_pwrctrl_priv(struct adapter *padapter)
 	pwrctrlpriv->wowlan_ap_mode = false;
 }
 
-
 void rtw_free_pwrctrl_priv(struct adapter *adapter)
 {
 }
@@ -1004,15 +993,16 @@ void rtw_free_pwrctrl_priv(struct adapter *adapter)
 inline void rtw_set_ips_deny(struct adapter *padapter, u32 ms)
 {
 	struct pwrctrl_priv *pwrpriv = adapter_to_pwrctl(padapter);
+
 	pwrpriv->ips_deny_time = jiffies + msecs_to_jiffies(ms);
 }
 
 /*
-* rtw_pwr_wakeup - Wake the NIC up from: 1)IPS. 2)USB autosuspend
-* @adapter: pointer to struct adapter structure
-* @ips_deffer_ms: the ms will prevent from falling into IPS after wakeup
-* Return _SUCCESS or _FAIL
-*/
+ * rtw_pwr_wakeup - Wake the NIC up from: 1)IPS. 2)USB autosuspend
+ * @adapter: pointer to struct adapter structure
+ * @ips_deffer_ms: the ms will prevent from falling into IPS after wakeup
+ * Return _SUCCESS or _FAIL
+ */
 
 int _rtw_pwr_wakeup(struct adapter *padapter, u32 ips_deffer_ms, const char *caller)
 {
@@ -1033,7 +1023,6 @@ int _rtw_pwr_wakeup(struct adapter *padapter, u32 ips_deffer_ms, const char *cal
 	if (time_before(pwrpriv->ips_deny_time, deny_time))
 		pwrpriv->ips_deny_time = deny_time;
 
-
 	if (pwrpriv->ps_processing)
 		while (pwrpriv->ps_processing && jiffies_to_msecs(jiffies - start) <= 3000)
 			mdelay(10);
@@ -1081,7 +1070,6 @@ int _rtw_pwr_wakeup(struct adapter *padapter, u32 ips_deffer_ms, const char *cal
 	if (time_before(pwrpriv->ips_deny_time, deny_time))
 		pwrpriv->ips_deny_time = deny_time;
 	return ret;
-
 }
 
 int rtw_pm_set_lps(struct adapter *padapter, u8 mode)
@@ -1091,18 +1079,19 @@ int rtw_pm_set_lps(struct adapter *padapter, u8 mode)
 
 	if (mode < PS_MODE_NUM) {
 		if (pwrctrlpriv->power_mgnt != mode) {
-			if (mode == PS_MODE_ACTIVE)
+			if (mode == PS_MODE_ACTIVE) {
 				LeaveAllPowerSaveMode(padapter);
-			else
+			} else {
 				pwrctrlpriv->LpsIdleCount = 2;
+			}
 
 			pwrctrlpriv->power_mgnt = mode;
 			pwrctrlpriv->bLeisurePs =
 				pwrctrlpriv->power_mgnt != PS_MODE_ACTIVE;
 		}
-	} else
+	} else {
 		ret = -EINVAL;
-
+	}
 	return ret;
 }
 
@@ -1117,8 +1106,9 @@ int rtw_pm_set_ips(struct adapter *padapter, u8 mode)
 		rtw_ips_mode_req(pwrctrlpriv, mode);
 		if ((padapter->bSurpriseRemoved == 0) && (rtw_pwr_wakeup(padapter) == _FAIL))
 			return -EFAULT;
-	} else
+	} else {
 		return -EINVAL;
+	}
 
 	return 0;
 }
-- 
2.39.5 (Apple Git-154)

