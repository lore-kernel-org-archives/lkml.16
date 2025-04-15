Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E6DB292926
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 10:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744712817; cv=none; b=T9fVz8iKdNxqncGCmqnOUYb613B/uUw77B6T/BWdCXW/aRhBpKkSPW67e+sDxvzXhn2w1ZrK88NwzJWnaN5NVedUHeQZv3eqEx/lew3k24Syw0fL1lrsuV44jgeh1bXt+vPbvR4Gn0UWe+sISQ+BF51S0dUXZLmR3ndJQBFBkdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744712817; c=relaxed/simple;
	bh=pm3pX9Zbi4OUnxUYZCz0j+Ytv9nU6wsZWRLKvdi5nTc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S1uoaUr42eVIcnGoXB1SCAYkarSZ8etDpA8NVTTdCFRGV3wegXpEVJmytZAbgloyTdhp0aT1l8lBHd/BTB2xkMWWiUq6taAcUesa2SLLK4gJiumxufr3ZbpwpqbDIYBNY0wHKqQNidjeJK59K1NNTdmnRPrpDNNdn6SW54Fui4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LeCMSONe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LeCMSONe"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F8tM5k002421
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 10:26:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/ropqi67On0nf3OF4hT3z4LS5hPC6lTHj3/728K9UXE=; b=LeCMSONe1bDiAFYy
	H/B1NMHNDJv8fbUsXcBgR1sdgdtdATpfZCDYGLs4dfrQzxn5ShjBc6XBq0bbjLzB
	o4u9IW0R3crakaxvnLa82jyyP1e+/EospYMWpTWfYlVPn2YpPEyzJPBrcoDj/nvB
	yhmjLQmkq9V4mB3sUzd1QUx5MOod7fwB3e671ty8s6aoZD2AQEtxbti3rwT6p+YF
	7+GEd7QZPHVQIhYvqF5hzO1L488PY92MWIDJptBTFtTxn74bKdjOBH+S0xb1G5cQ
	tmaWr0pjYZK4Rm3MuqWq3TiA0homfzQzQRk+fyyitnDU/CqzGC5YITZe8Bw0NXwS
	9d6wvA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygxjygw5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 10:26:55 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5d608e703so904735885a.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 03:26:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744712814; x=1745317614;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/ropqi67On0nf3OF4hT3z4LS5hPC6lTHj3/728K9UXE=;
        b=KS3nTOexq0M5klYmmT9TsKtQay8xSEBYbNQWijvgqKPo0xj75eV/nG/jWAWrEbysoe
         OaxdjvFVHz3Dt2n7/hMsAsUBojFzayxNAZnoFKy0zTcoAQ9+n9i81HR8xNSFNgj+qMOc
         bAUQgacMgwdRyEWTucJbpn40MtSS7uuZLcO+EEeYpo/VUvpPYvpNsb2YtS6yfgG5yROU
         2Ngs3qPkEcLcp+WmopRIP6gfkwmAFnEV4P9E9QAlR6C8cu/cUYWV0k8FzjG0eJRmCVa0
         adCUt8d2cciKzKhDKlWGR0ShMb1FWfx46XMi2tM3ue29aIhCCoy4G3CE8Pfiikhb8uQ0
         zdOg==
X-Forwarded-Encrypted: i=1; AJvYcCVTG6wdKTeWs3D7i18YyyNmebZ1zWs2HAI7gJfpynsP+Arc7SJVigi3RyGlU1GkxoraBIAX+GZt8/4f34U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyvgg8TbnftExUhAEH/SmbGKpyGB21j/Uyd/LX2fD0mySmAbyAF
	oH3/gqBRx9r2WPvo8oeV22Y4vDJNn5jGIYLHG8uYrxMv81gU1wATWoD9ppvJ64kKu0hiqQPbS1F
	KVtVJw9973tEHaj1cFb/vARCpLFk6FrfG/9etdzO4AVAYORH1WNdMKEPCISsUazE=
X-Gm-Gg: ASbGncs4qGLSpRdP1vduHS9/aHJeJemSmKkRiK6x1gCOLV4C94hSBbXi3D65y6ottls
	FSBZzhRaCzHQjn6ryjeEo41aWj7078NTgTy/3cmGhbfUo2S57dJ8JtMQvVJFOx50EiWHty99A6c
	lZ7d6KvILwpirq0acOqtefJhmuWqaMcsXR4tOS4cdGw9YH+iSQT3WggeMjSPp8UdzzOn3iIzntO
	aYfbJzBj2Phy/2sa1Jeiqo+oWrVxv/u2ixY6fPjnEdH+YRmijkvZ4jtjjvFSKYvbdymGtwTB+lt
	WqaiGijEPIbo/krZ8pmF32IHLQtb+cS17mWGYg2ayHNQib0FGwCk77w/fzWB6YRSayTO/mPqapr
	CN4l4mY5NmIG6mYhckCo11/0T
X-Received: by 2002:a05:620a:198a:b0:7c5:e38a:66c2 with SMTP id af79cd13be357-7c7af20ca4cmr2338132085a.58.1744712814316;
        Tue, 15 Apr 2025 03:26:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF0V4IhoenXutpT24WBuyetITySS6TWuLLAhFtpsVOUOayQSkY+YUtpiXf9kR7BuB/nHwyY3w==
X-Received: by 2002:a05:620a:198a:b0:7c5:e38a:66c2 with SMTP id af79cd13be357-7c7af20ca4cmr2338130385a.58.1744712814008;
        Tue, 15 Apr 2025 03:26:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d5035f5sm1384005e87.117.2025.04.15.03.26.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 03:26:51 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 15 Apr 2025 13:26:06 +0300
Subject: [PATCH 08/20] arm64: dts: qcom: sc8180x: use correct size for VBIF
 regions
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250415-drm-msm-dts-fixes-v1-8-90cd91bdd138@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=986;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=pm3pX9Zbi4OUnxUYZCz0j+Ytv9nU6wsZWRLKvdi5nTc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn/jRceapdhxwmeBNYoHZ4TxE53kmfK9Juh16+D
 i+d8tVByTKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ/40XAAKCRCLPIo+Aiko
 1QlzCACq2dYLByDLYBvavB4FWhJMAHP4D71eo57rZl9Kty5lv5HPkAelBwQnFDVo2MMUckxVTMJ
 6qokaaxP6dszWI+SLiBoJ/UJrrCSi9aBP5f2D8KFN0Azt7POng+rmoYcjreEpgMH1e6pUjuXiFv
 swPIwjoUUprkLjMCfUOUsDtypCleHEixqJkInFWEjqKaRVPt3OWodsyipA2ibx5WX6acobn0SIj
 vaoMUMn1cBgdNQxqBe6sfA1OKfAWCx4WlS8JqkCBOdW7m5wste2Vp4yaz9kFJkKOWnp2dn7SeI1
 Qi4V2G8BxuqJ+sVqnVTAtlgU4CtE8DCI4GFr0i2eOJupNlFz
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=WecMa1hX c=1 sm=1 tr=0 ts=67fe346f cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=gopO3nw5QtYC7OkQFFIA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: uk9awQRxUjvu8nfmC6tuKp_yl-aXf3jz
X-Proofpoint-ORIG-GUID: uk9awQRxUjvu8nfmC6tuKp_yl-aXf3jz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 mlxscore=0
 impostorscore=0 mlxlogscore=792 spamscore=0 malwarescore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150073

Use allocated region size for VBIF regions as defined by the docs
(0x3000) instead of just using the last register address.

Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc8180x.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
index 30b8a666561d7b56009db988fb70bbac402a934f..b84e47a461a014871ef11e08d18af70bec8e2d63 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
@@ -2977,7 +2977,7 @@ &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>,
 			mdss_mdp: mdp@ae01000 {
 				compatible = "qcom,sc8180x-dpu";
 				reg = <0 0x0ae01000 0 0x8f000>,
-				      <0 0x0aeb0000 0 0x2008>;
+				      <0 0x0aeb0000 0 0x3000>;
 				reg-names = "mdp", "vbif";
 
 				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,

-- 
2.39.5

