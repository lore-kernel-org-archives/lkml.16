Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBFAF28CF73
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 14:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750430606; cv=none; b=knZYlnovjjPMtrd0Ib5/U1lk4run+WQHxvFIPXSTvTATYtqkf94Zml4uG0D/c1ip81JJjxQt8/XKyR3ghnxbnpkcq7iCqfcKg04cMLgv0BrBbV4ToSnKsF3VXPNEENhSFko6860EgAzjplP095ftvLuvriWNLWlDyiHFS3ZgNTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750430606; c=relaxed/simple;
	bh=GaZeC3b19Lss9cuHmvYQt3eAyVG70HYyhb4xdv8u7pE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jxu+VApxSTdZQ2FcTy1RP1plOLzHxgZxmMxq0VB/SchEviPN4D37gtHZHYwJkht4FPufsPqoJshvbf09uw6GOrgHrbrjvfeNeGdV/FIgEvJE608fv3phw3G4a2kKB8YIZI4hYXwDzWsQwwZAKfcO6RHY1gvQuCpN3xneibk7+CU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zl3GmeIu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zl3GmeIu"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55KDHOFe018584
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 14:43:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=YAhoTHSslWHI/eVI5RR5ldeEIDPqTzprLbe
	uErvpeQ4=; b=Zl3GmeIuf0dgfyvT0aSr9VnNCZ/6LpbW5f9OlDK4aCKSHamBuJz
	uPMG4E/kYChX8HWWeUK4RdZwyZdp16pbU9ZqiVF3ZO8p5oOSLCYli7BqmPl5A89Z
	n+WvQpRnjPXFmJvQeawf1PEwUxD2Qc+Thy/HsfOqWhOwjf/yMv3UWDEbjs3owgz6
	ua0YL+WHP7uD6us0YZHYgbrszrukHrC1Nz1eiDI2qpbSC1sHp8Gqm8H1wrLSilYr
	q6iaeu91vOIZi8CkaI7SE5rD9jucllprKZ6mowldd3+nRBPwIED8TlTY8uQe7NzG
	kvYifR59cDNOP+Qoaq/4V3mUii4UFLMXLAw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791h9kk8k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 14:43:22 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-235dd77d11fso19676295ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 07:43:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750430601; x=1751035401;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YAhoTHSslWHI/eVI5RR5ldeEIDPqTzprLbeuErvpeQ4=;
        b=rqMrsxdd3KoGmwWAnpfAwOW8XBBM24R3HuP/BshOEpdv7rRpmd5JoVQO3uaB26pKry
         3mTVOX/bzcPcG5s0b5rbLW4ttmSW/aIIper16VuTIkNOWPsfEWc7WLj+OCaScXGM0B/+
         I6cluZqCsX2IWhDXeuouHr8nsTio7OmfZLLdjLis0ub8IPjTaD4PQMx7QEFVlpMdohj4
         mFprzgsEt98UjxSCPnbH+wtyRTfoE4zbJcCK58PgbGPgt24az/V6GafwnF9eMs+IixBh
         jTzX/VDIVH34SgHKHaq38xbRJ99ImNkasSOfNyT0C/OOtMsXDboF8DLTG/73q7RwbtRq
         P8yA==
X-Forwarded-Encrypted: i=1; AJvYcCXJF9fuvSffdZWlLnsPaYNq/DH2nQNBUiSsHNuj/tVuO5WJ15WGgjpxaNUIz1+moTyN+9qnB//6Ywcv1kI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9Sb+siZ/Vv+L70345z16sT/peHo/R/4uodiSyeEyrfQZX9+7M
	EF0GUHoRQX7/U7NTCCqh9vR3nE2cFm7sP1FthzZJTWcnu8FzIRZgUHoCaiCM0LoixD19NHS6qwj
	xiFZFDpRclPjLI8mpqFqfRbnqDnJulgFjnlwxPBkRvOkz/86AbiU7DGwuhDOLixbyB80=
X-Gm-Gg: ASbGncuWr+3B7O6iLkVovNIO0kX+WHOWnijbDPh4gmVve/BABSyhLZJKfZONHRxXwR4
	aIwlU36Ge/SwW/H7WDvS9QTPcdrUsvdrr/tY9soFH/tHOoZZsDge/CuJk2hkSF6WMsfvWlK1ckd
	6LjRtCvw53/XbqzZZcz8Vg4VydjDChba/VvyVZYLFUNggth8WyPjQcUFhyp+Tt6xBnS6OICB6nI
	1A4go/oJfcWMnaf60YZMNeW9t5c+SP/JVwj2fAn5s0dwoO5etKj3U+VpjVQfxll02cx+5njuykV
	WQBpF6gCtbyo5RGergjjhv0NDpl79AXX
X-Received: by 2002:a17:903:320e:b0:235:2403:77c7 with SMTP id d9443c01a7336-237d997f3eamr46312805ad.37.1750430601395;
        Fri, 20 Jun 2025 07:43:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHKsJtreskCbpXvBM14rVJruFPEilAe5QcPvqswZYUDdmFWdwF5fK+Gys5jp5oB13njFvevOQ==
X-Received: by 2002:a17:903:320e:b0:235:2403:77c7 with SMTP id d9443c01a7336-237d997f3eamr46312525ad.37.1750430601017;
        Fri, 20 Jun 2025 07:43:21 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d83fc120sm19865865ad.87.2025.06.20.07.43.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 07:43:20 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Daniel Stone <daniels@collabora.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        David Airlie <airlied@gmail.com>,
        linux-kernel@vger.kernel.org (open list),
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 0/2] drm/fourcc: Add additional float formats
Date: Fri, 20 Jun 2025 07:43:07 -0700
Message-ID: <20250620144310.82590-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: CD1D23fw3JKhIYj0_lCg_arSec8WVmAl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDEwNCBTYWx0ZWRfX2Cwc+vS0h40M
 1CwRu4cCNkMXkJBx59UzzGUYW8Xc2gqrRTPRf6Uii4BFUxgQKuopS90EhngKwxGYtusNpbxmSZX
 AXjhcUI6sn8ObSYZNO8ScCLuD650MmdgBLR3p3W0bYCFz1OJL4P7RlC6DhT+rIDDHHJVN93J9y3
 XYOsp5LLhvZKGQB1HlaRjsKgmt52wiZAIBlM7tWC8KlQnE+yZ1VeFABDBX4LBBoD8lRXJ3Hne7K
 zWvCwFmjOmGZZNZhoaqEkjXNI6MBBjb4V4pgLs8S/6ZZgbUssfAxvpJtvtoHCSZIVvivOXiUWTo
 UVmqnd0NDvPQxCKa4P33K+3fq2J4KFuJSWrO0bAsbnyTqXVSmHHzAGgmYKAksSnsJ9U4TLYDz33
 m6nMvYcP+RmXFguWJXWv20MbliIPM0936rLxHsanTMQ8BnI7B8jNCk/iEhtDr+q1/SEfKRbl
X-Authority-Analysis: v=2.4 cv=UL/dHDfy c=1 sm=1 tr=0 ts=6855738a cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=wxOPRAE1bK0FDlpJDKYA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: CD1D23fw3JKhIYj0_lCg_arSec8WVmAl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_05,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 phishscore=0 mlxlogscore=999
 malwarescore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506200104

GPUs support 1/2/3/4 component f16 and f32 formats.  Define the missing
fourcc's needed to import/export these formats, and/or create with gbm.

Rob Clark (2):
  drm/fourcc: Add missing half-float formats
  drm/fourcc: Add 32b float formats

 include/uapi/drm/drm_fourcc.h | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

-- 
2.49.0

