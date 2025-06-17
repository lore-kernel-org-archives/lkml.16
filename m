Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 016C6230D0E
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 12:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750164999; cv=none; b=GT/SdIOkNTJjy3KARl3ka+npXP/kztJkI/0c4+fLvgHjcFYKzd20qEY9acbtCOZXKmBJGcJOwwIrRVSED02waGagAMjfwYYCtKglvlrQv6535ay3MFOe4KgmBAZB6Y6MQxVPlsQ21VUMLdB2aR/8VGZcVQge7GxlBhbTXYy5zpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750164999; c=relaxed/simple;
	bh=DKEqcJaeP8X1SLMpYbVwd7qUBQUW2PR23+GTcJd7GsY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YaZamDMiJYEB7FAbh77C78kQ8tUfhzIqxCZ5NFdqX+220ibz9yBKLVWcRfpktLIxCeXJL4QZOpPPwUhxgKy8GNHVpKv+jMIwObgwZ6LPYaHOYRGQtbjX1ThTTj1yTJxUY/LKYocCxNZoTItJ0oL3h8DGxCadJMcTCMfBSX3+WS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gFj3/XTH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gFj3/XTH"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55H85tlB016813
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 12:56:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=reLhBblkFjKNgFgw0iZCw73Q
	eAmoIcUiJNhR7l2+5Wo=; b=gFj3/XTHwtHhusu1XkABetp6zBh6LBV2MqeT5ozg
	lVp6xUMtaqNtiiXctXE34Mlu+L1I0orf7wUl7fHGlxaIo11wTuW6MTxeGX2UDRRa
	k9YPcoTINGCD850rfQDzCYkM4Ystr7YtkDYEhhIDoI7Ec7h6MF36bWKx60IIHYui
	R6Hxdj7Q1sM/mA4peducECHxUEdTWlA/t68V1iXYEDnvcamUruNCAxZlVeOudLUM
	ySz+Njh2uN6tMhxbA7Cqzk3fRGYxQ2VuejrtgpMVQR9Em1A1V6Q0stLrpl1DxKy8
	ZG75DBs14WiwqWKXOliEGeAGaF5jhqpLbnLojYBp8R7OkQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791hfgekb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 12:56:37 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d3d3f6471cso361019085a.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 05:56:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750164996; x=1750769796;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=reLhBblkFjKNgFgw0iZCw73QeAmoIcUiJNhR7l2+5Wo=;
        b=wG7UsgpPkdt+YmTUDyv5i/aCsIeRpjkCGh9gj3WoW4FSG+uQp74+ZAd+SdI9NA8E5L
         GPxc63RzQNCG8ffV0AOWD/kQl1f3XSrDM3c+hRsBzPRjgbX22luymIhMG+fT2L8ATVC2
         gFtwg+2NBwvLaXvTMHfNfkyKh1rA2nfLxumq4IzJI7o72H8KkQgngFcL31fIMCAI53B7
         IMA5It49T785nQD98THZ/I+7cScSkLvVeVkYY3bGDEJvFj5Kk5/X7grV2C97FVbtsgp1
         4AN73h7rELj9Ihb8DlNQdVE5lgRHKO+4q5RTksB2qWN7IZObubfHdqpO4/dtY3JwdPMH
         PTWA==
X-Forwarded-Encrypted: i=1; AJvYcCUY+o0skwZZzOtCw/gYF6Wj2ndrgrpEozVnXCUWpxNFRddayb81silskx+OGpGj0aQvqXduG+3vY4N5hes=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKpMvdgpF7cy3pmPP24HwOE+rk8DNVZVAQ1R0sDwaLJL/YDJqy
	Pqk7Fl96NJB/yvD+M7Db6u5vLckoU6aulP0qfk64QSl3LbWjwAB3BxdH/sdrDvgC+fp9RHID0s4
	RC2p+SxvrMud8EAGhbmNGhes6hYk7ajwGpov6StBgszb3ivVOBWKfjjxRgXcOFAQGhx0=
X-Gm-Gg: ASbGncv+zua/nDwWHf0r9gz3Uz4uRoqIKa+sGIQO76avJ3g+p+ooFDpANA/LP4l2VaT
	QnkrVMMYdB7zuyznK5b8GkR5Mvw2D7DnhjLT2JcT27sx14eFigb0a3stCvFIBDrhuAOeMkc5jCE
	Xs8Y/lXv3zstKerS6OU5cHP5qfUcU/2wT3Iycw6cKwbQ5gP/3LlP5KjwfNGs3mFCiN60+Z0QLPv
	razYF9lwiJNPXe9qa+ym2+UbKeAcEWwnQquHDERCSX0MqTpE+CrTJHJthWZ7ZWhiK7XaF8oeKe2
	buNXo8t3gz9/QbAQ1Pc4TMXiGQmnQdw6HO8zNHxmraXYtuO+m/dqYW9/7ACYocW+VUfwwKzrZ9M
	P7E4J5q17cEUPKvoc0VgM7+DDr2VTaGig08o=
X-Received: by 2002:a05:6214:810e:b0:6fb:4fdc:dd83 with SMTP id 6a1803df08f44-6fb4fdcde32mr136702676d6.40.1750164995776;
        Tue, 17 Jun 2025 05:56:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFvCoVuhabEm27A62sEPcn/Fb55CORSI3jmx2fmiprrI/xC488IzmD9JyAr83daF6LLrrsC2Q==
X-Received: by 2002:a05:6214:810e:b0:6fb:4fdc:dd83 with SMTP id 6a1803df08f44-6fb4fdcde32mr136702296d6.40.1750164995406;
        Tue, 17 Jun 2025 05:56:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac135c22sm1912726e87.65.2025.06.17.05.56.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 05:56:34 -0700 (PDT)
Date: Tue, 17 Jun 2025 15:56:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abel.vesa@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 2/2] phy: qualcomm: phy-qcom-eusb2-repeater: Don't
 zero-out registers
Message-ID: <hgtbmst73ijkfptznqh5r6usdnn2tdx4fxow53g5pyl3yagbh3@4thxrkp5zcnv>
References: <20250617-eusb2-repeater-tuning-v2-0-ed6c484f18ee@fairphone.com>
 <20250617-eusb2-repeater-tuning-v2-2-ed6c484f18ee@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250617-eusb2-repeater-tuning-v2-2-ed6c484f18ee@fairphone.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDEwMyBTYWx0ZWRfX8sdqQ90++eFv
 L2Zj71AvpoWZB2NweELYHOvMdmrLSPRG19STbXMBMclFmk9IoMjpXjq369eOfJyxh8iR7n0TISr
 gvr1GFGLrhu0k/e2M0EtpF83LNrRyXERZFr4d2MtiGpZpghERfZGunHEOkwCDD4XDy6oz3fvL+Z
 vZRlILfWt7mbpf8mrilbvcebDoCfhOA0Vi1vRql07X3hzZugJjoO1iOeuuOm9HgfEEZQ+p2KpTe
 lJvXOSmhWZAZmX7K6AWggpX4cHC5u8b+ssDsjV3tE4lhXuvQanemDs9TL2cOsZY4Ab70wv1d3ST
 xiJNW8aoBCBDdyw+o7NdJgyCt+jiHCKRfS+2uOu4ULEMt0f30Hcyp/L3U01H3x2+2IWt8Sk7kfp
 RT49uMWZ2Y1pGymgrgb1sEm0Wv5XyYgFGppQ+CHpGh80OHW4+rUi+nyji0UPQrssuKjQoYiY
X-Authority-Analysis: v=2.4 cv=VvEjA/2n c=1 sm=1 tr=0 ts=68516605 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=6H0WHjuAAAAA:8
 a=cispc58g6-s63dKQH_wA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=cvBusfyB2V15izCimMoJ:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: AtlQLVScgI4MK7ufjqqG-w3TS-Lx7gd9
X-Proofpoint-ORIG-GUID: AtlQLVScgI4MK7ufjqqG-w3TS-Lx7gd9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-17_05,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 lowpriorityscore=0 spamscore=0 mlxlogscore=948
 malwarescore=0 impostorscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506170103

On Tue, Jun 17, 2025 at 10:26:36AM +0200, Luca Weiss wrote:
> Zeroing out registers does not happen in the downstream kernel, and will
> "tune" the repeater in surely unexpected ways since most registers don't
> have a reset value of 0x0.
> 
> Stop doing that and instead just set the registers that are in the init
> sequence (though long term I don't think there's actually PMIC-specific
> init sequences, there's board specific tuning, but that's a story for
> another day).
> 
> Fixes: 99a517a582fc ("phy: qualcomm: phy-qcom-eusb2-repeater: Zero out untouched tuning regs")
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c | 83 ++++++++++----------------
>  1 file changed, 30 insertions(+), 53 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
