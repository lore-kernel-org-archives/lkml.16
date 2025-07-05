Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6625E1DC998
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 14:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751727170; cv=none; b=pH3L34yEhNFaLvpf+BIVxaHDu+eVWH9ACcCaj5WePjGjA5WoAnAcX55+h6C8tYC0VcuwvSbwutRVotiKbB8eIJbT49DkL5qQnv9BuYDROaqzpIQd6MiNbIddGRqgI5AyNtSPzutjO/HQSfbh2LTQcaBTUOJ1XpkKZxeEacbLzB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751727170; c=relaxed/simple;
	bh=+OLqFMLQ2E9Yuyqm46u9WWucG9SoqfAIE++hfZHHx98=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FnO4cSWgLMj7BU9GW5x8zeXosk+JfU+FaeZN/iLY8yee9ynKhhe0/RQFCVQPxVQiuHvsKzdNhmaw+UYLcsOZhbWr3nrfMqOxbQur/XljNrcXLd7piAjfTcvauQiDb1rXnC2RZRxO5L/YGo6+oVcIJdGDTz0ll3dn6bKtGez4DL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N0Cck8wt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N0Cck8wt"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56529bdS017833
	for <linux-kernel@vger.kernel.org>; Sat, 5 Jul 2025 14:52:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=wBvtPJOWtI2W6w9O/gUQNtw0jQ+JAvaw7wO
	9kNt3NIs=; b=N0Cck8wtDc7EnrDCJbHToUUiXO9o792UiS7byJnGVwqTEWCP9+3
	Ma0xf2YeIegYB6D8EUc8+QQhKVtIK54YRoRAxmxLYCmtgDy3HAYokW/HtVqQi9Gj
	iayIZQFEwXzdGsMv5Swh/gKeBcNjnyX3pf9yFPRmoJflMMW6Re+noQ84cEwDURJh
	+36WB4YX2wglhashcF3KLJN4VMgeqOoExc7kd4KmglP6yx3WAB3H6W3nb0AbaTNF
	5kErsDqtUg9g2OpmQjRYnYzHUQw2b6eObBI2IX72ENoVO319ApXK4GdpH3JVzX2T
	hDfqZc8CsatkYVXzCOVJe/ou05yQLE6uzFw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pu0vsbaw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 05 Jul 2025 14:52:48 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-234fedd3e51so15159855ad.1
        for <linux-kernel@vger.kernel.org>; Sat, 05 Jul 2025 07:52:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751727167; x=1752331967;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wBvtPJOWtI2W6w9O/gUQNtw0jQ+JAvaw7wO9kNt3NIs=;
        b=BxXD61OD3h90aNvU9S7trtC+6UFTFbson1hXH8PYN4sg3eJ3VTXOn4HnLmrCPR4sid
         3+mD4C3mOybDbgkGiPwVgUt9fKSe/uobkv5ErB5DKfCC+Z8R7Yh8FtwBCKi6VtwnNLhg
         g5T7Q24vd9mWuBgWP8HGkmN6bE6qMRNGDDYm0tYOC4FelIXT7XudgnDssX3GX9LcCJZU
         sN0tHaxZfq5B/TIJy2P0rIQdhUx7kPs4rfptwwG6TdPulc8MxkfXh6dC/ghMj8atn0ki
         ytW1PPmLZtLqKkJpF6KDvcsi6PYlY9+Gb50M3oI9wVNMAXe9pYX+O0uBH+miS3hcdWYl
         6x2w==
X-Forwarded-Encrypted: i=1; AJvYcCV25Nr/y53aVG50lEG66dpbsyM5LsBLclCFM6fkKOCC5BwCPg4XzP1K2kVEO/1EFRAQ0TGtlU/h5LEg2tw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZ4Tdw3FRiEmy7kJioqBVZ5FUKtzF2WcRCmAgICWFpeWa9G6xz
	mv688rUnqYAI21Wna9rkHsMZlirLY/HFIp/OjOHTbkTPpZHMR/8K8nwB1uezn53G9XxIeGpy/xC
	68teaxtVVfy9lRH3YXqy+05KEA+eGJrzzrIoY3ZMV6wi5YijDerThFYCUZv9FME99nwk=
X-Gm-Gg: ASbGncukNEmW+nHs6oKIADbs/KUTx5obKc+K5jwv97sG0mg6I9bkB1bqd1zNQC0nF7g
	INTQZqQCwYEmcSIDUZYXoUtLXKwx8OcnbS37wEQ0kkMZtsJPXVRl/Zgq0cD2DbjXMOicXiWUh75
	BDJpTBYly1MTj6/VrvkZm1edWNob4l2WEP/ibtt3DzUifS+EVnu836xIpPdgpsLFM0keo6VdQTx
	o7uKAsxs1qDmbGuUs1nqwKyoz2ds5qScmGtl5DWc4ArCLDbgEAOvBvP2SrQspr34TvJtJTglly4
	8VHjF3WLY6usluRCd9sDcPeE6VjON/uULg==
X-Received: by 2002:a17:903:2f03:b0:235:1171:6d1d with SMTP id d9443c01a7336-23c85d8feeamr79343395ad.9.1751727167234;
        Sat, 05 Jul 2025 07:52:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGToGgDP5cFnl805R/32fydbC1Sf0Tg5kRY7KHuPW6KsQIBThC2Hu6p+geYPeaz7rf08KyEeA==
X-Received: by 2002:a17:903:2f03:b0:235:1171:6d1d with SMTP id d9443c01a7336-23c85d8feeamr79343145ad.9.1751727166863;
        Sat, 05 Jul 2025 07:52:46 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c8431a527sm43190135ad.26.2025.07.05.07.52.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 07:52:46 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        David Airlie <airlied@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org (open list),
        Marijn Suijten <marijn.suijten@somainline.org>,
        Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>
Subject: [PATCH 0/2] drm/msm: Split gpu/kms cleanups
Date: Sat,  5 Jul 2025 07:52:39 -0700
Message-ID: <20250705145242.781821-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: BzZYmbIxRhsi98PeglJiGx4fgcViRJJh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDA5NyBTYWx0ZWRfXzn9pvA5yOwvl
 Ao2YY8cq4VJbs0CWsp5SygKpJSTZsugAr6HGlfbuKyTrkAyMZc3bpPa6NG6cAwDlb8gHW3O2UIC
 xdzIYtF0/eFjmUIAjmOURkumJKQJGmds32g7GF+FTlWPeIBHa/r+xFIUNhTksWVUWqKz61orfy3
 HQ8xaC5vCUgUagtXC8+x44F53RMWDOqmQBzFNvHSn5kvnDFWR5LkfIKkqKl0jKqATtbO/0S7REQ
 Et26syzJwgUAXip1JslF0n1eksQoMyYV9UmPSCrj89YSKcEaEdMNs3rkbU5sCXqHVvybsXamX+A
 G7a33x8HnIa7uUwFBzzSzNQ83dh1IQ3aha+NStVXwPI1MP0XRwTkuaFJdcFC2VrhslLuY4pAYYs
 Vuja/mMLYWdFbruqfYhkPeTt4aGd6G7OJobg1I0xsYE23+SaPI80RPP25yKuWza6rRypXV1z
X-Authority-Analysis: v=2.4 cv=Rd2QC0tv c=1 sm=1 tr=0 ts=68693c40 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=xicTdwmnyVa0YEs4s9gA:9
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: BzZYmbIxRhsi98PeglJiGx4fgcViRJJh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 mlxscore=0 malwarescore=0 lowpriorityscore=0
 mlxlogscore=898 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507050097

Applies on top of https://lore.kernel.org/all/20250705-msm-gpu-split-v4-0-fb470c481131@oss.qualcomm.com/

Rob Clark (2):
  drm/msm: Clean up split driver features
  drm/msm: Take the ioctls away from the KMS-only driver

 drivers/gpu/drm/msm/msm_drv.c | 33 ++++++++++++++++-----------------
 1 file changed, 16 insertions(+), 17 deletions(-)

-- 
2.50.0

