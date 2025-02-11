Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 039F92505D9
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 14:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739284498; cv=none; b=SkLO2Dwliw84wUniz3Kdy9AmJWAGPa7/dY31ijC2ckzTEmsF5+CtdDzIrgddvogLjqMrkp4/V5w0wLwbBeMQFzZmGHkApabRVpzDDhWH4fxExSMzHQze6AfWyHNyxehsfvTPQ9a9CWcm8PK1TksFt14bzMQfaXXoNoHUlmCv8g0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739284498; c=relaxed/simple;
	bh=BpbyeeCOI146IKCmCu8zod5nA08hBtcuDaJlkhep7EU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=stpzmnHlY/ZD664I26ImkzHfmdfeKIUljUeaW3Wfyy+AP1QxpYwt2x9tmzOtxnRvCkqVRpYb2VeCx074Uum/gPP2Yp6sPE4ie2s3FyTQB6qwrqlZgXK/amTSJ0l39rj/OYl7QUBgdUQx8gWBcVNqQmNLe8DwHLfgmVVoOS7WURk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L79Cszs9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L79Cszs9"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51BEL5kU010163
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 14:34:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zzeSpEzhPhKIc5ciktFW0BzNDzlKE+8N49H7bDEi994=; b=L79Cszs9aBk0ZQfK
	feucqrjZ0KTdz4LF+VQaUO7LQmuHauo9Zfch4jeglaNB8tSmbcuWOr6mFLscP7e6
	UVHu/tENKjDhFzZ76HBw+FB8Swx6g5vfeC/6GCEH5u9lCTGcvJR61B3iIvS7eeQ+
	zQ8mQOGiDzauYEnDKGHLMW+tlIb8KRgCJiMdRntcnW04jRWJMROTSpTxI9YNpDkC
	r9N5l3CrBBFtWnjJana7VnJosroLKKVuTskvOrXzQhdSc+hsIM1CBubGIYlHVlg0
	iAWfiIXJnKJLkXifaJMN+wi7gci7gtui7ahLsLIM7ZJO/XK9YmzGLvctEcTUxz6F
	hsbQsg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qcs5crk6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 14:34:55 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-467bb3eea80so1602371cf.2
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 06:34:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739284495; x=1739889295;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zzeSpEzhPhKIc5ciktFW0BzNDzlKE+8N49H7bDEi994=;
        b=OPxOD30rhhhDjFj6jY5RpQHGu5URtgQZZHfXbIm8/LlLR7oHJgJ/nyEokW71R9Wog+
         whQoPj7Po0mSr0OqA+ObGJ6iru+1WMObL722a+L/WnaBfF1X1sDyCWaCPutGG09P8VK8
         5hECOvZJIKGoaIgUcuj9GSn9f+KFmBWwbUB2brKWvzLzN/nMlCrwbVjsn8zpuA5VYoz0
         +6zi81sX3rv7AU28O/cgiZ/97CAMhUTbN3ECRYW/aDQlxwrQkkBlLZmxmoGBNwcoIDyM
         xYhHZg0SR8+6M18JTPYQCXgTsW9u/w52QLj1dLhW5J+J2m3ynKJmybWjj8yzaCC9Z1Kh
         1olw==
X-Forwarded-Encrypted: i=1; AJvYcCWAWijIw92QEQmwFblTALvhEuHdC1rWZ8fHheyKI8sUKrRexQo0npAPN7CKcBOF2vBDexiXOLYE4yJ3b6E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwcaBlJkNIXoJlX7K8Ea1Thd/qHEPFvGbQUUa0pIN7A/F/ogJgW
	OLMybW3H3JIScIJnTbBt5lZOrTRkVVSwv0Q2k2F2uC40a95GGX564gPk5NHJG/hNoA/0UdDbBeE
	qR5M3ShlzzIibtmoHcJrSs8xUu/JrJ79YZmIyjqxoKKN2SxRvckyumVkuP9Rof7A=
X-Gm-Gg: ASbGncuH957y4iKJ1ZZra2LJURbRMerE/tTze+clDmd3JHzBl15/exKUjcQFPQpI1w8
	X6G7OTpGb/+zLAUys37vJFLhqGXOccTum3K5z8IBa82OX+mbg6ZZKPu3tTe7XVawxNRp7V4wRhp
	MZOztGFGzDHYjNofWX4vLAYTERa0KxaJ1nu6eLdc05doFiX1+IVsMgM/4z6mNPtZ3KBXXkGzvxo
	bgkJ/MyCu65s9qP2cQmAXzBAIpx34ecHQQfnW5ltStT6zeVpIBgmYQhbPgA2wvr6WBbaEh3HbYG
	agiEytAIF01VRYW9WaU0Uqv951VPmwva6S3HirrAxqhKZxerT4CKlGsNIHo=
X-Received: by 2002:a05:622a:11d0:b0:467:5b1f:4060 with SMTP id d75a77b69052e-471a3da4856mr14126181cf.7.1739284494790;
        Tue, 11 Feb 2025 06:34:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFQZ8D/6WgOcGT5XAfBFb3oB+8tfbLU3rY2SggZAfxtxRNTdse/H5E4+THqxC/HIDc/rhN41w==
X-Received: by 2002:a05:622a:11d0:b0:467:5b1f:4060 with SMTP id d75a77b69052e-471a3da4856mr14126041cf.7.1739284494356;
        Tue, 11 Feb 2025 06:34:54 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7cae13326sm324860466b.115.2025.02.11.06.34.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 06:34:53 -0800 (PST)
Message-ID: <b74f0591-242d-45eb-8c5b-bfc7edb0441a@oss.qualcomm.com>
Date: Tue, 11 Feb 2025 15:34:51 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] arm64: dts: qcom: qcs8300-ride: enable BT on
 qcs8300-ride
To: Cheng Jiang <quic_chejiang@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_jiaymao@quicinc.com,
        quic_shuaz@quicinc.com, quic_zijuhu@quicinc.com,
        quic_mohamull@quicinc.com
References: <20250211104421.1172892-1-quic_chejiang@quicinc.com>
 <20250211104421.1172892-2-quic_chejiang@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250211104421.1172892-2-quic_chejiang@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: IMr5RLrJXeS_VVSYP8kTxS27PVjM-jLx
X-Proofpoint-GUID: IMr5RLrJXeS_VVSYP8kTxS27PVjM-jLx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-11_06,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 mlxlogscore=999 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 adultscore=0 clxscore=1015 mlxscore=0 priorityscore=1501 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502110096

On 11.02.2025 11:44 AM, Cheng Jiang wrote:
> Enable BT on qcs8300-ride by adding a node for the BT module. Since the
> platform uses the QCA6698 Bluetooth chip. While the QCA6698 shares th
> same IP core as the WCN6855, it has different RF components and RAM sizes,
> requiring new firmware files. Use the firmware-name property to specify
> the NVM and rampatch firmware to load.
> 
> Signed-off-by: Cheng Jiang <quic_chejiang@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 24 +++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
> index a6991e8e2df6..93458773b72d 100644
> --- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
> @@ -17,6 +17,7 @@ / {
>  
>  	aliases {
>  		serial0 = &uart7;
> +		serial1 = &uart2;
>  	};
>  
>  	chosen {
> @@ -451,6 +452,13 @@ &serdes0 {
>  };
>  
>  &tlmm {
> +	bt_en_state: bt-en-state {
> +		pins = "gpio55";
> +		function = "normal";
> +		output-low;
> +		bias-pull-down;
> +	};
> +
>  	ethernet0_default: ethernet0-default-state {
>  		ethernet0_mdc: ethernet0-mdc-pins {
>  			pins = "gpio5";
> @@ -544,6 +552,22 @@ wlan_en_state: wlan-en-state {
>  	};
>  };
>  
> +&uart2 {
> +	status = "okay";
> +	bluetooth: bluetooth {

Please add a newline between the last property and subnodes

> +		compatible = "qcom,wcn6855-bt";
> +		firmware-name = "QCA6698/hpnv21", "QCA6698/hpbtfw21.tlv";
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&bt_en_state>;

You should use qcom,wcn6855-pmu (see e.g. sc8280xp-crd.dts)

> +		enable-gpios = <&tlmm 55 GPIO_ACTIVE_HIGH>; /* BT_EN */
> +
> +		vddio-supply       = <&vreg_conn_pa>;         /* bt-vdd-ctrl1-supply */
> +		vddbtcxmx-supply   = <&vreg_conn_1p8>;        /* bt-vdd-ctrl2-supply */

Drop these comments

