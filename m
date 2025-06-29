Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D14F733985
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 20:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751228183; cv=none; b=OtJnTVSMY7LARrVnxVt1Ds/LK2a+EbB832+oZoERzAx0zf7Sj1KWcz2RAEUO6MR2ZpqAM247LXobDtXsNMyOOeY22reqN78bzRN3GMJqfhwHgEKy1OEixEAV1/rQk2fnRQBYjIILxGjK9BswXvY4JZTFhSzudRhupkK3RMTppFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751228183; c=relaxed/simple;
	bh=iDEV2orWmuIXKriA3mh+ffbHZMX8dfi8nDJuhBaCic0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gxtdHxg+Zcl2jm4FA3ql1DrAZt6Mu/QYrcCWxsmZ/BozcE1nw16svF9LDWYKFO/BWVjiQMbSnwZIuRUn58XtWX5uq80Jx3HdFMo0mK2gpYFrhHV7w9uVhP2S/XzWnmYFmc6vOjctuGd3Eybw3ggUNAlfXSvYwi1b9YKWZ12LutM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TEOaRKgE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TEOaRKgE"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TJmLOh031909
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 20:16:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/ZGyoxYE2vw
	gSzvJVWN2YN0dI0s8P9cmHBqgH65Sao8=; b=TEOaRKgEKXZl8BVMyYJNO1xYFMo
	x3PKu+eoiNJTKuj0pA+s4MaHzMIk5igdemEau9XbwnkAKzRAY2xHkG40yVqWlF83
	vsrUs+g3OZA+88YnFkjTBHPRoaJDjTyPt9+iDSElpv+ILQuXUiiXkFQ8ZfSArb2X
	0G2zalrrEmr90ylqCWkJRI5jgIbX0cc1jt0QKjnm4g8YmVFKXOUjhfJxPRIQldPj
	ik65WTUeUr83UGaH9+ne8r5f67RbII0uIpmYnQeojcEY6wT76EIBXCONgdawH5tP
	yjsx/2m+JrdVRo0aSDFTReI7fI/3sCDxfrjEmmuWzUWiyL5xgR/C0OzMz8w==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8fxan70-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 20:16:19 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-311d670ad35so1016824a91.3
        for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 13:16:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751228178; x=1751832978;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/ZGyoxYE2vwgSzvJVWN2YN0dI0s8P9cmHBqgH65Sao8=;
        b=LgsEYEjy4PmCxH3m8CaiA+alPzRyAjhq6UhAVORET42ZLAg4Z7RJqPVbFcayzPnV7q
         h9hk37Ugk58cql7vZR1wXWzjY6Ftv/RV+bmEbG9ipjNVeiMF0hiwErsXhjiMXf+u8hM9
         /Thal09kVs8ghgjyrFNsiD/41Au0TQ4F77KRZWbA3n/9Wzr4dpefUQ+kkqldMWzd/RuK
         fEIbGHVQwn8ambYpcp74VREBm5CZoF+e6fZzDu5R4ottYIC09hIs5oVZB650a7A1uDuc
         kOoDTWfpvmY7JWatr9QrrWMGFRaDI6Xu1hs/vQwEs6ZbXqiYjdsm0sOcj1XB84cvKL+T
         9LTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIVSwmyWb7Os9D2pCw6ex3n60smZYIa37YvQPemeWINU4HhErpbOwZrzidXiRuabmjTu+GJbVXYX9I8vE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRVorRQuiWM+0Mk/3umXmZujLdewPK/rE+ztt9O4DOhBZmK4TN
	XbRuirQ3zDZQG+sFHHPcFvXbo8R1I3jrDgFFCILTrzjaLuJL4WrPLHe84rii9esvtMtsQsiElUt
	O7h4ltv162QLq2u3DT+UpUDXKrPCFp7fI5xnl4Yf9zzu56nQ+9QjEmgaceafgllyi6MQ=
X-Gm-Gg: ASbGncslihLi+Lcu+FMjnFLCcvMgkxUjbKUFnEprjWhZkQaTJp3X2qqNH2Zcde+eM0O
	Gae3L0cnvMrMBAMU+Aqh2XMV3DKwEyim3fyFn/kL/3F81z7ff62rN1YiGUmxNxI9HPfi128BXw5
	cAI17cLetTdfGbUT8h7ZeLksCVOv1VT91wmTcdaTgumhEyUeW94d/R7f9trXT7NZYsuGGa09gHc
	jgt2/S53xXPXMzbs9AdoQrasx4vOqPH6MZGFkrxgFnucCI7jY2DWhXqqE4rqbHffE0cJQ052f2/
	sCmd9mxvJL9vPtWi9ei6uYUp1fMx8j5wJg==
X-Received: by 2002:a17:90b:4c89:b0:312:29e:9ec9 with SMTP id 98e67ed59e1d1-318c92ee68dmr17157229a91.24.1751228178453;
        Sun, 29 Jun 2025 13:16:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHcqaNgJEnMkUx7hpJGEVz350AjhfdZASStdapMozh2ARhQFgf1aXDQ0y4avr5wbj9GJufNNg==
X-Received: by 2002:a17:90b:4c89:b0:312:29e:9ec9 with SMTP id 98e67ed59e1d1-318c92ee68dmr17157206a91.24.1751228178042;
        Sun, 29 Jun 2025 13:16:18 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-315f54414acsm12293812a91.47.2025.06.29.13.16.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 13:16:17 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Connor Abbott <cwabbott0@gmail.com>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Danilo Krummrich <dakr@redhat.com>, Rob Clark <robdclark@chromium.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v9 10/42] drm/msm: Don't close VMAs on purge
Date: Sun, 29 Jun 2025 13:12:53 -0700
Message-ID: <20250629201530.25775-11-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDE3MiBTYWx0ZWRfXxIJQKNXtbkEx
 +buZ1vRHOyXpN9OFFs9YfOKNYQ7Z10Rkxi5/bhxPtz+72u3hrAfuzq4VZaQUbjs6rENZiQPB53a
 fIf6g/XPpc1/zVsyRgtPYLoM+6l+llGo2r9x7GO+UJF0jByDGeqM3Y9r4OZEx0VrV9kfAbGG0+c
 GfK1JpA3U2t3+oJhMpYzIMS7cfomg6hb9j/++n3af2WHrx7h2Mnz3vTh28nyew5ctRzwOq0VmIv
 Ti0VuqqfDKvo//FDXw3DCzU++Z2tkDrd2ELVhykl+AmjBfk0mCI29AJI7y49T3aCiNuqaByM0Ua
 HTYBqyXaBXUXc6uU15fJ9/TMqYC1CQJISv83FqeKCN8yLvRWMlKR6FOeUJF8ergCwYyGTf8Gnye
 KmSdTvHpOqvQHxjD9PCKQ4gQzVZFfmza6AT8Irs+xN0dh4Z4i/wdwSjACSyzpOyVY0U2u/ds
X-Proofpoint-GUID: O46CK6JIFgRXxxgruElAfOR52mtKyXGc
X-Proofpoint-ORIG-GUID: O46CK6JIFgRXxxgruElAfOR52mtKyXGc
X-Authority-Analysis: v=2.4 cv=TqPmhCXh c=1 sm=1 tr=0 ts=68619f13 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=nDn0RKeFDUDCjqZoaxcA:9
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 mlxlogscore=999 suspectscore=0 adultscore=0
 phishscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506290172

From: Rob Clark <robdclark@chromium.org>

Previously we'd also tear down the VMA, making the address space
available again.  But with drm_gpuvm conversion, this would require
holding the locks of all VMs the GEM object is mapped in.  Which is
problematic for the shrinker.

Instead just let the VMA hang around until the GEM object is freed.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/msm_gem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 7b0430628834..a20ae783f244 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -755,7 +755,7 @@ void msm_gem_purge(struct drm_gem_object *obj)
 	GEM_WARN_ON(!is_purgeable(msm_obj));
 
 	/* Get rid of any iommu mapping(s): */
-	put_iova_spaces(obj, true);
+	put_iova_spaces(obj, false);
 
 	msm_gem_vunmap(obj);
 
-- 
2.50.0

