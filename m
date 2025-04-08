Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 146D8263F4C
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 06:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744092433; cv=none; b=PA1EsDPUg60kNg73U9yRwSYdk3h315rEtOmynWTOF8nLzfKCU9eHsSzUJ+plbQCY1oJy0nVuoiNqSx8Ch++K3T6+Y2RtnKXsK/50+58q26p+IUED1sNs7311A2gDXna5K/lIB3l1/JT77QtkrInhUfp26fIfQN/DxydX30B92Iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744092433; c=relaxed/simple;
	bh=iFvBxuI8JXsz6HSNF+NVcvvqpqMG6oPrAR680qTQYXA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hy22FuZpd0QUzZ+Hw6nyswuQuw/HWAWXARO7RO+ZD+7DA8/8UNyFhG6z4zjfNW4XJtZKglRaPjIanvI0yuXNlAJiQfIihJWFmB+2950H368gGS9MYIqsKlo+0HTggSdJdqI0FYvW5wE8l8GS4lq8KIe+PaIcIy3DkwKv/xCJkmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=if4O7gDJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="if4O7gDJ"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5382GZcx020241
	for <linux-kernel@vger.kernel.org>; Tue, 8 Apr 2025 06:07:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TBNsYFDvRWgIGDQos+hDO8AQ7SgvMSnwcorWv3miZ/Q=; b=if4O7gDJWETnX+vS
	JgacxQhsi06ndsmYzIVb1jfx4hT4IhXNoBS3tAiBigfUkTNMslPdzqA83/RzxhC2
	NDw1Q2hN8M6vtKBwuD+2o/PHK/kygCKrpLvnmml3JuWVx0PvKfY/e3QGWVs57GPD
	VOA3OaJiYfKaZlcMQ/6ZfmAMZyiyofw8gLzM/pNsSCt+YdvFfqafHPD2z6wjAzwg
	WRNSyG3pKFJ2G6JMUjzJOv4jfQqO2dfXZh13Jg/q3A2zTf0JaHpLdnGA4l4xCj8V
	Ej0q8WV94zaA/hjb+zhn9bzaf4LVGXOllOZhdRgc1AgNMTiIrQTbMUDRDdt4CQt2
	Um1tLQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twd2ppam-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 06:07:10 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-736b431ee0dso4179407b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 23:07:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744092430; x=1744697230;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TBNsYFDvRWgIGDQos+hDO8AQ7SgvMSnwcorWv3miZ/Q=;
        b=r+E68bjbZiJYXXWyIUiVLVtuFu65wGr3nOMUs/J+aCvo/ucDKSq90Q3SN1VT3+7ufX
         HrgjMwNScvJBiKYNKzd0ct6+xhhN51UIE8Q3yQDIiWINIQGBa1Kp9zHc0xabMGrwhVq+
         re1WFxvViIOJc2jwY7080RYxH8E+sKuEjesmDaAPs/sVfrcovRUbt6m14ZTlAxi0s6p5
         4PNsKQSTDi+JIcT988DmmJwETgjgZ4EWXvjnEXQRlsMSvrtXUfav+GvylUrJMgbEPJKZ
         oxDhc42Vf1HKexkcjoWeu2yvbTHLxzlvyS4VwRrIGmC5qjlNCTkjGvXyJa412NWC9p+S
         DDJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUW87hAYMT3TtTgKMFhFBbFhNhoqPq9LyEVuq2l5bKCS+zPJKwKB9wPL5tAH+M6GgoUek53g3I78AYAQrk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCHIBpKlztbXxfUMgG//6vlN3onbVSYrZHsL5axK2zvmRq6uwZ
	AXNnpPSBCF5YjodnXePPxdSSEIyWAMOZl0yp20tV7oKdxi4u+jYwbeQYKM0j6gtH/V2Bv0NRH5+
	Gk7mie/3hdP8vRIa8XKj2gyKFihmtylHDITPQYdmFgRr6Qwl73+f7wyMCT5LKXQY=
X-Gm-Gg: ASbGncvyXDKZZyGIT50PLZetWUYTrV0UiZzwvD4ugSjoquAKMOftxB/G+tWTxt2gR37
	a0/Qxfp+cDvtEikyZS+x38A3CecOq9EJjkPqyXiQpkch8oulUiYMiC1JPZrzUfyCRXNoIKzTuVO
	CNSpRC9FCo/x8Bv9eoCGtsvHqFEQpRJ5mIYp/NrfGVeUn+I0YNOZmp8FUlYzwXy2f8FzT3QHUEI
	L7GJ96DGvO/rspT+5uDfQYkputOK3fJqaki86SyM51K+3RXDmTyeIDqy85+cMo2dZ8lfEhonOsl
	CZxNgYibK0KHoUbS5wIe6aWlnwW7OOyz/J3VhVs6iwAj3/mljpv51YmxV8YmGSFHk1uC3B7mVv+
	xuK07BEFX9i9Jcu3jHALJcfpJ0xHJqXDjErfWGiWE
X-Received: by 2002:a05:6a21:398a:b0:1f3:3ca3:8216 with SMTP id adf61e73a8af0-2010447b49bmr22460073637.5.1744092430029;
        Mon, 07 Apr 2025 23:07:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFnZbvQpsmy69UjkGjJMMc2V92O5njwVfVcsI9+dfavomT4AnX/sa54dA8IjoGEF2kgN6ADhg==
X-Received: by 2002:a05:6a21:398a:b0:1f3:3ca3:8216 with SMTP id adf61e73a8af0-2010447b49bmr22460036637.5.1744092429644;
        Mon, 07 Apr 2025 23:07:09 -0700 (PDT)
Received: from hu-adisi-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af9bc35079fsm6863981a12.41.2025.04.07.23.07.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 23:07:09 -0700 (PDT)
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Date: Tue, 08 Apr 2025 11:36:37 +0530
Subject: [PATCH ath-next v4 9/9] wifi: ath12k: reset MLO global memory
 during recovery
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-fix_reboot_issues_with_hw_grouping-v4-9-95e7bf048595@oss.qualcomm.com>
References: <20250408-fix_reboot_issues_with_hw_grouping-v4-0-95e7bf048595@oss.qualcomm.com>
In-Reply-To: <20250408-fix_reboot_issues_with_hw_grouping-v4-0-95e7bf048595@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        Kalle Valo <kvalo@kernel.org>, Harshitha Prem <quic_hprem@quicinc.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: MAunEVlwbi15ZNvyWQCEl6P3sjb0gKqM
X-Proofpoint-GUID: MAunEVlwbi15ZNvyWQCEl6P3sjb0gKqM
X-Authority-Analysis: v=2.4 cv=NaLm13D4 c=1 sm=1 tr=0 ts=67f4bd0f cx=c_pps a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=W2Wr2cnFbXLycozjVykA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_02,2025-04-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 clxscore=1015 phishscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080042

When operating with multiple devices grouped together, the firmware stores
data related to the state machine of each partner device in the MLO global
memory region. If the firmware crashes, it updates the state to 'crashed'.
During recovery, this memory is shared with the firmware again, and upon
detecting the 'crashed' state, it reasserts. This leads to a loop of
firmware asserts and it never recovers.

Hence to fix this issue,  once all devices in the group have been asserted
and powered down, reset the MLO global memory region.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/core.c |  3 +++
 drivers/net/wireless/ath/ath12k/qmi.c  | 22 ++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/qmi.h  |  2 ++
 3 files changed, 27 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index 55db189d82346438272c94f25b62dd0db8716efb..9b23329f1bf2a1a84f2b5dee1b67db469d3a8ce5 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -1657,6 +1657,9 @@ static void ath12k_core_reset(struct work_struct *work)
 		return;
 	}
 
+	/* Prepare MLO global memory region for power up */
+	ath12k_qmi_reset_mlo_mem(ag);
+
 	for (i = 0; i < ag->num_devices; i++) {
 		ab = ag->ab[i];
 		if (!ab)
diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
index 7df6c6eebed6855ab42519610962d2b21825d9ec..c867130f1ddc87ba3ea65d03a6fe99a06c6fe2ab 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.c
+++ b/drivers/net/wireless/ath/ath12k/qmi.c
@@ -2439,6 +2439,28 @@ int ath12k_qmi_respond_fw_mem_request(struct ath12k_base *ab)
 	return ret;
 }
 
+void ath12k_qmi_reset_mlo_mem(struct ath12k_hw_group *ag)
+{
+	struct target_mem_chunk *mlo_chunk;
+	int i;
+
+	lockdep_assert_held(&ag->mutex);
+
+	if (!ag->mlo_mem.init_done || ag->num_started)
+		return;
+
+	for (i = 0; i < ARRAY_SIZE(ag->mlo_mem.chunk); i++) {
+		mlo_chunk = &ag->mlo_mem.chunk[i];
+
+		if (mlo_chunk->v.addr)
+			/* TODO: Mode 0 recovery is the default mode hence resetting the
+			 * whole memory region for now. Once Mode 1 support is added, this
+			 * needs to be handled properly
+			 */
+			memset(mlo_chunk->v.addr, 0, mlo_chunk->size);
+	}
+}
+
 static void ath12k_qmi_free_mlo_mem_chunk(struct ath12k_base *ab,
 					  struct target_mem_chunk *chunk,
 					  int idx)
diff --git a/drivers/net/wireless/ath/ath12k/qmi.h b/drivers/net/wireless/ath/ath12k/qmi.h
index 7c44ced22c6f610fc32b1db9c073de73020d8e16..96e6c3daecfea48efc8fb65ccfddcd516ef2f3ce 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.h
+++ b/drivers/net/wireless/ath/ath12k/qmi.h
@@ -42,6 +42,7 @@
 #define ATH12K_BOARD_ID_DEFAULT	0xFF
 
 struct ath12k_base;
+struct ath12k_hw_group;
 
 enum ath12k_qmi_file_type {
 	ATH12K_QMI_FILE_TYPE_BDF_GOLDEN	= 0,
@@ -622,5 +623,6 @@ void ath12k_qmi_deinit_service(struct ath12k_base *ab);
 int ath12k_qmi_init_service(struct ath12k_base *ab);
 void ath12k_qmi_free_resource(struct ath12k_base *ab);
 void ath12k_qmi_trigger_host_cap(struct ath12k_base *ab);
+void ath12k_qmi_reset_mlo_mem(struct ath12k_hw_group *ag);
 
 #endif

-- 
2.34.1

