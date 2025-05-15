Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29C4E211A0D
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 15:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747323613; cv=none; b=AcicofRy2djL3s4uyzCNlkOGed4JF2MY2LPpPNDxUL//wQ11GY7J9rNOTTHNePLGS4UfNFubR2L76Tp1icYE1dXgS8laTKA5UlUZEhdySfl8hlJW+oTG3W4Ca3L8vKk+l2y4AhxkOs6zW0gyzLvArDdCbSMBrPLQseDlv7IAEwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747323613; c=relaxed/simple;
	bh=LA6n+/pjiNT3RbGvtG1aJhvDxaCEaENms1z18/PZRDY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rhgrxeF52XncDgTmqL9qle+oi/95hvbDw1o85Ncfasd88XDjvlZ4uNIDguR3cIak9Xu5L3HiGMeQfzrwnjxe+SK5+K3H+yRwiOrLmBrzBjKJyliQrpqzZM2wQVdMaLaHYek2q8uZY4GR8lSrxXwhjca5/HV4Bua1h3u4pMYrBCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VXHWEKjp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VXHWEKjp"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FEFEiw009131
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 15:40:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+4pk6qqQf94MNh0qP3FehAuZCQoGUKgM5ka+mTmo4Kc=; b=VXHWEKjpAhc9tyHx
	wnBUtsDyrO8f+PPjfbcAaf3eCD8gN+x45HZ/o9XPR6jZ7CgOi69o0AQxgN929ODA
	e41SsfbTbsO27EwBIKKXF2JBgc/B30r8LKrfCl1KKNQSzq4YfpXqrc1lnh5zqvDK
	N3tsy9MQml8d7e340VdShpR5xz9dqgEtNG1XazpEClPR5fb8X2yXx/oJ2SdNZK7W
	5UpdhzqFE7H3Y3qb72uPSiDJMihiX+xZbkTr/Mw5RWM5FIv6OnhemKwNPLf5QqwQ
	o5uaNkUj59HWABTguBWEB3xrnadDswsrVhtfVVs1SnSQr6lKKLrJ50PwQY5OXT8+
	SriR5A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbex6p92-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 15:40:11 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-476783cbdb8so2570811cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 08:40:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747323610; x=1747928410;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+4pk6qqQf94MNh0qP3FehAuZCQoGUKgM5ka+mTmo4Kc=;
        b=w4+JDMfkQ/L+OEajfDu3j1mCVQVcRSXisYmxnUf5oraM7/Xa6rUCOIXeyipRoKp86J
         n2abgdEdO6GoIEXQIubwNNrXzQgzaNm8b2xnT0J3QuWAFRpDhC2mWIVwIrZkTB0dK30x
         4laDrk6/KKy1PDX1Hmo1kK1W0ELPB5RMb7bllxLhZ+FwAa22Zb4lh9bePHyy2wjES+GB
         XE50BjsV9pkBK9nSy65hsshYZp0LiFFj6wfW9b9BbVIoogZlsBdykEpWazepymT5NabH
         +xboD4QQIV5MNUh+kRXR+fBdN84HS8DKLLzOdUZQDqH3nLnmSXRyq2gTq4jvo54H4Nbl
         8rNg==
X-Forwarded-Encrypted: i=1; AJvYcCXfPsxDNNnw+0NV0VgFydroXMTaIMDJelA57d2EVp0Op2zU/oQaqk8m6HSJkyYEoFtB4CA4nz+UJEQ3sVY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxOMj8D84aBofKMrj+CeI+EY7qfKf22Ti0Ua1rDVKWvS0rC5nU
	rrfNSr7dYLrlYfy3sD/Zk0Xnp0MKflxOCrGO9xR1pMRTpRk0nZ6AD8k1a50bVnnn6QfrkeCWNDt
	lsTaCRYjVRFG1GSeajg6mIeAF0w1C6KKIoujAeTzdk7zFjXaeYQZDs7BAkkrmlD4=
X-Gm-Gg: ASbGncsbCQn4qqP2exOcC3MFV8Wi3N5oSjNbTn0V5ARaSbewpUleSw+bhNd3IfAhkBC
	JdXLkvwEzBxoVVfgE2L3WFZcID/aX6aCiOjLE2jj4IEtz5HsDcGcRFrHdyJYq6W6TxfXhq88e8G
	+3G4V9S19J5Sm8+2vei9SjXCAWJEoCl9CfsQW8IKYO34zK+aowhzOSpqeBD2Cly5nfBVTSx0532
	dkyGvwdoYs9j15Sb3NoYyc/GUaHbrR3QShVmqXBtbZZShA71se/Kxq40cd4qE/k4RIkb0N5wCj3
	aPYXMlqqi1E9qiafMxQGhMhS40Y4+zjwRUhQOEASJ8qj81PHEZDJt1J1dIMJP8BDPw==
X-Received: by 2002:a05:622a:1a93:b0:472:1de1:bc59 with SMTP id d75a77b69052e-49495c6672dmr34442141cf.6.1747323609897;
        Thu, 15 May 2025 08:40:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGeZxWV/aIj85YA422H+ZaMSL8z0aOcepnuoDEjDToxS7za+PZIF+/FGdk5MduxdyhCILATxA==
X-Received: by 2002:a05:622a:1a93:b0:472:1de1:bc59 with SMTP id d75a77b69052e-49495c6672dmr34441961cf.6.1747323609433;
        Thu, 15 May 2025 08:40:09 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d06bc3bsm6306966b.47.2025.05.15.08.40.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 08:40:09 -0700 (PDT)
Message-ID: <d8574c30-d397-4218-ab02-e8afebe9a75d@oss.qualcomm.com>
Date: Thu, 15 May 2025 17:40:06 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/18] clk: qcom: camcc-sm8450: Move PLL & clk
 configuration to really probe
To: Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20250515-videocc-pll-multi-pd-voting-v4-0-571c63297d01@quicinc.com>
 <20250515-videocc-pll-multi-pd-voting-v4-9-571c63297d01@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250515-videocc-pll-multi-pd-voting-v4-9-571c63297d01@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDE1NSBTYWx0ZWRfX9OpUE56tZNms
 Q49U5VMfsaWYCytquJjhIngvTm2Gd8a6oyJ9O8Wof0JJ7jXmvBhEi6lcf+Ghmt0PiP8IcYF8G5E
 JpSls3BOPjB56x6di/J6jpdv9CUFFYtT6Q+hsNcwJyIq6vHApsgiFPr0/UM9lEXvboljg2RPRVT
 RuWpzbAPvboCQYC+O8eaVQPPsrGVVJKncuuyO7G9ckHU8rZZtUdW5ryb16e+t0g41EeNU81CqE1
 OhJQp9ift1tIHgE3sbEnuM2uVTpS4kBKRcNGvk5c0Um8SpFuuUKbMlUeaii9VIbJq0d51ojhigA
 0q+uTDT6Hi6PWv5XOI46NsK16dV1/5pgQEGNYAMkB2kTTF1mtG5wPapSg+Vpa+HCeVo0NdoMfk5
 PCE/m+xxla70U80nC7g+lzVUCFgWAco8FPHdJInT1gjO0vyUkNN5Oq8ma+ZVQ5gZqYrB3O7p
X-Proofpoint-ORIG-GUID: RryDnK8GvGQXDCs-kWa6pl9tgdD2KvzK
X-Proofpoint-GUID: RryDnK8GvGQXDCs-kWa6pl9tgdD2KvzK
X-Authority-Analysis: v=2.4 cv=IcuHWXqa c=1 sm=1 tr=0 ts=68260adb cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=WExNFyCIVdiA-8HnxWkA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_06,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0 adultscore=0 mlxlogscore=999 bulkscore=0
 clxscore=1015 spamscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505150155

On 5/14/25 9:08 PM, Jagadeesh Kona wrote:
> Camera PLLs on SM8450/SM8475 require both MMCX and MXC rails to be
> kept ON to configure the PLLs properly. Hence move runtime power
> management, PLL configuration and enable critical clocks to
> qcom_cc_really_probe() which ensures all required power domains are in
> enabled state before configuring the PLLs or enabling the clocks.
> 
> This change also removes the modelling for cam_cc_gdsc_clk and keeps it
> always ON from probe since using CLK_IS_CRITICAL will prevent the clock
> controller associated power domains from collapsing due to clock framework
> invoking clk_pm_runtime_get() during prepare.

generally we want two commits for such things, but let's say this time
it's okay

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
