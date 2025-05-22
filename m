Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 662C429A32F
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 19:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747940631; cv=none; b=RR+holiSVdzu5xNZxE6IlKZHFWUIW68cZCaFrUpI8XF9aNI/+CaG+6Pk0nkovckmf5cCPJLEuDgkiQ45kKec6MaGS/s8kiCkX4qQRhz3S1XClGVMvueGpI974JlYj4TVHMBwxIq0x//WhAEmUNoN8cjDCqPd1dI+Nobxk8qMTfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747940631; c=relaxed/simple;
	bh=zQxYeUAVHo+xt0jOkEWcT10mYuzzGMKBHrI/C8TQAuU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TjbOwsF+63Y/vQB6N5AX5UC4jC+VM1+aPyPcdxW24raqf51E/uD1wV0pUqHWRBfueFYyN7IEloNb02y2YFAT2ug2Q62RLSePtuvDADGWsdzHvcmny9IkY/UnVHAwmwCcModYHrJJCZoC7Raano06qDl5oxyhYqWt07Q+9NV5uMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qbu80mvU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qbu80mvU"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54M9Fqux004048
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 19:03:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4Qp7jh1itM43n3wIU7h6lhpLC0Hmbksbm37fexlcjaM=; b=Qbu80mvUioc4fmN7
	UNATFhvrLnAQflx8F5+aZWsWGXYLV+fRJp6hQ/XNz50V1uvClGLyLRaCMpDyoPQ/
	vbFpu05XVIJnp4YWRSj6x1sO0hBX9V8mo6KyttbVsuU1P6m65L/i6CBHa+StCfUz
	fwf7buYsIxa5GepOdVwhtU6saBm1Ii/JofAmgpDZtc5cczaNdchj4+3zMg/c70S3
	z+8Tr4aHA+T34j4ZV+fo+PjcO25xdUqN+Be1EPX0Sx/nH9sdeaSKNOd8gO5QzODY
	Ax2dPnY+V+JLGe8i3qFaTG3QLuxcrxJ4Ud4vgQY56Wc73xOPU7LfIpLC6FeUuoRC
	jltO5g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf4ycxp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 19:03:47 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5e2a31f75so256013485a.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 12:03:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747940620; x=1748545420;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Qp7jh1itM43n3wIU7h6lhpLC0Hmbksbm37fexlcjaM=;
        b=F0JFyfz5zJRcFelX4MeFn/3293MLfTu0H0ISoO8AlDbUuGb0d3MoFVkRvA1PBracs3
         uwOXbcWNNvZtzFAV+CSerOgewnwUAeriCOikrUhDLcj4BIWcIszrWFA8eX3CcOVwPMBE
         +nDnG6Z5L1/4TlxZ/tAKnIPgtqHKvR421fjigAsg0ZZq9MVETqKxScneAYtVnZqh4Zpt
         c1T7cQPnkre02meBEQ6f7vMp954esYmfrhs9K5BzzBd2xZlYfPPx0Uu4TD23nOEGhpi6
         sm2GYVyD6bAwwCBT/ApM0S0NwMIEXyQkQN5mb+XTpyV2GxHrLueHVgc0PVT8rBDXHUyD
         1HgA==
X-Forwarded-Encrypted: i=1; AJvYcCWvlLkUm3NmRVGUBKJgGuIRgLOd5K+7sHtUzkgt/JmfhUQDegBvxfrjBlz7TLdcNMj3YZ/yp+PVhzGw2x0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEMi84y7sOPY725aKxd6/SFi2MctoeaSWoYRVnbEUVYM5+6odc
	VdhYHf2BQhS4MiJfD2Qb0KypYbYze7gDXmSMl5YYRBOEhqdkiKc1NntP0hzvayWvkhos+ZvVgQU
	AP8rB73iZfhLLN4KsSvbyqmWHq55RX9yd5cX3iQiNGW92z8YfQ7A3jXM/95uBWlC9urE=
X-Gm-Gg: ASbGncuUVIG4fxNoUqoFvxu2jlwadYmDdbsPdhSdTeS9TTDpcNF7DYKE1V/ML3ncPQ8
	F8ezODgWUMbktH1ceKTaVJZ5JFH9a+w+YOfyfH6536ka38l+4IpZNQXnr+pOKnt1OvfxL8YlW7n
	TYk+R0NYDr8n50ssXFDtEaj4e10vg8887m8PSUP4+WRcYDB+BwLeHevW/IFbjemHYYmHe8TIzHN
	WLU7opSoUt74Hm06TBfpMVql3jdAQJnsaVuim94E07FUxoMwvK51mLNDohmylW6TjKx+nVBy8en
	LwppYnSTfdw1+vBqglIRM6vDTt9JpepNMMhFhMAKZs0T2bFVyaCJAGqRwHIVFme9ZQv6uSslNkp
	wcKfdO46BRCyusrkgfRdddkOT
X-Received: by 2002:a05:620a:404f:b0:7c5:6140:734f with SMTP id af79cd13be357-7cd47f1dbe5mr3834188485a.18.1747940619830;
        Thu, 22 May 2025 12:03:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFUWhtLxfwnjOCeFjmQwfRQz8WK84FyU9B8tUZnS1CJObKXZJplV3E2lQi6/zI5UpsVwRyzxQ==
X-Received: by 2002:a05:620a:404f:b0:7c5:6140:734f with SMTP id af79cd13be357-7cd47f1dbe5mr3834183385a.18.1747940619425;
        Thu, 22 May 2025 12:03:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e703c2f3sm3482506e87.214.2025.05.22.12.03.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 12:03:38 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 22 May 2025 22:03:23 +0300
Subject: [PATCH v5 04/30] drm/msm/dpu: inline _setup_dsc_ops()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-dpu-drop-features-v5-4-3b2085a07884@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1778;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=V1gYZpITbFHVwsL98bgMq1gW9yj3xDgdHDTSQqGTqRI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoL3T8U24JiUoIwCb2cb4lL90avZ25jIcPH9tnQ
 pm8S/lgNBaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaC90/AAKCRCLPIo+Aiko
 1acvB/4yq2iMOwDZTbHU9A2g9u3rON7AJ+oqYKcsLzdrCpqTzvxHncYO/qMgQbv0QsJMwTSYxC5
 qMp4hIq+t2Vma1YyiZMXgae2tnodTMiA5QGfy3R4MejvdoPf2vWROyIJHaZ5q9+6jjwwT0vG1cw
 ujnxqFy6WnJ1DNSCDIp89Hk7XE0gDbL0iy27BeJ2c3606zZZ8LAy3Lktjcv5X6D4fDieCXVyShS
 i9aVgAfUUMGFrqfCKFIfzc/uKRWVh/zAL+dkAb/SN31YSaxd6MVJyIUcN1eE96bAGdwW33Ij1md
 FePu1u2uE8S3WXEciqH3O5qHHTxWbaGoPhQTRudDI7CJX+jk
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: tFdgj85Q0iNj-fiH805RuuMaV38d_Njn
X-Proofpoint-ORIG-GUID: tFdgj85Q0iNj-fiH805RuuMaV38d_Njn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE5MiBTYWx0ZWRfXwVPkIXo3D1ix
 b68CACQKIqiXS4BoMHEpffx75LlTvq/FVVjidKVmP8XmeCKy8wFQ97V/GaCJb22mXq3Z2agQ6vr
 wqBMc5qDyERHFCPbmmFnlijrYk1JeUgs7h13rBaamNejC+/JhwBADTjz5vC26i+myFm4xMkJeYR
 fe7Ub2BXrEPpPzRAFZg0ppnPxE/Z5xxLNQuMp7uzVLtMEPfuTUuUMhEIQp+DdfxL4Wi/+5RTEHy
 +78ENDwuaPAhwZgpbYSD90yEp7bovWiHIZBj4SE/Qb2kI16J041odXmXK6Es1wY8AZ5FecgXMQx
 xRNyocPvHJWg/qG/ndAEzp0jMpuZvxDbAmcK/ACKaxAA1LCdkW/Xv3/CBQWQDXu0jtc1u7gtGds
 CDs5Lwfu7d2j2dZKiW9x/O4cQhzXEqoYimNp2uiL/TwxKUpb2HIhAgs8HsDmaO4uDQkfHX51
X-Authority-Analysis: v=2.4 cv=R7UDGcRX c=1 sm=1 tr=0 ts=682f7513 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=aBwJmt2KlYBR8C_sNNsA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_09,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 mlxlogscore=999 priorityscore=1501 spamscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 mlxscore=0
 impostorscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505220192

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Inline the _setup_dsc_ops() function, it makes it easier to handle
different conditions involving DSC configuration.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
index cec6d4e8baec4d00282465cfd2885d365f835976..c7db917afd27e3daf1e8aad2ad671246bf6c8fbf 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
@@ -181,16 +181,6 @@ static void dpu_hw_dsc_bind_pingpong_blk(
 	DPU_REG_WRITE(c, dsc_ctl_offset, mux_cfg);
 }
 
-static void _setup_dsc_ops(struct dpu_hw_dsc_ops *ops,
-			   unsigned long cap)
-{
-	ops->dsc_disable = dpu_hw_dsc_disable;
-	ops->dsc_config = dpu_hw_dsc_config;
-	ops->dsc_config_thresh = dpu_hw_dsc_config_thresh;
-	if (cap & BIT(DPU_DSC_OUTPUT_CTRL))
-		ops->dsc_bind_pingpong_blk = dpu_hw_dsc_bind_pingpong_blk;
-};
-
 /**
  * dpu_hw_dsc_init() - Initializes the DSC hw driver object.
  * @dev:  Corresponding device for devres management
@@ -213,7 +203,12 @@ struct dpu_hw_dsc *dpu_hw_dsc_init(struct drm_device *dev,
 
 	c->idx = cfg->id;
 	c->caps = cfg;
-	_setup_dsc_ops(&c->ops, c->caps->features);
+
+	c->ops.dsc_disable = dpu_hw_dsc_disable;
+	c->ops.dsc_config = dpu_hw_dsc_config;
+	c->ops.dsc_config_thresh = dpu_hw_dsc_config_thresh;
+	if (c->caps->features & BIT(DPU_DSC_OUTPUT_CTRL))
+		c->ops.dsc_bind_pingpong_blk = dpu_hw_dsc_bind_pingpong_blk;
 
 	return c;
 }

-- 
2.39.5

