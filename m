Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66D832264BB
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 20:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751228153; cv=none; b=lgWcnTUqBvGaKkkql97KUnDHP3uACfF1nRrplkRSOl2D4p2Wj7WYTCuF6LGStyZkEPUtInQ9Hsj8f1PvGvwfUhki0axEJkUvU4rBLxVwbq1sYMWr6hwKZJBGFJXDSNhDjYz57979x6AA7JpmRJzFOx4s786h2bgKL6C/6CWz9JM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751228153; c=relaxed/simple;
	bh=8HUCsu07hAS/bP/QpqqCRLMr8xpiWxvBNsplcx3L6YU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Rl+jglDdBjDcuKSyIhyLylJVrIgxbQ6WTra/7uvQck+pfBKafMJYqNd4EeycMAUXATjhzzuUcLDGjU+sF7YhwLmJjzxGjT2dYr+kTYbqPAM/amFmLEFoWGuD0DlyDKfClxnskNP87R+wXfH4oZr0FQhrN21schliC0vH6dH6lIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WBueRC+D; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WBueRC+D"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TGSN2b032256
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 20:15:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/I8w26relc0
	8VGTXOUezTNb1wMArJgWD1sc2fjaEtTk=; b=WBueRC+DWtG4IoBeo0td/gZKv9s
	LsG7wlfllHBIx3iAzAgDrI09reJm1oAWqhAwPNvi6WUmxXEH1YD3BleCbjGmnD9b
	PVLrrn1jtayMTJv+ScgufcCsct/69OQwB+MtqvgE26MEZXOs2OB6wtq4Om7sVca6
	oFu7J5NoSh4XnvbSt5xMkrcKckX76gT6IwY7IvJOIJMDKwIZIwcI7+LvRb20QSNs
	WOHos/5y/ZcHpzE0AMZTRbJddhmUe8Xel7aiYbmj26xO5I/0Yyp3+0LwmsdxOcqo
	HrZheKGcXcX6C3yDp59TyyOiEOuAwmDxzCkCgRO2ZoZybcojbrMl9JK7KUQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8m62m8s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 20:15:49 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-235e1d66fa6so34116985ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 13:15:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751228148; x=1751832948;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/I8w26relc08VGTXOUezTNb1wMArJgWD1sc2fjaEtTk=;
        b=jbbmRYgEkPMZwEQSQrZABQv+nnK8/1NupFcJlVphTv2iEGbe+FLBzMTyIFbnvnUBKa
         CFyrLYhp9wECvPER7pm//3/hviKpqzLSMeawitIyRVMjzL7wYPS3a80CA/sEeMO9rJyl
         KvBSmmj7yM8+dsiH3KGWy4SZ5sYU1fEYD0ybBk5a94kr9i9iCyyXY5sq/1w65dQhQDhG
         E/dldRFYd/pl0cwXutX/gnCJtU1363VZIxKZGDOjeHpYfEaacBu40/HkPDOmet0S91NK
         j8TWhFZgm3vHOzPZAGRJutgAABvT8h1rMDbNel8JjAEbOsNfS/N9LHuwrY1k+bgiK+3z
         bXMw==
X-Forwarded-Encrypted: i=1; AJvYcCXNoYnglUrFm2e4kRSArqVnPMf2szo7pYYEJYTSbA+q4N/owgXtUHRJRYYKGGI9BEaP3cBRGQO/IABBLSI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDwJUXi2beh/4D4DUWbU3pYSvBmcoAaU2+0F/80Cy4Gfdyw6VP
	u9BRetgRd/CeqjRLjgLxGLnJ5JVw2qgKCe8eZQ8JoRuum31vrq3xnXF5oVMGLkkqZgzf75AzVlD
	zw4+5BY4loxyu3MssHpHbrY6xqTnmRgNiHn2iEWt8wFu1tTEN/YEz9+8CzP5E/YgNae0=
X-Gm-Gg: ASbGnctQjNFeeqaIIVHdPQTPw1ndpBPDJwAPOyDoYC5jIlxJC120Sss/yMjKUUuxoRQ
	OvPH/J6JoBbzFVQz3sWv1eviGI35r7t9BXqu3vNCrOzYfM2PFURpc4Hxby9yaFb0RorEonvC0ss
	v6Nj676Wli1ShBpgtb0IxNbmWLxvsx+j4OzbTXN68iPvJ8SMCPtR59+5ynLxpiC4yTXe2UgOg7U
	Sta419tfJeRP6yaCaN1lI5r8rnQEKGm+gS3BbOmV26mM6RUPU9PTbBudv3pxOV4i2JeFnxHGwp9
	5xBDjK0acqJl9q609ql/Zlg4sGwEblNLmQ==
X-Received: by 2002:a17:902:ecd1:b0:234:a139:1210 with SMTP id d9443c01a7336-23ac4645042mr135124485ad.53.1751228148612;
        Sun, 29 Jun 2025 13:15:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFeOYc4WiR21Bq+E+1OUk+x6dI7IFpiybjWV5ofoONV3kzSQEbyT8y1EfO5WQ1B1UfNOdo3Mw==
X-Received: by 2002:a17:902:ecd1:b0:234:a139:1210 with SMTP id d9443c01a7336-23ac4645042mr135124245ad.53.1751228148224;
        Sun, 29 Jun 2025 13:15:48 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb3c54b8sm67165975ad.217.2025.06.29.13.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 13:15:47 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
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
Subject: [PATCH v9 01/42] drm/gpuvm: Fix doc comments
Date: Sun, 29 Jun 2025 13:12:44 -0700
Message-ID: <20250629201530.25775-2-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250629201530.25775-1-robin.clark@oss.qualcomm.com>
References: <20250629201530.25775-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDE3MiBTYWx0ZWRfX0U54BpczuFN3
 XUrwcOwVcuI9FldjLFpKLvGyyzvqtMvokQdM4EJqd5f4qKPXjMhEl3VsKvz+hnH7DG7FPiQsL0p
 nLoOn3P6HyQ+LMmKPXoHHEZeQLXxgjwPaeqzWiIE6Stqxd83xgslJ83M4tKuP+0vz2j99Mr34vP
 ntC9QNdj5jZdx4xC3NcDta83uxeqAR82lKdWZFRTcd4Q+iQsxmOC+yonYQkf0s2LRtWo0nML4EF
 jXe/gTXODwtqC4tlma8pKyO5FHBNC485/6eIMu1j2/nxG1hheGM/X5URBU0aQ1mTEWm7BMkKWok
 zGvjk0Ch7P32rvZ2IqcIaaDRGSBTNCDwWKYD6Mu+/kGxxdNF7F0paL5ZzE+4QKdhms+z0atCnoa
 N4tvEt0nkDgc2JvYG/yQs7aoEKRGNvgIqXhaJ90aAgVaf6RK7cHraP9BFN7GY+nVinTkkYa2
X-Authority-Analysis: v=2.4 cv=Fq0F/3rq c=1 sm=1 tr=0 ts=68619ef5 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=5Yek0j1-lJT91Je3aSMA:9
 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: h0gg9l64Q1T2CDLDog8GQiiJZFtnes00
X-Proofpoint-ORIG-GUID: h0gg9l64Q1T2CDLDog8GQiiJZFtnes00
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0 suspectscore=0 adultscore=0 clxscore=1015
 mlxlogscore=999 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506290172

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

