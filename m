Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47636239594
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 20:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751228215; cv=none; b=ZJZnpcP7cHnbZ1DpwDc20p9Xfrnv/+VVIPKf6AoP7BOq63HMESeiBMUUkfFlbyiway8I3XeiakzjSUkyH+wCqjXzY10zZbo24mcPEHIYmcPrC/YEDLY2h6tgKJTsa2obcF4ieb7tCH56K4n5RDByYuNEbzvMHlBEqzZ6ZDfALBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751228215; c=relaxed/simple;
	bh=Xrr+912y5vNYEYCSiqXQ5P/O+VoEFsvl61K5HGKqAeE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Om2ffM+RyTXwU4+E5z+v/l8Edlozr63rvK9iLyXXf1GEWmvOePAWWcB21ObnEO47RXYbiM07/kX7wanxEmWaJULEp1B2x9WnRvcbY+lVsUIeaMLQ39OW8R91QUico89sMkhuYqovvF3Vlpr7cC160hB6zcs6YNGps1oa/sYeL3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lEYYvRIg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lEYYvRIg"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TANmZ8030508
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 20:16:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/iFe2vNrJqp
	a0S0dcdbvotV9UbXoILAtHKmoL3TqRPw=; b=lEYYvRIgJ/c+BzHgUGEWGBUactw
	3eZJLwb+PAuIaqgaRr436pNFshpMcEnkTbOPxM17OBCArFDyCQuWtEgWNPMllkk0
	iyakN/9IpTVaPK7Qcf2nbfKs/XwlxTQj8SEUwv4Fk6TIhiPV1ZipG77FGKATDpPI
	/+u2zu4yFg/I9/JXACVNZqEwbCGhkVHrjSpsTHlTNDWEWvZIwy/uqCq2L5Xgun5h
	vUZql0vbMSKbZRDSWXJclHDsEEGUrmPE1J4YmwGE/kj1L+ZlsdqFQjX8N/bocez8
	milxFHUbUrn6kUZp4hi+eVy0ddKW4BYYVZtCjQUTHHqvp0+8CR9zaoKdCbw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j5rq2v05-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 20:16:52 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-313f8835f29so1805493a91.3
        for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 13:16:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751228211; x=1751833011;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/iFe2vNrJqpa0S0dcdbvotV9UbXoILAtHKmoL3TqRPw=;
        b=uWayh/SpVywSmI6c3Mzll/cExZqx8lNTvQO0utjah0O8EWxOIQJge3HtznMSgRGzBB
         hsHqL9RnpOU97w7XednStNR0M+grLuv+dfgV/8q1BqQUKDWwJHdK9kwR+SzJ5CQwEjZj
         sicyolmdWkUS8P+qVEnogMmXztvSRS4fwcR4L1ozuD2Wqjw0FjZlEt6J0KmDyflmcLCp
         XYql0+VQQtRcq+uLT0k6dMJmBjhNFSAWDvDkU41FCokYLeEaclc7ObMv2QiDToxuMUL9
         Hvq7bQvyF7wndCY5aT/xPz1vNooZdCpinF21QmbUkNzVjOu6ao1PXOp0rB16j3pUkZW2
         PH/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVL+R3T5uuN/2TNEJgmdxfbLt6Q8u4hD7Ohc/7X+eZqtSCQLtHuxJ92sOwiaKtq6gtY5ikZiSLKX4He4Ic=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+rnk9cDqHDPW/uqziJLWhCwqusEVCP1KsfYbNEChYlJGay9FL
	Sx96qX35mGXVWJIaQtCZEw2uFj3vYLRsYyzA2O7UnmREzNcYmcsV90YADbjmktiiAxVUTRfZrLk
	mOUdyRiFS0V5jvHgane9zZHxbjhyf6ouasL8oK6tk5ci8THhtN1ocx91+ZxRaaLpz1OE=
X-Gm-Gg: ASbGnctzzXEVnmeOft956W77Ojwx5IxC6GdLsHj5pZ4u3gIgJY15Q9kjDEGUcMnvIwQ
	yG0cShM/cId+WYbHgNaY94sjXw5VpeS3sKLT4gXTn9S2Bgmnacyq2+13MY2uo3vjag8YszvnGvp
	oHkm1+mxpuU4li7n6025DZQObLSmKnx3stxmQfzM0pf0HkaLrB9T/96uwLWdRdtNsGumiA59ZiV
	umYphC6tt9H+sUDO7xn7ijoYSYcYQpwCIBb3q2u/Wj3ba2YioyYKmQ4q+djTqlEo/fABe9sytUq
	ZmqEDIZZn/YfctKDJGuundCQ+6xvNaz6sQ==
X-Received: by 2002:a17:90b:2681:b0:312:959:dc4d with SMTP id 98e67ed59e1d1-318c8ecd239mr16401473a91.7.1751228210950;
        Sun, 29 Jun 2025 13:16:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGajrdA6tIMydlgInm0aLxoXdGIewbBhz8hKgUeWqXuQe48LacCfrSpFmOEQkovD6sQvePVjQ==
X-Received: by 2002:a17:90b:2681:b0:312:959:dc4d with SMTP id 98e67ed59e1d1-318c8ecd239mr16401441a91.7.1751228210493;
        Sun, 29 Jun 2025 13:16:50 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb3c5a8csm64859905ad.223.2025.06.29.13.16.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 13:16:50 -0700 (PDT)
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
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v9 23/42] drm/msm: Mark VM as unusable on GPU hangs
Date: Sun, 29 Jun 2025 13:13:06 -0700
Message-ID: <20250629201530.25775-24-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: u_-WcXgivKWQ0wan6rYqCZd-c_wqmTwa
X-Authority-Analysis: v=2.4 cv=eIYTjGp1 c=1 sm=1 tr=0 ts=68619f34 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=DhdyfM8_h7Qj4WYt2N4A:9
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: u_-WcXgivKWQ0wan6rYqCZd-c_wqmTwa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDE3MiBTYWx0ZWRfX32AOtHuFTA2V
 7V/yBHEh+asJvjnnItZTeQD0YPOE2KzetRx5x26PXH9RNP6/3CicEQQ7N5qkhVxVWodqcLiwllb
 6sJkpIlpe/75WtwdR2uKnBv+P7M323j32b38oUJythbl/vUpHIEgtD6aUEtq5WCV3vPZQUmWDOc
 DQkPrjDoH/HEhlS6uJQ8xu5FBT2v0FyfXYLbC93K5RqWGN64rGKk0qq2fItqJD71AqhHlP5Q2sj
 W8RMo/Vn+LQ1TcvRZl0ZmtApEU0KgvOHPZ3Y749DalVB7zB1jALSNN3O3e2SSnW90EgQSfGUbSt
 H/irUkX17guWW4YSHr4fkcWX6V8pWro0ye165dnTMiPQr48oyBOAs4wkMUIRkIsZuSfW8Q1dJa5
 OkQu93vFwqcXCxFsgijo9Hbn79Y5Bz96t9StMZZZhJwcSy+ig0dLOfuTD3qqlTtu7SEvwszC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 mlxlogscore=999 priorityscore=1501 adultscore=0
 mlxscore=0 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506290172

From: Rob Clark <robdclark@chromium.org>

If userspace has opted-in to VM_BIND, then GPU hangs and VM_BIND errors
will mark the VM as unusable.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/msm_gem.h        | 17 +++++++++++++++++
 drivers/gpu/drm/msm/msm_gem_submit.c |  3 +++
 drivers/gpu/drm/msm/msm_gpu.c        | 16 ++++++++++++++--
 3 files changed, 34 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index b5bf21f62f9d..f2631a8c62b9 100644
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
index c08c942d85a0..0846f6c5169f 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -389,8 +389,20 @@ static void recover_worker(struct kthread_work *work)
 
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
2.50.0

