Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFE43242D71
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745487080; cv=none; b=VyG+89+N7zBRW7iKdmwAW3rBXo7Jj8A2p9qmvlJtzpz2HUH4gxkQvlHCkMTopgCStIg5iOm7lGa2kvfScqCiCfj9FikD5Ju/hdXlFdbGrK82AKvBivrpeXY656ocOxWifBkqCo83Ew2EZ0O19VORdkHuOd1OhZdN7+6xlod3QfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745487080; c=relaxed/simple;
	bh=WHnH4u7CToI9+YcbwmPKzSr4/S0NqPJ62h/AKSWsURU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BtY+2kFs48Y3hzaISwdNyJyQjw+my6IsnSUh4PwvTLbsUrd+UmMcJJrN3hHf5NA2ouS69aAOJFy2IEKPryB38URXOgfh1xjU+sBi4p+7K/GPNBc0NkhvMmp+ov66z87ZlG3V0yHeGNblnzdEmY88wAyqYiL5YyUXMaF+zFYlVTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lU1fROQD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lU1fROQD"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0FoUZ007114
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:31:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nMj4nXb+FNu6Q2Juv9wtWeinh7kszmTJRVSM9T4R8Nc=; b=lU1fROQD7IA0YtY/
	PVDZZzpgrSfPXrqoOmJjOkMNPX+2GY2ZmoSFjgXQOJFQccsA+BmgvevLw6CXBBjY
	gXmjkhU8yzf+wjBGwBPYz4l+HwbiYmy+5XX3YxLCU1DPX0C+HLkR+dl3LnLR7NZ4
	plxlDKkECNxT02/qaU9Uyx6GR2EebEv1Hneo6Fw+JjGAiYDJ4kN31BBB7GyA3X97
	qMdDCLdF2nDUy+POGik2xnSzrrtMGt40K9MviT/ZmdzC3KBBrHl9YRAkhA+lygo6
	0nyIJzVhVIEe3UUD98inH6VbViEue9nV22GaJoru1lyoMd5bpxtSv13lNx75gQ06
	/5J2yg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh05079-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:31:17 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6eb2480028cso13601576d6.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 02:31:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745487077; x=1746091877;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nMj4nXb+FNu6Q2Juv9wtWeinh7kszmTJRVSM9T4R8Nc=;
        b=C45t5DulqaQagm8MLNtYfWAB3II/8hibbpXMmZr8OGs3vcjGEj67hcAqPNyhDMPfql
         E+zlIbJh/w2IdGgjc3mF0GYI2m+q+vFnUjSOV/B4ozR9XlhraEyuzxeozJcoyi9Rwa+S
         4r+RyHOc+Y9VIP+Dp7DeV2ChEaA3rMupIBLG6FUe+LD9DS2cbMcFO2H7iCr/7JWbhhFx
         BwgpHzlOh04kNWdoOwLQaAEINOWMAGNv7jEPQJeCf8u2wkfGhwHvphrfqdFMUagvxMo6
         K/fv6DAd9EOu2JW+51ppUaUnfsBf0yxQmxfGdrPMubHtEbWC5BKJ8A7J3alQHLe6Nxlt
         ir1A==
X-Forwarded-Encrypted: i=1; AJvYcCW/ZtqJKsktyLjXVDba6KWAtwGtvwq2ALE4HSjKFrYGKCOjw5OimJ39SgunQy0tmqkAagU+nbBXvmjpd7k=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQX0gj0cYmJ2vimQWMe8+4cI9V9XdJ3m8MjtaPA5F1r0Cz6W1z
	wKcH1KursneKdJXbiFlk4F0NgT/JULd//FWlJiBCuPzZNnd7hXNk09Uv67EjNa6KPRrU/YZMrOb
	9b/CzPR6/G9rC6QSF/fXk59i5JUs2sH/6aV83FKyfmijSo55sXdMESkmPbjs9ejA=
X-Gm-Gg: ASbGnctzj7FCzvs3aO0tc50jTEtP3aDl34Ov83Ss29jUxNgFjZhtsnnuOB+f3betAC1
	wuoLyMdg0xW/as1WAE6vmdbtIzh6jQym1WfEQQeymr2hlj3hG3+RimQ1CKGN/zRaO7aI8eykrh2
	l7cW3jIKsxxro64D4zlZ+qsleg5B5ejeJ34Lik+YMEkFHGsaTUiY0ady7/hjz/8cBQogw9QOeKe
	lumqZlMSUmP+PcRpV/KwNcGmI+aVMOl2pDDVb4X+RXE6lMjMohmUJALsk0sWg9qlNWGSFni6kPP
	SlwUZaznPpjmHMsoPP2VL/mZlUQpzi+ddbVdk44JnWQWSb9IoFIYWRijGfQr4bKg4QY4+jdLov0
	YCiFLRXZhWOt1CXnD/6+e92LA
X-Received: by 2002:ad4:5d6c:0:b0:6e4:3ddc:5d33 with SMTP id 6a1803df08f44-6f4bfbcff8cmr27765656d6.13.1745487076966;
        Thu, 24 Apr 2025 02:31:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1W5a+5gc6B7AlIvLZnfYHMfxB9iNdzMWs0zrgULP7xrYOYblEfMRe+GXwsC4GjPCz78vlVQ==
X-Received: by 2002:ad4:5d6c:0:b0:6e4:3ddc:5d33 with SMTP id 6a1803df08f44-6f4bfbcff8cmr27765316d6.13.1745487076645;
        Thu, 24 Apr 2025 02:31:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317d1b9a304sm1820461fa.99.2025.04.24.02.31.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 02:31:15 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 12:30:31 +0300
Subject: [PATCH v3 27/33] drm/msm/dpu: drop unused MDP TOP features
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-dpu-drop-features-v3-27-cdaca81d356f@oss.qualcomm.com>
References: <20250424-dpu-drop-features-v3-0-cdaca81d356f@oss.qualcomm.com>
In-Reply-To: <20250424-dpu-drop-features-v3-0-cdaca81d356f@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1025;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Rp2b7HkiPFY5uR85fuuwlCMt0ynxuJbG+1cuM8N4RUw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoCgSwjwuCAQPtAtKCggMXBPwUBGbkT7v7GHf+a
 Z9r2u+vdYWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAoEsAAKCRCLPIo+Aiko
 1YWgCACFeezcUqdWJOjr5b9efrq41SoCRN+Gl3gbB3ibrA7vRHOKAhyutBCN0y/vk2IOE2GRDzC
 qkud11KikADnf22r+/abp0uHrRWrLvISbb9aHl3QLsy79fH2HgN1kxYqhLpvx/udJTnqARkyAmW
 sJXnmAKArZllViW/LmxbDDJFHNy3GwT4PXvanCV5a05EQDmPu8ArtgpagqAauykLpJbhnKTtt3m
 3AsKQj6T5dpauSOMmC03gTNpc2gXuzi2r02mPVECpfz9hnsvbGvpf8yOJkIBqJlbR/BNRoeEsgf
 SohlW13/BA3b04T0rthak5t+q76AbJ6J0jhPZCcKytBiuQHE
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA2MyBTYWx0ZWRfX20tAHZXQHk/Q QgseKW5Iq10RQlWiBO+NM+cy4NJ5fRErPECTNSl9hY3mRbZ7j61jSKZh8YteFjrbyTMW1sx1sp0 o/PJEtwrdikQgyHIoKpVUJl9WJq5CY1vU0HaatyeQmkeDGf35yzEIktfFxikM/WQCwg33LLa7dn
 2zqigwTT5Vo42zNu70xndtoLHR0igK5tYbO5Ko1/Ch1OLPxN3OMNuXzqA6ZTbYsao5DP4ETSo+X YBmiGJcnIFHsUMvSYgM6tu+ay8Z5dEndR6bJldC0RLxxGIhPmycAeSPYo1uVrJXyENRUgOTSwID 0/aa3FPKq3+YiO105ZJFMpSGW80neiaiyh1JfhIQtCgBb90ak0+dozT7eR/GkWR4sThR0YJ84gH
 L1fX4mtfqVBGdCPPCKL7jsb9ouW0Q5aOqIokYNeL5kXU1FrMdcGRuQ5YQifhAWlxY2Nen4VY
X-Proofpoint-GUID: si2_rc-ncfy-XzmKkh7-kxZP1a_GDXBw
X-Authority-Analysis: v=2.4 cv=ZuTtK87G c=1 sm=1 tr=0 ts=680a04e5 cx=c_pps a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=8brcGD95nZB0FecW0AkA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: si2_rc-ncfy-XzmKkh7-kxZP1a_GDXBw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_04,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 mlxscore=0 adultscore=0 lowpriorityscore=0
 mlxlogscore=726 priorityscore=1501 malwarescore=0 suspectscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240063

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Drop unused MDP TOP features from the current codebase.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 01763e0bf1359527b0c441ca36b27264dad636c0..4b6af58429361c49b71f6067dce8ca1daa6493fa 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -28,19 +28,6 @@
 
 #define MAX_XIN_COUNT 16
 
-/**
- * MDP TOP BLOCK features
- * @DPU_MDP_PANIC_PER_PIPE Panic configuration needs to be done per pipe
- * @DPU_MDP_10BIT_SUPPORT, Chipset supports 10 bit pixel formats
- * @DPU_MDP_MAX            Maximum value
-
- */
-enum {
-	DPU_MDP_PANIC_PER_PIPE = 0x1,
-	DPU_MDP_10BIT_SUPPORT,
-	DPU_MDP_MAX
-};
-
 /**
  * SSPP sub-blocks/features
  * @DPU_SSPP_SCALER_QSEED2,  QSEED2 algorithm support

-- 
2.39.5

