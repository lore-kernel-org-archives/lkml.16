Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47DEE2DCC07
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 18:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750877920; cv=none; b=XzCTMeuYHx/BUtisWrsafae7NguPSS+c0ruwtnhGjTVRynCmoZ3FEYFR4vzOt6WuqtBFMrQDLrkLgHRCq0uSnQLo9Csi8Klm6TJamH5OJumglYKa+TJyCFTI5+J4Oa/F44WukaWBV32zEsirlH0Tz86LWqNCP0yOeN7HoXniKWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750877920; c=relaxed/simple;
	bh=ckoCa1/xzl9ludIfhHdUrw8hq3Oma0o6nVNB/YTPkEg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iiLWfqyahBSU7FMMCLUpOlNQZFMg1OaBoCXx+BLSrG/Ynpu7CID1FWKf8bbDj/fBIAhffV/KNJd37ReNVg4UewCcwNMQ6otRwCVavyfJEQSHO24VK9myjcwLO+e201CHatDdTmuFmMF8MRqhb8N7Zsv7rYCx4WyX5L1bfyi40kA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cp7vgtrr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cp7vgtrr"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PB1h90027614
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 18:58:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=nNsabTPQHzS
	iOOHIBX1s5pcQmikAfPXYam4gqeCq7oQ=; b=cp7vgtrr1pDubDeJd5z9pEP9bgy
	cnorbilbmtu+iNSseo56/C9aRGDeV/hKDfZ+HXyqkXYCNMvaF70bayfg8fpnz4pB
	fttqTutytYwI9T4OAyGLhhopH1/vEhk4OaO4hT4pJIxNu0xSfbV+XjaYuxcn2YnV
	D8fwYMl+iqmBGO4GZdA+X6qUxyOgirqqvEjwgGTal4PhEJBC70qAUGbGI1Y50Dzk
	BJxLUNFWjx5aoXXlfJFB3DuS3tn0PPrBMI3yhIlUZ+roDzW0tsefFH2dwy5vqiE6
	YqIQINyw8p0t1Z3x+V+h/FCumcnNLXWd0i5M/O71I7uH9VBPQ5xFkizepwg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbhqqded-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 18:58:37 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2349498f00eso10298855ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 11:58:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750877916; x=1751482716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nNsabTPQHzSiOOHIBX1s5pcQmikAfPXYam4gqeCq7oQ=;
        b=E8Q8BgHl1tBADJ8nDv8suEyXFZNuubBSHOiXyuvmONNyP2oAljqcd5WrNLExH4GQmT
         9r+c3PQ8BSoLL9SaT+dI0Hty/ubDFDKEBLUIgcFX0N1BSN/m5EOZMADB+dqHWumz71z1
         lArWa59/zzw7tgqLZmAS1OTeP6ZCze4N6MmDqmpN/KAsJZCsX75OTy2Nho/jv0jK9IH6
         tlyvFu3cXwYL4e0ocgTMSFMYApcoWFBA2Q1QzKmeTpAVi3fzBru6JMzhkG78a48I6OdF
         A2AuRmIHid6WRuRxLQseAne3D8VJKt4kJP/czwKbysvjTNEZ7bfgvjgVdagK+qoyegnq
         fbTg==
X-Forwarded-Encrypted: i=1; AJvYcCVJoaYvDb/Z2BlMjI9YRbr3N1AtKyWOsNwh0eXEUkFpVixLFY5EV+Q9jYHxj+jN7SQ6ZKGB8oL6yE4wUlA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2aOETDi9U8Vv5L90Mq26vM2oZ9qldj7ZGOx5rUdr6wC7TUw7+
	dVpsYXFESDMzZ1/YbyTvGoROj27PBdWlIoYvz4mVoOziUNc+f+G2rxqVzt09jx7A6tGoyALo+b5
	9cvspfOT+w+ZzFx9GLT7n6uawHtF7o/ll9hSwmG2BeTbaU17WJBKoSSXdtf6lXfCG2k4=
X-Gm-Gg: ASbGncsW1thcboUKaudOIi4AO9Pi8QJrhTXS3UB2S7bLuKNjGrCnq6SrnBn9q3yE3EI
	NVPiG+zLIKgrfz995jVlRIiOzkgNaz9k0keGxqTBTyxEJiWsjt2BljrqioOqpY5UYb8ADMWm3DQ
	TYiA1f08+E1qNddBEjo0FY+zBN4Y3coujY1LRTrYN54ORp3o2JCSuS1gQuMfjvn+BYp2oDkO5NI
	RxYuhGZg/qVZSMyUIdkETyO3Sf+OJS3AzISG4jx4aAjwg1uqE62wptWBwhB8L49JVHPEoH4vUMI
	ryNzbbrnYIO6bWbQRDcJc5rgR0NP7Cv2
X-Received: by 2002:a17:903:19cb:b0:231:c89f:4e94 with SMTP id d9443c01a7336-2390a54135bmr9756155ad.21.1750877915802;
        Wed, 25 Jun 2025 11:58:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFhiU7jkLkdBDTXE8Vgl8GgbUZ4C3Lpu1KZ/J8gxUpCHJzD9NEDN1Cu6PowCQ3IgtMk+3/PVg==
X-Received: by 2002:a17:903:19cb:b0:231:c89f:4e94 with SMTP id d9443c01a7336-2390a54135bmr9755755ad.21.1750877915243;
        Wed, 25 Jun 2025 11:58:35 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d8610ac2sm144184265ad.135.2025.06.25.11.58.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 11:58:34 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Connor Abbott <cwabbott0@gmail.com>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Jun Nie <jun.nie@linaro.org>, linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v7 11/42] drm/msm: Stop passing vm to msm_framebuffer
Date: Wed, 25 Jun 2025 11:47:04 -0700
Message-ID: <20250625184918.124608-12-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250625184918.124608-1-robin.clark@oss.qualcomm.com>
References: <20250625184918.124608-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: E-Uuo5iwh8odD4_r8cyyc1NpBAr-U0hR
X-Authority-Analysis: v=2.4 cv=Id+HWXqa c=1 sm=1 tr=0 ts=685c46dd cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=HL1_eh3RQQ0Sznupcm4A:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: E-Uuo5iwh8odD4_r8cyyc1NpBAr-U0hR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDE0MyBTYWx0ZWRfX+dRzgxUBfPL8
 okwiHuRlKc8uacL/gs/no8ASEJbxbxL8rqkUJPH2+cKZYIJjKhXOrdlD52idVwW2viscz3wBuPw
 /uRZ/RNpQvRrQLChXlzyCOieBwrb2Gks7thNViX9G1MAULTDg6CLuJk1FypwOvWryt5ChXpbqWG
 qnVaBt6FAQ6Z+YodK0TGmCm7CsTHyUmHHllBorJsDleJoM5b42+IVHMz+CH+TS7yxdt9Qx50Pmm
 CfF2ziARfJVrNuIxGm6UHE6eOadpWW+ZxtuAA6LoNX0BukYF2pjzqhJ0wO3uh7iCMHSk5qqYB6K
 GmBB/RykIG8x6+oZUiPkNiAYX9TKgjLTQ4BWPmMHr3SWpJRwWFsvIQHmXycBvTVhzkJ2Zq4gEXQ
 BYSPEz0TCZpnpt4DhvumitTZciZ9ogGggN400ZPsV3bZ57NCKo14JLBG/ruNyRblW+TIqHwC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_06,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 mlxlogscore=999 phishscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506250143

The fb only deals with kms->vm, so make that explicit.  This will start
letting us refcount the # of times the fb is pinned, so we can only
unpin the vma after last user of the fb is done.  Having a single
reference count really only works if there is only a single vm.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   | 11 +++-------
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c   | 18 +++++++----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h   |  3 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     | 20 ++++++-------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h     |  2 --
 drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c    | 18 ++++++-----------
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c    | 18 ++++++-----------
 drivers/gpu/drm/msm/msm_drv.h                 |  9 +++------
 drivers/gpu/drm/msm/msm_fb.c                  | 15 +++++++-------
 9 files changed, 39 insertions(+), 75 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
index 32e208ee946d..9a54da1c9e3c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
@@ -566,7 +566,6 @@ static void dpu_encoder_phys_wb_prepare_wb_job(struct dpu_encoder_phys *phys_enc
 		struct drm_writeback_job *job)
 {
 	const struct msm_format *format;
-	struct msm_gem_vm *vm;
 	struct dpu_hw_wb_cfg *wb_cfg;
 	int ret;
 	struct dpu_encoder_phys_wb *wb_enc = to_dpu_encoder_phys_wb(phys_enc);
@@ -576,13 +575,12 @@ static void dpu_encoder_phys_wb_prepare_wb_job(struct dpu_encoder_phys *phys_enc
 
 	wb_enc->wb_job = job;
 	wb_enc->wb_conn = job->connector;
-	vm = phys_enc->dpu_kms->base.vm;
 
 	wb_cfg = &wb_enc->wb_cfg;
 
 	memset(wb_cfg, 0, sizeof(struct dpu_hw_wb_cfg));
 
-	ret = msm_framebuffer_prepare(job->fb, vm, false);
+	ret = msm_framebuffer_prepare(job->fb, false);
 	if (ret) {
 		DPU_ERROR("prep fb failed, %d\n", ret);
 		return;
@@ -596,7 +594,7 @@ static void dpu_encoder_phys_wb_prepare_wb_job(struct dpu_encoder_phys *phys_enc
 		return;
 	}
 
-	dpu_format_populate_addrs(vm, job->fb, &wb_cfg->dest);
+	dpu_format_populate_addrs(job->fb, &wb_cfg->dest);
 
 	wb_cfg->dest.width = job->fb->width;
 	wb_cfg->dest.height = job->fb->height;
@@ -619,14 +617,11 @@ static void dpu_encoder_phys_wb_cleanup_wb_job(struct dpu_encoder_phys *phys_enc
 		struct drm_writeback_job *job)
 {
 	struct dpu_encoder_phys_wb *wb_enc = to_dpu_encoder_phys_wb(phys_enc);
-	struct msm_gem_vm *vm;
 
 	if (!job->fb)
 		return;
 
-	vm = phys_enc->dpu_kms->base.vm;
-
-	msm_framebuffer_cleanup(job->fb, vm, false);
+	msm_framebuffer_cleanup(job->fb, false);
 	wb_enc->wb_job = NULL;
 	wb_enc->wb_conn = NULL;
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
index d115b79af771..b0d585c5315c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
@@ -274,15 +274,14 @@ int dpu_format_populate_plane_sizes(
 	return _dpu_format_populate_plane_sizes_linear(fmt, fb, layout);
 }
 
-static void _dpu_format_populate_addrs_ubwc(struct msm_gem_vm *vm,
-					    struct drm_framebuffer *fb,
+static void _dpu_format_populate_addrs_ubwc(struct drm_framebuffer *fb,
 					    struct dpu_hw_fmt_layout *layout)
 {
 	const struct msm_format *fmt;
 	uint32_t base_addr = 0;
 	bool meta;
 
-	base_addr = msm_framebuffer_iova(fb, vm, 0);
+	base_addr = msm_framebuffer_iova(fb, 0);
 
 	fmt = msm_framebuffer_format(fb);
 	meta = MSM_FORMAT_IS_UBWC(fmt);
@@ -355,26 +354,23 @@ static void _dpu_format_populate_addrs_ubwc(struct msm_gem_vm *vm,
 	}
 }
 
-static void _dpu_format_populate_addrs_linear(struct msm_gem_vm *vm,
-					      struct drm_framebuffer *fb,
+static void _dpu_format_populate_addrs_linear(struct drm_framebuffer *fb,
 					      struct dpu_hw_fmt_layout *layout)
 {
 	unsigned int i;
 
 	/* Populate addresses for simple formats here */
 	for (i = 0; i < layout->num_planes; ++i)
-		layout->plane_addr[i] = msm_framebuffer_iova(fb, vm, i);
+		layout->plane_addr[i] = msm_framebuffer_iova(fb, i);
 	}
 
 /**
  * dpu_format_populate_addrs - populate buffer addresses based on
  *                     mmu, fb, and format found in the fb
- * @vm:                address space pointer
  * @fb:                framebuffer pointer
  * @layout:            format layout structure to populate
  */
-void dpu_format_populate_addrs(struct msm_gem_vm *vm,
-			       struct drm_framebuffer *fb,
+void dpu_format_populate_addrs(struct drm_framebuffer *fb,
 			       struct dpu_hw_fmt_layout *layout)
 {
 	const struct msm_format *fmt;
@@ -384,7 +380,7 @@ void dpu_format_populate_addrs(struct msm_gem_vm *vm,
 	/* Populate the addresses given the fb */
 	if (MSM_FORMAT_IS_UBWC(fmt) ||
 			MSM_FORMAT_IS_TILE(fmt))
-		_dpu_format_populate_addrs_ubwc(vm, fb, layout);
+		_dpu_format_populate_addrs_ubwc(fb, layout);
 	else
-		_dpu_format_populate_addrs_linear(vm, fb, layout);
+		_dpu_format_populate_addrs_linear(fb, layout);
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h
index 989f3e13c497..dc03f522e616 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h
@@ -31,8 +31,7 @@ static inline bool dpu_find_format(u32 format, const u32 *supported_formats,
 	return false;
 }
 
-void dpu_format_populate_addrs(struct msm_gem_vm *vm,
-			       struct drm_framebuffer *fb,
+void dpu_format_populate_addrs(struct drm_framebuffer *fb,
 			       struct dpu_hw_fmt_layout *layout);
 
 int dpu_format_populate_plane_sizes(
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 2640ab9e6e90..8f5f7cc27215 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -646,7 +646,6 @@ static int dpu_plane_prepare_fb(struct drm_plane *plane,
 	struct drm_framebuffer *fb = new_state->fb;
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
 	struct dpu_plane_state *pstate = to_dpu_plane_state(new_state);
-	struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
 	int ret;
 
 	if (!new_state->fb)
@@ -654,9 +653,6 @@ static int dpu_plane_prepare_fb(struct drm_plane *plane,
 
 	DPU_DEBUG_PLANE(pdpu, "FB[%u]\n", fb->base.id);
 
-	/* cache vm */
-	pstate->vm = kms->base.vm;
-
 	/*
 	 * TODO: Need to sort out the msm_framebuffer_prepare() call below so
 	 *       we can use msm_atomic_prepare_fb() instead of doing the
@@ -664,13 +660,10 @@ static int dpu_plane_prepare_fb(struct drm_plane *plane,
 	 */
 	drm_gem_plane_helper_prepare_fb(plane, new_state);
 
-	if (pstate->vm) {
-		ret = msm_framebuffer_prepare(new_state->fb,
-				pstate->vm, pstate->needs_dirtyfb);
-		if (ret) {
-			DPU_ERROR("failed to prepare framebuffer\n");
-			return ret;
-		}
+	ret = msm_framebuffer_prepare(new_state->fb, pstate->needs_dirtyfb);
+	if (ret) {
+		DPU_ERROR("failed to prepare framebuffer\n");
+		return ret;
 	}
 
 	return 0;
@@ -689,8 +682,7 @@ static void dpu_plane_cleanup_fb(struct drm_plane *plane,
 
 	DPU_DEBUG_PLANE(pdpu, "FB[%u]\n", old_state->fb->base.id);
 
-	msm_framebuffer_cleanup(old_state->fb, old_pstate->vm,
-				old_pstate->needs_dirtyfb);
+	msm_framebuffer_cleanup(old_state->fb, old_pstate->needs_dirtyfb);
 }
 
 static int dpu_plane_check_inline_rotation(struct dpu_plane *pdpu,
@@ -1353,7 +1345,7 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane,
 	pstate->needs_qos_remap |= (is_rt_pipe != pdpu->is_rt_pipe);
 	pdpu->is_rt_pipe = is_rt_pipe;
 
-	dpu_format_populate_addrs(pstate->vm, new_state->fb, &pstate->layout);
+	dpu_format_populate_addrs(new_state->fb, &pstate->layout);
 
 	DPU_DEBUG_PLANE(pdpu, "FB[%u] " DRM_RECT_FP_FMT "->crtc%u " DRM_RECT_FMT
 			", %p4cc ubwc %d\n", fb->base.id, DRM_RECT_FP_ARG(&state->src),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
index 3578f52048a5..a3a6e9028333 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
@@ -17,7 +17,6 @@
 /**
  * struct dpu_plane_state: Define dpu extension of drm plane state object
  * @base:	base drm plane state object
- * @vm:	pointer to address space for input/output buffers
  * @pipe:	software pipe description
  * @r_pipe:	software pipe description of the second pipe
  * @pipe_cfg:	software pipe configuration
@@ -34,7 +33,6 @@
  */
 struct dpu_plane_state {
 	struct drm_plane_state base;
-	struct msm_gem_vm *vm;
 	struct dpu_sw_pipe pipe;
 	struct dpu_sw_pipe r_pipe;
 	struct dpu_sw_pipe_cfg pipe_cfg;
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c
index 7743be6167f8..098c3b5ff2b2 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c
@@ -79,30 +79,25 @@ static const struct drm_plane_funcs mdp4_plane_funcs = {
 static int mdp4_plane_prepare_fb(struct drm_plane *plane,
 				 struct drm_plane_state *new_state)
 {
-	struct msm_drm_private *priv = plane->dev->dev_private;
-	struct msm_kms *kms = priv->kms;
-
 	if (!new_state->fb)
 		return 0;
 
 	drm_gem_plane_helper_prepare_fb(plane, new_state);
 
-	return msm_framebuffer_prepare(new_state->fb, kms->vm, false);
+	return msm_framebuffer_prepare(new_state->fb, false);
 }
 
 static void mdp4_plane_cleanup_fb(struct drm_plane *plane,
 				  struct drm_plane_state *old_state)
 {
 	struct mdp4_plane *mdp4_plane = to_mdp4_plane(plane);
-	struct mdp4_kms *mdp4_kms = get_kms(plane);
-	struct msm_kms *kms = &mdp4_kms->base.base;
 	struct drm_framebuffer *fb = old_state->fb;
 
 	if (!fb)
 		return;
 
 	DBG("%s: cleanup: FB[%u]", mdp4_plane->name, fb->base.id);
-	msm_framebuffer_cleanup(fb, kms->vm, false);
+	msm_framebuffer_cleanup(fb, false);
 }
 
 
@@ -141,7 +136,6 @@ static void mdp4_plane_set_scanout(struct drm_plane *plane,
 {
 	struct mdp4_plane *mdp4_plane = to_mdp4_plane(plane);
 	struct mdp4_kms *mdp4_kms = get_kms(plane);
-	struct msm_kms *kms = &mdp4_kms->base.base;
 	enum mdp4_pipe pipe = mdp4_plane->pipe;
 
 	mdp4_write(mdp4_kms, REG_MDP4_PIPE_SRC_STRIDE_A(pipe),
@@ -153,13 +147,13 @@ static void mdp4_plane_set_scanout(struct drm_plane *plane,
 			MDP4_PIPE_SRC_STRIDE_B_P3(fb->pitches[3]));
 
 	mdp4_write(mdp4_kms, REG_MDP4_PIPE_SRCP0_BASE(pipe),
-			msm_framebuffer_iova(fb, kms->vm, 0));
+			msm_framebuffer_iova(fb, 0));
 	mdp4_write(mdp4_kms, REG_MDP4_PIPE_SRCP1_BASE(pipe),
-			msm_framebuffer_iova(fb, kms->vm, 1));
+			msm_framebuffer_iova(fb, 1));
 	mdp4_write(mdp4_kms, REG_MDP4_PIPE_SRCP2_BASE(pipe),
-			msm_framebuffer_iova(fb, kms->vm, 2));
+			msm_framebuffer_iova(fb, 2));
 	mdp4_write(mdp4_kms, REG_MDP4_PIPE_SRCP3_BASE(pipe),
-			msm_framebuffer_iova(fb, kms->vm, 3));
+			msm_framebuffer_iova(fb, 3));
 }
 
 static void mdp4_write_csc_config(struct mdp4_kms *mdp4_kms,
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
index 9f68a4747203..7c790406d533 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
@@ -135,8 +135,6 @@ static const struct drm_plane_funcs mdp5_plane_funcs = {
 static int mdp5_plane_prepare_fb(struct drm_plane *plane,
 				 struct drm_plane_state *new_state)
 {
-	struct msm_drm_private *priv = plane->dev->dev_private;
-	struct msm_kms *kms = priv->kms;
 	bool needs_dirtyfb = to_mdp5_plane_state(new_state)->needs_dirtyfb;
 
 	if (!new_state->fb)
@@ -144,14 +142,12 @@ static int mdp5_plane_prepare_fb(struct drm_plane *plane,
 
 	drm_gem_plane_helper_prepare_fb(plane, new_state);
 
-	return msm_framebuffer_prepare(new_state->fb, kms->vm, needs_dirtyfb);
+	return msm_framebuffer_prepare(new_state->fb, needs_dirtyfb);
 }
 
 static void mdp5_plane_cleanup_fb(struct drm_plane *plane,
 				  struct drm_plane_state *old_state)
 {
-	struct mdp5_kms *mdp5_kms = get_kms(plane);
-	struct msm_kms *kms = &mdp5_kms->base.base;
 	struct drm_framebuffer *fb = old_state->fb;
 	bool needed_dirtyfb = to_mdp5_plane_state(old_state)->needs_dirtyfb;
 
@@ -159,7 +155,7 @@ static void mdp5_plane_cleanup_fb(struct drm_plane *plane,
 		return;
 
 	DBG("%s: cleanup: FB[%u]", plane->name, fb->base.id);
-	msm_framebuffer_cleanup(fb, kms->vm, needed_dirtyfb);
+	msm_framebuffer_cleanup(fb, needed_dirtyfb);
 }
 
 static int mdp5_plane_atomic_check_with_state(struct drm_crtc_state *crtc_state,
@@ -467,8 +463,6 @@ static void set_scanout_locked(struct mdp5_kms *mdp5_kms,
 			       enum mdp5_pipe pipe,
 			       struct drm_framebuffer *fb)
 {
-	struct msm_kms *kms = &mdp5_kms->base.base;
-
 	mdp5_write(mdp5_kms, REG_MDP5_PIPE_SRC_STRIDE_A(pipe),
 			MDP5_PIPE_SRC_STRIDE_A_P0(fb->pitches[0]) |
 			MDP5_PIPE_SRC_STRIDE_A_P1(fb->pitches[1]));
@@ -478,13 +472,13 @@ static void set_scanout_locked(struct mdp5_kms *mdp5_kms,
 			MDP5_PIPE_SRC_STRIDE_B_P3(fb->pitches[3]));
 
 	mdp5_write(mdp5_kms, REG_MDP5_PIPE_SRC0_ADDR(pipe),
-			msm_framebuffer_iova(fb, kms->vm, 0));
+			msm_framebuffer_iova(fb, 0));
 	mdp5_write(mdp5_kms, REG_MDP5_PIPE_SRC1_ADDR(pipe),
-			msm_framebuffer_iova(fb, kms->vm, 1));
+			msm_framebuffer_iova(fb, 1));
 	mdp5_write(mdp5_kms, REG_MDP5_PIPE_SRC2_ADDR(pipe),
-			msm_framebuffer_iova(fb, kms->vm, 2));
+			msm_framebuffer_iova(fb, 2));
 	mdp5_write(mdp5_kms, REG_MDP5_PIPE_SRC3_ADDR(pipe),
-			msm_framebuffer_iova(fb, kms->vm, 3));
+			msm_framebuffer_iova(fb, 3));
 }
 
 /* Note: mdp5_plane->pipe_lock must be locked */
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index ad509403f072..e4c57deaa1f9 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -251,12 +251,9 @@ struct drm_gem_object *msm_gem_prime_import_sg_table(struct drm_device *dev,
 int msm_gem_prime_pin(struct drm_gem_object *obj);
 void msm_gem_prime_unpin(struct drm_gem_object *obj);
 
-int msm_framebuffer_prepare(struct drm_framebuffer *fb,
-		struct msm_gem_vm *vm, bool needs_dirtyfb);
-void msm_framebuffer_cleanup(struct drm_framebuffer *fb,
-		struct msm_gem_vm *vm, bool needed_dirtyfb);
-uint32_t msm_framebuffer_iova(struct drm_framebuffer *fb,
-		struct msm_gem_vm *vm, int plane);
+int msm_framebuffer_prepare(struct drm_framebuffer *fb, bool needs_dirtyfb);
+void msm_framebuffer_cleanup(struct drm_framebuffer *fb, bool needed_dirtyfb);
+uint32_t msm_framebuffer_iova(struct drm_framebuffer *fb, int plane);
 struct drm_gem_object *msm_framebuffer_bo(struct drm_framebuffer *fb, int plane);
 const struct msm_format *msm_framebuffer_format(struct drm_framebuffer *fb);
 struct drm_framebuffer *msm_framebuffer_create(struct drm_device *dev,
diff --git a/drivers/gpu/drm/msm/msm_fb.c b/drivers/gpu/drm/msm/msm_fb.c
index 6df318b73534..8a3b88130f4d 100644
--- a/drivers/gpu/drm/msm/msm_fb.c
+++ b/drivers/gpu/drm/msm/msm_fb.c
@@ -75,10 +75,10 @@ void msm_framebuffer_describe(struct drm_framebuffer *fb, struct seq_file *m)
 
 /* prepare/pin all the fb's bo's for scanout.
  */
-int msm_framebuffer_prepare(struct drm_framebuffer *fb,
-		struct msm_gem_vm *vm,
-		bool needs_dirtyfb)
+int msm_framebuffer_prepare(struct drm_framebuffer *fb, bool needs_dirtyfb)
 {
+	struct msm_drm_private *priv = fb->dev->dev_private;
+	struct msm_gem_vm *vm = priv->kms->vm;
 	struct msm_framebuffer *msm_fb = to_msm_framebuffer(fb);
 	int ret, i, n = fb->format->num_planes;
 
@@ -98,10 +98,10 @@ int msm_framebuffer_prepare(struct drm_framebuffer *fb,
 	return 0;
 }
 
-void msm_framebuffer_cleanup(struct drm_framebuffer *fb,
-		struct msm_gem_vm *vm,
-		bool needed_dirtyfb)
+void msm_framebuffer_cleanup(struct drm_framebuffer *fb, bool needed_dirtyfb)
 {
+	struct msm_drm_private *priv = fb->dev->dev_private;
+	struct msm_gem_vm *vm = priv->kms->vm;
 	struct msm_framebuffer *msm_fb = to_msm_framebuffer(fb);
 	int i, n = fb->format->num_planes;
 
@@ -115,8 +115,7 @@ void msm_framebuffer_cleanup(struct drm_framebuffer *fb,
 		memset(msm_fb->iova, 0, sizeof(msm_fb->iova));
 }
 
-uint32_t msm_framebuffer_iova(struct drm_framebuffer *fb,
-		struct msm_gem_vm *vm, int plane)
+uint32_t msm_framebuffer_iova(struct drm_framebuffer *fb, int plane)
 {
 	struct msm_framebuffer *msm_fb = to_msm_framebuffer(fb);
 	return msm_fb->iova[plane] + fb->offsets[plane];
-- 
2.49.0

