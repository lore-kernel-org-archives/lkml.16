Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C0142DAFD5
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 18:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750877892; cv=none; b=O8Fx0v29pltzD5LvcMud1ds/alaHB7DWdRq3ZjlykQURgmfaJP5SnmsOUodQjQP4Rua2F6klrM8xOcYzZdcx/XR//ZgxrNafr453a8tFoPhutXf9v+cLHGg/N14jcm8NqfuZ3t7R9bjggy/z7ip5hXhkwMT3WElBccXeW8pA0Og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750877892; c=relaxed/simple;
	bh=Ljxp0rbVayEqE7lmqppBFPy5GFbKDreN6wHhP8x2y+U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q3QBkXUcxN8b1MjOXIiDQFN8PuOsLk+9GfmO9Kjjm2ryBLTD2iOG078Tb8JfLLxSs5vUEoy31j1Y6IWvZVJy1zhpUZhSMylfCbnOsq0sceSONRigqNUrROcoZmfQPhnIpA15nQpJf/3vhHpnyVs2edLMqQ/1GTEEeJ50g2ItvrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m1xIFZN/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m1xIFZN/"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PC0mU4012128
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 18:58:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=tgiGXs8Fmtg
	Byi6+4YZ4IRUEBBgzjqr+lD/A8pUTVaQ=; b=m1xIFZN/XPZlm+iaGw7r9PJl9/w
	ikyVhbyS7hQG2+ZTNZVDWatCJHNvXo0W47YK5eAwYnuzH9y1t96zaoz/5yZmNSBh
	xCKFiqoXXV94z97FTt38bXaCEghE4N+KhyDRp9B9RU6ISBoAMzYMyTn28kx7mI6u
	11tY5EGq1x8vSHJSKgvWV8Lhlz9C8OmwfdpH5IdblaQVncqQ+GYohjVUVWzk3Grj
	YH//EsTbXLZWiX3/W4z4O0wogalOdz1AEPCHObBXaxxAVVH3g7cx4AZO1zNLszpP
	+APmQRBXXUkw1P7sbgC6YO8MNI2E0jrXm6gylfc9qwNgI4/HpRMzTQQjEvQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbm1ygwc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 18:58:08 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-74858256d38so190617b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 11:58:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750877887; x=1751482687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tgiGXs8FmtgByi6+4YZ4IRUEBBgzjqr+lD/A8pUTVaQ=;
        b=UmmdGeJkS7XAxzXzWo2RRxlmPw3pA2kNhTPCZgA86BKxBf11OU047oQoMcO0LMdq2t
         viQUqxQwgxqOOykbd91EQC3edFfCzluCbs7iUn10X027IFIjDtEG6YrKvHE0UucwcQpB
         vNMkQtbWXGmu5kD8EntICPND6GBo3VhnJrUEjXfxiBjVmqH8JS5DQB6sk/HhJIM7Gc+3
         1wtz6hepieDNDkRuOtUbkitazO5wrsX7H5whhD6nfkF1C6p77LuCj6elaYkawjvNM/Pn
         5vZAZOjjyN2il4TMmzItERJ1AFlbuRFI+Z4GMSCGiI0et+vylIwzvdfng71zdruD67Fr
         NYKA==
X-Forwarded-Encrypted: i=1; AJvYcCW4ovmch5XLZ4AnCMlGy84+cU+MVAMfZ8Kl8xpzW4oVIijwu1M+4U3Gu7h2evDC04G/cB61HcIX6OCg0IU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3sH9cpT/r4ZvtJLjXj0ffELreKAAUl8L4kVVoCwf1JCnqoZUE
	5/tIzzOjLx6IwPO0bx45kz31u/jfsc/RAUL+KEOKY1C8QaQFveIzOva2nCqttceCk6fBymXcxXY
	sYlN++Nd0C6cIoITrlB/+MstllPFfV46g3QPJ7Pmjm1SLS0zY5QnnSVLGg2p1HSrMAtk=
X-Gm-Gg: ASbGnct8Poo1rdCdMUJL5fvhoI/2KltQFdxbm1yMrzJoOj98w10Xfz8srSxhusEbNt4
	KPb1MBhoMQytuX4Ink9y7kTQW6SXyh+R5NEGVugQKnVgqCjAv6PmhuIwmyRRmA8aaxsWmkr2DsF
	6zkoBCaGVKBgOapJu+XWFo1pRuefpv27+1TW1Qlj5TIWiWThuq9Vhei+71rj0XgvqvI/8Plnrux
	4vfbKIb7xUKhA+KsyL1XgB4JT1lrhpysVtGA1/uJxypkXjNJPzAqqMqDmvy0QUrjO20M1zqPJGX
	se03tJH7oCx70nx5fNDyEUQZNeWIY8An
X-Received: by 2002:a05:6a00:170b:b0:748:f74f:6d27 with SMTP id d2e1a72fcca58-74ad45e0092mr7791440b3a.24.1750877887493;
        Wed, 25 Jun 2025 11:58:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEm76XpuTL7FOXiSfs4KzHoT2lFbrVJTkuBjdWPhsQOr/STJn7zr7eRcDMBwEs+eD8vlSAGow==
X-Received: by 2002:a05:6a00:170b:b0:748:f74f:6d27 with SMTP id d2e1a72fcca58-74ad45e0092mr7791398b3a.24.1750877887038;
        Wed, 25 Jun 2025 11:58:07 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-749c8872629sm5028467b3a.164.2025.06.25.11.58.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 11:58:06 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Connor Abbott <cwabbott0@gmail.com>,
        Antonino Maniscalco <antomani103@gmail.com>,
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
Subject: [PATCH v7 03/42] drm/gem: Add ww_acquire_ctx support to drm_gem_lru_scan()
Date: Wed, 25 Jun 2025 11:46:56 -0700
Message-ID: <20250625184918.124608-4-robin.clark@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=YYu95xRf c=1 sm=1 tr=0 ts=685c46c0 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=Xs8HUT0FnXyYc1zbtowA:9
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: 7FZR-AwVwjrnD26A7I7WVYt-GaAcebfz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDE0MiBTYWx0ZWRfX4qdFXh1F/vit
 fX+PMse28fpb2txfe7AZpS9GM4eU1SwXQRgmfPGT1ciwy3tt/vpmVnMOQuZZgz8qCAYoR1Y+ewZ
 1n3DQy6LGx9M4NJLH0U16aCCkPT/TJQXaGCAoIXsCma+PeuwRUVXat64bp4G8FID/7H07/MI6S7
 yd5AKbx5b4yPA+m1vQZFlEE9DHId6anAUEZeT2WORDbFeUb7Ocpq91UIIBD1x+naqkoVpCM7hiX
 E1jL2gEp6h/MX7ZixRVlJxe8ELv+B39Jcn5CBZwnsoUoe0s59p6qinrBpcUJXqfruqPmUPFnXHc
 4c9AxZBOenUrMFxSEXR5S+XB7OKC6GJKehtbnRCu+JfToq+H9gxrTgFqlQtClf6meaDJJ3IGz7O
 8yg6ly5drbs4xCA2h65PaHKJBXJZbUGVPdD7PfInS/wqO0X2jkwOBSVFl4NmI8lywS4Ku+62
X-Proofpoint-ORIG-GUID: 7FZR-AwVwjrnD26A7I7WVYt-GaAcebfz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_06,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 mlxlogscore=999
 clxscore=1015 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506250142

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

