Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E102266562
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 12:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751026076; cv=none; b=NLpkN9Ol8CouYzI6QnRkYKfno9Hy0gDTXPbYt6k/Ww62orQpS6xZbdH5QMXYJnjwicZ/J7hOL9g+jNve0ZJWTT5XYQi6kF7272TrGhpPJaj0UKOK4Om2zgm0+jXtBzUw3eLZENFwXDSukh3qdasgtihd92jUfG3F0BVbKvkp7jQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751026076; c=relaxed/simple;
	bh=/n2G8Yx3oIqTFv20NCOsVU0asgOTN34z0VyAQXVjk9g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=adVjiuLS4XjpPW7URESiGr/sHrSXJvkmuWK4JJJ95EsqnyI5QdBSVWLQTfkzpYkS454z94c40fL6P6EITOwj8houOiGw0BNM7c1Vwb3ONdTiTo4gYAf9GfRPERdWvemu+Bid0pIYDFu0n3NlLaA2xW8KZNH07w0Ru7l46AV7m9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B5YmCzrY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B5YmCzrY"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55R4DC1i007795
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 12:07:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h2yWQ9J19kL/m2rbPpNvQn+2HXbMCNu1FXmidWthmd4=; b=B5YmCzrYNHAax83l
	om0Qnlc0arp5anrD3FvCm+j0fJsB40sVFi3eGUlD3/Z4aUvPRZ+3N8Njno2FONBh
	Ovl7nHV/RS4BMR1cHmeDHe39Y1pJGidiXVKEbJN8V1f/SZxkBFGyqSCE02nr8NnP
	ScUVFWGitOueSz6vpWzr3l7kqlWZNO194IjAITRWE1M2yn68JdWNKpAdiWm/Q25q
	6uzjj7F0fJKkbC1F055Swk2xxTlpmFRpUSIzugl3Af1BByazQJlk00/DqZgxC55b
	AtbRYSEINu6McMNCm7oCQX0k5dQFp8vVeGMm5HnukhEvQLHADR8RpJTvJ6ee+bnh
	p4Pzbg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbhqw4mj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 12:07:53 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d3ea727700so27283785a.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 05:07:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751026072; x=1751630872;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h2yWQ9J19kL/m2rbPpNvQn+2HXbMCNu1FXmidWthmd4=;
        b=oOaOAePZP6gC7Kj+kkPRBbeeOIlg0LV+huBAvh/Ds8vju/nl55kYzUv0MOgmxEfGvX
         fV3Zly9zj+WQEYmhbzk5T9pvRdCgaheurN0PsHQZS82br2Z2sOv1sDD/wr7g6fDQbWDB
         5TJNAIw9WK1oHJEyFAQYJjbN+xz584wQluFZGKzX+V1ILhmKeBYcy5tEbRlTQo8xxssE
         kjdbvyvjL0hxI4B6MFVBwr4wXgxA/7QJWGy60zeG2vjSV0pFcO6d5NnvY7LU51LJMGCQ
         OqMr59wqp392Ar+NaGD4e158pbCMAYw5SAgj5wwVsrGVvG0n6xwShgEiLn0XOmQFefVe
         kbRA==
X-Forwarded-Encrypted: i=1; AJvYcCVsgPst463bY982LGYxzwo8AjHktXztNOeBvjyOEK/0JP2Vsa18IMQXBFs/VHE2jG8vxVgqlkAYIWt2WZc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNrZkOWRmPrTH2bbvGjnAybSasc7d9ULLBWx2inIaz+NY+2dsp
	60D7B6eN0uYrYmQo2NC/6Lte4s7c7+3hDHKE4LIjSpsUrPnIegwub48XwFibMG51RSTJrROwx4Z
	y3XA0dogj46VU1E0+hqMKKI11/g+4f9ks65Os2ZJO/Ha4Ur1pOW/o3d8CZKjpfHsN1rM09Bh8tk
	Y=
X-Gm-Gg: ASbGncuyqjYhJvDK1BJtIbNLKrzsKOXuoBXGL56Zwl3YMVLYRq6muzfbDDrhCJgskvR
	OyVc9FK9DvacwpT8hzXLdo9E7E6Y4rG9vSk+tFl1UQA6sTzo3e46Sk19Eh0NrqZ64Rz6zmrQ+tc
	zQxW/jzB0gZLjycAyqjpfzmat6z01Mw4hJc1YEMLVzz4KcWbcRrJeMlKLtWG4m2LWmc0c+I3C8s
	3BjwEZTrLCI2sCWB1Xt4r7ler/VXuCFy85+Cp6IiKselSnhxLSjrc2MpPNGCB3t8ZpDfGXIV6LP
	6JEc71XHTWIcuF4cnsp+P5luwuQle6vjh+LfbF0kgwxbVq6bO/ZlZax8yIqD/4AmcDa3COvlV7S
	kkXY=
X-Received: by 2002:a05:620a:171e:b0:7c3:c814:591d with SMTP id af79cd13be357-7d44390dcb6mr170407485a.1.1751026072251;
        Fri, 27 Jun 2025 05:07:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEMLbX89yS7binC4ZEteCTwbRLHqglPFzMinVrITkQaw35tFAgbD6c9NqROZJoQZf/mf/bbSA==
X-Received: by 2002:a05:620a:171e:b0:7c3:c814:591d with SMTP id af79cd13be357-7d44390dcb6mr170404785a.1.1751026071627;
        Fri, 27 Jun 2025 05:07:51 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353c6bea1sm114084166b.146.2025.06.27.05.07.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 05:07:50 -0700 (PDT)
Message-ID: <263139f2-f149-4615-82ff-584fe44ead2f@oss.qualcomm.com>
Date: Fri, 27 Jun 2025 14:07:47 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: qcs615: Add CPU scaling clock
 node
To: Taniya Das <quic_tdas@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250625-qcs615-mm-cpu-dt-v4-v4-0-9ca880c53560@quicinc.com>
 <20250625-qcs615-mm-cpu-dt-v4-v4-2-9ca880c53560@quicinc.com>
 <xkvn3r7yphlccurdqzncz5qegs7xc254xc2ou2dzuilatk5f5j@eq5ynce4aepg>
 <2b29ae78-e4a0-4d25-a694-abb10883086d@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <2b29ae78-e4a0-4d25-a694-abb10883086d@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: _6MltV92A4kpBlVeOi1sTyA2q3txQfer
X-Authority-Analysis: v=2.4 cv=Id+HWXqa c=1 sm=1 tr=0 ts=685e8999 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=Od_Csnso_M7n8_Iv6A0A:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: _6MltV92A4kpBlVeOi1sTyA2q3txQfer
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEwMCBTYWx0ZWRfX5fiGb5nwZu7u
 d72gmdBxv2gxzNfa/yGQBF/CRLbIwH8zR32wniY2Ha8tnIeexV/YF/t9HvzHLNs4Qh6omlb01gz
 Ig63ak4grqqp/1vagSzJf0CT5kPYssMQxbB5K1SOoRKM+3bqEUelVi1DNzkD6qiJAV9oxIKwgLw
 dknT0x7r6hdkJmWLI4K/BMongbKdA9wf5mO3K1NMQ5QeQXz8dtkHknJ4gKZxrEsaDWDPscUPLnB
 FUiCHtEM63SCclbG0mr8UhSAovnxqTXRlOziNtOaCtUdrXQSdVSSVmodPPOvEMGxpYYL7wj98Cw
 BfU9tEVf6pzJ2kQIzkzTMUOkOw/8xyWiy/Cn9NG1Au4rqj+mHrfCa2FabNyW3xmeBD3bZUDihp1
 OFmyUZeBrDL5ekwt9U32OOGgVHMfph0zYf02bVtkDd5kPodp0VQLJt1m1o6RkUPWcHKERWeY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_04,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 mlxlogscore=912 phishscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506270100

On 6/27/25 5:52 AM, Taniya Das wrote:
> 
> 
> On 6/25/2025 5:06 PM, Dmitry Baryshkov wrote:
>> On Wed, Jun 25, 2025 at 04:44:01PM +0530, Taniya Das wrote:
>>> Add cpufreq-hw node to support CPU frequency scaling.
>>>
>>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>>> ---
>>>  arch/arm64/boot/dts/qcom/qcs615.dtsi | 29 +++++++++++++++++++++++++++++
>>>  1 file changed, 29 insertions(+)
>>>
>>> @@ -3891,6 +3907,19 @@ glink_edge: glink-edge {
>>>  				qcom,remote-pid = <2>;
>>>  			};
>>>  		};
>>> +
>>> +		cpufreq_hw: cpufreq@18323000 {
>>> +			compatible = "qcom,sc7180-cpufreq-hw", "qcom,cpufreq-hw";
>>
>> Why? Other platforms use a true SoC as the first entry.
>>
> Dmitry, from cpufreq-hw perspective SC7180 is a exact match for QCS615
> and that was the reason to use the same.

The only compatible consumed by the driver is the last one in this case,
meaning sc7180 is only there so that if we discover quirks very specific
to sc7180 down the line, we can add some exceptions in code

Reusing sc7180 would remove the ability to address any quirks that would
concern qcs615 specifically, which can happen due to hw design, fw
quirks etc.

Konrad
