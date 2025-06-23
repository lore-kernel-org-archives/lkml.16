Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CFCF28E61E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 15:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750693776; cv=none; b=ZgBdkH+vV8W9CpMr1pTZDh2IkoyA6J2cB7QL0QqO9R8SpD739ctj2nfahcklBmwJ+TPZbdqFaP3c25fBTexftE5EgMnpj99d9Imcm2URHN2ZMM8eFRjz515BAnd3KoaisnKgtMjQfqjoX5cdpdFgIWrlocNw3jbPWG4OOs3368o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750693776; c=relaxed/simple;
	bh=P1Kl9g+5B8r4oFDD6ue0z/H2u93zVoZGBn7IH6vQ3YE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hyAoUYqd4m5bYhemQxy2d9TBUNRg88d4RxLKwfcDZ68yISTmFQ9IhghC2pqQEpQUqlm71HJOcGFxA/FTgXIE4apmhYjsl5w0Orn9ntbhwIM7C+ndHFpWUzoS9MfDjOPAXoZ+UrgjmkvucPn+s9J435SEWSDhYiLl6IOSdNsPXr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Arymc6hd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Arymc6hd"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N8LcuP005791
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 15:49:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D0xc5B1dmQMrYzjp5kHT/ahKsRBCmqQIBDX+3aVHJVI=; b=Arymc6hdDH7Ws1Y6
	D8vfc5YW+HBa2BNjO/S/nib68UG/wJSaUdtYYuDsQ7FaJCtvC5SKPP5RQl2YbOT/
	2CBxq8uspWxgCi661kkJt1tgdDUFxkAwK7mH7UrYU9mnWK6v0d4VQvWVDF2qKFcB
	DWpkWBC0PrUxsfXtXpgYrCnrHiwM9EGOK6Ia9gYDkyprbiBPYo/3hnHXfvAvFyDL
	nrmw+gsBIFiC1cmz0cYIGn3lhiOf+8i4+3//FPlNe9asM+J7IgkuzwxGdixQrw5y
	50qJQBY84g7PMpCcX8/dGg89adLugMBMZ6NuMTMh11+3PfoCxXqAwXnD6FczBOFv
	YDfjiw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f3bg998q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 15:49:32 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-23507382e64so40283705ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 08:49:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750693771; x=1751298571;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D0xc5B1dmQMrYzjp5kHT/ahKsRBCmqQIBDX+3aVHJVI=;
        b=e7URXZexererG8HO1dTzKZjlioc78O7EzevT4jIVD/P2NchWnSazOHSv2ky1VDjQlK
         4FDYdF6QgBC7xSfjHm9NEaI8DLcMwkB1cZrrYykhRVbtvbUJOzboPRYu80YJ/6mK6ni8
         pdeo6YB+gjVGc8XnDB3Mxw34Myr5FA+o38ENcxhnKzI4FD5WV3UGxzUZtXWXw5O9IPnl
         yFuP77ZeVLG4g8+JIXVf36QZO8FOND/W7zxaxZxCTIuOxdaX/VapP19GbtMCeoEmmTH4
         JTkVcegHJ98DHeAwGiauR11+LO4sJBmq/7t8RhIXN/bTk3xNnrE/f+M5nEdczgjt3aDZ
         DweA==
X-Forwarded-Encrypted: i=1; AJvYcCXH5XwcI6yBkT41qXMA8B8qiRSR9YsEoKmyaGG/O+YxWTFBu6RjZ5d5cifr6phSs4UErJuLjeXGT36QmB0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxtW5wvj08frVHnWdz6o+klPgcCbOiU/mWLCLvR5W1PFnQFlOt6
	NdOqhDIRnogJQBHfFNFNGMhoDPwzQpq/sBPN9ybItC15CVD6YL8w+5Y7qpYGNoFKabUqwDSjUJt
	eT/qcl0I72f5QOCRiQpHFd+ipC1on07FdLgmIxz+kiovHfL8hJ2eeW71YFEVxTRP7pM0=
X-Gm-Gg: ASbGnctF7iklXSRtwJgRdtUuDDiBosa8Snqh6jLsgqx4QFAsw6BAOZW5Cx2incFPsjN
	eexIdrxJwL614TEV40kfMfkZqJs01BpVXXIz0IiYyJDI/D3uN6+dq34x8Ccm7X5P9pWq99e/p/r
	mk6z8vdtGw2FcWSwXH0fso3WzeoGdWbCIpzsj9wjpn4bf7P4EiOWEnNyHkQXJomQCCZf39CHB7h
	iIqeMpI0mG7ivKSHLAD3ioVnLvGIwo0p/okq1Yf0dflHMIg/lIa8XKmxNnBIIWFbU6skvVc+oAs
	jzZDhMu+ZohW2jgQUuOOYImyqOIqoW+IqBUrkDBJl8kygRMIKs/XqZBQd+LHRGt395HEVzqb0Sl
	53GeaiZEMe/QV5IcfxL7EBMgdm9iR+gi+5neUijHpj8WTrGA=
X-Received: by 2002:a17:903:1d2:b0:234:8e78:ce8a with SMTP id d9443c01a7336-237d9bb2b45mr209283035ad.48.1750693770752;
        Mon, 23 Jun 2025 08:49:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH/6xqaX+BTZg41zs8bgt2qgojwCFHTDBY2za2TYlYnIBcnVh8Z6hoZlQZo1/2VWIvERScK3A==
X-Received: by 2002:a17:903:1d2:b0:234:8e78:ce8a with SMTP id d9443c01a7336-237d9bb2b45mr209282615ad.48.1750693770294;
        Mon, 23 Jun 2025 08:49:30 -0700 (PDT)
Received: from hu-adisi-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d83f14a2sm88447095ad.80.2025.06.23.08.49.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 08:49:30 -0700 (PDT)
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Date: Mon, 23 Jun 2025 21:19:10 +0530
Subject: [PATCH ath-next v2 2/2] wifi: ath12k: use real noise floor instead
 of default value
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250623-support_real_noise_floor-v2-2-974bbafa317e@oss.qualcomm.com>
References: <20250623-support_real_noise_floor-v2-0-974bbafa317e@oss.qualcomm.com>
In-Reply-To: <20250623-support_real_noise_floor-v2-0-974bbafa317e@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: sL8c8hM1HZy-yrDtqce5hMT6sn9WHwDv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA5NSBTYWx0ZWRfXy9V2dotC6vfC
 1t1nkdGKiQYifhhMqXSBA8BR/AuLBxjZxaInAQhxHqXW5oF4u2ek00I5ZbiclWIWLulALsPAMRY
 xLZ1pGtzeYMEBhWxQrz2e8fA6c0CAFL/P1n2tE6lsZ5xVsSosHCRZzQfuXXIIR8b/BpH3+SQnSS
 SObPziH3+2Oua26Fui+JAHIsW8mWKgTcsSObxV5U3E3z66CeBeeUs7hmmL+ZI6UnMMILmrGpGDd
 qj3IP8nGnQZoorXbESl+dYkMtF7et1saMX7K4bBnZ5AtSNvq/GSjROPTYfPmD7XxyzTrnBWMqa5
 pY6ovTCrK85fpCIv4dciADL8ekhtXDe4LsPoGF+x84VuXGbx4xYm7Aesh56HiNOU/gYVwRqNezU
 WmkrSun1wwOXH+Wgwdrz0Mt2D4MBqBUjnp1YXrvZeIpkyfc+4mISwuM0ZCXZkuompmoaQyLG
X-Authority-Analysis: v=2.4 cv=L4kdQ/T8 c=1 sm=1 tr=0 ts=6859778c cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=14mRfNIsjSzQyU8rJgwA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: sL8c8hM1HZy-yrDtqce5hMT6sn9WHwDv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-23_04,2025-06-23_06,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 mlxlogscore=999 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506230095

From: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>

ATH12K_DEFAULT_NOISE_FLOOR represents the approximate noise floor value
which is used for RSSI calculation. Commit "wifi: ath12k: handle WMI event
for real noise floor calculation" added support to get the real noise floor
value from the firmware. Add changes to use the real value now instead of
the default one.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1

Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
Co-developed-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Signed-off-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/dp_mon.c |  7 ++++++-
 drivers/net/wireless/ath/ath12k/dp_tx.c  | 20 ++++++++++++++++----
 drivers/net/wireless/ath/ath12k/mac.c    | 10 +++++++---
 drivers/net/wireless/ath/ath12k/wmi.c    |  7 ++++++-
 4 files changed, 35 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_mon.c b/drivers/net/wireless/ath/ath12k/dp_mon.c
index 91f4e3aff74c3804188af69fd9bb81103dc88175..b408103fe9d4703c44a0fde456b71bb7aaf6420c 100644
--- a/drivers/net/wireless/ath/ath12k/dp_mon.c
+++ b/drivers/net/wireless/ath/ath12k/dp_mon.c
@@ -2146,10 +2146,15 @@ static void ath12k_dp_mon_update_radiotap(struct ath12k *ar,
 					  struct ieee80211_rx_status *rxs)
 {
 	struct ieee80211_supported_band *sband;
+	s32 noise_floor;
 	u8 *ptr = NULL;
 
+	spin_lock_bh(&ar->data_lock);
+	noise_floor = ath12k_pdev_get_noise_floor(ar);
+	spin_unlock_bh(&ar->data_lock);
+
 	rxs->flag |= RX_FLAG_MACTIME_START;
-	rxs->signal = ppduinfo->rssi_comb + ATH12K_DEFAULT_NOISE_FLOOR;
+	rxs->signal = ppduinfo->rssi_comb + noise_floor;
 	rxs->nss = ppduinfo->nss + 1;
 
 	if (ppduinfo->userstats[ppduinfo->userid].ampdu_present) {
diff --git a/drivers/net/wireless/ath/ath12k/dp_tx.c b/drivers/net/wireless/ath/ath12k/dp_tx.c
index 075912eacfaab520e0ed0041b330096c830ae8a0..ca3d97043da04ceb2be5d3823e36b755b837a1ff 100644
--- a/drivers/net/wireless/ath/ath12k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_tx.c
@@ -553,6 +553,7 @@ ath12k_dp_tx_htt_tx_complete_buf(struct ath12k_base *ab,
 	struct ath12k_vif *ahvif;
 	struct ath12k *ar;
 	struct sk_buff *msdu = desc_params->skb;
+	s32 noise_floor;
 
 	skb_cb = ATH12K_SKB_CB(msdu);
 	info = IEEE80211_SKB_CB(msdu);
@@ -591,8 +592,13 @@ ath12k_dp_tx_htt_tx_complete_buf(struct ath12k_base *ab,
 			info->status.ack_signal = ts->ack_rssi;
 
 			if (!test_bit(WMI_TLV_SERVICE_HW_DB2DBM_CONVERSION_SUPPORT,
-				      ab->wmi_ab.svc_map))
-				info->status.ack_signal += ATH12K_DEFAULT_NOISE_FLOOR;
+				      ab->wmi_ab.svc_map)) {
+				spin_lock_bh(&ar->data_lock);
+				noise_floor = ath12k_pdev_get_noise_floor(ar);
+				spin_unlock_bh(&ar->data_lock);
+
+				info->status.ack_signal += noise_floor;
+			}
 
 			info->status.flags = IEEE80211_TX_STATUS_ACK_SIGNAL_VALID;
 		} else {
@@ -774,6 +780,7 @@ static void ath12k_dp_tx_complete_msdu(struct ath12k *ar,
 	struct ieee80211_vif *vif;
 	struct ath12k_vif *ahvif;
 	struct sk_buff *msdu = desc_params->skb;
+	s32 noise_floor;
 
 	if (WARN_ON_ONCE(ts->buf_rel_source != HAL_WBM_REL_SRC_MODULE_TQM)) {
 		/* Must not happen */
@@ -826,8 +833,13 @@ static void ath12k_dp_tx_complete_msdu(struct ath12k *ar,
 			info->status.ack_signal = ts->ack_rssi;
 
 			if (!test_bit(WMI_TLV_SERVICE_HW_DB2DBM_CONVERSION_SUPPORT,
-				      ab->wmi_ab.svc_map))
-				info->status.ack_signal += ATH12K_DEFAULT_NOISE_FLOOR;
+				      ab->wmi_ab.svc_map)) {
+				spin_lock_bh(&ar->data_lock);
+				noise_floor = ath12k_pdev_get_noise_floor(ar);
+				spin_unlock_bh(&ar->data_lock);
+
+				info->status.ack_signal += noise_floor;
+			}
 
 			info->status.flags = IEEE80211_TX_STATUS_ACK_SIGNAL_VALID;
 		}
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 6ee1113aafcfc0873b8e6997951c8f53f9ccbbd9..ee05e9b8f193cade74b435d1c1a71207493061cf 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -11586,8 +11586,8 @@ static void ath12k_mac_op_sta_statistics(struct ieee80211_hw *hw,
 	struct ath12k_sta *ahsta = ath12k_sta_to_ahsta(sta);
 	struct ath12k_fw_stats_req_params params = {};
 	struct ath12k_link_sta *arsta;
+	s8 signal, noise_floor;
 	struct ath12k *ar;
-	s8 signal;
 	bool db2dbm;
 
 	lockdep_assert_wiphy(hw->wiphy);
@@ -11635,15 +11635,19 @@ static void ath12k_mac_op_sta_statistics(struct ieee80211_hw *hw,
 	    !(ath12k_mac_get_fw_stats(ar, &params)))
 		signal = arsta->rssi_beacon;
 
+	spin_lock_bh(&ar->data_lock);
+	noise_floor = ath12k_pdev_get_noise_floor(ar);
+	spin_unlock_bh(&ar->data_lock);
+
 	if (signal) {
-		sinfo->signal = db2dbm ? signal : signal + ATH12K_DEFAULT_NOISE_FLOOR;
+		sinfo->signal = db2dbm ? signal : signal + noise_floor;
 		sinfo->filled |= BIT_ULL(NL80211_STA_INFO_SIGNAL);
 	}
 
 	sinfo->signal_avg = ewma_avg_rssi_read(&arsta->avg_rssi);
 
 	if (!db2dbm)
-		sinfo->signal_avg += ATH12K_DEFAULT_NOISE_FLOOR;
+		sinfo->signal_avg += noise_floor;
 
 	sinfo->filled |= BIT_ULL(NL80211_STA_INFO_SIGNAL_AVG);
 }
diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index 3ec58feab7559e3fcd1cb9891a8ebc0084264334..37ac921fb7da701a9faa6e9a93a73be5303e01fc 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -6981,6 +6981,7 @@ static void ath12k_mgmt_rx_event(struct ath12k_base *ab, struct sk_buff *skb)
 	struct ieee80211_hdr *hdr;
 	u16 fc;
 	struct ieee80211_supported_band *sband;
+	s32 noise_floor;
 
 	if (ath12k_pull_mgmt_rx_params_tlv(ab, skb, &rx_ev) != 0) {
 		ath12k_warn(ab, "failed to extract mgmt rx event");
@@ -7042,7 +7043,11 @@ static void ath12k_mgmt_rx_event(struct ath12k_base *ab, struct sk_buff *skb)
 		status->freq = ieee80211_channel_to_frequency(rx_ev.channel,
 							      status->band);
 
-	status->signal = rx_ev.snr + ATH12K_DEFAULT_NOISE_FLOOR;
+	spin_lock_bh(&ar->data_lock);
+	noise_floor = ath12k_pdev_get_noise_floor(ar);
+	spin_unlock_bh(&ar->data_lock);
+
+	status->signal = rx_ev.snr + noise_floor;
 	status->rate_idx = ath12k_mac_bitrate_to_idx(sband, rx_ev.rate / 100);
 
 	hdr = (struct ieee80211_hdr *)skb->data;

-- 
2.34.1

