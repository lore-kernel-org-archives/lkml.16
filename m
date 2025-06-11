Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D9B1F4169
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 16:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749658444; cv=none; b=WBQ0W7UvWCKS44wsMlDKmHJUnujf1GtCB5My3WJCnW59FIymMwR7KHFFlA9xATtRm6yO41MckYRxZt6Nb+wzTW4eYwg2b+tlPLQFEQGm+EVGbrEO2sHofGjjhyzqvRb/budgvcQqGZtxEn7bTOwc4sHVCXmE5U4Tg1Se7yx1NiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749658444; c=relaxed/simple;
	bh=2yrDMcy47m3okG6GDzNg0nEycBup6VJdleVS9+J2zns=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bgevhu2ik28jdfaypYf47f+ePrtkjUnzQBJqIlLqHO/ndy1RoNQ309SWIbxKvmIB9bZAm+0wZy4JqFFqYAd9bEQEk404EdUyBrHY2+9ZxsApgwWHldlCQzNvx/omDEYFr3WKCzzkFhYg46YZZcNXw95LcO5mI0JDCBqb9/qcias=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S9nwzEEn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S9nwzEEn"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55B9DE6M026004
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 16:14:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=IzZh7++TWPnt7YAqqfAhzt
	YsaqI1nC4j1vdMdoyOJp4=; b=S9nwzEEnytmD5lsY3JIK/u2CxjjnuBzwa2Z4K+
	En/lXI5srBKNpC6TCq81bBvRIs2kl2iTorlABiOoBrB73JPxPRO8pQ2MMDXbZSdj
	/3pkzw0KNnMk80rSIpIoL/csMMouRrMWK42SGare5klQ7lMd0iMxuQskVp5JpJ3+
	quST39cipuIM/aldhh3TpSVaNg41pVuT4LY8zaftX4VNppysWhNUKaqCAuzAYWoH
	cZ0LX9sc52OrzgBBDa5dckOoW6alBlcfKTtSC+BrPlfShG3WoeMi5qL+PMuZd2Yk
	qJzzFl70vd6H16ZyCeDe9ahEZr+8wX3mE6PIcmVUTMk3pB0g==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 475v2y8ed1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 16:14:01 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-747d84fe5f8so21971b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 09:14:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749658441; x=1750263241;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IzZh7++TWPnt7YAqqfAhztYsaqI1nC4j1vdMdoyOJp4=;
        b=fGlFmd6CUr5R4z2CYFZKdV78sC/pymPs3agDDaii6KJalWQXXwmHejSqz2HBKlxW/D
         MhgKtqFvN0C1H8FFAUFQEkq5gFjVjhWej5+qOVAoSFyci5yQ7MdTumgKxuJVpGOEaHyx
         UFHeosgkiqzjPlvcLJWrRd+zHNXxJt5G5ba82QBkBahN+d26G6HEYiSbnSn7KwJL2FFT
         8lQFIO3tFCCIcFKLzxF7tfA912kdYHLOzVfY04xJArbET49DJGFNM86qRwSDW9QRdjHo
         dzF84c2OPhfGBFTRcUz4faNVqd67p+wLfZTw4l3Q0ICSuqpNzt+7ECH9qH2RCn62opFI
         IoLg==
X-Forwarded-Encrypted: i=1; AJvYcCV+dVHLLG7OR28OBtju2PwuyW4hChMzGc4DwNsAvRd0+OVCd1wWNJ4YJYxdOxpLLfzjlzgoPpvMiKebD2M=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOuuWAH71iPoY6hzHNcnqmqHPx7F9/cyNcr4VH2ITBc2e4a2vj
	GYKVjM70L1VmPQB6phhvdiWj5IemO3LNgXTYaOn511bQPDbKrPYYKRmx9dbq9vt7coMjQLNJ4Nf
	l3OB5JmNojC3GVOhYz3z+mhnGZIKRPLtQUzh94pOtCrY4dvKFXeNvHZf7b2VlJccRJI8=
X-Gm-Gg: ASbGncuBV3OjNkCwW9rbpdDJBH/KeVcnwV2VsV4n77xiMZYpQ08Sz0OZ07a1g9lBTpU
	PeLbdchxWrlRo9cRyldQo30i+D5zqmZ0jJs7FYaAYae/Kw+lA7fRvDEHX4/6nm9pq1HcMngmhIO
	9bhgv0C/Wc9tt3d2IRCzadyoaMhXfQZCAs70bpdEORS+pMFALi7nYuOFLq2663KfLqwKNMvUAEJ
	Xmq39XwlUIoBNRSDb3w4xnObIsCaO0ARymThOb9Su/j2jZwFj+Cc9aF/szqI/+mNnjPK2BgdWJH
	qlg4P0/0sdrIAFKh2wgRNUhHjy6xvIgcu0yRP9rmH8+AYxRcbXD3Ns+rWPY=
X-Received: by 2002:a05:6a00:2314:b0:736:a8db:93bb with SMTP id d2e1a72fcca58-7486cb21d0dmr5341545b3a.5.1749658440958;
        Wed, 11 Jun 2025 09:14:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH/6SRDJJ5564j6vwuGUZRBSXLBvt48Y+4pJb7MX/NqEakaLAuxT3fRBYYzZ/dhUftkuTCdKw==
X-Received: by 2002:a05:6a00:2314:b0:736:a8db:93bb with SMTP id d2e1a72fcca58-7486cb21d0dmr5341521b3a.5.1749658440551;
        Wed, 11 Jun 2025 09:14:00 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482cdf1c41sm9443708b3a.149.2025.06.11.09.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 09:14:00 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Subject: [PATCH ath-next 0/5] wifi: ath: Add missing includes of export.h
Date: Wed, 11 Jun 2025 09:13:53 -0700
Message-Id: <20250611-ath-unused-export-v1-0-c36819df7e7b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEGrSWgC/32NQQ6CMBREr0L+2k/aIjS68h6GBbYfaSIt9heCI
 dzdygHcTDKZmTcbMEVHDNdig0iLYxd8NvJUgBk6/yR0NntQQtWikQK7NODsZyaLtE4hJrS9vNS
 NsvJRaci7KVLv1oN5h1/d05qgzcngOIX4Oc4WeeR/uItEgWToXFmtje7VLTCX77l7mTCOZRZo9
 33/Aq7uSK3DAAAA
X-Change-ID: 20250610-ath-unused-export-df19562d1b37
To: Jeff Johnson <jjohnson@kernel.org>,
        =?utf-8?q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDEzNiBTYWx0ZWRfX3ohqgPePxjdX
 t2vtC2Ogyi3DxYcj8yT3O7ZpS865ee4zmc6glNzZFx260+MurxzkOkYR40/oecM4wZE95aZyF3B
 zL8wmix7ImbxKau2bhowWL4ZVOtOJdxEdxwMMpzyZPwvjYfJRarksewJdoq9CWpQqmxwIATTK2o
 BNBsCW8TpDGU/297zr7KoQcv2VMtB+Bx5cteriw4W8YPOLVi8YmfWW4BO/LcQsLQwMNa7WHkscy
 bDsHSPbSj5NCfTis94zf198ikNfVgaSEllFZnKKG2SFS/fBYplp1Xev0dM0JzkbAYyfLlejQDnB
 S35WYk+dzypglUqfMsN2CFByp2Tk5k78MVh2deXyybURT2BveAlyDMPz42rE8A5ddTxT0Cy5Z3w
 96z8S44z6SyEYUux0pYA9mmcYmPf3oFPjMFXK3EiJCsyfiGR50/zUIeLuu/WBfngeEo8ecY9
X-Proofpoint-GUID: APOnqxuyjhDwDTsHe5Vkn3M57Z9BYwCz
X-Proofpoint-ORIG-GUID: APOnqxuyjhDwDTsHe5Vkn3M57Z9BYwCz
X-Authority-Analysis: v=2.4 cv=f+BIBPyM c=1 sm=1 tr=0 ts=6849ab4a cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=pn7C01q4hUtA5Nn5QkAA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_07,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 mlxlogscore=619 bulkscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 phishscore=0 mlxscore=0
 malwarescore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506110136

commit a934a57a42f6 ("scripts/misc-check: check missing #include
<linux/export.h> when W=1") added a check which is now generating
warnings. Fix the ones in drivers/net/wireless/ath/...

---
Jeff Johnson (5):
      wifi: ath: Add missing include of export.h
      wifi: ath9k: Add missing include of export.h
      wifi: ath10k: Add missing include of export.h
      wifi: ath11k: Add missing include of export.h
      wifi: ath12k: Add missing include of export.h

 drivers/net/wireless/ath/ath10k/bmi.c            | 2 ++
 drivers/net/wireless/ath/ath10k/ce.c             | 2 ++
 drivers/net/wireless/ath/ath10k/core.c           | 2 ++
 drivers/net/wireless/ath/ath10k/coredump.c       | 2 ++
 drivers/net/wireless/ath/ath10k/debug.c          | 2 ++
 drivers/net/wireless/ath/ath10k/htc.c            | 3 +++
 drivers/net/wireless/ath/ath10k/htt_rx.c         | 3 +++
 drivers/net/wireless/ath/ath10k/htt_tx.c         | 2 ++
 drivers/net/wireless/ath/ath10k/mac.c            | 1 +
 drivers/net/wireless/ath/ath10k/trace.c          | 2 ++
 drivers/net/wireless/ath/ath11k/ce.c             | 2 ++
 drivers/net/wireless/ath/ath11k/core.c           | 2 ++
 drivers/net/wireless/ath/ath11k/coredump.c       | 2 ++
 drivers/net/wireless/ath/ath11k/debug.c          | 2 ++
 drivers/net/wireless/ath/ath11k/debugfs.c        | 2 ++
 drivers/net/wireless/ath/ath11k/dp.c             | 2 ++
 drivers/net/wireless/ath/ath11k/fw.c             | 2 ++
 drivers/net/wireless/ath/ath11k/hal.c            | 2 ++
 drivers/net/wireless/ath/ath11k/pcic.c           | 2 ++
 drivers/net/wireless/ath/ath11k/qmi.c            | 2 ++
 drivers/net/wireless/ath/ath11k/trace.c          | 2 ++
 drivers/net/wireless/ath/ath12k/core.c           | 2 ++
 drivers/net/wireless/ath/ath9k/common-beacon.c   | 1 +
 drivers/net/wireless/ath/ath9k/common-debug.c    | 1 +
 drivers/net/wireless/ath/ath9k/common-init.c     | 1 +
 drivers/net/wireless/ath/ath9k/common-spectral.c | 1 +
 drivers/net/wireless/ath/ath9k/common.c          | 1 +
 drivers/net/wireless/ath/ath9k/dynack.c          | 1 +
 drivers/net/wireless/ath/ath9k/hw.c              | 1 +
 drivers/net/wireless/ath/main.c                  | 1 +
 30 files changed, 53 insertions(+)
---
base-commit: 2b404d0c06adaeeebd355bd727ef600706b28197
change-id: 20250610-ath-unused-export-df19562d1b37

