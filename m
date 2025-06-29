Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88E8D242907
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 14:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751206101; cv=none; b=jriqIFy2LElKQ3oSUDVqWZwczZhEytdizJYFEEIKlymE0qSDozr6p5DWRDMSs7uDuONqEYidAgzWzvbWJ/CJ6Kth2QCiJUY3Vx2hsErzmvTOP67TKMWqc0iVPhXrKAIG/DeHXdAGdNhse++Z3LHcifqohYSigXauX/LD67Vkek4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751206101; c=relaxed/simple;
	bh=gTdjIx8wy++YElnZqgMmZAa5qptcrzEPn6AG4VdQe9s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SRxftb0+c6Yi1VxwxpY6EhjLWPM+XFlFlQ4E17KhatUNZvXJQk54l023wDcwCBW0Fv+xb76VqLnauLlOqSOpBShI2fkjnDo7hy+C1jNfHjm74TMupt82h+Cj3eB9SKaae+iFEBTn5XrziV5UPQIUF6zvSWKVM/m6Y/OTxHSq9W4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N15+P78H; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N15+P78H"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TCs0Cj002765
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 14:08:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ufkxvlCaXqE
	+JOcTp0SgGPSX3GCc3cmG0IREiQb02Vo=; b=N15+P78HFqJ2QDE4lj0Bqkg67/D
	C1V94pwkSemNSxnav6EC9uQNEn3T5V3CT4/rs5lihNXj4oSuN4423eoHYr4IVTVz
	yE4xRjsO1+Q7SOuXZxmY20VdxujXoUlj+kEqrvdiy/u80I3PSajyNStFuW8NxpqO
	hGaMCU+VUnc2MVaSJqaCJ6K+UOX8/tOHPo9KwyFTXNueddSWoSmBz6Yl544HohLe
	timFtgFDPhlkN/IRG+H7P7Dyxii9cXkLR4s2QTmamE+JDpLcgg31jcEtAqsr7f8h
	9Dw6UWpYHuYKoRbW3RM6pUdQ8KncCX9Ccz/5QX4ps8UIjZzasAl4fa/OksA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j5rq2f0f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 14:08:18 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-313fab41f4bso5063893a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 07:08:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751206097; x=1751810897;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ufkxvlCaXqE+JOcTp0SgGPSX3GCc3cmG0IREiQb02Vo=;
        b=nZKOUIE51RkbJr/Od4c1yZ3VStnisyF+0BKj+hdL/J5pA4huHqeou/ZsjblZ48CV+R
         B1hoVsq4wItUcSxNXc2xvK9t0dfxtkI+vWaHkjAx9h0CPaDqhiWHfgvQX7LGFvAVONg/
         9YmxqgU4NBLBIxtS93NOfBaJWwbJ3aY2KUosoQN+51risvKW5zZz0O7bHm/NJxebiO3F
         AafPwCS7/DpXczdemxTtbE2uDAL1wc5W1JsQg0FJdg2z3Xg+W6XRXtkoPXPrE5zKalSH
         eva06xgtEOJEtnvItp1Kj1Hn6+2Gth2ZYboOuPw3Sh8q7olyY0/l67jSlTGAR1s417Zw
         svCw==
X-Forwarded-Encrypted: i=1; AJvYcCU31uUlxS7NDUnhvgI5MHs60X8RL6+aZG/lH4/qXlvW7uDoEUiFgQBU5+8Z76ZeIgVLW0gfkc5egCrnvbc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0Nd1xWpF0Wek3oaBKNRgpfpD8VvS+vbMc2oS9ZolT+ZQ+j0Qh
	k1yqfd12L0eYv/GPO59sUYednjpU6fi+0kwsgqPAA+mbG0UBOupYZbKXnYTzU98hl6E/UrcABRF
	4eXtER9XSCfhup0hOkzOYOG9YxrnNgG2D9WE0o403e61zr8F1WGkySYpodVP3O6EuJE8=
X-Gm-Gg: ASbGnctcLzNLFdFlTGBQQlRODfg6Nq6/SseW1j1ue/ewZzmPQZIdk2hz004OjUswnmo
	7u3DYinLFYeoOImRJC92XiRDyyr4VHjHMBJXv/RhhYJZOzaZKtpE62E54sa2uPxCplm1Mrk7bm1
	HmM19XXE6Pi+z0WCIjeWwPW8G9TYnWdeX1DRr8LRkjpyZmT0iqE+ARYPqyeSNdqReyJo/7iHhuC
	9xpuafkdIuVQWnDKoFnrTeX+t2Ps0DIwYe1FKUDpPJFdvIDFNgLDOWKj1EIAlyCBkHJiLAZnyM6
	K/NRlYRgzOwP8rtiLK2ooq8sZSkikAns
X-Received: by 2002:a17:90b:5347:b0:311:ba2e:bdc9 with SMTP id 98e67ed59e1d1-318c930f9c3mr14566743a91.27.1751206097270;
        Sun, 29 Jun 2025 07:08:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHJayQhQWhT5vTJXy0mRK+FWWNsp3OY4G0Nbi/rEwA8XLYXa5Wnw/fbVSwXi+QB7lNSjIGwcQ==
X-Received: by 2002:a17:90b:5347:b0:311:ba2e:bdc9 with SMTP id 98e67ed59e1d1-318c930f9c3mr14566701a91.27.1751206096824;
        Sun, 29 Jun 2025 07:08:16 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-318c13921b4sm6582806a91.1.2025.06.29.07.08.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 07:08:16 -0700 (PDT)
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
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v8 39/42] drm/msm: use trylock for debugfs
Date: Sun, 29 Jun 2025 07:03:42 -0700
Message-ID: <20250629140537.30850-40-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: 8TjlJ7EKaA6Uo1X8bK4M07VzLy94CN7S
X-Authority-Analysis: v=2.4 cv=eIYTjGp1 c=1 sm=1 tr=0 ts=686148d2 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=UIWvmcERRd2or3XT2GcA:9
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: 8TjlJ7EKaA6Uo1X8bK4M07VzLy94CN7S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDExOSBTYWx0ZWRfXw+gsA9/ZvK1i
 cDRFyu2waWBVoNMySEsyiIY7llxCIolyKJfozfjYMwJsXXccbjxAyH16txHLrNE4uRf6pWnbZeN
 Qwe7KEAvHhuPM3rhaZkwjmIppIDb1dbuNoChokWy8/zUvVPTtMYc6sZufOqpXVXVloyJzIio63a
 yVx15dV+8mZeaWWwVPjYu41iu+Ror6Atgio+TGA7JJ2Z0oj5hoSWt9g+3HqNv7Ks7es7RKqBcNB
 380pINutOx4YWBv/lHGqcOqZeOtGhL+N5iNY+zI+ky/jPSd9d/dql2m4l5JPXR37ULmAILYhMgH
 VrzzRyHe+fMy2ds3dDAh39A7q+20ZUqYmWgkcm89mTRN1ha6Jx0jSMovi6/WAgAyLxHFMNikor/
 W/A739yvcCTHklEQTMITbXkPKq5GuKKAYhzTuRAZHdQzz7k0k3QbOcjTRLfDRlUoTHCf9hb+
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 mlxlogscore=999 priorityscore=1501 adultscore=0
 mlxscore=0 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506290119

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
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/msm_gem.c | 3 ++-
 drivers/gpu/drm/msm/msm_gem.h | 6 ++++++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index e3ccda777ef3..3e87d27dfcb6 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -938,7 +938,8 @@ void msm_gem_describe(struct drm_gem_object *obj, struct seq_file *m,
 	uint64_t off = drm_vma_node_start(&obj->vma_node);
 	const char *madv;
 
-	msm_gem_lock(obj);
+	if (!msm_gem_trylock(obj))
+		return;
 
 	stats->all.count++;
 	stats->all.size += obj->size;
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index ce5e90ba935b..1ce97f8a30bb 100644
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
2.50.0

