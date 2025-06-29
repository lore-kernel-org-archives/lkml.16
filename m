Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A9B822CBE6
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 14:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751206049; cv=none; b=iUWgRL2GXWlxgLo/qvFP0JE9xP9Vl5vYS0j4PUEgNfw2BMAuxxEN3uEO1PAshP+jMOtH/fvLajBRo43JEY6KhGt1PpMgvUho1wp5hwb6rry5zVOwTVl9sZRUtlpW5kGfJcXeO2jYl0JAbdmCA47AHbeOuGmptW56imTMiy6tvSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751206049; c=relaxed/simple;
	bh=iDEV2orWmuIXKriA3mh+ffbHZMX8dfi8nDJuhBaCic0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FhBR8zgo/quOI0Sh5YDA3bQ3LF7NY2k+JP4C7B8OriFQ/O9GkQclfkx2G0hMIRudy1yMCj3TOyNei0cplzCgpsUB0TJwfcNIeV8kjRR6PAFBWnUb7mMOSAraC+eIh22l5m6/+XxNOij45ZWuQpYy+IOv+7bNJkO73k4TEvVkz4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MH7bbc1D; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MH7bbc1D"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55T9ZHbf021635
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 14:07:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/ZGyoxYE2vw
	gSzvJVWN2YN0dI0s8P9cmHBqgH65Sao8=; b=MH7bbc1DFoAnrrAiKzlxAKNKmNT
	eQ+QgTpAXkqU+HtEK4xFOsAXH+cag2pGJoQ61dMBgwxSz7vnu75G2ZvFw2P1vtp3
	e0gi7JUhhRO5MnbKPl+ftIGngduKQzriFLRWkCpRNoPT+Ty5+f2R7Fnb/zNm7QtS
	uR6Uj48qzdphwtx4aowL3etKe+n9tHEjQec3EVQG7uAe+t9vxn5EhMM3MCfE9Stb
	sonNhV/HPb9f5au9y3+d+xEh6Y14iMMZllfJQxSC2hljGQ7dcrrRB1S7JBRkFU1k
	cqtbboiLHTI6HU3ugLv4i46GXH5Rg02nmIltsvZgrgFS0EkSUjEma5BwLpA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8s9a5wn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 14:07:26 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-748a4f5e735so1209050b3a.3
        for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 07:07:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751206045; x=1751810845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/ZGyoxYE2vwgSzvJVWN2YN0dI0s8P9cmHBqgH65Sao8=;
        b=Q4IYdAqON7nIY+fXbc1vHl8tL4ECCQV9OULGkl7S/sPFRPWjv6r6mE6HUeXn9Y7bDo
         LjPcLPsBAxz04OG8BmPVRfXWS6wG7id0SwoefPSyI5KarkLTky1wz88nJoizeqZ5HAfF
         Xi1j4xr5kOqHFb7oglgYEvASUKIk6VjHZB3frISyx6qexFBL4Lee3TSEJOvNn87ALFg2
         F6/r4RG1kIxC9Ff3JPgXL1nBIt6rGEvprVwPJ3TExzxtu/NZcsjl8pvSLV5vXef+VhEV
         YUreYeGE7XDKleXAfvxAbx7OZRZj6XTwvepMhc60UwflX75rhROXUKbxKZKF7JXQX4dp
         7fVg==
X-Forwarded-Encrypted: i=1; AJvYcCUL+9tmN6kxYMv55Bc5W0QHPZNIFbASJRqaJpHqDQ5e2E5ps/QFW5Spr3i3LsSc8dglvwoZpW9TvfDq62A=@vger.kernel.org
X-Gm-Message-State: AOJu0YxseLrsauzvEPWZhPQGzQg16JL9377pOfj11F/gx090240iZD8+
	kGLP+33isoiWuvuZjhezxwLfAzns6LzJkqaYQaWOB74rLBkRuyTIpmGu7U0JtzmfL0W/kTulLeC
	4DA6bsEfdeAzrjUv3knhS0w9Kg9CBBsyQwNf38KAvGNsEPhkXbuyDzkQTEV8SMxdYtJo=
X-Gm-Gg: ASbGnct/3YFK8J7LzQjxAXwAt8QCRTPS6Ed80DIs2UG7PXwcu8V0PwlcCRcbgQkOZvs
	DfBwJ3zhSodkKZmJKJfhc7eQFrzAnTtIpWBPBwN9zAsuQlbL55xXTHLTQpcyjvXvo/KIpianjfm
	dXgYClJ6d1+v31GkX+bvNDYD6B7vvBbQTc6wxsrsH6Mah8sYuz0cDOa4/f1SlOGugT/Z8tSHr/f
	gBx342hasdBTtiz31uH37QRk6fG+eeb5ioqIncHM1i3OnqHX2Mxs7Zev7zKPhLViOWZWr3qC8Q6
	8IhS6aclEdQeAbhwxKvVgbPhwOffjXON
X-Received: by 2002:a05:6a00:a8c:b0:748:e1e4:71de with SMTP id d2e1a72fcca58-74af6f75b9dmr12651634b3a.14.1751206045585;
        Sun, 29 Jun 2025 07:07:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IENZJtEa8Zo6YKK1VC7UhfnqyS3PG4LqHA7jxkHsRhyjRhGBPSmWMeaac3G6wvZ2uQ+OkNChw==
X-Received: by 2002:a05:6a00:a8c:b0:748:e1e4:71de with SMTP id d2e1a72fcca58-74af6f75b9dmr12651605b3a.14.1751206045178;
        Sun, 29 Jun 2025 07:07:25 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af57f1ef1sm6773669b3a.164.2025.06.29.07.07.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 07:07:24 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
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
Subject: [PATCH v8 10/42] drm/msm: Don't close VMAs on purge
Date: Sun, 29 Jun 2025 07:03:13 -0700
Message-ID: <20250629140537.30850-11-robin.clark@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=H/Pbw/Yi c=1 sm=1 tr=0 ts=6861489e cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=nDn0RKeFDUDCjqZoaxcA:9
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: 6yVDGoGTQbj8cgD__uBe-uhUxnQDZgNe
X-Proofpoint-GUID: 6yVDGoGTQbj8cgD__uBe-uhUxnQDZgNe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDExOCBTYWx0ZWRfXxHgh9dEAETCf
 ZX3/UCwtivHhwyLrbjiwWAOA1Fbtay0meFS0kCfFH3VhjZdg3ts1J84yFYdA8Q0dziaOC/4/lWn
 b5Bh/108Mx7OdjE6vuMpXnvkLs6CCBKzFK6LC9Jv9xK5mCZXTPun6acNRtLwoIGuDbaGnj+AUf8
 qZ3HAeaSXp32uLoM1z+GerxljSLfioLh8UJLN1+YLC+QrHZMBr2lCftcWQYT2O7v4yHYQ/ikKQg
 lzKCxnp+s4IfNRAeArFXymskLah0IStamVJPL9no5Ldx0r1OHjCyhu9u6RSumnCfTKDde4ZPcP4
 ci7s4Z+1maCDpX7ATlcUVjC0V/CMt+Yqqb6RZpMFNYSM/c7CmGuXxmA5Ran04rrdybdaClIfv+Y
 EJNOJtpfv5ZYFdcFdQ9q4QwtaExyKIShPbfLI7wagnjKzL0sjk+NkvbeBTR/CQeDuG5VQwXB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999
 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506290118

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

