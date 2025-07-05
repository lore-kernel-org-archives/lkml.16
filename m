Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8369C26E6FF
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 02:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751683660; cv=none; b=Prs+cGtYgLIuEjITlpfvBebIadJuJDNg2fUVcGw6NdLXe4t+3aq2hkUU04CpG5pdJ576p/ICJmKmQAO/bB/1AGJc6p3lClXLf3g4HEyWJDKTocfVfxr0yP4+pZv0uiJATzphGSPtCFJdHLkTPyrOisvRZLchPRoQxf77+HLYQYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751683660; c=relaxed/simple;
	bh=JAGOFM8la5DTIWskbTlo0vYXln0WqvrLnvfuKadWghI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PImYb+HXIP2IoSsCG57jQZaoTKkbHs38EHqNKZyOQbL6VKYZUKs7DgyyI1oX+QhKD+ZcX9GUolkMMzL7Aw2oRnZ0afx+MqaeYir8meg5ft0XKVKWqwlTupQlVwEawKJX5CxoaqXtpn7JwUlXbBP4+AwYjQQWjPYQ58FAaB/EE3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hdOqqPah; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hdOqqPah"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 564BWUDf010373
	for <linux-kernel@vger.kernel.org>; Sat, 5 Jul 2025 02:47:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YjJnZnfSPLG4pvx+jZTbK1RNBsIlVDEM9jAJuI18oAQ=; b=hdOqqPahytmRPfkd
	Hk8x0GJi7DePyJGdAaFoYn03bxn8ZzIATRYUXWg1zt83nuFWRZlKFLKmryvbRh4G
	5h/YmYjju5KLTuMeUlXKQDCba/d8x2leE9LP2hIFRwq+5aowdneOXNy4s4QWC8Jp
	SuZMI3YkRIbk5tX6opzwuW+WfJCKkHtcPt+lAG1M2hbScpzwSLVjDSXkz5QJVHs0
	Ty+4uVP0bAAht1XcN/0elm52MJfxrXu7jjgZejHNQ/F2SveTTY17fKj0OyUhK5XI
	O2rNU6u92Tf8o4q1e5g9U4DBtjLuKS5silUd/eyqu6z0aziAM5XWbQWRDaJAT4ja
	O/0dtw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47mw30ja46-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 05 Jul 2025 02:47:37 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6fd75e60875so26819126d6.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 19:47:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751683656; x=1752288456;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YjJnZnfSPLG4pvx+jZTbK1RNBsIlVDEM9jAJuI18oAQ=;
        b=HiQ4ZE8oM6ZGtpI1JT1zTbjsQbNrdtXTMWwOrPwNaRhqBcKOz+F9WTh85HB8lfsQhI
         GF3nbDYh3/rzn1hmHb52so5fWtYfZODeLTtXC9SE3N6T3kKU6/dTIiqx3tGxfLKNrgnt
         GVWqsKQtklwMo63Wt6HM8h+XIrKzpMHdcKSrWRxAwnenF4CgZ4yPFUbQkMOniVPI2ddr
         Lch0oM8+1zcCE1FAlE3nrVAvi+vgZW9IUyBCD5spSkCsc3TnodltCGMaiKxa4kcqTXSk
         qwLO/PZYhXI2SElRFwhxffgN9fchR6VzzfiK7rxBnRSxF6/RMNyDqEN1NjykxW6X9lmE
         WZxw==
X-Forwarded-Encrypted: i=1; AJvYcCVu1kTT5Tb/P9zMMAzEDLq98jCH51SSoHayiMdXlCCfu5pCIybOanQutOF86eOqBR4EMJeo+zxuhguSncg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxsaeSzWVjeC/DFrwuEzllEgV6IfQc5AasUl/THL1Qyn4+wU9X1
	CPBGXIIcLrFRV7sztxOalDxbTUNGSnzSZm0DbEIxMWdmbWt+T2QOgfGq1Nnr+uTOgPOUDx4Q/rT
	3QKz3xTjHkO4ttIBX+URywxcKXJJjie9bUyJn0cbIRQ8dQj6PzT2JUcihU0T+kTTTPWY=
X-Gm-Gg: ASbGncvWwywPfUVElNrKPuM8dEuH2Nu1690b7EPFhaa+mhnA6Qq43CjfU/GlLhBZUMg
	6UqpbkQwWDuq1wP484Fq6saM7fJ7NoxdbY9gBB7n2eIZ8FmwIoZq12elz0NBgZb4gGnNLUIwCkY
	p930DTHzVh4IhHcMVFCIhOz4H0FAhlLZpgomJqxEi22nCEdN7qrEDfThh6YPK0/DVO9M5Zr/OHZ
	sxXrL5W6TnZNX53GyKq2EYiNExLE8oTT6TRYPbbeUAnYSLJqU/tvUo6KmJyxAksRV7liwqFjHDG
	FEHmAWY7jJYHsgdBRfapgLv9iqJo7E41zL4TMjFv48Obtrt/XSDGetrYLQnACbxlZ4ZPpoqs7Yw
	7WNZH3BUwK9WkXIFHHRUUVode86kI1kCVVyY=
X-Received: by 2002:a05:6214:1cc7:b0:6fa:c512:c401 with SMTP id 6a1803df08f44-702c6d96b97mr71200196d6.37.1751683656078;
        Fri, 04 Jul 2025 19:47:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFr+zf2cVpxfMVy9rlPRwx88L3ABFyueYOPFJi0i6uvZr/YMhV3c4ZR2j1bn+zUaUufleGxCw==
X-Received: by 2002:a05:6214:1cc7:b0:6fa:c512:c401 with SMTP id 6a1803df08f44-702c6d96b97mr71199896d6.37.1751683655542;
        Fri, 04 Jul 2025 19:47:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32e1b1418b3sm4092411fa.76.2025.07.04.19.47.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 19:47:34 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 05 Jul 2025 05:47:24 +0300
Subject: [PATCH 03/12] drm/msm/disp: set num_planes, fetch_mode and
 tile_height in INTERLEAVED_RGB_FMT_TILED
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250705-dpu-formats-v1-3-40f0bb31b8c8@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5031;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=JAGOFM8la5DTIWskbTlo0vYXln0WqvrLnvfuKadWghI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoaJI83KT5w00Xayj3fi0EP9gVV0Ausowy6PFP/
 4W2D9zi5YuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaGiSPAAKCRCLPIo+Aiko
 1aALB/0ZCZWX7K2Nz3Qr0BsZs4CKjwKdKp2XY72ADxM43zzerZC+PTF3Es8SKKI5yflSD5FJSMq
 q2nchnMYD9hyP/3iBbPLEsNS7QZgHDlyxJMkHO5vdhAftifyoW/7EajdiqGM+2CufcM7JiA8I9P
 mM9he5y1n5+Vo5MSQ+rWiOsgjPPRXyfFKL3d1kLgrZ3baKv0Gk+EKxngrVKc8nSN1+/Nqpeqz6a
 yCccHJ8gFVwq9iVmPnz5Q0OzifAMqzT932QnBl5TY8GyPK+5ztjwrX2hFN8iDPs8zLtjClzOqQd
 0QVNZncfdiqSKndWO4UFOf3YZhatf8gc0eVibLsqBVE1Udog
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=CY4I5Krl c=1 sm=1 tr=0 ts=68689249 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=dmvhxJvSUNPaeTh-JWgA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: u7w7XWx1kmTzg1GfMpm8ckarAg6-l3Oy
X-Proofpoint-GUID: u7w7XWx1kmTzg1GfMpm8ckarAg6-l3Oy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDAxNyBTYWx0ZWRfX5ZkX7ncPnoZH
 VWH0VuZn0lPgJKVkThb2oSEi6CsFt2MvUlQ4LeJ4V4DLbNF2PSRc96WtYuMKtrmsgAtTGVoJQA/
 xnrOcNhlqmLno0FkSPE6vO+QfG95NobP8pccQ36Msv34PLOIcECoLnEW6gEqmsOkFZyYti9HfHu
 v8kFYu/BVh7ONHTQOZFKAWg8ZhP8i8tPClEaYmjYnf61MU0DKpNI9jmZ870Kevnrh380CtUqd6I
 J0HZhGNjusGFzTYGJJRCMhdbRILmovS52w4W4P6ZYQagZ6k9ZH7r0bAZpoYONB9CXYz02PHZMCW
 U/drmj32Gqe+PTU43xQH3AFcuvl/z25WK7PtGrtAiVSRCUajDrVA/fFiGW5ufbtmFe7CqWmfety
 /orrP45Fq64IlaYoFaKEQW0tu3ObZ6xPaU1N8qv6sbM3y1BqSUaJQ4xWBdwpS+8j+lQ92/7k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 mlxscore=0 phishscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507050017

All interleaved compressed RGB formats use only 2 planes,
MDP_FETCH_LINEAR and MDP_TILE_HEIGHT_UBWC. Specify num_planes,
fetch_mode and tile_height directly in the macro and remove unused
parameters.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/mdp_format.c | 35 +++++++++++++----------------------
 1 file changed, 13 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp_format.c b/drivers/gpu/drm/msm/disp/mdp_format.c
index 26be35572fd2ee7456401aa525cc36025bc52ee4..09a5bffd838b8a4fd3c22622e82dcf9fb99b5117 100644
--- a/drivers/gpu/drm/msm/disp/mdp_format.c
+++ b/drivers/gpu/drm/msm/disp/mdp_format.c
@@ -87,7 +87,7 @@ bp, flg)                                                                  \
 }
 
 #define INTERLEAVED_RGB_FMT_TILED(fmt, a, r, g, b, e0, e1, e2, e3, uc,    \
-alpha, bp, flg, fm, np, th)                                               \
+alpha, bp, flg)                                               \
 {                                                                         \
 	.pixel_format = DRM_FORMAT_ ## fmt,                               \
 	.fetch_type = MDP_PLANE_INTERLEAVED,                              \
@@ -100,10 +100,10 @@ alpha, bp, flg, fm, np, th)                                               \
 	.chroma_sample = CHROMA_FULL,                                     \
 	.unpack_count = uc,                                               \
 	.bpp = bp,                                                        \
-	.fetch_mode = fm,                                                 \
+	.fetch_mode = MDP_FETCH_UBWC,                                     \
 	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT | flg,                      \
-	.num_planes = np,                                                 \
-	.tile_height = th                                                 \
+	.num_planes = 2,                                                  \
+	.tile_height = MDP_TILE_HEIGHT_UBWC,                              \
 }
 
 #define INTERLEAVED_YUV_FMT(fmt, a, r, g, b, e0, e1, e2, e3,              \
@@ -487,14 +487,12 @@ static const struct msm_format mdp_formats_ubwc[] = {
 	INTERLEAVED_RGB_FMT_TILED(BGR565,
 		0, BPC5, BPC6, BPC5,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, 0, 3,
-		false, 2, MSM_FORMAT_FLAG_COMPRESSED,
-		MDP_FETCH_UBWC, 2, MDP_TILE_HEIGHT_UBWC),
+		false, 2, MSM_FORMAT_FLAG_COMPRESSED),
 
 	INTERLEAVED_RGB_FMT_TILED(ABGR8888,
 		BPC8A, BPC8, BPC8, BPC8,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		true, 4, MSM_FORMAT_FLAG_COMPRESSED,
-		MDP_FETCH_UBWC, 2, MDP_TILE_HEIGHT_UBWC),
+		true, 4, MSM_FORMAT_FLAG_COMPRESSED),
 
 	/* ARGB8888 and ABGR8888 purposely have the same color
 	 * ordering.  The hardware only supports ABGR8888 UBWC
@@ -503,38 +501,32 @@ static const struct msm_format mdp_formats_ubwc[] = {
 	INTERLEAVED_RGB_FMT_TILED(ARGB8888,
 		BPC8A, BPC8, BPC8, BPC8,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		true, 4, MSM_FORMAT_FLAG_COMPRESSED,
-		MDP_FETCH_UBWC, 2, MDP_TILE_HEIGHT_UBWC),
+		true, 4, MSM_FORMAT_FLAG_COMPRESSED),
 
 	INTERLEAVED_RGB_FMT_TILED(XBGR8888,
 		BPC8A, BPC8, BPC8, BPC8,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		false, 4, MSM_FORMAT_FLAG_COMPRESSED,
-		MDP_FETCH_UBWC, 2, MDP_TILE_HEIGHT_UBWC),
+		false, 4, MSM_FORMAT_FLAG_COMPRESSED),
 
 	INTERLEAVED_RGB_FMT_TILED(XRGB8888,
 		BPC8A, BPC8, BPC8, BPC8,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		false, 4, MSM_FORMAT_FLAG_COMPRESSED,
-		MDP_FETCH_UBWC, 2, MDP_TILE_HEIGHT_UBWC),
+		false, 4, MSM_FORMAT_FLAG_COMPRESSED),
 
 	INTERLEAVED_RGB_FMT_TILED(ABGR2101010,
 		BPC8A, BPC8, BPC8, BPC8,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		true, 4, MSM_FORMAT_FLAG_DX | MSM_FORMAT_FLAG_COMPRESSED,
-		MDP_FETCH_UBWC, 2, MDP_TILE_HEIGHT_UBWC),
+		true, 4, MSM_FORMAT_FLAG_DX | MSM_FORMAT_FLAG_COMPRESSED),
 
 	INTERLEAVED_RGB_FMT_TILED(XBGR2101010,
 		BPC8A, BPC8, BPC8, BPC8,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		true, 4, MSM_FORMAT_FLAG_DX | MSM_FORMAT_FLAG_COMPRESSED,
-		MDP_FETCH_UBWC, 2, MDP_TILE_HEIGHT_UBWC),
+		true, 4, MSM_FORMAT_FLAG_DX | MSM_FORMAT_FLAG_COMPRESSED),
 
 	INTERLEAVED_RGB_FMT_TILED(XRGB2101010,
 		BPC8A, BPC8, BPC8, BPC8,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		true, 4, MSM_FORMAT_FLAG_DX | MSM_FORMAT_FLAG_COMPRESSED,
-		MDP_FETCH_UBWC, 2, MDP_TILE_HEIGHT_UBWC),
+		true, 4, MSM_FORMAT_FLAG_DX | MSM_FORMAT_FLAG_COMPRESSED),
 
 	/* XRGB2101010 and ARGB2101010 purposely have the same color
 	* ordering.  The hardware only supports ARGB2101010 UBWC
@@ -543,8 +535,7 @@ static const struct msm_format mdp_formats_ubwc[] = {
 	INTERLEAVED_RGB_FMT_TILED(ARGB2101010,
 		BPC8A, BPC8, BPC8, BPC8,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		true, 4, MSM_FORMAT_FLAG_DX | MSM_FORMAT_FLAG_COMPRESSED,
-		MDP_FETCH_UBWC, 2, MDP_TILE_HEIGHT_UBWC),
+		true, 4, MSM_FORMAT_FLAG_DX | MSM_FORMAT_FLAG_COMPRESSED),
 
 	PSEUDO_YUV_FMT_TILED(NV12,
 		0, BPC8, BPC8, BPC8,

-- 
2.39.5

