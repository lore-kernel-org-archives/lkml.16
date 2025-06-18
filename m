Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4FC22F49FA
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 17:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750269020; cv=none; b=i6cDiDv97qzB3wa23nFRKhUCKFPk7AiRp3J07CaaIHN3Nmp0LC8ux9cm9FDlxi08i+VY76q6IkmzLr5Xiny5Y8q1GHXkg0XR2d8RnTnzFP4qEKBm3lkGEuQCsAs94jNFtzPRMayZ8c7CrjvD/VO6dLNUJDcwkyZ6VBR8AoN1NIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750269020; c=relaxed/simple;
	bh=lfDD2QXHizWUOUackdjjGT5IKXMqfv7alla6JQhX4ME=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZMzRK7vEnouSVJdjAwskoR/r03uCrZIUjvL4LxkDkX/iD5W1kS/+HxkF4KmYFoHsbpJ/QlbHqTjmn2n43Cs92GcHmelMyDD1R54qOgo8zym9P9SPIgEE+66ES0saTcH38lta9VBrEjCziB5rGJVJteaeJTgs6IkHwdkqIOWozZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KLn/PbA1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KLn/PbA1"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55IBuVoE024405
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 17:50:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tWwHy3Lkp73ob9Fzw3Dzl2RAH2AqbDJudN6Ojoev3Eo=; b=KLn/PbA1DoTOGsW0
	0D3anwe30AvgNN6UN8j/lu+AM7QoJ208U2kdnwEhpEpMipvhiI8AYeV2NadATb+V
	D2mTewkO5kCwwyFewqc6HLhs5DRUXuVlEOajOkbm3MQPB+GjoE/shz0RsDfRw9mS
	lzopX0F7duM8L/t+c7DjVh4YEvOzy3Ci1LWEJoVoZUP91ve8yPG0qZWozJFcJLlf
	LtdwjrMMZl8T8/C8ZYWuwUIUadmdui4qFYM4Aqj/504TYn6rLbwLMO4fJNr6dQcM
	AK6TGOumO6WDLwWgCkJeJhcpuzackHEOV7QlW6ReE8VK557MBc9w4Dbv8j7qPX2+
	rs0YMg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47bw1394ts-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 17:50:18 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5e2872e57so1231228585a.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 10:50:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750268997; x=1750873797;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tWwHy3Lkp73ob9Fzw3Dzl2RAH2AqbDJudN6Ojoev3Eo=;
        b=Z5QUN9hdJSMzZkrJ9LtA6gGtlex1u5k1C2+ll9Cey87NyrZL04tVU07ExaIHT7wIUx
         3StSFr6rV4wFQrl9xwr3LBpiJJh/QpFphwAUHwb6j5EAuFezjCsLxSX3EAtLTehFwaHd
         wPd91sRDft+/LohrdveG2I6kPekc4T1iQ0gTvJSomFYSenHcK84PjiyBh7FbniXXI8Rp
         VptbOmNfXEdy+HlktBe+IGLnOd4FOdwOXX8YZTiCzXIkHeEQoD+4y9oY+IdI3h0KJqxt
         TOh0x46tiGDLYxumwILHeGeQ7AHhSmyd0kC1bpQALH0OkbP07oEObFmiThlgbByefwO0
         qMig==
X-Forwarded-Encrypted: i=1; AJvYcCWY3qlsBQJF9V6QI5EKgjzGc1zvjgoJoGSD1cLiTQwe7WLR7vB1QJOaew13qlTLKjn76gVoClzdyO+5rkg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yygmn/BpsV/svwBRVA2TQdt4Be4F9N0RLeme1URmdYgkLVkcPQI
	ZKbCr0f7zKxU7Vm/k4oKwXL+SQWd/jxeQPxXxQGsVEa5t7sg+zxrzg9N8MIp0YFqfKI1BLgX4SI
	so+IFgIceXcytHmS3woEybih0cJdaSkMH0kMJOLpdnr9+y5mDca7wjJeCJC9BpJdUNuk=
X-Gm-Gg: ASbGncsthRjfBq7V0oHf6Ng+E+sB6jk0P9Zi69gCPip0FQDfEHWmS+9Vp3zQLR0Nnxt
	FQv6oJ0VhFQ7cZA9oaS3fSSvLV2xsg9JysJLE8yR6fEvEcrurKv+Hx0tKY3r78v6e+Ubp8jJXoM
	hKpIBHNWoTXGaQu8Gmee8xvDuMZGeetHVSloxVYfSeRqAZXZeb9wgt3xaWSXbULSlQEEzB8ZGNz
	bxuQbJpMwxp+NC+Xwofehpq+O+HJlCgy7wYkn0m3g+0ahzlZ4GPBNMCjDcM747wuVSHziFE/g6l
	RjR3C5VTNcb9VhmhUiGa3929xIBtzG/OTTajaQHl6vacsGQpzIwHpkyu+5ImIehnyLyvArmuKlY
	NJgoitUk5GrTGRmBtkurGQV+75ymNZTvHyGQ=
X-Received: by 2002:a05:620a:3195:b0:7d2:1a54:f646 with SMTP id af79cd13be357-7d3c6c0e558mr3239914585a.7.1750268997400;
        Wed, 18 Jun 2025 10:49:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJ8jb6poGFVV6F7nCpJD19udVvjHcsMylPEnQlIw1RC5gDDZlxn5SXdq6NiVC76favetUMrQ==
X-Received: by 2002:a05:620a:3195:b0:7d2:1a54:f646 with SMTP id af79cd13be357-7d3c6c0e558mr3239910985a.7.1750268997000;
        Wed, 18 Jun 2025 10:49:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32b7b43a98esm2911131fa.65.2025.06.18.10.49.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 10:49:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 18 Jun 2025 20:49:52 +0300
Subject: [PATCH 2/3] arm64: dts: qcom: sar2130p: correct VBIF region size
 for MDSS
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250618-sar2130p-fix-mdss-v1-2-78c2fb9e9fba@oss.qualcomm.com>
References: <20250618-sar2130p-fix-mdss-v1-0-78c2fb9e9fba@oss.qualcomm.com>
In-Reply-To: <20250618-sar2130p-fix-mdss-v1-0-78c2fb9e9fba@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1096;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=lfDD2QXHizWUOUackdjjGT5IKXMqfv7alla6JQhX4ME=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoUvxAVbrqbqI0kYsNshCkKkDoROrOWsCHDJBw/
 YeprufWKDCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaFL8QAAKCRCLPIo+Aiko
 1Q0RB/4+ANzSYQzOdpkq4SzgI6yGHE1N30TAOErADixJS0Nrp5pV94L0zDF527fPuHXtljmVt03
 B2eUQOP04wSY6mjhcur/GiIvO5bEJl0BOavc0bn7gJ3Edr/6bg9lmLsqKZOJa52i7M3yW74z7M4
 SdUa/cAqAa0rfjYjgbVu8wnA/laxF5hyeQ39/HwO56WfpiB0rc/Exatem6l1L9+w30mXcb7MgWq
 m+O4pevSy1IKVyhETB06XQG+E9s1N3sUTDj49giulyvM09Sgw6seYV1slp7qdb38DrEbseMPUDs
 58KlVXAzo6HpfmE4S8GTTds9HtKyiM1fuNou0eASXf9tkU+j
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=QbBmvtbv c=1 sm=1 tr=0 ts=6852fc5a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=nzbLNaof8OtCLlNVw1IA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: ci5jg560rX4PIxbFBx5HpHMVq0zinkh3
X-Proofpoint-GUID: ci5jg560rX4PIxbFBx5HpHMVq0zinkh3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDE1MiBTYWx0ZWRfXxvKHeJ+A2a8E
 BWK9nsxAYCCavLyyitXCvqFDnf987PtJPGvu86ps8rggYpZQs5gtCYbGELWYYe5/jf2oMtYtBR+
 E31CzLrkjOKBIsn1marXhcTYz2LFvL2adDUDNSK33qA4CemiflCJIrn8l9QwH5irm7bWPXy4pZ/
 E8/EKy8HXVSxQMlQe98KwA+41QYinevKXTmcJqcIhW2BQcbsWIhyrLeaa1BK/LyeQROxNQIkCHl
 WT8Eip0539VCDGU5FvNytcdwgUIwnsx6dwdikcl0t3w1I1uU7EOCOomVLdbpMtOokjR8Q11O080
 CQMtTcj8BCzFaVx2agM+7qxFHq2d/xmHeHt3hnHaKn6/d0kiZIsoXyhIpNhmXAuK1uddDdBa6Ls
 VBV4TNgt4P0RAEKGQrIMYLOB6zgbXD1LO0gF+NdDDDm83GXzmnqu1kMbWahJMbx4Op4ZvTJE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_05,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 malwarescore=0 mlxlogscore=746 bulkscore=0
 adultscore=0 phishscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 mlxscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506180152

Correct the VBIF region size for the display device on the SAR1230P
platform.

Fixes: 541d0b2f4dcd ("arm64: dts: qcom: sar2130p: add display nodes")
Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Closes: https://lore.kernel.org/all/c14dfd37-7d12-40c3-8281-fd0a7410813e@oss.qualcomm.com/
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sar2130p.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sar2130p.dtsi b/arch/arm64/boot/dts/qcom/sar2130p.dtsi
index 6d7d4f05d502049dd6dc404317412c438b11d081..d9948360cc0198a768598f60302097e1143cf1fc 100644
--- a/arch/arm64/boot/dts/qcom/sar2130p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sar2130p.dtsi
@@ -2053,7 +2053,7 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			mdss_mdp: display-controller@ae01000 {
 				compatible = "qcom,sar2130p-dpu";
 				reg = <0x0 0x0ae01000 0x0 0x8f000>,
-				      <0x0 0x0aeb0000 0x0 0x2008>;
+				      <0x0 0x0aeb0000 0x0 0x3000>;
 				reg-names = "mdp",
 					    "vbif";
 

-- 
2.39.5

