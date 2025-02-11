Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA5120B81B
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 14:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739285551; cv=none; b=O42vwU7Dc7cdbXgqhNAKkyXN55qTvVZIwsA3tIf7p8c4yP51fuqUfWaPtDmBb6cky4PBFrIYaua4IqYrDsENCLuzGmGjkN0ucuZczI1JFWEJn10B6Mk6PcDMwX47YC2fLB/NvyJz4AHDZ6GZOTVBfrtYzyaHa0rTyFjYrxFReN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739285551; c=relaxed/simple;
	bh=4f2RPjkKMrQdU8CIu7/TYnPjKMJMN4diVcnjJd4Iq9o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=roPhXSvzXtc/rYZhRpIRI5RTAVStIqI7kgljKCt9ugpAC/4wwJfzpcjsci00ruAtQzSg0E1pljkC+NYJPMKwam3MVEM1+jyfYfjb1UezK9Lxh23XGTL+nmKPCkmtMEgAad1X1YMuM3i4jO7IRYgi2CHWVKScizvEUSMb9pkGa70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f9RAXwt2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f9RAXwt2"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51BCawrb030244
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 14:52:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NC7RrDr3j1bwssRFR4cOJwlJoeFxFDUdcGNi4kyOmRk=; b=f9RAXwt2/20tFmKp
	J6IpOWIkFbQ0GqaNR3K81wgebppeNscJFDEbSm0oIKv5iis74TtPyl3uE28a3wQK
	hqsofHPYwB6Zj0J16E2UQC7lY3FSNTVTBCLIjUmqVoP8EGjZGurrSFNslrlksBB2
	LuqdSn4O1uDkRFAzg6no7NfuJpcz4GtZc0y/34jRTQuZD9P+qErW7FmMErMpx7fs
	QschVHFPBPJ1XSBT7JjTp7njWUbf6Qqoopg+HQFLAsgipxjzKvSyNlaNEuEjlC0a
	o84XDEBl4MMjhK1Y8m7A4gFh4n9A7NnBj9uX+FraM0zHXqYCP/cV9wkJzmXB6Snk
	OXObCQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qxg9htcm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 14:52:29 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-47181a14d8bso9718781cf.3
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 06:52:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739285548; x=1739890348;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NC7RrDr3j1bwssRFR4cOJwlJoeFxFDUdcGNi4kyOmRk=;
        b=Ogl1kGEX8B6/aLrnuXZBo6fuDo7ooOd3PktWpBW2D133pnnLDK6I77KfLWVXz+psWn
         L+ZUJ0iNnFhTq60cCJCn/cMfyskY8GCE3Gh07RbFUBlFwb4hAfiOXiqVco+XDbt/Ljw2
         0VcOrrSnXhQYO57miYdc7ggUIn2AXLas5TADcfWrI4ZzyYZ7xjxXIuG8FNcNYW3d9Hak
         xD0SJBJw5nhwcOZMqR8qScXUZP6z2jkl0tk/nlPWjs33+MMF8BQUkB8D8yXsD8BMpNKY
         AgGvtXkorrA6eAcl6K6owlaussB89w4nM2WtafZITTtytr/qxnyeumQCE3T56puKPFbt
         w5IQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNsTrlmRQT9Fe/KhAegFfwudrChVi4ay5qZRaD/rWKsLUa7mQFiPCRkIUUaVtdfvU1pYWpMgwlFhwU+eQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6tLMkiaVJUypd6YL33aieAhXaMy17N3qFLyUPz46UhdrktEL4
	YA6E3z0A/vw6hrrAtN0d8RrIzn7z2/tBl+mrdPLQgIi3Q5sS/8RGWhPfnDx/wkx2tkfPXnNvw81
	zewqcsTnjHD9e/ryYr6AiThOsYsOyYrPHYokvtz+Itzdf9XuvcU43KjfPQqzUP7c=
X-Gm-Gg: ASbGnct/GzSltqinRo5OYTc7LvReefbvrt5FCH2wUNNbL8I/CBb4fweIliIigSlCCcU
	Y0ra96fUMfRHsQNVECGc/+U4Dr6UxkkMXJHYyHW5unKoRpOMJ9i4sd8MSM4wM15ollyRPXTIrgk
	HCPLEF46qKsC4B+7o1lDv4BnIFMsgZrMvEqLpayoCfLyjTvurtjeYNrprDXfUe1MvuyzeEPt+2b
	vbI3Lw8swYfLB9M4/+BIYbSm+F976trHiJYNvWGtSQczeYwru0QrfBSyyRmio7sfNDF+Gta6T57
	EenybcW85nI1bl3c0yhxag5oJH3ESuV+t9s0rFrpr5IbLiVBRor4ilf1iWs=
X-Received: by 2002:a05:622a:1a97:b0:467:825e:133b with SMTP id d75a77b69052e-471a3e2907fmr14233241cf.13.1739285548692;
        Tue, 11 Feb 2025 06:52:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHav7y9g4ni7KetZuMNmffZvEwd5f5Ju42LekRxMQSmqvzhR0eBVHkt1YH9fcYdH+kxrFsIdA==
X-Received: by 2002:a05:622a:1a97:b0:467:825e:133b with SMTP id d75a77b69052e-471a3e2907fmr14232981cf.13.1739285548280;
        Tue, 11 Feb 2025 06:52:28 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7dbfb2c41sm168391866b.13.2025.02.11.06.52.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 06:52:27 -0800 (PST)
Message-ID: <6e5bb2f7-a23b-4fab-914b-e67911eaf408@oss.qualcomm.com>
Date: Tue, 11 Feb 2025 15:52:24 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/6] arm64: dts: qcom: qrb2210-rb1: add Bluetooth
 support
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250207-rb1-bt-v4-0-d810fc8c94a9@linaro.org>
 <20250207-rb1-bt-v4-6-d810fc8c94a9@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250207-rb1-bt-v4-6-d810fc8c94a9@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: oxQBUcFxxuUvqKqF6lWxuzYJcwuMjeNw
X-Proofpoint-GUID: oxQBUcFxxuUvqKqF6lWxuzYJcwuMjeNw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-11_06,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 mlxscore=0 priorityscore=1501 malwarescore=0 spamscore=0 impostorscore=0
 mlxlogscore=999 lowpriorityscore=0 phishscore=0 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502110099

On 7.02.2025 9:41 PM, Dmitry Baryshkov wrote:
> Add support for the onboard WCN3950 BT/WiFi chip. Corresponding firmware
> has been merged to linux-firmware and should be available in the next
> release.
> 
> Bluetooth: hci0: setting up wcn399x
> Bluetooth: hci0: QCA Product ID   :0x0000000f
> Bluetooth: hci0: QCA SOC Version  :0x40070120
> Bluetooth: hci0: QCA ROM Version  :0x00000102
> Bluetooth: hci0: QCA Patch Version:0x00000001
> Bluetooth: hci0: QCA controller version 0x01200102
> Bluetooth: hci0: QCA Downloading qca/cmbtfw12.tlv
> Bluetooth: hci0: QCA Downloading qca/cmnv12.bin
> Bluetooth: hci0: QCA setup on UART is completed
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

[...]

> +&uart3 {
> +	/delete-property/ interrupts;
> +	interrupts-extended = <&intc GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH>,
> +			      <&tlmm 11 IRQ_TYPE_LEVEL_HIGH>;
> +	pinctrl-0 = <&uart3_default>;
> +	pinctrl-1 = <&uart3_sleep>;
> +	pinctrl-names = "default", "sleep";
> +
> +	status = "okay";
> +
> +	bluetooth {
> +		compatible = "qcom,wcn3950-bt";
> +
> +		vddio-supply = <&pm4125_l15>;
> +		vddxo-supply = <&pm4125_l13>;
> +		vddrf-supply = <&pm4125_l10>;
> +		vddch0-supply = <&pm4125_l22>;
> +		enable-gpios = <&tlmm 87 GPIO_ACTIVE_HIGH>;
> +		max-speed = <3200000>;

I suppose we don't need a power sequencer for this smaller,
tightly-integrated-via-snoc chip?

Konrad
