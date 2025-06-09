Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B4CD18DB1E
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 18:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749493486; cv=none; b=Ho0CVPPMcqAWBsa4zZnmQPqU0bSclstZyXP/Si+/OH1neETAV0/K7RWCWsDZd+W8ahkABwpfjlnFfmQ7mUoiFjyT2UzW4moyVQzxTVrSk/JZOgbwboYA2pB4IqKJ7qH5gDra1FlDbIWGz+xnjdNnsDXBNNofEhieTzvyZVHezY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749493486; c=relaxed/simple;
	bh=d6cdoCj31eUk5F3VCUY2T8KQ/6Vk+ixc0GLCsL0N170=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gxHTx8sJUKx9564FvQ9bXUxrogS3G0HsOT9SnB/wA4oF5OHUMj+N/PZmmKqpRzP/r9ZDLT1O6V3tRsZLtJVDhudUMEZN0puPeLhVHt8WBwPwuea/hPUmvHPRTFfvXfEkK0BOJZ/PG9KXgX3FdAYbiqZCywIPmvopJf5CcvNYfa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m4EfG6uN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m4EfG6uN"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 559G4uYe026905
	for <linux-kernel@vger.kernel.org>; Mon, 9 Jun 2025 18:24:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=T6/1awyVf7eqR9AU36g9BD93UGKtinLFAqS
	HdRSlSds=; b=m4EfG6uNLOS3in7c9iB3D9yYaSBHOYE1bNwECfdGZ9rDht/MgGa
	BubiCZDzL3eHEL3wp40+CVWshA+T6MPwauhU1o89c2Aav+SmAb+vV7v2QjGi0kQq
	hbZF2muokddtS+Yt+YBQCymPWgUKnt5Q1YQ+3cvEufdgUSG+xwIBkfbroo7UGZQE
	AsJFQGIqNAaHl7GvgibvzHhnv3hPXPUhd4VZKoDDqDOMyAZWt5MgfiYuSbu7+jyy
	jXB0TUgxxPZoZaA7cAmfUbcMmTYaa5R1IV17OxOgdWADH35bL0glScLXihZP744+
	dS7aNzzfmsxgXSBqjk0L5/AR1geg9r0s/zQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4762tg0ahe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 18:24:44 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b2fa1a84565so1227115a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 11:24:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749493483; x=1750098283;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T6/1awyVf7eqR9AU36g9BD93UGKtinLFAqSHdRSlSds=;
        b=kggir4/W/YEZ/p2jervyG5UzT4nfNUTJ8CVMIntgKQzQoKks+osJc/O7Q4t5RIroPP
         yYyWaU3G67+LtHHwF1+1Q8Nebfnt7ZlIAN1nzQ0hlcHjsM3SmqHUbZ38/xLTEOEnqa3I
         wTPO1LT8yNXqKtF4HIzQ7g9Y8Ovfb7JT+KFVSiW1hIqdmRKmbDAawV9MrxKvvBZP6rnF
         2fL9Eu296Eyq2urVqZ2/6Ki+YHSUba51BRHhpajvCD0P0aw2t0rGSUIgxqgU2LFP+gF7
         DTZ002CFqQZTN3ZzwtDo4FdGaA1gB3eIQPimzY/p92gxjZmihtUL9ET1ND7r3TybCsoM
         8eZg==
X-Forwarded-Encrypted: i=1; AJvYcCWbj1VxzuKQR3o+Sh4uyBHEeW/bMv9EGe94IlsAFH+SVjm6tGqdCcHAHX1pSfudY26WeFSDJL4p7TkJXcY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxtPk4m9DzpWQw00uVHH+1bDZ2aB7ZOk5YgJMhTWUCGRZTQIvfP
	zTg5K17Pv0eBrQrW/HLiMbU6vUdVz7MP31Iu7TNQypREKdxgot8GgHGxeAJgsXpWHSIUsKvclDG
	tu5Il48eNettzMhz41Jb+WmQ7oDRG7wasCOQ3g3tYoiT6yuGpjyVACVsFvu1EQyZ85hE=
X-Gm-Gg: ASbGncu8EEUtiqchAxnPAtmrtXO1F5lkdP7HN7dCSpxuSIBM9LYbdKi6JyKA+9Je9Dy
	7XTPmFonhlW0hQ6IIEnhZHnmmXcpsS9l+vsOjIyDxfI8wQ0BbnRj2zMb3YCNXNFmMw+rvShj98d
	hNW0Fi/ACRP7G9pLA0GpB72FHm5wZdJR7AAR91jVUkBWdkMqFgqYF3MahS7x/caSDqMPW3qGXt/
	jVJgYBb4YcfuajQ9b9WsHiT88PqmfwFvqS8/GcAKKW3S7HCGya65tMO72G6uDfnW+6I4OQFB4lz
	3zOHhbuFPiClkix9a8JCLQ==
X-Received: by 2002:a17:90a:dfcb:b0:311:a314:c2dc with SMTP id 98e67ed59e1d1-313472eb25cmr23479191a91.14.1749493482778;
        Mon, 09 Jun 2025 11:24:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGAvo/tjXFuiSwnF2ZVZMq2U5wnwRopkRd0199rUIbodRRW1lfymiGSTQN+R3i5xVj07EsO2g==
X-Received: by 2002:a17:90a:dfcb:b0:311:a314:c2dc with SMTP id 98e67ed59e1d1-313472eb25cmr23479155a91.14.1749493482379;
        Mon, 09 Jun 2025 11:24:42 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603092640sm57210175ad.54.2025.06.09.11.24.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 11:24:42 -0700 (PDT)
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
Subject: [PATCH v2 0/3] drm/msm: Better unknown GPU handling
Date: Mon,  9 Jun 2025 11:24:34 -0700
Message-ID: <20250609182439.28432-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OqZPyz/t c=1 sm=1 tr=0 ts=684726ec cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=JEju956KdHHbcqjs2oUA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDE0MCBTYWx0ZWRfX9sttk+JLVzoN
 XHC1GcYvJfoGvpqV6qmPH3Gwm8qq87dO8kw92P8gbgiF+9ktuV3021oGXDa1YRABMT6uvMFnAov
 PDDQ6CDofJ9HqExAJMnUTXG/f7jXjoZ8cl+6nPiND6vKHa9tGYktKJlEV5bDn3o1qAPVoIt6q83
 p1cmMuS9FGd7aCyCKE1+cOOij9xK3EERgFigxpRXH8jwQowaG4J1aOOUYd5b5IqgfccmPf5aq2W
 i211n6arFGTJi73Ift8CIriQu9Tb8UR3XIvJllDgdvh3DcRUfaGsmnAORy6vilRQIpkhtRcHrVE
 fCnJJgU3qJN9C7CXHFrDHKWLxE6wWpGNKCVznACv1xyoLgdcBKF8P44N7TL8+2uWQg1HZmCIWmS
 Q+tPkYSSSSidK7srRheYZjNMKbkJ8GJ/Ls0TRDBk5RmIduR5nryVUPFStsKaVhJM+p9UYeAi
X-Proofpoint-ORIG-GUID: -6okooTlTrDU2ZcD8lOG2vcI9qRIQcX8
X-Proofpoint-GUID: -6okooTlTrDU2ZcD8lOG2vcI9qRIQcX8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_07,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 bulkscore=0 mlxlogscore=705 suspectscore=0 spamscore=0
 priorityscore=1501 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506090140

Detect earlier if the GPU is supported, and skip binding the GPU
sub-component if not.  This way the rest of the driver can still
probe and get working display if the only thing unsupported is
the GPU.

v2: use %pOF [Dmitry]

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

