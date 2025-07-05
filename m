Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 721DD280CE0
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 02:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751683663; cv=none; b=ikHLyxzIVY4MYIm1lIfuqEpvnvT9shiA70UdmwTclDe31a6kScd97CQc0fhCbKs3LcEi29axYYRmatzJETpZiOa7yNGuP+wCnxmTkDrS1oaecu7+sJImQr5jJ8T6ZQKpAgiGO4Ap/tNjPm1MKafbUR2B/EDAv2YOgh1m5yyl1iQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751683663; c=relaxed/simple;
	bh=Ys7Z7Kn7IpicXADUQHFTXSQLzecLxokw83FrLPh30bk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eqbvimAyIU3vMRWuyXCwMoNftLeZoUQV1PEhqhcHxoASp11IOv/+bdXzmWvv4zhfbLITAdDxGl1rgV/GCpAFF+el1k+494ibf439S0BTFNkN/ZKkjxiCrNhRLnHJdF171pD6luB0mw5c6W8OGPGHG3qqKfsnIPYuMc4yJp1sCmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CS0qE4OK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CS0qE4OK"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5652EDJ8024445
	for <linux-kernel@vger.kernel.org>; Sat, 5 Jul 2025 02:47:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4s+MSjvTA+3MePRTfCYZPmppEZfrFaoQh7M2mpF98gM=; b=CS0qE4OKxJR+8H9L
	BmnOlW0WjVZgEQLEcQ/c53pZ60fc7h7CQpcDfYEeVOmHgFEgXfm22pdCrRYeuxIU
	FxQ/b0BrwNp3v8qf7ZZouihEwkBSDLORnJ6rGLiwFtoMcRCF79e4Q/ZLU0+oEdZK
	uDxjnPDNOKcQXpASAl4cZiDMbkPVlxwNroac8luBdnUxHRL7K7SILt4+njLU6zE1
	g7WUkDoNDwQcTvUBAbuK3nA3uLkL4saKHfwkwcXUNPvvn7Hvkt7wftAWiyZbsIcn
	PFCBQwzDCGj25dNqCD51+rq+qtq80KwY0fI02SV6lNE6/yNX49sTJFMrNx9Q+4vO
	dzIBYg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47psdq84hs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 05 Jul 2025 02:47:40 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5e2872e57so220093985a.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 19:47:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751683659; x=1752288459;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4s+MSjvTA+3MePRTfCYZPmppEZfrFaoQh7M2mpF98gM=;
        b=q43vaQobDe9XLySR/41BkRdmcVKACUkcJvg57+Ma+nhHholgfkLcRLJ/E+KR1q7Y8y
         lxbHfmWTiXCq9aWE+DTn+jDIcStOjaOTEOAtIqmj5kny02k1U/iaPh2VMnS3phFqtGQU
         9f49hIpjBKFk4pi2yG7OZA32UPkdplcVeIlJMVfLnkSALTTQBlirpnjalBYu6LLOiLIK
         Ehv83xj2gRuGlrjDpPhC3MK5tYKYPHD0DjDkaXmXr2JjRw/kmr4r12GrBjTUAJkJGCl4
         0U2w+ggtX/pfVonekNXfphllwkNkoBGvQyKGYhc9p64wAw7dXwuYAH+PgzYDPay2P26N
         mgNQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJTk8zCLOE+K3ijGSylm1D0IJRV3bcEXdtor1XY+DYadpl37xKaJys+ovoHrFuEhBD5mQ8Mx5shKcEYno=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkjwBycZ2wltdFe3J42Qmnd09ZejBnzLDkz2RSuNIRKkPsCgeM
	E+1e6wUFH+Ih7/Gfi5Ld3kE0SjkJPHt37bNftiDj69D2BgxUCGEbmKkPk5/soaRV1ww/bYbuQ57
	aUoTQwpeBQT7L93cVT3CRXj+uRqwhmgj08biR6Dh5j6D8rt3bELx6ZgtIr2weQXOeuEmEfnEfkj
	x/3Q==
X-Gm-Gg: ASbGncuxCILgPSlqWQ+0oun5xsNb5Y/7zpRL5SwnFrrf4zen4T0KqHHpdDFJoHexi4G
	nTZJ7UIMP6NKBcmXu0s5tQe0/J+1b9o7rf1+B14TbETJUvHlo3zH3Ta7BGtO3aV5tLl8esycuWc
	J4VQJITsngjUWIrj0B24bgN2MJAjv/Nz8NhSft/uVzqzJGs/umfi8ekUrZrLLqXkASBn+L4QLtL
	CCzUjbv8XHdCmP86pxQ4V3hkw3TS3uZuOPq6gpwit9mm7UqjAG54OMyYxfhZeA5DQ9EodAvLVgV
	xTamQ10E2FFuyYiy2R+dE4pgVjUQV0YQklA0AqPfzb7/mgdgqJwkP4UrZn4Mn+93gTlh2KTm4Sw
	+21WIXFXjUKGsAsS5M5qGLWbrDrdSB78JA4Y=
X-Received: by 2002:a05:620a:2913:b0:7d3:d156:37d6 with SMTP id af79cd13be357-7d5df102b4amr604839785a.6.1751683658759;
        Fri, 04 Jul 2025 19:47:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFz3mVn+ryYa5afaVTp7LcwhBfN+F01PPD3EQ58QXtfy9B/SKKE3QNU6Pu4gCJujhTtpPREOA==
X-Received: by 2002:a05:620a:2913:b0:7d3:d156:37d6 with SMTP id af79cd13be357-7d5df102b4amr604836085a.6.1751683658176;
        Fri, 04 Jul 2025 19:47:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32e1b1418b3sm4092411fa.76.2025.07.04.19.47.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 19:47:36 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 05 Jul 2025 05:47:25 +0300
Subject: [PATCH 04/12] drm/msm/disp: simplify RGB{,A,X} formats definitions
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250705-dpu-formats-v1-4-40f0bb31b8c8@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=15137;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Ys7Z7Kn7IpicXADUQHFTXSQLzecLxokw83FrLPh30bk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoaJI8GKkSFhy7Xtn6tJpCt9lMtAxCXy2+FsC72
 rWL+gwkk1WJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaGiSPAAKCRCLPIo+Aiko
 1eEWB/9WnofY8sZlQhAZ6/h5NWowFZILMfYcaCVNttD84mGELL7OiG/Z8uFqhhd5QqY0DFCE1CX
 4n7/b44dDVexKSeBBXz4QYmPsAwFc/cntmAX/Ey+jG0RWVohV2eONc8X72JtTMMMlabv0bOVwTB
 GU/95f+wnYNamDe8XVRFpt15CJ0iqZgW4BAHd4EtbZVMX0U2yMIzKy8W13kAIZNdLkAcIEuoB3k
 R7oGaUAKvGbX0bQ9ojM0qDQqHQrGWg7wvplJSejFF2sT+pAtgoETv/ieuv4QQ19N8ikRZFoKjll
 YOEGj6E5stkKw4MxZJJA/sq7vfYgZTSS7bAG2hrfDduW1pXq
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=ffSty1QF c=1 sm=1 tr=0 ts=6868924c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=SE7Ho6_bQ6tgKpEGU9wA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: ohxAVIXaQCGmfdKsIgV3Rs9oP3NAmfRQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDAxNyBTYWx0ZWRfX8uNXom+JXEFj
 t+xG+x1YrdGf6/xFRueLRfDheOmh0vXTNieYuNcuD+cBi9N53oBvxFVRz7kTiBzlIOaQfLLH2vz
 jG2QenmyvMI0RiULiScr26anHQvgM1jhVlwQY5uunOOPHR4PcBE1TZds5UMypjXqrFjXfQelX2h
 XiXnYNQFHJzPgnYCRQjf/rKElL6XEqNl3mNrbbWnEiywlGi8R+Xksuy+t+8XYoxxrhYsXBZaDWU
 9nsRjnpuzPIevoernPYJwdkvvrtBH9gCA96a3iCyxTMkC24Yqbkrn0K3YVhopRlxrvnkv1jbPXa
 kUU/EKH+17Y7JiLDjOIQlKEgXoso0m2pmf730mwgfQdIaCvvCJLOdElPJosOD5MIPtyU2lSHTn0
 vGU/rZYjONPKz/NRZa1QbH6icLSw8GhL40FX8p/IfLaxeq1UeuwNwJSMAsFZjK4uw/si+Qk+
X-Proofpoint-GUID: ohxAVIXaQCGmfdKsIgV3Rs9oP3NAmfRQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxlogscore=999 mlxscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 clxscore=1015 suspectscore=0 impostorscore=0 lowpriorityscore=0
 spamscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507050017

Define several additional macros, capturing RGB format classes, in order
to simplify defining particular RGB* format.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/mdp_format.c | 275 +++++++++++++++++++---------------
 1 file changed, 158 insertions(+), 117 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp_format.c b/drivers/gpu/drm/msm/disp/mdp_format.c
index 09a5bffd838b8a4fd3c22622e82dcf9fb99b5117..28cef986f2d662484afd47440a79393c48256ff5 100644
--- a/drivers/gpu/drm/msm/disp/mdp_format.c
+++ b/drivers/gpu/drm/msm/disp/mdp_format.c
@@ -66,22 +66,99 @@ static struct csc_cfg csc_convert[CSC_MAX] = {
 #define MDP_TILE_HEIGHT_UBWC	4
 #define MDP_TILE_HEIGHT_NV12	8
 
-#define INTERLEAVED_RGB_FMT(fmt, a, r, g, b, e0, e1, e2, e3, uc, alpha,   \
-bp, flg)                                                                  \
+#define INTERLEAVED_RGB_FMT(fmt, bp, r, g, b, e0, e1, e2)                 \
 {                                                                         \
 	.pixel_format = DRM_FORMAT_ ## fmt,                               \
 	.fetch_type = MDP_PLANE_INTERLEAVED,                              \
-	.alpha_enable = alpha,                                            \
+	.alpha_enable = false,                                            \
+	.element = { (e0), (e1), (e2), 0 },                               \
+	.bpc_g_y = g,                                                     \
+	.bpc_b_cb = b,                                                    \
+	.bpc_r_cr = r,                                                    \
+	.bpc_a = 0,                                                       \
+	.chroma_sample = CHROMA_FULL,                                     \
+	.unpack_count = 3,                                                \
+	.bpp = bp,                                                        \
+	.fetch_mode = MDP_FETCH_LINEAR,                                   \
+	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT,                            \
+	.num_planes = 1,                                                  \
+	.tile_height = MDP_TILE_HEIGHT_DEFAULT                            \
+}
+
+#define INTERLEAVED_RGBA_FMT(fmt, bp, a, r, g, b, e0, e1, e2, e3)         \
+{                                                                         \
+	.pixel_format = DRM_FORMAT_ ## fmt,                               \
+	.fetch_type = MDP_PLANE_INTERLEAVED,                              \
+	.alpha_enable = true,                                             \
 	.element = { (e0), (e1), (e2), (e3) },                            \
 	.bpc_g_y = g,                                                     \
 	.bpc_b_cb = b,                                                    \
 	.bpc_r_cr = r,                                                    \
 	.bpc_a = a,                                                       \
 	.chroma_sample = CHROMA_FULL,                                     \
-	.unpack_count = uc,                                               \
+	.unpack_count = 4,                                                \
 	.bpp = bp,                                                        \
 	.fetch_mode = MDP_FETCH_LINEAR,                                   \
-	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT | flg,                      \
+	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT,                            \
+	.num_planes = 1,                                                  \
+	.tile_height = MDP_TILE_HEIGHT_DEFAULT                            \
+}
+
+#define INTERLEAVED_RGBX_FMT(fmt, bp, a, r, g, b, e0, e1, e2, e3)         \
+{                                                                         \
+	.pixel_format = DRM_FORMAT_ ## fmt,                               \
+	.fetch_type = MDP_PLANE_INTERLEAVED,                              \
+	.alpha_enable = false,                                            \
+	.element = { (e0), (e1), (e2), (e3) },                            \
+	.bpc_g_y = g,                                                     \
+	.bpc_b_cb = b,                                                    \
+	.bpc_r_cr = r,                                                    \
+	.bpc_a = a,                                                       \
+	.chroma_sample = CHROMA_FULL,                                     \
+	.unpack_count = 4,                                                \
+	.bpp = bp,                                                        \
+	.fetch_mode = MDP_FETCH_LINEAR,                                   \
+	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT,                            \
+	.num_planes = 1,                                                  \
+	.tile_height = MDP_TILE_HEIGHT_DEFAULT                            \
+}
+
+#define INTERLEAVED_RGBA_DX_FMT(fmt, bp, a, r, g, b, e0, e1, e2, e3)      \
+{                                                                         \
+	.pixel_format = DRM_FORMAT_ ## fmt,                               \
+	.fetch_type = MDP_PLANE_INTERLEAVED,                              \
+	.alpha_enable = true,                                             \
+	.element = { (e0), (e1), (e2), (e3) },                            \
+	.bpc_g_y = g,                                                     \
+	.bpc_b_cb = b,                                                    \
+	.bpc_r_cr = r,                                                    \
+	.bpc_a = a,                                                       \
+	.chroma_sample = CHROMA_FULL,                                     \
+	.unpack_count = 4,                                                \
+	.bpp = bp,                                                        \
+	.fetch_mode = MDP_FETCH_LINEAR,                                   \
+	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT |                           \
+		 MSM_FORMAT_FLAG_DX,                                      \
+	.num_planes = 1,                                                  \
+	.tile_height = MDP_TILE_HEIGHT_DEFAULT                            \
+}
+
+#define INTERLEAVED_RGBX_DX_FMT(fmt, bp, a, r, g, b, e0, e1, e2, e3)      \
+{                                                                         \
+	.pixel_format = DRM_FORMAT_ ## fmt,                               \
+	.fetch_type = MDP_PLANE_INTERLEAVED,                              \
+	.alpha_enable = false,                                            \
+	.element = { (e0), (e1), (e2), (e3) },                            \
+	.bpc_g_y = g,                                                     \
+	.bpc_b_cb = b,                                                    \
+	.bpc_r_cr = r,                                                    \
+	.bpc_a = a,                                                       \
+	.chroma_sample = CHROMA_FULL,                                     \
+	.unpack_count = 4,                                                \
+	.bpp = bp,                                                        \
+	.fetch_mode = MDP_FETCH_LINEAR,                                   \
+	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT |                           \
+		 MSM_FORMAT_FLAG_DX,                                      \
 	.num_planes = 1,                                                  \
 	.tile_height = MDP_TILE_HEIGHT_DEFAULT                            \
 }
@@ -225,185 +302,149 @@ flg, fm, np)                                                      \
 }
 
 static const struct msm_format mdp_formats[] = {
-	INTERLEAVED_RGB_FMT(ARGB8888,
+	INTERLEAVED_RGBA_FMT(ARGB8888, 4,
 		BPC8A, BPC8, BPC8, BPC8,
-		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
-		true, 4, 0),
+		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA),
 
-	INTERLEAVED_RGB_FMT(ABGR8888,
+	INTERLEAVED_RGBA_FMT(ABGR8888, 4,
 		BPC8A, BPC8, BPC8, BPC8,
-		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		true, 4, 0),
+		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA),
 
-	INTERLEAVED_RGB_FMT(XBGR8888,
+	INTERLEAVED_RGBX_FMT(XBGR8888, 4,
 		BPC8A, BPC8, BPC8, BPC8,
-		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		false, 4, 0),
+		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA),
 
-	INTERLEAVED_RGB_FMT(RGBA8888,
+	INTERLEAVED_RGBA_FMT(RGBA8888, 4,
 		BPC8A, BPC8, BPC8, BPC8,
-		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
-		true, 4, 0),
+		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr),
 
-	INTERLEAVED_RGB_FMT(BGRA8888,
+	INTERLEAVED_RGBA_FMT(BGRA8888, 4,
 		BPC8A, BPC8, BPC8, BPC8,
-		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
-		true, 4, 0),
+		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb),
 
-	INTERLEAVED_RGB_FMT(BGRX8888,
+	INTERLEAVED_RGBX_FMT(BGRX8888, 4,
 		BPC8A, BPC8, BPC8, BPC8,
-		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
-		false, 4, 0),
+		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb),
 
-	INTERLEAVED_RGB_FMT(XRGB8888,
+	INTERLEAVED_RGBX_FMT(XRGB8888, 4,
 		BPC8A, BPC8, BPC8, BPC8,
-		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
-		false, 4, 0),
+		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA),
 
-	INTERLEAVED_RGB_FMT(RGBX8888,
+	INTERLEAVED_RGBX_FMT(RGBX8888, 4,
 		BPC8A, BPC8, BPC8, BPC8,
-		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
-		false, 4, 0),
+		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr),
 
-	INTERLEAVED_RGB_FMT(RGB888,
-		0, BPC8, BPC8, BPC8,
-		C1_B_Cb, C0_G_Y, C2_R_Cr, 0, 3,
-		false, 3, 0),
+	INTERLEAVED_RGB_FMT(RGB888, 3,
+		BPC8, BPC8, BPC8,
+		C1_B_Cb, C0_G_Y, C2_R_Cr),
 
-	INTERLEAVED_RGB_FMT(BGR888,
-		0, BPC8, BPC8, BPC8,
-		C2_R_Cr, C0_G_Y, C1_B_Cb, 0, 3,
-		false, 3, 0),
+	INTERLEAVED_RGB_FMT(BGR888, 3,
+		BPC8, BPC8, BPC8,
+		C2_R_Cr, C0_G_Y, C1_B_Cb),
 
-	INTERLEAVED_RGB_FMT(RGB565,
-		0, BPC5, BPC6, BPC5,
-		C1_B_Cb, C0_G_Y, C2_R_Cr, 0, 3,
-		false, 2, 0),
+	INTERLEAVED_RGB_FMT(RGB565, 2,
+		BPC5, BPC6, BPC5,
+		C1_B_Cb, C0_G_Y, C2_R_Cr),
 
-	INTERLEAVED_RGB_FMT(BGR565,
-		0, BPC5, BPC6, BPC5,
-		C2_R_Cr, C0_G_Y, C1_B_Cb, 0, 3,
-		false, 2, 0),
+	INTERLEAVED_RGB_FMT(BGR565, 2,
+		BPC5, BPC6, BPC5,
+		C2_R_Cr, C0_G_Y, C1_B_Cb),
 
-	INTERLEAVED_RGB_FMT(ARGB1555,
+	INTERLEAVED_RGBA_FMT(ARGB1555, 2,
 		BPC1A, BPC5, BPC5, BPC5,
-		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
-		true, 2, 0),
+		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA),
 
-	INTERLEAVED_RGB_FMT(ABGR1555,
+	INTERLEAVED_RGBA_FMT(ABGR1555, 2,
 		BPC1A, BPC5, BPC5, BPC5,
-		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		true, 2, 0),
+		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA),
 
-	INTERLEAVED_RGB_FMT(RGBA5551,
+	INTERLEAVED_RGBA_FMT(RGBA5551, 2,
 		BPC1A, BPC5, BPC5, BPC5,
-		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
-		true, 2, 0),
+		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr),
 
-	INTERLEAVED_RGB_FMT(BGRA5551,
+	INTERLEAVED_RGBA_FMT(BGRA5551, 2,
 		BPC1A, BPC5, BPC5, BPC5,
-		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
-		true, 2, 0),
+		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb),
 
-	INTERLEAVED_RGB_FMT(XRGB1555,
+	INTERLEAVED_RGBX_FMT(XRGB1555, 2,
 		BPC1A, BPC5, BPC5, BPC5,
-		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
-		false, 2, 0),
+		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA),
 
-	INTERLEAVED_RGB_FMT(XBGR1555,
+	INTERLEAVED_RGBX_FMT(XBGR1555, 2,
 		BPC1A, BPC5, BPC5, BPC5,
-		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		false, 2, 0),
+		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA),
 
-	INTERLEAVED_RGB_FMT(RGBX5551,
+	INTERLEAVED_RGBX_FMT(RGBX5551, 2,
 		BPC1A, BPC5, BPC5, BPC5,
-		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
-		false, 2, 0),
+		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr),
 
-	INTERLEAVED_RGB_FMT(BGRX5551,
+	INTERLEAVED_RGBX_FMT(BGRX5551, 2,
 		BPC1A, BPC5, BPC5, BPC5,
-		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
-		false, 2, 0),
+		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb),
 
-	INTERLEAVED_RGB_FMT(ARGB4444,
+	INTERLEAVED_RGBA_FMT(ARGB4444, 2,
 		BPC4A, BPC4, BPC4, BPC4,
-		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
-		true, 2, 0),
+		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA),
 
-	INTERLEAVED_RGB_FMT(ABGR4444,
+	INTERLEAVED_RGBA_FMT(ABGR4444, 2,
 		BPC4A, BPC4, BPC4, BPC4,
-		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		true, 2, 0),
+		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA),
 
-	INTERLEAVED_RGB_FMT(RGBA4444,
+	INTERLEAVED_RGBA_FMT(RGBA4444, 2,
 		BPC4A, BPC4, BPC4, BPC4,
-		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
-		true, 2, 0),
+		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr),
 
-	INTERLEAVED_RGB_FMT(BGRA4444,
+	INTERLEAVED_RGBA_FMT(BGRA4444, 2,
 		BPC4A, BPC4, BPC4, BPC4,
-		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
-		true, 2, 0),
+		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb),
 
-	INTERLEAVED_RGB_FMT(XRGB4444,
+	INTERLEAVED_RGBX_FMT(XRGB4444, 2,
 		BPC4A, BPC4, BPC4, BPC4,
-		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
-		false, 2, 0),
+		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA),
 
-	INTERLEAVED_RGB_FMT(XBGR4444,
+	INTERLEAVED_RGBX_FMT(XBGR4444, 2,
 		BPC4A, BPC4, BPC4, BPC4,
-		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		false, 2, 0),
+		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA),
 
-	INTERLEAVED_RGB_FMT(RGBX4444,
+	INTERLEAVED_RGBX_FMT(RGBX4444, 2,
 		BPC4A, BPC4, BPC4, BPC4,
-		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
-		false, 2, 0),
+		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr),
 
-	INTERLEAVED_RGB_FMT(BGRX4444,
+	INTERLEAVED_RGBX_FMT(BGRX4444, 2,
 		BPC4A, BPC4, BPC4, BPC4,
-		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
-		false, 2, 0),
+		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb),
 
-	INTERLEAVED_RGB_FMT(BGRA1010102,
+	INTERLEAVED_RGBA_DX_FMT(BGRA1010102, 4,
 		BPC8A, BPC8, BPC8, BPC8,
-		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
-		true, 4, MSM_FORMAT_FLAG_DX),
+		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb),
 
-	INTERLEAVED_RGB_FMT(RGBA1010102,
+	INTERLEAVED_RGBA_DX_FMT(RGBA1010102, 4,
 		BPC8A, BPC8, BPC8, BPC8,
-		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
-		true, 4, MSM_FORMAT_FLAG_DX),
+		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr),
 
-	INTERLEAVED_RGB_FMT(ABGR2101010,
+	INTERLEAVED_RGBA_DX_FMT(ABGR2101010, 4,
 		BPC8A, BPC8, BPC8, BPC8,
-		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		true, 4, MSM_FORMAT_FLAG_DX),
+		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA),
 
-	INTERLEAVED_RGB_FMT(ARGB2101010,
+	INTERLEAVED_RGBA_DX_FMT(ARGB2101010, 4,
 		BPC8A, BPC8, BPC8, BPC8,
-		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
-		true, 4, MSM_FORMAT_FLAG_DX),
+		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA),
 
-	INTERLEAVED_RGB_FMT(XRGB2101010,
+	INTERLEAVED_RGBX_DX_FMT(XRGB2101010, 4,
 		BPC8A, BPC8, BPC8, BPC8,
-		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
-		false, 4, MSM_FORMAT_FLAG_DX),
+		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA),
 
-	INTERLEAVED_RGB_FMT(BGRX1010102,
+	INTERLEAVED_RGBX_DX_FMT(BGRX1010102, 4,
 		BPC8A, BPC8, BPC8, BPC8,
-		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
-		false, 4, MSM_FORMAT_FLAG_DX),
+		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb),
 
-	INTERLEAVED_RGB_FMT(XBGR2101010,
+	INTERLEAVED_RGBX_DX_FMT(XBGR2101010, 4,
 		BPC8A, BPC8, BPC8, BPC8,
-		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		false, 4, MSM_FORMAT_FLAG_DX),
+		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA),
 
-	INTERLEAVED_RGB_FMT(RGBX1010102,
+	INTERLEAVED_RGBX_DX_FMT(RGBX1010102, 4,
 		BPC8A, BPC8, BPC8, BPC8,
-		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
-		false, 4, MSM_FORMAT_FLAG_DX),
+		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr),
 
 	/* --- RGB formats above / YUV formats below this line --- */
 

-- 
2.39.5

