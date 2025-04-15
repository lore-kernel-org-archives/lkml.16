Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26FEB163
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 10:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744712823; cv=none; b=lmyWiRBhV78fQFbzKmvDYOnnEa2dme9g0v3KLbGKzGxdShBIcxI3PwaKhL3EV6E50xgfmdF6qDulYcvHLuFjUpamC1JRdVOSu7l01/mpWTTNl20Cq8yzcVdRk3xPmB1XWfY0mXArrI1bIvY/RvtpXhV0RqYuS5eWZWWXjowbyCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744712823; c=relaxed/simple;
	bh=jW/DDpfOxjsJnp2CFh2GLQmySmPD6CszwncVhPIR75Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XvGh6TJL1Yu6dAjb0PmQhOjvKmc3ALUx9bJSVjxgH9zEWO2Bt2Y0/ipFcCbZjhCzZl869lI4RBKdJmw3yY/7YqvLmWwkfPUx2B3asULVihgL4jnlf5+QAHfYPRCrIOpPSgeU/jUpQJ47Z9qmsxWi0nSewyg06kEVJmpgE2iVYYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kkSLToHD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kkSLToHD"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F8tT6B002505
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 10:27:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DbMB4xwlSMn6GaWkSDGzSmbicpF6unMBuX3zyKKQblo=; b=kkSLToHDt87CPwNm
	cR4lWtQINK3tag22geb8hOqqxBgcp1zMOWaLjXNHmmniwRee/5ijazyHOMajLecn
	ywhJOgrfIPMKB7MSvYhHPXaFT3dp9banvhtaLMEo3aPHMbierjqghw7xwfTe5Pef
	h/WbdFOz94o1/biL+QZ8/AzJQcNTHpwfMMXAyrCoc1+DrtQgZmjpALqt5d+M+XB6
	52GUiqkAzgLumeN26I2V5TXEOIAeDhIIhPU0kMr4c7p3tJ1tfRcZ5dqhp10aZgTi
	2gqi7HJ59GoCyhj5PCECjjsFxCSxUdYFazVB+u1VJd4Qk+q9+SdphPf0Ed8z8oij
	L+FGmg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygxjygx0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 10:27:01 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5f876bfe0so858584385a.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 03:27:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744712820; x=1745317620;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DbMB4xwlSMn6GaWkSDGzSmbicpF6unMBuX3zyKKQblo=;
        b=m2W+XSY+Q77L6AVO59DZQAIOVXL/xS3uwZiM6djF8E4c65hsDfK7x83AnuE3ORqyx8
         nBmvQpcn/e8xtxvtjEREu/wkmsX9krRMQmv4iUoKicW9J9iyhY49THzflbWIpeWyd2Om
         fuZhoaqCWW0MxQjvzQbahQYMi91C+50cR+RDGm54CydSVfah3d4We4RpZ+wS3P4Ozwuj
         M0dDW0lSxtfZpW/38CLkZUMB99X2/exJkyfPuExqKHcsg2eEbeqjHmXXZLbpsIRlCQpE
         vzix2CModC63AhlIwfOCUAiQKTMwMZgohjj2IZvKmdFvrA3r3cRGKcaafAf2a421ThoF
         J68Q==
X-Forwarded-Encrypted: i=1; AJvYcCVY1wcf0K5L271eHyUP0BzHiI2G6cWNOaFY/uk7WpkYZS4vJZl+zlBAL5+ADZNsM7ZraGN18yjaHAne9kU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxF+4ylJ03tidFn6ogFySVyYnkgY6Gw+iDEOfIy2642LErVt5H
	jnelhxETa4w1K7ymRp567VpaAhilGJRG1S3xcK6P6+bQmLZoXg/KVk9qTzdzUAcDWmW6ZVhaRIw
	E7FH4Q1t9lGXx1cmb298FbdRJz3MdPJ0/4SarFHb0z4eLMGHrJEQRNGKuyQaNxbo=
X-Gm-Gg: ASbGncuqJYePNYCRPBGB2+6KgwJctC3Z0FRzK6IE3iR+nPfxxDjZNrMEVeDl2O81cyV
	AQVBd33euRhwJ/noi0kljVeZtltRmwkWIaRoQI6Tz2S6xMNmS3fe2IJaQxLG2UH1zmSj7FgxZVS
	4wao3FqXB3aSfcqdBkncFRPnG1r2CKeZ41jm/ZxPolNDi4gqoqmT7riBcwO0LjCKQLrAbYjG4AX
	nH1nmQaiTCcjvqrryG1HZglRhzU0t5vhkTB0Y8jTOGNK9hUN7wHvdupsWKpyF3Sqz8tPigfWN2C
	7kIRP8mz+loRUOsZ6ioVY6AxiyFD+QrjQ5fiLNyWCIWQ+iyVmAee545SQWdB46l+unIlQbzIdKU
	+chFpkpiCLIanEsmkb9mNxr1M
X-Received: by 2002:a05:620a:440d:b0:7c7:747f:89d0 with SMTP id af79cd13be357-7c7af12e230mr2393073185a.18.1744712820285;
        Tue, 15 Apr 2025 03:27:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFXgp2tV9C9icQBARoz5VnKdtwUEBJXMFFT7aIvfhUyyz4l1xh0g5ipC6d5BCkp59mSJBlwEA==
X-Received: by 2002:a05:620a:440d:b0:7c7:747f:89d0 with SMTP id af79cd13be357-7c7af12e230mr2393071685a.18.1744712819998;
        Tue, 15 Apr 2025 03:26:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d5035f5sm1384005e87.117.2025.04.15.03.26.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 03:26:58 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 15 Apr 2025 13:26:09 +0300
Subject: [PATCH 11/20] arm64: dts: qcom: sdm845: use correct size for VBIF
 regions
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250415-drm-msm-dts-fixes-v1-11-90cd91bdd138@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=977;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=jW/DDpfOxjsJnp2CFh2GLQmySmPD6CszwncVhPIR75Q=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn/jRdFtoC5UHoCMgTqYOZmYPTop+yLUYlXp7SF
 pnzXuUbdjuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ/40XQAKCRCLPIo+Aiko
 1Qk5CACg7Hb1/rQe+idlJJW5Ua678cr+23/zAsWmB6gkpud3h/ZTmgLmTGbgKMGoS3Bg2XBRNis
 B2drGwMYxaX8VZ+oyHsvd13r9aRdnnNG3eXOXdcwf5o7iQbXcsPK/w4LOids4JMxCIxZhIJmC3B
 8v0tMoPTRWVvpIRNCqW4Y1lKZUF3Di3RtWnfI+pb/Wm3mJZ6bnsxgGaEBE9VjozFBNI1sLSR9ac
 jUeJGQ7Pk1ZUv93/DBzaOVRChWAf6wjM1Pd21Q8Un+QhMUqdk98ZrIExpcDyUreob8slIn+jDy6
 7fVuFBNuih6dDsWHQ1TBfM/vE2K5CGx9qtY+RU6kD3CP3Udi
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=WecMa1hX c=1 sm=1 tr=0 ts=67fe3475 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=9SZ4-cSOyNR5Keopn1gA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: s-4I2yzqMl_To-3xpFLqPhnu7a-eF3HM
X-Proofpoint-ORIG-GUID: s-4I2yzqMl_To-3xpFLqPhnu7a-eF3HM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 mlxscore=0
 impostorscore=0 mlxlogscore=815 spamscore=0 malwarescore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150073

Use allocated region size for VBIF regions as defined by the docs
(0x3000) instead of just using the last register address.

Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 5808129e2dde061dbc79d63cce9f5254de2d7d96..19ece2daedbcf4019683e041766a8c4e816565c3 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -4546,7 +4546,7 @@ mdss: display-subsystem@ae00000 {
 			mdss_mdp: display-controller@ae01000 {
 				compatible = "qcom,sdm845-dpu";
 				reg = <0 0x0ae01000 0 0x8f000>,
-				      <0 0x0aeb0000 0 0x2008>;
+				      <0 0x0aeb0000 0 0x3000>;
 				reg-names = "mdp", "vbif";
 
 				clocks = <&gcc GCC_DISP_AXI_CLK>,

-- 
2.39.5

