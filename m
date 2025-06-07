Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 306EB1A4E9E
	for <linux-kernel@vger.kernel.org>; Sat,  7 Jun 2025 14:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749305752; cv=none; b=L97RKFmY9e3jJt9NyHLTRQha6YH5oHrJ4AuqbDCJSL0JQPWfy4jDQGxPL0bm6T7EiKStNEEnXuT3z7ht94LgUK5nEJ+HDI+28i0vPm60879VHxTXzDwQPPOkOfy0Te/DhjZFA7ojzDC+K5r5xnefqoYvV26jJo2cTAMRCWGkD00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749305752; c=relaxed/simple;
	bh=IqnVoqmB8d59JEJdsGY4n78aKgioKIUNfsYGLkBpCCY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OAFLEjWGEQ6tBuLI27bY4jX2tkyTwkM5JCZ4IDK12ziA3ePQyEnjqMCj32mVona6VzlE2SmbASdWFmeg+c4ablFp5/Acp+BOEcGMElOimXcr9cs+HFP5fr0Qc767qP05c4M61kX5grEhSMoinCMNUfrz2CYAT+Vh8/QQojIIKEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jZGHI5nL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jZGHI5nL"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5579tm1G015042
	for <linux-kernel@vger.kernel.org>; Sat, 7 Jun 2025 14:15:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e2nJaAzmCmJpQHSs08XFmrbpQ14EhvsPNPiNTSQUelY=; b=jZGHI5nLZI5hGMaR
	gCxGHxaLP5Y1D1HwZx4aiDNjMae6QwfLi6XgAto57v8VLKsrSKKy9SoH8h5Oktao
	fp6lEIqMepF7jpd7hthOuLbX/BdQsJPvrWBsIfuoAFj9K8TfmuS9jqL8QGNBqqXK
	l0EPCW59iAYf0tYwu5HUujjbGDVLK1dS70Dq2Abw8lArFp2/kfQbYsLX4x94tOmx
	a5u+RAeupT5VKJ4c8/aYfvTMJI6sK3bhWoukt91F2ncPswKdDCYdptPU4Bx2aa+T
	VW3W1AeJsWzU6e6CgZv211VygoZ1F5EzRbb8yQOlW6qfvfvIfJtY1tZYej1dZU0U
	pkg75w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474crkrqtf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 07 Jun 2025 14:15:50 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-235c897d378so28424185ad.1
        for <linux-kernel@vger.kernel.org>; Sat, 07 Jun 2025 07:15:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749305749; x=1749910549;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e2nJaAzmCmJpQHSs08XFmrbpQ14EhvsPNPiNTSQUelY=;
        b=aKFi+5M7oP4F+jNn2P5X44bfxVJei6qndRvWZdCTmrsoXb19yvPlFegorrJ61tmGQU
         OKVylzQU8wCf/lSCVQV8yZ5m7agxgJvMl4d/v+fIp+1q97dZnmsjicz08/qnKkioQl7n
         2+JZ2is8TrDiyTCpOWAs4QXaYUK7aPWc2K7S/zYYgQlLofkCOHGUH+qNzGQgzbidbju+
         xPkk8NOxjo5R94Icu+KYIxpQ9/2UszvlMhRp3SDvv9iAXx/PaociBb49xtd4HmyYPAvn
         Hf2JMXQdkNihxbhR+IbjDcBUkZjmX0H04t+WEcxFQplLPwBmHMLUFgilQEzVqsOcJGWW
         S1TQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUPwUixj3gRyloC95J/qnkAtTIPySefco0gxiQ667NEWjkYTna+AWfSg0T60dXFszQscHxgUYUsKWLahQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGRwq8eWcNIfKsFRYmagkC3GliN2rrvSmyb6XsJjmYBOkRfvp5
	D7fhuLjS39oDjef3JaBIBnVYDFUgeKcaiBAzJGZIStJRhKsREbeDs944oUUwWmnm/iseNcOO3Pl
	2ENAKpAx7dP+wFHNVPStAUfd4qk1DAcq2HBpXLg8fNgR+HH/bFEbkMNomNzyFE7kZcqc=
X-Gm-Gg: ASbGncs7qr4tqIsHdUPFwprjGvPnKVl9PkGs0UTgRQYaRDWxEjWTkdCnk2T8dd5uvCo
	NlkIi4+ViEaC3Agx3b/Kp1+CSBfNEOpq0KER83exq60+PXS1oTLKRfME/8NxmthLj/Xw5GFebOU
	KPi/mw5T9CzSQVXWoVe8HknvxYpuak3xa1xN32XZSYL2fZMzWhIe3Jlx1aBVZYKj4tVn2Z+BGOl
	NuQQgPBU5/+LSBSrHoVw4DZME9HFRAJHUKFHqij143KD48DlfTXJc06QdWInqrY7APfNtW+pU1n
	Ly+k9ia1nrKDDbGc+K403qFT6K3rv2hM
X-Received: by 2002:a17:902:da8c:b0:234:d7b2:2aa9 with SMTP id d9443c01a7336-23601e7f4eamr98882155ad.29.1749305748836;
        Sat, 07 Jun 2025 07:15:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGHd4AhO0+uyFenbxz5BoU1UkltM+5rAvhX1ayslAlVrN/dKMNnxfksMZHw0Th/YAjYimUSGQ==
X-Received: by 2002:a17:902:da8c:b0:234:d7b2:2aa9 with SMTP id d9443c01a7336-23601e7f4eamr98881805ad.29.1749305748452;
        Sat, 07 Jun 2025 07:15:48 -0700 (PDT)
Received: from [10.213.111.143] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603405732sm27500435ad.155.2025.06.07.07.15.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jun 2025 07:15:48 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sat, 07 Jun 2025 19:44:59 +0530
Subject: [PATCH 1/3] arm64: defconfig: Enable X1P42100_GPUCC driver
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250607-x1p-adreno-v1-1-a8ea80f3b18b@oss.qualcomm.com>
References: <20250607-x1p-adreno-v1-0-a8ea80f3b18b@oss.qualcomm.com>
In-Reply-To: <20250607-x1p-adreno-v1-0-a8ea80f3b18b@oss.qualcomm.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749305735; l=768;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=IqnVoqmB8d59JEJdsGY4n78aKgioKIUNfsYGLkBpCCY=;
 b=orMoZgj6M4ufoVDkueL+fO7/LhI5JIhY3qZdqVDmIqEE50/Kj3kw5xT+6x+14Co9K5qyeq0t5
 mqNkL9pGnTGCbInzyOTHDsuUrJiX9j4N5pxuICrEcKGcCO12weAfn8F
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=dsLbC0g4 c=1 sm=1 tr=0 ts=68444996 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=1cELwbfB7FenbO21xW0A:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: 5ka7masufRJlzo_Fu3_gPFfIO-ylOoRu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA3MDEwMCBTYWx0ZWRfX7JCUw6h2J1UU
 TSdSivqLOhh7TcQqXY8ewUWZhyQR+zUtStaurQfrz81Nx0fizjSzfT2+PSIcFY/OHWDagSdDU7l
 OSg24uU4TjRr+xoUNsPtRycWfOeG1qreGybnXwgYAfmedjOvrBWsi/IT2RcSB8XKqFdNZ7hM4bX
 NMti+dm6Da6IPcgguvde0SpbOjMxD8Wnsy0gljugPcjpe4caxFrSgobUDTJXWU0V/KswCMI5gjL
 hVekRmopWhzL3FcREXFyoQW15YkyhCzoXvrXqCjQaceWT1u0wfx74h8DyGYG7roZ+IAAgIb/EC5
 sGN7Qhz2tDkswN/lhvgCp6bjIkZ3dq14Jn8q7aFze5Vtxziof63lSpOOGXGmmEsd6dYJcsYP1k8
 ggu3szrhd7EwRZ8vJWzefsVvkf1TH7ASOEyDp1sVQJhi725ulakFGHVeXk9jfQEpE6rvO7JV
X-Proofpoint-ORIG-GUID: 5ka7masufRJlzo_Fu3_gPFfIO-ylOoRu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-07_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 mlxlogscore=597 bulkscore=0 adultscore=0 phishscore=0
 suspectscore=0 clxscore=1011 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506070100

In order to enable GPU support in Snapdragon X1P42100
(8 CPU core version), enable X1P42100 GPUCC driver as a module.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 62d3c87858e1817bac291780dff3823dacd72510..9cc473fd0d3308f7869d00425e17b114c87093b2 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1350,6 +1350,7 @@ CONFIG_CLK_X1E80100_CAMCC=m
 CONFIG_CLK_X1E80100_DISPCC=m
 CONFIG_CLK_X1E80100_GCC=y
 CONFIG_CLK_X1E80100_GPUCC=m
+CONFIG_CLK_X1P42100_GPUCC=m
 CONFIG_CLK_X1E80100_TCSRCC=y
 CONFIG_CLK_QCM2290_GPUCC=m
 CONFIG_QCOM_A53PLL=y

-- 
2.48.1

