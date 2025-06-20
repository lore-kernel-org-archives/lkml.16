Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A65224AE1
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 06:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750402510; cv=none; b=G7mrAqTGqWGhN1oUfkIa+rG3iN5Thu5xn0XZVPlQw3oLmUUO9ChCYsZgZ/7yXyzRIaDdTP7UxX01vRiU22AM3y4wSkaiH+k9YdMakFvNEMisoSWRAgwXE4fCyWojfycDdjSY74NjGVV4VY5N3sSnJATDgBfg41MVMeQC2FTzJw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750402510; c=relaxed/simple;
	bh=1oxyf68EFFylCmMjwV5jb0pfG0MEgVawKDcLqM/rxmo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AFeJuz7ewJ/SWvxXgTcG1ERp/npQaSJOxHbiBsywpG9K9kwgo7wtADMnTWEGPjVkE5MYbOF3BY/pI0+kBuogzS6v5QAwoce1qaykXWkvfK7R54+n/HdFP93Z918/+6gqMdpLZ5DAjZqRxfnCq6arxtR3RpK5lHLDchbqj3bWYag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SeR6SXb1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SeR6SXb1"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55K3jJAP001999
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 06:55:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UY8Xz4SAGxjtVkpxY96irg9pXQ6T1NS4IVwFIY8UKPA=; b=SeR6SXb1TsEqQHdC
	p4UluYnmYhsk4gwBJmQfy4n+8j4Cz+An4psweTNeUyZJjCsMFcolWfWiW+v6sFgV
	USDgaX5x7wWUCQnz05F8cgU2NwqCz1AhQTX6/arHEx4E9wVFYy5gwiuODz7I7+lz
	piH2xfuojK08ZNCR2N/pkz6AQ0zKJ8MUTNKfVMLSy6RuvNFZbkifc+SYUF9tzkqm
	r+6V+kioif4KO8eNavxIWQtehgMaePypIL4YyHQO8ce3XGB8PH1IlOi8wws1RdBc
	1injVwtI4E9WRE7s7Hm6MaEsO9g7Q+ckCZYVxs/YRLbUe9lmKZPXQ54XH4rjCIIX
	JoEHBg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 479qp60xy9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 06:55:08 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-23507382e64so16233255ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 23:55:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750402507; x=1751007307;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UY8Xz4SAGxjtVkpxY96irg9pXQ6T1NS4IVwFIY8UKPA=;
        b=ll2uyf6uXcUdU8daJ6vdomyRc1rvrILYM0ZBQGL5HSOKr68UP079tutZyoyPoV3OFE
         WQ50w0Ky0sXTRITxeCIbtN3x5di0Qr/UbCO6yiaLnsMcX6DRZCLe4UecNTpHRNx998Jj
         X50t/4cofo2/7bQudqm09GV/umqftcDUZmQ3F1hZRHSQw1lgJNrgFryEtE8xR1uJzCf2
         T1+LXx6faPDHtmnU1wuPxdrA/MQohe+23ynJpVvG3CO3+1e9ht+WVXXDtoojBg+ijBqs
         HBcdc/N8fn0VjYXmna1GgWmU+cRlyYsNRJu89ruxsy/3ldUSYB4+4SdAqt0y5EvYLD4y
         i+Ig==
X-Forwarded-Encrypted: i=1; AJvYcCUIU4eAYFziUjA2UNuszzUQmuiwEPAwnII+/mqOL24zPsj87MhnrdmzJWDCGdpH9fOxEOSPwKehTMxYPnU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9ASs7MS8MhNs6yyq8BWa1QXg3r1WDcQunqYaBka9gmzKXCulr
	SQ7cqvs9xpMZZRCAcR6GztLEH48rtMr72NB84T2l5zOrs13mX/KK2RR1S1DA7GIHNkAtY4yTtuP
	1Boeu3qekcw4Cb+CtMpPrPB33n6YD4cqwrOUl2IgUHJOZyJCy95zDTyRFR7tjgGwQE2Q=
X-Gm-Gg: ASbGncvXEYjdtUQmTc2UL9GrLXJsECEhtED3yzlijXD2UptLoPyxdSZSvrfSLNS7fAL
	d9O5i/HEzZIH1DfvFoWc4sHadK08HNcBvPOJUEYANuQpOFpugel2Z4f24iglNwJPGX3dKkRMYQX
	IbCT+fDi9yuQ4TeyrIhlhK1wj7JA7aVJtOvY9f5T+iFlBcceKLAy6A7E7fsEx92m5k+e/lMQfY6
	xkhmXPxk4j4OJO65jJVeU5ZvVrawhgRgY7m5zQJINwtf7TdVOJoge7/RPKFDiZPu6gc+WkZW2I7
	JbI+SFhbJNX9LcdaJRFntS2Q4d0InWY1
X-Received: by 2002:a17:903:2f08:b0:235:efbb:9539 with SMTP id d9443c01a7336-237d9906e40mr27772755ad.17.1750402507473;
        Thu, 19 Jun 2025 23:55:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJ5LpDJJHEcZBAtNAGjCwyfD1eLqoPaVU68U54gQ31anHAn9sWvOPT8dxNj9uXQ8vEOHStmw==
X-Received: by 2002:a17:903:2f08:b0:235:efbb:9539 with SMTP id d9443c01a7336-237d9906e40mr27772265ad.17.1750402507104;
        Thu, 19 Jun 2025 23:55:07 -0700 (PDT)
Received: from [10.213.111.143] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d8701c0csm10636185ad.223.2025.06.19.23.55.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 23:55:06 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 20 Jun 2025 12:24:29 +0530
Subject: [PATCH v3 2/4] arm64: defconfig: Enable X1P42100 GPUCC driver
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250620-x1p-adreno-v3-2-56398c078c15@oss.qualcomm.com>
References: <20250620-x1p-adreno-v3-0-56398c078c15@oss.qualcomm.com>
In-Reply-To: <20250620-x1p-adreno-v3-0-56398c078c15@oss.qualcomm.com>
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
        Conor Dooley <conor+dt@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
        Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750402486; l=857;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=1oxyf68EFFylCmMjwV5jb0pfG0MEgVawKDcLqM/rxmo=;
 b=8PF3//AD3gGPG03AcLC4ONVS69EyuqXu0pNc26VvETNgzRpHlRintCMdeMBUfPaRptrZsJlyV
 vJLwgH/Zyh0BgDMciHJYI0hdt2oscEXRCGJBuuNwMM8XQ99xTylLnso
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: PvQ8he1SyZi9RTbo4bzCcKZfWdbyOm5x
X-Proofpoint-ORIG-GUID: PvQ8he1SyZi9RTbo4bzCcKZfWdbyOm5x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDA1MCBTYWx0ZWRfX6Z274LN0AG8p
 QYyr+xjMj/YEmnE9u9Z1X0cATWGI9O8zZYhPEDIDAYmx2BMi72Yk/PeHXs3T3CDG3AtC1q0QQ1I
 IVHiFgybyhSu6eO2E9LMPEG03Dkxu/Im3p8VVeg9izyrA4MrGTb2tXhnMuTx18W705XQZPNYMjZ
 mMfwORiahEZtOwF7eQL07xgAH7T+lW9AJ6lt9hm+qE1MpsoCKe32GbSiSH4F4uAttVh0t3HCnfG
 aaWs0i6Kqjg1MWBG5N5qs9BWIKzICNwgYZQJdP7dGdJ8rrzqCsIQmLC2JmYy4+zKVSj7R0CCFox
 lcSZpY7pipN2HGGtbdPHpSQbNc7jS+DJf5YYhdmNpMvDbUZegEl2zlLPZIMGCDm1n5p1F6Yhyai
 z5SfGjPKn7N8IkDvIrDj5ABYrNdt63g4lAnwYbr0hNLxWUZxWRkL52OQshbh5EmMkOHzo4mh
X-Authority-Analysis: v=2.4 cv=fMc53Yae c=1 sm=1 tr=0 ts=685505cc cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=gxl3bz0cAAAA:8 a=EUspDBNiAAAA:8
 a=GAw9eemyJ_aXAIuB88AA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_02,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=491 spamscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0
 priorityscore=1501 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506200050

In order to enable GPU support in X1P42100-CRD and other similar
laptops with Snapdragon X1P42100 SoC, enable X1P42100 GPUCC driver
as a module.

Tested-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 897fc686e6a91b79770639d3eb15beb3ee48ef77..ccd03ab5de495498281175a4550bc73d3e65f3f4 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1347,6 +1347,7 @@ CONFIG_CLK_X1E80100_CAMCC=m
 CONFIG_CLK_X1E80100_DISPCC=m
 CONFIG_CLK_X1E80100_GCC=y
 CONFIG_CLK_X1E80100_GPUCC=m
+CONFIG_CLK_X1P42100_GPUCC=m
 CONFIG_CLK_X1E80100_TCSRCC=y
 CONFIG_CLK_QCM2290_GPUCC=m
 CONFIG_QCOM_A53PLL=y

-- 
2.48.1

