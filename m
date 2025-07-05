Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC93C2882AF
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 02:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751683666; cv=none; b=ssK4OVKoZLVcaPrqlcb59LYL62q9F1Y2GsyFdXSRaP4mhIIUn2k4JUmnb1Jl14wSZAz/ZuIey8vKk2gnm7H/xuaP1OaG9vxWR/qFHnw39CPS0OM5kL876kdiVzAqGbohW6HGmIKs1tP59hBlFe8eO0JWGLEL9lw4IMqFW/xiNnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751683666; c=relaxed/simple;
	bh=W+WRtGTmctGrtw3/m66JfBKmA9pR1W/PsjD+devdzIU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LNiPiLtu9edMkq2LacPatNeLmQ1S72fmLkv9A3hPHPMkMUJT8q026PBQiPC1Pna5VfIb+vlPFCm/mqCizeeSCrB1oLH6kwStQk+jUtNeREMRah9KpFbIPGYezyLQGT7V47lSO3Z9RXhXD5jGDMcFvBbDquuoQt47PcKzfjrq82k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NU8lhkVj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NU8lhkVj"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 564Nnfc7029918
	for <linux-kernel@vger.kernel.org>; Sat, 5 Jul 2025 02:47:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oZtASNSKNmQD1TnWT9EC/LsaR2+X6zAje3f7Jf4pays=; b=NU8lhkVjp4lPN3jh
	blozh4p8oAwEgrkAs+6KkMBJUUDw41vBRZPEuyImeCpC8TZB3Yrg+v98bPfyrF5G
	B+heNsixEK4b4eInAw+8sAbW4ueWGpNU6+wyzbF7QYrCnOvm+eehhKmDQnk8v7+1
	yEKY52+lOLG7udLX2Th1DCHAmiaMOY75gCoxgRIu/gNwBzA3VM8ruBKGTYc0fopK
	XXFqbF3IPMDcI44q2ViPe192FkuchbuFfXs+gkIRafTfB7Lo6U7j1JwZxJo0dIiV
	j73tQcBVKM3oJEFqLGc+CCBpYcerAtjRRnZWXj2TG/kDgaSYdQTQbOdpbJatsZr8
	oeU6Tg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8s9w7mg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 05 Jul 2025 02:47:42 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5cd0f8961so258646485a.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 19:47:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751683662; x=1752288462;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oZtASNSKNmQD1TnWT9EC/LsaR2+X6zAje3f7Jf4pays=;
        b=n7rkWVtX8VO8+7xpU7LstGkCRxuEYn9joRiWNUxu4wT0MAo38wLwf6MW5CopCQXh3V
         xtmKVNhPOOZ7JNuzWggsYSlGub+b0XGx6bs3X5r2O2Ndk1vYT5yqUyiU+gnxFQgmSzuC
         SwQhpWDz+huxcNzHrhkb1o0WmG4JGUMP/YWac/iH/9s9iCtS5Y07GKFY8XphXP9hKKsW
         N5URp4MmoJCqrbBghG5yFaItkT7f/OJa6NJ/nl4TpEGuTYDcXqv2nqH15zXfS7csbjg+
         MXlimYDyrkgBMEQFeCm0fHRXc+bGU62QtOxjd+DOHWiJQnz1WasktQeNIhQw7OzdPOcp
         lNOg==
X-Forwarded-Encrypted: i=1; AJvYcCUuhpU5+MqoIj9vqOfdlgcuAT+o7sjGLmVUbtjw1dESxYpvEJ3py5HxWgve+Zi1FS5Nl7Oqa4zaJs24yog=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrFUx+LvwpyboUY2BBm4H4NscSD8xhi+fqBfv4Nj+hWxoRtwji
	kcdr3yYhdtIzXE+ZjqXB5D8mBzUXL++2Srm9jw/ayUhVhFjossJVxOuNiXYQQpJ2ojj6404hM+E
	hDDG5fBHkfZ9jx2AqPee4NdhDG8IC2DtePQy7yJDlF9BoMbLqU8olDujP3sdExTSMQ4s=
X-Gm-Gg: ASbGnctThF5cY7Sk6c7G8emxQB0qmwvFehOqffOJStJxbA3bkGAGh/6EJyWRA/4xN42
	8X1a+7PucKGybdlq6zSHEVeuHftdMKEep2VwOI801up+B0Q0Fy5ATPCqg5FtdVghccpRzBuxMkp
	DB0VyNY6bnSKXux7f5AcmzQ8Il07MpQAk6sk7wIwURqzSprg+GIdmh/T4gL9MUdUT9uUEBumcSX
	Rnb3eECzcvwT9odQcPspyji91CxH53hl7xZtQ1FiFPWU86+O/XkMqXvKVfMuVelVAIvRA64Ct6J
	nKq5XcXwq9LjiwmaXVqWWulL+2TiNLkM4KWlYmIkMH5DranXvtZ13QG7wvPrLd2Z7/fU9+j4NNR
	1iz+IM1cdt4gexLFT4aVgyxB8hu5cymq3pdw=
X-Received: by 2002:a05:620a:bcd:b0:7d0:9ebd:821d with SMTP id af79cd13be357-7d5df0f57a1mr642847985a.23.1751683661939;
        Fri, 04 Jul 2025 19:47:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGdbuHlLJELfruSS+SxxynLXNdqJY020a17c77f5wQOJdlZWvZKI1XK3A3BOmEPeNcBY+YCVg==
X-Received: by 2002:a05:620a:bcd:b0:7d0:9ebd:821d with SMTP id af79cd13be357-7d5df0f57a1mr642844985a.23.1751683661501;
        Fri, 04 Jul 2025 19:47:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32e1b1418b3sm4092411fa.76.2025.07.04.19.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 19:47:40 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 05 Jul 2025 05:47:27 +0300
Subject: [PATCH 06/12] drm/msm/disp: pull in common YUV format parameters
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250705-dpu-formats-v1-6-40f0bb31b8c8@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=10545;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=W+WRtGTmctGrtw3/m66JfBKmA9pR1W/PsjD+devdzIU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoaJI9lSJypmT/pVMDGKaKDEoyU5tP54H8Fnpex
 IMJ/07rxIWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaGiSPQAKCRCLPIo+Aiko
 1eukB/4vqUjqu0wnNFoF2VUO1FFVEqefOHJ8Tu3Xc9DodXc73Z4W/nw7FwIF0PzFWKkCZAMKPAG
 qwtbubcPasPJV3bbffZReb1cAwP74H78S3Ir5PLC97oebpFBVXrKSo/nF+uPOhcK1VW1CgvvjIo
 0iPSo88/Z0WEjJ7cc9M2PFGJ0LaBH9O9qTyVvzsi5TY1vogEJJN2MqN8ul/988WCQ37+mlBVmQz
 Pr/00/P3e8AMK1okAn74MR7DlAzfJLJwTJ4Zhe3Z/cmxJHP4EzywkBl1ddg+y45ljEizXMq+5Dx
 aq7icbiFI+TG4YNT+u19u709MEAcLtcQCjobzMuaoaMcwc9q
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=H/Pbw/Yi c=1 sm=1 tr=0 ts=6868924e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=J-CC3KfA7NYzMh5jGAsA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: su9qubpd7CDYZflRooOgo4T4VF2NC1CT
X-Proofpoint-GUID: su9qubpd7CDYZflRooOgo4T4VF2NC1CT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDAxNyBTYWx0ZWRfX19FPqmtz4M59
 yJoUVgP88Wzj/P5MqYqMSD1yhpIC4yd/FYxYCY2/4V015kTlBn/leJo57b8ecfFBZrrRGJh1dCM
 g//vUzO9PBsiqcNJuT/aEgmayNAcxuu84d6ApL76P8RoDsCshJac7uQrwQmXcKQSxtwBaRTPPYY
 sEGS8btT2DVmVEJZ75rGSUtHWaYoukC4OwXs2ML9IoTnRK63d3jotbRlB3hRxZtgFKzqjovVKfG
 JeV5HmOx+16iiSoadnVubeQeQJQPmc4jyO3OAlG4bliRuAgKiwANqRBfCuTi4OA2c9NM7f+XiOr
 BtRwaHjaVUpnHRQTeKAAQVY/epMY0i3MffTyr8+kpgTy5EBVssyOzTGWrVVL4zWQUzclJn0jWL8
 63blwnzYCc8t45M/V+dCGQ3XzSoxxlI4qUvBdXteQIr+J0l4d1+ZoL9miMzH2SuwmcXnm/JU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999
 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507050017

Pull common params of YUV formats into corresponding macro definitions,
simplifying format table.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/mdp_format.c | 120 ++++++++++++++++------------------
 1 file changed, 56 insertions(+), 64 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp_format.c b/drivers/gpu/drm/msm/disp/mdp_format.c
index d577b3d53fbebced63792b5c65f50dd45211c8ea..900b2de252a6eb2eac3d0670f1aaa77f7520fd77 100644
--- a/drivers/gpu/drm/msm/disp/mdp_format.c
+++ b/drivers/gpu/drm/msm/disp/mdp_format.c
@@ -244,27 +244,27 @@ static struct csc_cfg csc_convert[CSC_MAX] = {
 	.tile_height = MDP_TILE_HEIGHT_UBWC,                              \
 }
 
-#define INTERLEAVED_YUV_FMT(fmt, a, r, g, b, e0, e1, e2, e3,              \
-alpha, chroma, count, bp, flg, fm, np)                                    \
+#define INTERLEAVED_YUV_FMT(fmt, bp, r, g, b, e0, e1, e2, e3, chroma)     \
 {                                                                         \
 	.pixel_format = DRM_FORMAT_ ## fmt,                               \
 	.fetch_type = MDP_PLANE_INTERLEAVED,                              \
-	.alpha_enable = alpha,                                            \
+	.alpha_enable = false,                                            \
 	.element = { (e0), (e1), (e2), (e3)},                             \
 	.bpc_g_y = g,                                                     \
 	.bpc_b_cb = b,                                                    \
 	.bpc_r_cr = r,                                                    \
-	.bpc_a = a,                                                       \
+	.bpc_a = 0,                                                       \
 	.chroma_sample = chroma,                                          \
-	.unpack_count = count,                                            \
+	.unpack_count = 4,                                                \
 	.bpp = bp,                                                        \
-	.fetch_mode = fm,                                                 \
-	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT | flg,                      \
-	.num_planes = np,                                                 \
+	.fetch_mode = MDP_FETCH_LINEAR,                                   \
+	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT |                           \
+		 MSM_FORMAT_FLAG_YUV,                                     \
+	.num_planes = 1,                                                  \
 	.tile_height = MDP_TILE_HEIGHT_DEFAULT                            \
 }
 
-#define PSEUDO_YUV_FMT(fmt, a, r, g, b, e0, e1, chroma, flg, fm, np)      \
+#define PSEUDO_YUV_FMT(fmt, r, g, b, e0, e1, chroma)                      \
 {                                                                         \
 	.pixel_format = DRM_FORMAT_ ## fmt,                               \
 	.fetch_type = MDP_PLANE_PSEUDO_PLANAR,                            \
@@ -273,13 +273,14 @@ alpha, chroma, count, bp, flg, fm, np)                                    \
 	.bpc_g_y = g,                                                     \
 	.bpc_b_cb = b,                                                    \
 	.bpc_r_cr = r,                                                    \
-	.bpc_a = a,                                                       \
+	.bpc_a = 0,                                                       \
 	.chroma_sample = chroma,                                          \
 	.unpack_count = 2,                                                \
 	.bpp = 2,                                                         \
-	.fetch_mode = fm,                                                 \
-	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT | flg,                      \
-	.num_planes = np,                                                 \
+	.fetch_mode = MDP_FETCH_LINEAR,                                   \
+	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT |                           \
+		 MSM_FORMAT_FLAG_YUV,                                     \
+	.num_planes = 2,                                                  \
 	.tile_height = MDP_TILE_HEIGHT_DEFAULT                            \
 }
 
@@ -303,7 +304,7 @@ flg, fm, np, th)                                                          \
 	.tile_height = th                                                 \
 }
 
-#define PSEUDO_YUV_FMT_LOOSE(fmt, a, r, g, b, e0, e1, chroma, flg, fm, np)\
+#define PSEUDO_YUV_FMT_LOOSE(fmt, r, g, b, e0, e1, chroma)                \
 {                                                                         \
 	.pixel_format = DRM_FORMAT_ ## fmt,                               \
 	.fetch_type = MDP_PLANE_PSEUDO_PLANAR,                            \
@@ -312,13 +313,15 @@ flg, fm, np, th)                                                          \
 	.bpc_g_y = g,                                                     \
 	.bpc_b_cb = b,                                                    \
 	.bpc_r_cr = r,                                                    \
-	.bpc_a = a,                                                       \
+	.bpc_a = 0,                                                       \
 	.chroma_sample = chroma,                                          \
 	.unpack_count = 2,                                                \
 	.bpp = 2,                                                         \
-	.fetch_mode = fm,                                                 \
-	.flags = MSM_FORMAT_FLAG_UNPACK_ALIGN_MSB | flg,                  \
-	.num_planes = np,                                                 \
+	.fetch_mode = MDP_FETCH_LINEAR,                                   \
+	.flags = MSM_FORMAT_FLAG_UNPACK_ALIGN_MSB |                       \
+		 MSM_FORMAT_FLAG_DX |                                     \
+		 MSM_FORMAT_FLAG_YUV,                                     \
+	.num_planes = 2,                                                  \
 	.tile_height = MDP_TILE_HEIGHT_DEFAULT                            \
 }
 
@@ -342,23 +345,23 @@ flg, fm, np, th)                                                          \
 	.tile_height = th                                                 \
 }
 
-#define PLANAR_YUV_FMT(fmt, a, r, g, b, e0, e1, e2, alpha, chroma, bp,    \
-flg, fm, np)                                                      \
+#define PLANAR_YUV_FMT(fmt, bp, r, g, b, e0, e1, e2, chroma)              \
 {                                                                         \
 	.pixel_format = DRM_FORMAT_ ## fmt,                               \
 	.fetch_type = MDP_PLANE_PLANAR,                                   \
-	.alpha_enable = alpha,                                            \
+	.alpha_enable = false,                                            \
 	.element = { (e0), (e1), (e2), 0 },                               \
 	.bpc_g_y = g,                                                     \
 	.bpc_b_cb = b,                                                    \
 	.bpc_r_cr = r,                                                    \
-	.bpc_a = a,                                                       \
+	.bpc_a = 0,                                                       \
 	.chroma_sample = chroma,                                          \
 	.unpack_count = 1,                                                \
 	.bpp = bp,                                                        \
-	.fetch_mode = fm,                                                 \
-	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT | flg,                      \
-	.num_planes = np,                                                 \
+	.fetch_mode = MDP_FETCH_LINEAR,                                   \
+	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT |                           \
+		 MSM_FORMAT_FLAG_YUV,                                     \
+	.num_planes = 3,                                                  \
 	.tile_height = MDP_TILE_HEIGHT_DEFAULT                            \
 }
 
@@ -511,72 +514,61 @@ static const struct msm_format mdp_formats[] = {
 
 	/* 2 plane YUV */
 	PSEUDO_YUV_FMT(NV12,
-		0, BPC8, BPC8, BPC8,
+		BPC8, BPC8, BPC8,
 		C1_B_Cb, C2_R_Cr,
-		CHROMA_420, MSM_FORMAT_FLAG_YUV,
-		MDP_FETCH_LINEAR, 2),
+		CHROMA_420),
 
 	PSEUDO_YUV_FMT(NV21,
-		0, BPC8, BPC8, BPC8,
+		BPC8, BPC8, BPC8,
 		C2_R_Cr, C1_B_Cb,
-		CHROMA_420, MSM_FORMAT_FLAG_YUV,
-		MDP_FETCH_LINEAR, 2),
+		CHROMA_420),
 
 	PSEUDO_YUV_FMT(NV16,
-		0, BPC8, BPC8, BPC8,
+		BPC8, BPC8, BPC8,
 		C1_B_Cb, C2_R_Cr,
-		CHROMA_H2V1, MSM_FORMAT_FLAG_YUV,
-		MDP_FETCH_LINEAR, 2),
+		CHROMA_H2V1),
 
 	PSEUDO_YUV_FMT(NV61,
-		0, BPC8, BPC8, BPC8,
+		BPC8, BPC8, BPC8,
 		C2_R_Cr, C1_B_Cb,
-		CHROMA_H2V1, MSM_FORMAT_FLAG_YUV,
-		MDP_FETCH_LINEAR, 2),
+		CHROMA_H2V1),
 
 	PSEUDO_YUV_FMT_LOOSE(P010,
-		0, BPC8, BPC8, BPC8,
+		BPC8, BPC8, BPC8,
 		C1_B_Cb, C2_R_Cr,
-		CHROMA_420, MSM_FORMAT_FLAG_DX | MSM_FORMAT_FLAG_YUV,
-		MDP_FETCH_LINEAR, 2),
+		CHROMA_420),
 
 	/* 1 plane YUV */
-	INTERLEAVED_YUV_FMT(VYUY,
-		0, BPC8, BPC8, BPC8,
+	INTERLEAVED_YUV_FMT(VYUY, 2,
+		BPC8, BPC8, BPC8,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C0_G_Y,
-		false, CHROMA_H2V1, 4, 2, MSM_FORMAT_FLAG_YUV,
-		MDP_FETCH_LINEAR, 1),
+		CHROMA_H2V1),
 
-	INTERLEAVED_YUV_FMT(UYVY,
-		0, BPC8, BPC8, BPC8,
+	INTERLEAVED_YUV_FMT(UYVY, 2,
+		BPC8, BPC8, BPC8,
 		C1_B_Cb, C0_G_Y, C2_R_Cr, C0_G_Y,
-		false, CHROMA_H2V1, 4, 2, MSM_FORMAT_FLAG_YUV,
-		MDP_FETCH_LINEAR, 1),
+		CHROMA_H2V1),
 
-	INTERLEAVED_YUV_FMT(YUYV,
-		0, BPC8, BPC8, BPC8,
+	INTERLEAVED_YUV_FMT(YUYV, 2,
+		BPC8, BPC8, BPC8,
 		C0_G_Y, C1_B_Cb, C0_G_Y, C2_R_Cr,
-		false, CHROMA_H2V1, 4, 2, MSM_FORMAT_FLAG_YUV,
-		MDP_FETCH_LINEAR, 1),
+		CHROMA_H2V1),
 
-	INTERLEAVED_YUV_FMT(YVYU,
-		0, BPC8, BPC8, BPC8,
+	INTERLEAVED_YUV_FMT(YVYU, 2,
+		BPC8, BPC8, BPC8,
 		C0_G_Y, C2_R_Cr, C0_G_Y, C1_B_Cb,
-		false, CHROMA_H2V1, 4, 2, MSM_FORMAT_FLAG_YUV,
-		MDP_FETCH_LINEAR, 1),
+		CHROMA_H2V1),
 
 	/* 3 plane YUV */
-	PLANAR_YUV_FMT(YUV420,
-		0, BPC8, BPC8, BPC8,
+	PLANAR_YUV_FMT(YUV420, 1,
+		BPC8, BPC8, BPC8,
 		C2_R_Cr, C1_B_Cb, C0_G_Y,
-		false, CHROMA_420, 1, MSM_FORMAT_FLAG_YUV,
-		MDP_FETCH_LINEAR, 3),
+		CHROMA_420),
 
-	PLANAR_YUV_FMT(YVU420,
-		0, BPC8, BPC8, BPC8,
+	PLANAR_YUV_FMT(YVU420, 1,
+		BPC8, BPC8, BPC8,
 		C1_B_Cb, C2_R_Cr, C0_G_Y,
-		false, CHROMA_420, 1, MSM_FORMAT_FLAG_YUV,
-		MDP_FETCH_LINEAR, 3),
+		CHROMA_420),
 };
 
 /*

-- 
2.39.5

