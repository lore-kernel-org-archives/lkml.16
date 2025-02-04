Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33DF3215F71
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 17:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738688736; cv=none; b=el0j5ZHGLbwg8JHt+60Wp4zNKxZi/JIQ7UGYzqqXa0fSTCfL9gOJf4g/Cp+Q44JdWShT91GejNURGk2iQDeEhODjxRcg54qoKnn+hB1SxYqEaob9pp4PDw9eF+jBp8biiU3Z0jTqyOtjYl14nFs+wJFO9CJ2NmzzLiJcY66hLbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738688736; c=relaxed/simple;
	bh=nj1MR/o86niB/+6cv7aECXNXfmddam89K/k6jiut1E0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=suxPY/X8qDHZuGDFa8mZj/naOKz8MuoRaDjpnNQd6ocL2jqsueyyml00pu9wiqD3ZxpYCERhSVVyUtLDoaAcrQ5vEHdwKFdE57LN5AuF6kZqUD8tKQ3KGw4AxHGBmpkeGfzql3a05tiKLltAMph+2mnKvLoifnmhuKLUuA03pHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f/INd/E8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f/INd/E8"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 514EWRi6016828
	for <linux-kernel@vger.kernel.org>; Tue, 4 Feb 2025 17:05:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WN5HH/8aK4QaE6vMfcOuIYz8YHDTi8XwCxrBcxjH2dE=; b=f/INd/E8o/rPhrP1
	jf9oKAxw2vaJS6NwdnTVlHhMy8gnCEGjXlWVRRtsV8ODpdJ6PTdQUIJyo6Etdkpc
	PpWi69ujlDmOF3boUtT+JfvN9u9DixUfBsryJbJh5z+XqWlqRB5dMI2wxpc164vG
	3Ds1oKebKUS2RVYylra23jB2DPNzanBbToqfen2pATw/oquUI3dC/d5AY4OhlW66
	ThdoX6THf+h49SdddNaIcUv4uHqLUdIylHfFyEXF+4dsxKgE5etWpYAGsyx+c8Cd
	SRwy2IksrSHT2fQnaNwQizHSr5QqpiJonNSJgiLipZvPRdDG/CY1e9/mm0o1cc2Z
	ku4JNA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44kmre0cm6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 17:05:34 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2f9c34c0048so2750565a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 09:05:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738688733; x=1739293533;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WN5HH/8aK4QaE6vMfcOuIYz8YHDTi8XwCxrBcxjH2dE=;
        b=iReLU7/CHA7aub9gu2sM99djGTd6mM8W+ZaPjghgTUfTJkp/i8lqculbVPs+4T1YDN
         paHWlVh4aMkOVOUSMdybVKH4mM+3gBR0NuCkp9ZC3o9Nm9PU1+J1ntyzUf1dVlGAWZqP
         ce0LwCXtAn2KzIufC8VBmfr8Wgj3HDohnNE11rTqVsF+LUkzvmw9sE6A4dwmvuWxnpzD
         g21H4BlWOCj/KfJ01TQf21ElP5hCIuEVrl+6zO08zBfYa+LyXMWZZuymFZxXQwGoKHT1
         POCtxPDHVXyLRe2hwH7GY636N+qQ1TK9vvt4zgcSpDqtYCQGUu8S5fi5OmRG25vpetOS
         eZ7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUNw5v01N1h7OTD7fZ6pMSma18xgcnDjjzo0T3awm+nfv2ouCHoxOdGTyUosYphTET6kwpfHS+DgG95VBA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLRuaY4u9HXQZfTdT/V/AUe1LWtt8VGPUxrTsGXlDbFwltpmbh
	xsR1lalRJVEpWCCbQUu7zpMbZfB89bhalEG/Vq1EWbcUqrA3t5mDYpdGPc+6exx+RGfCZIBU1Qr
	Ws7Yj57QZdRtbBny8FwYu0Ohad6485BRxjbQdRE8LhW0Ir0PLoBwNfZgtO9Ht6Qo=
X-Gm-Gg: ASbGncsZ8tQ4lbXF/eJy7D2XggdgPV/T+s2N6uHK8/Hlyk3zKKJ/0sV3rul9Kvou4sv
	Tq+ONguJ9fbmRjgPxaoiC6hHOlHqqzjJyBQgSCWAh+KWs352NVmT9dy+ZId+wOcVy+zxhTHFGao
	MIuk7vMIK6JzaRbALCNWTAMXe5pk0az2qr0XqqUktca4nHrkbeXaH1rLDwJ/DjdC2z8pIvhkJOG
	jMDAPxkhuL5U+oGgklcxgaNAkx9D2LitATabl5EOAf4AaHoxqiPE1ykyK87iE1EASudQcBK6GwM
	qyADWHVtFQGFoWVCeXlUH4oi1ASvuoGa3a66kUY54I2skgY9vw56F/3/fRHaOdDqFLh2fG/tFkH
	MXjp56g6JnsE6rIADcb3Ut1ZoAfqn3Q==
X-Received: by 2002:a05:6a00:2443:b0:71d:f4ef:6b3a with SMTP id d2e1a72fcca58-72fd0c97f99mr38907446b3a.21.1738688733347;
        Tue, 04 Feb 2025 09:05:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGV4Scox1v8cF8o5B+dd4wbuk+Xtys9zwQP72i2ppE3zrl3iSfXErz5Ui3BkGP9bHQnBFm7Qg==
X-Received: by 2002:a05:6a00:2443:b0:71d:f4ef:6b3a with SMTP id d2e1a72fcca58-72fd0c97f99mr38907379b3a.21.1738688732823;
        Tue, 04 Feb 2025 09:05:32 -0800 (PST)
Received: from hu-adisi-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe69cddbbsm10772788b3a.125.2025.02.04.09.05.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 09:05:32 -0800 (PST)
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Date: Tue, 04 Feb 2025 22:35:12 +0530
Subject: [PATCH v2 6/8] wifi: ath12k: relocate a few functions in mac.c
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-unlink_link_arvif_from_chanctx-v2-6-764fb5973c1a@oss.qualcomm.com>
References: <20250204-unlink_link_arvif_from_chanctx-v2-0-764fb5973c1a@oss.qualcomm.com>
In-Reply-To: <20250204-unlink_link_arvif_from_chanctx-v2-0-764fb5973c1a@oss.qualcomm.com>
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: yV6nIOr2eCX0JUtko21yOe2ObTkarifq
X-Proofpoint-GUID: yV6nIOr2eCX0JUtko21yOe2ObTkarifq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_08,2025-02-04_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 phishscore=0
 spamscore=0 mlxlogscore=999 bulkscore=0 priorityscore=1501 mlxscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502040132

An upcoming change will invoke ath12k_mac_init_arvif(),
ath12k_mac_assign_link_vif(), ath12k_mac_unassign_link_vif(), and
ath12k_mac_remove_link_interface() from a line located above their current
definition. Hence, relocate these functions to above so that these can be
invoked later on.

No functionality changes. Compile tested only.

Signed-off-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 250 +++++++++++++++++-----------------
 1 file changed, 125 insertions(+), 125 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index db866c1419a613103f119037b19e24b7edaa6c24..4f5bda45387ee16e1ab7a3c15a72252933f29129 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -3469,6 +3469,131 @@ static void ath12k_recalculate_mgmt_rate(struct ath12k *ar,
 		ath12k_warn(ar->ab, "failed to set beacon tx rate %d\n", ret);
 }
 
+static void ath12k_mac_init_arvif(struct ath12k_vif *ahvif,
+				  struct ath12k_link_vif *arvif, int link_id)
+{
+	struct ath12k_hw *ah = ahvif->ah;
+	u8 _link_id;
+	int i;
+
+	lockdep_assert_wiphy(ah->hw->wiphy);
+
+	if (WARN_ON(!arvif))
+		return;
+
+	if (WARN_ON(link_id >= ATH12K_NUM_MAX_LINKS))
+		return;
+
+	if (link_id < 0)
+		_link_id = 0;
+	else
+		_link_id = link_id;
+
+	arvif->ahvif = ahvif;
+	arvif->link_id = _link_id;
+
+	INIT_LIST_HEAD(&arvif->list);
+	INIT_DELAYED_WORK(&arvif->connection_loss_work,
+			  ath12k_mac_vif_sta_connection_loss_work);
+
+	for (i = 0; i < ARRAY_SIZE(arvif->bitrate_mask.control); i++) {
+		arvif->bitrate_mask.control[i].legacy = 0xffffffff;
+		memset(arvif->bitrate_mask.control[i].ht_mcs, 0xff,
+		       sizeof(arvif->bitrate_mask.control[i].ht_mcs));
+		memset(arvif->bitrate_mask.control[i].vht_mcs, 0xff,
+		       sizeof(arvif->bitrate_mask.control[i].vht_mcs));
+	}
+
+	/* Handle MLO related assignments */
+	if (link_id >= 0) {
+		rcu_assign_pointer(ahvif->link[arvif->link_id], arvif);
+		ahvif->links_map |= BIT(_link_id);
+	}
+
+	ath12k_generic_dbg(ATH12K_DBG_MAC,
+			   "mac init link arvif (link_id %d%s) for vif %pM. links_map 0x%x",
+			   _link_id, (link_id < 0) ? " deflink" : "", ahvif->vif->addr,
+			   ahvif->links_map);
+}
+
+static void ath12k_mac_remove_link_interface(struct ieee80211_hw *hw,
+					     struct ath12k_link_vif *arvif)
+{
+	struct ath12k_vif *ahvif = arvif->ahvif;
+	struct ath12k_hw *ah = hw->priv;
+	struct ath12k *ar = arvif->ar;
+	int ret;
+
+	lockdep_assert_wiphy(ah->hw->wiphy);
+
+	cancel_delayed_work_sync(&arvif->connection_loss_work);
+
+	ath12k_dbg(ar->ab, ATH12K_DBG_MAC, "mac remove link interface (vdev %d link id %d)",
+		   arvif->vdev_id, arvif->link_id);
+
+	if (ahvif->vdev_type == WMI_VDEV_TYPE_AP) {
+		ret = ath12k_peer_delete(ar, arvif->vdev_id, arvif->bssid);
+		if (ret)
+			ath12k_warn(ar->ab, "failed to submit AP self-peer removal on vdev %d link id %d: %d",
+				    arvif->vdev_id, arvif->link_id, ret);
+	}
+	ath12k_mac_vdev_delete(ar, arvif);
+}
+
+static struct ath12k_link_vif *ath12k_mac_assign_link_vif(struct ath12k_hw *ah,
+							  struct ieee80211_vif *vif,
+							  u8 link_id)
+{
+	struct ath12k_vif *ahvif = ath12k_vif_to_ahvif(vif);
+	struct ath12k_link_vif *arvif;
+
+	lockdep_assert_wiphy(ah->hw->wiphy);
+
+	arvif = wiphy_dereference(ah->hw->wiphy, ahvif->link[link_id]);
+	if (arvif)
+		return arvif;
+
+	if (!vif->valid_links) {
+		/* Use deflink for Non-ML VIFs and mark the link id as 0
+		 */
+		link_id = 0;
+		arvif = &ahvif->deflink;
+	} else {
+		/* If this is the first link arvif being created for an ML VIF
+		 * use the preallocated deflink memory except for scan arvifs
+		 */
+		if (!ahvif->links_map && link_id != ATH12K_DEFAULT_SCAN_LINK) {
+			arvif = &ahvif->deflink;
+		} else {
+			arvif = (struct ath12k_link_vif *)
+			kzalloc(sizeof(struct ath12k_link_vif), GFP_KERNEL);
+			if (!arvif)
+				return NULL;
+		}
+	}
+
+	ath12k_mac_init_arvif(ahvif, arvif, link_id);
+
+	return arvif;
+}
+
+static void ath12k_mac_unassign_link_vif(struct ath12k_link_vif *arvif)
+{
+	struct ath12k_vif *ahvif = arvif->ahvif;
+	struct ath12k_hw *ah = ahvif->ah;
+
+	lockdep_assert_wiphy(ah->hw->wiphy);
+
+	rcu_assign_pointer(ahvif->link[arvif->link_id], NULL);
+	synchronize_rcu();
+	ahvif->links_map &= ~BIT(arvif->link_id);
+
+	if (arvif != &ahvif->deflink)
+		kfree(arvif);
+	else
+		memset(arvif, 0, sizeof(*arvif));
+}
+
 static int
 ath12k_mac_op_change_vif_links(struct ieee80211_hw *hw,
 			       struct ieee80211_vif *vif,
@@ -3973,131 +4098,6 @@ static void ath12k_mac_op_link_info_changed(struct ieee80211_hw *hw,
 	ath12k_mac_bss_info_changed(ar, arvif, info, changed);
 }
 
-static void ath12k_mac_init_arvif(struct ath12k_vif *ahvif,
-				  struct ath12k_link_vif *arvif, int link_id)
-{
-	struct ath12k_hw *ah = ahvif->ah;
-	u8 _link_id;
-	int i;
-
-	lockdep_assert_wiphy(ah->hw->wiphy);
-
-	if (WARN_ON(!arvif))
-		return;
-
-	if (WARN_ON(link_id >= ATH12K_NUM_MAX_LINKS))
-		return;
-
-	if (link_id < 0)
-		_link_id = 0;
-	else
-		_link_id = link_id;
-
-	arvif->ahvif = ahvif;
-	arvif->link_id = _link_id;
-
-	INIT_LIST_HEAD(&arvif->list);
-	INIT_DELAYED_WORK(&arvif->connection_loss_work,
-			  ath12k_mac_vif_sta_connection_loss_work);
-
-	for (i = 0; i < ARRAY_SIZE(arvif->bitrate_mask.control); i++) {
-		arvif->bitrate_mask.control[i].legacy = 0xffffffff;
-		memset(arvif->bitrate_mask.control[i].ht_mcs, 0xff,
-		       sizeof(arvif->bitrate_mask.control[i].ht_mcs));
-		memset(arvif->bitrate_mask.control[i].vht_mcs, 0xff,
-		       sizeof(arvif->bitrate_mask.control[i].vht_mcs));
-	}
-
-	/* Handle MLO related assignments */
-	if (link_id >= 0) {
-		rcu_assign_pointer(ahvif->link[arvif->link_id], arvif);
-		ahvif->links_map |= BIT(_link_id);
-	}
-
-	ath12k_generic_dbg(ATH12K_DBG_MAC,
-			   "mac init link arvif (link_id %d%s) for vif %pM. links_map 0x%x",
-			   _link_id, (link_id < 0) ? " deflink" : "", ahvif->vif->addr,
-			   ahvif->links_map);
-}
-
-static struct ath12k_link_vif *ath12k_mac_assign_link_vif(struct ath12k_hw *ah,
-							  struct ieee80211_vif *vif,
-							  u8 link_id)
-{
-	struct ath12k_vif *ahvif = ath12k_vif_to_ahvif(vif);
-	struct ath12k_link_vif *arvif;
-
-	lockdep_assert_wiphy(ah->hw->wiphy);
-
-	arvif = wiphy_dereference(ah->hw->wiphy, ahvif->link[link_id]);
-	if (arvif)
-		return arvif;
-
-	if (!vif->valid_links) {
-		/* Use deflink for Non-ML VIFs and mark the link id as 0
-		 */
-		link_id = 0;
-		arvif = &ahvif->deflink;
-	} else {
-		/* If this is the first link arvif being created for an ML VIF
-		 * use the preallocated deflink memory except for scan arvifs
-		 */
-		if (!ahvif->links_map && link_id != ATH12K_DEFAULT_SCAN_LINK) {
-			arvif = &ahvif->deflink;
-		} else {
-			arvif = (struct ath12k_link_vif *)
-			kzalloc(sizeof(struct ath12k_link_vif), GFP_KERNEL);
-			if (!arvif)
-				return NULL;
-		}
-	}
-
-	ath12k_mac_init_arvif(ahvif, arvif, link_id);
-
-	return arvif;
-}
-
-static void ath12k_mac_unassign_link_vif(struct ath12k_link_vif *arvif)
-{
-	struct ath12k_vif *ahvif = arvif->ahvif;
-	struct ath12k_hw *ah = ahvif->ah;
-
-	lockdep_assert_wiphy(ah->hw->wiphy);
-
-	rcu_assign_pointer(ahvif->link[arvif->link_id], NULL);
-	synchronize_rcu();
-	ahvif->links_map &= ~BIT(arvif->link_id);
-
-	if (arvif != &ahvif->deflink)
-		kfree(arvif);
-	else
-		memset(arvif, 0, sizeof(*arvif));
-}
-
-static void ath12k_mac_remove_link_interface(struct ieee80211_hw *hw,
-					     struct ath12k_link_vif *arvif)
-{
-	struct ath12k_vif *ahvif = arvif->ahvif;
-	struct ath12k_hw *ah = hw->priv;
-	struct ath12k *ar = arvif->ar;
-	int ret;
-
-	lockdep_assert_wiphy(ah->hw->wiphy);
-
-	cancel_delayed_work_sync(&arvif->connection_loss_work);
-
-	ath12k_dbg(ar->ab, ATH12K_DBG_MAC, "mac remove link interface (vdev %d link id %d)",
-		   arvif->vdev_id, arvif->link_id);
-
-	if (ahvif->vdev_type == WMI_VDEV_TYPE_AP) {
-		ret = ath12k_peer_delete(ar, arvif->vdev_id, arvif->bssid);
-		if (ret)
-			ath12k_warn(ar->ab, "failed to submit AP self-peer removal on vdev %d link id %d: %d",
-				    arvif->vdev_id, arvif->link_id, ret);
-	}
-	ath12k_mac_vdev_delete(ar, arvif);
-}
-
 static struct ath12k*
 ath12k_mac_select_scan_device(struct ieee80211_hw *hw,
 			      struct ieee80211_vif *vif,

-- 
2.34.1

