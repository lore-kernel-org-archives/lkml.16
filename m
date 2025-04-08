Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D95BE26157D
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 06:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744092418; cv=none; b=th6zCUn7oS7qvHMjcnN9ok2SqzGcNMN4uh8L8dtLgvyQjfMwtHbQLgJgrz+r6YCHqXC0J+OR+rgv08uo6VxRbVn6udD+1Itz50BNW2ceF57he2uozxneY7lWb8kRKygf4zzQx1KeddL6QHEQtpRbV1cyZwryVyrysobh6fXKGcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744092418; c=relaxed/simple;
	bh=370njgXLQlbYRp5dbJwp/vCqAvoxCiM7iy2NC3LtsHs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Sdij9M4RZEZlFlpbzT4hZZfnKyl+rUENX4GUqM083j4rQ0EKotBofbGi2t+HLvjrtmzYm+rDqtkLqDXPhTxGgP8dTIY3ZtQ+x3anj72k1PtcvTvNMDAOjEWCW7U7/KEbTfC0s8H7orE72/dszze7j37VC6UC1BkLBqLr6ADRR94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DbmQXOy0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DbmQXOy0"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5382GLT0008072
	for <linux-kernel@vger.kernel.org>; Tue, 8 Apr 2025 06:06:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hmNs+Dli57VD9IZqVjh4DV7yH/D+861TzD/ZVcimqfs=; b=DbmQXOy0CSvJiPBt
	Tdm+P6p9sps1/NEvXsK9bGHZguauFuqPvd8z0wxyxNVkEOCEVPfdKsqbJ5YopUqA
	tV/nLZke/caYirmLtK6NX9p286O/KZ2nAzW9uM3Cto6THK5Ww433KYpg170A4Ldv
	E2xQQtVQjvniR/8I+C3LfNkn/M84iLF4KEhGk87cQocOg+psp5h4BLxVncObMwmj
	f93oQm6xtRl/XucrdoPJ3vYkNGwNPzQgA36ZSK8p7kzlpECMCqwXaAxHVnTwPhJ8
	lwrmJy0iljTbfXDhuMqB1BFINGTAJaTnUbuQmhABqWlhiwHTpQszZqE8mtfws1oH
	rpSkBw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twtaxq1y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 06:06:55 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-af5156fbe79so5797385a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 23:06:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744092415; x=1744697215;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hmNs+Dli57VD9IZqVjh4DV7yH/D+861TzD/ZVcimqfs=;
        b=d9ond4cMq/bvukd2fo+88or/HwnKtHrg2iOtjdEAKIPSoc7lvY/r44CzKrP7Sv64Ze
         L47zgv/0B0gLwXqV7y8pC61iWOGHZGhHUzHzeXeC0IC2OOWN7kbvx7mLIBEQNlV249m7
         /3bHaLoPtXilc/2+purpVHJqwI9ExtrIJD2EhRnRPdZHnj/V0zR832WmWPeinoWub9zS
         ERJ+oiByArohNfrXuvfDb1PoT3Y31d5kWtOMMozHGJGiqBDqXbN6H9Y8QlVp5PLMjtgX
         WJX/MH1chBuMh5aQM3qWwNZxeT/2Bqk2XcE56Z6YdbK+LF+fAMJL3wuCOywiK7Qq7m2y
         426g==
X-Forwarded-Encrypted: i=1; AJvYcCWKFJBtVLP4CiFztdwiIaBs2yULglFadD/x0OBGScMfmVvgBCXDlkVer+QYZzeeWDGCemV2bm9boT2J0mY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXjs6Hb5itP6znWJ/Hnhdm0lfVglsmnq3I3WH+Efl0yH3dE5G9
	1yFzxWWXxSv9Hx1lQcWVNHLLhUBTDab/JJcfXlhwsRxJq2oGp9ONElEPCrh4J556PA5KHN5o06s
	n8wVFIy0WXmMMVcoX/O1PUtza9ASiLvL4L13rvhb6CnhgrKC1jm/wT4dlRGvZ6w8=
X-Gm-Gg: ASbGncsXVYp9VzCk1jaCpiDPxbE3RAd5KzoRFHntMbcfmAptMH+qQnXBCDCc1weORVA
	FXeQEhyikaH9DWnLrGt0sXGKRcXHqwvfsm4zGGOvIuxPlrjC/yFuWMTk8yTA59vKxO9nTspcUxT
	cokk0QnHN8zIgDiP5u/d7I/qhf3Z2e7/4OgXErFhQ32XWUplB6I1s8tBPjifiSnVZZ80mLsxpY3
	B+5IsOKMXgHTlhkYNGAz1zmKObHC5J9yoVpI+3S32wuhPDbIhePOykzqml/0rrTTwF4W6Fr4xRL
	EKTv9Dkn0PaO2wiN/gkhb1WH6e74JD99vaSHlQuWEZNtKbwZonPvBBMjGiVVPHG84aiCk2XqliL
	hwPv7to0y9aHn3ZutKwcTNgLjTaDsDa25T6zQbtNs
X-Received: by 2002:a05:6a20:2d14:b0:1f5:709d:e0c6 with SMTP id adf61e73a8af0-201047a3028mr20649705637.42.1744092414741;
        Mon, 07 Apr 2025 23:06:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEWTZekfKLMCAEMlcaqVGQtNPhQy8cuaqM2WzkcJnwPiRfIo5wEm7mrFmj0K0CA+mBi9nPVIg==
X-Received: by 2002:a05:6a20:2d14:b0:1f5:709d:e0c6 with SMTP id adf61e73a8af0-201047a3028mr20649669637.42.1744092414362;
        Mon, 07 Apr 2025 23:06:54 -0700 (PDT)
Received: from hu-adisi-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af9bc35079fsm6863981a12.41.2025.04.07.23.06.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 23:06:54 -0700 (PDT)
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Date: Tue, 08 Apr 2025 11:36:32 +0530
Subject: [PATCH ath-next v4 4/9] wifi: ath12k: fix ATH12K_FLAG_REGISTERED
 flag handling
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-fix_reboot_issues_with_hw_grouping-v4-4-95e7bf048595@oss.qualcomm.com>
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
X-Proofpoint-GUID: IxYhSDbJN5rPxh1h8dBlavQ6BFH9XyI9
X-Authority-Analysis: v=2.4 cv=LLlmQIW9 c=1 sm=1 tr=0 ts=67f4bcff cx=c_pps a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=FkGa1SFpmQEPtfWTPJ4A:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: IxYhSDbJN5rPxh1h8dBlavQ6BFH9XyI9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_02,2025-04-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 clxscore=1015 mlxlogscore=999 malwarescore=0 phishscore=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080042

Commit a5686ae820fa ("wifi: ath12k: move ATH12K_FLAG_REGISTERED handling to
ath12k_mac_register()") relocated the setting of the ATH12K_FLAG_REGISTERED
flag to the ath12k_mac_register() function. However, this function only
accesses the first device (ab) via ag->ab[0], resulting in the flag being
set only for the first device in the group. Similarly,
ath12k_mac_unregister() only unsets the flag for the first device. The flag
should actually be set for all devices in the group to avoid issues during
recovery.

Hence, move setting and clearing of this flag in the function
ath12k_core_hw_group_start() and ath12k_core_hw_group_stop() respectively.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Fixes: a5686ae820fa ("wifi: ath12k: move ATH12K_FLAG_REGISTERED handling to ath12k_mac_register()")
Signed-off-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/core.c | 5 +++++
 drivers/net/wireless/ath/ath12k/mac.c  | 6 ------
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index 8a571a615313d2f1190fe9afae02dfd385ede7a3..cb2a99d110d5c9ec2c092fe1a2b776b6265c4126 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -958,6 +958,9 @@ static void ath12k_core_hw_group_stop(struct ath12k_hw_group *ag)
 		ab = ag->ab[i];
 		if (!ab)
 			continue;
+
+		clear_bit(ATH12K_FLAG_REGISTERED, &ab->dev_flags);
+
 		ath12k_core_device_cleanup(ab);
 	}
 
@@ -1093,6 +1096,8 @@ static int ath12k_core_hw_group_start(struct ath12k_hw_group *ag)
 
 		mutex_lock(&ab->core_lock);
 
+		set_bit(ATH12K_FLAG_REGISTERED, &ab->dev_flags);
+
 		ret = ath12k_core_pdev_create(ab);
 		if (ret) {
 			ath12k_err(ab, "failed to create pdev core %d\n", ret);
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 2b6bdc3d2b11a8a5f5733352826c724c671fd49a..5c3c9267e937484cc5f5a7d8032fb3911b4e921c 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -11773,7 +11773,6 @@ void ath12k_mac_mlo_teardown(struct ath12k_hw_group *ag)
 
 int ath12k_mac_register(struct ath12k_hw_group *ag)
 {
-	struct ath12k_base *ab = ag->ab[0];
 	struct ath12k_hw *ah;
 	int i;
 	int ret;
@@ -11786,8 +11785,6 @@ int ath12k_mac_register(struct ath12k_hw_group *ag)
 			goto err;
 	}
 
-	set_bit(ATH12K_FLAG_REGISTERED, &ab->dev_flags);
-
 	return 0;
 
 err:
@@ -11804,12 +11801,9 @@ int ath12k_mac_register(struct ath12k_hw_group *ag)
 
 void ath12k_mac_unregister(struct ath12k_hw_group *ag)
 {
-	struct ath12k_base *ab = ag->ab[0];
 	struct ath12k_hw *ah;
 	int i;
 
-	clear_bit(ATH12K_FLAG_REGISTERED, &ab->dev_flags);
-
 	for (i = ag->num_hw - 1; i >= 0; i--) {
 		ah = ath12k_ag_to_ah(ag, i);
 		if (!ah)

-- 
2.34.1

