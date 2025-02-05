Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C1F721885A
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 22:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738794707; cv=none; b=N7T3OP4rSQHiCkoQkMzNDfbYHfYHJt1E66Jvi3jIqdQ7ujR4X8yf0PLYUvKdHHp2XHdTOFY/TMFYwKrlxakCx25Yd7eHuf8S0ZVb5hawFkfXZs+5+kzJnlLrtzUgldH0PenlQRyVk7vUM57vZuLSU8RO7tMsb0zSHuEJDmFbeLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738794707; c=relaxed/simple;
	bh=itnRDaU4mqcH+w2uISCwh8hSEwNV+pzT9Z9PUs4O9oc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G5kndOo8mEE/iKIxdHfVbhrcv2gN3yAZnAB6YBA6koFjI1alJvgl0WNBdd3Ptd53+F09KgMjCDQqV4WOSAloHJk3m96AQ6QZdTxhKy+ldPQ49Owi0IfzR8n4nu0h5/O4tJuoVruOHsm6mt1HYu0U5PHOTQ4KN7WtMSyk3ri9vmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gMDYRMml; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gMDYRMml"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6f97a3a0b25so2821437b3.3
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 14:31:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738794704; x=1739399504; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yM6oM3tDD+iEas8g9LCHRstgRJi9eANW9LQ7In12n2Q=;
        b=gMDYRMmle1JsFYiRxx1LL1mTI9Ix5jakGV15lhvkVISYwfYBlLQRz8ceRzcWHHUhWS
         LFGHHAs/oZbPRIZLA87rTrHFd/XWr+KJUAxOjRzlFXfFbAjs6cU9BR8SzOsBaEkRkiSH
         jiI3CUkkaozx6N/1HTbtBmg/5ZKwNFnX3zMeSR/GK5gt1aW8CYiiIQWjzEMT1GoXF8fw
         YE7wioW5bVyOevPR6SqbDUexjIwjvy14rDgjp/T/eCBFKPhA73TqRu6vtnPRfpTTLk09
         WBqBPLjOl3ORenekj6CMS0anJTl6RgpHyuwnBe/Zga/Nsf+aJUSnVFjdFrVVxPr+tyVz
         WUHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738794704; x=1739399504;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yM6oM3tDD+iEas8g9LCHRstgRJi9eANW9LQ7In12n2Q=;
        b=fA+v8I0FX7Qs5Zw56oqb75D+DSqJYtnCVSIBH/Noqn7GU0RgZcsCEYP3SMJJAxmWZ4
         KUuFiMpKsWf9ND0wCjRq69GhPWZQ7smJLSe720uWo8YJ6ByZgcbNDiUp2oS8WKGJYXhc
         VgZeYAvP7inmw1fj0P/FWrYDZbxrGO/66TCJfZoh+bANsBYO5NhJguYMB0ciHkQBe38h
         5DsJ/NQFtlIGJKWcf2hiC2GPJMjg+BDBP6j8/rZxX3v1j1m73keqDWsSV4TxaKqfxVFi
         cFrOc1ETz0kp91fQfenNLPa1hcm4i7yqXvyGVu0Kq9PFPZ8ZgiSPxdV8QfXCRUaSVro4
         7hHg==
X-Forwarded-Encrypted: i=1; AJvYcCU9UJOfuSMEOqQOOSdFTCAWmJfxX8c3kpcRQnUJD+szyfv+KIVqxMl5cp/ndxsGtYQWUMIxgM0S7DtV9CM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKYHE2t7yKPHxT5NJd32n4uyrmo27ZSwlFI5n7HwykGm0rdLZ3
	AjbZKJ4djBXWF/AC+u7/uaLmJgYx4I/HXfoEIz/M1Hgy2uRYG1i9
X-Gm-Gg: ASbGnctvOheoW+ziVhFuIDjUO2vcdVJE+lV9qvWYSCrsMTCMqqDel23SdePBQVQSPlG
	oSRz2/0s4nD/LVNAsh0mXc4/yj8GKZ5mbw8VKRa0YBSe+wUX8De0I5rSl7JfedRoWvn86CB96G7
	tbF7u4iDkIrHJuX9VJBqzz9eBrqKzH/x4KgqjKpAp10XYcOI2klcP2WxcXjOUvay2AKZ/QYmXpI
	ko535ThRkH2vyo3r86Zj76GWpRItMQO8wM1NPaxNc/YQqu6XVBG3UzMhtuR0bSSyEZANCtQZf/G
	4SPmgaEe762wM9GZSBmT
X-Google-Smtp-Source: AGHT+IGVhie7bjQpScJjSNCgDW5Yauhh/ntjQEy+HVGytlPK+EskCbghrziYokRcTcEph6WbANdYlg==
X-Received: by 2002:a05:690c:9c0a:b0:6ef:7fc0:a378 with SMTP id 00721157ae682-6f989eb2bf2mr39956127b3.9.1738794704287;
        Wed, 05 Feb 2025 14:31:44 -0800 (PST)
Received: from DESKTOP-GL3U3CJ ([149.22.94.73])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6f8c486e652sm31746577b3.76.2025.02.05.14.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 14:31:44 -0800 (PST)
From: Ian To <onlyian4981@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ian To <onlyian4981@gmail.com>
Subject: [PATCH 2/3] staging: rtl8723bs: remove unnecessary parentheses
Date: Wed,  5 Feb 2025 14:31:36 -0800
Message-ID: <a5294f7fa8c83163471dea62ff5f1adb7e8a4c9c.1738794631.git.onlyian4981@gmail.com>
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

Reove unnecessary parentheses that are present.

Signed-off-by: Ian To <onlyian4981@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ap.c | 110 +++++++++++-------------
 1 file changed, 51 insertions(+), 59 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index b6459efd4c6f..5907ec128d30 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -323,7 +323,7 @@ void add_RATid(struct adapter *padapter, struct sta_info *psta, u8 rssi_level)
 {
 	unsigned char sta_band = 0, shortGIrate = false;
 	unsigned int tx_ra_bitmap = 0;
-	struct mlme_priv *pmlmepriv = &(padapter->mlmepriv);
+	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct wlan_bssid_ex
 		*pcur_network = (struct wlan_bssid_ex *)&pmlmepriv->cur_network.network;
 
@@ -371,9 +371,9 @@ void update_bmc_sta(struct adapter *padapter)
 	unsigned char network_type;
 	int supportRateNum = 0;
 	unsigned int tx_ra_bitmap = 0;
-	struct mlme_priv *pmlmepriv = &(padapter->mlmepriv);
-	struct mlme_ext_priv *pmlmeext = &(padapter->mlmeextpriv);
-	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
+	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
+	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
+	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 	struct wlan_bssid_ex
 		*pcur_network = (struct wlan_bssid_ex *)&pmlmepriv->cur_network.network;
 	struct sta_info *psta = rtw_get_bcmc_stainfo(padapter);
@@ -449,9 +449,9 @@ void update_bmc_sta(struct adapter *padapter)
 
 void update_sta_info_apmode(struct adapter *padapter, struct sta_info *psta)
 {
-	struct mlme_priv *pmlmepriv = &(padapter->mlmepriv);
+	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct security_priv *psecuritypriv = &padapter->securitypriv;
-	struct mlme_ext_priv *pmlmeext = &(padapter->mlmeextpriv);
+	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 	struct ht_priv *phtpriv_ap = &pmlmepriv->htpriv;
 	struct ht_priv *phtpriv_sta = &psta->htpriv;
 	u8 cur_ldpc_cap = 0, cur_stbc_cap = 0, cur_beamform_cap = 0;
@@ -561,10 +561,9 @@ void update_sta_info_apmode(struct adapter *padapter, struct sta_info *psta)
 
 static void update_ap_info(struct adapter *padapter, struct sta_info *psta)
 {
-	struct mlme_priv *pmlmepriv = &(padapter->mlmepriv);
-	struct wlan_bssid_ex
-		*pnetwork = (struct wlan_bssid_ex *)&pmlmepriv->cur_network.network;
-	struct mlme_ext_priv *pmlmeext = &(padapter->mlmeextpriv);
+	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
+	struct wlan_bssid_ex *pnetwork = (struct wlan_bssid_ex *)&pmlmepriv->cur_network.network;
+	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 	struct ht_priv *phtpriv_ap = &pmlmepriv->htpriv;
 
 	psta->wireless_mode = pmlmeext->cur_wireless_mode;
@@ -607,7 +606,7 @@ static void update_hw_ht_param(struct adapter *padapter)
 	unsigned char max_AMPDU_len;
 	unsigned char min_MPDU_spacing;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
-	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
+	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 
 	/* handle A-MPDU parameter field
 	 *
@@ -643,13 +642,12 @@ void start_bss_network(struct adapter *padapter)
 	u32 acparm;
 	int	ie_len;
 	struct registry_priv  *pregpriv = &padapter->registrypriv;
-	struct mlme_priv *pmlmepriv = &(padapter->mlmepriv);
-	struct security_priv *psecuritypriv = &(padapter->securitypriv);
-	struct wlan_bssid_ex
-		*pnetwork = (struct wlan_bssid_ex *)&pmlmepriv->cur_network.network;
-	struct mlme_ext_priv *pmlmeext = &(padapter->mlmeextpriv);
-	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
-	struct wlan_bssid_ex *pnetwork_mlmeext = &(pmlmeinfo->network);
+	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
+	struct security_priv *psecuritypriv = &padapter->securitypriv;
+	struct wlan_bssid_ex *pnetwork = (struct wlan_bssid_ex *)&pmlmepriv->cur_network.network;
+	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
+	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
+	struct wlan_bssid_ex *pnetwork_mlmeext = &pmlmeinfo->network;
 	struct HT_info_element *pht_info = NULL;
 	u8 cbw40_enable = 0;
 
@@ -821,7 +819,7 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 	u8 WMM_PARA_IE[] = {0x00, 0x50, 0xf2, 0x02, 0x01, 0x01};
 	struct registry_priv *pregistrypriv = &padapter->registrypriv;
 	struct security_priv *psecuritypriv = &padapter->securitypriv;
-	struct mlme_priv *pmlmepriv = &(padapter->mlmepriv);
+	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct wlan_bssid_ex
 		*pbss_network = (struct wlan_bssid_ex *)&pmlmepriv->cur_network.network;
 	u8 *ie = pbss_network->ies;
@@ -843,7 +841,7 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 
 	pbss_network->rssi = 0;
 
-	memcpy(pbss_network->mac_address, myid(&(padapter->eeprompriv)), ETH_ALEN);
+	memcpy(pbss_network->mac_address, myid(&padapter->eeprompriv), ETH_ALEN);
 
 	/* beacon interval */
 	p = rtw_get_beacon_interval_from_ie(ie);/* ie + 8;	8: TimeStamp, 2: Beacon Interval 2:Capability */
@@ -1184,7 +1182,7 @@ int rtw_acl_add_sta(struct adapter *padapter, u8 *addr)
 	if ((NUM_ACL - 1) < pacl_list->num)
 		return (-1);
 
-	spin_lock_bh(&(pacl_node_q->lock));
+	spin_lock_bh(&pacl_node_q->lock);
 
 	phead = get_list_head(pacl_node_q);
 	list_for_each(plist, phead) {
@@ -1198,12 +1196,12 @@ int rtw_acl_add_sta(struct adapter *padapter, u8 *addr)
 		}
 	}
 
-	spin_unlock_bh(&(pacl_node_q->lock));
+	spin_unlock_bh(&pacl_node_q->lock);
 
 	if (added)
 		return ret;
 
-	spin_lock_bh(&(pacl_node_q->lock));
+	spin_lock_bh(&pacl_node_q->lock);
 
 	for (i = 0; i < NUM_ACL; i++) {
 		paclnode = &pacl_list->aclnode[i];
@@ -1223,7 +1221,7 @@ int rtw_acl_add_sta(struct adapter *padapter, u8 *addr)
 		}
 	}
 
-	spin_unlock_bh(&(pacl_node_q->lock));
+	spin_unlock_bh(&pacl_node_q->lock);
 
 	return ret;
 }
@@ -1236,7 +1234,7 @@ void rtw_acl_remove_sta(struct adapter *padapter, u8 *addr)
 	struct wlan_acl_pool *pacl_list = &pstapriv->acl_list;
 	struct __queue	*pacl_node_q = &pacl_list->acl_node_q;
 
-	spin_lock_bh(&(pacl_node_q->lock));
+	spin_lock_bh(&pacl_node_q->lock);
 
 	phead = get_list_head(pacl_node_q);
 	list_for_each_safe(plist, tmp, phead) {
@@ -1256,8 +1254,7 @@ void rtw_acl_remove_sta(struct adapter *padapter, u8 *addr)
 		}
 	}
 
-	spin_unlock_bh(&(pacl_node_q->lock));
-
+	spin_unlock_bh(&pacl_node_q->lock);
 }
 
 u8 rtw_ap_set_pairwise_key(struct adapter *padapter, struct sta_info *psta)
@@ -1295,18 +1292,12 @@ u8 rtw_ap_set_pairwise_key(struct adapter *padapter, struct sta_info *psta)
 	return res;
 }
 
-static int rtw_ap_set_key(
-	struct adapter *padapter,
-	u8 *key,
-	u8 alg,
-	int keyid,
-	u8 set_tx
-)
+static int rtw_ap_set_key(struct adapter *padapter, u8 *key, u8 alg, int keyid, u8 set_tx)
 {
 	u8 keylen;
 	struct cmd_obj *pcmd;
 	struct setkey_parm *psetkeyparm;
-	struct cmd_priv *pcmdpriv = &(padapter->cmdpriv);
+	struct cmd_priv *pcmdpriv = &padapter->cmdpriv;
 	int res = _SUCCESS;
 
 	pcmd = rtw_zmalloc(sizeof(struct cmd_obj));
@@ -1343,7 +1334,7 @@ static int rtw_ap_set_key(
 		keylen = 16;
 	}
 
-	memcpy(&(psetkeyparm->key[0]), key, keylen);
+	memcpy(&psetkeyparm->key[0], key, keylen);
 
 	pcmd->cmdcode = _SetKey_CMD_;
 	pcmd->parmbuf = (u8 *)psetkeyparm;
@@ -1395,10 +1386,10 @@ static void update_bcn_fixed_ie(struct adapter *padapter)
 
 static void update_bcn_erpinfo_ie(struct adapter *padapter)
 {
-	struct mlme_priv *pmlmepriv = &(padapter->mlmepriv);
-	struct mlme_ext_priv *pmlmeext = &(padapter->mlmeextpriv);
-	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
-	struct wlan_bssid_ex *pnetwork = &(pmlmeinfo->network);
+	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
+	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
+	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
+	struct wlan_bssid_ex *pnetwork = &pmlmeinfo->network;
 	unsigned char *p, *ie = pnetwork->ies;
 	u32 len = 0;
 
@@ -1459,10 +1450,10 @@ static void update_bcn_wps_ie(struct adapter *padapter)
 	u8 *pbackup_remainder_ie = NULL;
 
 	uint wps_ielen = 0, wps_offset, remainder_ielen;
-	struct mlme_priv *pmlmepriv = &(padapter->mlmepriv);
-	struct mlme_ext_priv *pmlmeext = &(padapter->mlmeextpriv);
-	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
-	struct wlan_bssid_ex *pnetwork = &(pmlmeinfo->network);
+	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
+	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
+	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
+	struct wlan_bssid_ex *pnetwork = &pmlmeinfo->network;
 	unsigned char *ie = pnetwork->ies;
 	u32 ielen = pnetwork->ie_length;
 
@@ -1535,8 +1526,8 @@ void update_beacon(struct adapter *padapter, u8 ie_id, u8 *oui, u8 tx)
 	if (!padapter)
 		return;
 
-	pmlmepriv = &(padapter->mlmepriv);
-	pmlmeext = &(padapter->mlmeextpriv);
+	pmlmepriv = &padapter->mlmepriv;
+	pmlmeext = &padapter->mlmeextpriv;
 	/* pmlmeinfo = &(pmlmeext->mlmext_info); */
 
 	if (!pmlmeext->bstart_bss)
@@ -1701,8 +1692,8 @@ void associated_clients_update(struct adapter *padapter, u8 updated)
 void bss_cap_update_on_sta_join(struct adapter *padapter, struct sta_info *psta)
 {
 	u8 beacon_updated = false;
-	struct mlme_priv *pmlmepriv = &(padapter->mlmepriv);
-	struct mlme_ext_priv *pmlmeext = &(padapter->mlmeextpriv);
+	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
+	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 
 	if (!(psta->flags & WLAN_STA_SHORT_PREAMBLE)) {
 		if (!psta->no_short_preamble_set) {
@@ -1821,8 +1812,8 @@ void bss_cap_update_on_sta_join(struct adapter *padapter, struct sta_info *psta)
 u8 bss_cap_update_on_sta_leave(struct adapter *padapter, struct sta_info *psta)
 {
 	u8 beacon_updated = false;
-	struct mlme_priv *pmlmepriv = &(padapter->mlmepriv);
-	struct mlme_ext_priv *pmlmeext = &(padapter->mlmeextpriv);
+	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
+	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 
 	if (!psta)
 		return beacon_updated;
@@ -1930,7 +1921,7 @@ void rtw_sta_flush(struct adapter *padapter)
 	struct sta_info *psta = NULL;
 	struct sta_priv *pstapriv = &padapter->stapriv;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
-	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
+	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 	u8 bc_addr[ETH_ALEN] = {0xff, 0xff, 0xff, 0xff, 0xff, 0xff};
 
 	if ((pmlmeinfo->state & 0x03) != WIFI_FW_AP_STATE)
@@ -1960,7 +1951,7 @@ void rtw_sta_flush(struct adapter *padapter)
 void sta_info_update(struct adapter *padapter, struct sta_info *psta)
 {
 	int flags = psta->flags;
-	struct mlme_priv *pmlmepriv = &(padapter->mlmepriv);
+	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 
 	/* update wmm cap. */
 	if (WLAN_STA_WME & flags)
@@ -1989,7 +1980,7 @@ void sta_info_update(struct adapter *padapter, struct sta_info *psta)
 void ap_sta_info_defer_update(struct adapter *padapter, struct sta_info *psta)
 {
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
-	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
+	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 
 	if (psta->state & _FW_LINKED) {
 		pmlmeinfo->FW_sta_info[psta->mac_id].psta = psta;
@@ -1998,13 +1989,14 @@ void ap_sta_info_defer_update(struct adapter *padapter, struct sta_info *psta)
 		add_RATid(padapter, psta, 0);/* DM_RATR_STA_INIT */
 	}
 }
+
 /* restore hw setting from sw data structures */
 void rtw_ap_restore_network(struct adapter *padapter)
 {
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 	struct sta_priv *pstapriv = &padapter->stapriv;
 	struct sta_info *psta;
-	struct security_priv *psecuritypriv = &(padapter->securitypriv);
+	struct security_priv *psecuritypriv = &padapter->securitypriv;
 	struct list_head	*phead, *plist;
 	u8 chk_alive_num = 0;
 	char chk_alive_list[NUM_STA];
@@ -2070,7 +2062,7 @@ void rtw_ap_restore_network(struct adapter *padapter)
 void start_ap_mode(struct adapter *padapter)
 {
 	int i;
-	struct mlme_priv *pmlmepriv = &(padapter->mlmepriv);
+	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct sta_priv *pstapriv = &padapter->stapriv;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 	struct wlan_acl_pool *pacl_list = &pstapriv->acl_list;
@@ -2107,7 +2099,7 @@ void start_ap_mode(struct adapter *padapter)
 	pmlmepriv->p2p_probe_resp_ie = NULL;
 
 	/* for ACL */
-	INIT_LIST_HEAD(&(pacl_list->acl_node_q.queue));
+	INIT_LIST_HEAD(&pacl_list->acl_node_q.queue);
 	pacl_list->num = 0;
 	pacl_list->mode = 0;
 	for (i = 0; i < NUM_ACL; i++) {
@@ -2122,7 +2114,7 @@ void stop_ap_mode(struct adapter *padapter)
 	struct rtw_wlan_acl_node *paclnode;
 	struct sta_info *psta = NULL;
 	struct sta_priv *pstapriv = &padapter->stapriv;
-	struct mlme_priv *pmlmepriv = &(padapter->mlmepriv);
+	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 	struct wlan_acl_pool *pacl_list = &pstapriv->acl_list;
 	struct __queue	*pacl_node_q = &pacl_list->acl_node_q;
@@ -2140,7 +2132,7 @@ void stop_ap_mode(struct adapter *padapter)
 	padapter->securitypriv.ndisencryptstatus = Ndis802_11WEPDisabled;
 
 	/* for ACL */
-	spin_lock_bh(&(pacl_node_q->lock));
+	spin_lock_bh(&pacl_node_q->lock);
 	phead = get_list_head(pacl_node_q);
 	list_for_each_safe(plist, tmp, phead) {
 		paclnode = list_entry(plist, struct rtw_wlan_acl_node, list);
@@ -2153,7 +2145,7 @@ void stop_ap_mode(struct adapter *padapter)
 			pacl_list->num--;
 		}
 	}
-	spin_unlock_bh(&(pacl_node_q->lock));
+	spin_unlock_bh(&pacl_node_q->lock);
 
 	rtw_sta_flush(padapter);
 
-- 
2.45.3

