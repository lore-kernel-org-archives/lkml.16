Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA51D18C002
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 15:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749654394; cv=none; b=e4cfp/FyAmRMqwth+X1wXkG/l3FiAV8I84i2yHolmGFSEuwKmXVPUN3t2nwtWJ2/L8xPbIg5R25RNj1zOG9s5nFcoJj+CwSOnAIDPqtt314X1KrKlSVX0gqb22mAsgk8ej71ZVTooi1UHqzTQniASnZFx2a7Wa/cJnn5a7lGr1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749654394; c=relaxed/simple;
	bh=ajchxbU7+AMklteL9pZzSBbNZx9h7w3GcNr0Mwics1U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eODO4FwS2txv8zmZWsp1LD7bOlPAV5YbeBj5G7ugkwEHkRqiSwnnE4JDidZFcXXScak67KojmYpHvAlwoQ+kh0KWBDuah9QUtbkXSc1qHfUobYGhcilTN2lVr9RuCKTyxgSwYHqyxV5LRXtAwTwFvr4/mzeeV5H6uykOLF8TTJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ku62Iyur; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ku62Iyur"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55BAndl3002628
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 15:06:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	77fKbdkYmtPlwXrxnM32o82p7ovrXrSQy4ozw1UOaUo=; b=ku62IyurvRzF4bk4
	miTbSYf251eZWFjTfr6u4uUEDRIOVhUQFH131bvCOhz1uizHvyiGNOTU7ynprf+J
	kB0XZbCw6RrLi5v4IKpF/bZdpbMBVPNr5s2WvBa0q+IGaASUwiiVEWW7IewbJp83
	8EU3/2PTb6mKCS5Ox8dvEnI2EUaxsfGflGZeKcmO5kMR+ZgOIr2VkNEgYQZqYAui
	+C8MfH8+btFfrKcV1sXLxVplJGc1Kokb02gIB70OniLMyh11sezM9VLFpDb4IcEO
	BwZtcJcHRu4aZpXqT5auropA6UsThPHsU7KQsapqdhB7JX+h06NWKIFT+g7nEeHs
	7I1Sxw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4778cwgqcp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 15:06:30 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d0976a24ceso21156385a.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 08:06:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749654390; x=1750259190;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=77fKbdkYmtPlwXrxnM32o82p7ovrXrSQy4ozw1UOaUo=;
        b=SsBbsQAf9hzpcv1dEAFPIak9qJQushq9Q6s0M4PBDYMMw7BmljzuYcruURTcalK1Mf
         X99sL5dPN0kG3nC5TD7T+qu90XjLyexM8wcAUXVtjFydMStDTTUa83rKiUzXH4DG3fBN
         Huhl52Or37n+dSu+tby28wuhJ1EXm4ZjYTQhbDMsa1Tu2qg6xSaheMG92dHcPn43VLo/
         zSRXRJQoyaXcBGEBWHpL4ZFbCRyiG4ebPpkNXbT+zWamLUMSPU9aNAKK+VG/qPb2mmS1
         d+m/bUHEdQj+a9GEXj3jcDUVuTG/GMNN1rXCUcQ/KOwsuSRdLf6JP3PK5UkEiZX3vlmN
         /aAw==
X-Forwarded-Encrypted: i=1; AJvYcCWpouj6ZlE9bQX/UpF250eU9cD4Am/Ke6YZD16TvGXW15w69gOjswfGZncrvktHioEBXypNBXhst4Ntu6E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIjfXMx11XvnZQvblUldRRWKCGoYxMl6w00B57HWbQE3Uiw5w6
	pWsyoGTeditksQHLr/mkcebUQd1Tuj4C9dFC9WsNifs05hqWf6TWdhPpGeqpsBq0ZrQhKXnx18/
	4fM3XjXB6m68Ca+EzpxRzM7LOA7s32aOjaDfuGg4YsQGGXZJ7dGIlRlzXCVDVDWUdHv8=
X-Gm-Gg: ASbGncvZsUEu45DuLB7kwg/9mTiik7z0ErTp+BO8nM8Gn9I8jT6Jtb/onp68zUnbxyq
	Ta9neGIBUADTbeGsxhw73O0XNVtXpbgNtS2Z4KjYifR1gG8F8mnOGlyEQ8ZdUFe33ul/ONX7Faz
	vUCggpi/E0CTB0kpnVax/ZpZLNwJlW83qyD5HLwvQnVEmbpzXqKJkieMi4dI6mOjzQa5MqFF3ej
	9RQ/uEtlKOen8QPE3GlhbPlokxlUv34ClDGbfCW1kuCYK4jL83bxKf2/ZdfN3QB5XupnbeVvSh8
	EV9swiQJj/gOhOlSlcGMBw2QqwdBjs/c5TrCw8aMR7UUHytspCUch9lYPymzygTA0s2vBhE09kp
	QhgM=
X-Received: by 2002:a05:620a:2a04:b0:7d2:89c2:eddb with SMTP id af79cd13be357-7d3a87bfb10mr208044185a.2.1749654389704;
        Wed, 11 Jun 2025 08:06:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGFQcyeTIefOmtTUXQ/DK1/6HF+P0px0MJoBSIH1JUCYT215zZQycMHgB/rDMBR3Qjc3+Rx8g==
X-Received: by 2002:a05:620a:2a04:b0:7d2:89c2:eddb with SMTP id af79cd13be357-7d3a87bfb10mr208041085a.2.1749654389233;
        Wed, 11 Jun 2025 08:06:29 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade31cc25b7sm832539666b.66.2025.06.11.08.06.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jun 2025 08:06:27 -0700 (PDT)
Message-ID: <9d966b32-d5ce-4262-b99e-900085648230@oss.qualcomm.com>
Date: Wed, 11 Jun 2025 17:06:21 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 2/2] arm64: dts: qcom: ipq5018: Add tsens node
To: george.moussalem@outlook.com, Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <lumag@kernel.org>
References: <20250611-ipq5018-tsens-v12-0-a61374a5517d@outlook.com>
 <20250611-ipq5018-tsens-v12-2-a61374a5517d@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250611-ipq5018-tsens-v12-2-a61374a5517d@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=AaixH2XG c=1 sm=1 tr=0 ts=68499b76 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8
 a=UqCG9HQmAAAA:8 a=TIMhQzKtEeIAjNMpRogA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: PFkvls_OYmA1xLyFUffnAkT0dQbD-AOO
X-Proofpoint-GUID: PFkvls_OYmA1xLyFUffnAkT0dQbD-AOO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDEyNiBTYWx0ZWRfX+46YrD5syY3I
 EcNJAabl3TtSFBzGdsTTZlIBexCJpHtQiv5a00sHggU/G+suwbxYYn4ihMurkOlYxE9+jycbiU/
 53ZG6SvVo9kQ5IpEc+qKhHXsrfS9fyMIS5oQQYVxLkQKsAabgV4I/PWjiWOmtTOEgKUWpBIxIer
 /BTNd15A/nmuJVFmyP5W9mtqxpklZw2dHNmAEvL9dAGTLA7ukvWvEajuiQql7mS/kwKtSimf7Re
 yPdAxHIoF2Ozgbo2ay/bdlgSpZIQqdiU2a2SDO3n5dR4rYCeUZHofxYfQxLkLbE+ZdGPxLGZmhv
 uJrvbQSkEF3JiWSGKEGxuWXrcEN5ZqQru4cds0Xp8jNVIZqDygaCLpm7yrDWm2ACe7AhAvvtMmt
 WXWyeDXo+CW1x0o1E/rJNBYnpW0v8DhJzmSBg5Vhkg5OSdBMOUQd6zZj+ZXfpMMjNzgWHsoS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_05,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 phishscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0
 bulkscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506110126

On 6/11/25 11:33 AM, George Moussalem via B4 Relay wrote:
> From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> 
> IPQ5018 has tsens V1.0 IP with 5 sensors, though 4 are in use.
> There is no RPM, so tsens has to be manually enabled. Adding the tsens
> and nvmem nodes and adding 4 thermal sensors (zones). The critical trip
> temperature is set to 120'C with an action to reboot.
> 
> In addition, adding a cooling device to the CPU thermal zone which uses
> CPU frequency scaling.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---

[...]

> +		cpu-thermal {
> +			polling-delay-passive = <0>;

0 is also the default value for polling-delay-passive


> +			thermal-sensors = <&tsens 2>;
> +
> +			trips {
> +				cpu-critical {
> +					temperature = <120000>;
> +					hysteresis = <2>;
> +					type = "critical";
> +				};
> +
> +				cpu_alert: cpu-passive {
> +					temperature = <100000>;
> +					hysteresis = <2>;

that's 2 milicelcius, consider x1000

Konrad

