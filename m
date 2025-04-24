Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E0A32356C7
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745487066; cv=none; b=ntOeWZJlQF62X99lneQ2hgtARsh22ntATehjd0Tv/326BxrLZNUr3qXR0SzPuGz6+aZqqCwg8ksiRmAixwq2D8xPr5hstF0wLoQhCqn2fDhwL8LMZzGzkhjALxbweWbvI3qFWs4WErr1M3cL6myAsCQyaZ0YaCYwnC9W80ENuG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745487066; c=relaxed/simple;
	bh=n5O4ww1n3+SMbT/TIK3jOGKdBMWSn6Zb2wDw1RidMsc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RBtYHri/h7DGk4zYQraONZm/vc0loSe9nIy2XhZplvzURlizbJI/j+7og+ZwoljWLVNZ41XPzhf90vgJR+Zt6063w2tEKOZKha8wnVujbQJawpc/646pnodqxX2jkB06nyS5wQA2WudNyMugpt9T2Y5TTTsD0WllC6vw3KYE2pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mkwe1y5Z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mkwe1y5Z"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0F7PC028374
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:31:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R2Plo6/QBFF1HAXNaurzwl09t9WnclC1kSkO0ycKczA=; b=Mkwe1y5ZnkG72rgn
	vZrFr5z2BbnLubYG2vjQEXph6IeivFM6tghKq+wMVNvpWWREHErpKQclfMjYSaQd
	XGwZUGN3ip0ji5h92n8JTxxDTGwMwC+jPsS39xkW3vS9NhXAZNGjESj+7e9WV3sG
	ENq8QxfWedg/V1MV9799z1M5cFh5JNZuWxPXuJs+HgnPKcjqusH+z942ZNlgFip6
	vHtz+9614aD7cv79Lx3STWs47Q+5XBCGCiwMxI8jxFm0HoXmca3G2ECGeFFy7Crk
	Hxky5dnohQ8CCJBwWyyYmzloCcAeGHkEsr+m4VNDy3CWlZymfMy9MBvbRMFUj2On
	U+Hu3A==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jgy5015-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:31:03 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6eb2480028cso13598866d6.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 02:31:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745487062; x=1746091862;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R2Plo6/QBFF1HAXNaurzwl09t9WnclC1kSkO0ycKczA=;
        b=Ion95qI6mtEp1PMHPLtlsaoLxDgEISYh1kX6FVZ5G853a7pFeerDPme9zkr/DjXPrc
         yjit7/opn8nIhKB4tRPYlR9LAALZqJlKTq05vGW50/e8r9Q4bVz8MGGu9mvqa4CJRtph
         +zoZWJ8lQrnZl4WWbNNND+DjVB5t5omscKp5HVcUqop0PRIopvGWyiBU3hOZdoIjKABF
         N7tvk3pCsegNAD5G9eB1BHTjr3r4miYSorHV4JNinf11Tz368xczuvjk+lPWXSb1gO8d
         +JKEhDOORh8DyFd+ckc2ZTvUJviGSR11FHFww00tOi+04ZT0Bp+7QO2SmBCRDj9dkLWg
         Fcdg==
X-Forwarded-Encrypted: i=1; AJvYcCVpEwEVnww3Fuwn7WFSFUC52CTKysRtE09IX+qCvXd9K/N319TI56NAIrjwSBBnOCIMGaDPDwJ+ne8SgW8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTQz4z2Y5Lk8EYluT0Li17579Ug+yaYGgAd/ACxnPtDzb3Rqam
	YDVz5uK21v/54wXX6PzpiTnZTb8mvbjrMOpRaG5Y6FnBLptA6CCWvk8vjd5hBTsCQCtvpzogo0T
	ojGiE9i6SwzB1hucz9eSopRPgZHDDDz3nZ3mz1/0AxG68hXWtC4+iBeLcNp1gYks=
X-Gm-Gg: ASbGnctjJ7vXoPzUbtPlB5Eer+qRQfxnRp1inbjhXe1Q9a3HxxI5DTh37OSfO1gdK1C
	TUCRyE/TK/Qdja8Sh+8M0/Cjpmsd6gvN75TIGfvqF9mjQ+nYYj9X6roKf82cEJKvx++Vwj6bwyy
	9haHdQl/8vVsLz1Pf5fVKl9oVvhSh9qSA72BrgMJJHl/4FqBtqdMw7Zij5mHnD5IDIYUanVtdym
	Pwj8Pq82K5VTPq5zu0cj2QoFF+cyAl3EWrUrzCXphrDxWaf6XVnbQgi8s+LfSxlHsfaHkOPP4Lq
	7f+8rmgbuBG5xbMsaCOxjDPi86Sh0QWPu35+/2wMWv52yieYZXuIlzaNkQ0/6ZuXfZ7TJSL6ND+
	vxJRoVgghfmNeVUkzv8I4tQSr
X-Received: by 2002:ad4:576d:0:b0:6e8:f4e2:26ef with SMTP id 6a1803df08f44-6f4bfc6d804mr33930536d6.31.1745487062451;
        Thu, 24 Apr 2025 02:31:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFt8rlPlDH/a8MvnQzJpkVdpgygatDbG6zTeLQgE1Sk5DPz/AogmqatCixLLoM+SsnZM5MFUQ==
X-Received: by 2002:ad4:576d:0:b0:6e8:f4e2:26ef with SMTP id 6a1803df08f44-6f4bfc6d804mr33930256d6.31.1745487062122;
        Thu, 24 Apr 2025 02:31:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317d1b9a304sm1820461fa.99.2025.04.24.02.30.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 02:30:59 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 12:30:24 +0300
Subject: [PATCH v3 20/33] drm/msm/dpu: get rid of DPU_MDP_AUDIO_SELECT
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-dpu-drop-features-v3-20-cdaca81d356f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5292;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=0gPy4u9+yg/VW6I+AUS7zPeR83r1ug1HSB+hIPYj1+Y=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoCgSu5bNMbuDpHhEpy7HNgZaFCwQ5ZDMxP6sT7
 JZrYDTsT3WJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAoErgAKCRCLPIo+Aiko
 1UfIB/9WDqSHx1nPN5xr+kKBFRcZRtKeYEFF85X/Fdg3fWJhEJiTk3D/zEEyTn0Q8lq5bCIkIDw
 W0qWuOb+GsoG0sipVZnjLVKXZbrWvDxaMcaA5lJMc4tPpMdKr6LM6DmUdMytpU+mWNNo4wxvR1N
 bU9kQVPaOPZCmGPsrY+G5mTFwnRQ/spL1z6a5VsrX2L93MqsaITAXoajkktSeQJHe9/smXXsPm7
 cSF3/SCpoHDHbcNIbXmIPqfTlf0wkULocARbfKGuyF2Vr2CIrPaBq25x/pfMcMuYs5UDhKtKs3n
 OXVX3b7vY+ndpGdQrYN1WeaMj1uh6Dvafk3wGu+3loRgN66n
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA2MyBTYWx0ZWRfXwX6/gbtIUxA1 vscCXEt+quiG/WzekVcxItoTa6Kyc7hBTE2EKAN8uUBH+CsH2+1c8q43VlRXG/aKmY4iQlVSK2U n99ixlWcnYiPrW1lv3Z4g1LJfZKk7UsrZhQPK3C0RIbrWqLP0on6EA2sT915llru+xMerabq5Aa
 QhZPqVdxKyV+JvdY/z+sSAPdGUem6U3x03wzXkCMd85yl7Zr7tb9DqAjGHyQ09ajBiRB0nDaXp8 1p28CionY9ANF4IurL0V9lFJn1HfsDriZWKdVlTClEXl6whWuB4HeiVkNdfzQ0Iad/DcEk89ceJ meOvmlMfF4WBzlMZpnnhn/FeQ4Rf1eHMMV7Ko67NrlnPghzdYYPL0VwhK29JBF94KPCHzA0mUIY
 QyYJ6JcDaMPNu/1CY+zzIZ0QMjANT7Vc7rjagubhQOV43foDaeJTe/U6KKfJ6sfs+7p1/HAr
X-Proofpoint-GUID: g3vZ--5yMmnbAQFGyb6HXOVZNfLGt9Q5
X-Proofpoint-ORIG-GUID: g3vZ--5yMmnbAQFGyb6HXOVZNfLGt9Q5
X-Authority-Analysis: v=2.4 cv=M5VNKzws c=1 sm=1 tr=0 ts=680a04d7 cx=c_pps a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=H1s5W502GRu5WLOynKcA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=cvBusfyB2V15izCimMoJ:22
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
DPU_MDP_AUDIO_SELECT feature bit with the core_major_ver == 8 ||
core_major_ver == 5 check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h  | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h  | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h  | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h  | 1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h          | 1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c              | 3 ++-
 7 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
index 9f04c7cd5539c012a9490556a5736d09aa0a10c1..21264184566493ab4e356a4e0c032ee7780cabff 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
@@ -23,7 +23,6 @@ static const struct dpu_caps sdm845_dpu_caps = {
 static const struct dpu_mdp_cfg sdm845_mdp = {
 	.name = "top_0",
 	.base = 0x0, .len = 0x45c,
-	.features = BIT(DPU_MDP_AUDIO_SELECT),
 	.clk_ctrls = {
 		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
 		[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h
index 3a60432a758a942eb1541f143018bd466b2bdf20..ce169a610e195cbb6f0fee1362bcaaf05df777cb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h
@@ -11,7 +11,6 @@
 static const struct dpu_mdp_cfg sdm670_mdp = {
 	.name = "top_0",
 	.base = 0x0, .len = 0x45c,
-	.features = BIT(DPU_MDP_AUDIO_SELECT),
 	.clk_ctrls = {
 		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
 		[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
index c93213682a5781bbd8ad137152c9be8bb1e6efbe..634b7dc452839f994c948601fe9a09581cb42a42 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
@@ -23,7 +23,6 @@ static const struct dpu_caps sm8150_dpu_caps = {
 static const struct dpu_mdp_cfg sm8150_mdp = {
 	.name = "top_0",
 	.base = 0x0, .len = 0x45c,
-	.features = BIT(DPU_MDP_AUDIO_SELECT),
 	.clk_ctrls = {
 		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
 		[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
index 5da17c288f66f4b7b5fef1550fcc9793f524115e..59e280edcd508c14ee297857a19e9974970566de 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
@@ -23,7 +23,6 @@ static const struct dpu_caps sc8180x_dpu_caps = {
 static const struct dpu_mdp_cfg sc8180x_mdp = {
 	.name = "top_0",
 	.base = 0x0, .len = 0x45c,
-	.features = BIT(DPU_MDP_AUDIO_SELECT),
 	.clk_ctrls = {
 		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
 		[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
index e388900623f0de4a1af10d22a6b9bdf4842e1f40..af0d789c47917e9b712282a542c3d0886313c049 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
@@ -23,7 +23,6 @@ static const struct dpu_caps sm7150_dpu_caps = {
 static const struct dpu_mdp_cfg sm7150_mdp = {
 	.name = "top_0",
 	.base = 0x0, .len = 0x45c,
-	.features = BIT(DPU_MDP_AUDIO_SELECT),
 	.clk_ctrls = {
 		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
 		[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 0f8c24ad346568464206eaaeeb199955788ed505..a493dfffa9e4981f4c3f6e05dbbf14e1416f07e5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -38,7 +38,6 @@
 enum {
 	DPU_MDP_PANIC_PER_PIPE = 0x1,
 	DPU_MDP_10BIT_SUPPORT,
-	DPU_MDP_AUDIO_SELECT,
 	DPU_MDP_MAX
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
index c49a67da86b0d46d12c32466981be7f00519974c..5c811f0142d5e2a012d7e9b3a918818f22ec11cf 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
@@ -280,7 +280,8 @@ static void _setup_mdp_ops(struct dpu_hw_mdp_ops *ops,
 	if (mdss_rev->core_major_ver >= 5)
 		ops->dp_phy_intf_sel = dpu_hw_dp_phy_intf_sel;
 
-	if (cap & BIT(DPU_MDP_AUDIO_SELECT))
+	if (mdss_rev->core_major_ver == 4 ||
+	    mdss_rev->core_major_ver == 5)
 		ops->intf_audio_select = dpu_hw_intf_audio_select;
 }
 

-- 
2.39.5

