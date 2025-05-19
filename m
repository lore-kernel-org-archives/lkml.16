Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24EA0288525
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 16:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747670670; cv=none; b=KG38bXNXB8vDfdm4WB8nKXOsoCJmMMBcdzlqdrubDEP0ZyNqJLRv/SZMZFa77rDDWHSywoD5200kb++vEzFMjP2A1OAK+bexCI9mZ8Zhfl2dxGP8isF5Ihzgfv617M+vKqR42PgGVkva7ilJ3bv9XvLYVm7uyqKsaC4J8Vtfyr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747670670; c=relaxed/simple;
	bh=dXUvfR7aa1cxnY1Jz5vPa4e2w1K7LH5XEmUqDTxv3oI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E7J0wcwnt50w6l+EuZp9B7cvumRFbZKOClSdUEysU26SUtN1W5/aimyEm8NiI5Fiov3KUoT/yA98rxR73P9RlfyH/qoziKxKkMUBCY7J3Clsc/UHDesoRZqBOecFkuolhztU03hYQ7oMbmaWd++NLn3+JbnUagQkYRWFJ5tI4r0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I1f3+sUo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I1f3+sUo"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J9VVr7015117
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 16:04:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3dOSnZXmw0KW6iA4owOHQhUjrobwGldc7f6qBPHIIEE=; b=I1f3+sUooKHzN3kB
	p4CYpEnOxN3E352DDRYkS+1jWnv1HXpxz7q3ZeThgukufIUCWY8HdGJ81AFGKQ+H
	X27/ilqG2hQOZ5RsyVi2zIUbhFTgCeQSK1RRljz/Wghflr/s1b9UUZTtb/seF7gx
	96zJehAbl7zjRPbQu/QCVa69logmWZWM19iiEGJ6KXMXvBfNWpi6TP+9AH7kkg+W
	0c8+Ly8CdXyh8EiePH3IS4CTaUh0OGgfQfhq2/PAVGRsmSDSgIO7d8C9EXKsatU7
	deum6J0i+td1qqkfDuqqXSjkEpzrhP5xTcen1/RUAaOxH5AvTFi/R0IU6NKuVOTZ
	SoCTDg==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pkr9vwg2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 16:04:28 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-72b881599f6so5315019a34.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 09:04:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747670667; x=1748275467;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3dOSnZXmw0KW6iA4owOHQhUjrobwGldc7f6qBPHIIEE=;
        b=jOx5ctLUSMj4rJVvG8GD13tIb/lS4QsjGfbqtD/QU8dIuAPR+PCzU0aeBbJ6TY0k1Q
         coKBPqazg9LCwVKjJhUkiLMVCEg/zK9mRMgP6AIUBkJU0E4PBtfA3INYxR8PEEL8BX72
         wY8RkIYPNfP4PgJGq9Q9HrnuwDWEy4Scm+5uOaMus5H7UeH6B946B7BIdz+7yAF4eIl+
         1S0cZhtf9Bib/f2pBRi0lLZ6yN8aWd/mvsgSsh7YEau70+/bvBR8ws6gtg1pgOHgyatB
         0I1Ck5lv9ZX7szMz713Tbi6QQqiPWpfuycsQPDinhZfTPMO+MGMOo5FHGEbwHIK+p3JY
         dsEA==
X-Forwarded-Encrypted: i=1; AJvYcCUPns9HxomBc5ZUf8i1SiXG4YbddPwPh4MnniPbUi/qA5PRp4xu688imyganymsWFXxgLObuRM/DXKm2BE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3ZAnC3dHoXeYMgNFFy7bx26MDPJcziwxT2Rq5FYwFnyzCwrNe
	tt0/6f+OITaZrzzV/U34DGhCIA/2Pil27Ho35r/JCWgzGpLJlo/OV7q+YEiKdDEn6gCg8+U+zSP
	Vj/4sECnWPInO5Ls7rhUtA5fTZhH7kv3vxqmX5p4ho2NPBwVLT077I+Tiy2eyJtPMtMOaU32puV
	0=
X-Gm-Gg: ASbGncvxS2w+kL/aJYJAnA3LOlqOkeZab7k5lkeEiDMahPZhm8ATv6ld5Hg6qplWU00
	06OabSrMCR0ImgVhYBhRdY791/+avR0FoJQbuvvsZGMqKwUuzygSCKD0XLmvnzHoWG6PpVR8HMe
	zVkoLP5Dm5kzp6EXwBtFbFUr4jAZm98KKrvNMIowu7/9SKeKy4xBPcf7RYQ/dJJyNz+JlnpUsCQ
	exMgdUf6LTI0fbwSqfeT644cs61xTnn1aroXhvzCNf4hI4gV6EST6wyqgCO8mo9LArGq/dsXS7y
	FV5bbJC7SirDyjgBExqKZxt8hwuGUoeGqQ7+aJnAkZGV6P1TeVESD5QbcnGVg/zDxwS/N8EjLQi
	y/mArbPMO2scXsKeQEyLxpePK
X-Received: by 2002:a05:6808:6b97:b0:3fc:1f7b:c3b3 with SMTP id 5614622812f47-404da7b8d69mr7382775b6e.33.1747670666780;
        Mon, 19 May 2025 09:04:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEWGNkqDoudO9RrWuCi0wKzqrGIqcsU0h/pgq0zgnKD1jGMqg5LdIRqVst60xFqiYKu58bYqA==
X-Received: by 2002:a05:6808:6b97:b0:3fc:1f7b:c3b3 with SMTP id 5614622812f47-404da7b8d69mr7382740b6e.33.1747670666447;
        Mon, 19 May 2025 09:04:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e703f6f1sm1919378e87.248.2025.05.19.09.04.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 09:04:25 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 May 2025 19:04:08 +0300
Subject: [PATCH v4 06/30] drm/msm/dpu: inline _setup_mixer_ops()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250519-dpu-drop-features-v4-6-6c5e88e31383@oss.qualcomm.com>
References: <20250519-dpu-drop-features-v4-0-6c5e88e31383@oss.qualcomm.com>
In-Reply-To: <20250519-dpu-drop-features-v4-0-6c5e88e31383@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2168;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=KY1YKEATuXx9KSgl3eMXV6sbTxL9UFjeSDTpsHW5e6A=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoK1Z6q/sPeQO2gwYXC1xpGu3yco8msBFdP9+Ot
 w3qbkta0g2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCtWegAKCRCLPIo+Aiko
 1YlKB/0QFom0Icz72zmEmsevu7heit4rtZvRppGBGc2foEzGKdj1WXTfDxIRVslcwZXU2GnVw0M
 VFr1qR9Ag+ybL4Fttyxj7nvkUx1LbfRlJjPN1M4MY7uhwR2beS85hN3lG/Td+G0ruxNE9VWO0qM
 XEsw1XW1hRxVJsVy+zupSCLqmkDwKhjI0okQJ2BB84z/wdGobaqISK3wctI5MxR7/0jjMR8ILIf
 viBhwxTrGvMhrDRb90MhFPVzJyIRkIruGFCqdF7ubCDr+PpIEPXRQ1yBchqHnjle86niXVngEJC
 8P5nQetdYPlPyGD1k5j1d/DeZxRQaJLnWqZcnJ9cZQQCzcFV
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: bcHpCtjFdJjGB72vB0EJHq_mTULUt-9o
X-Proofpoint-ORIG-GUID: bcHpCtjFdJjGB72vB0EJHq_mTULUt-9o
X-Authority-Analysis: v=2.4 cv=DdAXqutW c=1 sm=1 tr=0 ts=682b568c cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=2ONPo-prfMSwqFkLVuAA:9
 a=QEXdDO2ut3YA:10 a=EyFUmsFV_t8cxB2kMr4A:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDE1MCBTYWx0ZWRfX89iXrAXZEOMl
 SRMMXJ4OVS/8GwLJZChlNmEhsXiVK9AgyQtRhMdCtDLyz2RYm1sb9rsK/+mGVFsvhB4jvbQ/l9t
 JTI6Bnhdfo+8HV5nt12JcgSkqdGAJCT66gJLCrCb8Tn0jgTqJ2D0N77pV9QVPAzSlP//x60yQ1O
 L8puAYRDCkwA5fiRVPH6MSSUPYIUq9N+JE8prEBDJ9SpRc3K3xXPsoP/6PP4Ma8dDEZOTM/LA4g
 DQkKtpm0f0TrEb5zlNzBnYPt/smS2KR7GIkqAXnZ3N54JL0dVKOEujW5Bj0GPNskeAyZYZ7vK4J
 rdNwaoGnOJ6wsArYTKZXbAxz01jNJD4qcITo5ssuAFWjmrwva94FHcVAQ+35NvuNc/cswpSq4P8
 7VNYlVE8roDCn7kYeSqPcArCvv6RqM1+RX4b5BuNly+/bMymWI3zrx1eeElVLRrSXmVnYYay
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_06,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1015 phishscore=0 adultscore=0 mlxscore=0
 spamscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505190150

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Inline the _setup_mixer_ops() function, it makes it easier to handle
different conditions involving LM configuration.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c | 24 +++++++++---------------
 1 file changed, 9 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
index 81b56f066519a68c9e72f0b42df12652139ab83a..4f57cfca89bd3962e7e512952809db0300cb9baf 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
@@ -144,20 +144,6 @@ static void dpu_hw_lm_setup_color3(struct dpu_hw_mixer *ctx,
 	DPU_REG_WRITE(c, LM_OP_MODE, op_mode);
 }
 
-static void _setup_mixer_ops(struct dpu_hw_lm_ops *ops,
-		unsigned long features)
-{
-	ops->setup_mixer_out = dpu_hw_lm_setup_out;
-	if (test_bit(DPU_MIXER_COMBINED_ALPHA, &features))
-		ops->setup_blend_config = dpu_hw_lm_setup_blend_config_combined_alpha;
-	else
-		ops->setup_blend_config = dpu_hw_lm_setup_blend_config;
-	ops->setup_alpha_out = dpu_hw_lm_setup_color3;
-	ops->setup_border_color = dpu_hw_lm_setup_border_color;
-	ops->setup_misr = dpu_hw_lm_setup_misr;
-	ops->collect_misr = dpu_hw_lm_collect_misr;
-}
-
 /**
  * dpu_hw_lm_init() - Initializes the mixer hw driver object.
  * should be called once before accessing every mixer.
@@ -186,7 +172,15 @@ struct dpu_hw_mixer *dpu_hw_lm_init(struct drm_device *dev,
 	/* Assign ops */
 	c->idx = cfg->id;
 	c->cap = cfg;
-	_setup_mixer_ops(&c->ops, c->cap->features);
+	c->ops.setup_mixer_out = dpu_hw_lm_setup_out;
+	if (test_bit(DPU_MIXER_COMBINED_ALPHA, &c->cap->features))
+		c->ops.setup_blend_config = dpu_hw_lm_setup_blend_config_combined_alpha;
+	else
+		c->ops.setup_blend_config = dpu_hw_lm_setup_blend_config;
+	c->ops.setup_alpha_out = dpu_hw_lm_setup_color3;
+	c->ops.setup_border_color = dpu_hw_lm_setup_border_color;
+	c->ops.setup_misr = dpu_hw_lm_setup_misr;
+	c->ops.collect_misr = dpu_hw_lm_collect_misr;
 
 	return c;
 }

-- 
2.39.5

