Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C73551ACEA6
	for <linux-kernel@vger.kernel.org>; Sat,  3 May 2025 07:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746256635; cv=none; b=RfIxKw/ibdLK2MsanKzrT3xyJHKZMtk5eu+2+UzjMjzZ0Lgj8Zp/jK1YhXS/+rxEobpoDwxyoxMsDokEYEX7N+OLKsr8tKqvMkBaGlQ0Mmg4znOw97TgittuSrTSgZGrCCSFB8pvy4xqnpFfGz46E/G4Gq1dWect5od/ovxSp1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746256635; c=relaxed/simple;
	bh=npSuxvWMmhzKLh8mAO06E84f1kOeMHWURDV7gpjmnuQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U641kjfMRbOQwC0b3IXkbcJcOPVD0kx3FvMWYFOWpjhsqGw/gRkPxN9a93eaSuVMA4zPwpPLlLqVUUliPfoLGrCubbLjVy6Guax9SLGrvI0kZbhNikRvkWM9KE25dBUQfilVIrNxp6CqjMam4lLaSwGPcvOhlgkcWfQ86eI0Qtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iRs2dOwM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iRs2dOwM"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5436DMHk029323
	for <linux-kernel@vger.kernel.org>; Sat, 3 May 2025 07:17:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R6N0tvqMMnaFd6rXphyiPbtd6QUTPIJgEbiauM+ZAzk=; b=iRs2dOwMq5IQqXmF
	KjALF2RGDnzu0JmOj2OA5fsPDQjdmzzlF1Q3cGTH5e9icMWt0Muq2htKsbpxKmCp
	k4/HYa+BZg0X9Amp7Uc2oWOcOUnhXcNfnGEhxjxEdNjOZ7og47o4byRINAgVFTCz
	iXMyuglhw03Je6IGvBwhZ9+3NpKmcpW20QjE0GHLbdTsWFP4yQ6uqSt6KAqayeFp
	pqtIUe2gM1y+F6p3s2HqYXNQvjAAiuH159ShXLV5Uik2HPCFb+/0yQk9qVYZtrtG
	iK2LmG9LYjSxKxDWcS93MaZMuEhoi6gzG05T7n+lb8hwNsFVvSXie/BBc7ynSXbi
	Wx443A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dce98571-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 03 May 2025 07:17:12 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5c9abdbd3so274539685a.1
        for <linux-kernel@vger.kernel.org>; Sat, 03 May 2025 00:17:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746256631; x=1746861431;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R6N0tvqMMnaFd6rXphyiPbtd6QUTPIJgEbiauM+ZAzk=;
        b=vO/wljeimU3vNFgBKgVPx31qEtQ/XGW2f+XCQksUuHhpHwF+OQ35IqeRRaPpjdtw+L
         GwJUjky7z3xSvpM+7JrNz/6ZPQwLuEi8BCUyqB07G5vhCDB6eB1murLUkr5YjN4oaqld
         BE/vRu+EfXJdDWCOyROQVLPNW/3lXOevkHI9L2Tigcj8lysbSNF1+tQQUl5VcJ27sEIg
         h4vLp83U0hyVzkSSQLAWeiFy0cPLnI8iMYwg+/axM7h08A8i6SJGEBSkqzC+492PhhyY
         oKN3EfpryU7T2tOcPUFQNebrrb2UFNGSThPL0fB8SmUj49Lifv0zL2swAbd8SLh3ZU0B
         mLyg==
X-Forwarded-Encrypted: i=1; AJvYcCUzAlZCsLv+Eo1lY0KGAUFJHjUcO2MXq2KDerO19hNzUS1C+sZ8qo7n5VTTz8mWhh1ZoLOAmeZnT1zqLdM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJ1W3hW91OqW/KsJio+jqzqV/CVyeHA1kqlxfZ0xDl4qVXe4rN
	1vJKbQeJDT11rHcooUCiBvWuEAGNfbCdoB+Rs3O02jRNJfPkVN2nDK1bwfngtVZe4nu/mSj9B4E
	g4Df+xrU+1vtGhPYIBSdjkFzML6Yl42DRaebEibxOeB/y0kDh11ZEPVTzNCCh57Y=
X-Gm-Gg: ASbGncuSWob8F5gUpE4Wa9lff+K0lt7oD1574zAtjeoTmIhHe1gKONjfHtTcV1kbAlm
	SLBKD9m0OCj5j0nDKBoPVhrgdZ7DZk4nzHXJPRedwWeJe7owavAK2S8qokZK1Jz/RrBqurQrTfU
	B4rntNr1egWmiYRXKz93i4GEF7plhJmLNHZW/Jt/Dt+RhQ8Az1EQElyTCp7j25BxDRTYI3Q72NO
	hDcH1li84uONw4o7kf0ooOIfIj1zlIK+5j73jCKbL2HvhtSREZWetw0bcUcVGFJTAhJWfoWSaAc
	leO7hEPS5vQyW2uESkc35gAboHxlPgqSLUxsX+6gkuHp0O+zH/w9fcBKSs4X6O2mix1S0Ca8CEO
	puYZmi4djAEvBtpHnnAY/ZTCK
X-Received: by 2002:a05:620a:f05:b0:7c5:4b91:6a44 with SMTP id af79cd13be357-7cae3a99ff9mr20444085a.19.1746256631329;
        Sat, 03 May 2025 00:17:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEO8pkqYTjfx0aYWe9ZJaRvk9TWmCpxmnFrPc/lMoywrhWLT1B4JmwtyoYh9Yf3IJ2pBAI5QQ==
X-Received: by 2002:a05:620a:f05:b0:7c5:4b91:6a44 with SMTP id af79cd13be357-7cae3a99ff9mr20441985a.19.1746256630977;
        Sat, 03 May 2025 00:17:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94c5557sm692816e87.84.2025.05.03.00.17.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 May 2025 00:17:09 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 03 May 2025 10:17:02 +0300
Subject: [PATCH v2 03/11] drm/msm/mdp4: get rid of mdp4_crtc.id
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250503-msm-gpu-split-v2-3-1292cba0f5ad@oss.qualcomm.com>
References: <20250503-msm-gpu-split-v2-0-1292cba0f5ad@oss.qualcomm.com>
In-Reply-To: <20250503-msm-gpu-split-v2-0-1292cba0f5ad@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3130;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=npSuxvWMmhzKLh8mAO06E84f1kOeMHWURDV7gpjmnuQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoFcLtto2vqAsBNHAxZIqy1DBh8+q2si90ocVxb
 arA9opd+w2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaBXC7QAKCRCLPIo+Aiko
 1R7OB/0W4E9JqKrkJs0hOC+CF5VnWoPE7MsErFPX5GI8LFHKdd88bcdMGp3fSWR+w5uWuNNUylw
 og+IFhEVLrHyTTn71oQnTOPWyvpdDS9McnBONDrBUrYTDep81AiMhEaUTpDBPoqG0JSfc8Ee3jQ
 p5gWy8MQRBtFUlD6/2fHor6yTRio+Av/4GFNLY7/lWIrtzJrEMOrPjU0us5tTdfM5QXgnn4HUcs
 5hnpD3Y+TZjO3a5UzorXPcsvnmip//CcuZNqHSNgD5FiUXMnsaDmzIJYp7OHCdxd0KnYihnTCMR
 E53tLbVTUm6fLnHNI+Vx7oRq8K5co5FK2uSdBfolUU8aM1ND
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAzMDA2MCBTYWx0ZWRfX1RcCZWKrteoo
 k7LqZ5vXRJu/ty6GAJn5O/pqASILzWXxuLa8MM04mVH57eQEsvhHFJsOIQbf0ssWoizryzi3eLC
 frvb/3BYxLxzlJCykv/h0WcXiefPH/h6tfzHwu9llxPvfJgp80m3KAzq8KhzIxMGfP/0gRQfeax
 WEHXgXi7PKfOSKRqNoeruQvECkFKlP8+S+1CPpvuEKHhrpuokF6BXl7nLsbPAMEnFyxhO/Sbdbs
 xpdctxEo1D3TXq/ngjubwqT+SkzjyWkw68tyUTZ1fqKHl/6dOD8gagdd0V65pUI/mHjqWE395r6
 h5+dTWPkda4DCGbkA+H+yF5S5a0x5jMsdNqjNxj95zC5EAbeAMocGcWlABb4C7VvkjRyEli/ZWE
 Vaed5Oj4+6QslpodMurOnWvRuSAntGNZXVyDN61DvSsXQAY67H1IliXBvfQeS9TmX6AZ+XMq
X-Proofpoint-ORIG-GUID: AgWNVdvnNGhhCf3s3ajJN3ovQ7dHJ-Gx
X-Authority-Analysis: v=2.4 cv=Qope3Uyd c=1 sm=1 tr=0 ts=6815c2f8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=JeS6effYNUkig2QXyjUA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: AgWNVdvnNGhhCf3s3ajJN3ovQ7dHJ-Gx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-03_03,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 adultscore=0 clxscore=1015
 malwarescore=0 bulkscore=0 suspectscore=0 impostorscore=0 phishscore=0
 mlxlogscore=971 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505030060

There is no reason to store CRTC id, it's a part of the drm_crtc. Drop
this member and use drm_crtc.name for the warning message.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c | 7 ++-----
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c  | 2 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h  | 2 +-
 3 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
index 5e1e62256c382426f70d21a5312fb40dda68d695..7596b45e234bdcf1b7cf37c4a8d39862f48819a8 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
@@ -17,7 +17,6 @@
 struct mdp4_crtc {
 	struct drm_crtc base;
 	char name[8];
-	int id;
 	int ovlp;
 	enum mdp4_dma dma;
 	bool enabled;
@@ -539,7 +538,7 @@ static void mdp4_crtc_wait_for_flush_done(struct drm_crtc *crtc)
 			mdp4_crtc->flushed_mask),
 		msecs_to_jiffies(50));
 	if (ret <= 0)
-		dev_warn(dev->dev, "vblank time out, crtc=%d\n", mdp4_crtc->id);
+		dev_warn(dev->dev, "vblank time out, crtc=%s\n", mdp4_crtc->base.name);
 
 	mdp4_crtc->flushed_mask = 0;
 
@@ -624,7 +623,7 @@ static void mdp4_crtc_flip_cleanup(struct drm_device *dev, void *ptr)
 
 /* initialize crtc */
 struct drm_crtc *mdp4_crtc_init(struct drm_device *dev,
-		struct drm_plane *plane, int id, int ovlp_id,
+		struct drm_plane *plane, int ovlp_id,
 		enum mdp4_dma dma_id)
 {
 	struct drm_crtc *crtc = NULL;
@@ -639,8 +638,6 @@ struct drm_crtc *mdp4_crtc_init(struct drm_device *dev,
 
 	crtc = &mdp4_crtc->base;
 
-	mdp4_crtc->id = id;
-
 	mdp4_crtc->ovlp = ovlp_id;
 	mdp4_crtc->dma = dma_id;
 
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index 7e942c1337b3597d557abd3e2e418c3958e5eb3f..00920bd44f6f73099ff2c293473e427caa49b873 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -338,7 +338,7 @@ static int modeset_init(struct mdp4_kms *mdp4_kms)
 			goto fail;
 		}
 
-		crtc  = mdp4_crtc_init(dev, plane, priv->num_crtcs, i,
+		crtc  = mdp4_crtc_init(dev, plane, i,
 				mdp4_crtcs[i]);
 		if (IS_ERR(crtc)) {
 			DRM_DEV_ERROR(dev->dev, "failed to construct crtc for %s\n",
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
index f9d988076337cb6fb63af8e76be59b2eb34ab327..fb348583dc84de5c57c77fdf246894e9334af514 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
@@ -185,7 +185,7 @@ void mdp4_crtc_set_config(struct drm_crtc *crtc, uint32_t config);
 void mdp4_crtc_set_intf(struct drm_crtc *crtc, enum mdp4_intf intf, int mixer);
 void mdp4_crtc_wait_for_commit_done(struct drm_crtc *crtc);
 struct drm_crtc *mdp4_crtc_init(struct drm_device *dev,
-		struct drm_plane *plane, int id, int ovlp_id,
+		struct drm_plane *plane, int ovlp_id,
 		enum mdp4_dma dma_id);
 
 long mdp4_dtv_round_pixclk(struct drm_encoder *encoder, unsigned long rate);

-- 
2.39.5

