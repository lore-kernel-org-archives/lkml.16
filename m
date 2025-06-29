Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17EE625DCE0
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 20:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751228225; cv=none; b=Nca782Th9r+jdRkYoAct1OiJvoSmUKYxF0L0Y2gSKRj18udBt3QaGVNi8FP7TCA9BP9gj1W+LOYUX3A2NsoTS5pfXU2qNMdzSXNwzTgfFf8VzYY+Oo9NIXnWK09gKx4Eq9yjADArSp5DaqBkBNdhj9ifthFhHSFw+1IfzHNysBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751228225; c=relaxed/simple;
	bh=VgCwVWqTpqRlfRQ5gyAJCTfkO3Reb3p+U/Zm/p//H08=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dlCa2OfpUCNSWJLZ962V9MOWM6ugVnNPwP46XTdNhoFmbhearF0b/lOOCEhzFpK5Rbox5D0CoKc87EHS5K4gq81eNNX/Nh+zO0CvI2DLULW0Vs6tlD9lDBU0M3xljyjITCF313cDRumQ6/ATDTO4nLQJkmMutueEWQA/kSHZqq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R4+Ea8mB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R4+Ea8mB"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TJKPlG032194
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 20:17:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=fDzBgQEKZYU
	G26jz6qIHJn61zKgVSXScxT3NVbL/LOU=; b=R4+Ea8mB1bbZgj8rNwYI7Q7gj/u
	f0ZOn1qDVXl6TXzE8ixXPeuHxrGJCw+CrhBF43oNDGIvJF8LESlgG0QoeH/r/e/2
	CxZ42oCb/0jn73QZSGe2SLv/fnWjSQjcigTt9mk5nqTpYtlM9pVPEfLDOCyW7U0l
	+2szWLga2shgsT9xdhabwDzyj9Px0bdqzpUNF1OEiUwir1gz0x+/BxTu1b7eOr1+
	5+yjwUVCMkgy1MfmjBcG9w+KNzbhR+xweXe3+axPQJy2WwVFybwJ1kfFOy+7Pa+8
	Q9B5NuzzssWvFDdnofpefc53v/dSGjIZoiSTIPLemSQWiOUJ1E3MF4FxQFQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7qm2muk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 20:17:02 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-23494a515e3so27567765ad.2
        for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 13:17:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751228222; x=1751833022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fDzBgQEKZYUG26jz6qIHJn61zKgVSXScxT3NVbL/LOU=;
        b=LE6w9V4jH5KHERXlzSv4b9sRe7YtHqDw4KdKDe+TnFtHIezEDt0KzXPhCH6kFaU4Hm
         VhFjhsueL5aFg62zu3W4i9Tz0AFIkJ1tzDNWqQ2PV5CBAARtIZn7ScK4lVo4PJUDi/w1
         qw+R4eeBddrGdIX3DuqpWvXU6qD4X0YmNG/eIo362Gj1Be/EMMg0g5CgQHxlwEc47xqR
         pi+dBql0tsttZU0BEcSfIZtteW/PosSmihLQZk/wVJytheeT2UVsR0dKCtAEKpD1evwj
         aLwEt8tvaogS0rIxP99unYQazXPwA41qTbaFcwKqjxgcEVNVHx4Tra8v9VzOgxsK6RqF
         DEzQ==
X-Forwarded-Encrypted: i=1; AJvYcCXh5mco5LYzdmGXzJsolTyGClzdHKJw7Y5eLhaM1NGPwYpnEsGk2TCaP525Tgl/utssajcM0C/qkEWI6NA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3ezbFtaP3J2htFJ1icvJaInVx25YIkZndQhSd+E0Ho7Ls7lsT
	3TrFcOnr49Ty0FwJ/k8ZoM3G2bqVPJ0fnOvPX2orqhF3kLoScJjSKfazzCQYOswUmxCGfRWGAk8
	St8hh20zEXBk4lZaFos8oG4uzXRNT5bMlDj1JgyRDlcj62/oMJfnr8Dlje1dL1wlIctE=
X-Gm-Gg: ASbGncvZ5ruj3Qfd0a2O8/tWKsw2GgBm/cUFMA/vl3EnKulhNuN7D3yjdcRe90MUeiM
	+N55ZQdBtSdXJty+NSp7xcTfidsgyz/hbCrKTh/nImI1BXmJoD7E/ftmcWwhsnHrVvbVaAt0Aun
	p3TnDXL6SqXXefzIxQmQBc5YIqJ7ExqcV4TfGxKP/g/M7pAfVv9rey5C2vMyPEsIoTEocE/Nz4L
	FZVux7SMUGsmqfGzPJSHk0M9TVHmR9ZuLufK+tjn2e9n1mNpMli+WPQ8cV1ZS5wwj1qOpsfaUJM
	DRJ4ReP5a3twiQgvqeu7NJW3GWEVAHtRJg==
X-Received: by 2002:a17:902:e945:b0:234:c8f6:1b11 with SMTP id d9443c01a7336-23ac460a998mr204143855ad.44.1751228221727;
        Sun, 29 Jun 2025 13:17:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFLpQD5GICYIqvvFhdJkmfy/Ovg7wYpC3gynOWCpzMdtDIXI235tmasxFkPxlw9AML6z9VilA==
X-Received: by 2002:a17:902:e945:b0:234:c8f6:1b11 with SMTP id d9443c01a7336-23ac460a998mr204143515ad.44.1751228221362;
        Sun, 29 Jun 2025 13:17:01 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb3bf1f6sm65561795ad.204.2025.06.29.13.17.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 13:17:01 -0700 (PDT)
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
Subject: [PATCH v9 30/42] drm/msm: Use DMA_RESV_USAGE_BOOKKEEP/KERNEL
Date: Sun, 29 Jun 2025 13:13:13 -0700
Message-ID: <20250629201530.25775-31-robin.clark@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=C4TpyRP+ c=1 sm=1 tr=0 ts=68619f3f cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=8Ft5guHMEotweHOT_P0A:9
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: fFAi57vf8v5ZrMVymkMcMdhKqbQpD2-c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDE3MiBTYWx0ZWRfX7sx8sTyjoZN2
 CRfPyhqR4yy8Yvas3VT64t9dt9vLOwqNFr7EmzALm8uP4umL6ES3JIYDZ30tqpNR/wGjtVA/pHx
 VIDSMlcoXnLZYohOuDc/znZsuxao86wWnYWzES7teicKf/6eHSb212GjT6GQO1xRxXUqReQAVkA
 pMEguCKSl+kzsuTW2WxCL3WfXTpVTjOuIk0yMjrLTFtPjc5uzofo4Nwew/I/rpjyFoybOOvhmH3
 Yg5TfFk2plilO18p0CwM383gLn+kcJ3IPesv5R8Uu9qBfUS51OD6CsVXlb3zjCe+FOgeA6k/6Zv
 jHaDNMLvp8io7tKV03wvDgZWZzhFvHJpfukyrDSNx9lQaQJL04vyseGOp/fBWrm0OgIbc+Ys+43
 YxzVqHz/U5umFgQZouEsxYsdRSusA1+84gIhetJrEy30lu7I47kNxeunS2q/Jv+f6DpPbBs/
X-Proofpoint-GUID: fFAi57vf8v5ZrMVymkMcMdhKqbQpD2-c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506290172

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

