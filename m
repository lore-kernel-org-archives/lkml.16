Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 808D218C03D
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 17:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738864162; cv=none; b=gzY9lDiKOgHD5kYSXTnBfLOLVeTiGrtAJORacq/rBgrGW6w0o7mY8exPow9AInkvKcvjz4TYaTQfU5ZMtSvRUShIUjmtJ9hXoqPCPYKtJAMU03sm0KUVUs/GfZA5T0pfouU+EPDZogphUpRJDsB5TzLriINjDd4aAxkr46Ijg0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738864162; c=relaxed/simple;
	bh=TnSlwLd9zv7yWxZOIiCgJu1jIh3lzoIbU82IlFG4G7U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=frbFX+h7LI5H3uhEdLMXY92dZ0IOD3HvTIxohZNejwsENPz0pYHi1LSvT/rOhVRmJ8RXkcrPN846E3M9KPo/hacFEykBz6eykBDT2fObaY5voxLqJ8MrovTaoDtvwLWZvOttREVaclYeSYHVB7ITLSnzIoMZhUjd6CTKGRreaws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mVWsbPV2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mVWsbPV2"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 516D1lgT009519
	for <linux-kernel@vger.kernel.org>; Thu, 6 Feb 2025 17:49:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XEShK7QmONl4wom7y3IXWD4phv5eFUloOdL0xIQxHUY=; b=mVWsbPV2C1oKpdkj
	aYnNe/bMpospjWSp6jNLBcc4h99B8MMDQ1cathh4f9+EfLW8hZGG8GDKSe8DCGCA
	O2ivZqx/N/nXA4CBOVCV2JFyB+vf4sbi1m8/DOS6bie82pmdf6LxuVGi+gZt/lzv
	JgzWfWFusiaVF3fm6/PSkuPsmb6CvCS9B57SG7jEokaWVpzJF15WtTbbw6ausEvL
	DU1H86IbxSLqyV56VzrTMDTVx2KCliOaAb0YwSobKi22y8LX6GsHQe4KfSJ6UK0D
	gsChi7BXmOLyyZDVC+2gsetolDeC7cd1IONxdk9/YXctzggQMnMqPTKYa8rWS567
	fUdmTg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44mwkugqs2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 17:49:19 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c013ef320aso12023485a.2
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 09:49:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738864158; x=1739468958;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XEShK7QmONl4wom7y3IXWD4phv5eFUloOdL0xIQxHUY=;
        b=erI8W3LzSoEcYWo1A3I2mBtzBIg0N5WvwUuZgOVJZlDDxkl6pGw284aAthEMbxwgqS
         LBsv7dOki47GXKWTOm3gIwim9ntb+rXeMmrDZSCH/et0gqXOEGWS+8dhuAUnqfNn9lRD
         aTE3dH/MgOPkmEJhTrSgaExlbIP+6Sx99ohHFzfjYzDP00fU4d0DjxZqcSrSLHkQjQMc
         CJnule8CYtuZz+TFLSu1cP51iI8hVuMVFJ51DmIg6/VtJLuVQ9IAOcfcInF2ERKkxETm
         aUbGlobauOesnLuysLN6QaKsw46qBJAY71NixaRezEyoQPE5V73WpiHnZNW4vTVTHZ6h
         UgVw==
X-Forwarded-Encrypted: i=1; AJvYcCUXz+ZE2BkqJTspdhm+zFtDgJIBSV9h6jAuAEKwieWxp1ZoIJLwvNdkcCKCjD+sV+sjoJMgF1GNhNMreQQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxULmK5kmElWB8ZIcQ3Z9m9+dkKOtHKWn0KmgmUUdqaKbLvt0y6
	l4UKpCR3ZYAm/lHE3v3V6zMy7onQ6Uvt9N0HLNvjO/ECxo40zmteRRTYSFPUYhFuSAzSyEuRGws
	SuMoC6Sgb82ol3RJnycCAYDR52HGkqOpYIutcBVAgpLTYZX2FWnoOxAhA5z242ao=
X-Gm-Gg: ASbGncs/40uyaXOg3vWpEpi4KhNsElABS7sbtjbQiKDvsGTT2obQqWP04yaBfjeAzd6
	sZlSuVqCAnpcx55VtP0G2RFZZ3LW1qi4Y5dp6Bi0E1LX9qUtaEDtlYmrTWDtEKm2bMwr8Rj5iv6
	hlqx2A452iALEEIQjjJJqKmGOaXpRdDpKZwoB3jdXpm0QmMC600gUDVJmTD6Bgxjcz9SxQxu42o
	zLsFkwl6d4xiS5iE69L7pJEsFsv91ecy+z83ahCHSEkMrdDxOjv+o7uMrT/HrFZHYL2kEfVnq5R
	EP4iHy3U3atcAm3v71iMNiQoX/UsG11/VQ0Ttz0Qk4t6FxJg1Ma3dWUbsUc=
X-Received: by 2002:a05:622a:149:b0:462:fb51:7801 with SMTP id d75a77b69052e-47167a27b02mr954711cf.8.1738864158032;
        Thu, 06 Feb 2025 09:49:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFuJQ26PfCn6TWOYNKdpVCmuBfRLXs1MT5XO1ZO3huajwUMemKFLWySchNBBV8m3a6QVtoPmg==
X-Received: by 2002:a05:622a:149:b0:462:fb51:7801 with SMTP id d75a77b69052e-47167a27b02mr954461cf.8.1738864157598;
        Thu, 06 Feb 2025 09:49:17 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab773339e6bsm131278766b.152.2025.02.06.09.49.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 09:49:17 -0800 (PST)
Message-ID: <d0b86591-7bac-42a0-aeac-1f7f6b75b75e@oss.qualcomm.com>
Date: Thu, 6 Feb 2025 18:49:14 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/18] usb: dwc3: Reserve Higher Bandwidth for HS Periodic
 EPs
To: Akash Kumar <quic_akakum@quicinc.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jack Pham <quic_jackp@quicinc.com>, kernel@oss.qualcomm.com,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Vijayavardhan Vennapusa <quic_vvreddy@quicinc.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250206111543.17392-1-quic_akakum@quicinc.com>
 <20250206111543.17392-2-quic_akakum@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250206111543.17392-2-quic_akakum@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 0RPZZAr1QyTv8P-BllNHUbA8ZFsicStI
X-Proofpoint-GUID: 0RPZZAr1QyTv8P-BllNHUbA8ZFsicStI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-06_05,2025-02-05_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 mlxlogscore=999 mlxscore=0 clxscore=1015 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502060143

On 6.02.2025 12:15 PM, Akash Kumar wrote:
> On targets using synopsys usb dwc3 controller, it is observed while testing
> multiple audio devices, a glitch is observed during testing.
> As per dwc datasheet,By default, HC reserves 80% of the bandwidth
> for periodic EPs which can be increased with GUCTL Bit 16.

It is observed a glitch is observed.. please massage this paragraph
a bit.

> 
> Add quirk to set GUCTL register BIT 16 to accommodate higher
> bandwidth for 2 isoc eps.
> 
> If this bit is set, the bandwidth is relaxed to 85% to
> accommodate two high speed, high bandwidth ISOC EPs.
> USB 2.0 required 80% bandwidth allocated for ISOC traffic. If
> two High-bandwidth ISOC devices (HD Webcams) are
> connected, and if each requires 1024-bytes X 3 packets per
> Micro-Frame, then the bandwidth required is around 82%. If
> this bit is set, then it is possible to connect two Webcams of
> 1024bytes X 3 paylod per Micro-Frame each. Alternatively, you
> might need to lower the resolution of the webcams.
> This bit is valid in Host and DRD configuration and is used in
> host mode operation only.
> Set this bit for host mode uvc uac usecases where two isoc eps
> are used and flicker is seen.

Re-format your commit text to wrap at ~72 characters
> 
> Signed-off-by: Akash Kumar <quic_akakum@quicinc.com>
> ---
>  drivers/usb/dwc3/core.c | 11 +++++++++++
>  drivers/usb/dwc3/core.h |  4 ++++
>  2 files changed, 15 insertions(+)
> 
> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> index dfa1b5fe48dc..7e55c234e4e5 100644
> --- a/drivers/usb/dwc3/core.c
> +++ b/drivers/usb/dwc3/core.c
> @@ -1461,6 +1461,14 @@ static int dwc3_core_init(struct dwc3 *dwc)
>  		dwc3_writel(dwc->regs, DWC3_GUCTL1, reg);
>  	}
>  
> +	if (dwc->revision >= DWC3_REVISION_250A) {
> +		if (dwc->dwc3_guctl_resbwhseps_quirk) {
> +			reg = dwc3_readl(dwc->regs, DWC3_GUCTL);
> +			reg |= DWC3_GUCTL_RESBWHSEPS;
> +			dwc3_writel(dwc->regs, DWC3_GUCTL, reg);
> +		}
> +	}
> +
>  	dwc3_config_threshold(dwc);
>  
>  	/*
> @@ -1818,6 +1826,9 @@ static void dwc3_get_properties(struct dwc3 *dwc)
>  	dwc->dis_split_quirk = device_property_read_bool(dev,
>  				"snps,dis-split-quirk");
>  
> +	dwc->dwc3_guctl_resbwhseps_quirk = device_property_read_bool(dev,
> +				"snps,dwc3_guctl_resbwhseps_quirk");

This needs a dt-bindings entry. Also, underscores are forbidden in property
names, use hyphens instead.

Konrad
