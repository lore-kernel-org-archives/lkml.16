Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A997E2153E7
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 17:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749488691; cv=none; b=jcq7A+v6kGOnDRnnRQUCDOX2ucjN98o6oJlmFdK8rl2vngamNfUNPwbtgC7hIBDQM7BbEBzzXNac+5Iqr+WWGFk6B+AjmhdVP3Gf8h+F7lhVU22VRdTlQ36LIVgrAmxbwV4FQ8hRencTsOO0seLTqhSQNJVHHMr1UnzI5Oz2Z5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749488691; c=relaxed/simple;
	bh=00Vpg2cM4kpG4wplEINqGeb9mfPqt6YhjjoePbEq7Qw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QJB/fEjK8d07PnNPT5kiQ3A5+qqxsy4qBM4BaPT9abZDvauSL0b8nA0pcmyzC+RzBIYJzVM7wPE8P7L6S4UQsmcguWLgfJOC99IBi4CKxSKJ1Q2TplrnTkRvbQcJUK8VJDH95SBQeZPqkEuaaEEHXJrKNuLS1bhlTmDZogOT47U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OQZZDwDw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OQZZDwDw"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5599Zgwd018309
	for <linux-kernel@vger.kernel.org>; Mon, 9 Jun 2025 17:04:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=WuIIsoKWX5Iho8vmFa7pFGwc+MhhmWxMnCk
	yh8rjoSs=; b=OQZZDwDwH2F2uj8Ad6YMymHUDmheYoaaXO/AFlTxYlg/B4Z/kgM
	5FO7BgxoDHXIif3LYm8TfDLoPCYj0N7ZadCh5oVK9vIUFqyQbDriNWaiPlqa5NjW
	IzjMdYxVRxWmz4qfz9qBRWzGHpDhyX+OgCTtYF2vEwG3vt5UiWvGt3Woc9EXG9Hl
	8E2FcXOur6O2kma3J9eckjkv9/vfVJxmhKTMt+4qHXfi0GNEoPz12Xzs227szkfp
	iJeK3dg7u/WAqNcW3ttNryi5RTtLogzlGvYSNu5HEfZfgGdL5zQOrDO+uujZ2FtQ
	1sZ1mK+TVgv+wYBQYZhzq6+sReCnlPe3U9w==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ce9pv0m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 17:04:48 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-23536f7c2d7so70625165ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 10:04:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749488687; x=1750093487;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WuIIsoKWX5Iho8vmFa7pFGwc+MhhmWxMnCkyh8rjoSs=;
        b=PV98QD7rZbdWpb2Troqdrkvsx1V20s9KJIiRid6O5g+9Ezjr1+vxPY00nEQ7AQpIEw
         iQnfCsi0pKGfWVJJSMVuGh1g1uP1mSb0CeHnGtRXXA4Yr0LAv6VUAUl5KsIYDvL64nql
         01tA7RKQwq5nnCiFbk76X48J6atkwOeqg6o1XsCUoE4KVdqqQ09thtHD1m67wty2rLYn
         JP6u3iUuzf5qHm/tvZogOC3urVq+kN59B8tPNEBwNP/clV5WiYZQZwjFztwP9tBudsMd
         igK5Oxy2kvwkx/0W9vEMV36v0NWWT1YrHdRt/4T4MySAeDvjxl963GleqCyB1Z3/86O2
         XfDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXx9i0875kF4Dq0fcQwraQt9PUsNmYxwfx7yD/bXlU9mg2wRak0g0Ezo1y56HwcGbQiJYBP+VEYR+OYXH8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVctHFIOUQFakcErxlnPn109woHzmoXheMWGTVrj7xB+EZjxHy
	IJUZgVvCP6q7zZExW95z5LARuisYEnolW3guwkoooUJOSILd7Gs4cnpdnCcpzlQ1m/YxAamlxGH
	mLj/pBLclcHQR6cBVuei2EpNFfiwZhWMfvtar60V8xIxpwLwLC20/mTpW8ONpVKgP9sQ=
X-Gm-Gg: ASbGncteMtN98yanxs1q6AnEpbwYiIcdL6wVOHx7Jj6W1+yAOz1C0tbezp7Ut4e9k6F
	z+3+58i32naC71r0kiDF+ebP7Hd6Uv3L6mFjU83qCCeexR0/BDici4H2N4wAm+jtlch/wzynmoM
	5VNJf8Dpg9Qg5ZW2Im8CxhuQe/JSFs8tXzcb6JaRQdO/7t7d7baZb1l5QPLA5beUW7U5MrjABPB
	LaqsEmcfMGRV5lEm3oDq686m8CigXBb/VdUukfxt0A1XvM91DOvRhAO6TnzEhdthIbyuE5JphtK
	eBgpM19vJava5e6KFrC4OIy2vy5ARAVW
X-Received: by 2002:a17:902:ec85:b0:234:a44c:ff8c with SMTP id d9443c01a7336-23601d080damr167971605ad.18.1749488687106;
        Mon, 09 Jun 2025 10:04:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFci88ZKpZFhTl9ad+qroQOgRxzN42L0DO94tMutIphra2Ct5pxyLzpOzusnoBC5stEEgN6GA==
X-Received: by 2002:a17:902:ec85:b0:234:a44c:ff8c with SMTP id d9443c01a7336-23601d080damr167971285ad.18.1749488686715;
        Mon, 09 Jun 2025 10:04:46 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236032fccc4sm57380505ad.127.2025.06.09.10.04.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 10:04:46 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        David Airlie <airlied@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-kernel@vger.kernel.org (open list),
        Marijn Suijten <marijn.suijten@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Simona Vetter <simona@ffwll.ch>
Subject: [PATCH 0/3] drm/msm: Better unknown GPU handling
Date: Mon,  9 Jun 2025 10:04:33 -0700
Message-ID: <20250609170438.20793-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: VefN6ENp_VCOomlXMbCeOs0MHGtHkSLr
X-Authority-Analysis: v=2.4 cv=drjbC0g4 c=1 sm=1 tr=0 ts=68471430 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=JEju956KdHHbcqjs2oUA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: VefN6ENp_VCOomlXMbCeOs0MHGtHkSLr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDEyOCBTYWx0ZWRfXxRNPuGdSDl7F
 JK4e39EvqF0x4GRHbqboWwU+4bv9CDwkdeCOOVLFAd9juvtG1OVHqBQfmeWVyp4kWTxoC8ro01C
 KCaCO6WMAbmiLiuyLN9vGSEf9VGlHjLVf42PtxEoK5GCgm6e86Y5Ak2NFCudhEkkkI8aaPIyST/
 umgRpnbe/BhgvSYHwrJdbH/mcS7cl7dnLLS43Qz2DR/RXp8WgScJ2iVC9vri5nMGgCXjcECBIOc
 9Jfgzdu29DXV7lU25kfmZzx3RSF1J5T4mfTbFSoXh9gwaKrg88fdTS2qW5MgdxoaT4udB90Mnou
 GmnQGtezDmZoJmz5J7qHkMIKCO62oBg+n/O8zov12ct00e7Qi4pwnX36e4zCuiAOVt7KTmJ8aJA
 isxB16tF9N2oBPu56AJ1U7soLkdy5kLgQK5Z06pLNkvi+DWBwQShcitz9w2kZHyJDJaF36oO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_06,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 bulkscore=0 mlxlogscore=746 adultscore=0
 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506090128

Detect earlier if the GPU is supported, and skip binding the GPU
sub-component if not.  This way the rest of the driver can still
probe and get working display if the only thing unsupported is
the GPU.

Rob Clark (3):
  drm/msm: Rename add_components_mdp()
  drm/msm/adreno: Pass device_node to find_chipid()
  drm/msm/adreno: Check for recognized GPU before bind

 drivers/gpu/drm/msm/adreno/adreno_device.c | 39 ++++++++++++++++------
 drivers/gpu/drm/msm/msm_drv.c              |  6 ++--
 drivers/gpu/drm/msm/msm_gpu.h              |  1 +
 3 files changed, 33 insertions(+), 13 deletions(-)

-- 
2.49.0

