Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D25828BAB1
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 10:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744712809; cv=none; b=hmyC/y83sOxz/gC2a87z+7Ci6wkIU2PQHgvEdj5w0xCRsGl9xxheIIlU+KicWhdfTye9feABGwGL49K/6WcgyYTJWI11/VWzqvgnbOifyaZbqFM15dQvFJQ0JVp1DvDsEymXoKSQlpwj+iW1vVjzjEgRiJOVJqY+/Fvf8K4BTrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744712809; c=relaxed/simple;
	bh=BvBgB4W8ZTcKk/G/OhMfWkB3234lu+MaknAkVorM69k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ep12fTl3Bbu2QBX022Hle66CanvdNfmiCXqS6GDFyO2kOXygNyyvlt9LcWKLR0whexyz/Uluw3wuEpfB8kHo/5ypEA2RHH/kqhk62DDukf6PE5MKeDgDhsX54VeBB6vWH4gNYmNVrJSOH5JX1Mj9G7Yigu3eBz7WHogasv4h8ZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vci2Z4hS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vci2Z4hS"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F8tXIr002516
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 10:26:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3pGt5ejzI8IOPpo8hiP+48fCdjrnk/X2xOagmzMPwxE=; b=Vci2Z4hSVZJlXmmB
	YoCWYtcurFtig04+bplOl6oxjC6yX5pjwR/TRuHszX7QmoeI1D8qQl+msIFiF7r4
	ebsmXYzTM0TGQRJWzEkvpRbHKZe5iu2Ckd+SHRqlkTApwJwZhpCG0aeUn09T6uu7
	BZdorvT7PFioHru7B11iEUxlsfJTfTp3qRHQiCM7FbiIsptkpwlEyqTg+DLcCB+k
	+bdg4UusQ+E39lhPFu1aKLLhqolKqXEVadCd5NCIkQoaFL/p5sOM3aII5Y+hVdv4
	DRblV1/YHJXjTWwy8jBw51JOVybL29W5GCQN85GvK0eBUbk2axcehtxA+r32/UYd
	oD1NgQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygxjygvd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 10:26:47 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c3c5e92d41so829487085a.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 03:26:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744712806; x=1745317606;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3pGt5ejzI8IOPpo8hiP+48fCdjrnk/X2xOagmzMPwxE=;
        b=GXLD2qWy6uoHpX+aPlFeX/Nidhh23cl7Z7/O8LtqgWckn1JQpJJFd55kKSQPY2I8Ft
         vv+++L0TPupJ4yslUq6SzFYVEDu021w5TaFMnYcTB2Bo6/EkN5oev34pCQ4/KkIXwG2E
         zMqfJALDQe60jsnNSDwZW0S4xyitRmfOFj3IIkDUDxKfr4Qtw/h5gL1OxPGWjt4FMrhE
         nd3s2gZlnBfeDfq4QruSu8y7VqmxcUHkiIy4xpkIPaZ1iICVTkI4JZ1nxzubqkniyyUh
         0quUlDY6rLlyzQsU/fmdEcjLUXhXldjdzjwEB3UF2JiFjCFB3gzj9woUPt7H7DZ5XhkU
         Ts/A==
X-Forwarded-Encrypted: i=1; AJvYcCVWLPbbg8o4OuXKhfvuDuRCrYGKdBvC9zOQGBznybvCxaZqFwcFeDlNu9Us+B+TSK/M84dkCnNx6g1Q84Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9jfwr9lZuzJFG7wkHGequNLwhSdOuBjOhDi76C/xfZuFO/jA4
	xRBePNF9q+iLp7ttPj7UP9BaefRpqT6n7Oh9a+MEWAOC8Wxma87ZzCkI4X9FYqkQaCpyNsRlv6w
	heAwihLhdBJbvJpDYT8b4D6veQOjxVnk9LOCmwf0FDplpwqfSn1oSx461xFc7lXA=
X-Gm-Gg: ASbGnct1P6nGBM9B6aRk/YUgpqc9SJAk+Xx6YfBgi2Mrp8x27Sml1d8himL8tdnSb38
	ijy6a2kHTWk79K9TS+/6SRpDAbrQ+mhfZbbO4Nwgfw3IHx+Ih4sdrHH13vHxstiGddz4jb4Mo3P
	H1KOee4Jp4mcf8p35KL4JDTqUlIt/ywhibzEmoLoPnptoa9ZSTDnIlEh1YTo7Noj5+91Hq18PfE
	nIqtjL1oG0X/iag2HOuZZ7Oj90hf+ng+D9K/3ws12gX7SkMCUB49SMFXTbCjjvpE0ITwnyefqoS
	m0FyZOzA9ESLhtxwUk4vLsYrjgjHlVZ49qmCJuev2Hp/GNX+C5n/xZwsDOmh9P8CPKv1VehAsA7
	3JytZAKaOzaanrQqS7cACgOBI
X-Received: by 2002:a05:620a:258e:b0:7c7:a537:7ce2 with SMTP id af79cd13be357-7c7af14f09dmr2260725485a.32.1744712806245;
        Tue, 15 Apr 2025 03:26:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEyDe5wBNhK9QU73WviaCdGoqC7M4UvrIy9K5ivvzwHe+INns68EsyslNvyZAiWMQqvn4yf1w==
X-Received: by 2002:a05:620a:258e:b0:7c7:a537:7ce2 with SMTP id af79cd13be357-7c7af14f09dmr2260722985a.32.1744712805954;
        Tue, 15 Apr 2025 03:26:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d5035f5sm1384005e87.117.2025.04.15.03.26.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 03:26:44 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 15 Apr 2025 13:26:01 +0300
Subject: [PATCH 03/20] arm64: dts: qcom: msm8998: use correct size for VBIF
 regions
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250415-drm-msm-dts-fixes-v1-3-90cd91bdd138@oss.qualcomm.com>
References: <20250415-drm-msm-dts-fixes-v1-0-90cd91bdd138@oss.qualcomm.com>
In-Reply-To: <20250415-drm-msm-dts-fixes-v1-0-90cd91bdd138@oss.qualcomm.com>
To: cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1022;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=BvBgB4W8ZTcKk/G/OhMfWkB3234lu+MaknAkVorM69k=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn/jRbtEdBjv0xvsJm36YTvVsNe+h+E/iNSLE01
 na7gxZAqJyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ/40WwAKCRCLPIo+Aiko
 1QOPB/kBaGMA7eofuKZ0j0C44v0Vri6vRQH50VgMSURlmUzdBXUe32f4JNmWg9EJsBB685VvpPj
 9fFvOKuH8il4YmySfQr/0LJVQ1NpkXQYdDIx5Wre8WTRu3TQmUbC9ivUJ4VeepY1oLADrQ+YFsh
 4H1S3WNGcQiqAyXpyubESe2X5oj1DbA90GhZZVQFY4EpOBtiuLE9IR3IPjPIDpHpzpOFheVDRbA
 ITt1IVAKLtkrHCz7UY7P9xkO0ZDul/p1pdPj8/ZK5mcwinngc+BlY8arM2p8q4uM8fQv2t8+i3n
 kPXbSziUSAkZfzI0ty843AyGL6BbOJnoHa8L3xOH0xxhl/a8
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=WecMa1hX c=1 sm=1 tr=0 ts=67fe3467 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=sVyWatIdcwow48qmkGwA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: xA0TGW5B34yBrey-76kWN2Ve69fsWZ7w
X-Proofpoint-ORIG-GUID: xA0TGW5B34yBrey-76kWN2Ve69fsWZ7w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 mlxscore=0
 impostorscore=0 mlxlogscore=622 spamscore=0 malwarescore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150073

Use allocated region size for VBIF regions as defined by the docs
(0x3000) instead of just using the last register address.

Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index 7eca38440cd7ea60caa3e8467097aaf0d7928df5..cb70554467410965fcd4307fa5c7b232895084c1 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -2830,8 +2830,8 @@ mdss_mdp: display-controller@c901000 {
 				compatible = "qcom,msm8998-dpu";
 				reg = <0x0c901000 0x8f000>,
 				      <0x0c9a8e00 0xf0>,
-				      <0x0c9b0000 0x2008>,
-				      <0x0c9b8000 0x1040>;
+				      <0x0c9b0000 0x3000>,
+				      <0x0c9b8000 0x3000>;
 				reg-names = "mdp",
 					    "regdma",
 					    "vbif",

-- 
2.39.5

