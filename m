Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B926A23BD02
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 14:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751206079; cv=none; b=UBCifc89/QmwAgvoxAQO8poFro1VrgcJQY5qY54/jQ8X1hYzWhJifYkJCUShSzCXKsWGgqVVdEeZbHOPCA6shdSWVHXWVy7BthMuilqShowWJG5G2lnlQy/b/ZXF/9PXy4VoZj3XEYVHAT1HsVIo0duKUG6yEpuoPUWSvSStQT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751206079; c=relaxed/simple;
	bh=Xrr+912y5vNYEYCSiqXQ5P/O+VoEFsvl61K5HGKqAeE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gbiy2m9w2FIqokF9IZjOJ08/u843xp4HiocTJXk+W3+/5M03uFNGlHGKgwRravrfHwGa9kP6ELiqf5zG3Bj4F6qAjM/Pc2raA7SkikMM2gaGvQsjHD04++vUyRG19EyPMl9kaI2Aur/8g3hnM8fzT5CuMVM3yv9HeXnyGkbXtFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PqH0dLnO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PqH0dLnO"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TDf3sb031822
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 14:07:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/iFe2vNrJqp
	a0S0dcdbvotV9UbXoILAtHKmoL3TqRPw=; b=PqH0dLnObI0wyLWZYTsxKoc/+lU
	dhy15XQHsq1x6UU4b1RFHsjSdRAyJJBYd1jFQizvr/NjykuTPoSWZW7/5cRL6oxw
	tt3l70cJVV5bMH+C/9kWz0mNDequHZVq4xFdgZLdUuQd5mHGKouNhaHZJUfIA+6V
	bEn5xqC6LKqf9X0rWX4SrxOKPoIp2/TObItb49OB9yZyFQRxkjlDY0FOaYI8xWiw
	AYnBDqtmTTY5vpbPXi+VK+750vBJHU3EqMRj3Skw0i1Yi3EcyTIQaoB+CIPrnNcA
	K26RAd2HtcQqiEcfj6RwMAew8JGaMYGxaLBOsDuP9UTRpaKuKb2SFLXj7AA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8fxa8eq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 14:07:56 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3138c50d2a0so5692554a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 07:07:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751206075; x=1751810875;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/iFe2vNrJqpa0S0dcdbvotV9UbXoILAtHKmoL3TqRPw=;
        b=KEYPRiZkTGO2gNAIV59fwsrXOrsKgPx2gKcTrJnfDyotdu3kdn7Q0SwZOnaHS9AYHd
         pbmkY3sUpjesNgqyhOjxDDV9cIpBFmd7FveGq5HG5r0//ae2XjME+D+ddWG/ITjVlGbp
         uXswn2MvU7AxdS8S5T+j0MhzhliHf2zDY8ydoDnDG29sAE5k+7zjXxjDh4D1ArKgNEwY
         Z7E+bG0208AshJob4vL8a/pJwOADyjongt7ViiQNQWrGyNCB3aM3u/TUqAfXOQdtyIZM
         PIHtOp8cytgTeHdBxU/nNpok0oLJmGu51Hq++yw+UCuez1qbvP7ylKZe8bulAYd42ZvB
         irrw==
X-Forwarded-Encrypted: i=1; AJvYcCUKdHH6KWWiD896sn4+Z7TFr7FQCmLUWH/8iYb/DbpZXQhtwXtmCCoDa9ldUWr2+/rpy+LbaDcXUZx3+Mg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5iCwr5WxsW74umihElGljOQecpu34ad+OGfiZI+xSpzkAQFjm
	L31oi0LRbUhj0Zs3Kakjmf1GRi8tvGRDIU9aOdUZDcqYZZjsmYEmeUEk1+OOa84lXOzG5E6y6s3
	FC+KO3VF16BYlO7gfBrLFMIMeMRuTG3mrfeC9x63oEef9Ogz0zD7R+JFF0Tq1Q+UI2Hc=
X-Gm-Gg: ASbGncsTMdx2D7MdIuuiqQAhbLptBjtilNbKqgpyzPnTyCPNd+CAAK2EIMGojtefllh
	XkkwIc8pGYSiffkc9gmKEa00+rquaA3ICDWoO2EJo3r7zUSoeTeGgzQDtTewxTRzzqMTmU+Rt41
	dQKWetlVanswHH2B3gZve2ZUYk3xkXKIN99vaaVmMNpaUO8hpJLRVF0Qze3/MfCYGDURtHEL4k+
	CX6kDFwVqSP2z6J8VromS/yeDvLWaBgkRecbT5su8EpqnzFMLgdGuCEl2k7IGTlDeQCQU/jWClU
	XCWU2WLIcAnVx4kj1HK4DMU9WR4Vcc7c
X-Received: by 2002:a17:90b:5347:b0:311:ba2e:bdc9 with SMTP id 98e67ed59e1d1-318c930f9c3mr14565157a91.27.1751206074981;
        Sun, 29 Jun 2025 07:07:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFPDMdsJ611F8y8JvrQrlcinGlj6zhivPonGdvEr/gwskrbg5lpJzq8J57v2DwyMT0wLTqjCw==
X-Received: by 2002:a17:90b:5347:b0:311:ba2e:bdc9 with SMTP id 98e67ed59e1d1-318c930f9c3mr14565116a91.27.1751206074478;
        Sun, 29 Jun 2025 07:07:54 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-318c14e224csm6959025a91.32.2025.06.29.07.07.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 07:07:54 -0700 (PDT)
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
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v8 23/42] drm/msm: Mark VM as unusable on GPU hangs
Date: Sun, 29 Jun 2025 07:03:26 -0700
Message-ID: <20250629140537.30850-24-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDExOSBTYWx0ZWRfX/pkrJGIK6pmQ
 +InamZnWjC5/as7BLEAg9rKifra+OIFcy5zwM50hAb/UPzoi4v6KI0O/FE1f5Ub5XCUZNvrBIBf
 ef/Jvl61Hs8Qc5jkIqCr5E2iy3NTygv+bozwEztFeezHNYe5ZoYZEp9GdNryP3XOvBnPKNWd5kA
 UDN/3QIdpbpEYOMPP5ntlxX49YA8EJtZfFoJmwrkm7vNLY31RQxffIESp7BBZnJpxRXYRnznw7b
 yoNCB48Q5oeYIqTI4c6Qd5zuBa/pHWYhXWeqwovL4ytpmSdDcJxIjyRLEtCE/tLoaPstl2XuySF
 aMn+UNQjWSYoFCBy2V3fIwM95Eyjj31zxq2eZg/rDSy0G/8Gdu67IOf68Ly+zDqMhUlh5ZO4Emd
 XBfssn38ikn/D51Wyx6MdS6TpkegwxWA7B2dwelJIDX3uSeDjfkeWFHzlxfB1afJ5iLB5Gz7
X-Proofpoint-GUID: KwCUMce_6tP-XmFgj1gV7rTu4a27J-Tt
X-Proofpoint-ORIG-GUID: KwCUMce_6tP-XmFgj1gV7rTu4a27J-Tt
X-Authority-Analysis: v=2.4 cv=TqPmhCXh c=1 sm=1 tr=0 ts=686148bc cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=DhdyfM8_h7Qj4WYt2N4A:9
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 mlxlogscore=999 suspectscore=0 adultscore=0
 phishscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506290119

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

