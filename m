Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A2B22652E
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 14:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751206030; cv=none; b=tx0tyLCFH9cryra/WndAoH9ohHoJhlSMhXyMZ9IXtTbfeh0OXwi3l9kA0/s8Wgoawb6HjiPkYaT2qdB19eowNNQK/eBA3Zk7eD+aU+m5dgPRPdOOxSMpTayu+b7wcNoOdNSvZW8WQlXSbsmIWz/SfIluNknBQGPtvzIXnEq3jUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751206030; c=relaxed/simple;
	bh=IKliov0J2pa5trVjg7A0Pz5LzH/hN/LQHJAojZPCWiI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uGZuBuqAflTLZTALZ/cZcULuEuGgukfDM5oRI6XOsUGvn/a3cJv0KZsMMfiRDEjrvcYr7dbN5cXG6IdnMZLAbx/mH6lsCfdWHL+HA4xPTE7dLJiblGHkDU7SrxkwXo1DUPnNG5mD3lDEXML8HO8N9JZ8LTn7Lz+3VDHbLOXAML0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NaEk47AB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NaEk47AB"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55T4U2AJ004168
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 14:07:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Eq5kxLTTzjq
	j4KYoKYMeeMDOnDpMwOj1SboVzjrNiGw=; b=NaEk47ABuRzh6W5uqQPjv9TLdxf
	1PWwpI+Y+sqgKLCgOLoTOydS2tRKxmDgP804/pnd5VpgFzDKLHA3cy6BlXYPIQBv
	BsuXKWtP80gY6HkSxV+ze+Q58fD4ndag/1O4NK1894Kla8jD6GKZGUS+BGmfYBzd
	S1GCuS1Ps8LNGfHPEDWf/ysDhCcFZMK+FZebQUmlSso7DPNw7SYq3xkw7nDDrJs0
	bUyuupBqg3yC/C5OPfaahQY3YkVtb9bGQyy7+qrCiYTSJHIGONXRp/gG/gTNTzlt
	dlne/8NTDRTazDYqEnsppUpO+m9b9pcDxfTcGXeF1FKC6OCi2P77UPyZcxg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8fxa8b7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 14:07:07 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-747dd44048cso4186090b3a.3
        for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 07:07:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751206026; x=1751810826;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Eq5kxLTTzjqj4KYoKYMeeMDOnDpMwOj1SboVzjrNiGw=;
        b=Zv7Ud6biRKIMakpOkiKU/UbKAe2yB8rGR65tWNdrSuOkQk086rJ5xLMhReVGZXUHqb
         Auw9ZL4YAaNsOCy4IALKomLOFfk5tf8Hvbq5L8uo8NTHkFK0SBXRSnjctlukUHaiVo0j
         Fj5qRZpgALI65HSHo5IDqzn/WB4G2gmFtPvtZA71nE7Fe/W5W5J9GrhZvIF2RPZpgiGj
         OWGqrmvDur1w8QlERakACb/IFwUwmRegHjMhIObYAtZXBoRMRDjExcztgFOMCUv7nHeQ
         NU0sen/DVQX/YnmouIBL3wnjadT1bJu3DQbwRUQsQ5QZXBcPgWAaMIpSEFpQL5GcgsHX
         dPrg==
X-Forwarded-Encrypted: i=1; AJvYcCVyF2nIkyWZ/aqWOZT9qhKuon5zUQxi+IpWF+OF40jeeYzup/AONTsRuhHzY9QceJJZasA31uat7kCra14=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQVNlix3aqcftzyjKhEXTcEAHXlsl9MXfCmk41l9LP7+bU7ckY
	jgrKMUarkXD75tMZXbZxTIocdMhca8w0zPKwpm6SUGI6CrfcDOgF1eo3aLuqZUBVq7jZ8xAHuvS
	h7B5SRd7Dk5QzdekfUNlXVpLlh8d3UYWbpP5ez6w20451w+JCY6+WUlchOY1SVzxOpKrXtfhh3W
	4=
X-Gm-Gg: ASbGncsCaxDnE61sbp0W2RHkq3Fj7QG4S6Z21x0+heb8TqFE9+dsZW46oEkEKvlyg6u
	dNOyHkvLpRadZe+lX7OEm6e/HpIB5OlRA+5LCbMvBkuyA+L0sMGQxOJOmdZnjsSDHhMdbeXKNef
	IhKKv5vp/OfKG/ruab0eCFG9IKrT9pHP+it4p0o6xNA0qijaRm4BvB0/mHaaLCUTmDVFHqXZo/g
	KyXY1UbxMSFAgyEbtgUAQzeKWDSvbXyhMtS2RUQvR3SqvgDGoe+nhDvNnmAAqfkRhqRqxS7aD8Q
	8MIx79DBxLB34kjHaAim1RTlIEZAVPlC
X-Received: by 2002:a05:6a00:190b:b0:746:27fc:fea9 with SMTP id d2e1a72fcca58-74af6f081bemr13138734b3a.11.1751206026233;
        Sun, 29 Jun 2025 07:07:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IESIXYyPL2Cjmw2iox/a/szKCrDIPjBJFXEGszT8sAnkZ3Ckn55G7xC/dDATm2HWxiGpLH3gg==
X-Received: by 2002:a05:6a00:190b:b0:746:27fc:fea9 with SMTP id d2e1a72fcca58-74af6f081bemr13138702b3a.11.1751206025796;
        Sun, 29 Jun 2025 07:07:05 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b34e31da944sm5863172a12.60.2025.06.29.07.07.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 07:07:05 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Connor Abbott <cwabbott0@gmail.com>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Danilo Krummrich <dakr@redhat.com>, Rob Clark <robdclark@chromium.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v8 05/42] drm/msm: Improve msm_context comments
Date: Sun, 29 Jun 2025 07:03:08 -0700
Message-ID: <20250629140537.30850-6-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDExOSBTYWx0ZWRfX5EQTq5uZygOE
 TCPI8Q+r7+8jkbhYd7zx4wPKwKgAIF5oTw52y8pt8/BXmCVWS57NXIJ0KVY0IuxwkQnXYV+233+
 T3mvayLNj8+qQMmzFJRJDF1CJJCxyYVhZWVw2U73iNh1aBuvqqWIv02Nlqm2Xts3K7UrdnFnORb
 LSN2A6aKWBO7FZ5m+ubPeM7K5bmmZgBxRydHEnE4Owv+X6b2oXk1fBQxSaxPsFBdmaQbO1pYvXl
 qZXWQPT88PXtVhfT328kRT3kZCVy/NHjZ3uWg2+bjG/CL78Vsqf+KxXjoTyWcR/YkcEOY4V+okb
 cO8owtCsNJGlFptbCbSknlvQb32n0fvO/3VwcEfGFvuVY40Qi+gi8a4Gt8cUAcjvK3fjuX/FIki
 5aAUxL3856o6CRApcGQho5nVvqaI+8jZgQbjTZEvWp3D5XimhUxYXDBSW1VOxn+5VtGEjJyu
X-Proofpoint-GUID: Bso01uWaXME-gXqgYcKEA7rWryF7BvxY
X-Proofpoint-ORIG-GUID: Bso01uWaXME-gXqgYcKEA7rWryF7BvxY
X-Authority-Analysis: v=2.4 cv=TqPmhCXh c=1 sm=1 tr=0 ts=6861488b cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=WI1w4SIrP7wptn5q9fwA:9
 a=zc0IvFSfCIW2DFIPzwfm:22
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

Just some tidying up.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/msm_gpu.h | 44 +++++++++++++++++++++++------------
 1 file changed, 29 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 937b7cdddadd..d30a1eedfda6 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -342,25 +342,39 @@ struct msm_gpu_perfcntr {
 
 /**
  * struct msm_context - per-drm_file context
- *
- * @queuelock:    synchronizes access to submitqueues list
- * @submitqueues: list of &msm_gpu_submitqueue created by userspace
- * @queueid:      counter incremented each time a submitqueue is created,
- *                used to assign &msm_gpu_submitqueue.id
- * @aspace:       the per-process GPU address-space
- * @ref:          reference count
- * @seqno:        unique per process seqno
  */
 struct msm_context {
+	/** @queuelock: synchronizes access to submitqueues list */
 	rwlock_t queuelock;
+
+	/** @submitqueues: list of &msm_gpu_submitqueue created by userspace */
 	struct list_head submitqueues;
+
+	/**
+	 * @queueid:
+	 *
+	 * Counter incremented each time a submitqueue is created, used to
+	 * assign &msm_gpu_submitqueue.id
+	 */
 	int queueid;
+
+	/** @aspace: the per-process GPU address-space */
 	struct msm_gem_address_space *aspace;
+
+	/** @kref: the reference count */
 	struct kref ref;
+
+	/**
+	 * @seqno:
+	 *
+	 * A unique per-process sequence number.  Used to detect context
+	 * switches, without relying on keeping a, potentially dangling,
+	 * pointer to the previous context.
+	 */
 	int seqno;
 
 	/**
-	 * sysprof:
+	 * @sysprof:
 	 *
 	 * The value of MSM_PARAM_SYSPROF set by userspace.  This is
 	 * intended to be used by system profiling tools like Mesa's
@@ -378,21 +392,21 @@ struct msm_context {
 	int sysprof;
 
 	/**
-	 * comm: Overridden task comm, see MSM_PARAM_COMM
+	 * @comm: Overridden task comm, see MSM_PARAM_COMM
 	 *
 	 * Accessed under msm_gpu::lock
 	 */
 	char *comm;
 
 	/**
-	 * cmdline: Overridden task cmdline, see MSM_PARAM_CMDLINE
+	 * @cmdline: Overridden task cmdline, see MSM_PARAM_CMDLINE
 	 *
 	 * Accessed under msm_gpu::lock
 	 */
 	char *cmdline;
 
 	/**
-	 * elapsed:
+	 * @elapsed:
 	 *
 	 * The total (cumulative) elapsed time GPU was busy with rendering
 	 * from this context in ns.
@@ -400,7 +414,7 @@ struct msm_context {
 	uint64_t elapsed_ns;
 
 	/**
-	 * cycles:
+	 * @cycles:
 	 *
 	 * The total (cumulative) GPU cycles elapsed attributed to this
 	 * context.
@@ -408,7 +422,7 @@ struct msm_context {
 	uint64_t cycles;
 
 	/**
-	 * entities:
+	 * @entities:
 	 *
 	 * Table of per-priority-level sched entities used by submitqueues
 	 * associated with this &drm_file.  Because some userspace apps
@@ -421,7 +435,7 @@ struct msm_context {
 	struct drm_sched_entity *entities[NR_SCHED_PRIORITIES * MSM_GPU_MAX_RINGS];
 
 	/**
-	 * ctx_mem:
+	 * @ctx_mem:
 	 *
 	 * Total amount of memory of GEM buffers with handles attached for
 	 * this context.
-- 
2.50.0

