Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7E26258CDC
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 14:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750688068; cv=none; b=XWD48MwL3BXLmU/6D5WjBe2UqdKzs/JE2FRo/Obr/yOmbctZUMQxin0dmR/BaOpVIZQK+UGFCw1Ma82JIPTvNtDQ/7wpTzDjn3AjKiHf3uNFV7q0sD4C+J0waQjHK6ARTXHBuiXNH110H7v3tSniLKqtF52QdTGh4SWnTYl7Xhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750688068; c=relaxed/simple;
	bh=CXzUmqLlLPgJV9fUhlYdmN7WEdQrsY5odxja3TUwO60=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Mta1McN4EhzMUjlTrcD3mnoEQxxSYle1gXqyBpAFjTO+IkAhr4XeXTovwJ0V/U6xqwr/6Mn3EHNWculCVpmworQQXihtkgM0z8DDM1q8Cw6aTaYkSxc1urVsVYJkKJHUQL3HICIV2zRhOheAACendehLPNUZlxWB4VpcAU4HjW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P5YqHr6M; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P5YqHr6M"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N9r2DV014481
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 14:14:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wZMlnY8BYR2NJHtTMgElKXRX8o21D4nyviqYLbRcalE=; b=P5YqHr6MEH8Mx9NB
	/WYUbki4mLK2IqtMi4oqNA8F76ApbOVt9fG/gMv39Td96PfzaXZHfVdcbyi9d8lY
	LgSt97mPI5rvnDUC7a2kyvPIwvkbtm7hbut8Rpji80JQ/IICE4+Zx/aRB2JgzaQC
	WFgZkhvtNq8K18mTI/bW7USM9s+KoGbZ/4x6QHLhyplCc/xdgqAFmUaWckdYAhRz
	+x3u2b/YE9Ub9h8d7p2XmFqR8cstAcXXzZ+mfSVL8FPQZI765U5b8pVaBRSeSjNi
	bYB6XNwbvBfgC2ZUEYGhScDIrDB5K+ko5x85KNIRvJC8zP5XILZTDDp2koJ5PzVM
	sOXn6w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47evc5j0ym-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 14:14:25 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-235e1d70d67so43014985ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 07:14:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750688065; x=1751292865;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wZMlnY8BYR2NJHtTMgElKXRX8o21D4nyviqYLbRcalE=;
        b=sQb7W36AaOApPlEdvIIAAZzDzekV/MzhhDTnodqNdJX1JGSYM1VmRYIoCYHpH7kQCL
         8jwvFwfLPVrrq5WGuSaMb9cU+7tgoNRYC7mj5B5yPxGSTKmwOkCCctjqGTNzXM22AqRm
         MbKHg2hbZHowQepQVpXtXYrZbqbpCEfmESlIxzoyEI9tEmUwgNB08h3Frm7HH+Csj5fg
         cLsqj/HDJyj7dJa/uoYHbcFo1Gv4DvqV5LDeBnk7wkpuJbxW6qYTNV5+ldErpYBDtmvF
         3Ilhz/QGLmoc/OTwXQr6IG2DOSLcH5lhD2hctMB0oVEJjmVWmby7T2jxh2GDZtTelQPd
         rB0A==
X-Forwarded-Encrypted: i=1; AJvYcCWfm4t9g8h9f+4riz+WjorpztJKYDePqQQydErHgdpf/FV6/l4Al1LWa+25b5g6w+mcBEkzsWajmFvsCg0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTJdRsg2CJvQF9oCsQ8z/oxfno1pkR4udEQJzOSEX19CpQxER3
	Sx0ziShRKbqdXcDWNSHIy1z0l+3BMGarLapVOn/WXJNzZyPiSRbSkk9Hs2+KRjg5aspqpV5pvbm
	2Xko7JzCdzw2etU9zOYuSa0W41L1e+CtvHr4btJIEqdn79QqUeyNIAiq9ZxvOjoO3pck=
X-Gm-Gg: ASbGnctHoJhQncblEK6aHMyx/xXfu36QXMfHGoJYhlSlIuUuJMhvsyNATod+08047qx
	BQNgz8KQ9KG/zCFypE6KrsBtYjLRkSPL1qU6z16+OjvqXXNC2PG7Z1W1dIqqkwbYMtWBPUWRR/g
	Ir3267lFX8kTLHnQZdmdlAy5EEQTq9zS7bywiBFaddUDwDlZmqLLENIhNjTakeZ5o+r0zrl/uHG
	KsZag83uadn46iJ5fkMPQWOXdrY/IkzGhQGJPLOhKB3ou8Dtb7tm/qPa2mk8z4MJwwtR1SNz968
	Q9nvEy3tFZ4+2xSF0I0NCOhTW/2EGSbF
X-Received: by 2002:a17:903:2381:b0:235:779:edfd with SMTP id d9443c01a7336-237d9aa9e27mr198761035ad.39.1750688065065;
        Mon, 23 Jun 2025 07:14:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJYwVOtji4ivszfg3dCwr+wwwtTLGvgE3mvwgNUp3nkK1wJ0Yg7CyP113mzC0FYbbRpk6BeA==
X-Received: by 2002:a17:903:2381:b0:235:779:edfd with SMTP id d9443c01a7336-237d9aa9e27mr198760425ad.39.1750688064536;
        Mon, 23 Jun 2025 07:14:24 -0700 (PDT)
Received: from [10.213.111.143] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3159df71c4bsm8112049a91.2.2025.06.23.07.14.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 07:14:24 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Mon, 23 Jun 2025 19:42:07 +0530
Subject: [PATCH v4 2/4] arm64: defconfig: Enable X1P42100 GPUCC driver
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250623-x1p-adreno-v4-2-d2575c839cbb@oss.qualcomm.com>
References: <20250623-x1p-adreno-v4-0-d2575c839cbb@oss.qualcomm.com>
In-Reply-To: <20250623-x1p-adreno-v4-0-d2575c839cbb@oss.qualcomm.com>
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
        linux-pm@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750688040; l=799;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=CXzUmqLlLPgJV9fUhlYdmN7WEdQrsY5odxja3TUwO60=;
 b=4uyHJkQisGznH0LxP67gAcDDVSB8DRWaZ/k7WS/BKOKxwSHsZEn2+ComoaYVBYm9FmzCZNeKG
 czEusA45p6KAGXSG+1Cj3wlPTXnM/Xmw3CDRQojl9WKtXxK9jjDoCMb
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: TbC2PmQ7oW3dejn0NUhMBm5a_Ppx_--d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA4NCBTYWx0ZWRfX7nQP7pZyWYDD
 7cIx/zpdi28Kg3xv0d4Gx1fN3NKcWM6m1C/W8KqEttCRq47H+mOyR3WEJubr4skwAzNzfbzicsM
 yo8w7iNaKFKdH5tqLlvpA+Rnt1yMSrCJl1AnmAtnAwS+NsOsuiX9BwtghtnSjNQVgpS27momnap
 bRKZK3mBfqnz5AsbSNRF/BiJ6df5dsUbn7Wza1pE591QGrcEKx5G0L5WGZapa6SqbI3qxfVgfK5
 QWy86PS9C3uTp4RHY0EW/qeNkmc9NpOebBsP2w5dNvdnYBoXA293g3Gysa3NPb6r+qg3zZU232z
 GispGkXiH6h39QXmkneW3cpsu2VN3Svzg5imH7Wb6G8UgXctDbYQqVp+GTaWwa3ST3hZZcFf9xg
 +PxHDuqlZZhbuIjcWtRw32nV/1+vmw0b/SgkCWZLMOa9ozRg/CK9hqcMVwrrgkofjuZdsfTz
X-Authority-Analysis: v=2.4 cv=caHSrmDM c=1 sm=1 tr=0 ts=68596141 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=GAw9eemyJ_aXAIuB88AA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: TbC2PmQ7oW3dejn0NUhMBm5a_Ppx_--d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-23_04,2025-06-23_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxlogscore=503 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 mlxscore=0 spamscore=0
 malwarescore=0 phishscore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506230084

In order to enable GPU support in X1P42100-CRD and other similar
laptops with Snapdragon X1P42100 SoC, enable X1P42100 GPUCC driver
as a module.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 897fc686e6a91b79770639d3eb15beb3ee48ef77..c381ec0f2b73233cb3b4a19a214b69f534b3f519 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1348,6 +1348,7 @@ CONFIG_CLK_X1E80100_DISPCC=m
 CONFIG_CLK_X1E80100_GCC=y
 CONFIG_CLK_X1E80100_GPUCC=m
 CONFIG_CLK_X1E80100_TCSRCC=y
+CONFIG_CLK_X1P42100_GPUCC=m
 CONFIG_CLK_QCM2290_GPUCC=m
 CONFIG_QCOM_A53PLL=y
 CONFIG_QCOM_CLK_APCS_MSM8916=y

-- 
2.48.1

