Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5CD9215F6C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 15:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750086020; cv=none; b=NScBKxU5sVMopIln4aSsIv3QbPrqd3HQEGE2bw8wpd9sy9NHKQefuiDTYgu8diWbv3Gp+9CGnD/MlegG1UGGvBz7fh9s5R8APfuOXDGXPgHWuShqUA1ugz11DwVPOAAak1KjYbh46ZQ9MfuHDudEmb4GjOwhWdyqiU2VwZK535g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750086020; c=relaxed/simple;
	bh=AQnz321Cbkz9+V5DaGF97fSoVS8odeOv59+RE5dDUFQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sepnKXv2x1cvaBKNLN+km7iKhFwCCdE0mNMOAGdgmHQnnINlDASQBH2qNYCKu4f9FiCkalBKd+x/XV7DUyplEz6MvEPWUeGHKIE2LP2yfqndccp5IL3mV2F/AyepY4fHLG9Q0/I9q9UIrb6X1S2bZFSlJ7dWRUTh7fBLRn/MPDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Kq1w1Y6j; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Kq1w1Y6j"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55G8TJMt031861
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 15:00:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=oC5JJQBiULx
	rFeqVoqoX6M/zLXWPGk3+0yhR9TIZ/ZU=; b=Kq1w1Y6jV+ZLj34FxNYF7nLVk1m
	+FmKeSKqop67aenrJbLSs6hwSg3afjeXg0tt6hvRFefVbsZaL/QvHUHcV4e+wEiq
	QlaPX5kOwgw7Ijz3KMfKau3HkRM2GCH4n5tGhod5+0G1cyMVlQgkvOzUSLYsm7vv
	b/pKzK7fwuiqUS6sUR7YHaLv72bcTHLO85xp7KVTE+qy0ty9L+AFX10nweQcz64I
	M1bzJx4yKT7ngh4nAqZC3M3+luHxD6sCBWx0cEcihHX2rQohPjoLWLKQ4BHlM6S7
	DZpvK5RFGmrOx1wxsId8LZd0E5H6VCyN+OUlfTwnb5w3mE4fM9pkNI9b+rQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791encxr4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 15:00:17 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2356ce55d33so60223705ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 08:00:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750086006; x=1750690806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oC5JJQBiULxrFeqVoqoX6M/zLXWPGk3+0yhR9TIZ/ZU=;
        b=MjmasOwGscS6nvWDNkrVJzZK9ok27kZpDjzeSCQ+JrfuxHbZftZEpqFS+jgN5bzvKo
         xoXJdY1tMkFT+u78CroH6JgPuQXgYQPX6+rp9ua5vQUP/+YfM8HAuQisq/TleXmPgC+i
         GAjO32z/yUBE4hw/tnc+Gp317QKZ/z02KD+h7W4MYt2l3pObcuFJN+zZbEOCj4fF+WLn
         MRUWlpngKB/QhQjbmcNUOfgXE+NgJCRKhSCP7Ykpqwv882uQbq6S9A9rdbpZurr6V37N
         nRpRzrJoh4Vo0nCglZJOSKVT7xG5sRDDob/8pdwZrw2jo3bYlrw/AB4jmMft4+gCcruf
         DuPw==
X-Forwarded-Encrypted: i=1; AJvYcCVYeGWhQ3MJTOqfZjORG2QESibh5NCMMMZoA8Uu9uIhHu3FiU3TjUp48FfXWKym08k8zS7foHRNfRrdrvc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx37FELt+pCe8WndDDLVqNrOPCvxELvfA5BErKpC7O4NECHZd+W
	NVqyXlFeZJHbwu2lfU5kMuuHQ+Byi1m+Vm4U4YPg40J7ep0l++0wcVmA9XEJ97IPj6XlFzDzDu9
	6i90Qo4vXG09DqQ5xWqwQJF0eUDpB7i//VjfYc78/Mf2vM9LlvUz2b0YYn+8dtPqRfWo=
X-Gm-Gg: ASbGncs5cg6NTBY3wBydOnT9o8MFOK4pn2oLEnXJM6cQnxBQSwREO4eE4J2AqfPUbBz
	ZqKbKyvoD2LpalTydl+AhGohsx+RzSxGpVeQZ2CnTKTwqciutAmgb1ed1mvYdm5JyLMQZa5tZV5
	0vcQoAsHci/Epzomimq6wHHyfeddb4B0jfNC9pIt/xFxzAtHc4lXZuiaCFcr+P76xYqZ4X1XTwq
	rQ5br5NQ9VATkc9gRJbnxSH28+fYKFQVBQ+rEUJBxnUuJJYVqIYubIS1O36LNgQuNCusLVRs8ze
	9/MDMuMluccIWr/Me3Ro+/Bul6AfMuM7
X-Received: by 2002:a17:903:22c3:b0:234:c549:da14 with SMTP id d9443c01a7336-2366b3de71emr137982595ad.29.1750086005968;
        Mon, 16 Jun 2025 08:00:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGnfSQJYXmMmDrm6U+uoX2a4jwex23BTSF9bmaN4Y4FWllhK7O5JeT0I0bKsdQT1hF7bDaSpA==
X-Received: by 2002:a17:903:22c3:b0:234:c549:da14 with SMTP id d9443c01a7336-2366b3de71emr137981935ad.29.1750086005443;
        Mon, 16 Jun 2025 08:00:05 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365e0d44c4sm61807305ad.252.2025.06.16.08.00.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 08:00:05 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Danilo Krummrich <dakr@redhat.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 2/2] drm/gpuvm: Add locking helpers
Date: Mon, 16 Jun 2025 07:59:57 -0700
Message-ID: <20250616145958.167351-3-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250616145958.167351-1-robin.clark@oss.qualcomm.com>
References: <20250616145958.167351-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: reFVReuueJxKtSEjK-xyc1NRschwhu2Y
X-Authority-Analysis: v=2.4 cv=D6RHKuRj c=1 sm=1 tr=0 ts=68503181 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=J2tNMqIfyHcHeXEe9QMA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: reFVReuueJxKtSEjK-xyc1NRschwhu2Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDA5NiBTYWx0ZWRfX+FIoHjEcnk6W
 t4Lx9wmy0/Syl9e9bLuZyWNIrHuHx9HMl164u5sP6gl5yfTYftGp1PQUybsSzMVn5/xq2o6x9Qs
 FzHkW9Mdvm01OM+0N3oEhb2w7JVxCeSRzax60D4obdL/3aXrM1h298q7Chz2MW9fXR9HSMQLqop
 kKqXR14U9eq08z0FkFRNfU1J/ngXh9jCXqIXD6Ml50lxAj4xlTZxlRX4kjIqTRWqOA5v8NL0mnK
 rAqC4M1DMNZW3d53q0XktGRgCWkKW5Z46m1Pk7p8yhOe3q6rQVoZf6mIpgkOvbZmckGFGkPEuB+
 ohtS2oDDGI/Ad5OgiQ7u0ZseIPkCS1E4MCTn623LpsSKob63LCCGEeZL9AfgmSgoSLL+bEVXN56
 MfzicHEtPDKvyljS2gsVNPl2c1NISr1Sc75pKUAmOmDNyQNudL2tU7O9PGOorOYPOVdWGn+O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_07,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0 adultscore=0
 suspectscore=0 mlxlogscore=999 clxscore=1015 mlxscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506160096

For UNMAP/REMAP steps we could be needing to lock objects that are not
explicitly listed in the VM_BIND ioctl in order to tear-down unmapped
VAs.  These helpers handle locking/preparing the needed objects.

Note that these functions do not strictly require the VM changes to be
applied before the next drm_gpuvm_sm_map_lock()/_unmap_lock() call.  In
the case that VM changes from an earlier drm_gpuvm_sm_map()/_unmap()
call result in a differing sequence of steps when the VM changes are
actually applied, it will be the same set of GEM objects involved, so
the locking is still correct.

v2: Rename to drm_gpuvm_sm_*_exec_locked() [Danilo]

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/drm_gpuvm.c | 81 +++++++++++++++++++++++++++++++++++++
 include/drm/drm_gpuvm.h     |  8 ++++
 2 files changed, 89 insertions(+)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index 0ca717130541..b8b0c7f028e2 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -2390,6 +2390,87 @@ drm_gpuvm_sm_unmap(struct drm_gpuvm *gpuvm, void *priv,
 }
 EXPORT_SYMBOL_GPL(drm_gpuvm_sm_unmap);
 
+static int
+drm_gpuva_sm_step_lock(struct drm_gpuva_op *op, void *priv)
+{
+	struct drm_exec *exec = priv;
+
+	switch (op->op) {
+	case DRM_GPUVA_OP_REMAP:
+		if (op->remap.unmap->va->gem.obj)
+			return drm_exec_lock_obj(exec, op->remap.unmap->va->gem.obj);
+		return 0;
+	case DRM_GPUVA_OP_UNMAP:
+		if (op->unmap.va->gem.obj)
+			return drm_exec_lock_obj(exec, op->unmap.va->gem.obj);
+		return 0;
+	default:
+		return 0;
+	}
+}
+
+static const struct drm_gpuvm_ops lock_ops = {
+	.sm_step_map = drm_gpuva_sm_step_lock,
+	.sm_step_remap = drm_gpuva_sm_step_lock,
+	.sm_step_unmap = drm_gpuva_sm_step_lock,
+};
+
+/**
+ * drm_gpuvm_sm_map_exec_lock() - locks the objects touched by a drm_gpuvm_sm_map()
+ * @gpuvm: the &drm_gpuvm representing the GPU VA space
+ * @exec: the &drm_exec locking context
+ * @num_fences: for newly mapped objects, the # of fences to reserve
+ * @req_addr: the start address of the range to unmap
+ * @req_range: the range of the mappings to unmap
+ * @req_obj: the &drm_gem_object to map
+ * @req_offset: the offset within the &drm_gem_object
+ *
+ * This function locks (drm_exec_lock_obj()) objects that will be unmapped/
+ * remapped, and locks+prepares (drm_exec_prepare_object()) objects that
+ * will be newly mapped.
+ *
+ * Returns: 0 on success or a negative error code
+ */
+int
+drm_gpuvm_sm_map_exec_lock(struct drm_gpuvm *gpuvm,
+			   struct drm_exec *exec, unsigned int num_fences,
+			   u64 req_addr, u64 req_range,
+			   struct drm_gem_object *req_obj, u64 req_offset)
+{
+	if (req_obj) {
+		int ret = drm_exec_prepare_obj(exec, req_obj, num_fences);
+		if (ret)
+			return ret;
+	}
+
+	return __drm_gpuvm_sm_map(gpuvm, &lock_ops, exec,
+				  req_addr, req_range,
+				  req_obj, req_offset);
+
+}
+EXPORT_SYMBOL_GPL(drm_gpuvm_sm_map_exec_lock);
+
+/**
+ * drm_gpuvm_sm_unmap_exec_lock() - locks the objects touched by drm_gpuvm_sm_unmap()
+ * @gpuvm: the &drm_gpuvm representing the GPU VA space
+ * @exec: the &drm_exec locking context
+ * @req_addr: the start address of the range to unmap
+ * @req_range: the range of the mappings to unmap
+ *
+ * This function locks (drm_exec_lock_obj()) objects that will be unmapped/
+ * remapped by drm_gpuvm_sm_unmap().
+ *
+ * Returns: 0 on success or a negative error code
+ */
+int
+drm_gpuvm_sm_unmap_exec_lock(struct drm_gpuvm *gpuvm, struct drm_exec *exec,
+			     u64 req_addr, u64 req_range)
+{
+	return __drm_gpuvm_sm_unmap(gpuvm, &lock_ops, exec,
+				    req_addr, req_range);
+}
+EXPORT_SYMBOL_GPL(drm_gpuvm_sm_unmap_exec_lock);
+
 static struct drm_gpuva_op *
 gpuva_op_alloc(struct drm_gpuvm *gpuvm)
 {
diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
index 2a9629377633..274532facfd6 100644
--- a/include/drm/drm_gpuvm.h
+++ b/include/drm/drm_gpuvm.h
@@ -1211,6 +1211,14 @@ int drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm, void *priv,
 int drm_gpuvm_sm_unmap(struct drm_gpuvm *gpuvm, void *priv,
 		       u64 addr, u64 range);
 
+int drm_gpuvm_sm_map_exec_lock(struct drm_gpuvm *gpuvm,
+			  struct drm_exec *exec, unsigned int num_fences,
+			  u64 req_addr, u64 req_range,
+			  struct drm_gem_object *obj, u64 offset);
+
+int drm_gpuvm_sm_unmap_exec_lock(struct drm_gpuvm *gpuvm, struct drm_exec *exec,
+				 u64 req_addr, u64 req_range);
+
 void drm_gpuva_map(struct drm_gpuvm *gpuvm,
 		   struct drm_gpuva *va,
 		   struct drm_gpuva_op_map *op);
-- 
2.49.0

