Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5669E2EB5D6
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 15:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750434350; cv=none; b=pED9jzLTDVGl6X8+p65YTTR3Cl2kmxPaDwfvFaHaIH0vJJrtAfL2+ULc3YAEgXZDXGnK+toJe5fY9Hf03IjSJUS26uP8/1Lo5JFz980ZTvBTMK5dhJ/R0aUTqgak8te8PCio5LGEqonCHVofFHLBYoSRHKW+W3gC1f11t5CqwyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750434350; c=relaxed/simple;
	bh=nXgUqQdyDTDmUCSlus96vQ7zp/8O8nNWvr6C6TQ8+ag=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ezFYa7F8XSYvOliOSf5/J4e1pXYN6S7UAy1cblfRiL7RzGbBR1Upr7XYlSU49GlWB454PNGT5ZjytugyrxwVFJXc3sqZvQKNMvkDO77sKVhgCsjpA1bUAps/uFwmnM54S7sPaDOH4Cmn6xnY9ve1eZS5k8aSMPNgo1R7xasaUU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fBdG1v4O; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fBdG1v4O"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55KD2N9p001999
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 15:45:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=C2Mw8hDedlh
	HIu8wE01JvXGicmu3xM3Nu6IiIJHmMkU=; b=fBdG1v4OHwDOATjWpu/VacCWiaE
	KMa/eig7Meb6q+zYF5fn4ALlF7D7vCgah2Pzdw9mk21oLl/RJXvd1bArRnao224E
	7QsXk62dWFUEDU0HWZb3KfVxH4UHvQIETWDnGamP5hbffECt93++APkU8/j0+nEl
	9PGhnbFs8hjfmhDbHPwuQuSYjqaDiER/VovIZKevpDIDekCOV4xKt7HJzHn7U/OE
	kmx/HT/WnOuSD30vtekl41h1edn0m9JU0JS+OwmF75FuRIFrAzuFt2FHst7SFaJZ
	tOtj+JCzNvHijNFRw97Xn2t+aItkUtuzLOLisgZvNsfjyIWo9kDSlp72S3g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 479qp62d05-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 15:45:48 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-234dbbc4899so32943625ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 08:45:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750434347; x=1751039147;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C2Mw8hDedlhHIu8wE01JvXGicmu3xM3Nu6IiIJHmMkU=;
        b=DQLfRjpMFx+NNUZt8I9EhjsGKEpavlG+BA/4tWsyNOAPSIaDPGqqUiI1d6BKuvsb5E
         yG4U87dK43irU4aQC59/vhRLq11okIzlmp8YEKl17efKQChLeSMccFNa00mhQ03lSRzy
         6OoasTrr4vqIGCharJV/C4eCEddFWFIGxZZCHuQwzr70YiQzH/b+o7i7uVKtlf2Jc94q
         W50WXCiPfQgrfEHtTRL5pa+xuTfcis2IijNF54pNVS6J+lGqo6D1u5pLCng6u4XUQmqF
         x++OWOMdaICzr9VV5ZqZiCxI3mVtOAwnC9BZkRLUw1XIWGUn0UlDXrEcFNU7SoI1Or4G
         jOIg==
X-Forwarded-Encrypted: i=1; AJvYcCVSjdnRE61fMOdcbSNyoHqb7fzq4uqs2UApdSHe38Z8NaPChIeSXRQlbAvWrYTXUksu/EnCBFy+auTBheg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxtB+9ZXzupletVWpyE1W1wB69xJA+XXC0MWCrYAF28CM0xo/I
	rTQ4s2s4l3AVF41PQw9BhPeylWWM4iLdCIH5gCIbrgZIIQVkb3sy5kxoA2/dZz10pupk5o07DP5
	PWkeXmCvgLY6N6OgBAQBB7KsoU64M4cC02rQyP1jXQCx8Gv4WPITbUDnD9/CxxgLRtG4d3VI5DB
	Q=
X-Gm-Gg: ASbGncuxhrxTQxMc6E3U16HABiSII+c5tes6Uyi9S6vjcJyyqSRYcBVnZrHMI0Z8nPc
	JQ28caNXJe1R4EZtn1IxNnTPMmw2HJo6yJ7ADLuu9mSSBvX9xgZHj/WGE4jYCg3kn1jwwTxVyq1
	A6MK53P12v/rGT4hVTysJAhh20nhwKTTjqFUVNGCnGo7jSZqDYPGP91avZ8rg+uWFvYX2lvlNQw
	emQPGqMSXmlBxzrMTHoX+UUGONUr6OLSs7FvoupM1aBSWKNyoMh6FbuaYm2gE0c+FCaYx5MXDFb
	mGRMl39nuY/vXCeP6XFZkUVBEMgGWlzb
X-Received: by 2002:a17:902:f70d:b0:234:e3b7:5ce0 with SMTP id d9443c01a7336-237d99d83f3mr42383285ad.47.1750434347245;
        Fri, 20 Jun 2025 08:45:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFDiFB/XTk6onD/OV+d4aZvXfxm168CHsEY2UxE+rWdnNuvA7GDtDI7V0CiMaCnXa9H6JV/nw==
X-Received: by 2002:a17:902:f70d:b0:234:e3b7:5ce0 with SMTP id d9443c01a7336-237d99d83f3mr42383045ad.47.1750434346876;
        Fri, 20 Jun 2025 08:45:46 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d875c1f7sm20922405ad.257.2025.06.20.08.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 08:45:46 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Danilo Krummrich <dakr@redhat.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Danilo Krummrich <dakr@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 1/2] drm/gpuvm: Fix doc comments
Date: Fri, 20 Jun 2025 08:45:35 -0700
Message-ID: <20250620154537.89514-2-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250620154537.89514-1-robin.clark@oss.qualcomm.com>
References: <20250620154537.89514-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: VUoh6afxTMn3oN6BuSTx3FQLuIIhgD0V
X-Proofpoint-ORIG-GUID: VUoh6afxTMn3oN6BuSTx3FQLuIIhgD0V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDExMiBTYWx0ZWRfX1YniDWdzaKYo
 yeBs5sYWK82SSLSRl0o7s0Kpfrq6znIEOnLTNrmsPBiROFQZgkjzwPu0aOaCgMkA0sp/bxHw1OR
 E75arS6xnqHjKZsZjU376Ru3h9wHolD2ZUVBqTmFbdZxaYcXGguTAgY1XzvK62m5KOhZRIhc93Y
 DCVQbgVF80KtZ6CKhnGNVwK1BHoGf3dp14HhJUsxjFfa97OvvBdC9TukK4xhssFqyx0nEo2xlwJ
 g7r6uZh8F373gTltG44GrTrrcGcXooR1QDCUbt12YDGvTXrARaxQqP8fpovo2/3XIAhRC1KUYV9
 lDNRicrPHT2nlmRSs2hxeGpHXIii7wPZcxskhxkukfR9VY0Ja5FsTw9ZcovjJsKQfYMoy2Rkvfa
 EpopLUnqRZrSx0UBGWAQnYDsv3MnkalX1NQe2T3C1SSWylhiLu8T3LZljjgJSeZkIvgul1J0
X-Authority-Analysis: v=2.4 cv=fMc53Yae c=1 sm=1 tr=0 ts=6855822c cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=5Yek0j1-lJT91Je3aSMA:9
 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_06,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=999 spamscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0
 priorityscore=1501 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506200112

Correctly summerize drm_gpuvm_sm_map/unmap, and fix the parameter order
and names.  Just something I noticed in passing.

v2: Don't rename the arg names in prototypes to match function
    declarations [Danilo]

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Acked-by: Danilo Krummrich <dakr@kernel.org>
---
 drivers/gpu/drm/drm_gpuvm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index f9eb56f24bef..0ca717130541 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -2299,13 +2299,13 @@ __drm_gpuvm_sm_unmap(struct drm_gpuvm *gpuvm,
 }
 
 /**
- * drm_gpuvm_sm_map() - creates the &drm_gpuva_op split/merge steps
+ * drm_gpuvm_sm_map() - calls the &drm_gpuva_op split/merge steps
  * @gpuvm: the &drm_gpuvm representing the GPU VA space
+ * @priv: pointer to a driver private data structure
  * @req_addr: the start address of the new mapping
  * @req_range: the range of the new mapping
  * @req_obj: the &drm_gem_object to map
  * @req_offset: the offset within the &drm_gem_object
- * @priv: pointer to a driver private data structure
  *
  * This function iterates the given range of the GPU VA space. It utilizes the
  * &drm_gpuvm_ops to call back into the driver providing the split and merge
@@ -2349,7 +2349,7 @@ drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm, void *priv,
 EXPORT_SYMBOL_GPL(drm_gpuvm_sm_map);
 
 /**
- * drm_gpuvm_sm_unmap() - creates the &drm_gpuva_ops to split on unmap
+ * drm_gpuvm_sm_unmap() - calls the &drm_gpuva_ops to split on unmap
  * @gpuvm: the &drm_gpuvm representing the GPU VA space
  * @priv: pointer to a driver private data structure
  * @req_addr: the start address of the range to unmap
-- 
2.49.0

