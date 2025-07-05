Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC7E526E6FF
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 02:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751683654; cv=none; b=YLeI8fIw7XIbiVPrt33qZJtfwXvJiCaopw3TFooec/m3Vgh9Y2SfVa6lzSZX+pwtd2M2DTR+yHK9qmX+e8cV/VQagtmZEl2hYyDWcxMEnKwwoVuOtwc4eEHIR6veyN4v5SR1GPmkxOWqHETV24Zb+PyxAMUa5dMeHtrrzVVGoLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751683654; c=relaxed/simple;
	bh=PILnmvpGnr1q9TnXm9+RxFGUB/bQl/VAfEMPj6+eJQA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JIamwSa7wkIToeUHYN5sj8ZfqEcuNDlPeuekjRgbpr3MyJk3ru7Oyld8QRN4yW9S7PwnBRuf6QRiqkMQN/6jufrp0+VDlIVhQOm9aewqr0S0z613O3ueRpaqKl5bWNclF+774IvavceWrOXVwxUgg+mAbexUpjEYEX5ASJhBqao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fmJz75Pg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fmJz75Pg"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 564MiuXH001775
	for <linux-kernel@vger.kernel.org>; Sat, 5 Jul 2025 02:47:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uwF0yXtjcYZZHTWUtFBuT2u76dwiF/qWvZ0FO2txtq0=; b=fmJz75PgADpZWKXy
	Oyq9zd3dCsSv3twi/x2G5XmcBCfrJpXIdi00LqpxGyfzPFauCKTJRIgwfr7i84YF
	JWl8u02ObtgrM58bJgf7fczu/0STHIwqDB6zLxflVLXvhi2lZpb11+q8qvr38z4c
	x+qXSUAKuoGOGwaP6PJD4akjul2DonIhtwTuwD9Vb/gnaLojhR6mRXUTwbuYoqZN
	RcgGaOroEMk9AMbZEUX0calVBZ/XbW3KP63G9sCWnjl4RbmaFAYy5FOlS1b9PjzE
	aNi6uxUFBNtIXWcfNo2QIn3pv3m7uPnEAxj4HQe3Ud+dET7rMUT9nfKR8w/pH3hc
	nkPA4A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8fxw9wu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 05 Jul 2025 02:47:31 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c790dc38b4so235388885a.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 19:47:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751683651; x=1752288451;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uwF0yXtjcYZZHTWUtFBuT2u76dwiF/qWvZ0FO2txtq0=;
        b=j8H3ZsAqt7bO1yZEE7FG5u/eBOsXsv+Ml0PEi2ZUo92t2ktXkHu1xs1ddfR0xRmAHy
         WbankwPfD96GEmpGozA1qFrR0JK3IfGakb4DS9CGX5Nye8JUDpqjhDtCNQrAJVYbEuBC
         hrt5BGK9K4z4zHwcWSYJL+tyPNJ8M/uK7IUnlcFRGodbXapoiM6VhnwIObl/BANchQxM
         b+j1cU1jrPilW84qLYriOV7ZZlmB5tG8Xr3fBswfHaAQPqrVeWLhoXLH6FaO2rKSqnnx
         Nwq3FAgx2ueCzczh5Ug4jjd/i6jdE3jjhi6wR7a7h8NIkMFPyqFQNySLfIBi3Ww+H8sL
         ymuA==
X-Forwarded-Encrypted: i=1; AJvYcCUMv16ceQ5sUG0EYwedpNZy44CdYdnNuZLS0hXPPu5bbrnLMnYwehSMVHodehR1GUkUUPj50ytboGEY4yA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDY87zE1FXNSL/etbNKudE5wYo6rtr080W0a46AH5jBkuZ3+ea
	BQc3DLMNrtWtLf6nLmnHn8T/a/9NZFaA7wyhOfAIn5b7SUrOqXBfOkddnuiluBp0gpPXdB0bgxd
	b/eyHXORPKMZMdg6UdCj1qTX2VyIREXkUHT8esr86TATSv4/2MXhZNDV77mZ7WOnmOQ0=
X-Gm-Gg: ASbGncuMIvOjaeqHZcDEe/7gEqebm60HdHMMlQ6u5NAWy5OwUeR05UgcZulUz32bjeL
	dXNxnwZ8pIqzBfgwNUoLgmDQt9CLIAVApxWU4zvmeucv24RpWh3vsR5Z+By53D3oJ34WLXTvfu1
	Aql7kSirHP5Rni74qp3i2SjFPwVM5aBk3g6ULWjyLkx/eHajZBnu3K+3+uKPcvKfuxY5/3bQ2eg
	57tM+27w7xj0RSt1u7/5q2drpb66M8tGPA+zl1jYKhYhWCfRy5QS/2bkWs/sW6NFTNQXr3Z9DU0
	1OJIkhfRyDb+q7PLLEYcgRz4NPK8zDmZaUdoq6TEt42W9rAx+CVItEJjNfV2dxQn77Ii3d+1iQm
	5HZMlEzsR+k4zX0Km2ky0TGP1Ho7lodbIIQA=
X-Received: by 2002:a05:620a:618b:b0:7d3:e56e:4fd8 with SMTP id af79cd13be357-7d5dc66a567mr648065185a.12.1751683650872;
        Fri, 04 Jul 2025 19:47:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFjg/CcD45AAmgdd3TehstYt7pR3hgyi7SoBp8wsgbVpyLR3/nu3VuQCR1BxdlZ/oY2Ff7THw==
X-Received: by 2002:a05:620a:618b:b0:7d3:e56e:4fd8 with SMTP id af79cd13be357-7d5dc66a567mr648063385a.12.1751683650425;
        Fri, 04 Jul 2025 19:47:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32e1b1418b3sm4092411fa.76.2025.07.04.19.47.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 19:47:29 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 05 Jul 2025 05:47:22 +0300
Subject: [PATCH 01/12] drm/msm/disp: set num_planes to 1 for interleaved
 YUV formats
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250705-dpu-formats-v1-1-40f0bb31b8c8@oss.qualcomm.com>
References: <20250705-dpu-formats-v1-0-40f0bb31b8c8@oss.qualcomm.com>
In-Reply-To: <20250705-dpu-formats-v1-0-40f0bb31b8c8@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1624;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=PILnmvpGnr1q9TnXm9+RxFGUB/bQl/VAfEMPj6+eJQA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoaJI8paQmJDx7acunG6Rf9svsL1sBNNN8yILi1
 QsJil1O4PSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaGiSPAAKCRCLPIo+Aiko
 1UbCB/4vpQ/e5si1WCvR1zIPoAKe0Cg64TLcbGLi5QW9+TbtNS4WiMoqWkTqspNexCPf6ZTlvD7
 TPiFirmzpRC03azsgzeifdnimiztH3xJY2OoLOrv/Fle89yDyWnzGUQWxTjc9p+ip86laJrlhsi
 Du6eu7Q83pXnaqO77KFNK4q3YcWEwrjywKDyVb62DYUjkpABfkwxdXfDRPe2bVkm1UkPULF6fFz
 srSV1jIPaHj1LopSyJy7JjwXh5rUsgzGqbBprpyrjfQw9tO+Z8SPCSQTc2SAC4n/imEGRCgKAv/
 U8kqIxJM9tehJVCyDcSA3aZ9y7FnT86MN5QFngDEPvdca60/
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDAxNiBTYWx0ZWRfX2hnz6bX1+5AI
 p/g/CFTYxcFC+Vy8l9HoiqwvDnMMrKengQPQkNUBTqeyZ0Sv40kWsFoQy/Upinp0zz8+rItthzw
 bGbikXrPP4EiCXN+Ma74VOubiZDY062LRBQDOomvALLvks8VFks722U6MfMdGDnlv/0I3tngCTe
 bOtzx20iwK1MkiU4pSV7qfZSe6C3Igc1gVY8YGC5m0p4B1aVJZgvzP//HP76EF4E2IAdimRIkmm
 anfnyOBhy/xee9KbmoP9mWBqG96i4uPF4scpb79fQxprq7Tu1vDkiYjEkxNfqkoSrOkRLHnl4La
 O1k8A2vb0kSrb/20LtXweFPSytCUCp3gXpcRPWjBSlovLkqfqBivKQnprjCT/nByOP3DszyKGu5
 oRhM7jN+A4ruq3O7mWsGAxP2jChCXL0nTDTt5Z1gTgvnzSK5bd6DMT7nj6LOf9LJ1g4hNki8
X-Proofpoint-GUID: G3_ovL3_vvA0avM0ohOtiNdCvSoovBvf
X-Proofpoint-ORIG-GUID: G3_ovL3_vvA0avM0ohOtiNdCvSoovBvf
X-Authority-Analysis: v=2.4 cv=TqPmhCXh c=1 sm=1 tr=0 ts=68689243 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=DB8TyEHaRv6uusbT9jkA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 mlxlogscore=999 suspectscore=0 adultscore=0
 phishscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507050016

Interleaved YUV formats use only one plane for all pixel data. Specify
num_planes = 1 for those formats. This was left unnoticed since
_dpu_format_populate_plane_sizes_linear() overrides layout->num_planes.

Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/mdp_format.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp_format.c b/drivers/gpu/drm/msm/disp/mdp_format.c
index 426782d50cb49d57a0db0cff3a4bb50c5a0b3d1a..eebedb1a2636e76996cf82847b7d391cb67b0941 100644
--- a/drivers/gpu/drm/msm/disp/mdp_format.c
+++ b/drivers/gpu/drm/msm/disp/mdp_format.c
@@ -479,25 +479,25 @@ static const struct msm_format mdp_formats[] = {
 		0, BPC8, BPC8, BPC8,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C0_G_Y,
 		false, CHROMA_H2V1, 4, 2, MSM_FORMAT_FLAG_YUV,
-		MDP_FETCH_LINEAR, 2),
+		MDP_FETCH_LINEAR, 1),
 
 	INTERLEAVED_YUV_FMT(UYVY,
 		0, BPC8, BPC8, BPC8,
 		C1_B_Cb, C0_G_Y, C2_R_Cr, C0_G_Y,
 		false, CHROMA_H2V1, 4, 2, MSM_FORMAT_FLAG_YUV,
-		MDP_FETCH_LINEAR, 2),
+		MDP_FETCH_LINEAR, 1),
 
 	INTERLEAVED_YUV_FMT(YUYV,
 		0, BPC8, BPC8, BPC8,
 		C0_G_Y, C1_B_Cb, C0_G_Y, C2_R_Cr,
 		false, CHROMA_H2V1, 4, 2, MSM_FORMAT_FLAG_YUV,
-		MDP_FETCH_LINEAR, 2),
+		MDP_FETCH_LINEAR, 1),
 
 	INTERLEAVED_YUV_FMT(YVYU,
 		0, BPC8, BPC8, BPC8,
 		C0_G_Y, C2_R_Cr, C0_G_Y, C1_B_Cb,
 		false, CHROMA_H2V1, 4, 2, MSM_FORMAT_FLAG_YUV,
-		MDP_FETCH_LINEAR, 2),
+		MDP_FETCH_LINEAR, 1),
 
 	/* 3 plane YUV */
 	PLANAR_YUV_FMT(YUV420,

-- 
2.39.5

