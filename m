Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F77A28980F
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 18:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749148430; cv=none; b=tj7YM+N9gZbHrVHKVOF09pZClGtqM8NjBFrLC1k3p7D3nF5rFeANSK2mMRlyl9x+8WipgLmPsq6/W9G/SsBfUoxdJQYtBkhzIth38zg+BHhC8XLPFpysu8rQqwdk+ByGhCGuQaiIN1ATN7qz5cnfo1hMaMOfQ9WO2TkBUy6OXNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749148430; c=relaxed/simple;
	bh=eFxBT0OAg7rchLVBxX/NKfn/olJKKvoe8oSOxRdtsVQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EfGBZ//NBqMBPH5jK+xPOUe5LkEN70rN8svOoK41lt33u4tBOeXESRc8I4QShwHa3Y1M3Hkzqpe7Aqw73eGaDTBd9shhB8s9YbM5yy0289+GV0ELWom7jTCvUCGsV8yB0aTiazJNj+rSNCVJ2M48mDbuKQpM6ICHfBou6aTxzis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oT7dY6ZW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oT7dY6ZW"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 555HRh9u004213
	for <linux-kernel@vger.kernel.org>; Thu, 5 Jun 2025 18:33:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=eqq9rbaAioE
	9x/Vr1cLJypF4bAqJQvBM2Xsa5cd3ZNI=; b=oT7dY6ZWx7dyYOYToij2tW+L4Oj
	09gGE9IIAf8cZNxnCLF0QUnYTrlfQnMh8kPGizzYBkugN3Zm843uF8xj+GRE2oVW
	2A/H0ly2shTaTL+Zlhy1GsF3L3CcAcQnJFHEwzOitJIV9513TwkRQZSkuMMV5/HU
	ERPcW9E+c3VVSG2WXVKvAbbc8/xdyYzioCL58CUkjmrPCwjojKGewmOY2g81Wo+M
	jdRg/on3fMHpD7FCz3yi/5F0jXLEGh1F9GUaLlj9Z9wANRDmq8uQZCKNPmbROQzz
	bpeUj9CmQCl1TvDyjkl1mDmVc7xjNJACsVF8Qy4JgsOvWjUFin1WMgb8n8Q==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8s2cdh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 18:33:48 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-740774348f6so1162256b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 11:33:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749148401; x=1749753201;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eqq9rbaAioE9x/Vr1cLJypF4bAqJQvBM2Xsa5cd3ZNI=;
        b=jyZXSu35hPRw1ny8YUHix3IeQcePG9GwsMYEIr4mV73qIH5mbJhYl3qY877NHn+dWB
         a4yaKeb6piSKUUYx2ySfbPS51tVRFnhmhyiZIhLFZQtqd13rEOG9Qz4+CnvrUGiStWRf
         5C+6NuQGuz3Pg+DReydRgFW4rusvz8lL6JjkEUcwIZchii2cj78PCAK4lHXe9u9OZOHL
         y8RVOCSEWa1u6U4BxIUCFdGb1012xCL+mzU29LwG6SaIfKusNMYYvxmo1mc5i9wTMrJ4
         s84vYEhJmCHShCevi2z7LiEC+YVDbyLEknBxTdLn1bwqgq1tfZGZCyNQpt8f5IlrmX3W
         +N/A==
X-Forwarded-Encrypted: i=1; AJvYcCUOfQXhZJWUYsQIQx1InhNX/wMFgPzyJzrG1g+XObOBLaoAQ0Hk9I5sMB/GVIdpmhlPwvtYEys/C2d9qEw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPpF330zS/JK/6e9E3nX9BTKTHjVyEqyruB2FaZKw243+SuIsN
	r+Boi4cBQtq3w5DTSxkd8sEun5lMvbcKImJL9J/UeJ7mvhHga8OP3xzh+WaEOretzb5jWu3bjlW
	Ruc1XACAjiPjx79Hqefsaz6dOpXZV1dyqg8iBBwjOPbx063DQ4Dni35wRfsIjrwOFuTY=
X-Gm-Gg: ASbGnctNMfVAt5Uhbs40r6Pek8HuZjv/XXUEGT1WR9yQd+za9q+EkhcoYBkh/Unwd2/
	DQ35S1EXJZFonivVBXRwQMXZFIpAdvr0BD1n873Mca111n7l+u6YBoEgguWtRxaPXd9cdnVgHQi
	AahJV4LxuQU2ylcQLXLGgyH7B0/Ivi+rBX6GnF88NjQyvJ+1m/Muz1Z3IuUpWidagVlnHUtWeOc
	wrdNlo4aH7cqmbCCxKF00Tvys04MuEK2fl4XY7iwIARH0IfIrEL2bqO84Ukd88JOLtcpMkmdWTa
	8pArPXgJbM5riVrUXLnVyw==
X-Received: by 2002:a05:6a21:998d:b0:1f5:8179:4f47 with SMTP id adf61e73a8af0-21ee257ac7fmr368475637.20.1749148400884;
        Thu, 05 Jun 2025 11:33:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEv2c+RdwYHEoeR38pw2sdo71gINKvZO5oyAxjTcUM0ezUYPn99pL8wCFAVNClAdFPkoX+B/A==
X-Received: by 2002:a05:6a21:998d:b0:1f5:8179:4f47 with SMTP id adf61e73a8af0-21ee257ac7fmr368441637.20.1749148400493;
        Thu, 05 Jun 2025 11:33:20 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:89fa:e299:1a34:c1f5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2f5f668354sm8116a12.42.2025.06.05.11.33.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 11:33:20 -0700 (PDT)
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
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v6 37/40] drm/msm: use trylock for debugfs
Date: Thu,  5 Jun 2025 11:29:22 -0700
Message-ID: <20250605183111.163594-38-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: 2m8qmwXEZOxGUbT2QQAR1xsJaywPcRxh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDE2NiBTYWx0ZWRfX4+c1hr24KkJy
 IwYkgbP5E+rr/wtZjVYrsns2NaFz6QJdGDwWnTfvLQFnFhRj1vhrZ3rjJOaVGmykWHUZN/3Prrh
 jc24WxQLFtQIDzW+GBL/jrpfvqLZEBxuagqrLq20/geQvN0e1VqaYv0nZt3PIqHh3gGlrf1JS2n
 WSlpue4R00jnE9Dg74r2gxqFB/491K7b5o9MRLUodpLyLWxVA1Xxx8U4w/Td5SqYH1OAoN/XfxQ
 UkNf/ufvXCt6qPEMs3swY9BA3GeJkkTyvNR9KXX1BFfyVC8Wwh04mTzdvSfdbcvtSUBCkJHe0kr
 70r50JiFdnyD/j7/jUkTbHy3AerhIURQAeVK/JaMe+nvHGzcKij2JvX+TzeHQLbDg8QPn7xDTkB
 B9RDhz+Jt7H8lSBpcddi745Lfqf5sjmKAjMeH1MXcwcL4ATaikWzu4vWl7CHU9IoEeO4sGn5
X-Authority-Analysis: v=2.4 cv=RdWQC0tv c=1 sm=1 tr=0 ts=6841e30c cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=UIWvmcERRd2or3XT2GcA:9
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: 2m8qmwXEZOxGUbT2QQAR1xsJaywPcRxh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 mlxscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 spamscore=0 mlxlogscore=999 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506050166

From: Rob Clark <robdclark@chromium.org>

This resolves a potential deadlock vs msm_gem_vm_close().  Otherwise for
_NO_SHARE buffers msm_gem_describe() could be trying to acquire the
shared vm resv, while already holding priv->obj_lock.  But _vm_close()
might drop the last reference to a GEM obj while already holding the vm
resv, and msm_gem_free_object() needs to grab priv->obj_lock, a locking
inversion.

OTOH this is only for debugfs and it isn't critical if we undercount by
skipping a locked obj.  So just use trylock() and move along if we can't
get the lock.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem.c | 3 ++-
 drivers/gpu/drm/msm/msm_gem.h | 6 ++++++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index e415e6e32a59..b882647144bb 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -946,7 +946,8 @@ void msm_gem_describe(struct drm_gem_object *obj, struct seq_file *m,
 	uint64_t off = drm_vma_node_start(&obj->vma_node);
 	const char *madv;
 
-	msm_gem_lock(obj);
+	if (!msm_gem_trylock(obj))
+		return;
 
 	stats->all.count++;
 	stats->all.size += obj->size;
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 57252b5e08d0..9671c4299cf8 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -280,6 +280,12 @@ msm_gem_lock(struct drm_gem_object *obj)
 	dma_resv_lock(obj->resv, NULL);
 }
 
+static inline bool __must_check
+msm_gem_trylock(struct drm_gem_object *obj)
+{
+	return dma_resv_trylock(obj->resv);
+}
+
 static inline int
 msm_gem_lock_interruptible(struct drm_gem_object *obj)
 {
-- 
2.49.0

