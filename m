Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818852FCE0D
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 18:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750877965; cv=none; b=tEdOmrDy2T+jrMhonHGL7sstB4s28y85EfrHuTHurvnVxGMh09eVejLcUkiT2iJjsxCsdB9A848LYGR3tUUBhp1UCoZr1a+p2lxvcnMsqq/JkigesRdAqteOCwYzHHgGLoEG3DgFGNEjG4TjVxAxPGxpsdtkffzB7Gv2hONj0uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750877965; c=relaxed/simple;
	bh=eFxBT0OAg7rchLVBxX/NKfn/olJKKvoe8oSOxRdtsVQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Mpv2VnbzjZwNzwz0SDjnBZfkRqXCWOUcJ0fWBbwht7cYGEu7otdne5Wr6p+N6L0UEZry6sNXl6MyU82vSkHcXLNzdItW074U/jxhFbNEqWcmKvOJ9qY6/kofEwQ7cZHl1LbZ2wS6TSB5DQjUURGUXGS86Ju/4XNbzhB8BkeqK9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F2yRjw6+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F2yRjw6+"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PCGcGM020068
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 18:59:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=eqq9rbaAioE
	9x/Vr1cLJypF4bAqJQvBM2Xsa5cd3ZNI=; b=F2yRjw6+OVLjPctkQ7sN/SPa2Dw
	9I0eoXTefhTcUVJuB44zerx7wk9plj3WgmZuB+U1NDuOkBpjgYQcanCPgttNDshZ
	LHjG+vrltCf1AEry4+JKwdu9sSWZ02G5naJKvSMsQg5Z8JKeiy9R3/Yd6nzG4BYn
	s8X+WgmXDKd7rTxqiFSUOnKHK5a2BpPVFoW1NEKlhTjBeO3npBS/cIOjhn+9e6j5
	UTxIXgzyXpKuyL6PNx2SNAZk0QDls7E69jcx4ej049FUCgLJt9PS27MxaP60f9dp
	cKxpjB0Ix3eQIf/kl8UIy66kqb7yahG/p7KEzezj23KejTA6AUHVwsM1tWg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fdfwy7ve-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 18:59:22 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b2c36951518so161442a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 11:59:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750877961; x=1751482761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eqq9rbaAioE9x/Vr1cLJypF4bAqJQvBM2Xsa5cd3ZNI=;
        b=kUyYIHhbWzK6GMGiHMe86MBpqOaAd3R1YcN4OyQzgxt47FNruFTn0etIl//3lGadI9
         QfjNH0IQKQARZnAJUg/F+vbWyZAcDHyd/7HsHGXCOvgp27T6fIdGPtUanbXjljAa/VnY
         z6tZgNKieVROWuDmFBvNZLGVq4eWVDabpUgaevvQr3XQ9u3M7mEq1xcYQzGgmD2olAWC
         xyudqnIASX9qHGM692UyKJOAlcubmJZB9xTV999oMydevS2SALY631zjVfUiBwYPIYaW
         1UbXdeKUawzRmXsGlSmsxivlN0H46nqUkYYyxxydqPXv+gM4JTIvekQYV+kKFllvcAJK
         GyWw==
X-Forwarded-Encrypted: i=1; AJvYcCWVGwB6pWWjCvTukRMSlGDHexgem5YkjThOIVKErTI3R5/Or/4DmRMWHxVbhjnW/yFywF5GPaX4Choy1Wk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyi1rvUOGP44Mv0hRV2OQd98KFwFJLyjU9gPhpIZ5PcTu5HKm2h
	SR82rphWewj8RsaDLJQPpxlefLEobg43pQYgeLuh5x4MRJrmCaWI8CtrBqWVTS61WujOshdNEmf
	Rj0t2/LJAp/jnfgRKhaxokVtmygHIAD5R4HHbY0IRU6iPJgBre5RFUxIaxElVdtSDT94=
X-Gm-Gg: ASbGncsqiY7wk9J72vMuWDWxxWDbfGFkAiyq5JoxNjyOdVPrH0fje8ciAoREHYxJLtz
	yH2JzPGHm/DTr0Po5mEfnyZab8wOtGoWYB+TRRkd94c8DnuSIki6tUC3ru2e7rea2fzI8GSTMtP
	b3lWMcCI+/OxqtrWH7htYFtxKN8RU7zZm3n7VJgF/K7E93nM0cP8jXesycUcYGG3U9jS8fxDcgp
	OlYENI7tK0BsJ7Jv4dBSmXkWWo6T8NlyuC4T7iPdp0gUKZgIXf2DL3bk1ICKSpLXjvMigJn+EDl
	BsarC5nnNC053OC/JutCWx3D+tfwS1je
X-Received: by 2002:a17:903:1aab:b0:234:eea2:9483 with SMTP id d9443c01a7336-23824087b81mr74601465ad.51.1750877961043;
        Wed, 25 Jun 2025 11:59:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFH/9u8r/LxodxXtXwo7w52l7fdtoIYCsGzY2nyZs0qLi0VBSXghq7mfLQgk/HczC7JkARW8w==
X-Received: by 2002:a17:903:1aab:b0:234:eea2:9483 with SMTP id d9443c01a7336-23824087b81mr74601115ad.51.1750877960671;
        Wed, 25 Jun 2025 11:59:20 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d860a8a8sm136322695ad.132.2025.06.25.11.59.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 11:59:20 -0700 (PDT)
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
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v7 39/42] drm/msm: use trylock for debugfs
Date: Wed, 25 Jun 2025 11:47:32 -0700
Message-ID: <20250625184918.124608-40-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-GUID: uP28FgofJs7n8aPYlYmRTW711J1X5JlD
X-Proofpoint-ORIG-GUID: uP28FgofJs7n8aPYlYmRTW711J1X5JlD
X-Authority-Analysis: v=2.4 cv=MtZS63ae c=1 sm=1 tr=0 ts=685c470a cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=UIWvmcERRd2or3XT2GcA:9
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDE0MyBTYWx0ZWRfX6IG0reWpAA+N
 fJYDUi6fpy2PHuw9K7JbK6P0kbwMlz7+vIHmUl++2/ropZS0dvqYFW6bwI0NVrhNAPERcweoirQ
 kWTndGJ5BZN5s84WJ8anBSQb+x9ELjuQbRPoJVja/+CDaFAhjd5Z6Iqm5w2Z4rB4CYx4JQtMvuP
 IgszYJmRh0VAQ/gdp0BTTb4VwciVS/8N7oD4curHdXWlntHupoShD5y980lVNfgkZ2TxrASJpcs
 1Somt1NCc1ueNoSaLRTs8tg1i3ts0HkXlQIRxQqQGldRU/sRzZTL0Sg3bEvRuUWSn6FMd2SlORz
 1nOwq4wQ7wHDpzl+VT0z+tATDTkYdCmYvQk9qbrhP7QdX6P8Cs8GX4DkyaCQi9jR62L+EGT42+L
 I21uTEMDh95Vi/z+cQY7n+SkViOXCxPbqmLGjLSyDXcoZX/cY2wVLipaF89usMLqQtWhzN39
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_06,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0
 mlxlogscore=999 spamscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506250143

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

