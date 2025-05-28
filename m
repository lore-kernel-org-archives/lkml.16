Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FD151EF363
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 03:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748403601; cv=none; b=sFROFY36eYDvDqNoeHVspGZqiP+xRN6XI0A6WhU/jkhorcoDYsLGU2SCT1JgGf9jTvuqSvs243ACoc0WNoIaxYPifpHzL/ac7P/cmgUBXllqPQ63ejQPPUz1hr5mCkqlPWygLGXdq8KGhXHSteQ6XRpT22+odrPu57hrqrfvTbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748403601; c=relaxed/simple;
	bh=Rj+NJ4PLxeaQwzs/p/v8q1RN/33Vk8zRHHo0F+tjpuQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=WMWY0qR2EhCfFHe7lnVM2YRLXvIWefbWXT725teFnpJH63g2SXNtMz+0ZZqHxf0xkO+cruEu3KrmwlDbo25SuQbkWDRbf6fLJHuIb3v39zTK6chAosSi/HhR/N/rtKlI2g/zxknAjmpbvAu8DuIl/UJgz1EHufidJFzWyx6qkbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IrVTDVCE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IrVTDVCE"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RJgbWM026404
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 03:39:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=YzVUHSb2p0HeHPQHSUuRHz
	aGFXorW4tDid+VwZ5TZNs=; b=IrVTDVCEzKS1A4LMM4koeYaoKt/deXgGHhWl8+
	LvhkeYwtNMhItZDuirNnl1dXFCa1SOYN2+qxp5tx6/SnaswNrq3VkHvIKqyYVYPd
	EECCFPbhfmffz55J0NjVSo9RjZxODpiO6QiVB9EkABiOYNsfXBWf9kqQOUJl+oXi
	qi5pgzyUNowI0w/DcsbPMeuIeWJs8eI2DgkSlS89PNw55xURq/JV2qHq4E2agGvN
	7slzDRoUMPrBfujLhJKHkcbKJiYZvLDYJquHNPYz6RYu4FF68oZsj53blxzCWn+F
	sjdpO1nAS9EnVQNkX3lOjS9WbseBtNr3CAqJATf8KHZpXS8Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u6vjry3b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 03:39:59 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2344f88f9easo22731595ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 20:39:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748403598; x=1749008398;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YzVUHSb2p0HeHPQHSUuRHzaGFXorW4tDid+VwZ5TZNs=;
        b=LD/VcmjE/LWPMfn7BnRCJOEIhxfhVoKXTdxk5B0GT4b2OizrRjP+R5bbZxk7IqCQp1
         as5YZJMXegnbcfljOVZga4/ion8sEv/f4324d2B63qHIoCLSgOGCxFHL1zqkqY2MyUg+
         4UYknhdeE39VOPzp9bXwfMY4qoFbD4p0Ua18EGnqcFFq6HIYRjqklqt53gCTyGZRGOJj
         b0H+WQvvyR5ETkRo4ZUIC85HExd5GFz80AeT3+qLShGnu5ewqalhkSWm+BgHNAN7GiLU
         Eitg+GByQugS6d8pQbkkCOxDhgUc5z1+BLNGhJTg1iw22ISai852njCbAK/m4j/jw7J9
         CCOw==
X-Forwarded-Encrypted: i=1; AJvYcCXk5QgE14XhYndTvFv9SUPJ7tqNDxe/R3omTYuIJb8eOuyn8uPewvpvqnczqH3E75tDHvksB+fDoUDIAww=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1ljK70QuxMq2y250gw58C0CsUYtSHYAMKaTyQyom3/1kpcoFf
	vexvpAsYwsZ7moBqJAm/UbOHOtxnbGdVhdmQJHsiLNsXI9x0cbZTFcZoynhmh+q9vd7ZHOSUBeq
	xJWof+oLpMc8E76t11nFoN2C2xGYMfhhU8/qkvE5gkEVIWLgj8Mhge8frRU2uzT3jiBpy148PLW
	A=
X-Gm-Gg: ASbGncs+1H+RNkzHcEo6ycndvBYTyBpczR+SNnVZ0bhuGzX4ID+fPA5VarK6qY5v13a
	BGSnvTl3yz+JM8/11dqS/ns9GX3sazoI0PGP6bCtdZCMsBa00JX2I9I2JOwbl7vkOvT6xz52CHV
	1TdSnz4H87i3+19Gm3XDtmZBvQNQ9uJgEkOlvpN+VIZ9NwHtxm5zq9phiNV5nSSiGrDsTlyiumv
	V1lvlF4K2Ues1nDa+1MX/gxzv7x1tl6252D4xI7PaQ+7dHcaCqE2Wis247m6e6TloPvqv+PKgqc
	0pQwli+e2Q/LZzT+8zT5MQHPbCgQ3ebs9XhSChasOToABA+DMkosBw6CGnMGIeeenwX5/Zd3gEr
	8wxHwwBaJa1aEzwmDXjl++5ofHPHOtf/kWIy5
X-Received: by 2002:a17:902:e889:b0:234:d292:be8f with SMTP id d9443c01a7336-234d292c1afmr12692945ad.1.1748403598236;
        Tue, 27 May 2025 20:39:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IECcmVPLrjJUXMuPS+i4A3LJln9/1Uf1Ig4fm/l6xyRdbZHO+0oazRa9hTPOu8LyBJWnfrxzg==
X-Received: by 2002:a17:902:e889:b0:234:d292:be8f with SMTP id d9443c01a7336-234d292c1afmr12692645ad.1.1748403597888;
        Tue, 27 May 2025 20:39:57 -0700 (PDT)
Received: from hu-adisi-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-234d35ac78asm1977085ad.178.2025.05.27.20.39.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 20:39:57 -0700 (PDT)
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Date: Wed, 28 May 2025 09:09:47 +0530
Subject: [PATCH wireless-next] wifi: ieee80211: add Radio Measurement
 action fields
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250528-add_rrm_action_code-v1-1-6b7c78b5bbaf@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAIOFNmgC/23NQQ6DIBAF0KsY1sUIKkpXvUfTGIGhklRpwVIb4
 91L6aYLN5P8zJ83K/LgDHh0zFbkIBhv7BQDOWRIDv10BWxUzIgWtC5qUuJeqc65sevlHKudtAq
 wokpzqBqhgaB4eXegzZLUM3oZBzfwHk+wzOgS14Pxs3Xv9DOQVPrxlO7ygWCChWirlivNGsVO1
 vv88exv0o5jHkdiA/2n2D5FvxRIaLgoWUn5DrVt2wdVxzlEFwEAAA==
X-Change-ID: 20250513-add_rrm_action_code-d2df9e47bfe1
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=UOXdHDfy c=1 sm=1 tr=0 ts=6836858f cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=3Zk8YcGt6z8hooTP5hoA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: 6d5TCj1t7wF7jbFkXDhDjbRa4ISYz3fg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDAzMSBTYWx0ZWRfX96s31RT6mDJM
 sgTnLRS8OMRhX+THICxiNrUaUZfh1Wa17ucxTmESPLzXAUz/crC9f8Bk4wq/vVEeM8dvgGBBr/w
 DctuIugx58VrMv86NfMOCRdDgSk2hgihXZJsXreuuUe+bhqFXsSe3XFXZEDz5DvJ/5/2ugIrB+k
 5jy5dtPtkBbQS45dqgekFSZmujowcIVyaRNXxztRcD+tN5TykvDc0+Inmcln4Wo24ZlQG08cTeF
 P8eKZhU8PLhaU7vu0ebpPIN87hHIKRrl52nlj2tR9O6lCSRT5d27AccYI3o8x1o5VI0A2ZFF1sk
 /1WL9nWTPwKue7XJF6HAZGdH2YD0A1yC+UbUWnMJTyfkdgYNLdiUL8FTb8SL/QY3OJ+CrlABzLx
 tMjGYfDRC7+QQ9FCZRs/0jla3QzPL1PEBTtgm0PsjOXi0B/hRMuPtoiIQUD08IhYQlDjf/yY
X-Proofpoint-GUID: 6d5TCj1t7wF7jbFkXDhDjbRa4ISYz3fg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_02,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 mlxscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 bulkscore=0 malwarescore=0 impostorscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505280031

Drivers that support Tx power insertion could examine the outgoing Radio
measurement packet and depending on the packet type, the driver can
insert specific data fields in it. These action field values will help
drivers classify the action code within the Radio Measurement action
packet.

These action fields are defined in IEEE 802.11-2024 - Table 9-470, Radio
Measurement Action field values.

Signed-off-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
---
 include/linux/ieee80211.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/linux/ieee80211.h b/include/linux/ieee80211.h
index 420c7f9aa6eea5940785418a5558f74c1b51fb8d..b3ae4ccd73013efcdb57177bd9d929d862cf66b9 100644
--- a/include/linux/ieee80211.h
+++ b/include/linux/ieee80211.h
@@ -3948,6 +3948,16 @@ enum ieee80211_s1g_actioncode {
 	WLAN_S1G_TWT_INFORMATION = 11,
 };
 
+/* Radio measurement action codes as defined in IEEE 802.11-2024 - Table 9-470 */
+enum ieee80211_radio_measurement_actioncode {
+	WLAN_RM_ACTION_RADIO_MEASUREMENT_REQUEST = 0,
+	WLAN_RM_ACTION_RADIO_MEASUREMENT_REPORT  = 1,
+	WLAN_RM_ACTION_LINK_MEASUREMENT_REQUEST  = 2,
+	WLAN_RM_ACTION_LINK_MEASUREMENT_REPORT   = 3,
+	WLAN_RM_ACTION_NEIGHBOR_REPORT_REQUEST   = 4,
+	WLAN_RM_ACTION_NEIGHBOR_REPORT_RESPONSE  = 5,
+};
+
 #define IEEE80211_WEP_IV_LEN		4
 #define IEEE80211_WEP_ICV_LEN		4
 #define IEEE80211_CCMP_HDR_LEN		8

---
base-commit: ea15e046263b19e91ffd827645ae5dfa44ebd044
change-id: 20250513-add_rrm_action_code-d2df9e47bfe1

