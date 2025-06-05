Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0409528312D
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 18:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749148381; cv=none; b=rQOQQ3TJT3Ikc34/+2SQWeszz0x3Jk8ag1O4WRxks+rCD8Ex4F+khiTDum4tu9iD9x5eao38lXXtDAoa++eDjSuaqJ6FETBavzxAWMZERGUmBx+1oRdYHbn4BteZboKrNaMd/hX9IvaBXxDBlEjGYzuTJ4gLeOUXYvhEoKx3Tso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749148381; c=relaxed/simple;
	bh=ftDEYghv9ZPaM93JeZPk7reVm7j6fvbEKPYYqLyUebA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E1XEUpCOS8iOmRIRK2ptBDN0MlKZN8N8I543KEzdsg8TRMPH0fftOdHa0PLRRbSnaVkYzFAavkQr4B6C5kUMLd3OmC8fOXo/DJVlzVEtj/HLHIzGXiAcsaC1KQNPXz78/mJ3uy5tXuM0fan/R+Hy/nRniQdOfNzBoxaaieugJgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kkWZuV7a; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kkWZuV7a"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 555HPE4o027289
	for <linux-kernel@vger.kernel.org>; Thu, 5 Jun 2025 18:32:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=GjwdFtRmZCc
	ujedmTouJ/e/3QiW6i5MklXvEyiWEeF0=; b=kkWZuV7avWl80lhhB/hYQfk7lUC
	6ExfCDrzM83Xwna53MMUjXxiazcxrSxAsGzeE65ihvVDCymzW84/GWfwdqWB4sa5
	C16lWV87dXMvGc6HZ92FI0PbHMYkOmUt4wblVak9HqGGe0uen1FBf2BsjNJAEwjy
	/c/2iU+I+K3rbtane0VO8QWDqyaiWL2U2zoG66heRi0cbYyOQ/ikJvzek73kWwh1
	D1tjYiOrm5vT6Ymg9bWJWJJHwwtzugOwkPgijgVJ7wR4hEX1/5dzmXsnndVMLM3Z
	MHTIGDiCa1zKKVJTH9bQFm+f+vGZo7HFMibe5ROQ7oyFXdwou8/2Re7O8Ng==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8t29pk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 18:32:59 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-74620e98ec8so1219702b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 11:32:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749148378; x=1749753178;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GjwdFtRmZCcujedmTouJ/e/3QiW6i5MklXvEyiWEeF0=;
        b=uMMWmlOWmWUFSI5TWSmOfQF6Bipdm6h5U7Qp2QdWVZVmvn4nRSHgz8LNlQEHOkYWgf
         jXL7cNfhqh4KbE1nQyZv3ReoyIfK7TYMutZfLUgCd3Aez7XZFF26hOjHjute1yLQrjs0
         E/oXc6ZzxKpR76Qz8NnLtHumnFLN2uKMJqy/dQYOdWy7x7MBz35neCVAocvBOSR4PH/g
         08u62jgZV7BxnIJejG3nZgl6pS3OcesfKsyJ5foNWtAlG6hwUFK+WjE4Fe1yuhMnP1Vu
         INiBuWp9UU2YW6s2R/M+TN/EDx/E2MeFbA3nUH2kL6MfEHDsHSPdl5k3mv2L1fQCGtQR
         FciQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUktuFyxfnAgD26/4n6z+8/eJPzsBkQeOxoZSPqGtoKZB2EEI/DH9BCq5QY1sfV1k3IM7gzqBgZ/6QCWI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyc3PEk3s3ifFvMcIpxz1fHGfXYD+YZS6G3YNvtEM/RqyRF8fV1
	GHRT8uoxGJIa+8hWLzurevkokMLfuEu0vanH8CuD2HNZYP9FMnJAxg3tWbJs90kFUHMx/mkSwn2
	YgFQEoR8z/EAs+7Fwu4ths+/ASD4recO+QqrFcSf0mpI9CY53DKg8JXTmCAvaANpTeTk=
X-Gm-Gg: ASbGncuETpxmLeZ3IQyvzFHJ/bkbmKx6fkW81m0Z/wcfTjZZxb3T9QsndxK6m7hvqSc
	E5NCClnP7w8XcIBqo6V151LR/XYIe8YFVAoHz5caHGUyLOGrBWdHSCtE+COmckoRZ4t9gOJk3pj
	ZNQUn7XHY8HajsFJhJ3I6U5yz5gBAE9d9vOK0qPjzKNLxKw1QahBxYh12qEvwMsNiD0SVRFucRx
	/asvJiQMFbTOjnigemHBqSnSZvYTOeNEU4BIB2HlbC6slcHgq3861fyrY43q3w2JZxSwSiWoAGy
	9GThOWm5fClv9r4JDexVbA==
X-Received: by 2002:a05:6a00:f06:b0:742:a24d:aede with SMTP id d2e1a72fcca58-748185160dcmr6346508b3a.8.1749148378388;
        Thu, 05 Jun 2025 11:32:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHuKpjDQOHpbnp+mogU9n35DFZViXAwwcqPGcim05ueVVuUmQIJFSRRzTywH2aBcEBZ1w/yng==
X-Received: by 2002:a05:6a00:f06:b0:742:a24d:aede with SMTP id d2e1a72fcca58-748185160dcmr6346484b3a.8.1749148378012;
        Thu, 05 Jun 2025 11:32:58 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:89fa:e299:1a34:c1f5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747affcfa19sm13531812b3a.132.2025.06.05.11.32.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 11:32:57 -0700 (PDT)
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
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v6 21/40] drm/msm: Mark VM as unusable on GPU hangs
Date: Thu,  5 Jun 2025 11:29:06 -0700
Message-ID: <20250605183111.163594-22-robin.clark@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=RMizH5i+ c=1 sm=1 tr=0 ts=6841e2db cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=DhdyfM8_h7Qj4WYt2N4A:9
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDE2NCBTYWx0ZWRfX5cW9z6m4FSUS
 lqll98394En0Z5/5rI3p9a1BcnBw8ea6Zd6gOPQS17Ux6+6K3hOnrYnRj1y+WfNgyGU8b93G1S5
 OxEvWvsF6Kbo7w6JJo0LM0wveKFvjK9X9AuLGLi76ERM1BA9RIOK5gaJujMHz0cp+/su1cBLWw/
 kdmV7pG6Q37oQr7UGiEmg2X08CPMsgmrtu4I/fPqb+Uwqx9A+O9bLhVp8j/y8s4HIQQGf7t2Z/5
 aY0izkBO7OxK+k8/UvPy7IHDL+mW5z6M5tjwGB1ffkEKBs2jkC77CeQN6HYd33iEd9mRAVSm2T5
 /goIvB7oQ88ZCEVzfUDMa5vubSK8gbewL1sT1zoLVAS1eJLQv86eOEE5/sDJ/utbnDYb3KQXIEY
 JSFHQWWo9uwtclbNzt6XDgf6zx1EYbCefBXAtmc+3FieYt3I3h+s/lGcG9tsy5QWZIIWC/4G
X-Proofpoint-GUID: 3tvWDa5H0-ejkvNNRm-r2ki5Ewv7SOcN
X-Proofpoint-ORIG-GUID: 3tvWDa5H0-ejkvNNRm-r2ki5Ewv7SOcN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 adultscore=0 mlxlogscore=999 mlxscore=0
 clxscore=1015 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506050164

From: Rob Clark <robdclark@chromium.org>

If userspace has opted-in to VM_BIND, then GPU hangs and VM_BIND errors
will mark the VM as unusable.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem.h        | 17 +++++++++++++++++
 drivers/gpu/drm/msm/msm_gem_submit.c |  3 +++
 drivers/gpu/drm/msm/msm_gpu.c        | 16 ++++++++++++++--
 3 files changed, 34 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index ec1a7a837e52..5e8c419ed834 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -76,6 +76,23 @@ struct msm_gem_vm {
 
 	/** @managed: is this a kernel managed VM? */
 	bool managed;
+
+	/**
+	 * @unusable: True if the VM has turned unusable because something
+	 * bad happened during an asynchronous request.
+	 *
+	 * We don't try to recover from such failures, because this implies
+	 * informing userspace about the specific operation that failed, and
+	 * hoping the userspace driver can replay things from there. This all
+	 * sounds very complicated for little gain.
+	 *
+	 * Instead, we should just flag the VM as unusable, and fail any
+	 * further request targeting this VM.
+	 *
+	 * As an analogy, this would be mapped to a VK_ERROR_DEVICE_LOST
+	 * situation, where the logical device needs to be re-created.
+	 */
+	bool unusable;
 };
 #define to_msm_vm(x) container_of(x, struct msm_gem_vm, base)
 
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 9d58d6f643af..fe43fd4049de 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -679,6 +679,9 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	if (args->pad)
 		return -EINVAL;
 
+	if (to_msm_vm(ctx->vm)->unusable)
+		return UERR(EPIPE, dev, "context is unusable");
+
 	/* for now, we just have 3d pipe.. eventually this would need to
 	 * be more clever to dispatch to appropriate gpu module:
 	 */
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 0314e15d04c2..6503ce655b10 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -386,8 +386,20 @@ static void recover_worker(struct kthread_work *work)
 
 	/* Increment the fault counts */
 	submit->queue->faults++;
-	if (submit->vm)
-		to_msm_vm(submit->vm)->faults++;
+	if (submit->vm) {
+		struct msm_gem_vm *vm = to_msm_vm(submit->vm);
+
+		vm->faults++;
+
+		/*
+		 * If userspace has opted-in to VM_BIND (and therefore userspace
+		 * management of the VM), faults mark the VM as unusuable.  This
+		 * matches vulkan expectations (vulkan is the main target for
+		 * VM_BIND)
+		 */
+		if (!vm->managed)
+			vm->unusable = true;
+	}
 
 	get_comm_cmdline(submit, &comm, &cmd);
 
-- 
2.49.0

