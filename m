Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD2E20DD49
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 05:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750915218; cv=none; b=nt1hBVpCdCdyMqMLvjDpvHxRDLT5EqP/yaAPayPym5GohsKLbkeAQ7P0YA2TMbgFPn4ISZXGD6vGeBX7mfShF0faOcrRcne+piVKC5048oCBSx9d3kP/VZ9ad6cRw+HdjMv78Vv0ELIWRGZdUT9d35+y9EAQi0p9wlyDdi2wHvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750915218; c=relaxed/simple;
	bh=DpTmJWZ18VeKb2Nj+dzk4Ksw6DvHAg3Aggvo2SpFkvI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=riCLX/wn6Wq8nXC/k0IMw8/DTj9peXwl4jVK0L+pJ+mPNQ62P+MoLKzn4mLFkJWTcZDkLPf+vJ6PWNjCZUn+ePCELAi8iaFTlbKQnNIGSjVNvuw1+WWq7Bd2guqdYJyjR/OSOB3fu+x4FM2Gn0YVF001YWi8zxjn9hrNPUCTr7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b4AzxaZb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b4AzxaZb"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55Q0Dre5018662
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 05:20:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=6pAx5/ZkLCjLuDmzrc9Yzj
	agLIhF1++aZj4s/ojWJSs=; b=b4AzxaZbRb2WLrMUh4SQhZq38y6W45cka69ETY
	xqOUxEtwBDGc5dRzpGJqSZ6WjjM5MlOKJQrgmBsOHkM4pV0/yziS7zzS3aY/r9Ku
	T0NTc7lgWFPjbOLjoSPPmBQPAy6CnJ5W+aGerDSkp4Rg9+WQjF6QZlt1pb0VVpUX
	BxAjphrN5SE6goz6tmbIC+sL7tPYen82fQzDVXFzlBcloffdR9EswzH5tYL8G88l
	2bUl5vkx4iGkWSaUOnAmlHuOq/0yN62cOyJqEZ8Jrtl07zH0f8J8DwIza2Ect9HT
	2qx/eaohsM6N3p+L+oSy+JIJeJQjtYG2f2FLuAUPTAC4pV4w==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ec26cat6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 05:20:15 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b31c38d4063so328269a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 22:20:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750915214; x=1751520014;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6pAx5/ZkLCjLuDmzrc9YzjagLIhF1++aZj4s/ojWJSs=;
        b=KUq/B2DhZyQpOuPlu38JPIkBCfGCguGxlYSdagsuhJjzfCtSLc/3Ez5iQxFAibZtRR
         pNTX5CysVxejoljq/K53Fc8UH/+OXicK44/XIx0kMWFRFP4b6f30Hl9qJhSxwtYuQyGa
         xvWTzVylZgjbCnbzyJ42f4+oBaOE6oOYi8cXeJ6qVcmSRrIVm9lrIH5OnhrYWvvKLsLh
         FdFGfR+g6WEBzJrq/KZzrv4xVQkav3BXmIsmJrfVHVXe9wtSA0bPEFY1S9uOkCuwWheG
         k+Ge0AZ52woJ/FCEfNn3vyEm0Fh61fyryWTHvHeTw0dEY4nP/BmoGG7+axGBH3AaZByR
         J62Q==
X-Forwarded-Encrypted: i=1; AJvYcCX/ap90niYv7XKGn9LrrtvbSqbTSfN4zxBHdatGH7HhyKm2yk3skUEEk2BQeisdq2oz2Gxx+qkDHRlO0dk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqT8mkwmqH+OVH1sopP6GFFELmrA6IaZfTwzGn0BOa2IHgrObJ
	ZCoxPTqK0rxZ43mmKeTNS7r3e/+SIXoI6M6DVXeRhyNQS1J5Ck+bh3Q1tl//kl/FJHGktZM8zht
	qRoZgU3IvJnFlZvAPFMX9+G0u6dqGFfhpCgMl802eT9aQUtYFPnsALcdUGhxeBkbYplk=
X-Gm-Gg: ASbGncvSXHeOj25SOAI6vtL6J+UHHjn/oqWkiVgbwIUP3nv62d2bO3hXcr2YG+7fo+0
	Lf6EMPgBv/zM1ZYVlI1HZquItYJf0TnOTzrJpWK2fdPhMS1ZwnieV4hGNdNEhbNTtV38ruWfdp1
	KP9IjyezfAMmV5e0VRibwQPKuLZokH9dptO01Tpgd/6n10XJdWmIfLWSGlOhOvg1oJZGJDfgYd7
	OBX0c7PjsT+sk2SO2caMyaOpG6qCduBUhx+a0V6zJ6RQU9QgdGRFpSjLd1vtdNhY6fN+QtgjWD9
	vqr/OpXabmbojIpe6cmSxKBwlfiFCT0ZqVliLbXbzQAHtP9j0G4VmT7aFeRq9+D4b64j1IAwMy5
	43JFP1+/vA/k7SqQ00myeTJmvWJjKEi94THQegRl7n06VsJs=
X-Received: by 2002:a17:90b:2ed0:b0:312:def0:e2dc with SMTP id 98e67ed59e1d1-315f25c9b3fmr8638729a91.7.1750915214190;
        Wed, 25 Jun 2025 22:20:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH89OoOzXSimx5HnW6QRCbmh5jHDwsaTiPcchec/GXWmTxIjZHrwzQ00PiGT6UVndyuC4fweA==
X-Received: by 2002:a17:90b:2ed0:b0:312:def0:e2dc with SMTP id 98e67ed59e1d1-315f25c9b3fmr8638690a91.7.1750915213684;
        Wed, 25 Jun 2025 22:20:13 -0700 (PDT)
Received: from hu-adisi-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-315f53c2f28sm3443612a91.28.2025.06.25.22.20.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 22:20:13 -0700 (PDT)
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Date: Thu, 26 Jun 2025 10:49:56 +0530
Subject: [PATCH ath-current] wifi: ath12k: fix timeout while waiting for
 regulatory update during interface creation
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250626-fix_timeout_during_interface_creation-v1-1-90a7fdc222d4@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAHvYXGgC/5VOSwqDMBC9isy6EX+x2lXvUSSEZNSBmrSTKC3i3
 Ru8QTcPHu+7Q0AmDHDLdmDcKJB3iZSXDMys3YSCbOJQFZUs2kqKkT4q0oJ+jcquTG5S5CLyqA0
 qw6hjahAam6ozV1u3XQOp68WYgufOA3SchVmZ0UUYkjhTiJ6/54etPC1/zm2lKIWUdW/7pu4M2
 rsPIX+v+mn8suQJYDiO4wfwV0FB7gAAAA==
X-Change-ID: 20250625-fix_timeout_during_interface_creation-ae428c7d3684
To: Jeff Johnson <jjohnson@kernel.org>,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, Kang Yang <kang.yang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDA0MSBTYWx0ZWRfX/5vCjSLFj+91
 0EfaXLqgM8fAMbIfV9ymGvmomIhFUgfSzTKGO/oazavFo1Vlp/DWxdFBraw9EtlW0QYZFWtREKe
 cW81e7NOfVOxNvrgmRwk4MQrlEB71LuImyx1fAia8jKV21j3cjJnheHvLxo7sGFys9eGx4/c6bv
 Lvjdyd9CdSUb8VyBAaVEz+Om6TfgX6erJAHjP21YMywtL3C/v35JUoQXU/PP+uxn/eE7OzAP8HJ
 JfdD2iHw7glu3NQXLcpn5gvqgxpeb4tkAxeeEiaj26jbCbP9fn+mOBys3luJ67Z7hHapK62fTMO
 FnXCRiqkMQOBLpxIOfFxt9PGucWNcEAGeiTn4rqdtyFkTtz+9CesheiREdOdqYJRAhJbaqyK6N1
 G1rr8LZlzD4maZ6gUGEh8HXF2Apuu1OhG04DQu9PKmlCUVQipq5dzM7W+GtRL96pg1KFJ4Ej
X-Authority-Analysis: v=2.4 cv=XPQwSRhE c=1 sm=1 tr=0 ts=685cd88f cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=JrXYcSkjSHDmVXoFp08A:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: o8O4b-TlqHkpnCQ4Ue8nVmznbSU7kV0Z
X-Proofpoint-ORIG-GUID: o8O4b-TlqHkpnCQ4Ue8nVmznbSU7kV0Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_02,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 suspectscore=0 mlxscore=0
 spamscore=0 phishscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506260041

During interface creation, following print is observed on the console -

  Timeout while waiting for regulatory update

This occurs due to commit 906619a00967 ("wifi: ath12k: handle regulatory
hints during mac registration"), which introduced a completion mechanism to
synchronize the regulatory update process. The intent behind this change is
to coordinate the timing between when the firmware sends regulatory data to
the driver and when the driver processes that data.

However, during interface addition, if the 6 GHz band is active, the driver
invokes ath12k_regd_update() to apply the appropriate 6 GHz power mode
regulatory settings. At this point, there is no interaction with the
firmware, so the completion object is not reinitialized. As a result,
wait_for_completion() eventually times out, leading to the observed error
log message.

Hence to fix this, move all complete() on regd_update_completed to
complete_all().

The complete() function signals only once, causing any subsequent waits
without reinitialization to timeout. In this scenario, since waiting is
unnecessary, complete_all() can be used instead, ensuring that subsequent
calls to wait without reinitialization will simply bail out and not
actually wait. This approach is ideal because if the firmware is not
involved, there is no need to wait for the completion event. However, if
the firmware is involved, it is guaranteed that the completion will be
reinitialized, and thus, it would wait.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.5-01651-QCAHKSWPL_SILICONZ-1
Tested-by: Kang Yang <kang.yang@oss.qualcomm.com>
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Fixes: 906619a00967 ("wifi: ath12k: handle regulatory hints during mac registration")
Signed-off-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/core.c | 2 +-
 drivers/net/wireless/ath/ath12k/mac.c  | 2 +-
 drivers/net/wireless/ath/ath12k/wmi.c  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index 83caba3104d6c0bca40dd1166de335aabc8b74e5..ffc19a6b948539dddf3f6f21f2799f1b661347f7 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -1475,7 +1475,7 @@ static void ath12k_core_pre_reconfigure_recovery(struct ath12k_base *ab)
 			complete(&ar->vdev_setup_done);
 			complete(&ar->vdev_delete_done);
 			complete(&ar->bss_survey_done);
-			complete(&ar->regd_update_completed);
+			complete_all(&ar->regd_update_completed);
 
 			wake_up(&ar->dp.tx_empty_waitq);
 			idr_for_each(&ar->txmgmt_idr,
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 32519666632d1877eb48a31e94e5eb47f2b33880..d5f41f0fceee23710d2d775bb4d6f7451e15a55b 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -12755,7 +12755,7 @@ static int ath12k_mac_hw_register(struct ath12k_hw *ah)
 	 * proceeding with registration.
 	 */
 	for_each_ar(ah, ar, i)
-		complete(&ar->regd_update_completed);
+		complete_all(&ar->regd_update_completed);
 
 	ret = ieee80211_register_hw(hw);
 	if (ret) {
diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index b38f22118d732aa182f9fd6dda376b0d41de65e2..2fb262d13a586bbf354a74be8e509df2b4905f30 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -6764,7 +6764,7 @@ static int ath12k_reg_chan_list_event(struct ath12k_base *ab, struct sk_buff *sk
 	 * before registering the hardware.
 	 */
 	if (ar)
-		complete(&ar->regd_update_completed);
+		complete_all(&ar->regd_update_completed);
 
 	return ret;
 }

---
base-commit: aa555da8266715e52e5dd74360f3b4c866ddcb64
change-id: 20250625-fix_timeout_during_interface_creation-ae428c7d3684

