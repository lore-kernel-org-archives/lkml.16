Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DA1C225402
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745487053; cv=none; b=jIvf9Z7tUuBFAXmena2f10SmXy9cskcIjS1Vhdc/f++RUj36NxVaj7f8kJvcHyercAMeS7IPhZ2ltKT8V6FiWwLFl9b+Xlbv5ZBWmX0w7zYZZk1WVyywd6M06OV5mlrCgwXRIq9/HCWx0fBfHi5EYeP0k5ICWqbhufSpERuyDAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745487053; c=relaxed/simple;
	bh=Uacr3JGWYtukIhw8R5JPc/xlbl+xhhFg6HvK7EGKgqM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J+pRZpFBHf65gDRXJSwlrIrSZZTHxdpE5hXEDb0Uqnu2AZk9l/2772bYm3NO7OaTsGJYEUyfJHi0XMn4zbx3Jp3I+FNfnq/NVV0cwwqUHQEF6zgtI/7aZkrNuAEtHpRhe4vrJse+4v8mxaQj8PMWZ+9FndzDTzHGCvcmW68qEyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nonq8wif; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nonq8wif"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0F7rL010242
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:30:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mJipZcZZWH1q+GPZjyCUn13cwL4q5wMDd8S9OaXiPQE=; b=Nonq8wifbCmkLCqr
	E4UJ4AsWLcoudxwqiP4aRkSOfnjqjTWLPYtKaCH20w45oAIuuUhqAcQxaH4+eVDc
	WmKFgQyBfbrjPM1TYd1pTXSHgEhcKOU/CWXyClM7SADQ05ud2/iYIXTUGdShModZ
	XVhl/2qAZCnV8caTPO7FP4i4du36UaCpHgHCtsMqzl3ed7smU6JPMGO3Sc4mx2un
	H6GXaG8hhv4sKTmz1om9MFbNyKnhs7XA6gvsW5CMfFRRws6RLz2XpKtrGqAX6HQu
	3mhUuy3lNGomgL32187YruD9bhAT84/3HyMDDXq4OGDoukXGP+WYfq8i2fLK0sXC
	EigGaA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3mypt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:30:49 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c791987cf6so169192285a.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 02:30:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745487049; x=1746091849;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mJipZcZZWH1q+GPZjyCUn13cwL4q5wMDd8S9OaXiPQE=;
        b=fSo95uYYYe2gf+bIuvxAJb8qKq3L9kdmjW+wAyHg/b2zhtXApYnd0pCysCZxCYnOQr
         A/DrKTkf7Gk7gMLoXGsE0LsJ5ruleTZbTC0zt7hdP8A+VBrB/YvsLPPqkiLaZym6Gp4C
         vODKX8cqdwDZJt3o0azirz1zG1CUFpzIPc7kf8sd8FFGf+fhjw+ro0xYW70rbunQtBNP
         y3Pe4D8r/ls8IVejLTvDBP0uXQm1fDqJ+01qn+LXz1wcKR12c1crHdufZrUzhyYQDcjz
         ZLIZAWKP9yxeRsH9YuKSQOPuXJSUcn0V9zoMlThLM1QMFuwXWxOVaVYuTrK0MAz/qAkl
         q8cQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9KOZsKM7tRmf0ux1HY6uY8so9s7SKZRjSooO4mUnHHwRNkgrq8Uz62DgjfMzUHAQjLwPFUYJyl2lDlnQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/O7PAXMhuTG6oYTbYschmp7mceyHJydL3R8e9kfGo5WyZWOdT
	XcBAv7/k+Hny4qbmrYUbDTAKjG3F1zO6Ag0dWi4XbA9VyKQi0EjtrwM0ml1L8U20B/34pQ0DcSf
	ik9bfmPBvwfUrOf/8ZI5id8Q4ZzCK3S9mUiZUscXU/BGfc5UWbaXIGj0gokfxqGw=
X-Gm-Gg: ASbGncsWRRahGg2w2ibyd1AI4dOJggCzCqqIzw2OIH6QZrWfUR2J4Mn8DGzaWVL+j9h
	iW3qdGIa/6qPAct9zqmvzouSAZky8ZAkfjAMMbqABo3HfmYufz+o4s/Ouk9idyJLepvB73/yJKJ
	Fglu+UCZMj/Am43PMLyqhKs+P6oc8yi58pz2G21axsqS4pceaYPBabQvcyH0r7iDdzgihzQ/NGm
	tJ8mYP1dhHaJz4Mio27/tdE/9/q8VYH2eeHaOgUpRQFhenfw4WKvfChpAYWuEtZgqyEhrStB/e3
	+Mrhtbcqip0/kKK24U6tq4qqf8OxRZAfwAFQq0pPsoLc/+n2Bx4hmYe9nmqaYGQv28bjPY33ej6
	KzU2CZtJ9pMIe+qhbYtjgBn1d
X-Received: by 2002:a05:620a:1794:b0:7c5:5909:18e5 with SMTP id af79cd13be357-7c956e7d446mr326878485a.3.1745487049292;
        Thu, 24 Apr 2025 02:30:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFBQmRn7SKcjUSTbGIjxqsPY4wEMu/CWMSRP8MryisNW1tohurPxko9cDIUFwhuJlclwe9QsQ==
X-Received: by 2002:a05:620a:1794:b0:7c5:5909:18e5 with SMTP id af79cd13be357-7c956e7d446mr326875185a.3.1745487048943;
        Thu, 24 Apr 2025 02:30:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317d1b9a304sm1820461fa.99.2025.04.24.02.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 02:30:46 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 12:30:18 +0300
Subject: [PATCH v3 14/33] drm/msm/dpu: get rid of DPU_INTF_STATUS_SUPPORTED
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-dpu-drop-features-v3-14-cdaca81d356f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2459;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Nt4QhnpHTNYrhzhqV0xbi5+n74LJmsNMY4VbVunyJu8=;
 b=owEBbAGT/pANAwAKAYs8ij4CKSjVAcsmYgBoCgSt5uuV1bwUk5DQ4vQkc/FrwRESt2DWna1p0
 zQoy8eeh6GJATIEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAoErQAKCRCLPIo+Aiko
 1UZUB/dSUNDw61C3xWnyNFZGuOISsMOOeIDbwgFQ1wDsmxaKY820q07g40rgZ/jKh0prEf7XsmO
 C84OnR0tvenNeIvXZm8sZsdkRJNU020kjboki6Vqkmsax4Ep3wq7AO1EKashj7zmJlOD5iUXmGC
 /fM7entgLttcNsyxwhK515VCsxvazBjGD69tk/9xPDmrje/LPtvt7APsgR6AvjHuWBpTVV9A+wS
 kLTvq1xTz5KU/ZlLtsOgAB+A1tgJytgfIvqL929trBGoE+no6fM4G9YMEE3PIyLBT9xAbDw7PDg
 0gMgrV1By9pnPaoOvSuU61HaZ0ap1pb0iPeLu43FByx4Vto=
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: V1mC5egB3csfzY7faimiNTI3lx38ViWv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA2MiBTYWx0ZWRfX1Apy0ZFfKfmG 288RXV3RU3qEKUwHiR8yl8jI6P7rRGW1Ya/JRKbxqEJaclTEDrIJ4/qTMSqxth8WonNwdrXwmtZ XIiCooIa4eFcqZoX87XG6rZcx+Y5ERJ1HutUxZIbSq6t4HaWKxeBs46dsfqu4ebiGaBXimhxnR4
 vP4NON0L6v9kdT5DjTyl0P4hf+QYGW0zvV0ngb1Tbk5EAoGB/qeialqeNNU6ZxDsFQ7ua/YAbr7 sN/TkUn3omNHgGgjEijHRKSimgP0q5URt85U1zOkZCYa+vvHUPLE9BykY/bRDsT2AwHZGaCznmM 7Zq3JJUnSRMbuM6tvuwxtGpn62ddoLKoioPEFgU36x6GwDXx0uOyRw1KAc+E7SeZUBnhGMi+iWL
 stVfi1VhQ8xQ2aQXyVCF0bbmuyzOl2wtt3h70fHWxMoQlhsT4dSEQqOUEKbU5OVTMjhq4qMS
X-Authority-Analysis: v=2.4 cv=ELgG00ZC c=1 sm=1 tr=0 ts=680a04ca cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=z6iiZyybfqEMMI01lysA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: V1mC5egB3csfzY7faimiNTI3lx38ViWv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_04,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 phishscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240062

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Continue migration to the MDSS-revision based checks and replace
DPU_INTF_STATUS_SUPPORTED feature bit with the core_major_ver >= 5
check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 3 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c    | 3 +--
 3 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 20f4700ef9969003cfa4728049b9737cb9eb6229..8808be27593b303a2a199a740827c92ea5339b0d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -111,8 +111,7 @@
 	(BIT(DPU_PINGPONG_DITHER) | BIT(DPU_PINGPONG_DSC))
 
 #define INTF_SC7180_MASK \
-	(BIT(DPU_INTF_INPUT_CTRL) | \
-	 BIT(DPU_INTF_STATUS_SUPPORTED))
+	(BIT(DPU_INTF_INPUT_CTRL))
 
 #define WB_SDM845_MASK (BIT(DPU_WB_LINE_MODE) | \
 			 BIT(DPU_WB_UBWC) | \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 36100e21135fba09fcafdd5d36ac919cd17f63c0..858fd73e0ac3a92fe402001d4796eb86945f61b0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -145,12 +145,10 @@ enum {
  * INTF sub-blocks
  * @DPU_INTF_INPUT_CTRL             Supports the setting of pp block from which
  *                                  pixel data arrives to this INTF
- * @DPU_INTF_STATUS_SUPPORTED       INTF block has INTF_STATUS register
  * @DPU_INTF_MAX
  */
 enum {
 	DPU_INTF_INPUT_CTRL = 0x1,
-	DPU_INTF_STATUS_SUPPORTED,
 	DPU_INTF_MAX
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
index 8f9733aad2dec3a9b5464d55b00f350348842911..54c2e984ef0ce604e3eda49595d2816ea41bd7fd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
@@ -308,9 +308,8 @@ static void dpu_hw_intf_get_status(
 		struct dpu_hw_intf_status *s)
 {
 	struct dpu_hw_blk_reg_map *c = &intf->hw;
-	unsigned long cap = intf->cap->features;
 
-	if (cap & BIT(DPU_INTF_STATUS_SUPPORTED))
+	if (intf->mdss_ver->core_major_ver >= 5)
 		s->is_en = DPU_REG_READ(c, INTF_STATUS) & BIT(0);
 	else
 		s->is_en = DPU_REG_READ(c, INTF_TIMING_ENGINE_EN);

-- 
2.39.5

