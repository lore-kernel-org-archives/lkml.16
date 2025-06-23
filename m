Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F434239E75
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 10:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750672879; cv=none; b=hPwL1RUHN32RMtsyXN8odHhgvcMR6+OJLk943slSLo8gJlosJh/Z0yF9m+8zKJzVn6OX430wQd0BnPfNcTIpwOhHl/O8ZWNFZD4LHy438qrktNPsKevvDAw/A8jZFp5OicxZEdaCSJC/uJYG3qbakLFOdypL6ULUalEdoKPg2BM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750672879; c=relaxed/simple;
	bh=hEzR9f/pVzdnR2q2Os57Kxsn5Q7ojiITh9etL1uva70=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fMdYUB91oLsQF/Kc08Oz9PziBh++qVFEZRlCXgxCQvIE+oUnUn6M3FRflg6XGiwRg4O4jqB5zb4NnHPBgA0DBKkZOqTkAlv3RE8wN1R/tvp1xRtQPuck4y3FYZfNUu+jXM9Om266ubx29+mW3+bqyn3iz6xJWhrRH9Lj/a0UnTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=idEa+NPg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="idEa+NPg"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N9ca7H012688
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 10:01:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dmI4axmiuDRIOEMjY4CzWX76Iufc77l66VOjnoaKHVY=; b=idEa+NPgqx09x+m+
	cNjBPTuW5rQDkrBctBYo3ir0rnZ7yzd5RAq6uk2PGlx2K/ZKReaLtFCc62OirhQm
	q3uX8T+Pp0g0fdh04rKHDC3scyO1eRtOs3LJsgZvIVRgoCx+z0bRlQad6n0k92SM
	SD97gQAseLfFavE7ajvZhsXDpWMERYc5HLaw+ucGvRa7WzwNDhYdo2Vv6GIDG9Es
	p4qoHaafYWvo62kQj4RDwxSYJ0Do+ktzllnWDSoo+1WO0ybH+GUfL5EbwMW4Nmjh
	CZgbZtBW8QOVPCkwFVta3IroxGKlLaa1555KcOTA5qj2SLzNy1jFsV/DQgFI3YoK
	Xj304w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47eud09cbg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 10:01:16 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d3ea727700so65098785a.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 03:01:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750672875; x=1751277675;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dmI4axmiuDRIOEMjY4CzWX76Iufc77l66VOjnoaKHVY=;
        b=p1kRQxm6QdKsjPM1sH7KkabdBQEDwwnfjpYUkriFJ9HjgFrDMHTKxFzBZ1JMyiOXkZ
         RQ8NEqxym6Mp1A0LUQE8JXc1kKPJR3tqcTPVJnh/JjDlIY1FWe1KBaNmgtVpzOMTIsb+
         LiiPJY5ai6h98qgkBgzoeyuHcRgnoNmqdqrhu/XBwwO2v90YBW2HRcQrq4ejsN4jd98u
         g3RA0nMBp0I32CEaC8Zj3CwSDbuWbo1FBXpA852Jnmcpw1xklM8FWLdJggpOlSeK68a/
         0/KG/iL4f+9pqBdO6QdeT7fGlgbC/2N9dgse8wwAWfUcU2tivXYHwGNXUnnhPsSyGpD0
         Nc3w==
X-Forwarded-Encrypted: i=1; AJvYcCUtoFffAnJyHaiYldeEPe4QVwe7jqjbKcGOBhJa7ZSaN3CENr7ccyz8BmHS0yVQ3QaRuy6jipDdDaR7F6k=@vger.kernel.org
X-Gm-Message-State: AOJu0YyD0E/ldJOSwB3RMVnHnu3h2t+VDTEaCHCU7vDqKkqjvadXAwH+
	MtpNr7hz0Zyt0IDjWJdjZjWyMrycKDy3bnakGg+5QHrhcZF6Hz6uOMgoZvmWE71T1D+p5+GIV0/
	0mJjPYLIgguRP3od2z6Ljojnwt29f1+hM47E190tk0rAPFvxmzzF2/LLpkB1TLxlOf/U=
X-Gm-Gg: ASbGncuUDzy+/QHeQWkhoXGgDTVDffI/SIqk6+sfM9HZJ6ge05uriwHq+pi8cZ4A3Wa
	N8jfXpHay3uWpWun/DaVrFB4d/Oz1WiarSCVo4RBXsdpXNL4y0VMhPdipDeX86Nj6c3Z1LhxyAo
	YC07wX6cUqBf77nAZj7zWZSbZqkkAulnpAganr/FE679OZEzgJGooHLcm89mb9ufe9cTjg8fbR1
	dhq1rKeFyApQNn3w8B9MBo4g1W7iT1Tzbto9405ohutBd7nKXaVl43tCnfyMspL/0d/PpWVV39R
	z1eHCn1IaDOY9tGYoZq1rD6S3BfU90onzgIH539XJKFzC2zgO5iT+MzEmForm2EH4pDbThVSQu+
	+do4=
X-Received: by 2002:a05:620a:26aa:b0:7c0:b43c:b36c with SMTP id af79cd13be357-7d3f98e252fmr557149985a.6.1750672875175;
        Mon, 23 Jun 2025 03:01:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFd0DfyOKsfHiqaekfIPWUjRqgIfAWTnyptuHPnWpwgrdGU6UXcEE9cVKR04xkNRWtBD8aFqQ==
X-Received: by 2002:a05:620a:26aa:b0:7c0:b43c:b36c with SMTP id af79cd13be357-7d3f98e252fmr557147385a.6.1750672874595;
        Mon, 23 Jun 2025 03:01:14 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60a18cbd8easm5770386a12.67.2025.06.23.03.01.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 03:01:13 -0700 (PDT)
Message-ID: <cf1c9d32-9034-4d22-8be6-2abacb3ece56@oss.qualcomm.com>
Date: Mon, 23 Jun 2025 12:01:10 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sc8180x: Add video clock controller
 node
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250623-sc8180x-videocc-dt-v1-1-9d210c140600@quicinc.com>
 <7c55acd5-6d30-42a3-aec6-2d7aa2a640b0@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <7c55acd5-6d30-42a3-aec6-2d7aa2a640b0@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: vLHdjNRqJtSHJycYNhohO1_0-1x-z2cu
X-Proofpoint-ORIG-GUID: vLHdjNRqJtSHJycYNhohO1_0-1x-z2cu
X-Authority-Analysis: v=2.4 cv=eco9f6EH c=1 sm=1 tr=0 ts=685925ec cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=t5UmTshxakG7yEKo4UwA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA1OSBTYWx0ZWRfXyXPbLOYRXxnS
 ZiR7QVaouZAISqR9iZG8mM401d0vpJ2Xw8HtOmJbGL2b/PDWh0jU7rmHRE4PqRf9XmE1HiBG/nB
 IWH5WJkkCLJsrcJeJ0y0Tru+ME9r759990hvEWvumwd20JwTzgAp9WV7DJDzBGMVoDDG5Csw16N
 vDRuKYXNhn1AD6+RjaB/HUEhfrwIb/ZfO5KHdiFFpiYKnx/yJQFkxowR28B8wALs3dhojTkWayZ
 WiRb7EWvM4azPugacLmN5vZaNwHyhrIGw4eArTZoDnMFIarnvHdmsFLAtW/VI78ts6CItFdrfvA
 XHdXUUBYkevASDfjj+JYv8G65U3hl1dA2cfP8NERRhT+HneImMABDzSNTLnl+D+OllSsG4DJ0Nm
 uxmyHFGI1l2tVpzmY4i7YHUBnJcvwvVsKJ3wLtxsz2EvIL3KdxLpzoC8bttD1b8GFY4tKr0x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_03,2025-06-23_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0 adultscore=0 clxscore=1015 mlxlogscore=936
 priorityscore=1501 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506230059

On 6/23/25 10:44 AM, Krzysztof Kozlowski wrote:
> On 23/06/2025 10:14, Satya Priya Kakitapalli wrote:
>> Add device node for video clock controller on Qualcomm
>> SC8180X platform.
>>
>> Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
>> ---
>> Add device node for video clock controller on Qualcomm
>> SC8180X platform.
>> ---
>>  arch/arm64/boot/dts/qcom/sc8180x.dtsi | 14 ++++++++++++++
>>  1 file changed, 14 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
>> index b74ce3175d209b569e634073662307964158b340..4590c2ff68a9885d8047d728bbf2dea0236d5b8f 100644
>> --- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
>> @@ -10,6 +10,7 @@
>>  #include <dt-bindings/clock/qcom,gpucc-sm8150.h>
>>  #include <dt-bindings/clock/qcom,rpmh.h>
>>  #include <dt-bindings/clock/qcom,sc8180x-camcc.h>
>> +#include <dt-bindings/clock/qcom,videocc-sm8150.h>
>>  #include <dt-bindings/interconnect/qcom,icc.h>
>>  #include <dt-bindings/interconnect/qcom,osm-l3.h>
>>  #include <dt-bindings/interconnect/qcom,sc8180x.h>
>> @@ -2943,6 +2944,19 @@ usb_sec_dwc3_ss: endpoint {
>>  			};
>>  		};
>>  
>> +		videocc: clock-controller@ab00000 {
> Why are you adding the same multiple times? This was added A YEAR AGO,
> so you clearly send us some complete outdated ancient tree!

It seems like you're confusing something, there is no videocc node in
sc8180x.dtsi

Konrad
