Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2EB0217719
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 22:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738794706; cv=none; b=aJc8us0Mpb0Ln4Y9GsJHaT2V2cZOxJ/uBH6W14UKfp/TLDYIIv72sN8RGPX3+HNo15YphkAMMPg/qy5geEP2NUxhzTXESoFimJwCCxoFBRJxWbkpIKYd06gJKDyrtBqw5EgZrfuUCF3rUIIExriFu05rz2TZZU5aw1Ys55k6HRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738794706; c=relaxed/simple;
	bh=L/ZLQnvq8ON99QQgaYS9Ll1Ire4rLTwQz8wQU2/tYDI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kOje6kmBQKBUetl7A7Ew1Nu21CfWRZH1TSYED6PVYPUX4Z3l/GFfZyNiPqVzCjxLF6wHcO9seGveREWI/vUy6nWnOLXvw35T1UdSioHIamOnhuUCzjdsG7NEuXGm+m0p1IsdyGowqOkqOOj7Tq4ax2oPPvbISfQJ/LB5FGy12rU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V+pzF7yN; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V+pzF7yN"
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e549b0f8d57so251811276.3
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 14:31:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738794702; x=1739399502; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j1RjIz6ycpA1/mFgQBJ++DLhi2HFSy95IVVfgRuxs60=;
        b=V+pzF7yN3wdW25W7jSVt3Xy7d3ovUkjuJG2nS5yeeeUJarQvESHBlO5boLutwch0X2
         Tw9hCHcblu1JEi0ZE1QvffyG4HvzBr38C8ZdD+D3aW/HL3xSDzE2hPqEfmFA5hkNQAT1
         uBHVbjkqPpA55hkhQVUJB193kKSbjJC4ys3c3JhiPlQrIQFV6tAJFZhywGxChnCtWDfi
         0sw1HKoGvu7OCVPVKq7pOiKEHqJh0MgqbtrzBruhexNprzcqePeQEF/tcmbCsTZOrsWW
         KLeKrP1cyRyidEJbJnf6IVoT7ssrl+5rUO4hQRFkPqsd6KOWkHcHj0aWkfCfaaskvwvP
         uzPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738794702; x=1739399502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j1RjIz6ycpA1/mFgQBJ++DLhi2HFSy95IVVfgRuxs60=;
        b=oZqxWk7UCDS8zXZ+1Atd6bqzgCsfJGHQ+bdqhW+1AsQT7xXwjKSEVB+oylGntJKV1A
         qM5ZHLElHko61Tl69btB83XfQlHmUUCPuQQCeuoNTEHmzSiQA23RRAz/l+DfbZLAUZw7
         GTdfG4VmvjSfjtVTjdZLQhkOMqvw1hMWWW0bnEwYa1vWwIEpdBWduCKO6UfRKvCzNaG9
         5H2o7P7QSPVJt3uybAbVGHIxq4oRoQKeCbfRG//30RRddU5OAtysDO38AnEfG4QKGC3j
         I/bkaaKRcmttPc0S6JMv836lXnBBEEz2XZJTN104a6AfQrOiWNEYX0hiozoUhVnIOrod
         9N3A==
X-Forwarded-Encrypted: i=1; AJvYcCXy6Gz2G7q5coxJyy7dU8yw8rC4EagZoYhzxjdD08nRbTYVlmz5+Du9sbYGNSoRPyrF0W1PNesK2sdbXdY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZICW/BVLxoM65Wwr/p8dHesf/+ghAu6v83sBf9A3tLhAr7Cvv
	SWHzQtJteCcHx7MkKNMh/Qb3Psocxoqhl03jbz313J0Cj1X3cDJv
X-Gm-Gg: ASbGnctRqQuOtau6Jdxpt1hUTIkkcvV+8NiAvECfEFqKvZVJlZKmmLL/971Zss+OyG+
	ixBYkExqy71pw357YiONXeFyGEoB1GPC5h5qV+Mpxl7YexmhhsrGVx9YRHvZHdAmB0oRal3i7U3
	Tj7zxMx7O7YEWrYBZfmBqr9BbsIiHEJUexxYdHNqPM2nm6VuFoTetQx8brUmUJEyzRP11dGwdiJ
	tJvfSe1YRbopWuwPHKFwSooB+c8K4mEsX9POvi/cpyaHKUGZMSRixbfT+o/OPPc93xI1dtdQTIC
	/kvg5+UKKAhfxSYBzppp
X-Google-Smtp-Source: AGHT+IHajV+UfA/BnBC4aCVYrDuQfX7Z202gTTu2KYcXOIcV4WKNy1BMBHPooEWQbHIGlw/TVNOvKg==
X-Received: by 2002:a05:6902:240d:b0:e57:f841:949f with SMTP id 3f1490d57ef6-e5b25bb7d02mr3428272276.19.1738794702558;
        Wed, 05 Feb 2025 14:31:42 -0800 (PST)
Received: from DESKTOP-GL3U3CJ ([149.22.94.73])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e5acb3d946bsm3252790276.47.2025.02.05.14.31.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 14:31:42 -0800 (PST)
From: Ian To <onlyian4981@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ian To <onlyian4981@gmail.com>
Subject: [PATCH 1/3] staging: rtl8723bs: fix spacing and placement
Date: Wed,  5 Feb 2025 14:31:35 -0800
Message-ID: <33093feb782c8cfd14c49825197fa7f46ed965ac.1738794631.git.onlyian4981@gmail.com>
X-Mailer: git-send-email 2.45.3
In-Reply-To: <cover.1738794631.git.onlyian4981@gmail.com>
References: <cover.1738794631.git.onlyian4981@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Spacing issues were present, as well as operator placement. Reported by
checkpatch

Signed-off-by: Ian To <onlyian4981@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ap.c | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index a6dc88dd4ba1..b6459efd4c6f 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -258,10 +258,9 @@ void expire_timeout_chk(struct adapter *padapter)
 		} else {
 			/* TODO: Aging mechanism to digest frames in sleep_q to */
 			/* avoid running out of xmitframe */
-			if (psta->sleepq_len > (NR_XMITFRAME / pstapriv->asoc_list_cnt)
-				&& padapter->xmitpriv.free_xmitframe_cnt < ((
-					NR_XMITFRAME / pstapriv->asoc_list_cnt
-				) / 2)
+			if (psta->sleepq_len > (NR_XMITFRAME / pstapriv->asoc_list_cnt) &&
+			    padapter->xmitpriv.free_xmitframe_cnt <
+			    ((NR_XMITFRAME / pstapriv->asoc_list_cnt) / 2)
 			)
 				wakeup_sta_to_xmit(padapter, psta);
 		}
@@ -438,7 +437,6 @@ void update_bmc_sta(struct adapter *padapter)
 		spin_lock_bh(&psta->lock);
 		psta->state = _FW_LINKED;
 		spin_unlock_bh(&psta->lock);
-
 	}
 }
 
@@ -1497,7 +1495,7 @@ static void update_bcn_wps_ie(struct adapter *padapter)
 	wps_ielen = (uint)pwps_ie_src[1];/* to get ie data len */
 	if ((wps_offset + wps_ielen + 2 + remainder_ielen) <= MAX_IE_SZ) {
 		memcpy(pwps_ie, pwps_ie_src, wps_ielen + 2);
-		pwps_ie += (wps_ielen+2);
+		pwps_ie += (wps_ielen + 2);
 
 		if (pbackup_remainder_ie)
 			memcpy(pwps_ie, pbackup_remainder_ie, remainder_ielen);
@@ -1619,14 +1617,14 @@ static int rtw_ht_operation_update(struct adapter *padapter)
 {
 	u16 cur_op_mode, new_op_mode;
 	int op_mode_changes = 0;
-	struct mlme_priv *pmlmepriv = &(padapter->mlmepriv);
+	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct ht_priv *phtpriv_ap = &pmlmepriv->htpriv;
 
 	if (pmlmepriv->htpriv.ht_option)
 		return 0;
 
-	if (!(pmlmepriv->ht_op_mode & IEEE80211_HT_OP_MODE_NON_GF_STA_PRSNT)
-	    && pmlmepriv->num_sta_ht_no_gf) {
+	if (!(pmlmepriv->ht_op_mode & IEEE80211_HT_OP_MODE_NON_GF_STA_PRSNT) &&
+	    pmlmepriv->num_sta_ht_no_gf) {
 		pmlmepriv->ht_op_mode |=
 			IEEE80211_HT_OP_MODE_NON_GF_STA_PRSNT;
 		op_mode_changes++;
@@ -1832,8 +1830,8 @@ u8 bss_cap_update_on_sta_leave(struct adapter *padapter, struct sta_info *psta)
 	if (psta->no_short_preamble_set) {
 		psta->no_short_preamble_set = 0;
 		pmlmepriv->num_sta_no_short_preamble--;
-		if (pmlmeext->cur_wireless_mode > WIRELESS_11B
-		    && pmlmepriv->num_sta_no_short_preamble == 0){
+		if (pmlmeext->cur_wireless_mode > WIRELESS_11B &&
+		    pmlmepriv->num_sta_no_short_preamble == 0){
 			beacon_updated = true;
 			update_beacon(padapter, 0xFF, NULL, true);
 		}
@@ -1851,8 +1849,8 @@ u8 bss_cap_update_on_sta_leave(struct adapter *padapter, struct sta_info *psta)
 	if (psta->no_short_slot_time_set) {
 		psta->no_short_slot_time_set = 0;
 		pmlmepriv->num_sta_no_short_slot_time--;
-		if (pmlmeext->cur_wireless_mode > WIRELESS_11B
-		    && pmlmepriv->num_sta_no_short_slot_time == 0){
+		if (pmlmeext->cur_wireless_mode > WIRELESS_11B &&
+		    pmlmepriv->num_sta_no_short_slot_time == 0){
 			beacon_updated = true;
 			update_beacon(padapter, 0xFF, NULL, true);
 		}
-- 
2.45.3

