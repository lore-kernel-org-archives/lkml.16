Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD6A24DCF3
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 14:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751206102; cv=none; b=dSiVW/m8qFdcwAmncN5ih7nTzhsAtXSHPF2aY+kYUVZ0zCgZi2rNFjT9VN4eJij2esSWURqJmESmdCIYpjo66mZK1RVZCUd50GXy5Bkqih3JuM1rzZb2UkklPd8qPB/glFrbN4/59XP1C7YD93hG8v1L4o73TYFD+XQM2JDPv8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751206102; c=relaxed/simple;
	bh=ayKPNIzMHytJlMgLXTS3H2whkdxFm6qzz5vdQc2N/d4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RhsdIfqzQCPDHvPMK+iIvkMLrAiPfY86tSfzVmGoqx2dx+s2+XYmYNfeOuwFYgbDy3qwZBjmTUUc9A/fQS/94jdMRwHpieGchq2yUHLdGcGT/JB08gRRtqQOqOAGMyCiiuWH6SlULichpd+m1NlQFz/u+KAGwB9vR8SvnrwQDzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BrLv/1jz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BrLv/1jz"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TAEeHI024207
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 14:08:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=k07yEnAyEzE
	a9/0q+Hpj8bv2+DIU1Tpq9KBSOGFREQM=; b=BrLv/1jz9HuoGFdTMkip3HYRli4
	mZUyfD8ATY8tG0dbrEqCF+eY7hbeRdvP5hBt+g0GP+PkyDeJL5+LuxFHp7KBU9kh
	xCu4c5ivPZtVQuGgC736sAROPGlmBn9/gMAqJx/5Aiqm8kgd/1v1kExS+jQh+6lc
	JRxd35QrvyQPrCj1nEeMyXIhX3zT/vUZjUaGlMOoo2YXmXSi5jGBQuEY2aIAK74J
	+yMjdY38vniDkBYiBow/vCT8ll/bSMOn7aif0pRjENgvU+ZqfsL/nuzS+MwmReXM
	Evn4MUrEY4AYWf7XaOQgS7HLaTqKXlGtQ7Ir5cBt83nUXr7R7ozV32P4F3A==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j801t7u0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 14:08:19 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b31c8104e84so1017510a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 07:08:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751206098; x=1751810898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k07yEnAyEzEa9/0q+Hpj8bv2+DIU1Tpq9KBSOGFREQM=;
        b=XW/qmpad3w6T+/Lcp96xiaXrK0czAuJfVU+t/w1mIU/d2f1nf0FCtBFDdD4QeF/Vve
         MlPErhg5VhEGlkOomxDxaYg/XWAJ8J7FtFSYJQkmxPezm5HS3K3PF3YucJV+EDRVHoGs
         hjvEtI4bcpGNhVRlVOrhzNmTWOOw2hxtOf2BQso8818xuWcrIugCl3sz6bCN4OMGIxtD
         oAaBJ5uUGULBqUnqkOiyvilR/exJ8VV1+1EpBUC1o3fgY1utjhBFtXAAKcOqH9BYU9xx
         qxfsqHVmwnyWZ2h85ucoPLGgD26CpdCBOMox9oCWub8T65JlhRR/4Gcm/OJERk3Jo6nr
         ngdw==
X-Forwarded-Encrypted: i=1; AJvYcCVzU7R0ktE1DphzqsQStvUx8SiCFdPokHUSL5fi0qED5kitKpjdsMqtwJQLmM4VcdMxkYgEzx/dxp7U+9s=@vger.kernel.org
X-Gm-Message-State: AOJu0YxsFq5rGbQonLrH74JWK9ydj8rS2mEl9IrJdji+/GFOmW46cFjp
	Qkcba9cKJrZL8xRPkBlewxqx4MmhrbEe9xJ2HA1aWQgZjSS+HcMPoviO9bchAJuljcYE6ekFxtj
	T6ajS8B1axiek0tT7VZ+zKKgZjDlRY2B9cHIX6juhPpXPV7YWO2xpy8x3Skf//it2iqc=
X-Gm-Gg: ASbGncvACJ3uZ3/JjcBbhrykI6TbPIG078A5Y77nYm2nMMY2zjX7S4niGWY3aW1V62B
	zcLlCRGcdqg8vzgRO0lnXMQD8UMIfXxBRO8KLbGIQ4FIwalfdYFoDvlwKNx8sp0qeuBRb0zHN5v
	9EPbh3SbyIRhVMQe+uDMVcBidaes9YHYRlZovB/6k5xZHUeKtHVKcifFvxL6+VhCUkfmmVs2yWy
	L/CMhbJKrtU9ruqHp3tlV2ytXUkI09n7ucVxqZYAZggpN3KdSbW9AIbXVo9ORR/tsDpFYYUP1bU
	2E6COUmZY7n8RV2oSIlIxZ62LUkMByhi
X-Received: by 2002:a05:6a21:393:b0:220:33e9:15da with SMTP id adf61e73a8af0-220a12a6673mr15927711637.2.1751206098442;
        Sun, 29 Jun 2025 07:08:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFUhzRnC2Gzmes1F+eCUOlvqyKWiSWRnUQbOPPUCyCwcoSzMtVgC+1PBHnNQkUf+FfAkfUkNw==
X-Received: by 2002:a05:6a21:393:b0:220:33e9:15da with SMTP id adf61e73a8af0-220a12a6673mr15927685637.2.1751206098054;
        Sun, 29 Jun 2025 07:08:18 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af5571b7asm6905338b3a.85.2025.06.29.07.08.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 07:08:17 -0700 (PDT)
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
Subject: [PATCH v8 40/42] drm/msm: Bump UAPI version
Date: Sun, 29 Jun 2025 07:03:43 -0700
Message-ID: <20250629140537.30850-41-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-GUID: -gN9_DQKWKBfdFdee3-OC006cY3UIYOS
X-Authority-Analysis: v=2.4 cv=YPWfyQGx c=1 sm=1 tr=0 ts=686148d3 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=KgEaFMypzpKrXJt10QQA:9
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: -gN9_DQKWKBfdFdee3-OC006cY3UIYOS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDExOSBTYWx0ZWRfX0FHX3QwfSIDi
 ns9PT3jolTF2iKHZWJ0jJf4+5rCV+dJfMMRPaArS5d9ZGFxulCwD5rGJck0TBqLeEq0qTS6XkRs
 k08OfgAsSuoKCDOeii+lKuu7KZPln6By5wRRQ9fVoL5vV7K91t3tkrJeDHdGCgkTEuucwGv5uCJ
 J5CNPknUDld8r0d4JTpRQmA3M+rIBEiSaKe/R2OpWA3I528y4FCAAN5Sz+wjdkh5PIwxmM3zXpS
 FlSszhdY99NlrtsqCjoq4zTk15d7QTUuH1PwHbArKWJdR7YHb5xyl/Wd9D7bWyMCIUuGlxL4f62
 PPCHShWAuOSctqlu+qJ3pB+Md4W7manVxP/4XGN/66g0JqgPcQgNIVHdeLoa1vonRdUs+hOp/iz
 7hlIw4CRPmvYdUq2z+rqclrC6Xjkovn/UjiKbXrTJ92Z4v+SHPylmwx16FEpVkgecAdlsVrS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506290119

From: Rob Clark <robdclark@chromium.org>

Bump version to signal to userspace that VM_BIND is supported.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/msm_drv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 7881afa3a75a..9b1f1c1a41d4 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -41,9 +41,10 @@
  * - 1.10.0 - Add MSM_SUBMIT_BO_NO_IMPLICIT
  * - 1.11.0 - Add wait boost (MSM_WAIT_FENCE_BOOST, MSM_PREP_BOOST)
  * - 1.12.0 - Add MSM_INFO_SET_METADATA and MSM_INFO_GET_METADATA
+ * - 1.13.0 - Add VM_BIND
  */
 #define MSM_VERSION_MAJOR	1
-#define MSM_VERSION_MINOR	12
+#define MSM_VERSION_MINOR	13
 #define MSM_VERSION_PATCHLEVEL	0
 
 bool dumpstate;
-- 
2.50.0

