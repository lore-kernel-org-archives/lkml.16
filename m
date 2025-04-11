Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC0C61E5711
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 03:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744341434; cv=none; b=qy8YSfrGP2u2QupfWc8goOyxV8kl4oj5Y/FdpedU2RVn5ckciv6OXjmthUVYhLB7IlDLcrz3TaLNs35aNeH7RgM+tiae5qm+x7vNo0x228aIxTel2/HSent4ZTYQU0QyAsjmVJ0dmegy8JPFmwo8DKYujN3A8UhQRLUOCvGmqAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744341434; c=relaxed/simple;
	bh=yqkUrrshGxQMM3xt8UAmdk7dsU+XQXBHuxWSKfezfa8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GkDBmVdlVYf3uQBBLGLbcTpssdcVAxrNi/1qUeLbIwpYWIjaUDmqGFdoCTKnvXyaZHH71IOLIjOntcbbvlZvAAajTlkP8hR8HnOXxGmLc2+aeoDM9vvuRoLHE0+NUwmQGQ+oPNybEfQm5W6UrkkRvpTHGkX2bMsE0BNedPHAwnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LZrxuX0m; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LZrxuX0m"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53AH7wU2030632
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 03:17:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NeQx3uLyqs9WE6eGZ1STDiV37icOyW5A+kSz0CQyn1Q=; b=LZrxuX0mkrT66RKY
	euntjvxIJFfvllFzOP9S9odHEBTcYmSKl3IMWFLkrMQIytrMwA9PzYP7knYNuicu
	vW89eVGbPnxQDA1qMIRNFeyyAdjjLYVtesrU2tOOyYN2AOBt5dqFZrGkM8o7QeHH
	WRA1o9lFi5EnIG2gACP1IKdbeSiXNj6ieKsgRMYC2gQjLAv2ZMnDoP2WKAat03bW
	PXF8xFanaJbBzrzZE7Kjc+yLJ316PTI3WAtXyxi1a5NVT5zRAFgAwFIOEHAJtAPM
	H1lY91IrialsGjRvQ4MmHepvSPejsVp2nOjX9UL2lmUUBUp+2fKpBuHd0I80qAiw
	EjP1gA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twftrsn5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 03:17:11 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-736b5f9279cso1350618b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 20:17:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744341430; x=1744946230;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NeQx3uLyqs9WE6eGZ1STDiV37icOyW5A+kSz0CQyn1Q=;
        b=ExbNAtLbmYIkwXFCTL4jvmzHLuDV0ass2/FcrFkKctnl56L5d6pPIaIFsjSh0pmwNh
         4Q5enKRDn7g9/Ask8Aqqi/yURZYdc2DSQ+x0murl4QnCAME/bQ6vMLYIY+zQtokiHi80
         x70KV3/2WQxyGIVuLOLu4xm+m4pDfOqxr+TJXfuDXPlWPglcyOtJuocu8Fw45UTRFJXb
         VjeVgrcBsy5r/WG/ih6+MQ5lnuSi4hIYiRj+gqVVHgm5Md6/7KDKzowxX/AQf1QTuRkQ
         BABtc4HZnty4kJ1fOEzpb4HYfsPoNk4pN/l4hQafAqCsrbLl2Q57y4uG2HyCWI5/2hEg
         zaBg==
X-Forwarded-Encrypted: i=1; AJvYcCVWGw3av+tzPHyGdOBIbIVmrmtCqQ62uix+2MlsaLU+7IbP6Q5Ah3EwuNQDox89ODuwK8DvuuheXOg1h0c=@vger.kernel.org
X-Gm-Message-State: AOJu0YwU184rNlZndDgVuEVQ8Q4Mr0lWmbyxSTCSZ0VZBGu8bgJMbaqq
	pEqFCVunWl/C4xZBQ9NKLBv1Nk5tw3YRZP08m+q1hhFpHZwQj4EK9HGy5OILxmV37UB7LaQOh7q
	ZOe+8T0F5xiBbk7G9SpSXgLy/X/KkGgHajVl8aDj5Z73TNkI0Tm5B3qtX0slFd1Q=
X-Gm-Gg: ASbGncvMnnpXzpT603N+V7pB9hFKF5EqFAqRMRnUeUpKCoqXt0Qwj48jk74A/ovH4wu
	GE0rLhFYQFPdzzXJO6zNKd/z+c2VLv1qhs3ZHVTxBNjXTMoRvrEVLrO9oPDHLsRVJxVs0JXCU2a
	btprTvFUxBSs8t5LXHaQRdTfEXdd4+jGRa5z9EVjHMvBni20Jru2sLJ1mUhcNCot8ZsDOaaxO1V
	SmM9LC6IKI7iGHZAam+fcjUj1MKFfVN+mmjk6d8Ici0SnZlvXwsAja7JN6nSPcImm0PEZCDPQ9Y
	+saTk6fkHyGQKrEOxbiWUMmjFYHk4bhuAFBtCWA7M3ngJIPSNTrr1Cx0Ac4G7qfMv46AkCPxkpF
	iYGpoqcF0/F0BgSCkHPKODeDmUsRAW1hRssDc
X-Received: by 2002:a05:6a00:3d46:b0:736:3449:f8ee with SMTP id d2e1a72fcca58-73bd1193f28mr1737613b3a.4.1744341430373;
        Thu, 10 Apr 2025 20:17:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFi0HzPvSIWm/WQrPo31ro0odwbR+LeVRbT3dzfT6QZHjgcjYc627VQX6jONmjKszmxKzGiow==
X-Received: by 2002:a05:6a00:3d46:b0:736:3449:f8ee with SMTP id d2e1a72fcca58-73bd1193f28mr1737571b3a.4.1744341429839;
        Thu, 10 Apr 2025 20:17:09 -0700 (PDT)
Received: from hu-adisi-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd230da35sm375964b3a.131.2025.04.10.20.17.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 20:17:09 -0700 (PDT)
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Date: Fri, 11 Apr 2025 08:46:51 +0530
Subject: [PATCH ath-next v2 1/2] wifi: ath12k: handle scan link during vdev
 create
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250411-fix_scan_vdev_handling-v2-1-b6740896c144@oss.qualcomm.com>
References: <20250411-fix_scan_vdev_handling-v2-0-b6740896c144@oss.qualcomm.com>
In-Reply-To: <20250411-fix_scan_vdev_handling-v2-0-b6740896c144@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=B5+50PtM c=1 sm=1 tr=0 ts=67f889b7 cx=c_pps a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=dhThNb0MqnHfOkfGsx8A:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: HlA0S41n5NkUXtrkg0vL-4eJvVSTeitu
X-Proofpoint-ORIG-GUID: HlA0S41n5NkUXtrkg0vL-4eJvVSTeitu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_01,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=992
 suspectscore=0 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 lowpriorityscore=0
 mlxscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110023

For scanning purposes, the driver can use link ID 15 (scan link). A future
change will make non-ML interfaces to select the scan link. In this
scenario, arvif->link_id will be used to retrieve the link configuration in
ath12k_mac_vdev_create(). However, link ID 15 is not recognized as a valid
link ID in the upper kernel, which will result in a failure to fetch
link_conf and subsequently cause the scan to fail.

To avoid this issue, ensure link_conf is fetched only when the link ID is
within the valid range. Since link_conf cannot be retrieved using the scan
link, use vif->addr as the Ethernet address for creating the scan vdev.
This address will serve as the source address (address 2) in the probe
request frames during scanning. Additionally, use the automatic Tx power
value for the vdev. As this is a scan vdev, these values do not affect the
scan functionality.

Note that vif->addr will only be taken when a valid link_conf can not be
fetched. Otherwise, link_conf's address will be taken as address 2.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 33 ++++++++++++++++++---------------
 1 file changed, 18 insertions(+), 15 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 2b6bdc3d2b11a8a5f5733352826c724c671fd49a..4b3469380fb46a629fad7a9a40a44e761ef33fa5 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -8262,7 +8262,7 @@ int ath12k_mac_vdev_create(struct ath12k *ar, struct ath12k_link_vif *arvif)
 	struct ieee80211_vif *vif = ath12k_ahvif_to_vif(ahvif);
 	struct ath12k_wmi_vdev_create_arg vdev_arg = {0};
 	struct ath12k_wmi_peer_create_arg peer_param = {0};
-	struct ieee80211_bss_conf *link_conf;
+	struct ieee80211_bss_conf *link_conf = NULL;
 	u32 param_id, param_value;
 	u16 nss;
 	int i;
@@ -8277,22 +8277,21 @@ int ath12k_mac_vdev_create(struct ath12k *ar, struct ath12k_link_vif *arvif)
 	if (vif->type == NL80211_IFTYPE_MONITOR && ar->monitor_vdev_created)
 		return -EINVAL;
 
-	/* If no link is active and scan vdev is requested
-	 * use a default link conf for scan address purpose.
-	 */
-	if (arvif->link_id == ATH12K_DEFAULT_SCAN_LINK && vif->valid_links)
-		link_id = ffs(vif->valid_links) - 1;
-	else
-		link_id = arvif->link_id;
+	link_id = arvif->link_id;
 
-	link_conf = wiphy_dereference(hw->wiphy, vif->link_conf[link_id]);
-	if (!link_conf) {
-		ath12k_warn(ar->ab, "unable to access bss link conf in vdev create for vif %pM link %u\n",
-			    vif->addr, arvif->link_id);
-		return -ENOLINK;
+	if (link_id < IEEE80211_MLD_MAX_NUM_LINKS) {
+		link_conf = wiphy_dereference(hw->wiphy, vif->link_conf[link_id]);
+		if (!link_conf) {
+			ath12k_warn(ar->ab, "unable to access bss link conf in vdev create for vif %pM link %u\n",
+				    vif->addr, arvif->link_id);
+			return -ENOLINK;
+		}
 	}
 
-	memcpy(arvif->bssid, link_conf->addr, ETH_ALEN);
+	if (link_conf)
+		memcpy(arvif->bssid, link_conf->addr, ETH_ALEN);
+	else
+		memcpy(arvif->bssid, vif->addr, ETH_ALEN);
 
 	arvif->ar = ar;
 	vdev_id = __ffs64(ab->free_vdev_map);
@@ -8447,7 +8446,11 @@ int ath12k_mac_vdev_create(struct ath12k *ar, struct ath12k_link_vif *arvif)
 		break;
 	}
 
-	arvif->txpower = link_conf->txpower;
+	if (link_conf)
+		arvif->txpower = link_conf->txpower;
+	else
+		arvif->txpower = NL80211_TX_POWER_AUTOMATIC;
+
 	ret = ath12k_mac_txpower_recalc(ar);
 	if (ret)
 		goto err_peer_del;

-- 
2.34.1

