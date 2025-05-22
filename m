Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 861C4288C87
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 14:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747923871; cv=none; b=mRQUTBeFVvG9kEQDli+OSMCSta7Amoym5fOOyinvqIe/C1k8FpOuLV/UhbQ9+ZdXRZ2YikfpINy35vxDyfbVexy+fEbof6zgG6OSGH+X9rQh2pMS6vBOCiuBDWedz/6iXL1MXeDK0+rm95sQ7AdVZwog4L8s1DWk2AgZd9MfQ50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747923871; c=relaxed/simple;
	bh=VXj41DTxk2nVxmBLHxxvZ8NS1geBQOG8UQQmKvy2P/g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lJBHlYcstXT/U3eT5rGEpMR8RMPb8GpzeahVJCtRURj1UIKjT+N47OnC2v3i6nX0OxVa+JTnJ5CyASebs/f5oy1s4EtWh4UB3zuhqesu8WPcRrFz58Mh+UAwr/raZc8Pr0SY/6FsYY+1nwYkOSU/BAULnaeniagpiWjtH1jiDSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wm9SjnmP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wm9SjnmP"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54M7vD83029048
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 14:24:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Kn3C81CMXKXbBKQs7ygohrAuPf0DoUyEhaA1DlF3qOo=; b=Wm9SjnmP3hn7PMvE
	Dn5UXC65rGjXq3zKWimLmwyCuA6Lq1F0585Lob51I00/+hdupRAR4TEZLM1+pj+S
	W0YzrkQPePiGYSK5NFcS7NQ5wOArseekhIB0u/t06BWPAE9Vq1C29rtfYsW1CcOJ
	kyiP3FanAnbYgV0xHZPh+t99IuKYyOfMckbq+aNQdjoDVr/+CAfgGPBTlBcM7SFp
	Nbp4Az1+x3RgyAh8s6wQ3lTAKoPv8qIFOjmRnj91RxtVfah0dP3wc11v5HD+SMyf
	qbjSlS/ixvGm0IQR+CoQQ23vPYJHAyF+Yq53FnCwSp+7B0h/lS0QbFdeBm/lbPAk
	M2zCeg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf46pyv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 14:24:28 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c54788bdf7so71331385a.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 07:24:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747923867; x=1748528667;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kn3C81CMXKXbBKQs7ygohrAuPf0DoUyEhaA1DlF3qOo=;
        b=mybFRbkZkHbRSH3lKLQt6e53Fk2inWjRXgqMWRcggvCQsFngT01pHb0QCvl5CrSWzg
         UG1cGGFX2aqNCU3TvErIOc5q6H2CJTKdY3un/zNfxC0bSVRe1/YTtuZlXqabDE+YfEK3
         54ZzG5cJCxxaGXYWCr0P0MO0Fnml8CSKlPv2/NlVFctpAVWJK8KoQpJQtsvdqlmkbt8B
         4xdi3RBBGi+323qqMK4H0SeFcTW81f0bk5LuDr7W3ZMXOsZQwq2yiZeEkRyELCi4tBcr
         SAnKhsITQCISSBFR3vnxIXcFD6GohBhhwXKvJ5C6kqWysr03qAlPefjhdsnDv7qw2C16
         CRMQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpO1vmiq1p66GqboueAR+hVM2q01xDbl4KqDD3HMce9g0oLPW60qWUZbaluej/vz6MRvGSBNnjb0cwkj8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxE0UHyNwBa8OsAIuVb/jlq1i6QUnBFgRVHosnUBeUgxMhsMU25
	IUOI/r9GUJyVls1UO+RzDyFuQcropZpfNz1VECKyIwXK7UR+jYuwwnLlFDCjeAbf9RvpmD/HGtd
	HPhjxB9lqYVh7CbIq+A9H6xaS4tiDslhsnDNTmByzwBCNyPoa8aj7d8lYGJBLh6/uRNU=
X-Gm-Gg: ASbGnctN6TZzjWYlytRPaBXKOalNOcwagKKhlq6qikLCcnZbLKcEwe7h05qRfl9xL0y
	k1uIMqrDy7bBkk6T69Vc0Y2rUe48x0qSuctkZn0ubcZgz7JMHQLm7PLdOPOgZeKJOpn5FojnbAU
	NHnrOmxdkaKCBdnZ0g2zWuHUnXhREYxBDE7+x2gDTr6yBz0nJZGFHO65jk/Mi/X3MAl5sriHw7w
	pY/ZABYap21XTllusH+brSR48SoAixV2hgIdHEEnFwmZZ/e0F9HPpQ7NV9nEqEXTk25xE6YRAi3
	Gfu8lbTMQI0kiQZ3//RvX8uGrswV++sqqC4pEGqaY9Li7C1LxuHWdqtfsjQ8Q/8epQ==
X-Received: by 2002:a05:620a:2605:b0:7c7:5384:fa53 with SMTP id af79cd13be357-7cd4671f6e4mr1567815085a.6.1747923866961;
        Thu, 22 May 2025 07:24:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFn3Be9JZztiH6LZx2/DqvBpQZs5qyZUJI7lo8uvnzpNrUGACIobPlQCI9fOwzq9+sWXwBh0g==
X-Received: by 2002:a05:620a:2605:b0:7c7:5384:fa53 with SMTP id af79cd13be357-7cd4671f6e4mr1567812785a.6.1747923866522;
        Thu, 22 May 2025 07:24:26 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d44200bsm1081105066b.116.2025.05.22.07.24.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 07:24:26 -0700 (PDT)
Message-ID: <3684b6c5-91c1-44b9-aab5-b768db9fd08a@oss.qualcomm.com>
Date: Thu, 22 May 2025 16:24:24 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] soc: qcom: qcom_stats: Add support to read DDR
 statistic
To: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Doug Anderson <dianders@chromium.org>
References: <20250521-ddr_stats_-v2-0-2c54ea4fc071@oss.qualcomm.com>
 <20250521-ddr_stats_-v2-1-2c54ea4fc071@oss.qualcomm.com>
 <c4442c3b-4f05-4031-8b1c-243e3028fc78@oss.qualcomm.com>
 <d70da81f-29a6-487c-9781-c2fda6327a75@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <d70da81f-29a6-487c-9781-c2fda6327a75@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE0NyBTYWx0ZWRfXweF50NU1klQh
 tvmor7raa88+1RU92ez8U0PiZ+MkkWp7FpR6hhRkw2fPp5ajKNlwXrOzxzcuBIrDAAR9SLfeEkU
 r7Lq9oeQ6iTwn2S4DMwEe+eRMJ9d4UlWR2CvIyRf8tbsnlJp5UbrzKbBvNl5Xep9ukeRQxIQuYm
 9we6avUenlM/qCTbJma6Hd+IKPVJ3u9huqSAYV1iPm2DfR3Xv7XuK3u6iROVIza9V7Xp3sdS4vb
 S/TNE37SqE0O7q5DFEiI/MD+1gORpq/olbDrJglWrAZdKJFbYmHV/GDKelkqxLgDNMlk4bEB11T
 jqM2RgYxyxkZR5UR8235oshQuhaU45c4JGd/JmqfZmCXaRdZhQiabzNYvRQxQB8C1Yy88jv0Ypl
 SAxpuvuf0qsb1ddQRPhAOVPSsPbiuIkMIglQLgb6tDno61Q6d0vzc173fyyIna7OPPPy36Mn
X-Proofpoint-GUID: wFpGaPHn6BErWfxA59oUsVNPnOWKCZEg
X-Authority-Analysis: v=2.4 cv=Ws8rMcfv c=1 sm=1 tr=0 ts=682f339c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=HmYs3LRdz1ZYokrEnt8A:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: wFpGaPHn6BErWfxA59oUsVNPnOWKCZEg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_07,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0 mlxscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 mlxlogscore=865 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505220147

On 5/22/25 7:48 AM, Maulik Shah (mkshah) wrote:
> 
> 
> On 5/21/2025 10:31 PM, Konrad Dybcio wrote:
>> On 5/21/25 10:32 AM, Maulik Shah wrote:
>>> DDR statistic provide different DDR LPM and DDR frequency statistic.
>>> Add support to read from MSGRAM and display via debugfs.
>>>
>>> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
>>> ---
>>
>> [...]
>>
>>> +	case 0:
>>> +		seq_printf(s, "DDR LPM Stat Name:0x%x\tcount:%u\tDuration (ticks):%llu\n",
>>> +			   DDR_STATS_LPM_NAME(data->name), data->count, data->duration);
>>> +		break;
>>> +	case 1:
>>> +		if (!data->count || !DDR_STATS_FREQ(data->name))
>>> +			return;
>>> +
>>> +		cp_idx = DDR_STATS_CP_IDX(data->name);
>>> +		seq_printf(s, "DDR Freq %uMhz:\tCP IDX:%u\tcount:%u\tDuration (ticks):%llu\n",
>>> +			   DDR_STATS_FREQ(data->name), cp_idx, data->count, data->duration);
>>
>> clang complains about both prints:
>>
>> drivers/soc/qcom/qcom_stats.c:173:7: warning: format specifies type 'unsigned int' but the argument has type 'unsigned long' [-Wformat]
>>   172 |                 seq_printf(s, "DDR LPM Stat Name:0x%x\tcount:%u\tDuration (ticks):%llu\n",
>>       |                                                    ~~
>>       |                                                    %lx
>>   173 |                            DDR_STATS_LPM_NAME(data->name), data->count, data->duration);
>>       |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>
>> drivers/soc/qcom/qcom_stats.c:181:7: warning: format specifies type 'unsigned int' but the argument has type 'unsigned long' [-Wformat]
>>   180 |                 seq_printf(s, "DDR Freq %uMhz:\tCP IDX:%u\tcount:%u\tDuration (ticks):%llu\n",
>>       |                                         ~~
>>       |                                         %lu
>>   181 |                            DDR_STATS_FREQ(data->name), cp_idx, data->count, data->duration);
>>       |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~
>>
>>
>>
> 
> I will update correct format specifiers in v3.
> 
>>
>>> +
>>> +	key = readl_relaxed(reg + config->ddr_stats_offset + DDR_STATS_MAGIC_KEY_ADDR);
>>> +	if (key == DDR_STATS_MAGIC_KEY)
>>> +		debugfs_create_file("ddr_stats", 0400, root,
>>> +				    (__force void *)reg + config->ddr_stats_offset,
>>> +				    &qcom_ddr_stats_fops);
>>
>> else
>> 	pr_err("Found invalid DDR stats magic\n");
>>
>> (because through the compatible, we much expect it to be present)
> 
> The qcom,rpmh-stats compatible does not guarantee the DDR stats presence. DDR stats is only present if
> magic value matches. The ddr stats was incrementally added over time so older SoCs like SM8150, QCS615
> will not have the ddr stats and would end up printing this error during boot up but yes all almost all
> rpmh targets do have the DDR stats present. If we are ok to print this error for older SoCs i can add it
> or how about using pr_warn instead of pr_err?

OK, Let's not print anything then

Konrad
