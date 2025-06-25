Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED0882DCC1C
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 18:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750877911; cv=none; b=FGWry2IvGJjhe+fLl6OQvCCln1OTwAWFUr9wah9rCW4vf+iVSxKcm8+x+uUWI7WGrpDdeNL3XDMHwhI2g1hDsSFAGEBqkHnUMbUEK2FMhLmtLCez+FM8gpQ4InNS4NvSAe6f+Z2OtpfexqcS7ydcPGkeqQ9mMyZkAneUf0K7xOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750877911; c=relaxed/simple;
	bh=Xoz678jgKXUU5eflKb2/hYyyho0cK1Uk/BBv29BM5m0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CgtHMN3B6zZYQ+pB1LLhO8SPCmTcerN/GTYfZw9aQ//fOxeY6lNEr97SU+s2DxX5G+CklKd943RacvcKi6M9w6nSjqjqnnV7FaTK/Z3XdnzUygLmF6MCQXQTJqkYlXiB4U4qXG9SNlGOBcommUN6VWFO2Cf/5vSymStQIxAkBvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ui1VBoV+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ui1VBoV+"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PC5bPh014481
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 18:58:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=pRucYDqGv/m
	aZtfEL5JUnKr0yOuvQGJ3l3EY7Z9RO/I=; b=Ui1VBoV+IXmMp6fl+lfP2dmVQoz
	K0nEfJCd/5Zr4mZvaokKx6Fii7Tyn889iyNEhz5PDYfWySxA49w42Z7kHSlXhjTj
	p+TQqBv5MqOxoPx74BjGy0of1mVxkZKb8F5kS4bF1Dzrl8tnl5e7DC5EyVlVQJWX
	cJMEv28as7h5bYJz7ULR7h/T9U8U8uP6b0152ZYXx5MLp2LdCcXRyDlr54LFNpkg
	YDR8DApCPgQZzmoxNKNeYZq6Ec/BC3vHJO0Jx67tTWWcwsYNjSisMtmLqt8x771G
	Dc/0NXGyfZV+cCS3AWSkOTctvOQbTaXLSeUvbCaS6OO+74BA29wSfJIu1pQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47evc5t1mk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 18:58:28 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b321087b1cdso192113a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 11:58:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750877908; x=1751482708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pRucYDqGv/maZtfEL5JUnKr0yOuvQGJ3l3EY7Z9RO/I=;
        b=ILlZQSaxEsBbVOUb/5xIj1hGQmZfTt/SBzQ8vpQH6m0UottwFp3x6clUxSSud7YlLh
         liDKQhYTK+OKZ87kkYt92XZYysLMS9ntCwm2sGzVnZpKebMpjnEr8H8qEe9YuZBWe24x
         4cUoGdcUsAu1oaj5Q1Zkp3vQDWZ3/SQ+HLiOV+T+9gb0I8j/tnIKKCFjdNl/2enGwuTu
         L3VDgVsPl0ExNla5mZo4jzDZKXhLkq8us3YBUSsUbygUwS2PEJ8/N45B4QpeDBvprFkt
         yPURijWATxMEmKGnh/iHZ57bVe502RiX5jHKCEObCsdKImg2UQrfnvFjT2IIkA844mYH
         ulaA==
X-Forwarded-Encrypted: i=1; AJvYcCUZPwfJ0tqF3Iq2qjJAwxe/caLHmL0g918DqU9c8+n3xTwm6QmhikLhZEnyPO0q+Q6EQRFChrYjX5lajXI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEpqW8gqSeljmmW9r6pKewGqc1dp57UUDppbuAo1phnAmll1mS
	lv8ND3jfUfkZumFieny1dlolwmSUIqUn2MgmtwreH+ZFG0z+MZGeUMy5CRItBHa9aY2GI1+LBCP
	9WixSxnyWThLL43O4OOfgLB9ulJIUX2wlw8nD6fHo1gux0U8p6vLx7Sr1G1rtHXUWPCU=
X-Gm-Gg: ASbGncskx3jN1XUw+pnzTKVbpBYUwuxeHFKm22Yk9z0NSPnBX0u9LjZS+kLZNqVnUB+
	0BrKn4UmzACMOGx+0bLaJgHvFOw0LgbvU96oEReiOglwSLbmjNfIvxfexVZ20H/MlsdR5ehPa0X
	gJFar6gBHA6ablS2dTeEiv35mDanKpPBynkm4dxNURhO/rYetQY0VZ01yOrT5Y4vOwF0nbeiII3
	EoeeYcHZJ+RVZIL8wxgGR6eTvFeaYlTNSapukl7GwuIXLb5Q9fvRoMvAZQYq0+pqRTossZNdyfn
	OFDb5UmYGMdUP6YPDbtedRxJK2Cn0aRR
X-Received: by 2002:a05:6a20:2455:b0:215:dfee:bb70 with SMTP id adf61e73a8af0-2207f318fe2mr8507921637.29.1750877908109;
        Wed, 25 Jun 2025 11:58:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHOvgejDLBkS6INLNWDK/Gkek/+S3lKYyWdUsJlq2UMYP86RfIoua6q9zR3X9TSiP+SVESMTg==
X-Received: by 2002:a05:6a20:2455:b0:215:dfee:bb70 with SMTP id adf61e73a8af0-2207f318fe2mr8507887637.29.1750877907712;
        Wed, 25 Jun 2025 11:58:27 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b31f118f7d5sm11937530a12.12.2025.06.25.11.58.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 11:58:27 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Connor Abbott <cwabbott0@gmail.com>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v7 09/42] drm/msm: Collapse vma close and delete
Date: Wed, 25 Jun 2025 11:47:02 -0700
Message-ID: <20250625184918.124608-10-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-GUID: EWkO5GTCRMuONcDQYhGxHSsb5zA_UGgK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDE0MyBTYWx0ZWRfX8gzXfeCeLL72
 wzh16U4DiO57EE88miCJxhjnjlhtUjGR/lYQZxNQ+utzkAIt24chKGCAutxU91H+tlg5GZoM1oo
 CaD/hxIBgJNu/DcSjEXIPzBuw5tzBZnqW5P7ZPxhc+kI+JLbpqQ+v+5kP9EggfND9EKyaMHzOcr
 PHKPoiBKATaFenc9n5AqiXayO4dlDm3+4KzuRnk942J2iYrb/KWukUuShQ6MCwO7DlO0yxvzKqG
 5g8fJRmmQj00w7+Yf51SrcWlpRFtGJ45AG8zM7m1EP95ZOjLEu1ldcNfssyQvi6JiCgjagMaxkt
 qSPocrpHqLb0eGXUXy0iBIhbZrahRPjsWrz2ZEAMVasFZTCDvl8SYFV2Elx706PO7RzH1+3aR13
 GENhT7sG6smgr+IC2nfPdPyR8ondl2M2ZCijt0yVsNci2h1WA/K+C1UOTQ1hiF6oeTaYLKT7
X-Authority-Analysis: v=2.4 cv=caHSrmDM c=1 sm=1 tr=0 ts=685c46d5 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=RIvuzEnNBJp2qadMtJ0A:9
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: EWkO5GTCRMuONcDQYhGxHSsb5zA_UGgK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_06,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxlogscore=999 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 mlxscore=0 spamscore=0
 malwarescore=0 phishscore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506250143

From: Rob Clark <robdclark@chromium.org>

This fits better drm_gpuvm/drm_gpuva.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem.c     | 16 +++-------------
 drivers/gpu/drm/msm/msm_gem_vma.c |  2 ++
 2 files changed, 5 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 29247911f048..4c10eca404e0 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -353,15 +353,6 @@ static struct msm_gem_vma *lookup_vma(struct drm_gem_object *obj,
 	return NULL;
 }
 
-static void del_vma(struct msm_gem_vma *vma)
-{
-	if (!vma)
-		return;
-
-	list_del(&vma->list);
-	kfree(vma);
-}
-
 /*
  * If close is true, this also closes the VMA (releasing the allocated
  * iova range) in addition to removing the iommu mapping.  In the eviction
@@ -372,11 +363,11 @@ static void
 put_iova_spaces(struct drm_gem_object *obj, bool close)
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
-	struct msm_gem_vma *vma;
+	struct msm_gem_vma *vma, *tmp;
 
 	msm_gem_assert_locked(obj);
 
-	list_for_each_entry(vma, &msm_obj->vmas, list) {
+	list_for_each_entry_safe(vma, tmp, &msm_obj->vmas, list) {
 		if (vma->vm) {
 			msm_gem_vma_purge(vma);
 			if (close)
@@ -395,7 +386,7 @@ put_iova_vmas(struct drm_gem_object *obj)
 	msm_gem_assert_locked(obj);
 
 	list_for_each_entry_safe(vma, tmp, &msm_obj->vmas, list) {
-		del_vma(vma);
+		msm_gem_vma_close(vma);
 	}
 }
 
@@ -564,7 +555,6 @@ static int clear_iova(struct drm_gem_object *obj,
 
 	msm_gem_vma_purge(vma);
 	msm_gem_vma_close(vma);
-	del_vma(vma);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 6d18364f321c..ca29e81d79d2 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -102,8 +102,10 @@ void msm_gem_vma_close(struct msm_gem_vma *vma)
 	spin_unlock(&vm->lock);
 
 	vma->iova = 0;
+	list_del(&vma->list);
 
 	msm_gem_vm_put(vm);
+	kfree(vma);
 }
 
 /* Create a new vma and allocate an iova for it */
-- 
2.49.0

