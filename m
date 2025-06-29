Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 370A62673A9
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 20:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751228244; cv=none; b=IzybtKwTPdLCjNVG4VIfdsDB6uYnOSmCkS5LS1Jk5MxV7KTOW90vYs9HqFBMeyCGo0z4iMHKOxffQwnu7Vmf2mJdo+SeGNzYRM/3Jdjg/aR3xghfbsDtCegj4lsKZT1MGHR0wRfIpLfCDCFWN2bWfY9R15ZjgYkf2rmEpnwFEKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751228244; c=relaxed/simple;
	bh=GA/euJZvPnrn04HD6YSSPSTZHhMAiLYipK1JN69VVyI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UW7gJE+nSNQbcjrB/trpkdFkQKZZB42L3oxWRiVUHswjmuZoTDEW6DdCFDlTtSyLyQFB4UrN0tbFx8DOCRf/fkIal+6atoGtWNlpg/QvRcdShQ6d381i68ac2gXtWQcC3S6LasTQWwRrPayD3kcX6ciz5aidP7ev/PH9gyaK7zA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VjChzmTf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VjChzmTf"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TDRoWk010344
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 20:17:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=H+PwAR+LcFx
	tNvXZN+nlHyJ0v2ma6kEtDHyNZ35oe64=; b=VjChzmTfPSxjfWmUMp8tV9s2/Gs
	ED6SfbfXB3F/E1CCpfu9EBlCJ38Ss1XUqy9YwMPQ1Mr6zPYXSaowRap1J3otU0oy
	TgBqYzYwAtGP7HyACUvsGLA4IHCOJ+a1G4AvndsSR/y5TVFTdAiQ3wqKjIXDSLHO
	7mMrQW0/+KFhclAidNpWzt3WWnaSPhga269VtS8dV+KO4uvsDXwqzupEMD0jQrY6
	PvxnXzO3djtea/hGuztR7db1ENiiTZ3Rc+/sM7g3L5JhJpVyUb/KA+M/61xKladK
	LtxkI+6DXrKEIeyR6CgKnlosfAYlYjWpfZz9idw/h2o2ykzZZAgiJLbtkTA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8s9ak1y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 20:17:21 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b34ca003f1cso1090103a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 13:17:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751228240; x=1751833040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H+PwAR+LcFxtNvXZN+nlHyJ0v2ma6kEtDHyNZ35oe64=;
        b=YMPrJv6cveji52N7u7k4aOyJkGqrT3N9dmHNRw/otdYc0pg4R9hDP6UtNqAmmB9cI3
         s5BW/hyVcYSytnYQz/yV00nq/iY7lIwrC23nyCNmeM6c5HMPYlyugUmieJcaFDxsGNgt
         XE4VcaQC3M88HsfhfKvbpHiwS+8xgqRpwWGCnG72HzBAYLCIINd2NZxKGIp5aOPSynoA
         E7oHiGQTyK3/9zDmZk08tDnyYOEjIBwjoZdoP4RBKIg6VebivXPZ7tcZj0FttfKpQMAu
         Yn4JkBthXhq4BuLrmxnnZlgxdDyNbIIcJ9YYs2ONrGY3KGobXwx806x59c0UPaNwieur
         oVhw==
X-Forwarded-Encrypted: i=1; AJvYcCXRjlJcU70862fWii/zWaOZpwIRQsTVgYmoqTu5HpPWL3jn2TUc8EG4HNDRarU+3BqPAA3dScjslP4Ndas=@vger.kernel.org
X-Gm-Message-State: AOJu0YzaCEHxlzHf8SudDxtdSDHcCsunUbg3hRWqrWqJkX//f0DUTly7
	Vbh2mNPeUSrN4vk+xvr8zfA4bVy+KZZEpM+ZrvQpSmObViq2WSErhD+15uyOPVT7HoPswOhzHBp
	T8WMTjgL2TzpWiDGNbCG1hhUnT/fC9Xq82W7p4EctjMWF0WTCnmtRJx/0/CagY77sd9A=
X-Gm-Gg: ASbGnct66AgvKOmw319vLzLaAsG1L4ZnSaow4wY25CGTIMcDdflOGafHgBF8uSsIcoy
	Hs4rZBsINcArX/le0MgZD1tgtvK9duW67gs9Ilb0yNuY/I9tpO9/OoIuDOQpkxmY1YuEuEkiOta
	wZP3NhQjjAcbrnZ7IzY1qIPTnZmfhs+7a63S/SBiUnlQI1hrReR362qGjrKmPg1PEL7t8qOTjM/
	c0tQ6JNTwqjXM1Iej1tRpCDKqHB2t3HKaSgFoHi8t8dP+ktiRQdPYVZ2mX2PrvkSN8ljDoVvlxY
	Ep84L0JkHQ42EtqFurpUpKn4R+tJkJbbMg==
X-Received: by 2002:a05:6300:4041:b0:220:27d1:828d with SMTP id adf61e73a8af0-220a16a31b8mr16389643637.19.1751228239765;
        Sun, 29 Jun 2025 13:17:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF+DNxLLr1TV8ybCvuLW2bEtYQJQDNo3DFmHJc+uBq6Qmv0Y0YvTITh2swb06/IBU6JeCCoDQ==
X-Received: by 2002:a05:6300:4041:b0:220:27d1:828d with SMTP id adf61e73a8af0-220a16a31b8mr16389620637.19.1751228239357;
        Sun, 29 Jun 2025 13:17:19 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af5806380sm7545854b3a.172.2025.06.29.13.17.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 13:17:18 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Connor Abbott <cwabbott0@gmail.com>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Danilo Krummrich <dakr@redhat.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v9 42/42] drm/msm: Add VM_BIND throttling
Date: Sun, 29 Jun 2025 13:13:25 -0700
Message-ID: <20250629201530.25775-43-robin.clark@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=H/Pbw/Yi c=1 sm=1 tr=0 ts=68619f51 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=EjYnvkII5fvYeB9zoMQA:9
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: 222Q_UkOXWNwz8eAFaJvuV_zlRF7EG_o
X-Proofpoint-GUID: 222Q_UkOXWNwz8eAFaJvuV_zlRF7EG_o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDE3MiBTYWx0ZWRfX9K7EeUf8CV8P
 EnRfT9+hG4xEmOqo0iFdOpGUpldAc76VIf/Lh7Q3nPT1Yn7ETcLFRaNRuSzjBztENHhfdwcaknN
 z9Js6cp1rbUWonukG7o+cD50ZCa6CvLR2MBJbs5FLC1kOwKkeCLolBsW7OtW4VtFOxSLe09Qui+
 d9S8/peBNva4IHX4DN/WEsKNdxnABMjvFkFdUAsip7kGrOMOYAdHqyxfxsPO2QSFsqSo2oGL0Z5
 7CFKb3gQqExDQei4Bc+w6i2fAfmOqD++flUeTYdrCn5HvvZwlLG0cPR51IyE+w8b1svKh2J7Vyz
 hO9yA1P5EfOTFXmmQNsXeISCn3WjAGA9X7bwaO/ZD8RVlMkqCDCQ/Huzp/QreEIWaaYDMDYvCGB
 Txwfe70Iv/aU8iM1ODuWGc6IeA89lE3EWIRAP/Sn+LsNUd6Ur5Ca23Plf4mFlTzo5GqsB1iv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999
 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506290172

A large number of (unsorted or separate) small (<2MB) mappings can cause
a lot of, probably unnecessary, prealloc pages.  Ie. a single 4k page
size mapping will pre-allocate 3 pages (for levels 2-4) for the
pagetable.  Which can chew up a large amount of unneeded memory.  So add
a mechanism to put an upper bound on the # of pre-alloc pages.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/msm_gem.h     | 20 ++++++++++++++++++++
 drivers/gpu/drm/msm/msm_gem_vma.c | 28 ++++++++++++++++++++++++++--
 2 files changed, 46 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 5c0c59e4835c..88239da1cd72 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -75,6 +75,26 @@ struct msm_gem_vm {
 	 */
 	struct drm_gpu_scheduler sched;
 
+	/**
+	 * @prealloc_throttle: Used to throttle VM_BIND ops if too much pre-
+	 * allocated memory is in flight.
+	 *
+	 * Because we have to pre-allocate pgtable pages for the worst case
+	 * (ie. new mappings do not share any PTEs with existing mappings)
+	 * we could end up consuming a lot of resources transiently.  The
+	 * prealloc_throttle puts an upper bound on that.
+	 */
+	struct {
+		/** @wait: Notified when preallocated resources are released */
+		wait_queue_head_t wait;
+
+		/**
+		 * @in_flight: The # of preallocated pgtable pages in-flight
+		 * for queued VM_BIND jobs.
+		 */
+		atomic_t in_flight;
+	} prealloc_throttle;
+
 	/**
 	 * @mm: Memory management for kernel managed VA allocations
 	 *
diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 63f4d078e1a2..49f460e4302e 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -705,6 +705,8 @@ msm_vma_job_free(struct drm_sched_job *_job)
 
 	vm->mmu->funcs->prealloc_cleanup(vm->mmu, &job->prealloc);
 
+	atomic_sub(job->prealloc.count, &vm->prealloc_throttle.in_flight);
+
 	drm_sched_job_cleanup(_job);
 
 	job_foreach_bo (obj, job)
@@ -721,6 +723,8 @@ msm_vma_job_free(struct drm_sched_job *_job)
 		kfree(op);
 	}
 
+	wake_up(&vm->prealloc_throttle.wait);
+
 	kfree(job);
 }
 
@@ -783,6 +787,8 @@ msm_gem_vm_create(struct drm_device *drm, struct msm_mmu *mmu, const char *name,
 		ret = drm_sched_init(&vm->sched, &args);
 		if (ret)
 			goto err_free_dummy;
+
+		init_waitqueue_head(&vm->prealloc_throttle.wait);
 	}
 
 	drm_gpuvm_init(&vm->base, name, flags, drm, dummy_gem,
@@ -1089,10 +1095,12 @@ ops_are_same_pte(struct msm_vm_bind_op *first, struct msm_vm_bind_op *next)
  * them as a single mapping.  Otherwise the prealloc_count() will not realize
  * they can share pagetable pages and vastly overcount.
  */
-static void
+static int
 vm_bind_prealloc_count(struct msm_vm_bind_job *job)
 {
 	struct msm_vm_bind_op *first = NULL, *last = NULL;
+	struct msm_gem_vm *vm = to_msm_vm(job->vm);
+	int ret;
 
 	for (int i = 0; i < job->nr_ops; i++) {
 		struct msm_vm_bind_op *op = &job->ops[i];
@@ -1121,6 +1129,20 @@ vm_bind_prealloc_count(struct msm_vm_bind_job *job)
 
 	/* Flush the remaining range: */
 	prealloc_count(job, first, last);
+
+	/*
+	 * Now that we know the needed amount to pre-alloc, throttle on pending
+	 * VM_BIND jobs if we already have too much pre-alloc memory in flight
+	 */
+	ret = wait_event_interruptible(
+			vm->prealloc_throttle.wait,
+			atomic_read(&vm->prealloc_throttle.in_flight) <= 1024);
+	if (ret)
+		return ret;
+
+	atomic_add(job->prealloc.count, &vm->prealloc_throttle.in_flight);
+
+	return 0;
 }
 
 /*
@@ -1411,7 +1433,9 @@ msm_ioctl_vm_bind(struct drm_device *dev, void *data, struct drm_file *file)
 	if (ret)
 		goto out_unlock;
 
-	vm_bind_prealloc_count(job);
+	ret = vm_bind_prealloc_count(job);
+	if (ret)
+		goto out_unlock;
 
 	struct drm_exec exec;
 	unsigned flags = DRM_EXEC_IGNORE_DUPLICATES | DRM_EXEC_INTERRUPTIBLE_WAIT;
-- 
2.50.0

