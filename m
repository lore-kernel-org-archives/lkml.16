Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E529C2F235A
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 18:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750877941; cv=none; b=mlIxyn6leydJ4gFKjXBrc5s9hbaeDLBjJAcnfJWxqtMTHNMgo/bpNDiepx0Ki+M75I+O+XOiE/vs6bxCbOBVU2y9x/iK09OQtNaD+IVuGA8S1abZvBIR0Hi5pVGKKJz8ObZlKDZSfolNzL/U7Rxd1cUGfSK2lys7xBEVfhdxV7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750877941; c=relaxed/simple;
	bh=gDYgHef44Lny38EE3+GPC9wMtp7r1eZztZ+KNWUtrRg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jRWm4pBge1L06IUzSuUomtsq5ARr8NdJGVcvQrcEH0aytORBUrWKvXB1L3xIv0532rYWhgrXlbrspDbsBqqTI2RgeMQgcKpwDcwOqJUgk3de3GYdylwKlvEt2+TUZT+FEvGW0bjMPu3jKMKBugkSEk8YOXZiHosIo6Q9fyci6vY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kePs+Dk/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kePs+Dk/"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PB1Cwd022842
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 18:58:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Fs6B1Ljf/Yl
	zr1lvB9QzWqwNCHwqvCdUFJZrpJiQ7wk=; b=kePs+Dk/AI0NmqYr7qQyVxJlqto
	7g3sZ27ngvGptMS60mrrga5DuIhr+DHd6TR6JazMLu2JRONd9WLtV9pEiUoHBoum
	dHHXb/Yk7CoZPsPAEKcnGkhrQQ2S/Ot7Q2elimyjLbOzqEg8TvLzBSVsQ4//cEUG
	r9Ovv65hLnZdgjn9Bv4s3vbGAQOyD1ijJQyzrUOGXcpCL5YYdPM/fmCNED7RNX8M
	agf15PdG5jmzVfS374OQoB9wstLv7Sb+NylQ8FWzmO/mkLYc6VymjAo8q29eliiH
	jD0LQwXCuHevZYhV533ia9mOlLW1OZE+2zN+dk0ZB5PTrReuZkSviGEv6CA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47g88fapnc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 18:58:58 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b2fdba7f818so172449a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 11:58:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750877938; x=1751482738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fs6B1Ljf/Ylzr1lvB9QzWqwNCHwqvCdUFJZrpJiQ7wk=;
        b=q/PjkUmXxr593VB+Ie5zmsE0859OQRXWp7RAk8gjIi0ETexw7vP1b97kRMMeiJJXjI
         YPM5bxF8z0rb1wjgXNL9I5wfscmDLDuRcxCmWDQRuVVcEkn+VS+2uLqeXaKDxXZZ0Z0Y
         +Q5g/Dstb/On+6AiD5iBybzlmHVNr/wNrrixxLYcCwvQXe4Ghin1Mhmk9IWXl7av0Y/h
         FFchBB897dlzNcWkyImxPBSycr2eIleGEg2qxTeluGQuG1pYmkGXNYalG5Vm7mhb1gD0
         3pkav2r+h0RGnorEYfiSvus6FsubAEZ/9UUIO5RxPNDEn4fNLLjNkn1UeasRvVPjqV5L
         gAMg==
X-Forwarded-Encrypted: i=1; AJvYcCVQnZLDBQ0RCgJqnEvS4/cDrOS6a2iKrCi/u52uD/0VjSoqK/zACNIqGXn8HcowEvU3b4zfqcK+c2km6dY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw78z1pTS9vOehYgvZWrBW735FgMZRzXVtAiII968YndlBIscPL
	ZZcOVRUPoWa0NDNp1wADUl4ZIjLEcUxGOvRmhpl6hp0qoccGANQIvs0PF2NFBLkOFnCptjFGsF9
	qB+UeCQla2g5VxXgKpieN1YdPgbZkoLWcYS9FFJev2p2NYMsgDvLrTtTy5aJ9O3jritU=
X-Gm-Gg: ASbGnctV81w0bcj5c2RPsZTalyjmrkajxUP88qKi9q3d+r+YvyDtqPnC//RtfCdKyLB
	u9+DhhzSNRUg4obmVEhDJPIC9Ul95rGb+9soiIFb22hTJ4rye6gEhDp+KWwg5DWodggAswVaiXg
	ph+KFmNY9xULgF6ybl53MsNIA9jlmmBRT8UrII4z01WhYmBLnEuLr7qgBOkiNDxV+9iBQAkx0EZ
	6bHVbGEX7A/ZO2yfdkkcUtrUD1Xdg7p4Rt/AlGxA3YiqCncnse1TNlEpYLPEGb8PzkDXApS3kyc
	irsdCvLaye1X87+84O19G+cYkavV9zLa
X-Received: by 2002:a17:903:2bcc:b0:235:f3e6:467f with SMTP id d9443c01a7336-23823f97264mr79546475ad.2.1750877937681;
        Wed, 25 Jun 2025 11:58:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF4LBvG/d/JiDQ3oTmnTEUEQGkYF7zUCx1h2gczvffJ7ySJIZMuymwWPjvyB2PmsV21XU20/A==
X-Received: by 2002:a17:903:2bcc:b0:235:f3e6:467f with SMTP id d9443c01a7336-23823f97264mr79546105ad.2.1750877937283;
        Wed, 25 Jun 2025 11:58:57 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d839da52sm144521145ad.42.2025.06.25.11.58.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 11:58:56 -0700 (PDT)
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
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v7 23/42] drm/msm: Mark VM as unusable on GPU hangs
Date: Wed, 25 Jun 2025 11:47:16 -0700
Message-ID: <20250625184918.124608-24-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDE0MiBTYWx0ZWRfX5vc5IQ3n0bGo
 ngng3jAuM+WfeaWfKl2hlrqH8SDFqPJ72RbD1K+/hFs9fp1DH7K6PfUr6qpoX8wjgob0GnsD3AN
 cl28MlWQrHyi5h/WPs7llvA9l1ejzrwJpt1dAlqRxjPDMu0C6hdy2OlGVH5YZWDJekzHvWa16Ay
 Sr+NQRlo6iIcuSx7c4FRcu/2V++0ZCuf6Tw7JCtRloXAma4ha+bWsDYbBe7E5/31aeg3Hc1PYuD
 ZuHyq3EWNQXS0vaZzQGJiyREbEQ0NoBjtfIgv9ukVUoBP/jMxh/Ldj8CDrAavbIC6kNoO6/eHjG
 5nK+2DIQqeHpUi+8d4kaDJzonaFlj9Wathab1R2PdtGTBXDyuKMyoEAwFsiiLp6PdRYLt2K3hoI
 TbEFO1fgxTQ2rMiV0SMYl4KTSYpVKQljnrOQV5Eix7ppCjIJcqakxA1q/MaBb9v9ltjpvM5O
X-Proofpoint-ORIG-GUID: H0i0rmlJdDbomiL_CA5Fgh_AIpHXA9qR
X-Proofpoint-GUID: H0i0rmlJdDbomiL_CA5Fgh_AIpHXA9qR
X-Authority-Analysis: v=2.4 cv=LNNmQIW9 c=1 sm=1 tr=0 ts=685c46f2 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=DhdyfM8_h7Qj4WYt2N4A:9
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_06,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 mlxlogscore=999
 impostorscore=0 mlxscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506250142

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
index 068ca618376c..9562b6343e13 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -681,6 +681,9 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
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

