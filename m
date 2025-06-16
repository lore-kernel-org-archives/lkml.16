Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D79B21D516C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 15:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750086018; cv=none; b=PtqRV3tLkbTMzlFX29sG45MIpnScsYhSK09mrZf+mpqvKkXL+KrkaMnKEBT9kKxK5HNDgJ2VjcS7sgjHKGZpcWaxCve9EXqfLCEikL6Bxy8sBYi2Rebg+QLa1ywFcIWsAIYRq1jrsLSPD8tCq8fjpbKZ7+dUf2/UeabtNEZR4f4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750086018; c=relaxed/simple;
	bh=XUa5fu/r2ENmgcJG+2qRElP/JPIBa3Wp3LBdxvtfB4E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KoI7k4VPIvuw5nHXOli6bE3qrXRopfODMiCcExs/Uhlx5OqI7Yz9mTTv4nna7tD7fIK5ol+DDKmxZnVJoysH5eTjd+LabtB0sa116f006UfMWPHiBXow1ElJ3F7hrwz8/7Vhku27WbQDhXJL8uit5zdDWUk0aKHEwXwrZDrLgUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Haj0Tu6M; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Haj0Tu6M"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55G8RBxX011469
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 15:00:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=xbppaUr2NrQq7pTt21P6ALoliC5BeUqVa1k
	k21RgCQU=; b=Haj0Tu6M2xT442eQDTceNCrrrvqsloZgSta/oVj2dnQjY1eEU1O
	LTB7RKgx0Xpvxr05RSyqIn5AI/dRbaONgTEKXxarvHv3+kLXDbVWvTZR1YoZ/Cat
	Eva4xLN9pWtSK3+Jq4SCCnIf5dpDd5QTRe4oUMCbCJ1AiDKwGVJ8Nd5koS6xIyNw
	j4iO53knWFtI8XUsJjQD+UycKDrfzUHGsAmAVSo+iwfsUAuUvwxYOBS9WTAJDyTv
	cO5rgKLRLwPYzLLLHjSziU0frmFgOnQ9k47RpeqAZApdG0akwiLBULuOmbMA4Gkc
	wwj9iUuaSCyprJgLyNLqWeM2/oJEt4zKZYQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 479qp5khe3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 15:00:15 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b3183193374so1306858a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 08:00:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750086003; x=1750690803;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xbppaUr2NrQq7pTt21P6ALoliC5BeUqVa1kk21RgCQU=;
        b=eg5C34oKXVAcTIvIJGsj8ekxYX10hzk5uwuNuedMogbhO5uQepUOgGH4XRmlWtpiXm
         WUz7ATJo0Kc7MXpwAHC/g9oyZXsT3234gtrKKxJtfowsLZMjX52IEJiiCuCPvLucKzG2
         lwrdNO9gh25EM4nMdeuJwUNIDUtCHMC21JuD1KlauDKQo+Up5IMMXLrWB2BznUuuQYX3
         UUhesLyX+bKoLCTL9+dAZOHNwMBo3O6+O9hnJ7WXnFDg1C+P7wY9JXJyZwf6JTMGpjM6
         FNat+wljcj4OA+/IZA5YvvOCnjpZDPw8IrStCUsBSDYGYDrDWjqfoIYeHNIzfJD+zPtU
         WbWg==
X-Forwarded-Encrypted: i=1; AJvYcCVCBYJ5NzBsS6adT57zRkh6eFHhODf8Aa46/fRyDxX0TaGVsK/G8hp7zPQoYiSrNRRqtIA9wolTAgHNReU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKcLaXoOFH9znjsGfRQH2t7Ewy1fBZea4nYE/fHpRgBVZXbNic
	6qHn5w7n0t6p1OEwnvGeb20vy/1y9V2iFcsKRWUQavG4TpPCZ25NMo91KBy2t3LuM85DgunWLYy
	kMBPpi+uYM06/9xY1RagEwovX2eZ1P/MU+l8qdpEKgcOGIBQuZCszW+ULC2zExDNMnWw=
X-Gm-Gg: ASbGncuXJonljrfq5RNQvdQVlakri+Os+QlSRdhz534oYgYeMAoL0wuCwvNCI0Ky5Kb
	BumoCdiWb6NRdz/C0ikU+PD2GmEUGSoM6rYH49cghstkRYiLsYPqjMquqv63UZkh6g9IPSI/9nZ
	lGxq7WehcO2cGl3OGWWaAM0dGaJ2rVA9hf76yWDqEi8sWRubLAigrAgslrSfFNSWhlWQJcmFhCH
	iIcoryz49QujLDABil7mtWJt6sjVOKP4LJ3Zp0MCt77kGP6fuy8nmkjmtilWFAocGjHbByLiM+N
	Z22sZBbP6aOjt6dwoZmRUnaJGRwP8W6M
X-Received: by 2002:a17:902:e5cf:b0:234:cc7c:d2e8 with SMTP id d9443c01a7336-2366b3c3897mr135204955ad.37.1750086003233;
        Mon, 16 Jun 2025 08:00:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGByieJvQC5PoCbVHaqizg7yUTH2Fgq/z/jFnF1lZLOWUWRn/2Xz6BKqzn/JxUX+pb3is1aaA==
X-Received: by 2002:a17:902:e5cf:b0:234:cc7c:d2e8 with SMTP id d9443c01a7336-2366b3c3897mr135204465ad.37.1750086002816;
        Mon, 16 Jun 2025 08:00:02 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365deb0fc2sm61892525ad.180.2025.06.16.08.00.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 08:00:02 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Danilo Krummrich <dakr@redhat.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        David Airlie <airlied@gmail.com>,
        linux-kernel@vger.kernel.org (open list),
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 0/2] drm/gpuvm: Locking helpers
Date: Mon, 16 Jun 2025 07:59:55 -0700
Message-ID: <20250616145958.167351-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: EfntFbD6xz4RUYi0XZR5VNQgOeLfoXYn
X-Proofpoint-ORIG-GUID: EfntFbD6xz4RUYi0XZR5VNQgOeLfoXYn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDA5NiBTYWx0ZWRfX/4I0LmtmgSoE
 L17y2bxyh71elszDpczpdkGwdTh5gTdYBgUrTrOgalgRYIjGuX+K13KvBxJM3mT/U/U/g/qF4wJ
 SZGTfW7+1tgaxfxuJTxwG/897e5OPxG9wPDEAEFJUPly8JZYCU8stF1zbIixfbZJ7gLDmrWx9jb
 OA0IfKZ2cR/FzHH+HheNc9UqGzKmKnv1f/OHh6ut5pM3BXbpsHxzU1U8mGNIOepVN1NQQyJAFdZ
 7FlUhfycVCGXOqZZDDJ0K/NG93eUXZuV9IsF8b4B3kb9W4LThHfiTNCZw7EJxClQGU7uuiON1nj
 oPtbcx3SttbWBfe5XeDwPOcyCrzTMC2GiKkb/FQLd9gV8L0iz+COc60v8DAuuH0R7vh+ds2u+JU
 aWlZMNjCkh17pUiP0BWytSb8PJDgzwEMb8iU1VJhss7ufQCbkPnw0GnZ2IVDxa99X5zJUGMj
X-Authority-Analysis: v=2.4 cv=fMc53Yae c=1 sm=1 tr=0 ts=6850317f cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=GKy6C-6KEHNy0sv7olcA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_07,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=888 spamscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0
 priorityscore=1501 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506160096

First patch is just some cleanup.  The second patch adds helpers for
drivers to deal with "invisible" unmapped BO locking.  Ie. a VM_BIND
ioctl won't explicitly list BOs associated with unmapped/remapped VAs
making locking all the BOs involved in a VM_BIND ioclt harder than it
needs to be.  The helpers added solves that.

Rob Clark (2):
  drm/gpuvm: Fix doc comments
  drm/gpuvm: Add locking helpers

 drivers/gpu/drm/drm_gpuvm.c | 87 +++++++++++++++++++++++++++++++++++--
 include/drm/drm_gpuvm.h     |  8 ++++
 2 files changed, 92 insertions(+), 3 deletions(-)

-- 
2.49.0

