Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A06371F4C87
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 13:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750771556; cv=none; b=W3aIpsp2x3u0CBU957HUWcAgWEfk8qwN0TYON2Wlg9qnkqx+gkYqqsjuiiYiQKZVsEg9GOCPCG5zIBGXLQY4G4dUVFcAA9U+8Yh0hmwlsIeOfHNOMURB3S0O1GHXo9Y07gu5qXbuovlumvMhf/6AHsz3iyWlpcZwCVs65lBinBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750771556; c=relaxed/simple;
	bh=PA9hvTAzLsA+usJ2+Mj9NJkIcp3aM0mxLM2JBOJeV7s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TwM8pFZrprXSmg6wnpy1Ub3YQSBsck2xKA86fSfdJcDrYBCnf4L+isfdt1+Tsj0PTgpPImTsM7RCm3qZ5rnFUC0DGgcTMnZG7NFUM+3RHmJj+WxDwPiq6KDFcy8zK/ikBXyjvs19+5zBknfkREugZJEXFnEzuh1opbDaQ041BVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SegW1WwK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SegW1WwK"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55O8RBpn008161
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 13:25:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aX0gtlsQln8GIpy3r5I1Qit6u7+/jH2GtkFLZXw6FzA=; b=SegW1WwKU9Kssmxr
	AxAzIAxHfAatYoHopqw50DZKx/SKXVX08/OIzIXOvFH83bedTMWuDm4OWxYyxXjT
	um9eZ6D5jjzearI9IN0x6AtH2E5dgqOcrT9zrGZTm+a8+XwcFIWEgUT6aNjP8FBj
	ZvLQGXC7B1izxwNaPCed8dzeaTGKp/tSvg2ALhMfUrcxkwm3MH2ndeiFUAAq8Y7x
	MzBf1vRZOG45r1aa7VWTIGLAM7BKhwkyjnD633zDniPYvZ02MRPiLQS19BI1kM5P
	dzWWh1VwFAM+qGHYOdZIPcfhHrnJyyYSuteGnk3f+j/WshOtV621ROYN6pSwxeMY
	nYxZHQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f7ttudtv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 13:25:53 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d21080c26fso143246385a.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 06:25:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750771552; x=1751376352;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aX0gtlsQln8GIpy3r5I1Qit6u7+/jH2GtkFLZXw6FzA=;
        b=ILBJ2gxoodPfIC0+0VUnLE9NuskhONkA0q12lpo39um2a9ReZ1pEGjAFjC9EBOUjj/
         QTAkj0KJ/0VvWgYyiiVLkEkkbwjAjIs80jjw332rmxcNCvCr8LqtRgi7tLZROQwB6ZDQ
         MSv/bF8ZmBwp0CWjJ65IestcOVFzyIPRoy268y13fmH9P4u18k9SuiIVJsYrr1w9cYgy
         VnCmPq3QFiw9UHF9EQ+Rmnw4nu7d2ezVowuWND2SsJFp6YDPNzwFu8W75vLRAAd/1YWn
         gMQfFd9btOctkaokjcBnHyliyk9YDZt3MPWny3LJYe5EW2zMrTrBiOa4s9SqDSdZ4074
         Qn2w==
X-Forwarded-Encrypted: i=1; AJvYcCUTr4z7ZGSBGHNuvOHxyzfVMhYO7bYDN7/g6J0nwJVCvvA3fnNzR4VPsgTtnYZdL3FvrF/EoOkYVlTLzN4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzr+7Fpe3umBA+NgAhc/PGerfFPCk7z8NoPoBjBl35aPG685/mu
	s6HKrsB2/898hZwe0gytLQsHJiZB0nGqgYqcngCF1clmwS+NfJuUuUK0k0ue7uyjcisFfeORomf
	BRhIVAhd6WLN7J9iOQTw5JzJSJF94xIvlTdAGS8WKBEitwmYnbnx3jJD2UAFD3zralZI=
X-Gm-Gg: ASbGncviv4Fq447rz29KbQe0QUwSUgBhNYNROC+rbhQWl6USgQkNfd741hp8FIU6Mzr
	J7hVPtZKiIjsXw88Tb92bVtJ2OJ2KAgfhSk1NKlDnXCiIC+4pDWDdhFADwax/UD6v5fBEVYUbyx
	QTmnAEVONO8ZM8nUNolWN8f27qEXlzamReDYD6EKWfdorxRhfpiR+wLFGFZDs1SNZcecSAMCXBp
	hPghwrLg13wpZ4UtExjS9m+FPEHv4nl/76g9M8aIJel5Wpvl2w8czjOFKe0Hjd8Rv/y2Pz90T+k
	ig8S+GObYZKV7s7GBQk79XUKbriaUf8KO1gtbHZDq9OIH4tezLWywHUvJAipKzEhPXnbEtTB+N0
	8Lyw=
X-Received: by 2002:a05:620a:4594:b0:7c3:d752:f256 with SMTP id af79cd13be357-7d3f98e73d3mr833914785a.7.1750771552546;
        Tue, 24 Jun 2025 06:25:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHtmqJgy1cNQYlHf9rNiieXLLQW3l8oeZCtsM+x77D8zUcwYzl97X4xxSiLnDezlRaz0qJg2w==
X-Received: by 2002:a05:620a:4594:b0:7c3:d752:f256 with SMTP id af79cd13be357-7d3f98e73d3mr833912685a.7.1750771551856;
        Tue, 24 Jun 2025 06:25:51 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae054209ad2sm889931666b.148.2025.06.24.06.25.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 06:25:51 -0700 (PDT)
Message-ID: <874d57c0-a124-4767-acac-05e1a491b7da@oss.qualcomm.com>
Date: Tue, 24 Jun 2025 15:25:49 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: msm8953: Add device tree for
 Billion Capture+
To: cristian_ci@protonmail.com, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
References: <20250624-rimob-initial-devicetree-v2-0-34f6045ebc30@protonmail.com>
 <20250624-rimob-initial-devicetree-v2-3-34f6045ebc30@protonmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250624-rimob-initial-devicetree-v2-3-34f6045ebc30@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=QINoRhLL c=1 sm=1 tr=0 ts=685aa761 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=sfOm8-O8AAAA:8 a=EUspDBNiAAAA:8
 a=n_RBVNUhXirTSVEQBK0A:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-ORIG-GUID: 7QhZJM3pmYeNZyZVDCfOmCfhTNna7RPe
X-Proofpoint-GUID: 7QhZJM3pmYeNZyZVDCfOmCfhTNna7RPe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDExMyBTYWx0ZWRfX7kgixC4N7TMr
 VqGxMnl+XCe8NkrB/PthLhTTioV6Kg5+nQap0xqrtv98ePUztoGkLUADz+Yoja7sjuqKWB6xIOr
 vI71dCdESEV2lqhjGScR+Dex/yRf8znht+1MA9fnF59u7VN6gFvuyJWYvHH718hJWvdZJLdBP8p
 S9JoMQKso79yfh7F103oExyJv17ick1cICwA3zn3LCHLvGRVi1E0+lC/NyMyX4BvOZAc2hIlXT1
 GrDAOsDLi2FLsXnH0CjUn3YfRRmMsxpbbdWrlEY5Xr0k+FKvOJ//y0RJaZJO9QPRN8go7cOs0Rb
 CSFKGCqgVPviur6l3QT1PHK7jk9iUDr8D3WiEYAufUh9CkOs9zqfAuD1O9CWPE9Uld/SPclppZx
 ykG1yZjfYE+VP2uxjmHesdCyr4Ab0d62c/AB0DEV0TlS7RIi7Xb052Dtq2rFnKGRqwEuG/aB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_05,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 adultscore=0 mlxscore=0
 clxscore=1015 mlxlogscore=640 bulkscore=0 suspectscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506240113

On 6/24/25 3:20 AM, Cristian Cozzolino via B4 Relay wrote:
> From: Cristian Cozzolino <cristian_ci@protonmail.com>
> 
> Billion Capture+ (flipkart,rimob) is a smartphone released in 2017, based
> on Snapdragon 625 (MSM8953) SoC.
> 
> Add a device tree with initial support for:
> 
> - GPIO keys
> - SDHCI (internal and external storage)
> - USB Device Mode
> - Regulators
> - Simple framebuffer
> 
> Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
