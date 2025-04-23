Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08B82BE108
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 21:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745442687; cv=none; b=Bm4Z34bDgjfqNCyhsrC4+aM9xmoJuBqucnxs7nKelnsPkUh5q38IsTbSa97aBIsM5V0Vo3dzD1c3x++seiiEN30IVn9aLYeaSWw7JwdHxbAu2nGN+IQPk2WCaOGp6c+xDOWFZLZg8fk1lg0HR7ekeQI4b/XD7fSsDT9RJJ3ckms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745442687; c=relaxed/simple;
	bh=tjLaEXS6saL4Tjk3z+TVeg4Wlv4axFBIVr+nnvsQZO8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Nn0gC3/lLWSDflsS+p6BN6oJrpd90pIwMnEVelFX3oZ9mcjOjxxydTEE4VyLLKlT7aCZPE70SvVU+AQnw4X/ra746ZT1JP38VaRKk6Qzf0ooBQSBNtdHIElbd871lI79TrRxoWK2cKn7SlcJ8SmfzzUnDs9x+KW6SwqRNKt2EPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FU98TDO9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FU98TDO9"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NAYYom016850
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 21:11:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WrNtkZH+H2Vic+NyXDzxkBmQFFTYEFIIb43Hc+6ZEJc=; b=FU98TDO9NfzCSINF
	h8UOecwQXmOxIO5r5DzzTswUsOCi65LPZHm7pmo3cafXg9JFnMeKd9N3ZGZwYCQo
	l9XBhNfInmTCcBJVxomKEvsfft75GLvGOiDdR5UNdEQSWnYpphWiUdQ0ZsR66Ed9
	BQ5gRElF0lWmbwCUwyXrlSQnKiaks5vl5l1MDd8K9VoCDgATCMv0ad/qBJtGMCcr
	7cZcFcOkXFr4Bx0cOvh/YASp6QwWo/JxB9wQR3qtzqC8dtkaz0z/zbF/Hoyo4aup
	zfsrOs4pdyIBdXelcoN8JHpIc6fT+FIQthT5ATNc0PLgSv8W2Lzuczs8IPFMMe9/
	p6Id5Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3kdek-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 21:11:24 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c790dc38b4so60425985a.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 14:11:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745442683; x=1746047483;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WrNtkZH+H2Vic+NyXDzxkBmQFFTYEFIIb43Hc+6ZEJc=;
        b=gEvZhsW5gzKpYvGd2gwSObY5SSsXGZ0tJ+R2zuOXJBEYdhC+mhHy6XtmS+iY0Yi3t6
         xDdq8IxZIfagz6213WhNwm/bwRJpsmiJKpamjh266y1O7l/UiJF5q49zhSRQhPfGuvhr
         PosF1Y9YIHG5fNU/ykrDteX6Goi3Xiv1sWboGb6kCAa8IgbSSanRfbhA7B679a6TJgxC
         ce+fErwg39B31rtWqkLNB6VhwdV2T92Fr9OImSTPK+sJkMobggiFk5FdJPR/38YF6plt
         i9wHNNriJoEnKnEWRegD57OgwPpyFhYgd3uwaAhw70PQhkm0xHNzNgh1R6Qeu+GOj6Zh
         aPLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGpz4kFGTXgl9ZxwvrPkC3wWuuQaSnHx76H9ljqbarkK7L8jG93opOGqwSOq69QlzuKUmDYBt1h0mBma0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyh94e0/z8wMU+xw+KCKKJ7MPaeQnPGFbb9Q4ng8gQ5dTJE80JV
	5I8O/S5WjbyR5GoutA0Vn/qUpNpGEKh+TnWnwH5JiEkQWcNWtWW4m3mmh5ASKpUz0FfFCzJKgEW
	9trdpP4190bwAWtTfKgvPBfIeba9bxo6z6xAo3VHm6xAoJiddNY2cmJ18EpSXTsw=
X-Gm-Gg: ASbGncsMlT9r+k0Jlg9Jk11Zq3zf2qMUFC2XtdexZkfP090pK5sNl1hIO39bs+GlFC5
	D8gMHQ2kGtAaIDL2dfr/AQpXyFI579ROccq1T54t+Gl+HpQL+1QZSkoYbMipgfl7qIBbbNABSxd
	K2JEo98QZsVP3yKYN8iXcqMHxPPawksA4YCJo9BWg9fgeG896CZxDXS4wUgYoSK0nyROXKWcCb7
	j2ZpO9letH7Np7l3Mj7fBAw6SNUjsa4HOTsythSlZstanTtzP6XpRzzI5o4pllnkP4j5vIwbW5O
	UqEG9t1X+ncV7X37B1GHpdWIPdeaVhnRMrGLetlVuvSB+A37ZAjZm85oVDmXAZu56TawAv1ZmR9
	/SEkp04Ip6MhMTDjICg5N4lp5
X-Received: by 2002:a05:620a:1912:b0:7c5:3b8d:9f2f with SMTP id af79cd13be357-7c957854052mr11853185a.17.1745442683514;
        Wed, 23 Apr 2025 14:11:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHbEJvNAoP2/UxaJGavz+cKgjLPAcAoimjNe/UsaIMkbpMhagGwiYJ/zs3p1tSQw61czn09yg==
X-Received: by 2002:a05:620a:1912:b0:7c5:3b8d:9f2f with SMTP id af79cd13be357-7c957854052mr11850585a.17.1745442683161;
        Wed, 23 Apr 2025 14:11:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb3987csm3852e87.59.2025.04.23.14.11.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 14:11:21 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 00:10:24 +0300
Subject: [PATCH v2 28/33] drm/msm/dpu: drop ununused PINGPONG features
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-dpu-drop-features-v2-28-0a9a66a7b3a2@oss.qualcomm.com>
References: <20250424-dpu-drop-features-v2-0-0a9a66a7b3a2@oss.qualcomm.com>
In-Reply-To: <20250424-dpu-drop-features-v2-0-0a9a66a7b3a2@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <lumag@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6066;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=0Xucrl9p3RVanutrsrXG/AILscg4MPlsZPdz9DRUTfA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoCVcu3InOIzon+HTk/sVfvnvpQ0BT6uQ12sZlM
 J2l+5MvrQGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAlXLgAKCRCLPIo+Aiko
 1W2JB/9q7xY2GLIB0nQ+zYlua/+2UHgruY7PGWRW1j3dNlJIYsawhn49BuqQ4pykaDQsqXu6HqT
 D+T9ZVQfl4oEwMrmMoT+DpH34kYnGKEGvDHugYScQj6xXEn5ON8JhdRo/A48FAW2qhvezacGKoV
 At3vRuI8s/Z0xuTtoct1dYgMr4v1BH3i1ek4bZlURgSty9Tz5fIXEWBfY88LhkbpzCgNLP6+Ax9
 DF3D8ytfVLthNBJsBY/EnyHZPIgDucVhqFM+OkL1Hj8IXGsl//j0MIYvBUnFa5St31f7nVZfvRh
 /Inmc0zljN84uW4NgEkVO0vCL6y+xHZ3uoe+bbo339WD+L4n
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: aBFlzxHzmNnurx63M-vp-l3GSO_oHGtl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDE0NCBTYWx0ZWRfXwDmAZegVIsIj g6t0nMB2osWakZASqeET2Jx9DC4B4m4A+Dbt1Vi3+SD/Rcki6XMOSaZUipeyKFJIMMpUMrVsyEx dCKhVbC9ndRh68qKOQ6ghu16W+L1WfntrrzoAmWhzSmluIEmXPI8ikSz/G4+ZtqjoTVzCvm3BRf
 Q+Pl1YwsMaRf6TNB96/JPDixtBAoAZI+J1jptEN62DlV/wqIJrzjB9NhWJY9+8cDyI47MOIdmdF yoOaymUi1crujRr1X1siMyBEMUs3Xiz3tHAPb9TMh/5MnAnsUDDkxvNMozRpsyewb3O317VhWRy MJg6wtD5HCiupDkandMC7JELXYcjb07LrddJG9ezPWAhHyO1hEyzAMNPdf76lDw0A5O/Z9oqmPm
 q9yBKrdd6iLP4bm/AytIMmKdK1tyvP0hiONSiwSxYxa+GpZpk6+UPVpx4yaKgAHJpHBIbIuH
X-Authority-Analysis: v=2.4 cv=ELgG00ZC c=1 sm=1 tr=0 ts=6809577c cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=BKnecdA5F2l9gEOK9gkA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: aBFlzxHzmNnurx63M-vp-l3GSO_oHGtl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_11,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 phishscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 mlxlogscore=767 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230144

From: Dmitry Baryshkov <lumag@kernel.org>

The DPU_PINGPONG_TE2 is unused by the current code (and can further be
replaced by the checking for the te2 sblk presense). Other feature bits
are completely unused. Drop them from the current codebase.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h |  2 --
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h |  2 --
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h  |  2 --
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h  |  1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h  |  2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h          | 14 --------------
 6 files changed, 23 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
index 436fa56e2ba2d867b58b59ec6b02d1d0f396c23b..7f606be1f79fe83568b467c47e7280537f1ce091 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
@@ -180,14 +180,12 @@ static const struct dpu_pingpong_cfg msm8996_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x70000, .len = 0xd4,
-		.features = BIT(DPU_PINGPONG_TE2),
 		.sblk = &msm8996_pp_sblk_te,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x70800, .len = 0xd4,
-		.features = BIT(DPU_PINGPONG_TE2),
 		.sblk = &msm8996_pp_sblk_te,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
index 38cdea019bf2b1391c242953e4c67d9dc4c2274c..a10ca16d2d63d8b6e2e2165dcd4bf0cf915f8e3d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
@@ -169,14 +169,12 @@ static const struct dpu_pingpong_cfg msm8998_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x70000, .len = 0xd4,
-		.features = BIT(DPU_PINGPONG_TE2),
 		.sblk = &sdm845_pp_sblk_te,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x70800, .len = 0xd4,
-		.features = BIT(DPU_PINGPONG_TE2),
 		.sblk = &sdm845_pp_sblk_te,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
index 176640bff1214e89606286ce572f74300f6f343f..c1fc91b3f6f85af18cf6a6c1690ec69074fc3545 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
@@ -140,14 +140,12 @@ static const struct dpu_pingpong_cfg sdm660_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x70000, .len = 0xd4,
-		.features = BIT(DPU_PINGPONG_TE2),
 		.sblk = &sdm845_pp_sblk_te,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x70800, .len = 0xd4,
-		.features = BIT(DPU_PINGPONG_TE2),
 		.sblk = &sdm845_pp_sblk_te,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
index e6eb95173cfef2a52f5dc606ca41a2f1f5650c2c..65975e7ebd9ba1970b48d8753a87835677d58df7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
@@ -114,7 +114,6 @@ static const struct dpu_pingpong_cfg sdm630_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x70000, .len = 0xd4,
-		.features = BIT(DPU_PINGPONG_TE2),
 		.sblk = &sdm845_pp_sblk_te,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
index 21264184566493ab4e356a4e0c032ee7780cabff..8d5b7033f12f740fe7b9226e93fcece8ed54b890 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
@@ -189,14 +189,12 @@ static const struct dpu_pingpong_cfg sdm845_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x70000, .len = 0xd4,
-		.features = BIT(DPU_PINGPONG_TE2),
 		.sblk = &sdm845_pp_sblk_te,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x70800, .len = 0xd4,
-		.features = BIT(DPU_PINGPONG_TE2),
 		.sblk = &sdm845_pp_sblk_te,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 4b6af58429361c49b71f6067dce8ca1daa6493fa..5eeb693f0e282da2aa0e5a729aed1bc8573639dd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -87,20 +87,6 @@ enum {
 	DPU_DSPP_MAX
 };
 
-/**
- * PINGPONG sub-blocks
- * @DPU_PINGPONG_TE2        Additional tear check block for split pipes
- * @DPU_PINGPONG_SPLIT      PP block supports split fifo
- * @DPU_PINGPONG_SLAVE      PP block is a suitable slave for split fifo
- * @DPU_PINGPONG_MAX
- */
-enum {
-	DPU_PINGPONG_TE2 = 0x1,
-	DPU_PINGPONG_SPLIT,
-	DPU_PINGPONG_SLAVE,
-	DPU_PINGPONG_MAX
-};
-
 /**
  * CTL sub-blocks
  * @DPU_CTL_SPLIT_DISPLAY:	CTL supports video mode split display

-- 
2.39.5

