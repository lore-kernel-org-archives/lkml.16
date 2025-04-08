Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 972CB263F46
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 06:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744092432; cv=none; b=CBWfbfrmaIlOZlREgS9EvWw2KhkfhutJV6moCG250LBI1eKXdeeJjR0D0UCOdvc+e3EnqC7nUJTz2F6A9ibdIU4Sj6uDuHpvVau+LLO9lrBFgigTuZ/f+3Dtzc30g4zRVKpK/YiBR6MBlFECxRKkhw/r8dqpEqgPqRhHWY5jQiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744092432; c=relaxed/simple;
	bh=SD7Xq6PJnyE6Dco8m8zhabJvgDfWZfqJu+X+VlTeIp0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LIwUMG8dsDRcUHWh2OhMjiLWzuvLwUIbKyU57rD8yRE801ISQ8nIMnN0KvjDqwYueJX/3eh9zqUlYNT6qnUXv5qVtq1sz9m0t8ZG4gYQWKpZSx7Ovczzj8tf/YHJ+xcKyvfOjhxtMecvcP3MIuTP3YBv9PI0QWu3kixmrIu7n0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DsNBpDpH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DsNBpDpH"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5382GP1W019664
	for <linux-kernel@vger.kernel.org>; Tue, 8 Apr 2025 06:07:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LIxkWENj/q2hTkMwvmODIhHwoW25U8wZdObE/3hO0NI=; b=DsNBpDpHYogO5ivX
	rtKEac5xXk9Q4qsqnusChpqD30EvEDslUg+/Xfb1Xo8TtB1MQZ8xXeOg0XhQVA8u
	3rGPK+DB6tocg48AhuBwdc5O19gUWiNJU0D5c029Umlpp4+5GkJn7vfHWzSB1Ayj
	feHeWaBw3fH3St2SEjlcOR4tIZZf0SJo2YFML33HkV75yaR1oFqguNnOF2dXz2so
	JC116sOqU6fw+yVUmWHIuKk3VR+bOPl02RyvjIQllSVFpvE6YktMDF6ipfy1B6Uf
	jJm+NyUH2+7w0TZANZ2vMI6s/UazFLapkjFnYv/gea5YH+E9fIwzzL7XCtw0q+s4
	E7a0RA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twg3emvd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 06:07:08 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-af5310c1ac1so3327766a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 23:07:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744092427; x=1744697227;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LIxkWENj/q2hTkMwvmODIhHwoW25U8wZdObE/3hO0NI=;
        b=Mp8eLs63mG7Js8Dd5d4otSPiaDaLUOnz+nOBx0wmo1d7zJSXJ9OTwbZEkd+77WCewg
         3P30JNTWdAI+hmDLKEPeqRWBpxK9fQxcYi+HB9EO2RBxQS1DS34nTqJBBwADXbQugEZ2
         Yg4P85XEgtvmprsjsn4cfYnOQI8YAlTW3D/Ey/N5yGxP8QlOPkIcZpYO3kHEf/OCGLG5
         ItH66LO8dAyjdgx6LDUMsnT45TrSiJlBZeXqs+eB3qOJdJ7oaW6bFXyrNCkYtBVRKZVJ
         IPXrkwr/L48+S2jPvvCs6uZSkEsl44JC9Jha4cRPaj3SLv+BUf0AKu7puWCOrrqH69Vn
         weiQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGpXySHst2T66+zzIpw2OUUHpdCmsiP7MKdgkcD9geME+yRY3WEhizjQSFazBKjtfp6azcJ5Y7CyoHp1w=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZzztJ9mWzWwuoJgYyLCGELht/vlS1eHiTX4wrpLuAnlJFyyhK
	j3Uly8X8x9U04ool5+P08Plo7S3ydY+iQvzKh2vqdobvEN+vY+2SAMQohroK0euMbZfuFeAzQG5
	qanq/BAfDY+RkRtmk9Li3aUp/LShcSjxrFFER5Agrxpg3JV4UyBTnmvLkybwMPag=
X-Gm-Gg: ASbGncuLaurKUK0XGSDsOGgk5ZbuH/eLc4Si3tlQnJEP0Pmp9gEWptEI4eeJF9ObrBS
	8kxJieNt0KJhScZ+E+1/NsqR4fin++sk9NHOdtV/8pk7ShEtNBLax1hEwa7zZEF/rZRVis/53kw
	jWIwmjl3p/4Y76P+LTGcb4pf1wnyYvrZfqo/j5PfvK3FQX+Nnbx74v1+igd4Af3GY9IBH4I8vHS
	yG7Ykqtd2LThAo+5s5gUuYRLpgHurrYhs5b7x/zz2aCJZ6drUM9iGGQseyHUu/zBWCXzCmgiMSV
	65MRPB7nDrp+X9rowdwrQL7riiTlU8Q3/jI1QlV2BFgrjLlS0roK/Y2BS9EACX8PlkXDtEfEX0B
	j+tWWQ8BVkbc69ePe6VPrGePdQRqvHAkz2+FCN2XX
X-Received: by 2002:a05:6a20:e615:b0:1f5:6e71:e45 with SMTP id adf61e73a8af0-2010472df50mr23137227637.27.1744092426947;
        Mon, 07 Apr 2025 23:07:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFUfZpNpImfeyNF3xfOncodEa1J6cUs6peESY7TuolTeZvZk3fkw9PWN6do2t15rjWkh0MPUA==
X-Received: by 2002:a05:6a20:e615:b0:1f5:6e71:e45 with SMTP id adf61e73a8af0-2010472df50mr23137196637.27.1744092426609;
        Mon, 07 Apr 2025 23:07:06 -0700 (PDT)
Received: from hu-adisi-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af9bc35079fsm6863981a12.41.2025.04.07.23.07.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 23:07:06 -0700 (PDT)
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Date: Tue, 08 Apr 2025 11:36:36 +0530
Subject: [PATCH ath-next v4 8/9] wifi: ath12k: handle ath12k_core_reset()
 with hardware grouping
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-fix_reboot_issues_with_hw_grouping-v4-8-95e7bf048595@oss.qualcomm.com>
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
X-Proofpoint-GUID: 8Iqz7m84U0H2SfIcai_nZs_pXOoTzyBy
X-Proofpoint-ORIG-GUID: 8Iqz7m84U0H2SfIcai_nZs_pXOoTzyBy
X-Authority-Analysis: v=2.4 cv=I/9lRMgg c=1 sm=1 tr=0 ts=67f4bd0c cx=c_pps a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=WsyaGQEz6myPfAgSfy8A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_02,2025-04-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 phishscore=0 suspectscore=0 mlxlogscore=999 lowpriorityscore=0 spamscore=0
 clxscore=1015 malwarescore=0 adultscore=0 priorityscore=1501
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080042

Currently, in ath12k_core_reset(), the device is powered up immediately
after a power down. However, with hardware grouping, when one device
asserts, all partner devices also asserts. If there is a delay in
processing these asserts, by the time this device powers up, other devices
might still be asserting, leading to an overall recovery failure.

To prevent this issue, ensure all asserts for a group are processed before
initiating the power-up sequence.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/core.c | 29 ++++++++++++++++++++++++++---
 1 file changed, 26 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index a1c9b8771e9c4c84548da2cb4054b0403aa8c759..55db189d82346438272c94f25b62dd0db8716efb 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -1582,7 +1582,8 @@ static void ath12k_core_restart(struct work_struct *work)
 static void ath12k_core_reset(struct work_struct *work)
 {
 	struct ath12k_base *ab = container_of(work, struct ath12k_base, reset_work);
-	int reset_count, fail_cont_count;
+	struct ath12k_hw_group *ag = ab->ag;
+	int reset_count, fail_cont_count, i;
 	long time_left;
 
 	if (!(test_bit(ATH12K_FLAG_QMI_FW_READY_COMPLETE, &ab->dev_flags))) {
@@ -1641,9 +1642,31 @@ static void ath12k_core_reset(struct work_struct *work)
 	ath12k_hif_ce_irq_disable(ab);
 
 	ath12k_hif_power_down(ab, false);
-	ath12k_hif_power_up(ab);
 
-	ath12k_dbg(ab, ATH12K_DBG_BOOT, "reset started\n");
+	/* prepare for power up */
+	ab->qmi.num_radios = U8_MAX;
+
+	mutex_lock(&ag->mutex);
+	ath12k_core_to_group_ref_put(ab);
+
+	if (ag->num_started > 0) {
+		ath12k_dbg(ab, ATH12K_DBG_BOOT,
+			   "waiting for %d partner device(s) to reset\n",
+			   ag->num_started);
+		mutex_unlock(&ag->mutex);
+		return;
+	}
+
+	for (i = 0; i < ag->num_devices; i++) {
+		ab = ag->ab[i];
+		if (!ab)
+			continue;
+
+		ath12k_hif_power_up(ab);
+		ath12k_dbg(ab, ATH12K_DBG_BOOT, "reset started\n");
+	}
+
+	mutex_unlock(&ag->mutex);
 }
 
 int ath12k_core_pre_init(struct ath12k_base *ab)

-- 
2.34.1

