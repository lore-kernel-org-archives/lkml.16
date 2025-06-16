Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3219D1E98E3
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 15:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750086019; cv=none; b=IBHAACNL+kghP8izGVHV5TQsOTvQRO5ayq4l0ua8GNeK1SN+olA/jE7judq3Vu5hXGyZwx5bPKSiZDoDocLMNvwtUDgekTu/wazk1QGIwiaoZZLmgtzVs4WcFkW2ZUY9sB/cYksPJt+4CnoxeDm4+Sobwgt9C+Nar+WMJfa65WI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750086019; c=relaxed/simple;
	bh=nXgUqQdyDTDmUCSlus96vQ7zp/8O8nNWvr6C6TQ8+ag=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C+MX8upNWWRzPXQEbOHl/Ep/aRrcfUzWIBtq/LUOK0pXQVv1wDc3adS2kzD3xAnyof25Cee8BZV74ZYyuiEnV+PCb/9DQOqpDGfw8NaAsbjilrIXawGtzCMAWwsD76suOZ7ZpcvK6EjKp1I+IRZwnJGoNHBytH8alYrqI2Wp5Ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZxbYSMFr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZxbYSMFr"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55G8SL3P010074
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 15:00:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=C2Mw8hDedlh
	HIu8wE01JvXGicmu3xM3Nu6IiIJHmMkU=; b=ZxbYSMFrn7l7CisnPoThSRW7Vr1
	6wo/B1bmVhyPYilbv6eAQ8x0DTGbHzQ3+P3PlfK6VD3uRlaBfkI7c9f2I45rYcCY
	/5+R0PYNux+VnLhw2uzm/2+wEEmDMtXAhWu5W1Xq4xBuJo44ua76aso1xfJ/Nu2d
	0vVCQPTTOy3vNv2AXPDpSzBJDqSKAYha34GRF6Ie5nvK9dBp/NTlHaJEkTxPodVG
	Yfq2h56XLfCGzdafhhf6PTeY8xnNFOmXCd7hvXO/X8ovJhkS4XvQiBtT3etYsNST
	Jgzg2ChR0cT4swJVH2uA52XK/JOel4yTa08r2FL1oQfagLZOtX5zoA5gLZw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791hfd0ha-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 15:00:17 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3141f9ce4e2so642319a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 08:00:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750086005; x=1750690805;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C2Mw8hDedlhHIu8wE01JvXGicmu3xM3Nu6IiIJHmMkU=;
        b=D9lL0OdQBBf/IpJbOvcnqlc+enS/F/iZkdiVfDkD0m5eh3qPcGB/7b73UHLTF/vFYi
         IjeALlU1kzq1UEKU5fweyfcstQCfKRTbiJegZCs4bhZ+MNwK8mE1srMpF0Lzl09lgkQ4
         hWMEDWVieiGT7nt2XNz0BqNzXRzxUjO8p65RpmxlYg9bc9ltqtAumuneJzRRUS4y+a4E
         zv3+QSfRvsqZuJ7X9s/3g4UOPBzeyC0WlaQwkGBKYGORVftayo1ww5CbZu7u+GvfToQ7
         5TkXncmGhQwooGsJkDQ8dWeq4LbNvOSBnzK0kcrc99PEoQesmCnW4YOAegJSvUto7mQE
         4fbQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHfcaYe6miOJ8L59tdJJiWWt1qvPDoKYCReJzyv9e+yCWOG98N8s0CF4MsjoY7wf7kZP58TTKA3zntiAo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTpKu8eawOU0CWs0gDWpd3Wyc/hTyJYBmnx5bl6EgGa1oSajRp
	oE5FOV1wVNODY/9CLPJCHE2PJJ8WSxaz9/fWMHK/3mGpruO0lh0Z7if4fNYvZGruNM0jLimCuLG
	VGkXCb7+de1WhvQOsiMatEQzSEoLPwv8NYm5N+g1HtmosNKVBriHmYewz3YtK4HFpZjs=
X-Gm-Gg: ASbGncssCLtRGZaD/n5Lhgw4Kv/VHiXlAVTwfo8RI9Za8j1anVh0rOATKKMSmes7fMl
	XDG3h8ORb7N1sbGFgZcGG+NO7KKT4rj/NIbydBH5fm0hhaf0bWaRJZ8NgVj1tg8MkbsXZsmy4DF
	1el3qQs2pRM8JVrCqVyVsD6E3jiSY0v1xmfR54XRWNe5wd0fr8S7bn6vswJe4gg0/J8HytVu5k/
	ZSDucZmmK9J04e2utPTWvHUk3/4/0mehVYT3k88jnoz5zJqIcEnc3eEnSmsS5Rc7ekGrcf+R1YW
	Z7gOeeBgpnEMOgqzr8rwageireHOjSnu
X-Received: by 2002:a17:90b:1b10:b0:313:28f1:fc33 with SMTP id 98e67ed59e1d1-313f1cd5a81mr16293971a91.10.1750086004605;
        Mon, 16 Jun 2025 08:00:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHhSwyYJbkfuG+cowVkLmWP7rTUfqw9+6BV4SQmAMwgYeSuRZuWklUdQ7zzXGTIOcmBX5tInA==
X-Received: by 2002:a17:90b:1b10:b0:313:28f1:fc33 with SMTP id 98e67ed59e1d1-313f1cd5a81mr16293906a91.10.1750086004136;
        Mon, 16 Jun 2025 08:00:04 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313c1b6d4c8sm8716826a91.48.2025.06.16.08.00.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 08:00:03 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Danilo Krummrich <dakr@redhat.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Danilo Krummrich <dakr@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 1/2] drm/gpuvm: Fix doc comments
Date: Mon, 16 Jun 2025 07:59:56 -0700
Message-ID: <20250616145958.167351-2-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDA5NiBTYWx0ZWRfXxKnspa2aBb/c
 1HBdEuQpPkPYDi/adbO6Zc7Tlp8D/VIojpLobhdlWNn+inE6FtlOKhWUYtVL5jDksNgbCBtfoaq
 4WHMgOdTizEm0pmjiMqUC5dg/vAbHSonDUBw5FNSjZNFIezlabgfppAwUEtzrhxJ8WrtEZOD6IY
 Bjl0rUYOkqvuoENrlWPj6Bcd9US3ufxHq2FwFJxH6eSEvRqw9ySiaUrbFUFMdka3Omnt62V6V0K
 q90K47mZEI2JKqXG21f8a6dMFx5030O0snDJTRzgPBKuKN+FbaF2+cX8iQvJmeg22Z/Kla9pqbu
 RaeuthbtGUidYhkuJUdHQ6W+/g/vCH95dt01O0gtssoHAPKt3gO01Gf8XwnurukH3ChbIXJL+E+
 8sy1ZrxHvlwRzP1LI2Nv1Pu4cArTBbR5fiIlH5ZKAui/klJqY9eEM8xHBRDKMWcpNGwgWvR0
X-Authority-Analysis: v=2.4 cv=VvEjA/2n c=1 sm=1 tr=0 ts=68503181 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=5Yek0j1-lJT91Je3aSMA:9
 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: MrhXGaLWJlWV0whYbhStb5nbqw6xiFFe
X-Proofpoint-ORIG-GUID: MrhXGaLWJlWV0whYbhStb5nbqw6xiFFe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_07,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 lowpriorityscore=0 spamscore=0 mlxlogscore=999
 malwarescore=0 impostorscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506160096

Correctly summerize drm_gpuvm_sm_map/unmap, and fix the parameter order
and names.  Just something I noticed in passing.

v2: Don't rename the arg names in prototypes to match function
    declarations [Danilo]

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Acked-by: Danilo Krummrich <dakr@kernel.org>
---
 drivers/gpu/drm/drm_gpuvm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index f9eb56f24bef..0ca717130541 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -2299,13 +2299,13 @@ __drm_gpuvm_sm_unmap(struct drm_gpuvm *gpuvm,
 }
 
 /**
- * drm_gpuvm_sm_map() - creates the &drm_gpuva_op split/merge steps
+ * drm_gpuvm_sm_map() - calls the &drm_gpuva_op split/merge steps
  * @gpuvm: the &drm_gpuvm representing the GPU VA space
+ * @priv: pointer to a driver private data structure
  * @req_addr: the start address of the new mapping
  * @req_range: the range of the new mapping
  * @req_obj: the &drm_gem_object to map
  * @req_offset: the offset within the &drm_gem_object
- * @priv: pointer to a driver private data structure
  *
  * This function iterates the given range of the GPU VA space. It utilizes the
  * &drm_gpuvm_ops to call back into the driver providing the split and merge
@@ -2349,7 +2349,7 @@ drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm, void *priv,
 EXPORT_SYMBOL_GPL(drm_gpuvm_sm_map);
 
 /**
- * drm_gpuvm_sm_unmap() - creates the &drm_gpuva_ops to split on unmap
+ * drm_gpuvm_sm_unmap() - calls the &drm_gpuva_ops to split on unmap
  * @gpuvm: the &drm_gpuvm representing the GPU VA space
  * @priv: pointer to a driver private data structure
  * @req_addr: the start address of the range to unmap
-- 
2.49.0

