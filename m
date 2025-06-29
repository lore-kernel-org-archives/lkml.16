Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B1323BF9E
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 20:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751228156; cv=none; b=h287bBWHtx4xqn0BgzUb/iishDOBQemjp6ObafQqbq+J0pmTWlCQFDk8HqLrj/QiqDjmrgRg6JU+hTY6I8knU02wgCkW1THXIEjjS4mseRqQ87Hk7evn2mLj6HgUGi4wqfmUhm1Y85CVHO5yVwCDvOCtToiEDtyKZ9yzDJBkX7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751228156; c=relaxed/simple;
	bh=XRVvkiZdyuUD3BzpHrxk2CyWGEjPti1XCiRHl00bWx4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XHI87UIFu7ZMdVgCwNE0B05RTQVbcKNQ3UlOEWBxaZ38DGEEYWpLzixl74/FWzfJTlGz0X4oeJFpNwOSotzInL2MwHKRWIsV7kquh+Vm9aUiszxewPiWFxsUtiFSBv/1BqF5eZP3a0IKClRNVe7SSbtqHb0UfmhEtRGUJmTbDhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LPnQNg1X; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LPnQNg1X"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TFhGQx017759
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 20:15:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=UaLuKm/3fKy
	TMFvsdO3Mo5+i/aFeJ7ZuYdAPUo3GE+o=; b=LPnQNg1XSAYcbSetYNHooRrnO8W
	qZbNVhN4xoK+0FMTyGYBD1L4TffW6GYQrCiC2rAPFUbN5ZPYWoz6iQPQxWelTPhF
	krkQxrM53++qvwas99wSVUukqHh1CWHHGu9f16yaolRChhe5yfEPOdwhsm0pjoKl
	rIYOfdoiBq4gOKg4AHam67BPFLjcSps3bFJpKgrMCGRdug1wgQazJs3N08LqYySx
	KJZm+sstuoEpS0NH5Fp7Yr+6FalWX6lSm7F1b2+gvXErrZ8xeiSFkf18+EjM7C8U
	8yZSK8Sy8LC5INYakJySvOZRN4UOvZ5rvGB09vRi4luvooNkIrsM7qyN+uQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8m62m8y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 20:15:52 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-234b133b428so25519135ad.3
        for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 13:15:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751228151; x=1751832951;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UaLuKm/3fKyTMFvsdO3Mo5+i/aFeJ7ZuYdAPUo3GE+o=;
        b=Lsx4AuTTavpOUWSeWOaPlppkP16SR+wpiexo56R1FI9YUz8Ht3hiDv3aQM8XqWbVUn
         4eTGYjfqGigMJzVgJmUlukuF1MgkXkBzgcXoVlR1AJbfZTBMdIEW/DSe+U+60YuqoR+J
         7/PeOXrr4XlUXVOeLSHNSsM5jqhzJ3Y7rvJK4PaXrLWTDdDnld7W9jeN4w3LcNzESBhj
         H8JC/dx+7HqZmFecFSvlGZI9LlrrA++TqeLsylAG59QPnFw9+pntIGT/Md50YhyhCSvc
         dcPXnz8U1c6iC2q7MqG2bXwIHaYC1MOkBl/WEMYCyB7YyB8NksEJUQKMEE1TNcHksfJt
         cmeA==
X-Forwarded-Encrypted: i=1; AJvYcCWg1XlC5AXFeo2R8KUet/GSlfcQC+/lXBupvm2MHb89jPLwxS4fTgM/yMtVaZhCF/8kbdqvj6iv0YSS/Rg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5Qkj+WD5A5TP0+2OTVwGwfqUnFwq9cWzODWR+u0OoT7IRWW8k
	DmKlL8/o0AIAQe5l/f30w7Xbzwt5cbSu5dVOrXgattydrBy7XQMfJFpRUt6R2ft8JD+RwVdV1nT
	wcc+AhcQYsRCL09LXWMsTOo68U2MtshxZPKCT9g9MfCh36M1HxWlAhNQqNOIMc5kjbG0=
X-Gm-Gg: ASbGncsYjk26cYzK6QmuJkjLxieukUqQXO2K3HdhhruxruJBBu6eAclh6QcB/AUFpqh
	+uKCx7Ij/TK7iGdVKXnZAkiM3OtyGtzCO2JlNZoZYm+HBCA7u2Ib1KI1sLA8vSLWvwzfJ/GrqGY
	OXPfvCept+ZBrzhP2c4chvIzRHrq2lSX0RFd01mtcCLNGhFfCqX2AM/wGi5dJqwcK1cxGu+gj3e
	tcBQ4OqkRSBKyrCwskoZVbtwFoHFcrDC4g4u4DwxPIvxNeAQKwXqRohS5OS/HZcPSlDH+iV9aG3
	bWYFjCgVUlRzXHsHayDPVdfF+BuILo3WMA==
X-Received: by 2002:a17:903:244c:b0:224:910:23f6 with SMTP id d9443c01a7336-23ac463e8d8mr166592345ad.45.1751228151503;
        Sun, 29 Jun 2025 13:15:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHF91VIBntcqp9WNNfCaG+mV6yoeu+EQxzldo5DrH4AVc4zimszgPr9aZqGuN+EaweEGWuwtA==
X-Received: by 2002:a17:903:244c:b0:224:910:23f6 with SMTP id d9443c01a7336-23ac463e8d8mr166592025ad.45.1751228151042;
        Sun, 29 Jun 2025 13:15:51 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b34e3026c5fsm5959735a12.28.2025.06.29.13.15.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 13:15:50 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Connor Abbott <cwabbott0@gmail.com>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Danilo Krummrich <dakr@redhat.com>, Rob Clark <robdclark@chromium.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v9 03/42] drm/gem: Add ww_acquire_ctx support to drm_gem_lru_scan()
Date: Sun, 29 Jun 2025 13:12:46 -0700
Message-ID: <20250629201530.25775-4-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDE3MiBTYWx0ZWRfXyxUmATl1oh/P
 MpCCYjdszImgqww8kJxbGd6mRN01C4oDHJTr9n21mA0MaJcGpMBTWMKruojay8M35GKd4snhoqk
 atx7Qb5SiOJjPhW2Qc/xvXLBvPomkHTLqgBzvOYOFNe1YtvS4JMtd6L4NDqmII254nu4ugUgANj
 4iDygX+BqMZVaJbayUgO1UhDm/gj31WkH9r8qa34HrollB2B6Lojo0IUTu3rRDGMtUMPDnzZNCW
 a+D7mGFd3X2L3KwCJKqSZLOWF+07DRB2zzBC0Y05Z6R8OFw97V95PKRmFjKj0MKzNg/xwu4IAuT
 c9O1nm/6jqtkGrWaoi5CpHc4HMGRMieXBRdTlAoZ4DOrbveKjB7nTOmAj/hrPwjyhorKhONgnGr
 rdKm7I+RUB9JzzO5J9QWX5wCkucHieSJOBCj1kHGw6eLqIlqfwqZ9Cz+ZXwLaYQHAVujF+nL
X-Authority-Analysis: v=2.4 cv=Fq0F/3rq c=1 sm=1 tr=0 ts=68619ef8 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=Xs8HUT0FnXyYc1zbtowA:9
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: d4gXhFk8Rgfp3DaEUXYUAU-ECsvtmeg_
X-Proofpoint-ORIG-GUID: d4gXhFk8Rgfp3DaEUXYUAU-ECsvtmeg_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0 suspectscore=0 adultscore=0 clxscore=1015
 mlxlogscore=999 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506290172

From: Rob Clark <robdclark@chromium.org>

If the callback is going to have to attempt to grab more locks, it is
useful to have an ww_acquire_ctx to avoid locking order problems.

Why not use the drm_exec helper instead?  Mainly because (a) where
ww_acquire_init() is called is awkward, and (b) we don't really
need to retry after backoff, we can just move on to the next object.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/drm_gem.c              | 14 +++++++++++---
 drivers/gpu/drm/msm/msm_gem_shrinker.c | 24 +++++++++++++-----------
 include/drm/drm_gem.h                  | 10 ++++++----
 3 files changed, 30 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index 1e659d2660f7..95158cd7145e 100644
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
index a3133a08267c..02b5e9402e32 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -559,10 +559,12 @@ void drm_gem_lru_init(struct drm_gem_lru *lru, struct mutex *lock);
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
 
 int drm_gem_evict_locked(struct drm_gem_object *obj);
 
-- 
2.50.0

