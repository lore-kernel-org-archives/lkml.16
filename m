Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1960124293C
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 14:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751206089; cv=none; b=aoTHfnnlbd0fa+udv1gy6eMF+8Dm80BygjgtOpURExvZ0ZnVQmd0RjMWGXfFHGhxOF7wU9GfrpKxlN66ZRMHToEyMFUivE3jC3Ifyoj81MQ96XIdO+lwGLNW5lfYdmNMehstm2rJDD2nm9xd6dmgx2mHjobYjJ7IVSKr/HXliSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751206089; c=relaxed/simple;
	bh=VgCwVWqTpqRlfRQ5gyAJCTfkO3Reb3p+U/Zm/p//H08=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Clo2qMJnVPGhN5QV50lYt8wn5QnKhNEFmkUx0JtBOibhQnLkQOVF+bydwc4JoJy6ulYGy9XJak+W2W5Z1Gf4NDqV3KujAb6qdFtb2JFF4PHU+gu/ap4s9nf52ct+AIxm2MUn/IVA7EChXRWR0bwpk/k9PINd57wg1yRwn6kudPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H8KtDQ7+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H8KtDQ7+"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55T9TfQ8013288
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 14:08:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=fDzBgQEKZYU
	G26jz6qIHJn61zKgVSXScxT3NVbL/LOU=; b=H8KtDQ7+cji0fJIzrUl/zXGdgqM
	brV9B5h7udP7kKwVaaeC/bphrM4sg6sl15tQaH80GAu7rg6eFeypRFlWOIf9ebYM
	VI8q/JIuiRZwZHtxAESM5XZZu26s+pqWR/QwA9T7YyNfrlBzbuedAT+krdxWfX9Z
	wCkXRR36xJFvREGsbAk5STh/F5a/o/C0WxYsQQcgrTquELfXXVwxAq1s8UWDgGP7
	LsO6HhQjm5LE0hpJuNM7fpyIU31ZSkkv1G6aBjTz5spAhQFhXVKKIBkqy/5Fwmxq
	CjfCXCJx1daD2hhSjietLeHWyFczxIR6cb3WuNwuMtbcIkt/loomiXZVY6Q==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8s9a60d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 14:08:05 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-235e3f93687so19019105ad.2
        for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 07:08:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751206085; x=1751810885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fDzBgQEKZYUG26jz6qIHJn61zKgVSXScxT3NVbL/LOU=;
        b=ssHzighotlXRVJIg1lpII8uG+UBAo9ATE+egzmy7Q4V979c7sMtbdiDvDV0jyGmjb2
         mFoIo5wJw1XisSp5uoLdLRbQlUI6Av1ZXVZUGIdynNrckT75ZV3RuJ1liJgPKLMsuvgR
         UK5YpEorf3ibysIIzRwYJoUZxBUr8qSbvTZYbmcGnce98PBL6+/OAKo+2cOuThZKgKgg
         ulacuR4S4rSj/cbWeC1RJ1Az+0JtismkqQToY0gM2fT4iqtvyVAgZ37mUim+U0NBcCa3
         LPqodpORjh31JZmE1f2Ytua+UyqrodoSbzlG2XG1crvrFBLwbfDnLIUVdrZbNf6BFpHX
         4AgA==
X-Forwarded-Encrypted: i=1; AJvYcCUmykLwVIEPJF4ZN/LKfnvBKJNbVgP3wJGwWjCpwMhzCNCfyscSBlflPCyezShQj09QWOLFyJD/QMhDqvI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwgZhmW54I//2HIgVTDfNb2XXVXEtswidDcZr5CNRDV7+geKwBd
	cdHhtiK4wdbSb+nDAfte74U6kRufHzYQGUvZHukzWMikRyutAYT4wwbP7qlQCZr5St7nAg4sff9
	WYqQB5Ot3O/ukGqxuWl2pDa0eAo3FDraBi9QHAbA7aGT1+XnP/5fpB28GsKKQY2W7Oqw=
X-Gm-Gg: ASbGncucU0m8v6VG+XCAe4fNMs1/5gina35MRlUx8Q/svnKRZWO4ZnVuT4DNlB6HXyR
	MWcHTyNdbL0eFDQhPGBeW4gYAFiF0dulCQ1JxKwnDGYEBb1d0wQpKGQuT/NqMr6XK+g3/khC/mr
	Pf2wqxCRj2wl3i3h5/xLU6fKtZmZ71OUjyGv/qVpVNJiNjqSY0oEOMM0iSXmHVP142fqjEyJify
	h/gV83XN+DX1p/Zh1Sz2s+gzIQolsD/ViQLwFcobLPTERsBHa4GprkmZj9ydkIEYMddKvaV05c1
	t2vSf4B90QhdxkYdzxDBkV1ycfJjura6
X-Received: by 2002:a17:902:e54b:b0:235:eb8b:9968 with SMTP id d9443c01a7336-23ac463470cmr169136375ad.36.1751206084533;
        Sun, 29 Jun 2025 07:08:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHkyc5NqpGoUysSULZkt4YI8T4ojjTyZxoY3YnC9AbbMNNhL19AVyCjD/gR1PB/UUJsbTP6lQ==
X-Received: by 2002:a17:902:e54b:b0:235:eb8b:9968 with SMTP id d9443c01a7336-23ac463470cmr169136005ad.36.1751206084070;
        Sun, 29 Jun 2025 07:08:04 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb3adeabsm57654565ad.159.2025.06.29.07.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 07:08:03 -0700 (PDT)
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
Subject: [PATCH v8 30/42] drm/msm: Use DMA_RESV_USAGE_BOOKKEEP/KERNEL
Date: Sun, 29 Jun 2025 07:03:33 -0700
Message-ID: <20250629140537.30850-31-robin.clark@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=H/Pbw/Yi c=1 sm=1 tr=0 ts=686148c5 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=8Ft5guHMEotweHOT_P0A:9
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: dIdpn-Ar9DIucrcElkXJKGpySwwOGmMc
X-Proofpoint-GUID: dIdpn-Ar9DIucrcElkXJKGpySwwOGmMc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDExOCBTYWx0ZWRfX99hbC9H6N4i3
 e7tSWGkm1U6EqQPI/q4Vv80BBPYfs385mWMN1qm7/BeFC3N/SNVbGeXh/WiWIDh7HxuPCFbQXFf
 iEb1e3Rp5y3GMRtEZTRFlMgFJLQWroRm0IAEd3KS4l6dH1R0xeJpstPSV2UL8TvgX7wQCR4j99c
 gEFCwp+55aA7OTtBQH7KmGYyk4ZO9b9EhembUoq6EROHJn4SOrYk09J7lCJsPe6eUN4nMRIXILN
 N+jRS6xC3d2uvkFVcN3fna21VRaXK8WlIKCnuAl0oOBUAG8RPmtMWnVpFjVROR1+n9JtG5VZGDs
 PkL4mX9nGXGH+bDZhw4AK+1O+5lAZkqza1r8clcDTvTbhFgasxxPpjCMUl9UBoPBso2mDdfruno
 vitEFgRpqHAJUiMXp8yudmxvbZU1R7ZMCd7Ys/aPehfRB/WV9yvtjQQAWp8zcznra1GVA+a2
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

Any place we wait for a BO to become idle, we should use BOOKKEEP usage,
to ensure that it waits for _any_ activity.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/msm_gem.c          | 6 +++---
 drivers/gpu/drm/msm/msm_gem_shrinker.c | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 100d159d52e2..b688d397cc47 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -93,8 +93,8 @@ static void msm_gem_close(struct drm_gem_object *obj, struct drm_file *file)
 	 * TODO we might need to kick this to a queue to avoid blocking
 	 * in CLOSE ioctl
 	 */
-	dma_resv_wait_timeout(obj->resv, DMA_RESV_USAGE_READ, false,
-			      msecs_to_jiffies(1000));
+	dma_resv_wait_timeout(obj->resv, DMA_RESV_USAGE_BOOKKEEP, false,
+			      MAX_SCHEDULE_TIMEOUT);
 
 	msm_gem_lock_vm_and_obj(&exec, obj, ctx->vm);
 	put_iova_spaces(obj, ctx->vm, true);
@@ -895,7 +895,7 @@ bool msm_gem_active(struct drm_gem_object *obj)
 	if (to_msm_bo(obj)->pin_count)
 		return true;
 
-	return !dma_resv_test_signaled(obj->resv, dma_resv_usage_rw(true));
+	return !dma_resv_test_signaled(obj->resv, DMA_RESV_USAGE_BOOKKEEP);
 }
 
 int msm_gem_cpu_prep(struct drm_gem_object *obj, uint32_t op, ktime_t *timeout)
diff --git a/drivers/gpu/drm/msm/msm_gem_shrinker.c b/drivers/gpu/drm/msm/msm_gem_shrinker.c
index 5faf6227584a..1039e3c0a47b 100644
--- a/drivers/gpu/drm/msm/msm_gem_shrinker.c
+++ b/drivers/gpu/drm/msm/msm_gem_shrinker.c
@@ -139,7 +139,7 @@ evict(struct drm_gem_object *obj, struct ww_acquire_ctx *ticket)
 static bool
 wait_for_idle(struct drm_gem_object *obj)
 {
-	enum dma_resv_usage usage = dma_resv_usage_rw(true);
+	enum dma_resv_usage usage = DMA_RESV_USAGE_BOOKKEEP;
 	return dma_resv_wait_timeout(obj->resv, usage, false, 10) > 0;
 }
 
-- 
2.50.0

