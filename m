Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF3328934D
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 21:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745442623; cv=none; b=I5Gy17QlnAeiMf9ADEQndVhU2/NocP83UDN4hZLUWWHlR2ziWbNEUKfTkpUJnK4ahXkdUKDbCWgJJ72yv1c5OoBSNZduStBQdZEjUvE46HW/oayuCXoQ9P4Ij7QuurmLz7NIOZtFFFPnOhid0YzNYMuPJ5nNawZ+r6lH5niq9sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745442623; c=relaxed/simple;
	bh=RfnKyq9ICjUtkkjr2jKBhZZlDiqthzP5N0bD/Kguupc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uO5Fg4DdCmJMfRrU2qgXVLhbarBHGIY7BkLruvCltJKs6Sju8o1hOO6Idw4EScPEoMSvrnJr+hwgs2ZVypXlk27Uu3HZhf1nEOtv4EK0OtTNigg9H3VG17dTZWBELyIMYx11PtQX6TvNwlCrq2CD7W+0Azv4T4DY5atLY9sBBGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZwSqMxrp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZwSqMxrp"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NAkC9W022002
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 21:10:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y6UKS4JYcuUAg5jzEbt/jNsmLaCkbGKSDsl+QGDcjdU=; b=ZwSqMxrpCeaqh9zu
	8Sq/gr9zW9NlUd7jaLhaZ5mGrFYkL1zBBTbKfNbGQYmMkt07NSk1+psX73B6QqJj
	xVCAT5ETsxIN61PJJ6RUB5lTFFXNrGlG07TvETl/s9fYNZerBkMHfeS6fxtrGGPi
	eEh0SQ8Y8pyu6DpmRpW71kdUnSkwbe+V6fjTCFxeR0EsYGVcwI1KF77lFrFHv37o
	iT7MAlVYKUtc5jIFhHWgkzOQK0sG/dHHzHEMNFFHQuhf6eJeEcdTkRc5d/i0vNJ9
	CM022l/p8WH0fJsALNr2ns352rJz+qB1pqzQVrbyO1BPgB1vBETM+8nbhHrDetaL
	lOW4+w==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh13cfq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 21:10:21 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6e905e89798so5637186d6.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 14:10:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745442620; x=1746047420;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y6UKS4JYcuUAg5jzEbt/jNsmLaCkbGKSDsl+QGDcjdU=;
        b=cF+1yh5Nv/QJ4uO+5SIZozm2z46XpDJ/drS++XgznkulMMHGWJRfUg/Lgq/NztH7Yw
         436xjhiD8zvptjSwIR3HDT4d9z+++v4XE0ktZ/22fkBz/1g/3UYRSHG4bzZ5AI+eJIx9
         l0XDn5AgXfbHS4/EA053WjzhCG7E3LyCZl1kyFIFZh+TP3jv7nNDWLhWchDlAbt1J878
         2+cEn2fZq77mVGTiwt3RYtLNDHM1R1zpvbspPoBQ+vHdD+bsAfIbcpeJSzE4VpU+exU4
         apSs/o2kwIM0CRmMRgH37VhaTRd3S8GXvdSCLmwclLxJTlXPw3ysr1Wxe02ffqUo+JiR
         puNw==
X-Forwarded-Encrypted: i=1; AJvYcCXLwXhNJ0tGM0IDq/KLk6QWluf5GxIfyHK8rY3PVWHgJwQZKPm4KTZAI0msdoadlxvQKXGDJvqkVhYNtXU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxcc1n1zdk6K9+Kz6/PSNR1dT8D7kKYiUAml1AnI0VkgRTga9PF
	DeUilYlDuyIMez711L8o7d/cSXblxHvuuGNXw/8bmYoRe6t4Rr06Gc+ICeOVqdICILRny6lxlsG
	A15Q9jmsz6rIoqxXgjWVP3caRYSG8zZikOw0r1YSBWkvid3l4L4ybbFspocHy6Jk=
X-Gm-Gg: ASbGncuS6I5zXyj05TgdJxycvMZtlZH+YKfGwpq2pBjZSZ9EWS1c4mx/0sAZv+01wcD
	gati6weuvziMcT/9BVW6ugr0crPSTIAik0+7Fx/bmsra0zqPWIV8lOkHd3nkr6Y4puFCo3nNnRc
	/DUe2zswK6icSayRTTVYlfX5LluTLtyCRJz2JEx41EtFq3ndBtpPeFyMPZh3ywLR6cKXl5kvRPH
	VOu0lW+9AI9CzQnjaj/MLQ9R9j9XehBocYgLjQS7Ym+rcio1PdD4M1qzXdaNQAHA0CUAghAOD6h
	uGkxl8g9hOfKX69oeonXvM1nfjNbmAaoPhzmih8uaX7oP74aE4cOzMppFSfG8951tRbOJlTcB77
	MhaADcSI5RQWcfr0gAN4ubzky
X-Received: by 2002:a05:6214:5099:b0:6e6:5bd5:f3a8 with SMTP id 6a1803df08f44-6f4bfc7d20bmr3253116d6.29.1745442620327;
        Wed, 23 Apr 2025 14:10:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFLzUPfct4nWaD35EhN1BKf8WJ1RrzjFP9v77ONKcGBSU1K4tluJaOglVnxZysGEb6xpd0Hww==
X-Received: by 2002:a05:6214:5099:b0:6e6:5bd5:f3a8 with SMTP id 6a1803df08f44-6f4bfc7d20bmr3252846d6.29.1745442619941;
        Wed, 23 Apr 2025 14:10:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb3987csm3852e87.59.2025.04.23.14.10.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 14:10:17 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 00:10:01 +0300
Subject: [PATCH v2 05/33] drm/msm/dpu: inline _setup_dspp_ops()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-dpu-drop-features-v2-5-0a9a66a7b3a2@oss.qualcomm.com>
References: <20250424-dpu-drop-features-v2-0-0a9a66a7b3a2@oss.qualcomm.com>
In-Reply-To: <20250424-dpu-drop-features-v2-0-0a9a66a7b3a2@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <lumag@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1344;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=TzajbLeXFeWcm21J+7IjoKJq84HYxMWKTI0BXOLnjkU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoCVcqdYHwIQ3qP/JElrts5dzGjsyXrqAefsV/M
 KkmWKUjvkyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAlXKgAKCRCLPIo+Aiko
 1ZcpB/4qSyr0iP11NwqcYPY610/qlcZAOgtRs99lx3yKCEOY5PzkYC72ZxkGfXGOXEA6nXfTzyl
 cb6OASx6Lq9TjBIV17S6OQvRCgsSv3gOk06jBLZu2YxODeb0MdSyHVAaT8LeZuat2AZpUlFI4md
 q3nrHZDpe103lINB6WVHPr6W0jVxQ11gTvE7GZh1BFaEzfcN0XDdNX3lVgDUWt9nukFUQdT9Ft0
 LXIVqf+W4zBQnef/8i4d+/RY7Oh2JNw076zuSFudcj09F/jyF6SWBQExFxIX764etPahGpBxmRC
 PtkOFyph43NfGYRF0cK17NqVB97JAp4e7T9WyDzyxMP4it9e
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 6Syb07a2ht7kcm_T2qSsurq0WAyfeLpa
X-Authority-Analysis: v=2.4 cv=OY6YDgTY c=1 sm=1 tr=0 ts=6809573d cx=c_pps a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=ezFYmCdhRMHQQexkQpIA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 6Syb07a2ht7kcm_T2qSsurq0WAyfeLpa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDE0MyBTYWx0ZWRfXxZjzsy+YSeuq 2EzXBq+8p7QfLEPNCa1/qWMvHk/xeW1L1sHdVUlUrQoNBXKdy1xagSgu5iVZNG7Zm9pWUc0sWO5 LFg3DDMae9KfFbRaMY7Qkmrzuot4EGSVJbmhEQToMlliScwA+F295FJE/QcV/k+xEnrl+VbPMAr
 kxyW8QhhDT/+K235/1bBoLcjFCbaP6H6t1CaD4lgBsBY3fE6kfm2JPtozMP6je5PTl9a/ohYf6F oFLK/Fr2sPOIljcJ/OauVh7yqXBUZOPc5jdewwhWAaTQVsr3ReDPb5CXlPjeoPZgPdrtbsBsHqT LrRZNTAJrP7TJyJywlxjF7oXacEIamb6EWpDafTyapyPnNGVCwlqfJV46hoYVuw34XpfhpXxzv6
 8I65ZivkJKXMOgsuySGvxYPQQeVBZA+ceyLtOwLZxOssmyrMu4pPVMLfBFcGV4YYzvWaM1yT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_11,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 mlxscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=999 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230143

From: Dmitry Baryshkov <lumag@kernel.org>

Inline the _setup_dspp_ops() function, it makes it easier to handle
different conditions involving DSPP configuration.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
index 829ca272873e45b122c04bea7da22dc569732e10..0f5a74398e66642fba48c112db41ffc75ae2a79f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
@@ -63,13 +63,6 @@ static void dpu_setup_dspp_pcc(struct dpu_hw_dspp *ctx,
 	DPU_REG_WRITE(&ctx->hw, base, PCC_EN);
 }
 
-static void _setup_dspp_ops(struct dpu_hw_dspp *c,
-		unsigned long features)
-{
-	if (test_bit(DPU_DSPP_PCC, &features))
-		c->ops.setup_pcc = dpu_setup_dspp_pcc;
-}
-
 /**
  * dpu_hw_dspp_init() - Initializes the DSPP hw driver object.
  * should be called once before accessing every DSPP.
@@ -97,7 +90,8 @@ struct dpu_hw_dspp *dpu_hw_dspp_init(struct drm_device *dev,
 	/* Assign ops */
 	c->idx = cfg->id;
 	c->cap = cfg;
-	_setup_dspp_ops(c, c->cap->features);
+	if (test_bit(DPU_DSPP_PCC, &c->cap->features))
+		c->ops.setup_pcc = dpu_setup_dspp_pcc;
 
 	return c;
 }

-- 
2.39.5

