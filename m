Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB2A221FB7
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745487048; cv=none; b=MaLfzgSuJ8f90Ma/zP4VeviA2NuSxOQxHtr0i6Hgq9Jm7KqQMhLzFXnxJ0jjimu/Gh/OYwiZvyLXT77dg5MOZNQj6En3JNn4Ep2D6KqjYmjrRSJbIJncUruSYbwKFUH1WyomX1OOu3JtIun1k8GNAeSyElgF98WOsMbnBkjJeog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745487048; c=relaxed/simple;
	bh=U4GL5zF173e2x4GPZaOKTDYieJIngsEi0ILheHs1NI4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qTfrWRrvxnbRCJHsJARrR9R21lIb/KLB3rrrqVT9HoXdej7kKrQKH0VLlbxlrAeI4f6asdoAvEca2ZFY3EayDRD7Rt5edwdf3XOU7D5BKaBMXb1XFK2Wid8eWf5/zkZuGbHN62/e5QhfL8Cnl9BR6+W1ByIDJnGjQzp33EzCnQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VdSBPqBg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VdSBPqBg"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0F6Q2028369
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:30:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6bD19mWyyeRl2BnZqRF5RUcMoFf4DqIr+Rm3GIwm2h8=; b=VdSBPqBgg3tzAqgX
	0YnEqidQ9QmPSOkcBt5kulYTuvA7kzTKfasC02wwFqGYM2letFkH+TQBxGNZ57iV
	drPhBVJp5qGazmjJG3HInJdoS0RLPWNmL77qoY3Uu/KhX7tdceXHYPEXdGsBWwkb
	CCPWGvQsUa+hVwth2J5rZhH+mvkNGbtxNYCHVsMlZdT8eUffv3Pl+Ux4QwDk39s/
	1jQY/apF1BH4ENybPcPG852phIafvl+jULYEqZfqZjrjrAy6/mkDkQ+eKmEIq+ZM
	nza21sbIqaeIpjhygMmkBBWmpYuqRq5/4A9onOoK4SaNhxfqmLbfl+Na/QLMDuRy
	CoA4Pw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jgy4yxw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:30:44 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c54e7922a1so161946385a.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 02:30:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745487044; x=1746091844;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6bD19mWyyeRl2BnZqRF5RUcMoFf4DqIr+Rm3GIwm2h8=;
        b=E/iKE8pGH5RMc8ZC00R/dRnMHfQfHAPS8vbvNDacLchVycdNmX7hdIA9+qbl6fU1RS
         Csa5j+lM8/WpDbvZn6hyNE5bq9oTuQyle8QNB7cRpx9hiNc1zoREPizOi5R6QmuyStGs
         TQ1yrWvh9dk8FdhHiTuh6Lc8dEks/4nz5NlkPrJ+KBl+TLunPySQzMsPyEg97SFV6027
         5jZ9Di4IuPh2JQBaj8Q6LskHgAGLrUujqGbJ0ejONW0CX+8OeChsS7deFWKQ1Rt6Tk0h
         ixTkORHDJwJ5CsRQVo637cWCYt/aRDVUMC09bgcxrVD7JE5Ssh1OQGbVJ853R9IlqFwa
         aX8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWC3NgoHmZ7MAB9m2CAcMd5sAraRwdxp+mDNGPGT/4TrDDRz351LjeMmrDcuBe81jWybpwtCrgYl4lJht0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8g1U7ZgR97RpHGJeFHvTYpEiS/uG1xK8vmv8+imK8oITDIqMQ
	Nn1fujaQYg/+JFQX5pAiLWafeUEV18pObw7rbg5AAee/V1G3/GKMKBAUiGn+LyJtazZvLiPHpSt
	+sS/fGlAwvm91Ngji4WJMrayobFJCZDzYG7GTlKDCWmOHORxtHxvg/nXUMGd6Lzw=
X-Gm-Gg: ASbGncs4rYHgd4CC63z3YSOC0xITy6+jzZniwqlzH3MAoYbaqHP6Nc9OSNAWq6xx0OS
	XcsIJEH/uVD9hB97HPsRcaS5N0I3mAnKiJT926WjqXu4nRPbhhJEGZjiDM+i/XGCKzj9aIZPSLT
	09FjkOLx5ZjATvk3tmd0nNxNmnLmf8V0Gg8yr9cdMP4B7GCN22uKviFcamjnVOjD+ZcVnF2sFoz
	tn19C9zX97Q5QpxCYVysJbqlpGF1Gfi+PrURw5LvkyXrUwgrTITGygweKoAVS8Sf1wbUom6BYlS
	eDuZzl0NAPU6iRgy4vLb3rcciJeMDmslChE5uPYX7PyWJZ6zA2qZmFVrTa3oNqPgtQx/IQsakDg
	qC80O3Rw9WWA9stv/0+YnjVoS
X-Received: by 2002:a05:620a:248e:b0:7c0:c046:7c6b with SMTP id af79cd13be357-7c956f4b1b0mr309106685a.53.1745487043814;
        Thu, 24 Apr 2025 02:30:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGAwo3TGBB0JbKYaGM0Jh5jTBbjQoUKUqSjxZ/rWO3kT7qP1SCGWEJowM6QHyb0GtkW/P4jgQ==
X-Received: by 2002:a05:620a:248e:b0:7c0:c046:7c6b with SMTP id af79cd13be357-7c956f4b1b0mr309103285a.53.1745487043469;
        Thu, 24 Apr 2025 02:30:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317d1b9a304sm1820461fa.99.2025.04.24.02.30.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 02:30:42 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 12:30:15 +0300
Subject: [PATCH v3 11/33] drm/msm/dpu: get rid of
 DPU_CTL_DSPP_SUB_BLOCK_FLUSH
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-dpu-drop-features-v3-11-cdaca81d356f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2655;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=UKa7WiIdYlZA+i2dElAGlJso1hJFJoPQsInsDm2A0CU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoCgSsqIEafMwgDFJ9BeM4xMLeUsIlU/Y+LsPuC
 jeLsprgl4WJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAoErAAKCRCLPIo+Aiko
 1eLzB/9/MN/nCIlTddRpL8y8PUD9UWVVm1g/yG4CTqbexASMeX3PBht683qN5wR5d8s8zSZ3v2F
 2piE5d2FtnLewMmHgG/16+1gUDc1QN/YoBpymM8KQx0cI/1iCWagr7ilm3X+Smx0SEDlKm/6Dre
 pCg3TBtRtIH5vBKIKLzTm9L9/CTMSr6xfW96DKDkrJ2IUde/JRVwnIOUK3zTNu1pBn6SY8sUmDA
 /Pt9HxHKLIwRysczI90K89hgLH/9iV4euy/FXuoN7ZQNfJZMxi8uBnr1XbBNDkqnU6nIaIhTPuZ
 swLpHxOa1YpgT+fpViIPiqaDGa84+9qLm/KCPio/rDZZF93d
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA2MyBTYWx0ZWRfX9FAeua0ZPend Dbra2Y+8egvKrwMWqx8Xuh27wvs/kqpbRIAl0+QnD1plTp5hAXgyUkbh41C5KxkKztv509fv2pQ P2aYsJW6rIqCsiO4wWWrlCv5+EI0KHtqh4IBG9147pNXvUfAdBboRgt+6RzVVeZ05vFPlMmsmmt
 e7wOZgD/JCfEUUB6VmVWLM+J/zdqloclADOOX66i+wgYwSZ1swaQ+MUrNisnzq9syEWQyprjoS+ iJoUeUXL7aWzQnMPIAc8ft5WVs+ZNsBfrlcrQA9QbRrmEqkRFq9PRgl+CQnxxv52+b/dNHphYFN 2imLb/pmapOEKv7w/rMOxFPdCt5B2ztTHYC7BEvJfMp5yThEV/Foak6AI0QUfv+On4dCMgKKaxx
 2KvdYUS0pf/XMOCWDZfA1gPXXLNWaHtZ6D4r4KxU70Y3Em9dwpMkfz+TxUHlCzwIZHPHDVrF
X-Proofpoint-GUID: Esb0lhT4zaGgaW8SpgefonF8_dO9cJNs
X-Proofpoint-ORIG-GUID: Esb0lhT4zaGgaW8SpgefonF8_dO9cJNs
X-Authority-Analysis: v=2.4 cv=M5VNKzws c=1 sm=1 tr=0 ts=680a04c4 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=qfl85FH2DSYpkZ7DoNYA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_04,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=999 malwarescore=0 impostorscore=0 clxscore=1015
 suspectscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240063

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Continue migration to the MDSS-revision based checks and replace
DPU_CTL_DSPP_SUB_BLOCK_FLUSH feature bit with the core_major_ver >= 7
check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 3 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c     | 2 +-
 3 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 3431b3c956486aee99664ea9b7c2e00f5c130b7f..a2dc353151f3e1a4cb8a9f4644e7fc2e037356a2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -111,8 +111,7 @@
 	(BIT(DPU_PINGPONG_DITHER) | BIT(DPU_PINGPONG_DSC))
 
 #define CTL_SC7280_MASK \
-	(BIT(DPU_CTL_VM_CFG) | \
-	 BIT(DPU_CTL_DSPP_SUB_BLOCK_FLUSH))
+	(BIT(DPU_CTL_VM_CFG))
 
 #define INTF_SC7180_MASK \
 	(BIT(DPU_INTF_INPUT_CTRL) | \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index ae168e73026d8ebbe605397c6bbd95552193498c..1c6be8f93b54f28d370a379d1edccd178fe3cf7b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -135,13 +135,11 @@ enum {
  * CTL sub-blocks
  * @DPU_CTL_SPLIT_DISPLAY:	CTL supports video mode split display
  * @DPU_CTL_VM_CFG:		CTL config to support multiple VMs
- * @DPU_CTL_DSPP_BLOCK_FLUSH:	CTL config to support dspp sub-block flush
  * @DPU_CTL_MAX
  */
 enum {
 	DPU_CTL_SPLIT_DISPLAY = 0x1,
 	DPU_CTL_VM_CFG,
-	DPU_CTL_DSPP_SUB_BLOCK_FLUSH,
 	DPU_CTL_MAX
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index 593da532d40042ca31fb452679d3de04c3b0d1a7..543fe12252b7887ce2bd28abafac3be7caf17ac4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -781,7 +781,7 @@ struct dpu_hw_ctl *dpu_hw_ctl_init(struct drm_device *dev,
 	c->ops.setup_blendstage = dpu_hw_ctl_setup_blendstage;
 	c->ops.update_pending_flush_sspp = dpu_hw_ctl_update_pending_flush_sspp;
 	c->ops.update_pending_flush_mixer = dpu_hw_ctl_update_pending_flush_mixer;
-	if (c->caps->features & BIT(DPU_CTL_DSPP_SUB_BLOCK_FLUSH))
+	if (mdss_ver->core_major_ver >= 7)
 		c->ops.update_pending_flush_dspp = dpu_hw_ctl_update_pending_flush_dspp_sub_blocks;
 	else
 		c->ops.update_pending_flush_dspp = dpu_hw_ctl_update_pending_flush_dspp;

-- 
2.39.5

