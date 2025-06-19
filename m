Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 964EB21B1AA
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 05:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750309836; cv=none; b=ftc4m0bDMwiqzJBiiQMVjC76KXSGpNxEAnUHEARkL2XghEkYL20XDv+KGJLUCq5BsU5XXDs86MuH0ddiYHVW5Ac0UCqt8qJpnkv6WdQIAkt11kE4pAr0diCTSfk8k+BEbGEoi2oy4Jk+berQ5GhjL7VdrenRfRDc7TIIzt9oByg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750309836; c=relaxed/simple;
	bh=olvrA9VoAgGHjSGsRlyP5LDLiH3fWWRwt9BuHkcOrYs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kfshvl+EIXv5YGnfFZ8PFzaPEKsgzaBrc6MB3EnZQMFnEWXfOIyKjSjaJHA3+KKLQjnjYVOUL5kl2BFS4xOkTfbtzuOfkJYPbhlV63i3mSuOWdCTTGpHPec7LBLzbob7IdkGpHMY6THk8k+JDzRrJlXRxhx+Ppwcc1QLjmfW+XY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pQYQpTIg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pQYQpTIg"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55J2F5OE007452
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 05:10:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=yBSzG2njIyjzGMlaHr5sTGjTp0z/ExZCJsw
	dGgzeFLU=; b=pQYQpTIgtxWm/1W7ghUqnJkFV7qvxjQQ+QSzv7u9+f6EMrqz3+f
	AWnkeLqOK3ek/+1/FzB/qLN80ffRNf37VXDOkVatWWCRaKCMwSCA2CkPDKd4OtOc
	RfDVcYIspZPueM3umo5wPDzzmvV98bMDzGHcqoRrWp/UFJIygGkRFwhNU/Y6Lg4V
	vXKgTc/5iHInW6+wRXEpNNbyUsZseteUGgMu2gkgqY+fCqaL8tdTADI7hvE1Lj2r
	PE7Sg+OF8CXNvXiGNTlGZVv9uzakKHqhSCheK0ZMql51We85rqJJgMowzrJZqNTA
	AqFBNbo71S314pLaxxQZBYjINnfbuBp1tQQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47c9krrcck-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 05:10:33 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-748f3613e6aso207339b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 22:10:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750309833; x=1750914633;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yBSzG2njIyjzGMlaHr5sTGjTp0z/ExZCJswdGgzeFLU=;
        b=E17Lezk8FXftYxpeUuGuSwDUrxoVpoUOEeZzqkpjBWLV1G7dIESRcFZqgZsvyx/acV
         fjhINNbhiYw9CFOqNppfuwiaqpLBS2CUNcxeE/VSLx3mTlS41dv2NCFS8wQXs9g7g5zo
         V5DeLQgYPSb3i/nisf7nWUIpK4LgGYpRVgcJ/R/U1ddsjUyznidGwZrancJQGkJLAHCA
         IvIup2LgG0j9uqS0tzszRgQs7pZS+6gcww+ppw5mKCeDnrNNjbfXSFk0+0AfYU7sJxMF
         v/idPZZqLv0ZxMx+0JhOy77j9iTPPvYTOlxSc+NDWPRkz7Z/Sx4S2ARa/BnLYIPT8NIf
         IlXg==
X-Forwarded-Encrypted: i=1; AJvYcCWcigcpqJPKtfaqR2QhQYpepEJRq/h/9f3if4kOLbU4ylND4bwEewHsv847/PH8GlHdCMYPq+PEbp9Ceew=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZQulJpzal7b84bj7WUS6Z0IDqqL02214SXtiQgsBtWC6bYVqZ
	No+L8flkbCqZthabO2aaUooMqIpB6EdDto8ihUUUT8IKuQbvAIlpM65WETt5Rd+4y4bF4I7Xjhb
	OsHSqT74vAZSZk3vYWLTZ5OeuxiEpO526dqons0VC1U4+T5Tee0p+u1NWdp2v37ria04=
X-Gm-Gg: ASbGncteYfClEwMKMaBzKhKIoSU72GpuOiNR1t3Wrbfi82YwUrOjp1J4OJdwOJkwRAA
	GVCqhDKZPYfqEV2VU+33I444Ne+ZUaK9KoCh4PEKvwGob1bg+DPqrqmP86MuXk9I0+sIPtuuy7t
	vYyvfkD1pt5rks8nUZrkz5I8tTOuMDnnMuUyiyhUrztdO2OmswJpd/rOGe4gNJG33lVBeVOiLpj
	rTw6ZQycxjLq4TLTXxhZ1Y7v2RTiuu1UCqRdV2sLn+8yCW5xuVN2FUgj1QFHzrzDZBEAXIocFaN
	PSnE2MV5GWA6RWfQA3NHA8YhReZZg+GqL5FSlTUd5WE4A0NXQ2Emtjc=
X-Received: by 2002:a05:6a00:2d8e:b0:740:6f69:f52a with SMTP id d2e1a72fcca58-7489cd5c0b9mr26579017b3a.0.1750309832750;
        Wed, 18 Jun 2025 22:10:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEA/WHenrVOufZGpGW9L1DNeVeFkF/dZeZeaY+6zyszeiKYWdLj6ZMmiPckF+pSaxxsR2z9iQ==
X-Received: by 2002:a05:6a00:2d8e:b0:740:6f69:f52a with SMTP id d2e1a72fcca58-7489cd5c0b9mr26578984b3a.0.1750309832315;
        Wed, 18 Jun 2025 22:10:32 -0700 (PDT)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748900e3a09sm12124060b3a.180.2025.06.18.22.10.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 22:10:31 -0700 (PDT)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
To: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de,
        dmitry.baryshkov@oss.qualcomm.com, stable@kernel.org
Subject: [PATCH v2] misc: fastrpc: Fix channel resource access in device_open
Date: Thu, 19 Jun 2025 10:40:26 +0530
Message-Id: <20250619051026.984361-1-ekansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 4_0AebAC8i-JP_LTE2kJNPkBSuobjJAE
X-Authority-Analysis: v=2.4 cv=UPTdHDfy c=1 sm=1 tr=0 ts=68539bc9 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pYQKlj0DQmeGCljNor0A:9
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE5MDA0MSBTYWx0ZWRfXwH5nSMInQ63+
 qcvp6sMA9ewpjTTt8vIbevVPx9TlFo1xmPhDtJ5k27gXHllhecn59+vzvvCHhkAEap8JxHC9MkJ
 HkCqUEe2p9gc0ctwbvZ5Qha6jvg2OSThCRGJv9bwJ0bFdJTz1rr3bwMEJ694n0fuaiEfN/j37L2
 qcCG9HhPwIjKgRqqzW5FlV/kvwAyrdjs1j6eJXZG5mjv+eNadNv1nmZ1+Y8C7izCk1ancewQLbP
 DpTTgy5BPyvAUGSlFO7Q17g429amO4fkghAufGVEemoY5zNlqNjR4bx0pw0FQBKPs7EtJFdH9xE
 oYETgFuZwogX8UFEpE+w3+az3wHynDK1OoU/gcDow03j4HNkYkZEHKpjt1AuY9bjJwd67UY5PHt
 sRVcH0bMw0PJC1V3KShQFfQVRYE2N8sYlzdZuupfzGe87J/TzPgUf0ecyZqkQl1NWYipxN7Y
X-Proofpoint-ORIG-GUID: 4_0AebAC8i-JP_LTE2kJNPkBSuobjJAE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-19_01,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 phishscore=0 mlxscore=0 mlxlogscore=999 priorityscore=1501 suspectscore=0
 adultscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506190041

During rpmsg_probe, fastrpc device nodes are created first, then
channel specific resources are initialized, followed by
of_platform_populate, which triggers context bank probing. This
sequence can cause issues as applications might open the device
node before channel resources are initialized or the session is
available, leading to problems. For example, spin_lock is initialized
after the device node creation, but it is used in device_open,
potentially before initialization. Move device registration after
channel resource initialization in fastrpc_rpmsg_probe.

Fixes: f6f9279f2bf0e ("misc: fastrpc: Add Qualcomm fastrpc basic driver model")
Cc: stable@kernel.org
Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
Patch v1: https://lore.kernel.org/all/20250517072432.1331803-1-ekansh.gupta@oss.qualcomm.com/
Changes in v2:
  - Moved device registration after channel resource initialization
    to resolve the problem.
  - Modified commit text accordingly.

 drivers/misc/fastrpc.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 378923594f02..f9a2ab82d823 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -2326,6 +2326,22 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 	secure_dsp = !(of_property_read_bool(rdev->of_node, "qcom,non-secure-domain"));
 	data->secure = secure_dsp;
 
+	kref_init(&data->refcount);
+
+	dev_set_drvdata(&rpdev->dev, data);
+	rdev->dma_mask = &data->dma_mask;
+	dma_set_mask_and_coherent(rdev, DMA_BIT_MASK(32));
+	INIT_LIST_HEAD(&data->users);
+	INIT_LIST_HEAD(&data->invoke_interrupted_mmaps);
+	spin_lock_init(&data->lock);
+	idr_init(&data->ctx_idr);
+	data->domain_id = domain_id;
+	data->rpdev = rpdev;
+
+	err = of_platform_populate(rdev->of_node, NULL, NULL, rdev);
+	if (err)
+		goto err_free_data;
+
 	switch (domain_id) {
 	case ADSP_DOMAIN_ID:
 	case MDSP_DOMAIN_ID:
@@ -2353,22 +2369,6 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 		goto err_free_data;
 	}
 
-	kref_init(&data->refcount);
-
-	dev_set_drvdata(&rpdev->dev, data);
-	rdev->dma_mask = &data->dma_mask;
-	dma_set_mask_and_coherent(rdev, DMA_BIT_MASK(32));
-	INIT_LIST_HEAD(&data->users);
-	INIT_LIST_HEAD(&data->invoke_interrupted_mmaps);
-	spin_lock_init(&data->lock);
-	idr_init(&data->ctx_idr);
-	data->domain_id = domain_id;
-	data->rpdev = rpdev;
-
-	err = of_platform_populate(rdev->of_node, NULL, NULL, rdev);
-	if (err)
-		goto err_deregister_fdev;
-
 	return 0;
 
 err_deregister_fdev:
-- 
2.34.1

