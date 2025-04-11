Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8319027C161
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 03:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744340708; cv=none; b=OKqHE3+xaxE7H/pi+S5wGb9bNDDSRl2FZPiEjk4XdEMZLvgIhco4VwJzYmUZz7tr3LCOaeNLbBnp10eiTurgNQGKl6S6v0Ud7v0w11MjfgYDcMI1fWO7ctJF2rZbv7WqHOUbBuyecdUs912AcbIjyGUJFErFKWzs0B1xYzJ4lns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744340708; c=relaxed/simple;
	bh=yqkUrrshGxQMM3xt8UAmdk7dsU+XQXBHuxWSKfezfa8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QUQHo03SwneV2lJ/tGY4E9vFL/2ZL9q4erWBfVyOpSOtwrdWb8KPQCp55yoWc0zqFzije6w2lpV0kaiQ4BKf6X5HhSRW0I34vNPTxXA8MJTYjWPIMvAx3JZv1YkiTmoYQv/gyJWopY1WKOWnxZECLon7lBaPifDL+DNAMBZuGCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h1hfm8oW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h1hfm8oW"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53AFoURu019634
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 03:05:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NeQx3uLyqs9WE6eGZ1STDiV37icOyW5A+kSz0CQyn1Q=; b=h1hfm8oW0bY8ZhOp
	Lzjq8PStgg9ygzN7KP43vPaSn0zlTsv6Ha+duW9QsKAbiJx1oHFTzFLLnCsFb00z
	jQvA1yAUj7xNmeiVSp1bkjg8F6egbLmqh5+sWIhewwSEm0Xui7lYhr14CvPZUu5Z
	FWu5B4eI4+JlvdmMW1m6IqW94mAuFOrwXK771rEGE2TZJiA8Yd8U6rcXEJZYxHCv
	a99JYey+YQZq5MgdFqEWkq3jpID/6c8zHC1nBR0r7C1kLPSD5RgFu+xLuozztneR
	MH1HAUn4V0Ro063lGCBz08MT79VXZhkPRnwZ0jjsy5gZg+Ne2VqSXa+61Ed7ADKa
	giFbtA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twcrs4as-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 03:05:04 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-af5b9f0e075so621435a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 20:05:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744340703; x=1744945503;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NeQx3uLyqs9WE6eGZ1STDiV37icOyW5A+kSz0CQyn1Q=;
        b=Zoh4cQPZ7yD9RKtJ4/RvbkA0O5HNwihiOVHpqTOXNkTj9sj1+NfBL7YYnFot9h5gkK
         IA1/ZGjWmACON6b1VqxURtQ1FOYpcPsmjmhaM+xx9K3HT5bh0y4juQt56D2VNg4Z7bCW
         8ItWlG5cx/alluGFsu4qxkiR0mtRD/ST+6qESGyEZnkDos5uqCGJdEMGIA6avSiM5a5d
         iihfzQJJSUBARGlF2R0Hy3cSbm+suTWK+XcJcfsuW59Lz8TRVdGcpK5GVvd6pfPFKO5k
         7VL4T/Xa/rhw8ce0Wni5XowlqnSdIQqoFeC3caREj1QjoHe9k1VVAqE4B4euyVQnUBgJ
         e4pQ==
X-Forwarded-Encrypted: i=1; AJvYcCXbymKhTURdXf6EGVbPP9YR6NcPDT4PEHiQsv+VeYKTVk965kmkOfUoMn+8TgHEWX7b06wpt5erncx2PJw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/CjdxcYACfyPUviErL6HvNLDOjpsPCKmMm7xkGevZDE153k+F
	6e5pvlnQ9GUdCh+SdjmaJBvVNxxkDw6lbNtiNg8MRcrdkp7w60ly2K6Cen681Vv5MCmZEcKmlFV
	LcYBL6ZvuBgfZ9Ez5Ik67KfyKXTY+uyAUeC7mh80twPwYNSVaXJiLZaDaKjB1HfI=
X-Gm-Gg: ASbGncva3LqWUIjcKigEsSRO/xBLu28MyJKpjrZ6Ac3N2xv9N1OXCKSwg3iaGW5vBYc
	ZMqmWzWKrCZ/vdDOXAutKkCzeithh0Kx5W1gf6LbUt8KO2Urqyl0r1p41cLStc/nUZxir06uSqH
	MEUXKJEox5C4wJZ1lPyH2r+zXsMy47VtPBkbOu4VOfFwjj0KCil8p1MaA1BPYLzSb/mEUoR1JE7
	gdL8+Ge47NTH7O8aZxZtU4CTzqojjQ//d3VjfAGnZmm1KDN0D4I5N2VanRRZlh7k3HyrXQK4AAB
	iZo/Hx4yszeiSJlQRHYUHBYqhoijMP2YkFKdI14brMt7/ud43zTeQkuKg+RfjnbHl2nYwpa44xA
	corg6QJMXVPnktKL8jeUzu5rwrIhNF2aIaMpe
X-Received: by 2002:a17:902:e886:b0:223:58ff:c722 with SMTP id d9443c01a7336-22bea4bd841mr18742325ad.28.1744340702876;
        Thu, 10 Apr 2025 20:05:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFi1w9hqm7k0eeSxhd4/OeOCeNVskfPOWILNkPCEyraSrbb2rPO6sHpmLchCsf4OlCODFPSOw==
X-Received: by 2002:a17:902:e886:b0:223:58ff:c722 with SMTP id d9443c01a7336-22bea4bd841mr18741985ad.28.1744340702468;
        Thu, 10 Apr 2025 20:05:02 -0700 (PDT)
Received: from hu-adisi-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7ccca88sm38425205ad.256.2025.04.10.20.05.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 20:05:02 -0700 (PDT)
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Date: Fri, 11 Apr 2025 08:34:50 +0530
Subject: [PATCH ath-next 1/2] wifi: ath12k: handle scan link during vdev
 create
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250411-fix_scan_vdev_handling-v1-1-07d8b4a5d19d@oss.qualcomm.com>
References: <20250411-fix_scan_vdev_handling-v1-0-07d8b4a5d19d@oss.qualcomm.com>
In-Reply-To: <20250411-fix_scan_vdev_handling-v1-0-07d8b4a5d19d@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: aufmezAb8ZSKmoqJpPlLNFNBjOlTLgTF
X-Authority-Analysis: v=2.4 cv=QuVe3Uyd c=1 sm=1 tr=0 ts=67f886e0 cx=c_pps a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=dhThNb0MqnHfOkfGsx8A:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: aufmezAb8ZSKmoqJpPlLNFNBjOlTLgTF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_01,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 spamscore=0 malwarescore=0 mlxlogscore=992 bulkscore=0 priorityscore=1501
 clxscore=1015 phishscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110021

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

