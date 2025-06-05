Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CED61DB546
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 18:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749148332; cv=none; b=pO2/D6Wav654cPrncWsATuNhykvo+LPaS+JwOjI9qL2EpzHyIMO7UODZeXNPgs784SpqkOFeBE5iUT0xDfaheAyA98IkP/jszOObe9idKUtZGVCCxwPZ+I/zJriwgaMfgrN4ldPk8HzzX8+8Rw3Mc7KWeT/9yKpfyJjWDTg4nu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749148332; c=relaxed/simple;
	bh=Ljxp0rbVayEqE7lmqppBFPy5GFbKDreN6wHhP8x2y+U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MOoi5Qqoxi/NSgVIdIWN/+A3eP2yKxheV0GytEuTiZpJCVsy7RbOWcpMfZ5IogMzQTR6ShHGXaL/Oeqs/MgbdUwdKI3eQw/b7BLWrwoEFyCjksiyq8/56+196K/Hwcd6v3fZjtps1onhKz62RlcrUAPTQ00Ch2cJ/eFntzzKUqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zm/ofcbn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zm/ofcbn"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 555HKXXS027678
	for <linux-kernel@vger.kernel.org>; Thu, 5 Jun 2025 18:32:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=tgiGXs8Fmtg
	Byi6+4YZ4IRUEBBgzjqr+lD/A8pUTVaQ=; b=Zm/ofcbnD1VZQDOavBBxUSU3b4o
	oRFCLbynsakKodEStLUnV11nCCPtyeTkcc5APS7EBlGjyGMQlCNokAEeD5ARkY12
	p7WTJDskcEqc6O/IhFn2e6JsW9tjbnQdFEmtBokpeTyCVjjGKP5PI9AqRP65tvyv
	ZE+GyND+rO+pj+uGD+UVK0lyNWAI2myLXv8/eD8kZclNsgrqnu3TWArZqWgcOGx2
	+jwJ9Sgb6KbXwY4hqrr5l/jWkA1mxX+tG2BK9yNJY5k8HZjK9gCzs2OUK4Hf4sgr
	a9I947nzzO3ZQvLwwJUttyUklgFCayV6aEU4tKWHX8/Ic84pbE5tTH0Gf8g==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8ta9fp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 18:32:10 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-747d143117eso1071827b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 11:32:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749148329; x=1749753129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tgiGXs8FmtgByi6+4YZ4IRUEBBgzjqr+lD/A8pUTVaQ=;
        b=CDwpakc8x1YOoRJkjSNVZXhaBxL6Q0iKBsmZTKXTUanLnzruXhxun6kC8FQquu1hKS
         lNajh49Y3AvabuAl9utYc8ZxIx6qmvpbJYBK0oyiCI19Kao9UZJCMfqZRdOKb+V2j6Nc
         nCa8GGATKLGNw8M91bW+Ooh258bHEbFea1mlRLP6bXupA7rVMxhsMFIZQwFil6uSLy5J
         u9TKxQawLiiYFSCfAwZVfKHE5o6vQPVjgZDDdOQrVdKOh0qCDyC99VeWdurqeHhubKGM
         tLqqzo2CFMC6Rj4fCIE53AYxSGGGVrlgqg9y1HX0OUMZqnxi1FLkMz2KAqUljT68cBuI
         Bi1A==
X-Forwarded-Encrypted: i=1; AJvYcCV7F/eLPPnzKUN2xTryyAL/QA9/EeRjDaskHTVU4r05uXR5k8qpHmjUGAF48lZTsAifAQO8KonlmZrzPqc=@vger.kernel.org
X-Gm-Message-State: AOJu0YweyT9Ks5+EZl+VyIyqp17bJue8jLTveHS7MI64LYGXifP5+Ew+
	pVFtEXyTe8JngaM9cBUhiZfVo3uhsMDhmV50SD+H8sEzBGaaCT18YfnblByGA6JNq9ZpEpuT9hQ
	ueCgwMSbPHTrfINxYmCKn3IZd8HiDvzlADpzg1uBnB7McRsEiD+RstLjE1XI5j52XFjI=
X-Gm-Gg: ASbGncvESfYCr9yTh2Wa3dMHRQ2DlLteTMhuzuik6QceL2EWWXfap/EOwy9T2L70aEq
	s5l0+LgFmnTUB83EYWO5zb3BOAb0G8pgOwvPUmP2pLnQthJ/gV9SWvVwQ7tgVc1Cc/0r+vx4WBl
	8GCschMLRHRwzj3Eck6qHvfrQqjYz8M4GDZ5vobtnZHldp2M+onBearpkyjh9BP2GiXuGuDgADb
	GRl9LS3JBgXdE0nx2i2SXVCt+aY8ORy6WNwCAM6sCxDB8MYjJKjAhzvks93fVhDiQWCkzNn8bZI
	eX+FrK/TtKJaVWlHzU7oUvBYs+uOAH7f
X-Received: by 2002:a05:6a20:1585:b0:21c:f5eb:ede1 with SMTP id adf61e73a8af0-21ee257726cmr346305637.24.1749148329198;
        Thu, 05 Jun 2025 11:32:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE6yEyRAo6qHQu3LjusRo5WiuixIyyerG+CXnhIKpPAvFwR7mK8AVmwqDRnbddTUCiGjf/KQA==
X-Received: by 2002:a05:6a20:1585:b0:21c:f5eb:ede1 with SMTP id adf61e73a8af0-21ee257726cmr346258637.24.1749148328731;
        Thu, 05 Jun 2025 11:32:08 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:89fa:e299:1a34:c1f5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2f5f6683a5sm4687a12.37.2025.06.05.11.32.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 11:32:08 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Connor Abbott <cwabbott0@gmail.com>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v6 01/40] drm/gem: Add ww_acquire_ctx support to drm_gem_lru_scan()
Date: Thu,  5 Jun 2025 11:28:46 -0700
Message-ID: <20250605183111.163594-2-robin.clark@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=eJQTjGp1 c=1 sm=1 tr=0 ts=6841e2aa cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=Xs8HUT0FnXyYc1zbtowA:9
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: 9zDRpIU72YODZunnOjqPsTs6loLx-b0s
X-Proofpoint-GUID: 9zDRpIU72YODZunnOjqPsTs6loLx-b0s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDE2MyBTYWx0ZWRfX9/O8vqPkzFuf
 edknhudBqT3WluBHbJK1nWBRH4kpiUT8ieNpN0xz2XdREHXzKBnugnIE8B5L1q3IOAh8ixtvbQT
 Bloqa8oRpPpJbhUow2FA+GTqAh1zAhxa+vJgseA+RtE+8VxVXoGFm4EWuJkOt4D0REdZ6vfApjV
 lp3JyLvW1KRvX0NbS49Kv8ny3oEeh8FPF/AVkz9tQ6dCfnyxWJ5sQrE+ArjFIs/gjpLhDF0QK+q
 QyfyD4QMql7kFnY+dKorCF4/pO6vuve4bkUkDdLvMkt7psb9GP4PUFgBvIr/gU0V0+D4X2QpIdm
 FcpUExWQ3hMhVtNWClZ/He2Vgeeu29aJTi2Er73Y4He0ifZZUBSYf6HEN2odg5pdtqzqkVxgu2G
 lh47gIRXIUImPHyJ/nzkbXwRj7wsOxmAlCWzCwLR6dO2MIAtIHhoTYm4+IFYg8YobHL9Oi1n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 mlxlogscore=999 impostorscore=0 spamscore=0
 phishscore=0 mlxscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506050163

From: Rob Clark <robdclark@chromium.org>

If the callback is going to have to attempt to grab more locks, it is
useful to have an ww_acquire_ctx to avoid locking order problems.

Why not use the drm_exec helper instead?  Mainly because (a) where
ww_acquire_init() is called is awkward, and (b) we don't really
need to retry after backoff, we can just move on to the next object.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/drm_gem.c              | 14 +++++++++++---
 drivers/gpu/drm/msm/msm_gem_shrinker.c | 24 +++++++++++++-----------
 include/drm/drm_gem.h                  | 10 ++++++----
 3 files changed, 30 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index c6240bab3fa5..c8f983571c70 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -1460,12 +1460,14 @@ EXPORT_SYMBOL(drm_gem_lru_move_tail);
  * @nr_to_scan: The number of pages to try to reclaim
  * @remaining: The number of pages left to reclaim, should be initialized by caller
  * @shrink: Callback to try to shrink/reclaim the object.
+ * @ticket: Optional ww_acquire_ctx context to use for locking
  */
 unsigned long
 drm_gem_lru_scan(struct drm_gem_lru *lru,
 		 unsigned int nr_to_scan,
 		 unsigned long *remaining,
-		 bool (*shrink)(struct drm_gem_object *obj))
+		 bool (*shrink)(struct drm_gem_object *obj, struct ww_acquire_ctx *ticket),
+		 struct ww_acquire_ctx *ticket)
 {
 	struct drm_gem_lru still_in_lru;
 	struct drm_gem_object *obj;
@@ -1498,17 +1500,20 @@ drm_gem_lru_scan(struct drm_gem_lru *lru,
 		 */
 		mutex_unlock(lru->lock);
 
+		if (ticket)
+			ww_acquire_init(ticket, &reservation_ww_class);
+
 		/*
 		 * Note that this still needs to be trylock, since we can
 		 * hit shrinker in response to trying to get backing pages
 		 * for this obj (ie. while it's lock is already held)
 		 */
-		if (!dma_resv_trylock(obj->resv)) {
+		if (!ww_mutex_trylock(&obj->resv->lock, ticket)) {
 			*remaining += obj->size >> PAGE_SHIFT;
 			goto tail;
 		}
 
-		if (shrink(obj)) {
+		if (shrink(obj, ticket)) {
 			freed += obj->size >> PAGE_SHIFT;
 
 			/*
@@ -1522,6 +1527,9 @@ drm_gem_lru_scan(struct drm_gem_lru *lru,
 
 		dma_resv_unlock(obj->resv);
 
+		if (ticket)
+			ww_acquire_fini(ticket);
+
 tail:
 		drm_gem_object_put(obj);
 		mutex_lock(lru->lock);
diff --git a/drivers/gpu/drm/msm/msm_gem_shrinker.c b/drivers/gpu/drm/msm/msm_gem_shrinker.c
index 07ca4ddfe4e3..de185fc34084 100644
--- a/drivers/gpu/drm/msm/msm_gem_shrinker.c
+++ b/drivers/gpu/drm/msm/msm_gem_shrinker.c
@@ -44,7 +44,7 @@ msm_gem_shrinker_count(struct shrinker *shrinker, struct shrink_control *sc)
 }
 
 static bool
-purge(struct drm_gem_object *obj)
+purge(struct drm_gem_object *obj, struct ww_acquire_ctx *ticket)
 {
 	if (!is_purgeable(to_msm_bo(obj)))
 		return false;
@@ -58,7 +58,7 @@ purge(struct drm_gem_object *obj)
 }
 
 static bool
-evict(struct drm_gem_object *obj)
+evict(struct drm_gem_object *obj, struct ww_acquire_ctx *ticket)
 {
 	if (is_unevictable(to_msm_bo(obj)))
 		return false;
@@ -79,21 +79,21 @@ wait_for_idle(struct drm_gem_object *obj)
 }
 
 static bool
-active_purge(struct drm_gem_object *obj)
+active_purge(struct drm_gem_object *obj, struct ww_acquire_ctx *ticket)
 {
 	if (!wait_for_idle(obj))
 		return false;
 
-	return purge(obj);
+	return purge(obj, ticket);
 }
 
 static bool
-active_evict(struct drm_gem_object *obj)
+active_evict(struct drm_gem_object *obj, struct ww_acquire_ctx *ticket)
 {
 	if (!wait_for_idle(obj))
 		return false;
 
-	return evict(obj);
+	return evict(obj, ticket);
 }
 
 static unsigned long
@@ -102,7 +102,7 @@ msm_gem_shrinker_scan(struct shrinker *shrinker, struct shrink_control *sc)
 	struct msm_drm_private *priv = shrinker->private_data;
 	struct {
 		struct drm_gem_lru *lru;
-		bool (*shrink)(struct drm_gem_object *obj);
+		bool (*shrink)(struct drm_gem_object *obj, struct ww_acquire_ctx *ticket);
 		bool cond;
 		unsigned long freed;
 		unsigned long remaining;
@@ -122,8 +122,9 @@ msm_gem_shrinker_scan(struct shrinker *shrinker, struct shrink_control *sc)
 			continue;
 		stages[i].freed =
 			drm_gem_lru_scan(stages[i].lru, nr,
-					&stages[i].remaining,
-					 stages[i].shrink);
+					 &stages[i].remaining,
+					 stages[i].shrink,
+					 NULL);
 		nr -= stages[i].freed;
 		freed += stages[i].freed;
 		remaining += stages[i].remaining;
@@ -164,7 +165,7 @@ msm_gem_shrinker_shrink(struct drm_device *dev, unsigned long nr_to_scan)
 static const int vmap_shrink_limit = 15;
 
 static bool
-vmap_shrink(struct drm_gem_object *obj)
+vmap_shrink(struct drm_gem_object *obj, struct ww_acquire_ctx *ticket)
 {
 	if (!is_vunmapable(to_msm_bo(obj)))
 		return false;
@@ -192,7 +193,8 @@ msm_gem_shrinker_vmap(struct notifier_block *nb, unsigned long event, void *ptr)
 		unmapped += drm_gem_lru_scan(lrus[idx],
 					     vmap_shrink_limit - unmapped,
 					     &remaining,
-					     vmap_shrink);
+					     vmap_shrink,
+					     NULL);
 	}
 
 	*(unsigned long *)ptr += unmapped;
diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
index bcd54020d6ba..b611a9482abf 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -556,10 +556,12 @@ void drm_gem_lru_init(struct drm_gem_lru *lru, struct mutex *lock);
 void drm_gem_lru_remove(struct drm_gem_object *obj);
 void drm_gem_lru_move_tail_locked(struct drm_gem_lru *lru, struct drm_gem_object *obj);
 void drm_gem_lru_move_tail(struct drm_gem_lru *lru, struct drm_gem_object *obj);
-unsigned long drm_gem_lru_scan(struct drm_gem_lru *lru,
-			       unsigned int nr_to_scan,
-			       unsigned long *remaining,
-			       bool (*shrink)(struct drm_gem_object *obj));
+unsigned long
+drm_gem_lru_scan(struct drm_gem_lru *lru,
+		 unsigned int nr_to_scan,
+		 unsigned long *remaining,
+		 bool (*shrink)(struct drm_gem_object *obj, struct ww_acquire_ctx *ticket),
+		 struct ww_acquire_ctx *ticket);
 
 int drm_gem_evict(struct drm_gem_object *obj);
 
-- 
2.49.0

