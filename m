Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98DB621129A
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 06:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744092406; cv=none; b=F8zdMz5RgNdvdxJZciVe7h5z6YBnjjhqhTT0Y07fqQV/0OYouC0yOmq+s6aDb9NiRElO00vp4RWz5ZgHzIJej26p4rhKleCU4/3gVI4q7DPz8L2ZVikY8tqR4T58K+GhTHUPQ/u6yI/6fg5sc8/liqxQLAUIq/5yOcZAEr2UdlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744092406; c=relaxed/simple;
	bh=CeVpOA2b62RgSn3idH2D7jjGpJdQDZhB6loS4rC7hUk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kKROhgCzXpSGw0LqUPKqdN15ODHN2aVWQxP9UCZNZ1sbRzwIcbE40B23Ki48t3StzaZyf5CbI9VWcIqO22xBIvBuoLryZxQQ5sgl9jvxpeabSQds9exP4nn9aNtnXZ6/QH04DKz+30X3IGJUOF56br31vM14kyOrIPhx28WjuA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AdrrdRgd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AdrrdRgd"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5382GxFJ022441
	for <linux-kernel@vger.kernel.org>; Tue, 8 Apr 2025 06:06:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=rPJvbK708nKLqv7QHHGj//
	BT/jZMd+wf9IwoNFeDmZg=; b=AdrrdRgdaTlk/sJkmnZqf4pX74Rp6uWoz2dahR
	WUDh7bvIPxySJUMZtrcWa/OXD1vvAEemkxsosINC93hkTUPYuYTTHc9wF2v29FFr
	VY7KTtOcDUB0qcj2+HBoB1T07EF82oS7rQ0fHfpgcycNdmJtlvQ9FKfDjDmKHMc5
	N/kWNi8XC1gFG0jQ7+sh1oXMKvUswl8lQHBp/IluJrR1vGoCLMKVMw4ZFjC+RkWu
	jr0etUqOkowc4SwNAp+E2IxkQ0CHrE7ktDL/EQ6dTrIPcCnFV8fDeqXBU5Mt7mOj
	wpXzd9lyCSiu4vAE7iD0j0Cq+N2wgjyf+SIbYVqFqI7Goi6g==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twfteknf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 06:06:43 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-736d64c5e16so4542377b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 23:06:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744092402; x=1744697202;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rPJvbK708nKLqv7QHHGj//BT/jZMd+wf9IwoNFeDmZg=;
        b=RWtExGpMlI2CfMCqbkelzXIyy0TVzbmVNDtLJYYxOd7gqyZjDQ2m7FkZE6LINqIiE7
         1gSxKwf8TT24y5pRXPkc6xSuyD0lb+b8XHPtutSRZHn7RzyPOZ66n8GfWi5aVbrgPlP0
         ozOPPT5KBxAUV1kOJwAEq7r+b4E3VVw3JkTrD+TG6+H873CyAm3XlPjvhcCY5XxeP0AU
         Uq01DeG3Wx3cZcwuTXu6kjiktjHik7e4Y6HnPZG62WRtlMLW/WeD/NProKKscAq5vvSo
         +F2yYULJae9Y1UzUu5ArDREnW5mPHoxmJ4ov47iQZqvuRIQzo2LwArSfPxPI+xL72DEy
         zK9A==
X-Forwarded-Encrypted: i=1; AJvYcCX7SZLw4y7yGySBiieEueQILk1JA5jfehk6Vt9M/XXPXGxocbpsLBNJeOb7PuKw+vRXMzJnPboufvP5BoY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwbzF7KoUIo47KFEzeIA/4pt5Y9jAKTGciNwCTZoRGLyxbvgn7G
	kIgyK5otzzO/oQ5/AJvoEBtPMS+CyHavgenDRW3VB5YfolO0We9VVOxgJQGw3jy34zdfADiG+W0
	xrPLzp0uW6RQO98mgKhVb54nymLKBqR+grcCgtGv4EsBzxU05idZyNkTt0jelf/Q=
X-Gm-Gg: ASbGnct4tNLWdXH4tGNVsryJK+oIDK/1CQDzpn8RiRM4IhesYiAM8AmOBtXBOqXACUh
	XTsNjXMiAR2jEqstd1rek6hYN/Dh9XoPjGJSvwJZYoYkeoqHtnO6fL3cGbuz9ap8ZGoQMSiFvln
	vVL11O2n6Cwf79o2wvTR1L+GRbv3xcnbMiWZ4xCEhuaDzJ4r5IVaDKlaYbWiDP3VLsKljBwZ4u0
	i21kaR871MgC6ZeNtL7I4YvYv3dDMQ+XlprGsNha64nEaC+wI+mt8MBvcvvl7tDrw6wup9Me2KV
	H5gHERNIMijsP8qpeO4lhshHapo5eJ3VVpGk3IBBjA2I7cfc68r4ppbTkNPx3VGDUDFx/nIwujI
	I0w7Z+fTKLJQLvyrGX3FqMJ21CtXJaiXXVnKHl3ef
X-Received: by 2002:a05:6a20:c78e:b0:1f5:535c:82dc with SMTP id adf61e73a8af0-201047315d9mr18142219637.42.1744092402514;
        Mon, 07 Apr 2025 23:06:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGDQGkfHHXHzQnzn2S7sZR/SlqyFD4E76f4ItSX8gh3a16V1yPXO+CG98vBVOmnzhJbyAvBCQ==
X-Received: by 2002:a05:6a20:c78e:b0:1f5:535c:82dc with SMTP id adf61e73a8af0-201047315d9mr18142189637.42.1744092402103;
        Mon, 07 Apr 2025 23:06:42 -0700 (PDT)
Received: from hu-adisi-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af9bc35079fsm6863981a12.41.2025.04.07.23.06.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 23:06:41 -0700 (PDT)
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Subject: [PATCH ath-next v4 0/9] wifi: ath12k: fixes for rmmod and recovery
 issues with hardware grouping
Date: Tue, 08 Apr 2025 11:36:28 +0530
Message-Id: <20250408-fix_reboot_issues_with_hw_grouping-v4-0-95e7bf048595@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOS89GcC/43OwW7DIAyA4VepOI/JmGRJetp7TBMKxA0+DDoga
 acq7z6UU7VdcrQsf78fIlNiyuJ8eohEK2eOoQ7Ny0k4P4aZJE91FgjYKFS9vPDdJLIxFsM5L5T
 NjYs3/mbmFJcrh1mCw0m/dWPbd1ZU6JqoXu2RDzEWLwPdi/isG8+5xPSz11e172uoBQXDkdCqJ
 MiL1QM50E2r6P17YcfBvbr4tQdWfEIRDqFYUdtN0GlrcUT8j+pntDmE6opqHECDVf00/Pl027Z
 fRrvTnIoBAAA=
X-Change-ID: 20241218-fix_reboot_issues_with_hw_grouping-0c2d367a587b
To: Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        Kalle Valo <kvalo@kernel.org>, Harshitha Prem <quic_hprem@quicinc.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=B5+50PtM c=1 sm=1 tr=0 ts=67f4bcf3 cx=c_pps a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=3fJN4-It2fq8u9xqJHoA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: qdfvI_4r6OExKwfIazMlICVUe7CKBKMC
X-Proofpoint-ORIG-GUID: qdfvI_4r6OExKwfIazMlICVUe7CKBKMC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_02,2025-04-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=996
 suspectscore=0 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 lowpriorityscore=0
 mlxscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080042

With hardware grouping, there is a kernel crash with signature -

$ rmmod ath12k.ko
Unable to handle kernel paging request at virtual address 000000000000d1a8
[...]
Call trace:
 ath12k_reg_free+0x14/0x74 [ath12k] (P)
 ath12k_core_hw_group_destroy+0x7c/0xb4 [ath12k] (L)
 ath12k_core_hw_group_destroy+0x7c/0xb4 [ath12k]
 ath12k_core_deinit+0xd8/0x124 [ath12k]
 ath12k_pci_remove+0x6c/0x130 [ath12k]
 pci_device_remove+0x44/0xe8
 device_remove+0x4c/0x80
 device_release_driver_internal+0x1d0/0x22c
 driver_detach+0x50/0x98
 bus_remove_driver+0x70/0xf4
 driver_unregister+0x30/0x60
 pci_unregister_driver+0x24/0x9c
 ath12k_pci_exit+0x18/0x24 [ath12k]
 __arm64_sys_delete_module+0x1a0/0x2a8
 invoke_syscall+0x48/0x110
 el0_svc_common.constprop.0+0x40/0xe0
 do_el0_svc+0x1c/0x28
 el0_svc+0x30/0xd0
 el0t_64_sync_handler+0x10c/0x138
 el0t_64_sync+0x198/0x19c
Code: a9bd7bfd 910003fd a9025bf5 91402015 (f968d6a1)
---[ end trace 0000000000000000 ]---
Segmentation fault

This series aims to fix this stability issue. With this now, 100+ iteration
of rmmod and insmod works perfectly.

Also, firmware recovery with grouping is not working fine. Randomly, some
NULL pointer crash or another firmware assert is seen. This series aims to
fix that as well.

With this in place now, 100+ iteration of firmware recovery with one 3 link
AP MLD up works fine.

---
Changes in v4:
- Rebased on ToT.
- Fixed potential deadlock warning.
- Moved to oss email from quicinc.
- Link to v3: https://lore.kernel.org/r/20250124-fix_reboot_issues_with_hw_grouping-v3-0-329030b18d9e@quicinc.com

Changes in v3:
- Rebased on ToT due to FTM changes conflict.
- Link to v2: https://lore.kernel.org/r/20250120-fix_reboot_issues_with_hw_grouping-v2-0-b7d073bb2a22@quicinc.com

Changes in v2:
- Rebased on ToT.
- No changes in 1-4, 6-10.
- Removed regd_freed flag in 5.
- Link to v1: https://lore.kernel.org/r/20250109-fix_reboot_issues_with_hw_grouping-v1-0-fb39ec03451e@quicinc.com

---
Aditya Kumar Singh (9):
      wifi: ath12k: fix SLUB BUG - Object already free in ath12k_reg_free()
      wifi: ath12k: add reference counting for core attachment to hardware group
      wifi: ath12k: fix failed to set mhi state error during reboot with hardware grouping
      wifi: ath12k: fix ATH12K_FLAG_REGISTERED flag handling
      wifi: ath12k: fix firmware assert during reboot with hardware grouping
      wifi: ath12k: fix ath12k_core_pre_reconfigure_recovery() with grouping
      wifi: ath12k: handle ath12k_core_restart() with hardware grouping
      wifi: ath12k: handle ath12k_core_reset() with hardware grouping
      wifi: ath12k: reset MLO global memory during recovery

 drivers/net/wireless/ath/ath12k/core.c | 110 ++++++++++++++++++++++++++++++---
 drivers/net/wireless/ath/ath12k/core.h |  15 +----
 drivers/net/wireless/ath/ath12k/mac.c  |   6 --
 drivers/net/wireless/ath/ath12k/pci.c  |  26 +++++++-
 drivers/net/wireless/ath/ath12k/qmi.c  |  22 +++++++
 drivers/net/wireless/ath/ath12k/qmi.h  |   2 +
 drivers/net/wireless/ath/ath12k/reg.c  |   4 ++
 7 files changed, 156 insertions(+), 29 deletions(-)
---
base-commit: ac17b1211841c98a9b4c2900ba2a7f457c80cf90
change-id: 20241218-fix_reboot_issues_with_hw_grouping-0c2d367a587b

