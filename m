Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D5F6283FF6
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 18:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749148385; cv=none; b=VJvK6CBe6WuiADLGUbumMo/PesdeqONsPkRgYmy2VmP5moo88AbTxtBc9A0bUG38b3cD4i68u67FFE876U9eYRLFUpIidQcRE6zamcxWgB0avf5aCpgcCcXtO4FVEAE/Bea/uAPfpzLeGCFc4IhwI+PhrENY9N44y9LAYnKwWo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749148385; c=relaxed/simple;
	bh=hd+SGUOq+Yjn92HqZGWhDKi1nbHdVQyx7YshAq31C8I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RvwAniL9OVbr2IVSvTkHs5r6CeWjr4mie1LQuuNJfEw9JtcIc6Fg30wTcMhmwI9myt5NxJd2kfLI/ZnmSIvqjuZx26v42muyr8WDRkZpkcIRSxFH0Wmtb3A6IZATDdU6iXzObwnPPvNLqQ5qJQEGk0x72Mq85yS9jf7r/OchDsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EG+GBmbC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EG+GBmbC"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 555HbtTp005392
	for <linux-kernel@vger.kernel.org>; Thu, 5 Jun 2025 18:33:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=nqziWkTpKn7
	+Zo16n4ZbnSlGZfnmg6jhLx65Rn+Pn3w=; b=EG+GBmbCNcEOpSWi45XyesNxaYZ
	dQbxM+yhtbmtR0ULneuEC9Oj++r1LltWpg22pMAdrNpcBi8KZ44q43OPCHbefStO
	oKtocQFqJHw7XMMpsTXrXFIWOvlzKV37Jpr3O7jIrbmYantwirkqkPF3RVAQcpqv
	Aq1vIADXSy5ydJ68+9a/tJyR/DjJ8O2cwExr5MJ6yI7RXZTtcU4bSuf5n7sZ/i+Y
	jpVWnIk5TLNRXy4/rGLMqWKnVqSq4lb8OdEDdS0T0LaCCTkkeQ3FXKC6NWTXSOtx
	ejobqcFLdBfj7NAyTYTcs7ylwcpPtygHVLYLR/iVyUgcSJJNqK2GOmVMxIw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4737me1ruj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 18:33:01 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-23507382e64so11940205ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 11:33:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749148380; x=1749753180;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nqziWkTpKn7+Zo16n4ZbnSlGZfnmg6jhLx65Rn+Pn3w=;
        b=rxb7b1V/nDHZv2xtWt/6VfVow4W62SEKyJ+5tFPfnaUtlND6NDLgP3OwAYqDg/GfDV
         ZcaKFfvUEi2LQfqBD+TkE3/vNJfPFOI6K55xB7htQqLlQi9UATpZIfMhdJhym03nivo7
         YUrpYid4UfS3/awKGHNTPmYBqPllXSt3aV5WRVFLbRPFEZ46gUwtmFfSKeY943gCCU6J
         h0ic2DrML6zGQO4XzZWy4yA964Kxin8ow1DwEqS0ijktzWYk65bP361ksoWsyeyoUcyv
         eBX+CttoVUSPM7fw4ATaH3xS7B0XUPfLgM9ZMkRLu6VeFv1M8w74QP+E/z9GCAf7B1pf
         AmsQ==
X-Forwarded-Encrypted: i=1; AJvYcCXnC0M20Q9tNk2hs8HCIib4vRjxvo1wLCE9ff1X8I2oZxnUKrZK7Mz7B9LKwD9p5wXE+WfgjlTV6ZjU0Us=@vger.kernel.org
X-Gm-Message-State: AOJu0YzeX4Df6NpeXOSjhGGw6izl6xWcr/f7Ca7zrWFZnRhtjXB5ExLa
	6kHELZsPcLNN35/EKqI7uLV6uV86OnaWMvq2xeBosdGDF3Ou42EuKJe8e6E98hCoTJrHvViLJeB
	Zc9i/ZMvPLuroUgzNuPMnBlMvu89zGkQn6N7V8FOWpn1+0seHBV6C4LZv/EpPOfXEznw=
X-Gm-Gg: ASbGncvyy6hB06Wu0phlAPVblGBCFNXqbEdcGInY2F6fWkRIovDlVoou2+/mOHO7C7c
	PG/qWYggZORAUyQHMTi+Ei9oci57SCoC2Zcv5xbnGPUhOeu8cUDnAo+XWkK+JKQaEvJk4NTijZW
	Y+wHy2WvI24PTM5UjUn3mqHlipoOTj9ktZd6U0FJlVK/UynyE+KaSZXHiKYm77sbweyGQrt9TdF
	DKYo/4VVSqJYhNwdoNdenq/IDyBQn7He1qSQoMcZOkXB5k9CoqdBplbbxcPMl3Enq3dgznooUPY
	v4NaFt+B1sxFNqpKXS9lbopQdQf0ZH/g
X-Received: by 2002:a17:903:46ce:b0:234:c5c1:9b5f with SMTP id d9443c01a7336-23601cfe62dmr6544005ad.16.1749148379773;
        Thu, 05 Jun 2025 11:32:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF3Wc1ozqWJdEJOY5f3ma/qLJznKI268nR0qhjqBDV7W/JjvQrcki5qtl7M6f4gTc8B77fmMw==
X-Received: by 2002:a17:903:46ce:b0:234:c5c1:9b5f with SMTP id d9443c01a7336-23601cfe62dmr6543465ad.16.1749148379354;
        Thu, 05 Jun 2025 11:32:59 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:89fa:e299:1a34:c1f5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236024815ccsm367605ad.69.2025.06.05.11.32.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 11:32:58 -0700 (PDT)
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
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        linux-kernel@vger.kernel.org (open list),
        linux-media@vger.kernel.org (open list:DMA BUFFER SHARING FRAMEWORK:Keyword:\bdma_(?:buf|fence|resv)\b),
        linaro-mm-sig@lists.linaro.org (moderated list:DMA BUFFER SHARING FRAMEWORK:Keyword:\bdma_(?:buf|fence|resv)\b)
Subject: [PATCH v6 22/40] drm/msm: Add _NO_SHARE flag
Date: Thu,  5 Jun 2025 11:29:07 -0700
Message-ID: <20250605183111.163594-23-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: pNBhsMwGErZ4TkAtEEX5AgJrC83wyGz5
X-Authority-Analysis: v=2.4 cv=GPQIEvNK c=1 sm=1 tr=0 ts=6841e2dd cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=5GAAy6agFmV6x6zTEMEA:9
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: pNBhsMwGErZ4TkAtEEX5AgJrC83wyGz5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDE2MyBTYWx0ZWRfX4hGUYJMnBnZ5
 LgZqssvKyfU2m6/6J6EAH5u908SDU/0rem0swov5DwU0PQVPPrk2Y8Tirrm+ZAw2XeoPcsx+Sjc
 2TU1xAor3jENg3sCTcayNipQ1hBWMctWE3RJb/QGIgBa7Pe3Dhjx8WNwhP5cPyjYwfcPGfx1DqX
 JzfUv49F4y3+/WlkqnV3gbgWpGu12uJ5FouMrHFv799b2Tddy8ZyDs020xxn0cRjl5YBt6ISrjN
 F3BmPqHc2ydGM+iRxqzh8vv4VKKzImuAxZEX5w3CWJnI7hFd5YAPpN+tvXa/82lCC4tXY828DvR
 KWeN8THn9Sv5VUrvT7vpyGOpMW6vH3OW7oFYfOOx3Oq1lUFTmOMJsfB1GtfBtW/X9AbMUw4ed+E
 6aQkLkAp+7WJn1VYqJ8Av/HT8mzh+9rqo/gOxPpekXvxik7/QbSyMcrW0TM9Ex5kM/W3L1eu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 adultscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 mlxlogscore=999 bulkscore=0
 clxscore=1015 malwarescore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506050163

From: Rob Clark <robdclark@chromium.org>

Buffers that are not shared between contexts can share a single resv
object.  This way drm_gpuvm will not track them as external objects, and
submit-time validating overhead will be O(1) for all N non-shared BOs,
instead of O(n).

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_drv.h       |  1 +
 drivers/gpu/drm/msm/msm_gem.c       | 21 +++++++++++++++++++++
 drivers/gpu/drm/msm/msm_gem_prime.c | 15 +++++++++++++++
 include/uapi/drm/msm_drm.h          | 14 ++++++++++++++
 4 files changed, 51 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 136dd928135a..2f42d075f13a 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -246,6 +246,7 @@ int msm_gem_prime_vmap(struct drm_gem_object *obj, struct iosys_map *map);
 void msm_gem_prime_vunmap(struct drm_gem_object *obj, struct iosys_map *map);
 struct drm_gem_object *msm_gem_prime_import_sg_table(struct drm_device *dev,
 		struct dma_buf_attachment *attach, struct sg_table *sg);
+struct dma_buf *msm_gem_prime_export(struct drm_gem_object *obj, int flags);
 int msm_gem_prime_pin(struct drm_gem_object *obj);
 void msm_gem_prime_unpin(struct drm_gem_object *obj);
 
diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 142845378deb..ec349719b49a 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -554,6 +554,9 @@ static int get_and_pin_iova_range_locked(struct drm_gem_object *obj,
 
 	msm_gem_assert_locked(obj);
 
+	if (to_msm_bo(obj)->flags & MSM_BO_NO_SHARE)
+		return -EINVAL;
+
 	vma = get_vma_locked(obj, vm, range_start, range_end);
 	if (IS_ERR(vma))
 		return PTR_ERR(vma);
@@ -1084,6 +1087,14 @@ static void msm_gem_free_object(struct drm_gem_object *obj)
 		put_pages(obj);
 	}
 
+	if (msm_obj->flags & MSM_BO_NO_SHARE) {
+		struct drm_gem_object *r_obj =
+			container_of(obj->resv, struct drm_gem_object, _resv);
+
+		/* Drop reference we hold to shared resv obj: */
+		drm_gem_object_put(r_obj);
+	}
+
 	drm_gem_object_release(obj);
 
 	kfree(msm_obj->metadata);
@@ -1116,6 +1127,15 @@ int msm_gem_new_handle(struct drm_device *dev, struct drm_file *file,
 	if (name)
 		msm_gem_object_set_name(obj, "%s", name);
 
+	if (flags & MSM_BO_NO_SHARE) {
+		struct msm_context *ctx = file->driver_priv;
+		struct drm_gem_object *r_obj = drm_gpuvm_resv_obj(ctx->vm);
+
+		drm_gem_object_get(r_obj);
+
+		obj->resv = r_obj->resv;
+	}
+
 	ret = drm_gem_handle_create(file, obj, handle);
 
 	/* drop reference from allocate - handle holds it now */
@@ -1148,6 +1168,7 @@ static const struct drm_gem_object_funcs msm_gem_object_funcs = {
 	.free = msm_gem_free_object,
 	.open = msm_gem_open,
 	.close = msm_gem_close,
+	.export = msm_gem_prime_export,
 	.pin = msm_gem_prime_pin,
 	.unpin = msm_gem_prime_unpin,
 	.get_sg_table = msm_gem_prime_get_sg_table,
diff --git a/drivers/gpu/drm/msm/msm_gem_prime.c b/drivers/gpu/drm/msm/msm_gem_prime.c
index ee267490c935..1a6d8099196a 100644
--- a/drivers/gpu/drm/msm/msm_gem_prime.c
+++ b/drivers/gpu/drm/msm/msm_gem_prime.c
@@ -16,6 +16,9 @@ struct sg_table *msm_gem_prime_get_sg_table(struct drm_gem_object *obj)
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 	int npages = obj->size >> PAGE_SHIFT;
 
+	if (msm_obj->flags & MSM_BO_NO_SHARE)
+		return ERR_PTR(-EINVAL);
+
 	if (WARN_ON(!msm_obj->pages))  /* should have already pinned! */
 		return ERR_PTR(-ENOMEM);
 
@@ -45,6 +48,15 @@ struct drm_gem_object *msm_gem_prime_import_sg_table(struct drm_device *dev,
 	return msm_gem_import(dev, attach->dmabuf, sg);
 }
 
+
+struct dma_buf *msm_gem_prime_export(struct drm_gem_object *obj, int flags)
+{
+	if (to_msm_bo(obj)->flags & MSM_BO_NO_SHARE)
+		return ERR_PTR(-EPERM);
+
+	return drm_gem_prime_export(obj, flags);
+}
+
 int msm_gem_prime_pin(struct drm_gem_object *obj)
 {
 	struct page **pages;
@@ -53,6 +65,9 @@ int msm_gem_prime_pin(struct drm_gem_object *obj)
 	if (obj->import_attach)
 		return 0;
 
+	if (to_msm_bo(obj)->flags & MSM_BO_NO_SHARE)
+		return -EINVAL;
+
 	pages = msm_gem_pin_pages_locked(obj);
 	if (IS_ERR(pages))
 		ret = PTR_ERR(pages);
diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
index b974f5a24dbc..1bccc347945c 100644
--- a/include/uapi/drm/msm_drm.h
+++ b/include/uapi/drm/msm_drm.h
@@ -140,6 +140,19 @@ struct drm_msm_param {
 
 #define MSM_BO_SCANOUT       0x00000001     /* scanout capable */
 #define MSM_BO_GPU_READONLY  0x00000002
+/* Private buffers do not need to be explicitly listed in the SUBMIT
+ * ioctl, unless referenced by a drm_msm_gem_submit_cmd.  Private
+ * buffers may NOT be imported/exported or used for scanout (or any
+ * other situation where buffers can be indefinitely pinned, but
+ * cases other than scanout are all kernel owned BOs which are not
+ * visible to userspace).
+ *
+ * In exchange for those constraints, all private BOs associated with
+ * a single context (drm_file) share a single dma_resv, and if there
+ * has been no eviction since the last submit, there are no per-BO
+ * bookeeping to do, significantly cutting the SUBMIT overhead.
+ */
+#define MSM_BO_NO_SHARE      0x00000004
 #define MSM_BO_CACHE_MASK    0x000f0000
 /* cache modes */
 #define MSM_BO_CACHED        0x00010000
@@ -149,6 +162,7 @@ struct drm_msm_param {
 
 #define MSM_BO_FLAGS         (MSM_BO_SCANOUT | \
                               MSM_BO_GPU_READONLY | \
+                              MSM_BO_NO_SHARE | \
                               MSM_BO_CACHE_MASK)
 
 struct drm_msm_gem_new {
-- 
2.49.0

