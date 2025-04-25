Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A5422370A
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 20:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745614327; cv=none; b=FAi/+MpXtyhTuJeRQg3Cn6Tirj9l9yYk+uneMwE1dpMiSKKkxRNCg3txRACZX34HBEit0jkN0qSpZk12y8d0fsl6TDjD+KPdyrMiCKbsGdBrlxAQf50k1RDrkZGHk1bL5njuNY2bmxirdMi4Dl0jvWbpmQFRYdnnwhOJmOYrmUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745614327; c=relaxed/simple;
	bh=kAToM2XUXvvC5laIERANy/QDIAazwPQuoIadpAVkohQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jPLMjKOzdnibGPK8+brHaQg0X6z75G6mjCA2syDdWPovT9FWOcfA8mHrhYB0tqs7TKEhg9n6QrcBHw6LKTVSs+K3/n9ZeeJTD5ptlc3eLdqGonGEjRFU8Yz3lfZG2n8IquCbNOAD7iA1l7cNmGC399ZyJqJrJMNtFV8aYNhR5v0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TNgYJy8Y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TNgYJy8Y"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJqeg031939
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 20:52:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	khW+OjIu3QFmUYnH4/qhhaS7xRKHn2LSxx6Dexoku1Q=; b=TNgYJy8YLl6+dENP
	8ww9i+7XwieZ6kWucsJqjvRHXJPliQhHagU1H74m1RGdoSQLbLJEYkt50EA0s7aq
	lgubZPZe5PrKt0qvh7h/G8wwL/zJUa0WIJmcdug5dD6Bg+saz/f1Og2LngVJV0Nu
	iFTCvk/YFMcMSobQcsyYapjWNXkf2Xw547VIyCxTFicSeLbjIKF2pZQWfyBCZkO7
	32poQt/HJQIhLJnkMer/vUfno0zw4cUno0vCP904TTBHVErCSwr2AbwRaOxQLXs5
	+fw4MRlxchyg1ZGPbrmoEDsiVDU6uT4iLWqnSQDEigF8OYiW9oRRg+BPAOaouPb1
	ZDU6DA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jgya8ah-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 20:52:03 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6e8fd4ef023so6462876d6.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 13:52:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745614322; x=1746219122;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=khW+OjIu3QFmUYnH4/qhhaS7xRKHn2LSxx6Dexoku1Q=;
        b=xFuoObkxSWlMJOBaL/la7x8gVVRvtuC54WJSfavufAjAZU20MVcU49ZUq6X7Fq3EI8
         TyG2ZMgcBDPSozA2+ANndmlnDzGC3xvpdVCPwXPr1JUyJlZibz7XokKaUW2SfLjDNAP9
         HYhzxyx81WFyvMtsmGca2JL7oKI+ZlbORHjJKbjCkp4Y/AHCv6J5ibLzowKnOjRvq6qK
         3MBeRaXF3xr2AzHAixxaakTNBl6zQnlVwxMYbN3L/AlM9Y58pdWztN9e2sgMFoQk0Gti
         YSmBTV42f2MJ681Wb26z8Quu15z6kVx6nui5lY+alRTSJRoLTbNf/aG32PS0Zv4/1pBu
         2UDA==
X-Forwarded-Encrypted: i=1; AJvYcCXl2uOOD1DCjSpt6/YgQUne6uupLzpfbyjq1yjMu6RW3/9d2uNK0QsOZYZGXJPiy6DKB/qliCA5+krTb1I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yws9lsL0t+eBUtBsu5swuC3/xnjzFq++FzBBvGYbULTIR1QvwQD
	QE3KYuUdWiXrvo8YnfXmA7/BZ+Mqv9BdfOHFhxGhOjt5Q54EVQVtu9NeuxsyGnQwH7/7EXb6QQp
	l7EU2GndhvbNQ1hIX/+OuIt3NIx08m7uRSb3NoFdojYovj6bpdPCb14iGYYe1CSg=
X-Gm-Gg: ASbGncuA22gSpWqi6ME4ixG2EEm0gwO/df9hqk1wCSflyy+CIsGEWiVZP6EJZXYy+u7
	1tp4XPqCMQvebV4cuGXogZ839V+iksAQRKkIEIv9MuBoZDRCMNGBD022/8+dpMQ/C7AvYOTUAzm
	OsJfA7IRKxEQkfqM/RIhQjCvARReuWW2bSrtn1h+64ZatL0YznHKVDI+X+eF+TRcTqUKoN6IcFA
	jY54dHifXhiXOQGId1PqCIyOhoqxy7yE6Wn6C+UjGyvJDEM3ojds7TNuRkFWx+OgS0fUq5GWgsh
	OHYC820ciMDXU1tRB6Czt72BVF7O2TOjdETRxR6n0Y+H6ng3btKmkOWJQP8v9PW4Ya8=
X-Received: by 2002:a05:620a:1a04:b0:7c3:d3a0:578d with SMTP id af79cd13be357-7c9607ce29bmr234168085a.14.1745614322379;
        Fri, 25 Apr 2025 13:52:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELNiJdwRrt+X3+ZmBmj8ToCx5SguQhymg571V2ufzv8cclkQ1COqWoTRaO72k8xjo3W2vT0Q==
X-Received: by 2002:a05:620a:1a04:b0:7c3:d3a0:578d with SMTP id af79cd13be357-7c9607ce29bmr234165185a.14.1745614321971;
        Fri, 25 Apr 2025 13:52:01 -0700 (PDT)
Received: from [192.168.65.156] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ecfa354sm185152266b.120.2025.04.25.13.51.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 13:52:01 -0700 (PDT)
Message-ID: <04201672-3d7c-4994-bdbd-959ec7a697a2@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 22:51:58 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/2] arm64: dts: qcom: ipq5018: Add PCIe related nodes
To: george.moussalem@outlook.com, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Nitheesh Sekar <quic_nsekar@quicinc.com>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Praveenkumar I <quic_ipkumar@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org,
        20250317100029.881286-1-quic_varada@quicinc.com,
        20250317100029.881286-2-quic_varada@quicinc.com,
        Sricharan R <quic_srichara@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20250425-ipq5018-pcie-v8-0-03ee75c776dc@outlook.com>
 <20250425-ipq5018-pcie-v8-1-03ee75c776dc@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250425-ipq5018-pcie-v8-1-03ee75c776dc@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDE1MCBTYWx0ZWRfX+vNAgRq7Gsrc ZKIKU0iQj4Cy2UVb5h8fUhPd95HNqn2dO8oJGo4lmpFZHbusY1shVFUlSEg5yx0/xnt12JtlwTV 1tB8DkjUo7zHKdX6SOGH+zQUc8cbfQ960zA0cPaKX6blJpNXcFvKZ5iUraVFFrZWWysbn5cVwg1
 T3i9wcPU3ksGh6U/w57jRgQygmeb/DnaCSsDMtfpbb2mmDJCLhKDVi9MVpDQPmo928sweBrSs0P IxdqGjUuZ39g3y8ika45rWeSHoTnI2w9i0sLsnPvNhfoMzNT9h/16HWH/W06RWU6asOVKZMZsJy IqaD0E77uJeO+cbKgsapgCF1FCB2XthXH6FBDQ0kZewAd7fx1je5BGWLMR7D/Fy7+fRH7q8KiM+
 SLrkVGSoNYqwLXJ8Fvx75V9+bao3Fq7WzbEmgPhvbojRfXPeNeoD7g2QxjSqc7KgeH9cYXUi
X-Proofpoint-GUID: Zo8AdZM9aXUnRCcdQfjGxjNNB2ZWgyhe
X-Proofpoint-ORIG-GUID: Zo8AdZM9aXUnRCcdQfjGxjNNB2ZWgyhe
X-Authority-Analysis: v=2.4 cv=M5VNKzws c=1 sm=1 tr=0 ts=680bf5f3 cx=c_pps a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=UqCG9HQmAAAA:8
 a=g69xjaZfg-qW7mxf-08A:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=746 malwarescore=0 impostorscore=0 clxscore=1015
 suspectscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250150

On 4/25/25 2:00 PM, George Moussalem via B4 Relay wrote:
> From: Nitheesh Sekar <quic_nsekar@quicinc.com>
> 
> Add phy and controller nodes for a 2-lane Gen2 and
> a 1-lane Gen2 PCIe bus. IPQ5018 has 8 MSI SPI interrupts and
> one global interrupt.
> 
> NOTE: the PCIe controller supports gen3, yet the phy is limited to gen2.
> 
> Signed-off-by: Nitheesh Sekar <quic_nsekar@quicinc.com>
> Signed-off-by: Sricharan R <quic_srichara@quicinc.com>
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq5018.dtsi | 246 +++++++++++++++++++++++++++++++++-
>  1 file changed, 244 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq5018.dtsi b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> index 8914f2ef0bc47fda243b19174f77ce73fc10757d..917c6eb7c227e405e9216125cff15551f57839a5 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> @@ -147,6 +147,40 @@ usbphy0: phy@5b000 {
>  			status = "disabled";
>  		};
>  
> +		pcie1_phy: phy@7e000{

"@7e000 {"

[...]

> +		pcie0_phy: phy@86000{

ditto

[...]

> +
> +			/*
> +			 * While the PCIe controller supports gen3,
> +			 * the phy is limited to gen2. Hence, limit
> +			 * the link speed to gen2.
> +			 */

/* The controller supports Gen3, but the connected PHY is only Gen2-capable */

and it nicely fits into 1 line!

With that:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
