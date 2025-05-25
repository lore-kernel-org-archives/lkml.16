Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45FCB17FAC2
	for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 05:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748152658; cv=none; b=qabRddJPtAsijDv2giBuARvbykkKkNK2ElGfMzWWCVw4mzGRXAQO6qer+1f2F723QpXWdWDqxJARdwtCtsv1BxOh7Hv3ts51FaGszjgME/MZO9bDNpXwXNjC7EyX7pnfIRiu+sjaBWPkQpgDCdGSy0A8q/sEe5sPMV2ZGG/Q5jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748152658; c=relaxed/simple;
	bh=9ozY19np9D59zhCMV9nEj2Z3kQvxFnZfxXl6FezHh9k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BQW7j6F1FPFkgN887XnPkYLBsu+ijyG93tbGTNLkWDD9zJjyi1gSA2SHdTWfn9YRBHWbEmZa78vFVBDdgJZzGDTyfJdDkCdBA3Wugeh1i0lGilC0H6bSZHqa4L+JuHf5fERe1shs+ojI22zkMZUOUhhNHZhB1X9AbaZ+9z389TQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GB7hrnOh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GB7hrnOh"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54P4MG52022625
	for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 05:57:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zCBrRVec53XJAJcr8a7rcd7CgHI9045Hz8PKjdUV4vM=; b=GB7hrnOh7GM7LAYR
	m62gizWlb1RHncaAKE0ua+Rt/1OnsmXG3YbO+WTjuKU70W1BF0tgB1+Mq4i+i6hW
	q9/3sIZEYZ3DGLLRhwgkLZDkAhKM9FzGQekbLKuj++ZLh30+9swLWdNN4iH/3RfF
	1f9zCKYpEAXcEbGfUkLFGlZDfKVEyh2iK56oye8LNwFscG470Q4ALQ46lSpyf8WQ
	7AsmD2YSu1suOrlRR9v68J0W8xk3u4GvBsyaGS7lfZgEj2gqMjLCHr0isQiiDVww
	sHVp3qjF/Rsxl2dnZecY/U2YI1SFWo4JEgJgmnCO/2uB7U1tXkCXJKIug2QWWtDM
	DLbBZg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u66w9hys-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 05:57:36 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7395d07a3dcso851493b3a.3
        for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 22:57:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748152655; x=1748757455;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zCBrRVec53XJAJcr8a7rcd7CgHI9045Hz8PKjdUV4vM=;
        b=avAmAhTAbzrkFsNsdWxDf4KWfUuG7bHzBuFdgMq0c0uliRNz2GRyY+baOYEpFKhL+a
         hsUEX1gRS47kGkMsUOkLHcOKSzOxWJofOxozYAK0QM7vwPwehW2O08C7fy6sNJTlrqoU
         ZnBcTJtyIXravC6dg5PVNi09fH70dZvbn75SZWFDZ8GZsZlAiC4rGCSXcE+vk31yJSWU
         CHoygRFOJraYiK9pM8QAvl9hh3npzCLBHTW1x0iluzxJtHyxDv0jvDUoz2gzKn0HWRi7
         A42REAKsMAYiukNIr39NiyngRb2fkNryDEK+QdM9be+XjdfTLsTRC/vUa6i44BajVziJ
         gGsw==
X-Gm-Message-State: AOJu0YykelerX8ddxhWnDu0wJkANyKV+e9ir5oXE7F/zdj3Et1ZHroAL
	OXEs1kJh/vNgnbeTMU+Hhf4RCaK0LcfI1DxhEDbKgIjF/iR3Kys225AGG522HPATz5936/vCxbf
	O+Foifx06KRnZD3fTKMvNlmEFOVUy9oYSckWE2cASs0L/SthfFdVPKiS0iS0/TvDkLWc=
X-Gm-Gg: ASbGnctrXCd9Endi7qiTRGFlW9DQQtLcPR1qKK8fBTQplj4j/Bp//06owqB5E6c4L3d
	AVvTEeplg2XSGahzcQ+tpR82rXQQv9KJUZTZuroYsojQz+YFqyHrqcpPV806hPQQa/bs3vi8UBo
	9N5a0McrMRxfXH0QgfqvJ13DwHfONLt5BslaZkxIdyLomAQlRMJcYYxfELFeO0KHcLp6afFc1+p
	zygtKbmDWX9xq9CSIEZ3VxqYdyz8aHwnxFpV8YlrgHtmFSL/YmJ6TitfDHo6FZd/LBavGwymXvs
	p5Z3QcKFKmqVvxRE2xMx9xRl4YeJCoW1lyZn
X-Received: by 2002:a05:6a20:6f08:b0:215:f6ab:cf77 with SMTP id adf61e73a8af0-2188c28ac6fmr7979912637.23.1748152654960;
        Sat, 24 May 2025 22:57:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHYB9ys5LU41WMsUNzEUbblt6pbgRfq0ZbrNTfi12+yDo2o8NBvJF6v2pb7A79rQ2Bbbd2jZg==
X-Received: by 2002:a05:6a20:6f08:b0:215:f6ab:cf77 with SMTP id adf61e73a8af0-2188c28ac6fmr7979885637.23.1748152654611;
        Sat, 24 May 2025 22:57:34 -0700 (PDT)
Received: from hu-msarkar-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a9829a4dsm15594030b3a.107.2025.05.24.22.57.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 May 2025 22:57:33 -0700 (PDT)
From: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
X-Google-Original-From: Mrinmay Sarkar <quic_msarkar@quicinc.com>
Date: Sun, 25 May 2025 11:27:18 +0530
Subject: [PATCH v3 2/2] arm64: dts: qcom: sa8775p: Remove max link speed
 property for PCIe EP
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250525-update_phy-v3-2-5b315cd39993@quicinc.com>
References: <20250525-update_phy-v3-0-5b315cd39993@quicinc.com>
In-Reply-To: <20250525-update_phy-v3-0-5b315cd39993@quicinc.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        krishna.chundru@oss.qualcomm.com, quic_vbadigan@quicinc.com,
        quic_nayiluri@quicinc.com, quic_ramkri@quicinc.com,
        quic_nitegupt@quicinc.com, Mrinmay Sarkar <quic_msarkar@quicinc.com>,
        Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748152639; l=1254;
 i=quic_msarkar@quicinc.com; s=20250423; h=from:subject:message-id;
 bh=ZrWCEywu0mWwC+jWkykM+m7UXWwtOyeU4GP0qpQ4gdA=;
 b=Nol7LDvUZeI/WcrBH10lNY/PP4g26x7BSa57S+p9a1rFdJ1BMFs4YC/57HgFFjJAxnjdGJUXG
 Jov7H1oROAaBPWVX374fo9Rx4rBOEDS7JAQ84wyluHeGu5RQUOFn4aJ
X-Developer-Key: i=quic_msarkar@quicinc.com; a=ed25519;
 pk=5D8s0BEkJAotPyAnJ6/qmJBFhCjti/zUi2OMYoferv4=
X-Authority-Analysis: v=2.4 cv=aYJhnQot c=1 sm=1 tr=0 ts=6832b150 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=A2jF9ndpTPISZJbatkMA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: 2mrt-uPCFAe_I-G2mIhkf7pWhr_6kGz4
X-Proofpoint-GUID: 2mrt-uPCFAe_I-G2mIhkf7pWhr_6kGz4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI1MDA1MyBTYWx0ZWRfX+tIpYNZKUFyK
 TZxzKgVYVEMq+Rn2FGYFrtq66+yzabkHnHifkSSvUjvGiKpnsqxWUtwKZP4X5GOYWIO47crx8Kp
 qgxBx5dCe6GlCkETHfSq+NzpN0VwmZL+KvKRUbUWNgyKbiaBwdLx46GgkghQoTPvMVvvMhH+CdB
 sQr1yJRPDK0FcRfXYp0a+pfEoBOsA15JOcY7nMbJAODqW4PRSSXp8BRPesNPqaSkTZxAu7yXTMq
 VBJvFGJv81LZJJznIwwB9yNO8SL7SThADg3S0g0LvORsEVJgYzZawg1fwlTJBLqROMFHdCww7Fd
 mqMWLJCACNCmuaNFBjwB3KmhL2LLkMLFx+iZM+7/j6bxjk0EddC4bNiVqqZYwmGHPIeWAdpSesN
 TJ/01Rv8wn5Vyy6kbk0s48iJvp4aBuDTvCNjP44mHecY/yC+092UgmtTn2QHTmRmTz2NNc6A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-25_02,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 adultscore=0
 mlxlogscore=947 lowpriorityscore=0 malwarescore=0 mlxscore=0 spamscore=0
 clxscore=1015 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505250053

From: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>

The maximum link speed was previously restricted to Gen3 due to the
absence of Gen4 equalization support in the driver.

Add change to remove max link speed property, Since Gen4 equalization
support has already been added into the driver.

Signed-off-by: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index 5bd0c03476b143444543c68cd1c1d475c3302555..b001e9a30e863d8964219c8bd61bc328be71b256 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -6462,7 +6462,6 @@ pcie0_ep: pcie-ep@1c00000 {
 		power-domains = <&gcc PCIE_0_GDSC>;
 		phys = <&pcie0_phy>;
 		phy-names = "pciephy";
-		max-link-speed = <3>; /* FIXME: Limiting the Gen speed due to stability issues */
 		num-lanes = <2>;
 		linux,pci-domain = <0>;
 
@@ -6620,7 +6619,6 @@ pcie1_ep: pcie-ep@1c10000 {
 		power-domains = <&gcc PCIE_1_GDSC>;
 		phys = <&pcie1_phy>;
 		phy-names = "pciephy";
-		max-link-speed = <3>; /* FIXME: Limiting the Gen speed due to stability issues */
 		num-lanes = <4>;
 		linux,pci-domain = <1>;
 

-- 
2.25.1

