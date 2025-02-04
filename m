Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A419335947
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 04:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738643042; cv=none; b=BoShStN1EU4R+qasKium2puuwCFPLstvBI/h/1GxDZX2xXfM2d0v9AjClVyZEHySMcQgeakiIhzrVpJxG4W+8qyqgO+nMK0yU7aTx+/T6mwQE4vqE7GRQlsLqaxpczKZXkrQjAVKTjR433NxXpHF20PbH70Ved5WYSJpTVZ+Es8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738643042; c=relaxed/simple;
	bh=DjulSAYrYJCEjH3DrbfMMDtzoP9JxlAuj8u5u3d8Xr0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=LBtabbetlFMaM6PmI4IlmPTj3yXwl2HE3y/riRjQyeL6xPWOjlyFm2aJ5k85jSQmVpcD01B/YbEtnQ3LZXhgxiO38C9I3p9h41EGEG0mWOxpJQsB+jyJTesaPFzKG88g7x7CNETqnPdiee1bcHkBEL/IIZt9AfpkUvmB/AlHLVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y8CfpeCH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y8CfpeCH"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 513GEZTv010461
	for <linux-kernel@vger.kernel.org>; Tue, 4 Feb 2025 04:23:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=CqvkxK+SNLJysbcVSZEZQE
	kaJodv4unEi5m5JjNLSLs=; b=Y8CfpeCHg0JTZWZaVv6jX/y9rbQq05oKNVuWuL
	6YWFB6zoYP1a4jkoyHpYpDgqgV1SAcZAUmL563EYb5E3lhSso7CceZy9ODh/zz51
	VnKZ6srXfHuQtVpI11G93e0Mq28zrhLLzsR83PeSuHIOiwP1jJbNbL+8ciYgiBeX
	e+ZJNbK8dj6ulzXraq8euvDXiBszUVIXxaqGOM/yCl8+7ptqbntf473uXYOeGl9u
	EqmzfA/03anfw00bttA6BDr9buOT9xYGNXEy11jWtIr57M0SdKZHcWDj/F0LLS5+
	MkITmqZ7F8DIcZk3O3jADaa2m1gyWRkBH4i5DaUamIVmlRMg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44k159hckv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 04:23:59 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2f9c34c0048so787935a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 20:23:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738643038; x=1739247838;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CqvkxK+SNLJysbcVSZEZQEkaJodv4unEi5m5JjNLSLs=;
        b=ghBMONb//lTSf3dU1CyMxnpTyD7CB3EDZuWxKeowBKDiCWvSgeatkZXvRNPo/n3u5k
         WdauK3Z3O9VZI66SwvQFrokXah+mpGJtHW20OQPUzEKMysQbdEmk3h3xAHKECjQK/y5r
         P2jMl8ZRjg+6cB2okHmT3l8B1Enx/eDfTpYDQCtcfevIcj2l11Is58HCnZ1TD9JBw74X
         ILygHGaFK7qnIFxYcsjSmFHc7NrtqL36jZ80GEs+tdndZoH6JPXuEgKVTRsflDdXI83K
         OI7qOylaZVBn//vVDfHkEtJUREyEa4zXUH8NxVOizwzz6MnEcQSkCYzaj6rO0E0qo4Ok
         Vhsg==
X-Forwarded-Encrypted: i=1; AJvYcCWNYm8tYwX7mPaLFK9wvBhHPaCeINp7mle/wZ1gYpXeZvijDx5JWUTJEIVxxgTsVD67eNeVGh3HE17gvEI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwVR7JGcsGU2l07SxqEa/ZuEmNQigWOk7kvqv1oW8gdilXVpZS
	Ram2NvGL5Pv0ZxrYWRoO7eAYrUz9nJCoUnGho/927PqzGaHSlctDcd/42CdSt6c3MZCy12Wwgj2
	gGOkK0P0qnI8oFeWOs4EYKtC2oCdDoP0aUOWIpO+Ri1VMeZaZu0aV1XcC0/quYs4=
X-Gm-Gg: ASbGncvfvBbUzj2iYBX3GR3TWR4oLVyoDZRbCck9bh+WjGSkk/4OrKJG7389JpF8S+y
	GYgsaAJHoww02YfIj2MtI0z7cHOjwq12wpgDVK8Zbn8yHsy5bZaDqdwS5M7p2Tyv/NwyUWp7pGD
	H5lqP7luIiKnG75TB2BgtDGLhQOJRVr03h58vnoZAsuMAKY2NoP/GNtu6s0g7J74Bj91FkL9ePv
	rpEB/xBAQGu8QF+Z+HZbbvrN1CRk1la4aVbN28NqNlYV+dKMbCZgGeDTz1vVWNzpJHM3vf51kV1
	cngcb26jM9Jf6x4kwd/mR+GPOcjuXGHA9DgL+7Fj3OeX0cx4ncTbceq4F5HP6+Eo3Y/Ek4nBXE4
	CJs1xNNcvHdc91ryMxuc7mL6H6nCwog==
X-Received: by 2002:a05:6a21:692:b0:1e1:a0b6:9872 with SMTP id adf61e73a8af0-1ed7a4c9997mr38255265637.11.1738643037875;
        Mon, 03 Feb 2025 20:23:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG8s6FjVpcitG1aB9paVinc5QFNVofAJU3AhuDdzFoQ/QdzJvX/aEBHqNo07SQpe9ZCeW3Z/w==
X-Received: by 2002:a05:6a21:692:b0:1e1:a0b6:9872 with SMTP id adf61e73a8af0-1ed7a4c9997mr38255240637.11.1738643037526;
        Mon, 03 Feb 2025 20:23:57 -0800 (PST)
Received: from hu-adisi-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-acec04796e1sm8897144a12.58.2025.02.03.20.23.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 20:23:57 -0800 (PST)
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Subject: [PATCH 0/8] wifi: ath12k: handle change_vif_links() callback
Date: Tue, 04 Feb 2025 09:53:40 +0530
Message-Id: <20250204-unlink_link_arvif_from_chanctx-v1-0-675bd4cea339@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE2WoWcC/4XO3WrDMAwF4Fcpvl6KLcf56VXfY4zgKPJq1tirn
 YSOknefk1Ey2CA3giPEd/RgkYKlyE6HBws02Wi9S0G8HBhetHunzHYpM+CQCxA8G93Vuo9mHTp
 M1jQm+L5ZjnG4Z1IooWpUGgvJEvIZyNj7WvD69pMD3cbUM2zLi42DD1/rE5NYts8+sdc3iYxnb
 V1jaxRoEnhOOFqHR/Q9W/AJfoOwC0ICy7YDxI6UMvQXlE9QcQHlLigTaArDO6WNaQt99jEeb6O
 +JrDf1HxTgctdNU+qqjiQNGVFVfmPOs/zN2T8OB7gAQAA
X-Change-ID: 20241210-unlink_link_arvif_from_chanctx-315159c5ac63
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: XozH7cuwEyqunfjrC1vm6B6If3qrPE2_
X-Proofpoint-ORIG-GUID: XozH7cuwEyqunfjrC1vm6B6If3qrPE2_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_02,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 spamscore=0 mlxlogscore=999 phishscore=0 clxscore=1015
 mlxscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502040032

Currently, links in an interface are allocated during channel assignment
via assign_vif_chanctx(). Conversely, links are deleted during channel
unassignment via unassign_vif_chanctx(). However, deleting links during
channel unassignment does not comply with mac80211 link handling.
Therefore, this process should be managed within change_vif_links().

This series aims to add support to handle links in change_vif_links()
callback.

Patches 1-2 are making debug infra to work without device info.

Patches 3-8 are the ones changing the code to handle as mentioned above.

NOTE:
* A new ath12k-check warning comes which probably needs to be added to
ignore list

drivers/net/wireless/ath/ath12k/debug.c:69: Prefer [subsystem eg: netdev]_dbg([subsystem]dev, ... then dev_dbg(dev, ... then pr_debug(...  to printk(KERN_DEBUG ...

This is because, since device info is not known can not use netdev_ or dev_
dbg family. pr_debug() is an option but that will require DYNAMIC_DEBUG
and then ath12k needs to be probed with dyndbg=+p which we don't want in
ath. Hence, only option left is to use printk() directly.

---
Aditya Kumar Singh (8):
      wifi: ath12k: eliminate redundant debug mask check in ath12k_dbg()
      wifi: ath12k: introduce ath12k_generic_dbg()
      wifi: ath12k: remove redundant vif settings during link interface creation
      wifi: ath12k: remove redundant logic for initializing arvif
      wifi: ath12k: use arvif instead of link_conf in ath12k_mac_set_key()
      wifi: ath12k: relocate a few functions in mac.c
      wifi: ath12k: allocate new links in change_vif_links()
      wifi: ath12k: handle link removal in change_vif_links()

 drivers/net/wireless/ath/ath12k/debug.c |   6 +-
 drivers/net/wireless/ath/ath12k/debug.h |   7 +-
 drivers/net/wireless/ath/ath12k/mac.c   | 288 +++++++++++++++++++-------------
 3 files changed, 182 insertions(+), 119 deletions(-)
---
base-commit: 48a62436540224f57013c27519dd2aa3ddd714c9
change-id: 20241210-unlink_link_arvif_from_chanctx-315159c5ac63

