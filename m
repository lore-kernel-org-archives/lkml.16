Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A1C81F03FA
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 19:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744227077; cv=none; b=QsgVZkNgwnDB21WFS3OK8XbQ9m+BlB0uPh/yWIlEbfadqyRQxR3VsOGQZsZ2XsYDfC/abUK2KZYQbcnmMBI4byNQRDpAkWsMBnb4J9V43CAuOsaFusJSmSShv+EeK1xhHs35kCdB35RKvMFplvEsXMfqegm+Tj++4jXn1ORgSg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744227077; c=relaxed/simple;
	bh=3h2o48w0QjOK4ZeGT9FMMoj4ho63MyVRsU5z0hBWp/o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CJ4WTvt/VwC/e1K8vCJIe/7XF4zVju5CvybzmTJWerUjnfeYDYrCYbY14mm7AuCI5gLyZV1e+JoIdyXurrzG0oAnZEf/4VIpaou/QjpkJG9EV4wbKmn4vTEQ0O/rUQoi969nH7PU2HRuScdouqPPe67/TtlwLeba+xaud+DI8t4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ik/xfEBw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ik/xfEBw"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 539HroPf010446
	for <linux-kernel@vger.kernel.org>; Wed, 9 Apr 2025 19:31:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	10ynH9XRCJ86PYB1I7aS6LqVmbsLmtnJe9E3XkJ/SOw=; b=Ik/xfEBw6FirLzxm
	2ll0LrlaShaPzjzPACGOnomHswT9nQ593DQ8CddiJMhrUecvhHHwRRNflKyD9Wd8
	Iyr2umpXrFSbN6OH0UdouTlisTA/UaGzN99rr33ZpTfeMhQi8hjhncShba2tObFK
	ZT3dHj3JTO6XGboJqlMVAPg+slroAl4JQChb7UuzyQuTOlyM35HJZTDf/Y/q+YHY
	cAwY62S760IWTdoXFQyOCGbdGSq7R9d3IVOrWwbJGipFfEnQi6Grwp+Q3xWCm3hn
	sCNSe/C+cy8Gz6e37FG1kFQETYJu6llxsqUstosIO8RFQ+uggd8EtDivb1cq8iLK
	dGoHTg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twftmcar-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 19:31:15 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c54788bdf7so1156185a.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 12:31:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744227069; x=1744831869;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=10ynH9XRCJ86PYB1I7aS6LqVmbsLmtnJe9E3XkJ/SOw=;
        b=XR/zdpo8edBUYVLspTDcsuIG5j8WZsQqRlQZrLhVfuWYlCmBCP342eS4VsvUd9E/fD
         IYhQ64FII9+2uGCmGOwH/CHh2jomHMUCCC+Rl/hFIEXr+FlKx6k5qJqCPm7WqqbP4TKl
         zxrfCOwoa1QK9U1GSmLEd1+Y+6LuaaXhiFjrf6FXN4Wa7cyo9Sw8sTOgTgonIKMNRgox
         8KfawHvBSsv3iOJ/ZvaYVtBDx2LPffZjnsYx2S97L1vcMIaH0chxF3uSxmteY/z3W/l8
         jNNfftibv6lGH1ZUMQiCpVFaIFLS+mgwn4NYS3Aucu97EqUYszdd+MJXrjLYeQWS3Wy0
         boYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSZTwEzlHFOi3B83ryROiCfQxtzDpJaL4MgCE2Bwj1XK9gEcsec4yRcgjpBVWR2iiNqLAfxNvaYsLJG2s=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRs+v4mAtCuOUUSct1fMchhl8+swGjmHhzgqAIIgSvdL5umL2O
	QOdZhKT0kUlJHdOI8zklGSjaFpzRGUNL8gIld4/8BX0F0mOCx1pI/6h+NhsenXMwBq3rl2lJyQT
	wkzC+AaqOcGaHWsoGDlz2C9kAj39BfVWRyuzfRNJt75m4nRM1YgP1MerJbkJ7K2w=
X-Gm-Gg: ASbGncvRtuduhioLfOIUvpj1WEIKQL9x0wQd+AOvqV/Wpx260VDqtnvk7rxQ3FN1LNd
	KwW2ANjki61NEzXQWMsDcBQ3m/0YBKi5s2QEww91VDvAZvO0l0m+MVpr44Lu8e3b+Ya4c3GzLTR
	RW+1+DsqqK6+zOQg9eIVOLflCKXxaUjX+7l0NJWTVtw+KRyC0hQk4r2OSc7p73WoUzeTq/CZswE
	SsGfBoctabtPpy5AyndQb/tViEIEKJg8bEd2M4P3Fgj7THJ7s6msSRYA1hFA58FE36IafJnFqRL
	B33gOVfESbqPRiHBmprkFCoTnI6FJNBejLYrOY3RNam2BO4pDYnr9YX7A3MGF5m7qA==
X-Received: by 2002:a05:620a:430e:b0:7c5:e283:7d0f with SMTP id af79cd13be357-7c79cbec03dmr237798785a.8.1744227069294;
        Wed, 09 Apr 2025 12:31:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEGdZkJ3uyM1k6il1QQ4tZzm6Kb6iei6rLgcgi9hbyDE+GWGGvqjoDJjonneM8n5/WqFQGtLg==
X-Received: by 2002:a05:620a:430e:b0:7c5:e283:7d0f with SMTP id af79cd13be357-7c79cbec03dmr237796685a.8.1744227068851;
        Wed, 09 Apr 2025 12:31:08 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1bea588sm142930566b.67.2025.04.09.12.31.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 12:31:08 -0700 (PDT)
Message-ID: <2124b898-2676-4002-8688-d3e19e55e368@oss.qualcomm.com>
Date: Wed, 9 Apr 2025 21:31:06 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: qcs8300-ride: enable WLAN on
 qcs8300-ride
To: Stone Zhang <quic_stonez@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_miaoqing@quicinc.com,
        quic_zhichen@quicinc.com, quic_yuzha@quicinc.com
References: <20250325075331.1662306-1-quic_stonez@quicinc.com>
 <20250325075331.1662306-3-quic_stonez@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250325075331.1662306-3-quic_stonez@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=B5+50PtM c=1 sm=1 tr=0 ts=67f6cb03 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=DgEYNLXXC2yaUqHi_YcA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: nTadsV3G1dgSF-VBHcGsYEH5BiEEk_Sa
X-Proofpoint-ORIG-GUID: nTadsV3G1dgSF-VBHcGsYEH5BiEEk_Sa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_06,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 suspectscore=0 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 lowpriorityscore=0
 mlxscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504090130

On 3/25/25 8:53 AM, Stone Zhang wrote:
> Enable WLAN on qcs8300-ride by adding a node for the PMU module
> of the WCN6855 and assigning its LDO power outputs to the existing
> WiFi module.
> 
> On the qcs8300-ride platform, the corresponding firmware and BDF
> are QCA6698AQ instead of WCN6855, which have been added in the
> 20250211 release.
> 
> Signed-off-by: Stone Zhang <quic_stonez@quicinc.com>
> ---

[...]


> +
> +	wcn6855-pmu {
> +		compatible = "qcom,wcn6855-pmu";
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&wlan_en_state>;

property-n
property-names

please

>  };
> @@ -406,6 +507,13 @@ ethernet0_mdio: ethernet0-mdio-pins {
>  			bias-pull-up;
>  		};
>  	};
> +
> +	wlan_en_state: wlan-en-state {
> +		pins = "gpio54";
> +		function = "gpio";
> +		output-low;
> +		bias-pull-up;

Please flip the bias and output property order to keep it consistent

Konrad
