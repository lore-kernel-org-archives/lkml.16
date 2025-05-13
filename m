Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4CDC19CC3C
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 23:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747179009; cv=none; b=Ie19Jh38ZHx6s9X8IMIWwpQIX1zng9nBzR3JZNRmBC35XdVUGiZe9gs+iioeynK5r7K1XB9PDAG8DpOqvdhdcL5jPGscHCrMOcbPiSowzqcyvx5xmEk4Yb/v6pyCNKJoSXudRx9BcVxb4vNFd0FLZK5h4u1ey/6zEhpEJvG8wGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747179009; c=relaxed/simple;
	bh=1LUajNbvybnKkxnxB8nGE1qDfFOK0dPtOLJKSSG9Rbs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=IeaJcVdtoraEa37P5v38OJh3kX1p/1dmiGTWMLQvQc+B9i1DWLxN8dJ+dLLlD7pRHthG8iN+Lk5I0NYwtczetRw3GzMSbIGj6OL8eAxNu36KaVOWAz4DEQ54QbeMdReVvu6gOv2Z+cP9szQd/SnB9Srb0wjHuImsqLFDeSkp494=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RW09l7vl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RW09l7vl"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54DIRqTi008551
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 23:30:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=9kw1tJ+fZlLjSs2Ct4UhM/
	9TxVd++C5yWC4uITx73v8=; b=RW09l7vlpXY5+Dfdol9YHPvQp9YsucwyxQ1mnQ
	Xs0GRsyo5cuRM1QX4fldPmhL7my9D2s7TIjhmtjrfAxMYc6ly93wB8EyyScjgKk3
	DG4JqNqvXdAONo+UABQlDfqAMBoJVH0XnU7UQehmPd/NKRL6lxO2vX+rfQT3oehi
	PVVtk9D2WOvSJUHwzndkVUoITdqc9dyEGHelo9dh/zRVZDJyTLcwrzBdKlqtWUr8
	kDwe4IHmHjC5sKfhhFDzS6Y0Ja3AuqSq8S0vrYtCxePQtrqeBCWbdlhbTkXxwXdl
	ALB0/3s13ScG3x7VTB1KIcBDFIq/YidGHIUl7oDcZqsSB7OQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcr0q07-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 23:30:05 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7caee990721so1355614285a.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 16:30:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747179005; x=1747783805;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9kw1tJ+fZlLjSs2Ct4UhM/9TxVd++C5yWC4uITx73v8=;
        b=nxcNKCf6DBqAdQhGyPa14Ejxh+ALUbWnLQpZmAbWDjU84zKl18bAkimyPz5LLlzMUu
         rfU7Jf36DdVBnT+PWvVfkWJcMZsyfatyvgHMCfibX92Xpn/mqtxwUEhDW9bTNyjMAADz
         +ICV/xVgbPkCErCCtTuhu05fCCDfMejyMfHj/FI45KJWKOKaPWF/voGPHQazmle62yrX
         WB3OWoH7p9irjwvzAlw6moisOhbQ+gpBt292fL4iHZLUgPuAkct977ln3MLmlfbMFGqZ
         RmUhqwkhupMXQyt2JbcR/kBOesiqPsEL9AjWOEjhG8b8AKXy7oKtVgn71630TX8u6/GT
         InEA==
X-Forwarded-Encrypted: i=1; AJvYcCWpM0rDINQ9grZdt40JWa+5XmviYfd1j5fbCFVYqUIpAEs16w/OyfWCZ9mienfPZkOYoQuxWc4UpdzfgRY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5vHB7HN/yJu7mik/eCn3ELsbKCwPvCSrUPy84FZQcOSjhpG6d
	IQ2ZKbFTCn29VltNaxrYuiaRHhMDD+XQ324q73SiZpFHsa69wmJ80CY52bWEooP5QOCm8EcmsL3
	uqF5NDM7LRwBBtNYOtiFdNKZXy0lhCHA6YpH3O1lU68BAg3KW/pZ9qSUL20Td7ls=
X-Gm-Gg: ASbGncsJdOSvA+7Bl61V2yliwI/sMt7ihWbSHluIB/j3u+fiTHt8DNLnMKWkDJWfdrP
	yddKB2rykTAZ4dJOK4ptwqGeAE9MfVsjXWKHLprHxXa5vwo09z/GPOvOyT2f/8PF5aYpjdbRQif
	v/qMi/luKNqx6mMcDyzytaOCob16qsTqXVxLAPHHf5uX0x2V5xhr6DarlEwHrXwPkdc4hOcFowp
	4dJXIwxtmwGBlnOIdls2USs/6bL5xi51MOB06+OHZTosAwbfw2V3SbdkuhWIMaORqEe88JWJd+i
	pyKuiMiG3iVn7lM+CEN3y/s3bpq2G23IZf29f2N8gHemPggPRJNTMuJLJ/no+uStpX9Kq6Zp5df
	SB2QFuih2uzYBf0q2KaORHNXz
X-Received: by 2002:a05:620a:461e:b0:7c7:ad45:b3d4 with SMTP id af79cd13be357-7cd28832c94mr210563985a.34.1747179004785;
        Tue, 13 May 2025 16:30:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGpnDrtMPY6cQ8xynl/hgQMZ86hVIrUSkBIdvk7KNw4pBWlsnsDSUVPVYKQl7IvTGOcZJUi3w==
X-Received: by 2002:a05:620a:461e:b0:7c7:ad45:b3d4 with SMTP id af79cd13be357-7cd28832c94mr210561385a.34.1747179004486;
        Tue, 13 May 2025 16:30:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-326c33c26c2sm17934191fa.61.2025.05.13.16.30.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 16:30:02 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 14 May 2025 02:30:00 +0300
Subject: [PATCH RFT] drm/msm/dpu: enable virtual planes by default
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250514-dpu-enable-virt-planes-v1-1-bf5ba0088007@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAPfVI2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDU0MT3ZSCUt3UvMSknFTdssyiEt2CnMS81GJd8yTz5FSDRLPkVKNEJaD
 mgqLUtMwKsMHRSkFuIUqxtbUAh78N7W0AAAA=
X-Change-ID: 20250514-dpu-enable-virt-planes-7b7ce0a6ce2a
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1326;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=1LUajNbvybnKkxnxB8nGE1qDfFOK0dPtOLJKSSG9Rbs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoI9X4pcoyU/uZSpo25xT5kZjjrM9k/DGGXTpwN
 kNwXE7FjzCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCPV+AAKCRCLPIo+Aiko
 1bT+CACZMCems+sM/Qwu7e64/XI0cx6/aixT8cBMJNS7bOP7FFiLxSTwDupCGLBjnd9DHANBCOB
 TzgJc3lXaAZp4EB2pXrB6tZO5shx2hts44c633sXNGhEaI0zZG1GOokjOehFlpV8XQsT3rdbset
 GvGYfdYr7J+qy6KAoPgX02Jq0jlPU7p5dacBNptXj//a4RNTp5oDC7DnZ6mE4J5HxWVLXInHxM3
 XGClJQMc799EPmtKtvCOzhFH4A8L/zyaihIB6p2jfi+UWIrLBAyEz7gNn++iaHTr2n7rVrJXc5a
 kv++g1xB7RXyttdDR9DTlPzAredK8HaBxcIN9Sb6uWD0glvj
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: cc3lzcrtCH1vFWGVaSXmHArFfFxnLIf_
X-Authority-Analysis: v=2.4 cv=Auju3P9P c=1 sm=1 tr=0 ts=6823d5fd cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=4RDPIAw37ivmvRzZDt4A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: cc3lzcrtCH1vFWGVaSXmHArFfFxnLIf_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEzMDIyMSBTYWx0ZWRfX8GnDCW0ML1kF
 yLOx8x7/lhmvHjyf0xJCKYB3eoifRVvxe1ZwHS3tMNeD3HlvhDvDFjI/EN2tVv6KJSIhs9Kpzlp
 Ep7Q6BRCu3iZxJZqkIka+gfMqv5+Ywq3eiOYgEwGHsuejei58E9UK4VIlJzAYWeuVRZV9ductl0
 VItWZAViPxVdcnc1FLlrXHHiAFEfymWbGFEU4ALkbKXZG63nn8qvWQPmHWT8cBaq0AhBjfIZEL/
 JqMOWvolUlNqmP/E2kxtpfKd5ZMo45bTh8kOhTDJi9QySybg1ZN//0AbnYAmSNaHdK2B63DADNb
 x+48XSv+iIjnY3COrvX6npuEvul+PjJlSqDzJx8QGIrDXts7YidRebXo8hoW9xAWpHzCwlkTCar
 YuihQmHZ8bPLLn88DSaNYjcBpqXPTBBXKyvM8DoVUbHXoqW/udg2e5aqMpULS/4zTlOd9CPY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-13_03,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 mlxscore=0 adultscore=0 priorityscore=1501 mlxlogscore=999
 phishscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505130221

Turn on the switch and use virtual planes by default, enhancing
utilisation of the display pipelines. It is still possible to use legacy
implementation by using `msm.dpu_use_virtual_planes=false` kernel boot
parameter.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
This is being sent as an RFT for now. Please give it a test with your
compositor of choice. X11. Weston. Sway. Wlroot. CrOS. I plan to turn
the switch for 6.17.
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 1fd82b6747e9058ce11dc2620729921492d5ebdd..5c0ae6a15d0a55c7568bd7850509390a93cf2bca 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -51,7 +51,7 @@
 #define DPU_DEBUGFS_DIR "msm_dpu"
 #define DPU_DEBUGFS_HWMASKNAME "hw_log_mask"
 
-bool dpu_use_virtual_planes;
+bool dpu_use_virtual_planes = true;
 module_param(dpu_use_virtual_planes, bool, 0);
 
 static int dpu_kms_hw_init(struct msm_kms *kms);

---
base-commit: 8f5264d302e803e7ef82a61f9632a0d2ef67413f
change-id: 20250514-dpu-enable-virt-planes-7b7ce0a6ce2a

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

