Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2CB228D8DB
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 02:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751683671; cv=none; b=nSP9Mn0K7eJzuWqoyZq9ZqbrpFUOV50c3osyHCnOMVAMaxMKcEjPHtvaJpCCwYS+7Go/ydYN0IUgOii2F4gb/HFoL7MgYmbAXnTb8yJbGIFMKaLFcbkK9uxB7FuZXPJ9Ik1gDWnRdEzyOexf+8SbyBnAW9AoJR6wJCN59uaWjN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751683671; c=relaxed/simple;
	bh=DW4Sf0tr+opR2OUJSjiXEm6tu/MiyrcROuHNPuR3uTM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SObPzr9WQ4DrjLtV7FSbiCJ2Qlv692M9qDCw/+RXP/lJt1787cqPAdrY2o4hEz9KzyYrsA6S+1eQzPWOYV0FaSFx2RHFOBRhSR9TEjJO8tDSuuJdORpFovPC84nME2/N8Ssf9sLFXkVXNDq1K2WnGy2idVO9fivwxs7e5K/c/cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PZPoAGJe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PZPoAGJe"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5651tHD3004592
	for <linux-kernel@vger.kernel.org>; Sat, 5 Jul 2025 02:47:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DsxNnig03igp0yVOfI6tKLCmpj5w+U2k2ajZF4YWfO4=; b=PZPoAGJeZGfCR9mV
	0iCVrfmV6+JUjcMK7WNrMx4fgYpz0bczAJwpKWzgq7bgImXr8IJ3M4su52r6V+6i
	zI40I032smCZgdpnDnPyoPAkPSekv6ozUYm3pXoLaVcEY1N+TLpk2AB55xbK3ODA
	s4pe5Dwk7qClY2n9DEkxPnlMVi42+KaMtoOfH4+UNbMrkQQv+FYyHzHQapk9nraj
	9lVPdZf7/6M0PwzrXZrLIIWwwd+bVluRMGl4fXmkYITtf89I56jQJwtmPqW9q7nJ
	BamITs8fRhiCuugMoxphAl02oN1yqz41+aMP5+PKpQrZXbQeePUjGevb9W3KlVHa
	PgbDdw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47nh9s6mqc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 05 Jul 2025 02:47:48 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4a587c85a60so26253441cf.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 19:47:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751683667; x=1752288467;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DsxNnig03igp0yVOfI6tKLCmpj5w+U2k2ajZF4YWfO4=;
        b=EZ2iuWYb6Ef2qvl+tTa2/EyGNQKNaDI15ROzeS8G0td/GexrFKwaGJQiDWjt6Ri58w
         fGudOnSOJ8yn8zY1CHWg8x/qtqUcnAvikUOF8pBiSLPb718C7HDOsIFHH6MDMBtr5NKb
         ZuC9mNNGz08PLrf05MNGfiMFc3I4ch8qvU9D+bVs37dZ6aWpWaSFMAADmCwwgUQGQLPl
         gg1tHaDUdyXvQg16uBN8DoIcswlLC6ww5Vy4mpzJkBBZbZSe0W4pADbYScU+jdiQK2RY
         aILw5rMcMF054lQFa7ChM1V3qBqagJHUyYvqyx+JRQwHH0qhtyF1S7oFK0vVaUTXKTUa
         jTJg==
X-Forwarded-Encrypted: i=1; AJvYcCXukApzBacC1AKeG58WBNzoeCi6NsWdnXtdDbc1dg5vZh2ls82xKYSv6gPVxRQ5vZZVNdW6QJMH+9Bnb08=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxDKv1PSyORQL6khiQOJHVR/TGqAixCXdI757gN41IR3D4ZU1C
	71/zgV1L5FRSL2n0C8sWePt9bsu3tbqs3gLMVv4RvbGlOPiMst/UiCFfRPZCzs2PpOfW0r4TZTA
	CFRp6jvWCjpZnZuQVdyDWDXp32v25jKPM30Ccm0zmi1oST9goAf0OFsDbHVszSZ3MfJs=
X-Gm-Gg: ASbGncu+pedh7RsElCFJqPVWOHV2w2eR9EC/bJQcZckDCJr6zdzU4JJRD8Y66bovUhc
	OPUlLygzCsNKrB2wCNYwN+C1rUtbYv+ix2OSh8szvY57V8RjKpz4BApK7QaghPknkJSrWDVP1Oz
	8KmEGAPeE4goEVsgXOBKUtGvurxvb+ZvY77rOI3hJ5G1XrBVFSuILz7gaskDIOx5fZ90yXyWkSh
	/kDZlL98akE2cwTerMUE3uRMwe1lLqbM1x2PcOT0cq1S6gXTp4zUXPlEr3heQWe132BI65LrA51
	XW7U551E3b3vB+iBKUgCaNFO4aZaXgFRciBqKc/7wJzDxAIAP9M6GNiiWcBw9MXBRDC7FY1WdWa
	ff4uNbuEK20aJqH3l7tBoaecPqr7BKOvBQuw=
X-Received: by 2002:a05:620a:408d:b0:7d3:a66d:4f3c with SMTP id af79cd13be357-7d5ef0fe619mr170044885a.7.1751683667566;
        Fri, 04 Jul 2025 19:47:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGiYqdfjL7Rn1SxBAuEeKUyyr6SwsvudYw1VMr9DlWZRcvbzZcnGwoHupwmPfh/gZLRwrzYuQ==
X-Received: by 2002:a05:620a:408d:b0:7d3:a66d:4f3c with SMTP id af79cd13be357-7d5ef0fe619mr170043085a.7.1751683667029;
        Fri, 04 Jul 2025 19:47:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32e1b1418b3sm4092411fa.76.2025.07.04.19.47.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 19:47:46 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 05 Jul 2025 05:47:30 +0300
Subject: [PATCH 09/12] drm/msm/dpu: simplify
 _dpu_format_populate_plane_sizes_*
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250705-dpu-formats-v1-9-40f0bb31b8c8@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3740;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=DW4Sf0tr+opR2OUJSjiXEm6tu/MiyrcROuHNPuR3uTM=;
 b=owEBbAGT/pANAwAKAYs8ij4CKSjVAcsmYgBoaJI9rmMP3gq4UEySExej8M9BSExYQdJGSXRnL
 CmDHN16TrqJATIEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaGiSPQAKCRCLPIo+Aiko
 1X4uB/dCXfk0D0p0vS2Zp6nbCLQR+AhoBVHk795IPjRAMJ4YsMi8FHpaPRmWJakqNpGevfXgrU9
 fUNyX8afIXDOs8j3pL9OQE3mQQY6183ogr4HfT4zBxV2ftowdVhu58xzAWkZYqFzh1s8ySi0/Ry
 fdjLfkM+LkJwpITKi6Kie51fZbQ4TgVXq7A26KdN86WN08U/QXqGCJwDSADvlNAnPebdXAgU6GC
 TAXimEsAJ4gkjUe4CZz0C88YNgS6cSS0Da73LQhaM+4yjq6nE1qAIzJNAqZXIAkT6+EE+paF9GE
 1u7rxzblO4O3zryC98asbDGHG2um+iTJcBlELR3F6MYhlzM=
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=frrcZE4f c=1 sm=1 tr=0 ts=68689254 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=uxSOIRPgPw5i5GT2uqUA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDAxNyBTYWx0ZWRfXxeW45R4N1tBZ
 HCiuFnoll/VMLH2u8bNbRpxzO4Cnj9phRi7iCQ94QH16ThxzJ6KaXBCAWEml2FBvjclMNYQiypn
 nCuWovudoPiMALExvbfy36lXYZQAVuQoMEFTQvfJmLp8hIXcQ92fP7tuUejPq4kRpRj3PQ+1JrU
 jQGF+FhnpBGeBwbbhaahsyQaItDyzKUehi+eOhceG2HXwO4wLhYL2Z1vFW6OlwOGnmLL7om0Gc7
 EfqCtGI64BCLWjNuOoCA0eFjRPQxAaXEvEImJRa/6fovUde5oTNhtV9lf6AQYMp72wmK6rRkHvt
 j/zvYhv3nWRDuoPioIaGd0sKtRzse00rLtDx/j5BizfHkfIzBJZu6Qpn7sKgiPi80iCG6gFHGkL
 TDwQfMOlSJzCn0dsQ0orBH93nzKK70sDm387+5dl/gMcRi9CYVRqhuR9V3AHsmJdCBpvgm/F
X-Proofpoint-GUID: ZNNYQOc7cUvybF0_TTLXz2M2Sesf8CPI
X-Proofpoint-ORIG-GUID: ZNNYQOc7cUvybF0_TTLXz2M2Sesf8CPI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=999 bulkscore=0 spamscore=0 adultscore=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0 mlxscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507050017

Move common bits of _dpu_format_populate_plane_sizes_ubwc() and
_linear() to dpu_format_populate_plane_sizes(), reducing unnecessary
duplication and simplifying code flow fror the UBWC function.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c | 41 +++++++++++++----------------
 1 file changed, 19 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
index 59c9427da7dda07b8e8ee3d070d2dfb3c165698e..195a6b7c4075eef40e7a5d0fee208168421cee35 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
@@ -95,15 +95,9 @@ static int _dpu_format_populate_plane_sizes_ubwc(
 		struct drm_framebuffer *fb,
 		struct dpu_hw_fmt_layout *layout)
 {
-	int i;
 	int color;
 	bool meta = MSM_FORMAT_IS_UBWC(fmt);
 
-	memset(layout, 0, sizeof(struct dpu_hw_fmt_layout));
-	layout->width = fb->width;
-	layout->height = fb->height;
-	layout->num_planes = fmt->num_planes;
-
 	color = _dpu_format_get_media_color_ubwc(fmt);
 	if (color < 0) {
 		DRM_ERROR("UBWC format not supported for fmt: %p4cc\n",
@@ -128,7 +122,7 @@ static int _dpu_format_populate_plane_sizes_ubwc(
 			uv_sclines, DPU_UBWC_PLANE_SIZE_ALIGNMENT);
 
 		if (!meta)
-			goto done;
+			return 0;
 
 		layout->num_planes += 2;
 		layout->plane_pitch[2] = VENUS_Y_META_STRIDE(color, fb->width);
@@ -152,7 +146,8 @@ static int _dpu_format_populate_plane_sizes_ubwc(
 			rgb_scanlines, DPU_UBWC_PLANE_SIZE_ALIGNMENT);
 
 		if (!meta)
-			goto done;
+			return 0;
+
 		layout->num_planes += 2;
 		layout->plane_pitch[2] = VENUS_RGB_META_STRIDE(color, fb->width);
 		rgb_meta_scanlines = VENUS_RGB_META_SCANLINES(color, fb->height);
@@ -160,10 +155,6 @@ static int _dpu_format_populate_plane_sizes_ubwc(
 			rgb_meta_scanlines, DPU_UBWC_PLANE_SIZE_ALIGNMENT);
 	}
 
-done:
-	for (i = 0; i < DPU_MAX_PLANES; i++)
-		layout->total_size += layout->plane_size[i];
-
 	return 0;
 }
 
@@ -174,11 +165,6 @@ static int _dpu_format_populate_plane_sizes_linear(
 {
 	int i;
 
-	memset(layout, 0, sizeof(struct dpu_hw_fmt_layout));
-	layout->width = fb->width;
-	layout->height = fb->height;
-	layout->num_planes = fmt->num_planes;
-
 	/* Due to memset above, only need to set planes of interest */
 	if (fmt->fetch_type == MDP_PLANE_INTERLEAVED) {
 		layout->num_planes = 1;
@@ -235,9 +221,6 @@ static int _dpu_format_populate_plane_sizes_linear(
 		}
 	}
 
-	for (i = 0; i < DPU_MAX_PLANES; i++)
-		layout->total_size += layout->plane_size[i];
-
 	return 0;
 }
 
@@ -254,6 +237,7 @@ int dpu_format_populate_plane_sizes(
 		struct dpu_hw_fmt_layout *layout)
 {
 	const struct msm_format *fmt;
+	int ret, i;
 
 	if (!layout || !fb) {
 		DRM_ERROR("invalid pointer\n");
@@ -268,10 +252,23 @@ int dpu_format_populate_plane_sizes(
 
 	fmt = msm_framebuffer_format(fb);
 
+	memset(layout, 0, sizeof(struct dpu_hw_fmt_layout));
+	layout->width = fb->width;
+	layout->height = fb->height;
+	layout->num_planes = fmt->num_planes;
+
 	if (MSM_FORMAT_IS_UBWC(fmt) || MSM_FORMAT_IS_TILE(fmt))
-		return _dpu_format_populate_plane_sizes_ubwc(fmt, fb, layout);
+		ret = _dpu_format_populate_plane_sizes_ubwc(fmt, fb, layout);
+	else
+		ret = _dpu_format_populate_plane_sizes_linear(fmt, fb, layout);
 
-	return _dpu_format_populate_plane_sizes_linear(fmt, fb, layout);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < DPU_MAX_PLANES; i++)
+		layout->total_size += layout->plane_size[i];
+
+	return 0;
 }
 
 static void _dpu_format_populate_addrs_ubwc(struct msm_gem_address_space *aspace,

-- 
2.39.5

