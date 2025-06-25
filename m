Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEDEF29E0E7
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 17:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750873045; cv=none; b=qs+YMj0BgjL9EmbXS1CRNia9hP6wjzpVHazrfY62X4rPxUpKN7Mp+bi3vqtEMPn5x2ftoykjECgyZaLhTwMVqqqodC39p8uKDpmmvqdD+fzYNwac4dVpY6G7PzfseJF5PO7Pw4VjY5tFJbQe2inYP/rKfWKiUcoBes+q6xr6YFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750873045; c=relaxed/simple;
	bh=7CoLpKlmz/QGjr31AKeTMJknZT5fUDMYKkXULdIt2Ac=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZXb86F7Bb21t/rnwE892XKEeVEmPKgVL010Tovkxu0wxaKCoh2lXDZ7E6+uwNWqRg4swIxlP7VTrd8lHGjK69Lk0DBhOzljPFqYUGqauzXCrigO81L0n4q6hPMfgSUyO0qRih8uwjjcGGW2n4FZXXsC6Pd8LzvEwWdtHBTt5YM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VwloIaqY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VwloIaqY"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PABm78029963
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 17:37:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=L3IkuLMHxBT
	vbI+yz+IctwdTPNqPbXWCWa1wtpGui48=; b=VwloIaqYjPnsCDbew6FnKFsRP2k
	zWH1+upcU0ueRhEgPIQ/2T9l4y8v06qiu3ncrrPihAaCWKO+GkmprCMQ0ySuD/f1
	SIVl8B/5uTq/i1MPyjdcx4LZeQOU/00hw4UUhLh127/+tuyrbjUuQdFyQFHJNK13
	KpGeKgKMfRMGxlPzbRtvBptBfq2Z0e4jGrLDqTgX4lQPga0mxfbbPm+k4e1ERYoB
	u+1SZqHRm465Xarn39lxM/TdlVdvcY24u/GKjMMdGZBbZwB6a6DSj4o831m5xoSN
	EGya8NUKx4JB69Bzorsde4Z4nHAITx0d2PVhavSqVXttGyNCBf3q2IVX5tw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ec26b011-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 17:37:21 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-74858256d38so137884b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 10:37:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750873041; x=1751477841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L3IkuLMHxBTvbI+yz+IctwdTPNqPbXWCWa1wtpGui48=;
        b=GQy4vcHTYeX1+YTV9W/vzb00lCX3T8WfrgPogON5Qos6YnrUPI6BosXkmUsgx2YsbU
         rjNd7iexGnszNwDZbE7aAiXZZ4l5pBxzzvCNseKNFTqzRdx4fmi3wd1iSk7y8ovb4bUx
         dbbJI1iaPgfZuNHY4Mia98XxOJ0lZdfq08pf4IRLkiEkPbgPos+44T53Jw1AZHHZzZpU
         B0ijg8pOfacqbkJOJrklDlXAXudrZEBzJcCA7fV10nu1S5HsJJ3ptbnjTKv2TIgXg2Rx
         7pVDww0ikZF81tHO3/Oege0ROOju0iERom6Y3NAz/WRsrRVd6mXrltLfDFaETTZ8NpLf
         1orQ==
X-Forwarded-Encrypted: i=1; AJvYcCXwrVBvLJ4gvDbSX9Ua6NrWVLWwmdv7H8YbLYbdK5aA7s4Mx3QyqPPcuH2UubpKmd3LwvZnA2T7p6xAwU0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0Rs2KEDETESuykvSIwK5n8z0PSlbqH0ua9o2SajSXxIIxms78
	hSo+va7gFNlSun+IvGf3yRkgrg/NwJQR2uRXB4CNhHT0I0i8VLUgPlP3GLQNkmHayVABNsFkjM3
	JekahzJ1xtzS2ub92urbGiO8uxH89eH1ly3bw1Yn5ksotRTFFmXysqsZuxdQ+pjY5Rl4=
X-Gm-Gg: ASbGnctJBGliFKAFoQt9kAPAnoX2AdyvNPwqd7mwThvGnLjh4+gcwsk3bNF/g7TNoPX
	iGUvK6ZtzbgbXXbUC3d9qAb8xn+Rx1c1UStuclTYIT/ZNgdDDm7mv3b/9lr1Fi/ElQfmDdEyhOX
	FL+rXfq+nxU6Pxi+k74NIgKlil8hW/nlh61/ohKvui8/SHBajwTxGZhuT3b9/fT77KmBEvzQZNR
	g14YhfQElvnmx7WRhCQkh7/XNMYNCkS4pO/xAkCtILZR1W9tL5b9fU/GNyqtYCwziUYoXhyli4j
	zlc4/3Rm1uEq/dLiNie38NytOxt30xRT
X-Received: by 2002:a05:6a00:10c6:b0:749:ca1:1d02 with SMTP id d2e1a72fcca58-74ad446b920mr6496026b3a.6.1750873040865;
        Wed, 25 Jun 2025 10:37:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHaPLQjjw1Mco1AYfNaO1hktOiz7kntJ0uT+EkN12nTw8n3p877U5Ag/TwdHyi0A1rBcURknA==
X-Received: by 2002:a05:6a00:10c6:b0:749:ca1:1d02 with SMTP id d2e1a72fcca58-74ad446b920mr6495985b3a.6.1750873040378;
        Wed, 25 Jun 2025 10:37:20 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-749b5e09e1csm4775934b3a.5.2025.06.25.10.37.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 10:37:20 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Simona Vetter <simona@ffwll.ch>, Daniel Stone <daniels@collabora.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 1/2] drm/fourcc: Add missing half-float formats
Date: Wed, 25 Jun 2025 10:37:10 -0700
Message-ID: <20250625173712.116446-2-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250625173712.116446-1-robin.clark@oss.qualcomm.com>
References: <20250625173712.116446-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDEzMSBTYWx0ZWRfX2r4uOMrSRzf8
 NweSxrIEZ82pi5XNYqt1LZOIR6ydHqQ7Ur3CTqnUTIqmm97xRaIcytv6OygObVfH9TA249pzDsG
 yEZRVpa2wwZp35NxeK0YRkHeHy9mguC0BZj6m5fv+j1VNkkLvAKAew/I3dtQUB4gggwRngZdN9x
 XgSunByhMcHcj6cePKAVVyAqOW3KsXtqind/yHFtQSCoM/341IUbr0fjRGq3MJPV74LRpvlCZs8
 /U0OyP+lFrNtV7GMs6LGJb08bCoVX/FGaUNsQQPIi29nHRRN+k3JjvelPvjADkp5katJuXfTeZM
 ohiXQUS4zIATUTFy74KCrAhVzh59oDfKxn6gf6xTplGU82MFm6q0hcHsTd2ba/1MyYLZYsl6ye1
 +zcqA4l/vze3gO6xFkSmS/UfbHoD0xdo7gWYUTF/pGVk9g9d3j1rvF+JEAU8VUTsI6DVSFkW
X-Authority-Analysis: v=2.4 cv=XPQwSRhE c=1 sm=1 tr=0 ts=685c33d1 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=QX4gbG5DAAAA:8 a=M_I3Rqd0q2e7SYdxXhEA:9
 a=OpyuDcXvxspvyRM73sMx:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: Nir_-kFp_GDaCfaO70xQRfMj-iPiaahf
X-Proofpoint-ORIG-GUID: Nir_-kFp_GDaCfaO70xQRfMj-iPiaahf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_05,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 suspectscore=0 mlxscore=0
 spamscore=0 phishscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506250131

Not something that is likely to be scanned out, but GPUs usually support
half-float formats with 1, 2, or possibly 3 components, and it is useful
to be able to import/export them with a valid fourcc, and/or use gbm to
create them.

These correspond to PIPE_FORMAT_{R16,R16G16,R16G16B16}_FLOAT in mesa.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Acked-by: Simona Vetter <simona@ffwll.ch>
Acked-by: Daniel Stone <daniels@collabora.com>
---
 include/uapi/drm/drm_fourcc.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index e41a3cec6a9e..3560ca1ffb8b 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -218,7 +218,7 @@ extern "C" {
 #define DRM_FORMAT_ABGR16161616	fourcc_code('A', 'B', '4', '8') /* [63:0] A:B:G:R 16:16:16:16 little endian */
 
 /*
- * Floating point 64bpp RGB
+ * Half-Floating point - 16b/component
  * IEEE 754-2008 binary16 half-precision float
  * [15:0] sign:exponent:mantissa 1:5:10
  */
@@ -228,6 +228,10 @@ extern "C" {
 #define DRM_FORMAT_ARGB16161616F fourcc_code('A', 'R', '4', 'H') /* [63:0] A:R:G:B 16:16:16:16 little endian */
 #define DRM_FORMAT_ABGR16161616F fourcc_code('A', 'B', '4', 'H') /* [63:0] A:B:G:R 16:16:16:16 little endian */
 
+#define DRM_FORMAT_R16F          fourcc_code('R', ' ', ' ', 'H') /* [15:0] R 16 little endian */
+#define DRM_FORMAT_GR1616F       fourcc_code('G', 'R', ' ', 'H') /* [31:0] G:R 16:16 little endian */
+#define DRM_FORMAT_BGR161616F    fourcc_code('B', 'G', 'R', 'H') /* [47:0] B:G:R 16:16:16 little endian */
+
 /*
  * RGBA format with 10-bit components packed in 64-bit per pixel, with 6 bits
  * of unused padding per component:
-- 
2.49.0

