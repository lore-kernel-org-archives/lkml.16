Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D651B2750FD
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 02:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751683673; cv=none; b=ubH5CNlJMNu61PZxb/GXSZ4A7GIi0yPrVFehU1BZvFoilk++duci6ClMOF8VyplhYZxuqZNjtZTpdL86Xg03vbRkb/2uhlt2rNA9VMAx4+72d5+kQQDnTMyjS1ZA6JcQpIP9crUOFErLwlFvkSP3HAyRVtmavL8gA2Z2V+zKOMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751683673; c=relaxed/simple;
	bh=hhBaxxZmnT13WRs7rFTvlNBQVmnytMkWjXau7MkDvsE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R/L0LyfhBxHPSJhsDMdeiFppymlxVeXiNqTzFuLiaWmDZRmxzt2kkl52+xeHYOuLxLIE1W2aQK6Nb48bo50RtaTT6pBLyWJXlr6Sp5m1HpW0WScY5y8m0uBhtaJMHZkwDhMhIbvRbQG7cpZo1RhJZWggU3ARZM/8lPdJx0xKepc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WgOECNSY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WgOECNSY"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5650hiLt013739
	for <linux-kernel@vger.kernel.org>; Sat, 5 Jul 2025 02:47:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GPNRX6kvlGpl11U/TVdLyTY4+QGTQbEIYlMOf3sbM5g=; b=WgOECNSYRBpkJFSq
	PXfO0eYc/wLmnq5P9Md7nr4Rgratd0h8EPQu+jyEv4aoaPa4AGnrYKL9xcEf6ZyV
	wRjiYI98SbgrHr/AF9/8Z3AVSt5ldGHtx8TbvVGinWfLNxMAT55BeM/4BpqnecKm
	SDYIp7cVdedEocLvzXwKdUcJs7pb+ZO5VDMjFtxP91xljVK+lDIEOdJ5KJAEW4Mc
	5MZp45v2RofqA00ksmDigmGCv4m5VeOsBKw6L7+V5wWChlJUC83+XD6DAuRECDkK
	4QjOjaKhA1TFZdIshu4UgNz5vdmp5tz0lWANYk/6K/xsaxIojxcumNLZZKkSt3JY
	IFtMrA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8fxw9yy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 05 Jul 2025 02:47:49 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d460764849so419006785a.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 19:47:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751683669; x=1752288469;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GPNRX6kvlGpl11U/TVdLyTY4+QGTQbEIYlMOf3sbM5g=;
        b=MITSQm3w5VlB10Vfh8E+64tgQyiI3zeNAL9mDzX4w+lG2qcgfisEi72zrhEDTTkxJ1
         yONPgkMNZm6rvsLOKs3Wx8XkSwOXpTe7yT8gYeIMOO/gP+wmlmcBAvRPAa2yDSUI6O0U
         0aIzJbqS7kRgbwd0y8Kff658kMGPzMHKpUmpaQenxM5cQN+iXXMzEIbVvNnunAJJNA8S
         WOXXJhiC9FxdPgLNDP8fxUmJ5kTDKfwtMzGdk8K9f4VR/dOJuisQhPAtT0Z5JJys3liW
         cfW/S9+iDGwmKW3gKIQG9hEBnDhXItANI6zHhc/1yc3EDbkqK9qRves3EHhGNUgj4YII
         Iccw==
X-Forwarded-Encrypted: i=1; AJvYcCX4UeO2mgG2ZowJzpu6FSz7i7lsgotTstfsk+9InuxLPvnvWAGIvcBtE5M5g8fGEegGiQSR6j4dE13QKGQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2YLb0nMX/g31vAGDpCzSIxUxKjPLY5FgO9cWGoIeqOUjuTHcG
	n8AzznmhrMcJGJLH++tz3/W3TTYaX8paHg3dpP8+CsWyQNm77OIqoS4ZZeM3DK/jD54lNYJPBhz
	qHwct0YBqaBJevoH2SXKC2yjUQ5nPTK2jlPvqe/vq+aD+8e1keoR9vNvZdkTktn4mrl0=
X-Gm-Gg: ASbGnct2zyRrQ+Vm2sEyB/BDjxCUmsBQpivxBRsE9BOk5DC/oCRotgG9SRdvz+KuWNy
	Mtv7CaNu+pK2hC01wRYKllx27lo6u+x99SjSswwVINOXdAfq3vdi3+0CWJgTMOMLCJVE0xSYh5J
	ScNmKxw4FnjrS6b1K4zKX7683VDmvDebkjA3eeYXNb7ZglQG4PDlB9ViNDTGCE/ZZntqfZDg0PL
	ua35VM7nvX3TRbNk998QuSzS5aEVA4VAEDUSgCu+N2KxifbjohI1O99az8A3ej9SvORqGB6ncR4
	UtSoaBuF0bbHbjv/fJlCUC0VERKiyCMrjwZZB9w1yWAVKhNb1Y/YKwXQZu9kudGUot7J+uGCwc4
	Y7/GjJeXN/P4sbvtYiUSs/8YJxa+4StItDXU=
X-Received: by 2002:a05:620a:178f:b0:7ce:eb71:f500 with SMTP id af79cd13be357-7d5dc6e4290mr791402685a.28.1751683669022;
        Fri, 04 Jul 2025 19:47:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJGzWE8i0pf3MCjcA4rpy8Ez0BO+QTKJR3Oss+otwH7sOxSUybDGPQWW0T6gEwmm6vgWjfSQ==
X-Received: by 2002:a05:620a:178f:b0:7ce:eb71:f500 with SMTP id af79cd13be357-7d5dc6e4290mr791400185a.28.1751683668595;
        Fri, 04 Jul 2025 19:47:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32e1b1418b3sm4092411fa.76.2025.07.04.19.47.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 19:47:47 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 05 Jul 2025 05:47:31 +0300
Subject: [PATCH 10/12] drm/msm/dpu: drop redundant num_planes assignment in
 _dpu_format_populate_plane_sizes*()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250705-dpu-formats-v1-10-40f0bb31b8c8@oss.qualcomm.com>
References: <20250705-dpu-formats-v1-0-40f0bb31b8c8@oss.qualcomm.com>
In-Reply-To: <20250705-dpu-formats-v1-0-40f0bb31b8c8@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3000;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=hhBaxxZmnT13WRs7rFTvlNBQVmnytMkWjXau7MkDvsE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoaJI93Vo2NjfFVLXURfm2DWRrzoITsNvbcjjtR
 WLL1k60AW2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaGiSPQAKCRCLPIo+Aiko
 1TuuB/9+9r8SQ53CMiMyOptheGx1W8C1fndkh8MksuIN/2D562HclCnxV61eA87X3N3cMyd7Ll4
 dkLWdX8kUHZUFYbD/g4ElGKqKlM/koSanNwns8MyCIPsyJLpz+MTmULcxS2RxE1RETCClc0SEOw
 xhtSRtXImd1nk6YYFbNSuiXWjhszBQAfYBJwSm+9c4JoCmLizFqjtakVaea91FEgXjAU1w24D3Z
 XgHd/RRZc8MMzqvIj0YbceWwAj9i+hPySayXXD3+wtuEqco7kkRNj1WWOPqkHroKPCMnamj7yFF
 qupDYNKFsuJ+6mE3cI8ZqIBKQORQjez0JhDJcGDM6hVos8/i
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDAxNiBTYWx0ZWRfXySbT/lwEHvNC
 P7iHHo2UmBofTp+O8DldqvAOhb4/YVveIDDuwcSotCQ+UcNMuwI5BYKEllAELwtH6xPOdRatzSL
 RjOMppT4XC9kphgo0uJ6u521mXY4g0ZCvjOgT4Xfnlk0oOJhLY5G/a07/XMN4+2MF0sPYpx3MgN
 Uj/lkddqLlIIozDVlimrlvr/Xwj2SMyrc0M5q48N4goV8fXeMZwieIyhlnjA/yWzcFe3UlTd/SM
 lAKSs90tL3Mnf4E689OhVYeLm4mvZ637kgJnaaymjQOmqy2F+ZNHqSEF78UznAuNcBojwNUzRsz
 I/7ifAbAwqvGjNGT31JqLapbzgNFslGKtiaaZLfpsYsjRlsyFb6m3Ed3f0rsRLYS07sUD/bDror
 7+xvzVQt8qXeGpteoP/qrNZiwN49F8fzzV06DW3KwPY/qAOeBVLleyyiC/IFYhzEWC4JoNAH
X-Proofpoint-GUID: fq1sNHetJX4neTdk8LNhnd_5dtBivRNH
X-Proofpoint-ORIG-GUID: fq1sNHetJX4neTdk8LNhnd_5dtBivRNH
X-Authority-Analysis: v=2.4 cv=TqPmhCXh c=1 sm=1 tr=0 ts=68689255 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=VIt9t0sQHfAwVTtMwRsA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 mlxlogscore=959 suspectscore=0 adultscore=0
 phishscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507050016

Drop redundant layout->num_planes assignments, using the value assigned
from the formats table. RGB UBWC formats need special handling: they use
two planes (per the format table), but the uAPI defines plane[1] as
empty.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
index 195a6b7c4075eef40e7a5d0fee208168421cee35..e1fb7fd3b0b97a38880bc80aec26003d65a3a310 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
@@ -110,7 +110,6 @@ static int _dpu_format_populate_plane_sizes_ubwc(
 		uint32_t y_meta_scanlines = 0;
 		uint32_t uv_meta_scanlines = 0;
 
-		layout->num_planes = 2;
 		layout->plane_pitch[0] = VENUS_Y_STRIDE(color, fb->width);
 		y_sclines = VENUS_Y_SCANLINES(color, fb->height);
 		layout->plane_size[0] = MSM_MEDIA_ALIGN(layout->plane_pitch[0] *
@@ -124,7 +123,6 @@ static int _dpu_format_populate_plane_sizes_ubwc(
 		if (!meta)
 			return 0;
 
-		layout->num_planes += 2;
 		layout->plane_pitch[2] = VENUS_Y_META_STRIDE(color, fb->width);
 		y_meta_scanlines = VENUS_Y_META_SCANLINES(color, fb->height);
 		layout->plane_size[2] = MSM_MEDIA_ALIGN(layout->plane_pitch[2] *
@@ -138,8 +136,6 @@ static int _dpu_format_populate_plane_sizes_ubwc(
 	} else {
 		uint32_t rgb_scanlines, rgb_meta_scanlines;
 
-		layout->num_planes = 1;
-
 		layout->plane_pitch[0] = VENUS_RGB_STRIDE(color, fb->width);
 		rgb_scanlines = VENUS_RGB_SCANLINES(color, fb->height);
 		layout->plane_size[0] = MSM_MEDIA_ALIGN(layout->plane_pitch[0] *
@@ -148,7 +144,9 @@ static int _dpu_format_populate_plane_sizes_ubwc(
 		if (!meta)
 			return 0;
 
-		layout->num_planes += 2;
+		/* uAPI leaves plane[1] empty and plane[2] as meta */
+		layout->num_planes += 1;
+
 		layout->plane_pitch[2] = VENUS_RGB_META_STRIDE(color, fb->width);
 		rgb_meta_scanlines = VENUS_RGB_META_SCANLINES(color, fb->height);
 		layout->plane_size[2] = MSM_MEDIA_ALIGN(layout->plane_pitch[2] *
@@ -167,7 +165,6 @@ static int _dpu_format_populate_plane_sizes_linear(
 
 	/* Due to memset above, only need to set planes of interest */
 	if (fmt->fetch_type == MDP_PLANE_INTERLEAVED) {
-		layout->num_planes = 1;
 		layout->plane_size[0] = fb->width * fb->height * fmt->bpp;
 		layout->plane_pitch[0] = fb->width * fmt->bpp;
 	} else {
@@ -194,12 +191,10 @@ static int _dpu_format_populate_plane_sizes_linear(
 				(fb->height / v_subsample);
 
 		if (fmt->fetch_type == MDP_PLANE_PSEUDO_PLANAR) {
-			layout->num_planes = 2;
 			layout->plane_size[1] *= 2;
 			layout->plane_pitch[1] *= 2;
 		} else {
 			/* planar */
-			layout->num_planes = 3;
 			layout->plane_size[2] = layout->plane_size[1];
 			layout->plane_pitch[2] = layout->plane_pitch[1];
 		}

-- 
2.39.5

