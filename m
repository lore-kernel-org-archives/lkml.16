Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B84285CA7
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 17:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750268998; cv=none; b=U/LJ5Zsj+3Uo07Jrb3q+y6cryNjsN0eN06smIZB+PFXFYpTjIpQAXkSD00za+U8Kt89JQewu1HFb9KcmHEdkDXO5i8ey1zlitz5Vco/61bEyGs3P1t+w+ZcysgvRnoGJnZvnGGwffqPFc1LJOYwwARFItE29cF9A/YTDEe5CehM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750268998; c=relaxed/simple;
	bh=9QXEDoI19mWFxCahL1UdCvEjFuKYp7fQOj2r6nsOxEg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=l/TTtRyihFTBapZyZGnDliREpvax26ACTjLEAbEHLqO/TGa2IApm78Gz3+3GugmH29eFbCFIokve9cdjnvuKHdq1Cdjau788WzTgiTVotdf0u1nKu9twUaisXV3IE+O9w9acibOYCren/rKpsw5uWiZVsQjJ0JZ1ZW0oW2PRI9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M5LjZ62h; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M5LjZ62h"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55I9kxI8032248
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 17:49:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=6KcFqDLk13hgOnopRV7cxf
	ycwpTo2vObGPCFt9jCm+k=; b=M5LjZ62hOrvH3AGLMj+grgRbIuMyMFdvCFQAy8
	ezw78V8b4sUBlJ2kWZ1l4mIB406pxpWsKKSTpDVryZr4OUU/aXC6mVa3mCa0mMXi
	vmm7wouJsLxhQV04IByXH49tEQzgat/LecLj+hnZ4LIhckMKaqRhzgKUrxHHupT3
	kp/TwohqnGcb/S/P/2RCj04K4BpiF8xRX7B42BAFMwVUYo/w7aqPvFyXNs3jCGem
	S++a1JJU7bCT5wiv1weWSeXo8O88jMWmIYxQ9Gx2QOE4tGeeeUEUXjiOy1U5ShDf
	NxcSEhZsFnigxFlX48dr+jmRYuzUoHlJu4u/7BciDX/gcYPg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47928mn2t7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 17:49:56 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7caee990721so1751314385a.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 10:49:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750268994; x=1750873794;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6KcFqDLk13hgOnopRV7cxfycwpTo2vObGPCFt9jCm+k=;
        b=apNSQ6bQicjTLpMQlL4K2Q4t0kgle7lITCHmnudw5/QElOoeXrDshRvR56uhwlzJ+4
         esBofGpTmos5VzV7s6AfCaijPffbEIkPD6GjsSAdLj9Jl1pSLUCo/xVO6L7vKb/FLYdb
         mKJsKgoUTE2dPTRsBhHwoQfonQL9CjZ4FISUIdnI4S5wuib8CVJTO7mk6lbc7kbsU9M8
         JkcV/SdMIbpj+BFoBX8bUMSAhSYVa03GprX241uzjD7DFNfhmpChH8dOo+3Mq7RPUCrW
         oSBh/3kyKatGZvOlqmDiC86UDjEP5ZJF8bGV+LCa9qyhlvlvsPos7lzJitxosi0eF2zI
         uORQ==
X-Forwarded-Encrypted: i=1; AJvYcCWs/b1ZajZplEsl+qwjGMFI2VlmIMJWThlPJzb5qtMaK/Hih2wymsY4nCswsGZtV7s1u5pb9KlRSL8YE50=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxa6lk7sBcOKcrJZJpD3SeKgy/TX9wIyiMhqGm/ZownRcLPd0ER
	PxQSZWi844REu9Jzzzi7Gm9HSfWvTAaZbyWHjiiYWhGz44Q4WRgYXb9cFNkawZwdpCvgRb95eAC
	z2xzIknNitMJyAWWjQE+qRPUVxH2TnVuYIElU1k5d/1htVbDZFccrl8xxdJTXbmnVt85jYXVNzL
	CX2jJB
X-Gm-Gg: ASbGncszsCMwASg5P7PUUBhaJ3iUMZa/oSaVq9qSRyZbx7BIAyMG+uirFXsxrQx/v5B
	Xdq9NqN9vzSqxWQFd16ZiJl5AQvBPyg2iCvQNfuNPl8W8eLQTu80gCc6Oz7Ga44LSxfb8+wti0A
	4OwWLEVx2dMZJPaqlhacumSFZgjKaL9aUrr1PKrGcmByh5UQoMN+M68OAe9UlVCSv4fcyAURy0o
	NFi4E7Hu7u115gHQLISWms/a85hoNSt1hRe0XzlERMQVRk3CA08lg+RmrTOfBhkrYyq4ovZ0Uwu
	obx3MJn/7gx4zJEOvdEr0edRu11qD7nsasuRscBV6f3D3dZJxn8uNKkfRb8UmGCmpoUo86SYn8R
	vLR4P3cSKzZyhZsqDHh+ymofRgJg19CTWFeg=
X-Received: by 2002:a05:620a:f10:b0:7c0:c046:7c6b with SMTP id af79cd13be357-7d3c6d03284mr2687714585a.53.1750268994450;
        Wed, 18 Jun 2025 10:49:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF60X/jqz7yMGtPiVnJDZu6KGocoOhdfxhEdsn4Ftu0Gh//3WaeGd+GFWfujYMkVHyzNfeH4g==
X-Received: by 2002:a05:620a:f10:b0:7c0:c046:7c6b with SMTP id af79cd13be357-7d3c6d03284mr2687711185a.53.1750268993986;
        Wed, 18 Jun 2025 10:49:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32b7b43a98esm2911131fa.65.2025.06.18.10.49.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 10:49:53 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 0/3] arm64: dts: qcom: sar2130p: correct display controller
 device
Date: Wed, 18 Jun 2025 20:49:50 +0300
Message-Id: <20250618-sar2130p-fix-mdss-v1-0-78c2fb9e9fba@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAD78UmgC/x2MSQqAMAwAv1JyNtDFDb8iHqpGzUEtDYgg/t3gc
 RhmHhDKTAKdeSDTxcLnoeAKA9MWj5WQZ2Xw1le2di1KzN4Fm3DhG/dZBKMrx7JZbF1RAO1SJnX
 /sx/e9wPG9sdDYwAAAA==
X-Change-ID: 20250618-sar2130p-fix-mdss-a14b47f065e3
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=757;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=9QXEDoI19mWFxCahL1UdCvEjFuKYp7fQOj2r6nsOxEg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoUvxAAgHHcqI9vhl70FRO/ughoHUAI/1rwy0OW
 iHqdb2wGIqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaFL8QAAKCRCLPIo+Aiko
 1W2SCACmp9viLbwYyYfaNMpbIJPaDcO+att9+XDvgEFTXnFnXAWl9aPY58yrojqqv4NonwMI8AI
 EBeYewKedPxKkHKw07i37NNwK58TKV1gv8VWYSpE2EOAAE1Qw307LlHF8Vyux6WTz3mVqHpoSQf
 UzfHBnZtqhSWw6XM4EWJx26B+zTIwf198tcLSfPJa2FG+lkQezk5GGfLQV/tcK5PAKtV9Odlawq
 Bf4rT8rY9oJkE0+C3sdz+dCNsRyOoChsHoL/pAlH+TFD6zUGFppMAe9jXGi1bOdwZW1Ph/fde4T
 65mKmvzJjuRc3embXCQd0Gd5T54lT4WrM9DUkJmJEThHRwEV
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDE1MSBTYWx0ZWRfX+OO5+PMyfQW7
 YNl3dNjWHUnXknKkPeR3aJyek9Ixp5qUbbvFrs+gKZIaSFjrmeRz3O8/jDDlfIkTJ4gMRn1AA5Y
 tsssRO/nf7bxeuGnUQWeRfev9cop9ke3+GJ7BvEC9WQhFkswREZc4x7iU3mLqHHm+egUP59It51
 RAQITL6iaIrXQ2rrFCbV32HUWuHaZSsytPWgewkVSraqaaowZYpORz5aF4G5+01VmyEIaeC2PDz
 U2pFEQvx7yVdTDShuhxKWgSaF181EU8UBM5KSyyYMZNOYy6DRdB12afH/SpOYBn/O44V0UQHN8v
 To+1uDlHFCfs9PKut8RNI0low1ohC2RldJw/TmX8bYLbzyU3Xcw+B3pnkr8FGIkjYRYcz7WrdQN
 H4xnuFrEA+o1lZoBZkcIjeKn2TrP4qiNAmgJBPiW2bhpNgPdko7mthM1lFQZM38mVJMsbX2d
X-Authority-Analysis: v=2.4 cv=fvbcZE4f c=1 sm=1 tr=0 ts=6852fc44 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=A6ng92C9FvdBp_T1eIAA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: j0lPpZZ40sgOhV0NiDG2DxJlMya6GgfR
X-Proofpoint-ORIG-GUID: j0lPpZZ40sgOhV0NiDG2DxJlMya6GgfR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_05,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 mlxlogscore=889 phishscore=0 clxscore=1015 mlxscore=0 impostorscore=0
 adultscore=0 spamscore=0 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506180151

I didn't notice that Bjorn has picked up v1 of the SAR2130P display
patchset instead of v5. Correct several mistakes that were fixed between
those two versions.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (3):
      arm64: dts: qcom: sar2130p: use TAG_ALWAYS for MDSS's mdp0-mem path
      arm64: dts: qcom: sar2130p: correct VBIF region size for MDSS
      arm64: dts: qcom: sar2130p: use defines for DSI PHY clocks

 arch/arm64/boot/dts/qcom/sar2130p.dtsi | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)
---
base-commit: 6e5ab6fee68df8c40b338baeae6e269fa25a7e25
change-id: 20250618-sar2130p-fix-mdss-a14b47f065e3

Best regards,
-- 
With best wishes
Dmitry

