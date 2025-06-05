Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0249A27E1C3
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 18:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749148353; cv=none; b=Mm9Xs/9ifdTbM1k/G43MiifG2rBAEoKH+yDQX4y2RUl0ze5ohL4n1/LMttttkhSOZa+Hljee8fJac0k+EkA1vpHDfWZpOYrsUghFFksswqZWIHNAovUgSGClrWYTXu3XnqxOEZobzMd9KI+6fTBBkmWzAlFzcNTzeTzNi0R44SE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749148353; c=relaxed/simple;
	bh=GrGA6aQZ+A819VWvU0l5WrQm1ewySWpRFv6nLaO7aCA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WfhjjEeclHpJGqmeEAGI2guouZqN0XUX3ybFeSdfgrvOEOGneMCAjsCTpAlUmuFjqmDY506C00NJzibEMbSlE9LDe9BbrWOeGGB6RY9YwDIIob3Xqjf7M5bmFadTjpAEfgbDQAqgmRWDGok6L6DDnftjQhP0/+wmx+e2NzTznDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JUa4wx1M; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JUa4wx1M"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 555HHDSp023754
	for <linux-kernel@vger.kernel.org>; Thu, 5 Jun 2025 18:32:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=aJRux9Mmt7D
	uLoNeHMGnLL0gFwmGFL0eGNY7k6BguSQ=; b=JUa4wx1MONrVIMYhDve2lIQwsws
	4cOE0chvJ8aod9TXux8ng4rmXFhO/oFJadVBjgwuOWPdDkMpZ2oZw5z3Zmf3o3sK
	O9DsVa4mmS3kJ8cuWa8slPvUJePRZcNLoF9wpZ+6xyBa4X6lJd6Vdkxl7HDUr1dM
	gAwmBcbnAPq4devLEuvIT8/P04suQDLeDHJiHQLu5h3d1omNjsBEM0DJEUPHT8jo
	F+a1sux+uZ+2gcSTJrLy6WroRqAadVpiVVBnPlHHBYANN9CG8QraClFeg8EJRnIN
	i/jbXtrvVVEuDE+spHob9fewbWibvEbVG7FMhlZtaes71nIf4M5wF8aH8FA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8s2c45-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 18:32:31 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b26e0fee459so973036a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 11:32:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749148350; x=1749753150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aJRux9Mmt7DuLoNeHMGnLL0gFwmGFL0eGNY7k6BguSQ=;
        b=E83TZqbjxD0+Awh6iGCxvDScvuRGzgEJIZ9VYhnLt1P8+xRtqDAEpsP/rfPJvtpqpq
         GxgtAEcMv5TgFch9RzEg5au53pGrz+Dl6uflwWS+5vUJ/q5hLWo/U0lR9IAPul2h/oPr
         F3RAe/Ar/SX6Pl8Atso+gnmCrmLSTkexQvWlMC33K0B1OWE1CY+Y3d2BtrGxqSTAKw0T
         R2xqnjwY6Oj5Fl39bt2KHIs3qns2urAWwkaJZIhJXMnxWWLM6V8d3dbNNABsSJhgwusf
         CjrGkVo9lZKwC02p6iZ3RlAmYb/yPhtahkgWnvs+5C8OXnU/Oz4HH6Ja431zu5amf0Rj
         g4gQ==
X-Forwarded-Encrypted: i=1; AJvYcCVK0To8N4N99UNBG37H+X8M4qWXIY6TrsyQDlgYEC4bkKIl5SMfalRngg9LQQ1B0pQ0eYiFsujKDAdih5U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz50UE4LB6hSp8yCiLngfIw2CHp3470bON2Ag7w2hbYaRI7HdDe
	8WGYw6h02UMVteC5tRKyH2Lq6bPECbJ5Fw+n5d2NR/y3KJfqeGmd0bYuSaxB5OmBX+vmHQ3V+ei
	pAhRKnYZbCTAt7iglNxflfYlzENLLWER9oofAb5irmH4Dd1iFWu00+fwTBnGjizt6qGVJlpsk4t
	s=
X-Gm-Gg: ASbGncseoWKfUTQRz9Nj9JnRfL3Nig2sRQKyAta5Ft7dQH9R++XpzNufn9oC34eouGp
	yOUDRB2GhLzn1tHb4Um4xpc+/C/+R3R5CwFkgfSYMOW+EjOomUBrRmJGIOP2/GUqajQgSPVpsW4
	SkMAqqcRcUjsn5Chv3zU6JFwGSsWfDaig/B9gHuZrxjxyBj6RVZJ34aJkitrfAm8G7VG8hlL1fy
	UacfEBGKKLxryvbV/z8DbZhw0EK3D2KNDdhJCVOhJu8jD3eAC51YuiWFazyclwNXV0w9X0jqXua
	Qm6wUg23HwD9tYIQhf7PRXSWjjX6MwiL
X-Received: by 2002:a17:90b:3d8f:b0:311:abba:53b6 with SMTP id 98e67ed59e1d1-31349fb9e7bmr314334a91.14.1749148350480;
        Thu, 05 Jun 2025 11:32:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFFf9Ed15WnJ0bK+g5LNOmp59mIQDowolw20rilCr32CVyAeCUxH7k2sAVz4uNjydss8qX1kA==
X-Received: by 2002:a17:90b:3d8f:b0:311:abba:53b6 with SMTP id 98e67ed59e1d1-31349fb9e7bmr314299a91.14.1749148350077;
        Thu, 05 Jun 2025 11:32:30 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:89fa:e299:1a34:c1f5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31349f6d8f3sm61281a91.46.2025.06.05.11.32.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 11:32:29 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Connor Abbott <cwabbott0@gmail.com>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v6 08/40] drm/msm: Don't close VMAs on purge
Date: Thu,  5 Jun 2025 11:28:53 -0700
Message-ID: <20250605183111.163594-9-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250605183111.163594-1-robin.clark@oss.qualcomm.com>
References: <20250605183111.163594-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: CjBTLsd0gcMXpvTC-Lt-Xqhq31aH3A6S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDE2NSBTYWx0ZWRfX79YlOFM3yfG7
 exhZtZT99oxSfjmZKdGgqdtfBPP7vkhlbGlb3IaBrbKIdZBiys4XQCBd+NixQo2uKqZZ5MquLBp
 WrtKI1bVwi1Iq1LmzPItVvH6IZTX092Sbms5mnLtxhjp+YPPKBelsVrFmDg1aVNpppfxbwsRDN9
 5vS/e3Adomd2QCMi7qW/jCP9nvfMJ4mIZMmXL4OCMnKOea677A+4K+6ABacm8Iyq5qs+s4Ulgxm
 axGOAj5AFOE/JjIG+RbXi7kgFVMjkmmA2/0pIZ/9W8uig3XCdixBU73zv/7XzQjS4zRPiytyw9A
 VPpL2H0G+81IW24BWMy26Xj8TBoGTogGcI98J/NA79T8lvG4rWU5NGzQyuAg2Rk5V42Vg50xiNf
 stsbAILbhgDQ2ovKfe8dkewDcgLjBOPIWjPBhdr7t48k948Q6PLnxYuaX87gOEREKoHxjqx5
X-Authority-Analysis: v=2.4 cv=RdWQC0tv c=1 sm=1 tr=0 ts=6841e2bf cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pCKbN_IlIROpsMws84IA:9
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: CjBTLsd0gcMXpvTC-Lt-Xqhq31aH3A6S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 mlxscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 spamscore=0 mlxlogscore=999 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506050165

From: Rob Clark <robdclark@chromium.org>

Previously we'd also tear down the VMA, making the address space
available again.  But with drm_gpuvm conversion, this would require
holding the locks of all VMs the GEM object is mapped in.  Which is
problematic for the shrinker.

Instead just let the VMA hang around until the GEM object is freed.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 4c10eca404e0..50b866dcf439 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -763,7 +763,7 @@ void msm_gem_purge(struct drm_gem_object *obj)
 	GEM_WARN_ON(!is_purgeable(msm_obj));
 
 	/* Get rid of any iommu mapping(s): */
-	put_iova_spaces(obj, true);
+	put_iova_spaces(obj, false);
 
 	msm_gem_vunmap(obj);
 
-- 
2.49.0

