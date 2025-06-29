Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACA67264FB1
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 20:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751228240; cv=none; b=sgGOV6L8B65aIj1t7EiHpM9oYql3arAflnpxxGWE/DyMeffCnKydLJ2aegA3MYm3o/eEHwWwDkB7V5npjw5TO8w167B0GGI2pcLy6IQp+xdZWY8/IBhf2NbeiYOx0qGwYUK4CanbAxJVTqNqwfz/BrVV4gdkjdWSlco/UA2npyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751228240; c=relaxed/simple;
	bh=gTdjIx8wy++YElnZqgMmZAa5qptcrzEPn6AG4VdQe9s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SAE/vs3ZnoXi/Gq3tMRMsND7Cy4N6LAgUsQQu3smk6CTsc2LHFcJNmLjavpsIUYh/TB1yJ/2nn+hUpV4aRM6TwaYeaX7aY/khyyZlA0xJ7CqbKdyFFS/i1VMw43L7TVQOIpMfNKB+uh8iuu53VjwUu1fZ9ZAW9ge/NY6J4Mhslk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=otwO/6/Q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="otwO/6/Q"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TFnYHj005314
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 20:17:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ufkxvlCaXqE
	+JOcTp0SgGPSX3GCc3cmG0IREiQb02Vo=; b=otwO/6/QlbufEGIIqV3elURmoR5
	wmZaq0AzynUV8kft65Y8NbAAcDNbInMYLYrGRj08kPp58lLq0q4cbfGrAuijlpM0
	hEn9AoB+RVt9NflNd2jHG+exUbH9f3WzmUTzhaL4fREj5GN5C1ts1Kfnlm5vl36w
	8mEHa3lROIUKe058VXHnc0Ar431lBJiDsXevih5IdyFM8uXNVsyiK+A8Q/1IiRs0
	0D5gPAtedVAQHDWSVdkxXRUtGmK2lZuWftjlN+WX1pT3bRF+40r+5Mx/PRFEBmFR
	P6IZKg2lQ7CG6cTUxcPSKgZgbMKmbD9WdSa4DygOLZSQMgQHyi110G3hi5w==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7d9tpmm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 20:17:16 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b00e4358a34so949202a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 13:17:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751228235; x=1751833035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ufkxvlCaXqE+JOcTp0SgGPSX3GCc3cmG0IREiQb02Vo=;
        b=uUk0F9UhTtLDQ2yQCasrT1PLs/4H9HAI7xAYwowackPEC43A8+rW+jQzTYC24+NXsF
         APMNhBvrkGJQyXpGoZfGHSQ+21UQFWgX05aR1h2szSft9ixDa1QnmLYnqRMOHWo37UiB
         H0PxmvS9q8Khxj8rzgzeBYirMCyEoXMzl0VDoiMbo+MdHQBAukEj1lTfoU+WAuJ4n/Kh
         S66sm5OcU1Y7fiJjgyNo4rVqLXcM7iUh5lpyPQ00f//jBdRvoeyhb9ohzN+8nlx8JTNa
         QEiZadDz7Q+a8BaGwKue/0STX8kUA6KXoBmTWh9D8pnHi8wQYuvfn3I8wvofJs6lkAiq
         7i0A==
X-Forwarded-Encrypted: i=1; AJvYcCWiiKZw/w3NyW0yQAEdEZf2off9QXyUh18RtHXjasLiE6bnR9RoaMsu6GW/lyuqoKgX2/NgpDMlpo4ny2E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRPxLRPQefsKxjtylBcihhYcfAG1CFujb81hXnTW7AModAu5JS
	EIZ8cQYs90QNgIidxbhQIIe6gj5spwXB6KqhmOvahoe4BYmpj2hQsdNkSyy8+urulKT1f7TiI0l
	SQluhyAk1fleBZ5p6OYCvhfg0soj3QAhwMjIViByAL/vJvTNPMwchf976mJiGLIA5yOc=
X-Gm-Gg: ASbGncv8jxnHCKAqX+m7YMok4J9kzuIhRlAQKivjHacRwky5NUsaISZl5WRvY4U9MRy
	kqkG40skuuVAgouGvYV3IgdZvAMQ6yHeKya7jA8BEfrK856lzwa/8u+W9KaYhG5Du7wDtb8cld5
	H3Pa/edLlzTGtdC4kQG1KhozuOux6C056rLRc5spCiXRWRiY6TsGtb0yu+Yw6G1sYYVUefROi1o
	5OX51yIiDvwVsfEK1D1SdEZB2RoXj4EOgtpTQNDRud/L+Y78ck3KDWB+aT4lK3AyzrH25ILtQl8
	1uymBBi2HSEI7UxlAriu1+xUElpiG9pjZQ==
X-Received: by 2002:a17:903:1a27:b0:234:b735:dca8 with SMTP id d9443c01a7336-23ac2d86b33mr141348285ad.6.1751228235233;
        Sun, 29 Jun 2025 13:17:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJvTw3e2vrywZVxfjZlEoy2MYDh/wxsQwXvulz3VBukHFPPCVpgZZypcbvOisjgkgC2KTm8Q==
X-Received: by 2002:a17:903:1a27:b0:234:b735:dca8 with SMTP id d9443c01a7336-23ac2d86b33mr141348005ad.6.1751228234806;
        Sun, 29 Jun 2025 13:17:14 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb2f24c7sm63539985ad.82.2025.06.29.13.17.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 13:17:14 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
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
Subject: [PATCH v9 39/42] drm/msm: use trylock for debugfs
Date: Sun, 29 Jun 2025 13:13:22 -0700
Message-ID: <20250629201530.25775-40-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDE3MSBTYWx0ZWRfX6E8FL2Vv7Nsj
 dd51Oo71S+uclhdrPlPI6SEYtp5nWZLCS0kGNhi+RoTKAwl585/EC1TCxoQ52weybaC7EYQxRoY
 kzePJzejGAufQJiK3LiWSXlryV4rMp01iFXbtrEgBtdbg17yPLY/T9mMJT4WR488pDQy8bOHzqA
 cAu2kxPVyTQMmbBdFjsVk7+VyXqDIAnlp1+bLAgothRHXsDmLaf4cKmCJrxhEt9RtwA4D+qtCG2
 GWtOkMnzDZW/gR5PzKfKyysk2J/cmFDWhYkWM40zrcgYcKmkQptDKIQ2W3GwbT746KvgpMn62ZT
 yD2zt2AwXdZst/oNSzN7PKRALKxiGyopT6ii9e/0Xz3RjXi5QZ917KLPRWEqwbkjHFLxbpAksF8
 q8h96f4q6G1wKbU6QVwcrpc3dE+qWxunlBEw1mkhgkZo4TrhtP69dmbMFFbSzMPzkZeAZaVO
X-Proofpoint-GUID: a0d6kmKXxkeGQRNNB-JYPEumyL9CS8X_
X-Authority-Analysis: v=2.4 cv=RrbFLDmK c=1 sm=1 tr=0 ts=68619f4c cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=UIWvmcERRd2or3XT2GcA:9
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: a0d6kmKXxkeGQRNNB-JYPEumyL9CS8X_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxlogscore=999 adultscore=0 clxscore=1015 suspectscore=0
 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0 mlxscore=0
 priorityscore=1501 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506290171

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

