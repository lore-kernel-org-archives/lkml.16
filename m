Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DBE219F11F
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 14:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751206024; cv=none; b=VrgyIKxdYVwmMVI6di4d87Zgw4f54PxT+wGUs1Otd4KX0E6IVdi3qpvz2/sBm7NpXd6cgyCWypvB8GD6F0EPedTqYLqW0NBYaECPMjl9IwA5qrBKVP2v9+y5M23YrMSsa8ROb8DEp0R5ds7DcAuS3qe0Wi4AaQov7wELN9D1xuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751206024; c=relaxed/simple;
	bh=8HUCsu07hAS/bP/QpqqCRLMr8xpiWxvBNsplcx3L6YU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Rk7Gf3O6+cWpoJFNjmaokGjj2Gr1bWPzJbKi5rv78aSI2Gg/zKdkH93oKpRnBOnDJMGttJc8hpRWSuRiBXdxsBC+Jbe0rtyz7oJp+gQBiQ/nSFWhnRyAEhVj7XVj7IFvlEgWG1FPqbU6DLmtWsXfxThjhXb3jRTBN23HA3waYUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JJSAR4tE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JJSAR4tE"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TCq5c3016505
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 14:07:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/I8w26relc0
	8VGTXOUezTNb1wMArJgWD1sc2fjaEtTk=; b=JJSAR4tERUHwHwcadQJAfq5Q4Ua
	p0kSHSAWTYEHTVrc3octjQkZXECoUrtgSHD9JZKNY7VohX2hAvtwB16FLQ97wHl3
	EPGWRWHhGOhro8CYGSKUFIlMzPjGrhxU+iSCTfgkP51EYqkPGJMPXk718ZZdGBgk
	FNfGSQfvF8dD6KV4q4mindWrASbL/geWg+0uTpPCTTpWxUUfMnw63geI9xePVCaj
	dJjbuGaAeBneAhjFHD8MLiIIZy1iUFoKIqooIsfgoaL6JSTFNAWmF4HJG0rLuUim
	iVpyNiMq03kgEqMTjnmN2r/AfElSoZxZJgo7CFksbIID3YoUsU0DT9ZU+wg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7bvj9p2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 14:07:01 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-748d96b974cso3149584b3a.2
        for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 07:07:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751206020; x=1751810820;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/I8w26relc08VGTXOUezTNb1wMArJgWD1sc2fjaEtTk=;
        b=I7mafIe3B5PuiN+y0uJl07QSSY1JmVe4AFItws/0PcpZrO2eLRy5fPfZkCGDsf5Sa9
         W4ttatzHKRhL6BUMcqr1ADQSSUk0/uj7XWay9Zd4hPbclIMzZ874gMH9F92mo5AZYAR1
         lq4BjyGyTuFnjgAdlyJy9mEHKltwVaRFDiRwxZ3yZgk7nlb4mtagudSmGZ/NdPiOoP8M
         EzFpUe19Zst2BCEa1wQlIb01HmDpGaAetK1Q7PJ++aqga9czpAh6KcdxXL0efryktjN/
         siXA6+hLnLnK7N9zFU2s9Z3OdpLpB9RZ+kjwOPlNxNgaPTGLQuyLKzTehaASMOeE5iKc
         jfHg==
X-Forwarded-Encrypted: i=1; AJvYcCVYcGF3B6rjBqTREbb2rvdZa6PqNIW0YYrSTJNeSZTXPSfl2ymYaWfHcu2A3VaBXN+rwswDQkMpitd4kCE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw208Mm57MsaoasS9dh6WnM8/+eVim4876EKMrOGCvFjvfEuqlK
	7hcDZHa7kY17t0UWgsAKxaWivF30JQhnxKwVTUDJaLX1tq+8PPo+QWummhvnltOfFpxpf+2Ht6M
	/jTk69oYdERrrhx0OuApqLw7ieIGtgRcqvYXJJ5c7h8Avy6aYV8/3G1g+t6jmhvymyks=
X-Gm-Gg: ASbGnctAC+Jp2u5Un2R741NLb4MCJMtpEIgkzvUBS9GXynVTO5jwKg69RgWMK6TLguf
	Vu+JoTmGA3K865WJQsFVU8CktyVG2wov+g2qvTqVhoWp6NpB8YbRAJKu92hxQCsqUf/6eQv0BCH
	BXy9a3hKsN6LXKaS0Tt04JXrXXqR5ZEAMoMmj6rRPgPi/eMYRHiy7tK91txDWBMOdehYGrzpTu3
	iVYxI6ENG6F88yXtQ0lKIAq2g2e0Vnf5RtN30LSPbe1smX2fqNdeNGehXJ14AcvxXmus2h7uTPq
	Fh4b39E5ZQgo8F7KOJCO1vLlqYBwyVDG
X-Received: by 2002:a05:6a00:2ea7:b0:748:2b23:308c with SMTP id d2e1a72fcca58-74af6f445e8mr12526311b3a.14.1751206020524;
        Sun, 29 Jun 2025 07:07:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWD00aCTKp3rmy1fVmYh7PmkKjE2n/hAouI0pUy6N9MI8tjXuNWwJzmYWFZ+STLslS/wIm7A==
X-Received: by 2002:a05:6a00:2ea7:b0:748:2b23:308c with SMTP id d2e1a72fcca58-74af6f445e8mr12526273b3a.14.1751206020100;
        Sun, 29 Jun 2025 07:07:00 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af5574604sm6982706b3a.86.2025.06.29.07.06.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 07:06:59 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Connor Abbott <cwabbott0@gmail.com>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Danilo Krummrich <dakr@redhat.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Danilo Krummrich <dakr@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v8 01/42] drm/gpuvm: Fix doc comments
Date: Sun, 29 Jun 2025 07:03:04 -0700
Message-ID: <20250629140537.30850-2-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250629140537.30850-1-robin.clark@oss.qualcomm.com>
References: <20250629140537.30850-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 8GkCNdbhjLNXiPYMmmBnOtGgug4TxoQD
X-Authority-Analysis: v=2.4 cv=RJCzH5i+ c=1 sm=1 tr=0 ts=68614885 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=5Yek0j1-lJT91Je3aSMA:9
 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: 8GkCNdbhjLNXiPYMmmBnOtGgug4TxoQD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDExOSBTYWx0ZWRfX6NlYyyOPx3ep
 ww8Y1PXdWiisaYkfHlkkixcvmMOeV3ZJjBSkcKaVAhoR+qdsvJJqeWZ7YZkV3UDQOF5qdliuAVQ
 +Vl8UOSZNGli2HBBI8H6KZZ+iELhy71r0+wnljGUxvtGj1D4Gv62sxydKbRfDGY2JPUdqbOzRen
 qDUkJTwerbNlgdzR3rdmZCYkNzpALgJTcsKq7LcDuk665prK9iNH51MZ8Hyco5HwYFgX05cHfOq
 K+/xDjIB+nyL3lzPCAGPJ3XJwBAgYvO+aiSfzEJlT0/mbkM4eJHwSj1RC4L+q5kGPK/dOhqs1QU
 6vdMNbNINO/0iZDj1CsTAnckaR3UW2L7saoXIN72BW4ccDe+ntpQlXnGzgTV4vnywe7t4pMu3eg
 0Xi/LyJUoytJ90Cp4Y7PUhaU/GGRszur9y52JJmrbBh2SLIAEDFeyibXrNjW/5OftALZewV3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=999 adultscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 phishscore=0
 bulkscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506290119

Correctly summerize drm_gpuvm_sm_map/unmap, and fix the parameter order
and names.  Just something I noticed in passing.

v2: Don't rename the arg names in prototypes to match function
    declarations [Danilo]

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Acked-by: Danilo Krummrich <dakr@kernel.org>
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
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
2.50.0

