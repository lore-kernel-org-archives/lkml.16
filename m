Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 573B41758B
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 01:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747877710; cv=none; b=QLWvBxzCrIgDsNBqpzIu71J0Za7tWoYfcS2Oyi13en1qiH1TUhEO+f0GIHyhplkBjMK6jpncKqTiM2HK5mEyLWx6rfMI6VKihxJI7pp4jZDoisVPCPZguLJ/0xF2r8VQHz4t54q0LrJrimUXKt6w8aNFA7XiGp+DUJJ6/aGLCcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747877710; c=relaxed/simple;
	bh=cMCnnc7X/yklxiDU9hwwsSkevTU+xRlusst0496/U3c=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=i1dqmV/OqomCeYMj0X0vAxDxZ5GjWay9afdFcutkidT/uHCxSGc28Eyr0iicHbb6S5N+Qd0GDlE+2Jj0nolaX2nJT3E3WI4X4ApxApYVBWhH5WWfkJAJbpp3I1HIckXtrIRVnoO3OLYbW+5BdEZKq8KOodRFOHlpOr0FyePROmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CB3Weyw+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CB3Weyw+"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54LIW4dE027699
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 01:35:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=HPUGdKm+6wjWn2dW0R+KWWtLOsj1VrZbuMm
	juk7/Syc=; b=CB3Weyw+sfP0cfKIOVfUqmpzc/ZTtNMuemRT6UZvoDlbzr32mPa
	4hGOXCLAXS/fs721n19jgwFt3fjQW356eddsJrv/y4C6OPL0WX7gWUV0XwDcZ/6k
	jkmn/OlecZ/37kf8RioM+8m2q6rNX6iA6wrGc4ZkTDZ3gF6vktcPdFg46gkgZQke
	6qm7eX74b/04Mf2aUlY95msGMdlu/14pcVQPfsQ2+Q11okR48x4bAFu9bx6kHiug
	jJp+vZoCePMCcAvcdkVJ/05hSF8FP22YEGTsTJXM8ygOi703owddk8FiVbzi6ftq
	UDi8jB/+QOZb3nDSl0O42e6APTkholRsi0g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf9ckme-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 01:35:06 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-30e9338430eso4612930a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 18:35:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747877705; x=1748482505;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HPUGdKm+6wjWn2dW0R+KWWtLOsj1VrZbuMmjuk7/Syc=;
        b=nQBlB9aTKYxYDKZuVm/BzN+vsjh2TYF9e6GHQ2IUNFcdq/lZAF8UoNp1ZYrnvWQHby
         zEQC6xh1Y3shdGQ33CdfXZYssTFgdc9Aog2SQnJz34fG15UeO8LsFdWyI4K0fsXtze3h
         C1rTQrtZx9F3VoBexDfitP6VIyL0Ej9TvB670BWcCViFB7qgjOAxS93eg7xwr/mTA7zb
         wv+FwCHCJKcUbwa7Rc+O9GuFtAClTTvwRZx6rlPaKP2Anh/R4VcTo1kfzTIECIc00PYX
         wdLk3VseLVBBrgEhEycrto+v3FdzcbuZkscGsmnSNYH3TA5Z0PiK4HQSFF65a5a37UKi
         7qXw==
X-Forwarded-Encrypted: i=1; AJvYcCU7NYRHJRVACxbO4TNBbIo4i7QyU1RpR/jPehrYkB9x7khb2VdugLCKlNvwmKqrWLfRZLyCG+J4MQa7d20=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw76nD8xsCV465reNo0VNgkCaPRor+PDbPesC4E/RE9TNZkh4b8
	X4mcb8wU+92N52//LmdTrHnSlw2EHZNoik7S+6HoeAssMqfcStQkoW0l/R36xB995aQJJKZUQgm
	ozKJ7rKAYASnfJC2gcuqhDQ/2a6mmiojYAgUfpzmjIqjxJ+01meq0pKIlqgWdSM7efnY=
X-Gm-Gg: ASbGncsFKr1ETkkTzBPdaBXOZaYvl878SwExFH5qe/o62NtClf5wuDlOpWk1IhGUiVw
	bL46qa6w5Nb4f/fFm2ZDeCJZjKpyeY7BMo8bE8VVKXAQYv2SU50yL4mHzbjf+sYzHmGfMjvBSsy
	dq0XD2lWeqmcnGNtkEQeKjtwqfc1qef2IGQlt5d3TtqqN4D8aC+HkGzVu+Gd4UXLJjLzqnWifwO
	6v1M0AWOshbSkhE+8hBcpPNvu+XMr+WnyC9vhS1K0drtEZVpPGFZnPjMvYDOnAZ6GwZXzWiYEE8
	PpipDdex1rU3ys9plVEcKZYT6wDGvDt3tjZETF91gqpXZoGwZFYQYQQTKefIfM/dldH6yXc=
X-Received: by 2002:a17:90b:5750:b0:30e:3737:7c71 with SMTP id 98e67ed59e1d1-30e7d57e4e6mr33408575a91.20.1747877705477;
        Wed, 21 May 2025 18:35:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF3oA7UpKoPxzuimQInRPDM0fZl6JIUILi/4VKjHEG11sIfyclQQp1d2zav0ocl3qvvA5YdVg==
X-Received: by 2002:a17:90b:5750:b0:30e:3737:7c71 with SMTP id 98e67ed59e1d1-30e7d57e4e6mr33408543a91.20.1747877705134;
        Wed, 21 May 2025 18:35:05 -0700 (PDT)
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f365d45b2sm4341488a91.26.2025.05.21.18.34.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 18:35:04 -0700 (PDT)
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
To: jjohnson@kernel.org, johannes@sipsolutions.net, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Subject: [PATCH ath-next 0/2] wifi: ath11k: support usercase-specific firmware overrides
Date: Thu, 22 May 2025 09:34:42 +0800
Message-Id: <20250522013444.1301330-1-miaoqing.pan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: JImWTPX80rqAB8aHgihiIwsziY7zpywQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDAxMyBTYWx0ZWRfX1Aynwy9/oMeG
 6tGrj3UpFH6SVVMygX7xdEcdO7CUq1cubw0ytjx7M8ndzVELQkPbZ19AcTiZispJrfY7ww8mMyu
 EOcOKW3z9dnI/WuFiQJ498y+iwLqkUbVwTA1lI/tMs3Yp0IlWSygsMlTnvT/6aKR1RrMOumFJvI
 kohYb/DXzvkPthwheIP5JqC5aVpBvzv3whq4//ASzag96L2arNRbEvUUJKmhd9hUIGGE9xX0G9m
 J1fN58ZViD5kItqq02+c6QVlC7BnyKe+McKASSPLPttMF9qsHix5jAZ/BLVSqqrjs8QyBN9Gvzw
 CpmBEuVH+/c8NuU87WWzDT9NbCrJ9SVM1yEuqKk3cuDl4KqoIIeTx19gEIFy7uOjRhVxftDFBTb
 L6ddZG3y/pyek5RNUabVEaC5dDL1j4BZbXScqZagUStE1GUCYBlqhO8F9pNOPAQ8RWW81zgw
X-Authority-Analysis: v=2.4 cv=GawXnRXL c=1 sm=1 tr=0 ts=682e7f4a cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=5mkN5bLxXfCjVL2fFVgA:9
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: JImWTPX80rqAB8aHgihiIwsziY7zpywQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_01,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=999 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 clxscore=1011 malwarescore=0 phishscore=0 bulkscore=0
 spamscore=0 suspectscore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505220013

Introduce 'firmware-name' property to allow end-users and/or integrators to
decide which usecase-specific firmware to run on the WCN6855.

Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>

Miaoqing Pan (2):
  dt-bindings: net: wireless: ath11k-pci: describe firmware-name
    property
  wifi: ath11k: support usercase-specific firmware overrides

 .../bindings/net/wireless/qcom,ath11k-pci.yaml      |  6 ++++++
 drivers/net/wireless/ath/ath11k/core.h              | 13 +++++++++++--
 2 files changed, 17 insertions(+), 2 deletions(-)


base-commit: db5a2f8ef8d4be926d29ed62182d003110c1a6ca
-- 
2.34.1

