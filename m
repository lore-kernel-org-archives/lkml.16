Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B6D4216611
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 17:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738688735; cv=none; b=jAXxQdJZBvi/dwkw8TT04iFClDHMG6XpuDvbmOxKyCoD6qvz1OVl0h4IVklcYBMsynLSkDt5DCDBPeGyPyaJD32SW1BAcZQqog71T9WZ5P6/feUnnSJVn+yfn8Ci9GWEtSUHHrWIhGPlJoZl5UjyPl5LxMyomCSdEgXFaiWWpC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738688735; c=relaxed/simple;
	bh=5m9D3okHYC52yuqw3igqQ23OrYpATKiC13aUYPGPyE8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UqH+FFl8FSQlpLv59p3QXXTCZhU6GQym52NiUuDsgRBL8aXabNXVu/7vw7D30G+CXsvq9QberxP0MbUPwN5D8iN0t/WUow1FuHC31mdP1h17YLKf57BkRsfP/TEAL7Apm4Beaca5+CTrokVqzvof2JwC5X+mLU4x3NrLvolBpEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QPuIK44Y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QPuIK44Y"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5147GcjM011205
	for <linux-kernel@vger.kernel.org>; Tue, 4 Feb 2025 17:05:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OL/QcLRIJh0ky121SiQIUudqZdpTL1YzhtN9uKN3Eyw=; b=QPuIK44YH2E+/SjH
	CNBlWWhcTrMxRA6kdQoh8urr66IGa9/MiJCxswKEaxk44ecejCbSARlTDmyXfre2
	hzwcoOQskv2P1+fmNzmsyPo9KB+t6v6G1Tjv4bfTSF+8n4XztTfzni8SVd5/hsH7
	4R1TKIdS2ZPXYCnRfvJbGDBsmtdCCs30ipUaWsL/276wpej5sDBu4ZOHgfYvU674
	bZ0rX4bFWcxotevmFmZaDqQcWfFM+756r/a7YFFckN0W0H1Up546TwI0+dVoEuDd
	YFEPKZShcnig2d3J+yoh1o4Adh4eLuCz1jNedyFDh2sbJFKLI0wk9I6EJwK3++iy
	yMGeRg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44kec41bvb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 17:05:33 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2f5538a2356so10795265a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 09:05:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738688733; x=1739293533;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OL/QcLRIJh0ky121SiQIUudqZdpTL1YzhtN9uKN3Eyw=;
        b=QiSZYl4Amu9Zzp1xhhF1P9GuhDQdFT4QBzcC2gWBoKjRNH6OznllvN9b9ZZjLxOEdL
         CaZkAbNnBxbxoZnduIExKo7+atX/DMoOOm0LqP1sqv03fTarHp/IZhf2K7WzkApWfKom
         aU0fntiOy23LR4tHTA95zghlwS7IFsbP96WjsATVteFLYL0jEAiG/QYgwocJA/89I7aZ
         15v/lzBfnpcqwomKYjUwBWnYbDLpbaH8T6Zkf1KujbcKCJsI/n9IBVkqdnVHtZDyCtXE
         YVmDbpNYlDukemth/Tv+K3j2sOABbL4F2owcXTwhmppu1Uh+/yKF14jAL75GIUqa0w/D
         nEiA==
X-Forwarded-Encrypted: i=1; AJvYcCWR6AS+F5TtORHx2LpkrVCdI3rl/qyZ8isiCxum5S09OVnRzTiErLrLcxrczZayIMdUDWdBGK4avWAiC2Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YyW2YA6lbtODwSFwoFCZbRPU7yBCW4gBtflUXBcJ7iBEptlMbxk
	uQ8ECNIjo4eXCSUP1CAUJrrMpGcJ+k/gqh1livw1r1Yea2kt9DLdiaG/0qRXsdxseTq5jVpdTlb
	OGmQ/5PoD4WzFQe77RJf139/78Ass9ChDQbJ3RyyU1J8mHoxcAe6iVYQJtUpFQS4=
X-Gm-Gg: ASbGnctYdnMJsVMiDm0PPeYaPqGhjE0yfFQ05L496uvs7+9XYJDG/Za3M/mULqjeuX1
	R3zGPKs09a+XvkKEuXBckvI1SjI9Ha077HQYRb3eczL8pzywJ29h27o+l7TxwdZEHCcoM45kZnu
	BuKX8np2jDPDma6iWEGjYDJBic+x+oz1xkhlgKJOOgjULE6FNJmPZubRICzZi+RTawePtNlxsSR
	YdM5HjSaDybCxOdsLhxc5iRy/3d1UUpyx2OZXCUqKKEi+y/itL1h2eAvORJ69/MtgorWItWyE5F
	96rWm10RgDAsLyxSYS3yYkQpY7wPxB8hHLwpq18QJe6DIKqFIRYcm6uaKSbuMgbtTvMXXGIgWom
	3PfJQ+z7N2uKEcXQ4FC8bISfaSTYVaw==
X-Received: by 2002:a05:6a00:18a5:b0:72a:bcc2:eefb with SMTP id d2e1a72fcca58-72fd0bcdb58mr38129918b3a.2.1738688730765;
        Tue, 04 Feb 2025 09:05:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEMARmptt0ygx1XHCqHB2J4I02VOK37cI/VtiWUK0SRjm18Qm7birg0sl11fNhJ9zPqFGNEgA==
X-Received: by 2002:a05:6a00:18a5:b0:72a:bcc2:eefb with SMTP id d2e1a72fcca58-72fd0bcdb58mr38129749b3a.2.1738688727960;
        Tue, 04 Feb 2025 09:05:27 -0800 (PST)
Received: from hu-adisi-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe69cddbbsm10772788b3a.125.2025.02.04.09.05.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 09:05:27 -0800 (PST)
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Date: Tue, 04 Feb 2025 22:35:10 +0530
Subject: [PATCH v2 4/8] wifi: ath12k: remove redundant logic for
 initializing arvif
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-unlink_link_arvif_from_chanctx-v2-4-764fb5973c1a@oss.qualcomm.com>
References: <20250204-unlink_link_arvif_from_chanctx-v2-0-764fb5973c1a@oss.qualcomm.com>
In-Reply-To: <20250204-unlink_link_arvif_from_chanctx-v2-0-764fb5973c1a@oss.qualcomm.com>
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: Jpennwk6JbbxNiYiyVLSBnTHf0NqN1Nq
X-Proofpoint-GUID: Jpennwk6JbbxNiYiyVLSBnTHf0NqN1Nq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_08,2025-02-04_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 adultscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 mlxscore=0 spamscore=0 malwarescore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502040132

The current logic for initializing arvif is present in both the add
interface operation callback and ath12k_mac_assign_link_vif(). The former
handles deflink initialization, while the latter is responsible for other
links. This redundancy could be avoided by using a common helper function.

Hence, add a new helper ath12k_mac_init_arvif() which initializes a
given arvif.

Since synchronizing rcu is not required after adding a rcu pointer, remove
that now.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
Signed-off-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 80 +++++++++++++++++++++--------------
 1 file changed, 49 insertions(+), 31 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 7defc2b20fb61dcaec06d0e332c48a1b6cd2f5d6..5f0388002e16c38a834d6c7c6c020b7afa7044f0 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -3973,13 +3973,59 @@ static void ath12k_mac_op_link_info_changed(struct ieee80211_hw *hw,
 	ath12k_mac_bss_info_changed(ar, arvif, info, changed);
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
 static struct ath12k_link_vif *ath12k_mac_assign_link_vif(struct ath12k_hw *ah,
 							  struct ieee80211_vif *vif,
 							  u8 link_id)
 {
 	struct ath12k_vif *ahvif = ath12k_vif_to_ahvif(vif);
 	struct ath12k_link_vif *arvif;
-	int i;
 
 	lockdep_assert_wiphy(ah->hw->wiphy);
 
@@ -4006,25 +4052,8 @@ static struct ath12k_link_vif *ath12k_mac_assign_link_vif(struct ath12k_hw *ah,
 		}
 	}
 
-	arvif->ahvif = ahvif;
-	arvif->link_id = link_id;
-	ahvif->links_map |= BIT(link_id);
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
+	ath12k_mac_init_arvif(ahvif, arvif, link_id);
 
-	rcu_assign_pointer(ahvif->link[arvif->link_id], arvif);
-	ahvif->links_map |= BIT(link_id);
-	synchronize_rcu();
 	return arvif;
 }
 
@@ -8312,19 +8341,8 @@ static int ath12k_mac_op_add_interface(struct ieee80211_hw *hw,
 	ahvif->ah = ah;
 	ahvif->vif = vif;
 	arvif = &ahvif->deflink;
-	arvif->ahvif = ahvif;
-
-	INIT_LIST_HEAD(&arvif->list);
-	INIT_DELAYED_WORK(&arvif->connection_loss_work,
-			  ath12k_mac_vif_sta_connection_loss_work);
 
-	for (i = 0; i < ARRAY_SIZE(arvif->bitrate_mask.control); i++) {
-		arvif->bitrate_mask.control[i].legacy = 0xffffffff;
-		memset(arvif->bitrate_mask.control[i].ht_mcs, 0xff,
-		       sizeof(arvif->bitrate_mask.control[i].ht_mcs));
-		memset(arvif->bitrate_mask.control[i].vht_mcs, 0xff,
-		       sizeof(arvif->bitrate_mask.control[i].vht_mcs));
-	}
+	ath12k_mac_init_arvif(ahvif, arvif, -1);
 
 	/* Allocate Default Queue now and reassign during actual vdev create */
 	vif->cab_queue = ATH12K_HW_DEFAULT_QUEUE;

-- 
2.34.1

