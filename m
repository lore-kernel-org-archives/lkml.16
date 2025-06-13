Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEC1B28ECE5
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 23:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749859035; cv=none; b=tqEq5afiOXuh8ol7zD7IsHAK4id0RrJiHSuVZJBRgZbFJiiWmB/fNYVz4BvFPw0UBhEwj3gC8Nisr5bATDKQUleV8P6NJ774oTTk9H+KjWEzwmCVpqCssLnvl6O7KDApNRgIxb/2tFXRugakjGRNwT3X7VHbVFzCA1LiM39RC+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749859035; c=relaxed/simple;
	bh=/79aqH+JQa44dI4h3N7cU+cWM8XecAq4gsoOnUwZdHA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PeHsGGgISZBZ8isQQ3W23G1wX6I3ljsB2Jm91U9k677M8a33gKP8IqhKnZ08h+0xZuAC9v2jWtEPBldZUvlPaQ2Cx9qiCUxofSv/2oKVbKFV3ObiGAwIwcENS4gg4TqUla50iDshM9tT3oeIIOyXyux7doZpcCvR7tJeRlRsOic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M5doqY16; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M5doqY16"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55D9rWit031607
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 23:57:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=6n4/m7XLpgv
	1bmn1KU5WILxeVGc6KBK6T1WyY0EI2mI=; b=M5doqY16KyIl5mXiMuUzorHKCki
	boR03cwKH0hqdP4Sm5/JDgyW5hXhN4lcZB1LTzhS/++yFUEGUAxaQ8/49CsYnwrH
	8OzPTskcDLiSGpUpQHD5hPvS+OvJMZRH1kHkWw4u+8t6Hju7A1is+DJiMLUAnjyi
	nzE92AsQbsC4uM9YIQkTSUyw+lxtACiKRDEvcEihou9dJ3Vdhs4R7XC5eQu29JBC
	zGfrS7fKlLlv+TD0DCXT+0g8huMFwR8RpPxV5l2QhQqVBWgFTHFuidKuGtuqkABk
	NdNq3qLqnH2KmYrtj29faQDvq/E3mmFc4F3rj2YS6WF9Fhd21Rpc77a1tiw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 477jdwx6vu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 23:57:12 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-74868e73f4fso2054382b3a.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 16:57:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749859031; x=1750463831;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6n4/m7XLpgv1bmn1KU5WILxeVGc6KBK6T1WyY0EI2mI=;
        b=l0imlH8RPfFCnHBfPc85rv7IGJMlOpfNkv5wRewW2v/qaemaAaFZQRzRpN8leUrcbH
         TkPb4cH84DiVhgJ2V8EIvTQacDWQfUNkTair9Cz2zFEyZ0A14Q+7hmn/+nIOzBxizRKz
         ZshBBZZKu586m9bXL16S8bhxjsFbOe422H4RY8JheZUjjeoC15U8L6mBfp+VP3lLZ4Rq
         10h50By+vjXq0hxix1EJUabAy+m2+J0wPofFbDcLR1WTA1KBfIGmceG+a1VNUlynaSRp
         sR3EfXpfb+WuiJ4UDcxolWH0vy4KvZNi/12NPVHARWSP5awrz/6O8yu7V/rAWgLQwgcX
         PIvQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1IwBgAB8vKtBeGa7UqiV0lnboibKDi3tr1y1fP27+gT4+n57noSbCRMtjasnLGJwvxViTOvzVFw1js1I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzw6WfWqxju7JS9ASkfSGMzGTWNsFgMfU7k8tEm6JGNOZHfwVXO
	dcE65LjYDu7P7VeUAeOuz14qS78v9AFJd/i5LDWqVzsgcDSYUApWzoXNLLyXkocV60dxs1ONjjc
	wyPw/qg6O10DA3p3AC3Ouu5CwpIApGVrq4StH1ZmP4OduAUWZvpFpHqvss+d3dwAn3GI=
X-Gm-Gg: ASbGnctkqrP0gMfMVhyzvkM0gbB454n2Pv/+KQoI1ZG3LCKzdyoAejm73Ijq9eDCaud
	87dveJFwwB9yLkqCC1AIK0EzXMM/BvxIZw0jFE7hgZoRuSKKdA2qGPpuryYL9VPIASAsyLFWjvK
	CFxhSfrQygFynTbXl9s6HJsNoNyOEta0ixY372fbhfBnD6PbixuFdaHPqw+j4ZEiAJRDySaeIVs
	leCd80OYSh48ejwukMHkknxZ/phMRtprKTtpznAW/1bPa9gIrR3WvgkQXt61KtDdg2uVQbeVCYB
	nyA08Nm/tebaoENwn9XIX2JUjdWg2BuV
X-Received: by 2002:aa7:8884:0:b0:736:a6e0:e66d with SMTP id d2e1a72fcca58-7489ce0c6cdmr1483737b3a.6.1749859031371;
        Fri, 13 Jun 2025 16:57:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGCRfklBUOjp5KBQmK/hK6hjxc67A7avI5+sKeqVuyj+UT0qNB0kPJETEj0TxOCbpS0dd+Z8g==
X-Received: by 2002:aa7:8884:0:b0:736:a6e0:e66d with SMTP id d2e1a72fcca58-7489ce0c6cdmr1483714b3a.6.1749859030978;
        Fri, 13 Jun 2025 16:57:10 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748900b28b7sm2330672b3a.136.2025.06.13.16.57.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 16:57:10 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Danilo Krummrich <dakr@redhat.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/2] drm/gpuvm: Fix doc comments
Date: Fri, 13 Jun 2025 16:57:02 -0700
Message-ID: <20250613235705.28006-2-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250613235705.28006-1-robin.clark@oss.qualcomm.com>
References: <20250613235705.28006-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEzMDE3NyBTYWx0ZWRfX6sLWoMf7h6Um
 JKpMVHU6PAZhvdXiR6eZog9dgEq8KIKul1b7m/FATWTJhTL64jDm6sEd4J88TAiGvFj039i144b
 JYSn99SUYS+QAd0HCclYj8eGx8B47hbFuj7XEDwQlBFDuTr3DU1oHyXGKTlmJc/Woc1L+AyjuWm
 sDyqv8MO32WaEMbj7aV9w6csOR6LTY6rFbuhq+mbGgi2zUOAUrPKIqVv5ldvVj7ntyenJCkJojX
 r8uvXKrpcLEMC/JmgY04HKSDiVk6AlC8sSRzCIQ7LtMlF74QAGjqbv6Qmuw1Zza0KCEX3XZTiQy
 qrBACcIUBheek+zdhGRpPlzRT/Eo8OMZrNz5QDxhzdiAd5Yjo94YWVTRjpKW3/Lwt5RT9IdBJNS
 i3ac9hNmFxoNlt/xDGrUf3D40eqbPu79oRRxrS0nOEBqNoJEYDgPEwkXwNXVjR+c7eNONlbB
X-Proofpoint-ORIG-GUID: xwGzLh7Z-mYv8vWvkTRIiR_cxYK6e7lj
X-Proofpoint-GUID: xwGzLh7Z-mYv8vWvkTRIiR_cxYK6e7lj
X-Authority-Analysis: v=2.4 cv=Jce8rVKV c=1 sm=1 tr=0 ts=684cbad8 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=A6x8cpN4-4lAvlAOjyUA:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-13_04,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 mlxlogscore=999 priorityscore=1501 malwarescore=0 spamscore=0 impostorscore=0
 mlxscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506130177

Correctly summerize drm_gpuvm_sm_map/unmap, and fix the parameter order
and names.  Just something I noticed in passing.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/drm_gpuvm.c | 6 +++---
 include/drm/drm_gpuvm.h     | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

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
diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
index 2a9629377633..0ef837a331d6 100644
--- a/include/drm/drm_gpuvm.h
+++ b/include/drm/drm_gpuvm.h
@@ -1205,11 +1205,11 @@ struct drm_gpuvm_ops {
 };
 
 int drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm, void *priv,
-		     u64 addr, u64 range,
-		     struct drm_gem_object *obj, u64 offset);
+		     u64 req_addr, u64 req_range,
+		     struct drm_gem_object *req_obj, u64 req_offset);
 
 int drm_gpuvm_sm_unmap(struct drm_gpuvm *gpuvm, void *priv,
-		       u64 addr, u64 range);
+		       u64 req_addr, u64 req_range);
 
 void drm_gpuva_map(struct drm_gpuvm *gpuvm,
 		   struct drm_gpuva *va,
-- 
2.49.0

