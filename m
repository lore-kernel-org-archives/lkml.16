Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3993175A5
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 17:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738688723; cv=none; b=KOVAFC7gLYGSPqxOsdMq1JXsBYDkO/po9L3Aa0QDSq8etpPqP9T6m5AM7a+Rp+Sb4LX1Dejmm0+C5qoKyvM64O937kk1ao8FCxOaCyFVrn46XNllwVxcZAEjZ98SQy4HJslP5Maqd7npK7UVLTrYiarVp+/6+bdWWl6ZMRTZHXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738688723; c=relaxed/simple;
	bh=JBOD6fiobxs4q41gPKaifDLaESDFdozFHZlmiIleJsQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=iFS3OEIWhRYd3heJ2Zd49UZ+Lk8xw+OeqfArzxomhtaexbTabnwvU+FWNZnHK57BjfgUBKk4OP0yrHZl0vvWnZlWbr9F+RRFOoFPQL7usM+EU5YC8j3mSrDP3p0qu1hxztsy0sdSqf3uZCLTs5NyPAXA0sS91gNIqTerUiUiRag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q58w1E2d; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q58w1E2d"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 514E1VHw032200
	for <linux-kernel@vger.kernel.org>; Tue, 4 Feb 2025 17:05:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=BT7DXHGHa0zEjrmQrPCEWv
	JNmClmGtUduvzIInTQO7M=; b=Q58w1E2dpFUbKgrhcah0e2V/ckonktGv/4SdHY
	2eF8YWtf77wFXutIPocpQFyxSFOfkaO8cu88KBMcrNy836aYI4mmyfMbKxK3nLNk
	UkT+Y1+e6+CGprJ89j6qM9Izza1owiq+7HOhPl8DSSKdlhL0zem93vv1Bls7Ukl5
	VXHarVMr8VsTwnWjEyflirOK4Iza5HmPIRbzQhlsLH344FP9UJF0McYbCOQ7Cow/
	YEMHri0CFcMJSxiIKLNFEt2upDaVrUkveo9o1KzoPpsQUqS1jW4LLbcj7En0Imt9
	rt6TB92l89+ePVEwZg00NPNARrxl0IfMd0RNmzHrRX4MpTyg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44km9wgf7a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 17:05:19 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2ef7fbd99a6so10727804a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 09:05:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738688719; x=1739293519;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BT7DXHGHa0zEjrmQrPCEWvJNmClmGtUduvzIInTQO7M=;
        b=V9oLFqdcIt6WrJYOJRwd4kvBuNmIzhVVOZnFzvU0dIoDO2PS1RHBXHYrCM6gS5n0PH
         4CHPob3KIUFatM2EDswiJN1+FeqLy52p/vuqnQDEcVRtqLcJU7L17V0Fzhox0Yhm1iSB
         re/vJyJufbYV8vTI5y6smx/iUhgbrVdmi8yM6zKwP8y5TEVNaTS3+WbUls4Toh/6ZCcR
         z71WAn1Kx+tKnQTq7g8An7lfWA82pDQ1K7ln9hM8WROeR94/Wswz2xI9WlRh3K7wYnJo
         mmcBMSNMLBgIgR8ItGv5bw9kbjczO/oNAs9UfR5jQkSjSFOJPNxq+A/BQvjV0SDoCaL0
         LssQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOAmqBZ4Iq2sfIRJD4s6hW5LjmY+CTwV9nbVOqgwL04KQ4p3bv4lcZYpz1vFPJ/7omPFDSG5JZ7hdgq20=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYTpK2tTbCVo8CHmCbGdp7kJwM5V2JA3EQmTfzwbMn9zbsIoVR
	bJAanljFr53ZKYo9/12zp2a2C6BslbGe8kbN8q4JpXL5seHeWZzRobbXzZDmpAIvvnZvg1jP9wu
	WP2u97nPieLVp+whUQyrWERr3gjXrRSOM9F2f5OnJAKUIwtUHsuBEo4fOduXBUxw=
X-Gm-Gg: ASbGncvlWqDKX2CFUu+OgU9OGzbhkXohCoW7/1x9Ve/8sWGpvmbpGi93paUgZ+OA6Si
	4Q06Gv5j5gECUEGwI/2kD/+uNvpiFpcsbnyDi+criejCPYvCRxiauoCo4rgFodpy7octys8P7Ga
	DAuZ7OE0e8Gnv1czXbJ9Y4oa/XMm0dP21O9+UdEmyrYsDpHgCU59zeSOsGLgv5D8oK0wY03n8hY
	K3kgM7eDl/XO6KqEqVESuhUqTqSXzyFlFNuaPtFutUQmJcIDc6473EQPlLxLMgphqj/AXVUA2u2
	TuG0aA7R5SU51sGfmL5VDYpaV79jl3vv1atUL2vycZ9DTuC60C9E6zdHkGOWUUMninHSZZ7kSAB
	KvrbT9FEZ1MTDDEf4YrgQJifn5+mD6w==
X-Received: by 2002:a05:6a00:1411:b0:727:3fd5:b530 with SMTP id d2e1a72fcca58-72fd0c60405mr34524841b3a.15.1738688718696;
        Tue, 04 Feb 2025 09:05:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGycQOxaUw26jx2t1l1m1gaa7VJ8kN4iUr7ydQDkLeDLysG/ehAID5o72Qqi2wmqGDsOu70Gg==
X-Received: by 2002:a05:6a00:1411:b0:727:3fd5:b530 with SMTP id d2e1a72fcca58-72fd0c60405mr34524791b3a.15.1738688718037;
        Tue, 04 Feb 2025 09:05:18 -0800 (PST)
Received: from hu-adisi-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe69cddbbsm10772788b3a.125.2025.02.04.09.05.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 09:05:17 -0800 (PST)
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Subject: [PATCH v2 0/8] wifi: ath12k: handle change_vif_links() callback
Date: Tue, 04 Feb 2025 22:35:06 +0530
Message-Id: <20250204-unlink_link_arvif_from_chanctx-v2-0-764fb5973c1a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMJIomcC/43OTWrDMBAF4KsEresgjTz+ySr3KMXI41EjGtuNZ
 JuU4LtXdglpocXdCN4gvvduIrB3HMRhdxOeJxdc38UATztBJ9O9cuKamAVISBUomYzd2XVv1fo
 YPzlbWd+31fKZhmuiFSosCQ1lWkTk3bN117Xg+eUre76MsWd4HE8uDL3/WEdMarne+9RW36QSm
 dRlSbVFMKzoGHFyHe2pb5cBEUIJMv0XlOVYNymx0bo89iHsL6M5R6hdtWXqBN/nwaYKUc3rBog
 aRrT8Y94K6juIUkG+CeoI2szKBo21dWb+mJk+VJB6U02jioUE1jYvuMh/Ued5/gQExm0LLgIAA
 A==
X-Change-ID: 20241210-unlink_link_arvif_from_chanctx-315159c5ac63
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: e3LYJXann4Qkxwq9BJj0uXhmoJFyq5hd
X-Proofpoint-GUID: e3LYJXann4Qkxwq9BJj0uXhmoJFyq5hd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_08,2025-02-04_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 phishscore=0 impostorscore=0
 malwarescore=0 adultscore=0 mlxscore=0 bulkscore=0 mlxlogscore=999
 spamscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502040132

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
Changes in v2:
- No changes in patches 1-5, 7.
- Relocated ath12k_mac_remove_link_interface() as well in patch 6.
- Properly handled peer create and peer delete symmetry in patch 8. This
  unsymmetry was the root cause of the DFS channel bring up as reported
  with v1.
- Link to v1: https://lore.kernel.org/r/20250204-unlink_link_arvif_from_chanctx-v1-0-675bd4cea339@oss.qualcomm.com

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
 drivers/net/wireless/ath/ath12k/mac.c   | 302 ++++++++++++++++++--------------
 3 files changed, 180 insertions(+), 135 deletions(-)
---
base-commit: 48a62436540224f57013c27519dd2aa3ddd714c9
change-id: 20241210-unlink_link_arvif_from_chanctx-315159c5ac63

