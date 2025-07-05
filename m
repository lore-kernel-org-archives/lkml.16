Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9505923D282
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 10:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751709763; cv=none; b=SiIvyIJu5u803qgcHnsjj0Qe9S4FoIcF4nzdfnsIhbpXNMBFZbIdSJEHu8eQG7MxkCB6iQpju2dj8/4Nhbcdn5sZCRrbcf3z+5fT+HNJopCfXOWGWvT4REjOWFvZ9Gar9+jBonV1usMk1cW5jp0XNW1iZG89kxxm6OhtMEpucdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751709763; c=relaxed/simple;
	bh=7I9SSPEIQPGrnlSdPo9OvtX0dZETia0LBeX4obv+vMM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ikpXOicMTm48LonTbyeOzAfQcJsqUUryY00Ck7SkNEnztHpPAyrWjwjVzI/wHUNw0WBZrSg1dn6X6nJnmiQ3P3abJzJ2bdk4MQEj4r64/ymqLXOCky9PuLG6sA3Ytmyol5wItQVTtSnOZ7m7QzwufQjfgTDtWRki+QcVmpwlBcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ggglFIcx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ggglFIcx"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5657suRa032380
	for <linux-kernel@vger.kernel.org>; Sat, 5 Jul 2025 10:02:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qr9nHXfoeeoP7fUi7W46pBoaSSHXj9P7KxRVEDWZdAM=; b=ggglFIcx/pxfroXC
	5pLzjdlKqy8JzrxWDTcgdk2k6qvEZ5aUwq7Y5qqKKzw8Sc8gOS7JZoCPu3sKApPJ
	nHNMSZfMp6P7fDLuw1cmRXoG4QQJmj3mSEaJAewMUtqsnOeaVxr0HlA7+eIjn/2g
	T23vDe8jE6hvamIL3N+ibRtwmnj/xcyS0acHnsjF+/Oy3hSF+cbWMfVxr3P6fARU
	+9JYlIu+L9VFMLyFx+E5emKotmeuiVSeBsZLYIS4Om4qTaiQBz6Q3xQ7oNxCOQVk
	LC8tmr/vfOlCUnq6pzX9Rpoll9dyHvocgFVRXswWAqwwX8Zu9L38KdpgTlutiXv7
	YCqMlA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pv4x8k0e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 05 Jul 2025 10:02:40 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c7c30d8986so473587785a.2
        for <linux-kernel@vger.kernel.org>; Sat, 05 Jul 2025 03:02:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751709759; x=1752314559;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qr9nHXfoeeoP7fUi7W46pBoaSSHXj9P7KxRVEDWZdAM=;
        b=woBsS7Gwj/Uj7hr6tE053E5RsLxg4kk0yrkC6kj77TmNiGh6l11+YybnBfzBvh02Vz
         Ab4UgUymt2f/YK4Gz19/JVST7IvhRFaXZgu1e50XQs1V83XYfXWBYVmk7ObI4hnpUWJn
         r2Y3hLZshlR8gJxny15/l2W0bngqTfrhepxBgq4kFQ0Ed+F8D2U1h1EpOTMHYgF3CYUH
         T/KznqynNDOm+pl6pbtedwXQObpIxl+tp0uncccrYUb7iZ8v8FaeMpm/j5k2FUmBdDL0
         c/RNSnV0T0mgPz9LLYOBJ0aScSwl0vkwfOILPOCf2AIC2v1zoNGLxZy12imaifDUP6PH
         28zQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7E0vm4SYQpY5NY7UFUjsb+IaB61Ac8cGoKslSXglkTMn02/XJfw16k1dtGyyi9pE0w0SeOdtfV4k33xU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/V5wKGlEFRUXkVaNchP+o5Opqe4TjCswR00eO/NSnBFkjtAEW
	ldj8qn5qQGR+wwck/9Cc0k4JePsWx7cewFVkUGWepyG99vqX7XawChg1GDKJyGRFCln0G9KEpsL
	5KFK50dyJ0kJzmSaXTBr/I6tom4KAS9XewZfV1xACuLZ7aW9ePWlev+9YL2ogsV6Xn7c=
X-Gm-Gg: ASbGnctpA6sLLSp/C6VVjSg8rdPeCXHq9Vs7x2yT9daESZ81+4tJv/sAAk+teeKTiZR
	nYAcCUSAdL8GNF296a5bccPeW3szKMJN+pUL+8bINrLEqeggC41jJyiQF+cO5f3lGp4LEi3s/EG
	VkF8O90gc8ey/BO8yNvDtO9mZCdhQCDh3U25Aa+Ye/YqEKQiEMKkPENgPGIcQOe8EfqwThvRLZx
	Bt5GoBc0LQGVgEh0XV/oQ9ferZEQEA5q2X8ld5Ugz2EpyvP86rmu55WeOh5Re8oehimHRzXNYzQ
	wcoVbe3vdJBdlCThO9XztVLbKJTC0Gqi3rak/q+odMBSPyR+wGWupbTFwIZezGVqwxVYERpfaZ8
	TIQhibqxB8S/ne0wL4g0ovhFjsT+5n3ifMv4=
X-Received: by 2002:a05:620a:172b:b0:7d4:43cf:68e with SMTP id af79cd13be357-7d5ef9b3303mr240401785a.17.1751709759240;
        Sat, 05 Jul 2025 03:02:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHf15hUu+CzItaoLcjAJ84fZWCepzL5EYNjpa61wso8RvEzFOqMDAKTjeUuqPlu449XIEuPoA==
X-Received: by 2002:a05:620a:172b:b0:7d4:43cf:68e with SMTP id af79cd13be357-7d5ef9b3303mr240396385a.17.1751709758572;
        Sat, 05 Jul 2025 03:02:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556384c0558sm526274e87.209.2025.07.05.03.02.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 03:02:36 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 05 Jul 2025 13:02:28 +0300
Subject: [PATCH v4 03/10] drm/msm/mdp4: get rid of mdp4_crtc.id
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250705-msm-gpu-split-v4-3-fb470c481131@oss.qualcomm.com>
References: <20250705-msm-gpu-split-v4-0-fb470c481131@oss.qualcomm.com>
In-Reply-To: <20250705-msm-gpu-split-v4-0-fb470c481131@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3130;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=7I9SSPEIQPGrnlSdPo9OvtX0dZETia0LBeX4obv+vMM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoaPgzNe0zg+PB6a9Y3of8MKVqFfobTxyaNcWi2
 nn50KXTRmqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaGj4MwAKCRCLPIo+Aiko
 1RREB/9OJB18bPIclT1wQ2jGSYAG+LMaE5XWr4+F1sbgGdKNnWV6pCa2cT7yR2vPhAvK7ES37OP
 ywXc4klooDiRDycpDQ4u8w90zVU1SgVmdDD/80bBOwmXMQ9EsniGpil30R5QfjvQD6CAh3VYlaR
 xMnTLMraL162cF/M6gFyQy+rZYQXsyPgzP3+nlevTYDDPYYwqjzEJlY6N+1MKXywMzeCF1HbcAn
 SmNFCh4nHglzNYW/i/0AlR7gUsPlf4BcxMzMQISTFD34VgF1I0SQdMASHK8/azSk997wnsD7JJ9
 RFbJW+eCVyUaVy8oaxGRCA10C+jRGcCOIKWWmOLhQ1MceZLF
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDA2NCBTYWx0ZWRfX5ZbSUMxhp1VP
 GnvCTEorPV0DmveFoXlW4zpGrHTjqIxK/77Nvu554PuVbElipVG6dnu4Tssd0Z4OCZXRj80Dx2W
 aKURxHN5ggwUkluLIAQar4O4om7UOA45sWrhxs1bhRQ3NChu3aSe1vdcl0M1BftLju4Rm0dNkcX
 5/odTKI6beCPdmA0xVxgHVltkCWK87Dkqp7AiDQfVmZIIYlxS49bSJQ/LMOg46ptBtaMnUm7qIr
 fokXRNa6jzHOV1Dk9k6wbPqTjl/oq86DLfu5AzMt2A7DTGgq9OpxOFZFfc3rt24RBrajxZGjTy3
 ohJlL/m90+q0p2dFZ3pePNB9n0FOI/FHxpjS0rd5nU+7yTWCqCde6dzTM7FP1R8OwmhL0pBhNi0
 zjA2MRy8kgWVLna0KKDL5mnXx8gvvn+0FYGp5Ee43y1AxnRdvGl09QVeJoPcRwUMpNlfzGIH
X-Proofpoint-ORIG-GUID: gGT1TJvkEycfyPblcp5ir99VC08TGLR_
X-Authority-Analysis: v=2.4 cv=DNCP4zNb c=1 sm=1 tr=0 ts=6868f840 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=JeS6effYNUkig2QXyjUA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: gGT1TJvkEycfyPblcp5ir99VC08TGLR_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015 phishscore=0
 malwarescore=0 mlxlogscore=957 mlxscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507050064

There is no reason to store CRTC id, it's a part of the drm_crtc. Drop
this member and use drm_crtc.name for the warning message.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c | 7 ++-----
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c  | 2 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h  | 2 +-
 3 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
index 2ee03ce2fd398be4f5b101be09c6dfb495324128..da53ca88251e7f184f4a7067fda16d6b426d3c49 100644
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
index 9acde91ad6c37369191e85820e58ee22892a61a5..6d938abe29ee7283de2b1535d3d0159bf09d6dff 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -339,7 +339,7 @@ static int modeset_init(struct mdp4_kms *mdp4_kms)
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

