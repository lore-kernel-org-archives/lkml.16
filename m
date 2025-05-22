Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC45A28C5A8
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 19:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747940650; cv=none; b=N6HBklaVgbdevRzFRo7KoRwgkoF0E1hAPVj1oNoe7zUxWV8UEmjQh3oChg0znnRc1FUN/7eWIIXeKAejbukc1qbpVrLxH/5dss+yXXJv8AJiSgxpU2b7MpolgPGtZf9D8PXeJU8S3NxS8nvyGuCjFOGoZ2MJXw4hW9ho1el7xLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747940650; c=relaxed/simple;
	bh=epai2Cytfes2l89hNY2GN70oZfBzr8X1ylrMw0g4/O4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MV3lSso8DSt+ltB7Fmf70oRuoXkZ26bfUNoZxVnayjBD99Fxhouwqh0Frz3alk7IA6t+b9YLpLzzLVjuVAtrfxquSZrNJ7li5tAwoRanUQ8WMI5D011/TQNQA/fbnHDNGQ/t2+2MKTS7MrEEnz4Ofq0ZbkQoz1odgx1VHX2kSEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c3mb5SO8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c3mb5SO8"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54MHIs8x011346
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 19:04:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DVSKO5Tz7Xwh54RBpw6e9ejvFwUu+HWI/6GMShXKYcw=; b=c3mb5SO8ybDVB2FJ
	IE6JfkbXyx5MmfklP8Jl+s3auExSL+0ksHdQ/+t3NPEUToq33SCyGcG8cgG71Adr
	pVXUuI96kUwgyWj+jWaM2p8MAk27JEFi2RgDKPQ0wX51ZJAtXIXMIRwEVrw86kKI
	ub7Oi76H7nBMCjLWI7Fda8Oxp027KJrM5sSSsqVi7f7jI/yQk2jaW2SCqpZSMnI6
	SgpZx6JKniqRT0UW0iQCj1zKfIbFnpYk4QKHb24fK+k1XVGqsfeVt45GP+4P+FYK
	2QfNoN0kx2CEkFzhUXOoWdyn/cmvF2H+Q4EXWfvZS/y2RLhMkefUX+fTzqmqXloT
	f2BaLg==
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwfb7b5j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 19:04:07 +0000 (GMT)
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-86caab2dad2so88650339f.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 12:04:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747940644; x=1748545444;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DVSKO5Tz7Xwh54RBpw6e9ejvFwUu+HWI/6GMShXKYcw=;
        b=QD86hFRsLm7WYcfRC7880WjiwkoyrFr4vDk/Db74XRLDUOorRTkmNgO6ACcUM88xU+
         MIXO5EvPB4vR6pafvK3ojlhhstg1iZdW2zYUQk1RFN3FT+A/czBd0UYhJMrh4WGZ/Juc
         F6VGgWiEXHnJn/kEKtoBBVi0jUXAkF+EGHn+uHmqhr/w7fyeDQU/0WahFCC4QySuups/
         hhyKdtodAQXtZu55ubwgJJ1I0Hio4rIRt/3/mkFkdr3Ega0MzC641BFl+mfKXtk6MRLI
         TH6Xh2XWdMgcNohT1pIX1pNg1iUzxrj8gQY1rdxyeMeZljN6NNfVh2On5NmwT4x3mRl7
         ONLg==
X-Forwarded-Encrypted: i=1; AJvYcCUrLClhCQ92qRwJZb83sxsNPCGQb/AuVPJHTz2WUzzkeGgEAWuym0Pl1cHwEgflOyNawov8r+utgG9ocfE=@vger.kernel.org
X-Gm-Message-State: AOJu0YybVy01IvWgf4qwe8q6oJ/II3SLOdGCKLk2Y9Y/vdNKucLy9gYV
	Z+HR1JE4fHkh7XOCTqX2/VgjJwiuDpeYWOREga3vfhTeN2ITnVP9NAaMIouaZYlkToKQM1AFdYE
	AnO8l59PCZsWS8KtRk1zB08lS2LG4TZtqP03mpPmD3KhKdZpCgja1C1I0dCzCQEAkJccTJP28DC
	8=
X-Gm-Gg: ASbGncsCxD8T227lydVvu4yMM5ztJ4KDMQXCg9xfdSy6mNUetQC1ba+zvENpVj++rEh
	zyccPDUDZE08N+h2H5VG+beoWGA8pr8wn4tKvupOif9xZkNKX7mHb6R3W9961q+sz26eTz4iBrq
	YtBMoIgn1ib2KbQqrQqMv4+o9PD9M//QZn+OvuL7liIo0aGja9R2ZeWJFjCnFuoarSzL+LSRSXB
	3OvOgOZv+awnffmEloScWl78u/kZiaQ7dSzp6HQjfIhLBGKZm/LAGxz+NvT9yraN0haPovs1Jcs
	y/iUo5ojBAFPKlJ4jAX06nO3WML+REaGV9JvAv1GiIinJJcSwfCsUDL23UOGuvx1Gz2FNL9K/s2
	KN4hxSHq4Sv/cOsTwzuPfz6tm
X-Received: by 2002:a05:6808:22a3:b0:3f3:d802:14f1 with SMTP id 5614622812f47-404d869bc4cmr17885644b6e.12.1747940632924;
        Thu, 22 May 2025 12:03:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH/jT6jn1Z060H1BWgbFPP/zII0OmBF9bsCViyPeLmWLw3ZixHCeAogA41QGyYKJQBsWAf6tg==
X-Received: by 2002:a05:6808:4445:b0:3f9:f923:cc46 with SMTP id 5614622812f47-404d8698a37mr17537811b6e.9.1747940621967;
        Thu, 22 May 2025 12:03:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e703c2f3sm3482506e87.214.2025.05.22.12.03.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 12:03:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 22 May 2025 22:03:24 +0300
Subject: [PATCH v5 05/30] drm/msm/dpu: inline _setup_dspp_ops()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-dpu-drop-features-v5-5-3b2085a07884@oss.qualcomm.com>
References: <20250522-dpu-drop-features-v5-0-3b2085a07884@oss.qualcomm.com>
In-Reply-To: <20250522-dpu-drop-features-v5-0-3b2085a07884@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1470;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=FhcUxkN33lcwKaCVhynJTwrCtUJjENXomVxBonQ7s00=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoL3T8SI8KCVGVVr1Y9EWMFHMO9KEgvuRRKVX0J
 x20oP/lOPiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaC90/AAKCRCLPIo+Aiko
 1fXWB/9Fo45s651Gj1TyeLBW5+ITB5kjKlbCn9FNuFukuVufMW+UMpWeTehBYxmQlc+7z6FC7wf
 YlI97N7+IcRbAfH96cIN8hTe5YTgkS+9oqT90LjP2M0ppBYZsHGvquHUkmFnhIH/EHSZ86Gz8z5
 R7Hcqh++KiHzQsWOizm4qPLOEO0PHhrPk0atiF8vC/xvKj9+MDzNMfk2JMOuCXOjGIKQypVKmJy
 QzC2NY9Dh7MF7ZufSrqpf0bhiB7rxFbrZveBnE7dz6KEnmo1CY5RfvCVY4/ngoJ31kcauX7w8a3
 QvWCjw3jl87N7QTx+4yp1nA8qu8Q3UXN8qo9uy3rFymXOuNj
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: Tv0_NQdwCBCJvQg9j9KS2PJtsrQA2j30
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE5MSBTYWx0ZWRfX1hkT1+OYk0w9
 RICVYnwMZbz7gTHPElQkSPtqZWlEXOcEOLIH6VzxzTICCiuKCKT8/jAxogVnq3jxTQ9HnOrQmCD
 Z3Lqw7CDQqv9zTJ7+VwPSzIbNR3OG8FpkMFDyB/QE51Lx28RKxQmtucob5T+Bg2ax4pKbxRevh3
 pm/uS6sHMQlDosEO0Y6ZfQf0y5SkETOPSWGxBW9kNRcz7c6JpLH9EIXm6/TOOJk8aOU0CZYEV4T
 JW8uoM0UsJEm0Q5rpkMlgSplXZJW8n3toUvfsj8lhyUN4ElXv6AKeF5S+EaDaFPdlrvpm/hcYrN
 /TvuHr+GNbpsppRSYS+LVuHpIGezzf6E48PhN1O32BmOIoaCvn1K3T4A1SoVNIdfeYZSHT6GT+I
 B94D1aUS5smjVnOllVHftvh/COBbln7W/Zs9VLk4gBa259qkqWrxLIgP54Zjg0MlrNToSZLp
X-Proofpoint-GUID: Tv0_NQdwCBCJvQg9j9KS2PJtsrQA2j30
X-Authority-Analysis: v=2.4 cv=dLCmmPZb c=1 sm=1 tr=0 ts=682f7527 cx=c_pps
 a=uNfGY+tMOExK0qre0aeUgg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=ezFYmCdhRMHQQexkQpIA:9
 a=QEXdDO2ut3YA:10 a=61Ooq9ZcVZHF1UnRMGoz:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_09,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 mlxlogscore=999 spamscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505220191

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Inline the _setup_dspp_ops() function, it makes it easier to handle
different conditions involving DSPP configuration.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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

