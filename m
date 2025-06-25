Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A8422F3C1E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 18:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750877947; cv=none; b=n5w4NCCK1iCU4kf3HwB2gfUBky1eIeP103tg/1SZzGSd3x8Wm5lOCEzHIFByeNmQ3xFnMDxRkNGno5kjIFAimEStAyWgl2XgblQX+KJRWj+lnP3/Y7OfRyYXkKT6OCRNgkJEaPI14lg2+JKsb6U9nqeqAJnUbZgIIbtBik9+oEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750877947; c=relaxed/simple;
	bh=qCbhnRnuW+mHLXXemWgEWHentAADrrysxUd/juV5+7A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WtQE7c6jvO/sZdwvYA2W02BXa+y+e5GJCyMCNhAKFiaFjn3BJKjYhvlmxZW58/R97QhJTMjLzwja8tQwM9sWLHEhSGtkI9uDMSfEiBYX93n+6PHmDNwn66tQJ49xZpo4WGql7GPkLD5pqZya/aOARZEXeD+CUQf0pQ+fbJIJtx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lRxDIN5C; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lRxDIN5C"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PCHZgE031297
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 18:59:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=zZ0/1Hg9ehG
	RWkpUmL2vj2q1yR8YxmohRbA6KHUWPBw=; b=lRxDIN5CicFLvLQrRAk+zyEqz8A
	6Bio695kpwmaahDHWQb9FMpv74R8pYMWJNBM5diCBFMy8GeNPuE3kqB+ixa8vYrL
	PcYfxYsKNVtsmA7bkbTHcfO3X2M7dlQtvQH60b61uLGpVogpZNB8ldoBYIcvY0Je
	42bSQgYy7HODZLu9I2meWiO4nznBoeM8Z5uBubThjnwyVomUd8UWNVC4kUHJz7/R
	CNAE9OP4oNdBUTkSR/VQzZ73rneRyG5TjNyC3D6mZldqv+yBi/+0UoELQWizMXao
	QVG7S0mBKOksR85YPgImHZCL8ujBfXD032PwwzR/qDqxvPd+TMyCZjZWCwg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47emcmtk1k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 18:59:05 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-748efefedb5so256307b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 11:59:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750877944; x=1751482744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zZ0/1Hg9ehGRWkpUmL2vj2q1yR8YxmohRbA6KHUWPBw=;
        b=CVO4Rc7sPW7k/w/p9BbtvaCJ1ZInJnrHjBDTRG8yXK4s3dpoFoYVYEaUTb7cf15r8w
         OL/ZkV5NsyR6SyMoKgNi7bW0LCO3Li1c6HsKLo61ljZCT23BWcV6mFqh6Kic+sQ3Q207
         vzss5/nAFerCZzgEnoidkRsWpkw9LBF3hRlM7RvxvycPozLR1mGFGILoep64tkHjDzKW
         ML31rMIrr1Jjktsc+v2UWHptKcNf9bFsSGghPaAZHVEYRgCBwEKzfrQTYdb7/FrF7lRb
         tD/9Iek+qg92/7X5bE8Tfmsj7u1lcv3wSqxt0qLDbChQE/DebUVJSSGR6/EKqNOGlgOv
         YnOA==
X-Forwarded-Encrypted: i=1; AJvYcCX2VNO8YhzOswAiQc6USVl3qZRO6mBuSIzmgYLuKaVK8VSRwTvhh804y+jJqLkzNNCA5eKs6wAJIsWZkx4=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywaef/YEpQeZ7cG98w2OB/jzMRXFCQgj8XSE1pc4UAIoUlkOY7z
	vhsDyNL1Z/9UVIboCiJ8lMj9UIVC5kIPrebjoFo+2kuMyzAhGykJEznBAtCKEp9vCW6dePetVHQ
	WEBI3KPH9/6gI3CoBVTUwuOujXs3d4oZuX9Rr/3LVSjl+WclicDFC3gZrbOww7FTWUrE=
X-Gm-Gg: ASbGncswtOHy20wJRibSEraMVR3D3Auu2z0V1JeUxeGSsOAzxSqSk5YNRvNxSbN8HDx
	rOBKbnH+2bnkSelfBI9o7EikiZc8behNdWhlrLLbYrBlbPWXNeJEDPQzP3cXuJTPO4ieLxxHhU0
	pXMEyvH/xU45zbNLWE8Vp28AUltQNurVmcgyLo33hOJ1CGIOEvJACvUD7hPmV8ru9vw9aEUr0WZ
	aWKlTBwk0PPIq2TswvCktQH14r0CNHtcjFY43KSjkoCDzv+LcJwhw4sCS+CIg9L6H7PHRmIcOYX
	BswZWC59pIRwPQn5BG1PZ8Zfu2Fztx60
X-Received: by 2002:a05:6a00:a92:b0:749:93d:b098 with SMTP id d2e1a72fcca58-74ad4500c14mr5889490b3a.22.1750877944379;
        Wed, 25 Jun 2025 11:59:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEv/fci/aWABQPqIxId1qt4Av5ksAJmltuRXsEkge7A5PTFsk2rkR0SaCYSvzUz9d2gs7rt6w==
X-Received: by 2002:a05:6a00:a92:b0:749:93d:b098 with SMTP id d2e1a72fcca58-74ad4500c14mr5889456b3a.22.1750877943945;
        Wed, 25 Jun 2025 11:59:03 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-749c8872c7fsm4943244b3a.167.2025.06.25.11.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 11:59:03 -0700 (PDT)
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
Subject: [PATCH v7 28/42] drm/msm: rd dumping support for sparse
Date: Wed, 25 Jun 2025 11:47:21 -0700
Message-ID: <20250625184918.124608-29-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-GUID: ilSbiFTvKRfffJ0JVOaqqixAVilCiNXo
X-Proofpoint-ORIG-GUID: ilSbiFTvKRfffJ0JVOaqqixAVilCiNXo
X-Authority-Analysis: v=2.4 cv=J+eq7BnS c=1 sm=1 tr=0 ts=685c46f9 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=Oi01P0gpvwaEutKy2E0A:9
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDE0MyBTYWx0ZWRfX8uNCfg2XKv8y
 7hnyek3Q9WSns2vbcFSKiOpo5kny3cVqZ+xEwR1r7waB3pGZRlnleDFsIC4ousGSGxxSandSRpr
 4tycxlrAkg+rks1eGdPp0dCxwjWbNf4KB5/lItkTAKCHBNPb0pavIRcJ5kJ0zLwrEqhABGZo7De
 /buBuvOeIPjvxSerz821J7HHRP0keCMt0+52Bm3GXg8MHQqrpEpgFYCFeNKH8q+3cGKaBw13igf
 /l8HE+cPhBg0LoLSDJRbJUxyCw5u4CDMO90eLv/+0CZBXP/BxB0VYZEd6JlgP/9BrdZxb5A6Os4
 JM8TXPjOelPQ1EtMgu6AJXCGcDk7gw7cM9OUdXSVNH62Ow7U69DhrN7jOpuQxgoIwAsFXiKTtaG
 sdkCOExGiAWNrC7FSr5VcHz+lip+FuwmRCTSGQJuZP5mB3GL/oGcZ23E0XkSTtzwPrKR3hZn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_06,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=999 adultscore=0 impostorscore=0 clxscore=1015
 spamscore=0 malwarescore=0 phishscore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506250143

From: Rob Clark <robdclark@chromium.org>

As with devcoredump, we need to iterate the VMAs to figure out what to
dump.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_rd.c | 48 +++++++++++++++++++++++++-----------
 1 file changed, 33 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_rd.c b/drivers/gpu/drm/msm/msm_rd.c
index edbcb93410a9..54493a94dcb7 100644
--- a/drivers/gpu/drm/msm/msm_rd.c
+++ b/drivers/gpu/drm/msm/msm_rd.c
@@ -372,25 +372,43 @@ void msm_rd_dump_submit(struct msm_rd_state *rd, struct msm_gem_submit *submit,
 
 	rd_write_section(rd, RD_CMD, msg, ALIGN(n, 4));
 
-	for (i = 0; i < submit->nr_bos; i++) {
-		struct drm_gem_object *obj = submit->bos[i].obj;
-		bool dump = rd_full || (submit->bos[i].flags & MSM_SUBMIT_BO_DUMP);
+	if (msm_context_is_vmbind(submit->queue->ctx)) {
+		struct drm_gpuva *vma;
 
-		snapshot_buf(rd, obj, submit->bos[i].iova, dump, 0, obj->size);
-	}
+		drm_gpuvm_resv_assert_held(submit->vm);
 
-	for (i = 0; i < submit->nr_cmds; i++) {
-		uint32_t szd  = submit->cmd[i].size; /* in dwords */
-		int idx = submit->cmd[i].idx;
-		bool dump = rd_full || (submit->bos[idx].flags & MSM_SUBMIT_BO_DUMP);
+		drm_gpuvm_for_each_va (vma, submit->vm) {
+			bool dump = rd_full || (vma->flags & MSM_VMA_DUMP);
+
+			/* Skip MAP_NULL/PRR VMAs: */
+			if (!vma->gem.obj)
+				continue;
+
+			snapshot_buf(rd, vma->gem.obj, vma->va.addr, dump,
+				     vma->gem.offset, vma->va.range);
+		}
+
+	} else {
+		for (i = 0; i < submit->nr_bos; i++) {
+			struct drm_gem_object *obj = submit->bos[i].obj;
+			bool dump = rd_full || (submit->bos[i].flags & MSM_SUBMIT_BO_DUMP);
+
+			snapshot_buf(rd, obj, submit->bos[i].iova, dump, 0, obj->size);
+		}
+
+		for (i = 0; i < submit->nr_cmds; i++) {
+			uint32_t szd  = submit->cmd[i].size; /* in dwords */
+			int idx = submit->cmd[i].idx;
+			bool dump = rd_full || (submit->bos[idx].flags & MSM_SUBMIT_BO_DUMP);
 
-		/* snapshot cmdstream bo's (if we haven't already): */
-		if (!dump) {
-			struct drm_gem_object *obj = submit->bos[idx].obj;
-			size_t offset = submit->cmd[i].iova - submit->bos[idx].iova;
+			/* snapshot cmdstream bo's (if we haven't already): */
+			if (!dump) {
+				struct drm_gem_object *obj = submit->bos[idx].obj;
+				size_t offset = submit->cmd[i].iova - submit->bos[idx].iova;
 
-			snapshot_buf(rd, obj, submit->cmd[i].iova, true,
-				     offset, szd * 4);
+				snapshot_buf(rd, obj, submit->cmd[i].iova, true,
+					offset, szd * 4);
+			}
 		}
 	}
 
-- 
2.49.0

