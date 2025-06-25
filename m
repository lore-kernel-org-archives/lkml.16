Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34E112DA742
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 18:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750877888; cv=none; b=N7V+/tlYc2t4+jfx6SK3/XACIebR2fCH7N3j/T0bzFlOGeSA0pRqd+U8ugixxlFnx6e0PgnmVQxVhRsBCgGouLnLbPxv09h2/onkYUlVuetsDkMMffk7Qh6zDmAjTThNQ/tEMiaVFLZHv7dcN+tqCJLXhmnln5DpkhKSWRL/q6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750877888; c=relaxed/simple;
	bh=nXgUqQdyDTDmUCSlus96vQ7zp/8O8nNWvr6C6TQ8+ag=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bh9N+xXmOHRAkaqUmC3ECgsIsvTecbxTPfG0p/a/kcpvpiI+CNaebznfICvfmWikY+GNagrCUzTb9x+lodQr3/uK+ciMioo2+QL2rJYpI+IIr1oGFtvW2I6CvJaJ53OxA7PYLu7LfKp3Dal5tQb9QLOr0OcBmzz/t355xT8sj9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YtyuO8Jk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YtyuO8Jk"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PC6AI7013337
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 18:58:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=C2Mw8hDedlh
	HIu8wE01JvXGicmu3xM3Nu6IiIJHmMkU=; b=YtyuO8Jk4sMJ2Ri/m2vw7QCCLe9
	tjKv2USWutaNQOLTXGaUx7HlhjrG9Q/96VntWuE7KCpdTkwXXe8t5N0cS75LuGYk
	s2JHO7AdW95w8iZgqvqjDnZNeRpWTloocpqwz//+wg2OZcct06JAJvdH8Kdscom5
	DrmM7SKvuYYwlZBPDdZlZlvFlfs3SOq25OId9IxsXTDcOdiDVpSKeoiFAB098n7p
	QTizKccSaKoGJekxblARNCidNcQ4Fg9VVBmVm4xhyg4ZNjPgyFhumRy3hBFUh91f
	GlXi4nMszFZxI61Mojkb3hAJGTgySUw2Itl0rebGrQlg/cwvU6K/XklOyCg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbm1ygw1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 18:58:05 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-234b133b428so1193595ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 11:58:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750877884; x=1751482684;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C2Mw8hDedlhHIu8wE01JvXGicmu3xM3Nu6IiIJHmMkU=;
        b=EYark9f3G+ukc5HV/532/Y3Ru3PQuoEAnmvSD+bRlw/t1ohMb+RY8CAop7T0DAr+UM
         o+knhW2JwEjbI1auCQdrVuVV5TjnDco3s0tAnMC0Bd8jisH1hrPQCa01bFVUMM+P7sHJ
         DSfrl+i1uutwLoEW59UrnZ4OQwrmha5scjSh79ybB6M5oVglzfneyAHclf4oTsnKMrLW
         LZy3D83xoPbRHe5EXEyDnsaNiWzn32MM4I+2tD3X7SjOBCnfaWKtgAruWbwQevxCLaMK
         GwvPMgViDKABvNQGJFLcOzsYxmuXFb6kvg1AAU7mBFVg8kXAiwQsT44BnWIvhV5+B8yy
         5FTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVlew7F0jcMP9heAkTIZvctcFhpnja7Wzdp2rfVVfmR0KYGIeJClC5+us0a4mqnImgZ4oTzOtF0hBUZTcI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPbXWjoBXx53krl5d479vFPJ1oWvdL2DLsNq4qiPCGhy9qrmye
	JB3VompIzKXHgxvZnfDJwOKb6rrFYEtgBnT2LjXywoLDYV2ZWmYOxA5GlhxXbmvh3/5maU3rpVG
	g/I3RWIv4rp57kRFfTDzxr7xzvKD07WB48NvjUomkAqPbR5NIQoUg7WGEtWN6lEmbx+8=
X-Gm-Gg: ASbGncuULIr4diQaYpqqPgXMD7R6xa6dQZY0BEA33Ly/ix/+h7OscLw1agl7IPLcLyT
	96B4xIQVhs0KuaM+kG9OgFA7YiUMJZP/Rhes5WKFXDbbcMYbxN5GeNRDGU1499xU6tjCQaqzVnE
	u+d+wbLPWrvdWAhBIPSr5hPOkFyBeqeRZ2KLggxKi/y/Mj9P1t8FvaV8Nm3cg5gDIq1FNDz5b48
	KBpo0WK2iQcco4iNwPaqdX73lcTT8KFOPJeV7WS1idTbV1Yn4kUjZ/QxEibPvy/eyFnh5TyAbbM
	p5GROOFyUC3v+nHPZSiFxC6vsdC9Vdxt
X-Received: by 2002:a17:902:ef4e:b0:223:65dc:4580 with SMTP id d9443c01a7336-238e9df10bfmr9537275ad.52.1750877884573;
        Wed, 25 Jun 2025 11:58:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHPxt9zGsBsFtjOcbawB8rK4sT+s71VW3b7IpqZzz7IC1qwcaoAPSwP8cubRNnwku3ut/tWrw==
X-Received: by 2002:a17:902:ef4e:b0:223:65dc:4580 with SMTP id d9443c01a7336-238e9df10bfmr9536845ad.52.1750877884158;
        Wed, 25 Jun 2025 11:58:04 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d86d5ea7sm137335695ad.206.2025.06.25.11.58.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 11:58:03 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Connor Abbott <cwabbott0@gmail.com>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Danilo Krummrich <dakr@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v7 01/42] drm/gpuvm: Fix doc comments
Date: Wed, 25 Jun 2025 11:46:54 -0700
Message-ID: <20250625184918.124608-2-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250625184918.124608-1-robin.clark@oss.qualcomm.com>
References: <20250625184918.124608-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=YYu95xRf c=1 sm=1 tr=0 ts=685c46bd cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=5Yek0j1-lJT91Je3aSMA:9
 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: 12rLT7ogRoVgAh2W2qJFNi6H3rYorXVW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDE0MiBTYWx0ZWRfXz3lnXUp5spDb
 Nftr3qy7fWJ/iXmjHJJH5Wz/KPzd0rj0MOHX20hh5hH2iM+mVAzLGt7sq+U5XQoY+ifGQyFizhY
 GYYB3d5hxd38lDfYJwhIBjxQq6SlkNwoEjp2ts+/fB1BdqHF4jkFw8SRhthBn9KI+RzccxOhrNI
 ewBAbBqqjcU1JKKKHFmvF9QkupCuucfJmK1U3B7OUxF1Kl+KIqqZMqCl2Acwn0bLFsRUixGQRSo
 k1rDjoGmU2nI4dwUMZeVTi3C9Jkh9UraclZSkD1cmJHPkrdcuys2Ve/NnLF53oIfv9rwesAs5mT
 OfMl8Pg2Gpv40tKv1452MenFNCy2hi3hP/Y4z01JR7kELCD8ZmQswZdINvFYIpmAPcWWS2IYHNq
 0A7qQMCYA66hUGAxJAG4ZmgsgIK508qBMnjrmU1eplHwW37CbIUQgrdyWgmarlZzslJqV4hD
X-Proofpoint-ORIG-GUID: 12rLT7ogRoVgAh2W2qJFNi6H3rYorXVW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_06,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 mlxlogscore=999
 clxscore=1015 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506250142

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

