Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7650D195B1A
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 11:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750505659; cv=none; b=Ie4Ookp1vOSrDrWXEHV0ejm2x8pjI0S+SlR71sPrUGfK8/uL3OgPMeY7WllKCFsRpAh0dn+VLU2TGrahvEYNed4am+Cawc3JCvziFukbZtIUl223jEVrZ0Af8t2mRYVz3age2LvtLWuneuMMU/rdmGtlrMCDe68rAaWe2JQEg/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750505659; c=relaxed/simple;
	bh=frY2TTFiRDTZ1/fLpg8ekWWh85lRQvZjOPHO9EIHCjU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rl7tqG5nT/zGm4HZ4NVma1LZy1tEwKUmAiKsTNtyutxaGmWXiLWkSmDiD5yauuu0YbW8P1hDAihryjQaeHx+guoAQF8P1HF0dAcOJ2dcfHzg1Skd/hKe6Y77ZPgiqqV0XKMAGIQKgiRrIr3uangK8PVMLptH1prDI5/4W6crpKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tw9K+ION; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tw9K+ION"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55LAxL15000617
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 11:34:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1jupXXJP0CLCOPTG5xvcuf2tq7rGiRDdL12CALHVIl0=; b=Tw9K+IONfj+jyivO
	lrqH/ZWbDmOpa4fmlp+Aac+QAwsgVGnFuYXa69rzNmQ2FSwYIdd9Rxlif4oMlcBV
	GETSrkoSxNbO89n+GSa+Og0F1+0MDu0Zotn1oeoAe8BIFHipZGLTK5OiEVCC9FnO
	RG9YgIwBUXnQ1eThve0ShBBE58sAAonyFOgS0flMnNHS5nNnwRVxNBf26lU2ik4H
	7LJdz1ONPvFjeb9mn2seN/FLHbz35DRRfDjV6NbIlC89A9gzFMa+EXqwS1UVUbbc
	jjp2lCtW3OlZAdbj5RyVSWc13q7aQDXwrkZzagYmo8La/X0tBTcjyyHNeBI4qcm+
	3Fo3yg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47drq8g7ys-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 11:34:16 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d21080c26fso70076585a.1
        for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 04:34:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750505655; x=1751110455;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1jupXXJP0CLCOPTG5xvcuf2tq7rGiRDdL12CALHVIl0=;
        b=SQ5mOXzOvbxkxawp8sPpfcqxZjj+3GP2Wm4tdAU5a6mdtDtZIeTVO0UrmC4RtoadIa
         jqcJjnwnv+Cmonk3vB9vh2fuHEGSj3VpnMQDZcIyNuRykywt9oEaJidCvOuY1LSsJtIP
         F0SsUAitewuEc3+LmOnwRQniKti6PpEO/uPtUxYAl6TA7EpxHGg9/lsn9j2Qj24HE98d
         PNgnIs8phIZUUGCYer0SDUZSLrtf5PPUGEefuWdOIgiuRYcbdJ220wlLu5trRkbyf1m8
         epC2c7k7acR1GUbyu7LbpzpqFuduQV6rKHEr52h7Yw5U/ynyKFA2n3hTL6hIBHOZbzh5
         BDbQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGMUCAw3SpWIVgqBAwmL73SLPDeRiGs7hLgFCRIS8IZV10GdSIP20qow+XnJsZjCFFT7YJSiBIxfWrN8o=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDFgHn9MYIs9oSvlz5jvX+W+7DwXpGC82YIbQhS+0wyXkvKQkx
	jpW3NvMuI7YC73Mjbi/nMUlO9FEl5Yiig6OVm/QRUwDdgjQ6dbnxZXl1KSqUrgLDFCOuHmhHD+e
	o/EIEd534lgzh4ogVIbZow46lnddy++Ko9G4ZcU8luPF9fYwzCYYZOpybWqLbqI07iio=
X-Gm-Gg: ASbGncuRPP7hMvQqppbeo1UmZQ4AbD1HUVU2AI3K1R83mbz33Q/CkVR50WibsLVQ36g
	3Z2qofN3vv9rlgJTJaBflv+42qJMmtA6Dq4oy9gpqqSXR6zeXq1PdeJT8gbQt/NnJYNemgo3wgF
	mEFXEBvE8F4vNcbDrVbTdLxASgNp7DAADhiSYL6mgoK+bCid3yRr22q7uoewgdBEwudbY8cwUgP
	L9bPTtUoGVPlxT9eGXGp8o2AtD4kUNszx1bmYUrQ6TJaw2ln7lhnB06iYXRRjBhHHT9S6DU7rxp
	qlQ0pcaFbvfdhf2/QJT9uKDwKWI/7+/kAjWAAUBhuGHf5l1p2ER2KLkb4ZIFc76QKJZBn09xgFA
	luCo=
X-Received: by 2002:a05:620a:24d5:b0:7d3:e9b7:7121 with SMTP id af79cd13be357-7d3f9936b58mr324763285a.12.1750505655439;
        Sat, 21 Jun 2025 04:34:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF4OouuaJ6w4x/c8MGc2W1x/PoYi/AddPaueSZ+TZYl9OF4B2EEGCnNe20HdRLDIQTJWXjtWA==
X-Received: by 2002:a05:620a:24d5:b0:7d3:e9b7:7121 with SMTP id af79cd13be357-7d3f9936b58mr324761385a.12.1750505655031;
        Sat, 21 Jun 2025 04:34:15 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae05408301fsm354807666b.96.2025.06.21.04.34.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Jun 2025 04:34:14 -0700 (PDT)
Message-ID: <9830cf03-911e-478a-adfd-2302bd3512d5@oss.qualcomm.com>
Date: Sat, 21 Jun 2025 13:34:11 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: msm8953: Add device tree for
 Billion Capture+
To: Luca Weiss <luca@lucaweiss.eu>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        cristian_ci <cristian_ci@protonmail.com>,
        "robh@kernel.org"
 <robh@kernel.org>,
        "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "andersson@kernel.org" <andersson@kernel.org>,
        "konradybcio@kernel.org" <konradybcio@kernel.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "~postmarketos/upstreaming@lists.sr.ht"
 <~postmarketos/upstreaming@lists.sr.ht>,
        "phone-devel@vger.kernel.org" <phone-devel@vger.kernel.org>
References: <20250620-rimob-initial-devicetree-v1-0-8e667ea21f82@protonmail.com>
 <20250620-rimob-initial-devicetree-v1-3-8e667ea21f82@protonmail.com>
 <d4564d4b-9510-47f8-9930-65d3c4e90e6c@lucaweiss.eu>
 <bWiyUA5cF4NjzEaUwhpDvfeqs0hEizZKFKxQpsfj6htES5mPGO2Yf2AHZQcUEyR4x7Zx9kVvwenpc2djbCN148IbjtgLh7Gq_1HXicp8kms=@protonmail.com>
 <ff29229c-5458-4500-9b11-8044a461cd36@lucaweiss.eu>
 <f83cc435-7736-4003-b5b2-a84e2fe725c6@oss.qualcomm.com>
 <0DC5CC32-231A-4802-9A69-7BCBB21066E1@lucaweiss.eu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <0DC5CC32-231A-4802-9A69-7BCBB21066E1@lucaweiss.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: byWhzP1SA1l54Wu8VNKyAdUGLPS7W3Bt
X-Proofpoint-GUID: byWhzP1SA1l54Wu8VNKyAdUGLPS7W3Bt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIxMDA2OCBTYWx0ZWRfXzruueNYtsOVv
 p94MRlZfpnVudBaTxQmCO8mG4Ld7MoVdTfq39gywLy0nKB49fUCZFgZs+lKIr2Vg9OG4f7eZYKx
 9/7RNfxJ7dnKZ77GS6uqp/bXId6CZu0iN5v4KO/ZH8/wnlaI6N48Txnpzd0A1ygX8c4N1KEdCQI
 d/Ttt+Q2wGGTnDct4BiVYb1cUaU5hHDSNghNGrz5glzGGraO7kILyItQDJitlRcOKVtmp5phU3a
 oRdQbxxKufHkGcPa4ZgEadgKukp+JITSCSHS+i9q2HGD+0c5/R5sbuBL/Bw8H2lGOStT2SPOaEb
 GVWRtquB6xeCj641zm3sq7PIC0chdTJi1sjremFrqGfV4Pfruo/DRPDpIPKsiBCmUxHdkA8rVPp
 l2TmFXncVaEOJ64/mtTtNWFLmDHPQjiNJQ5IVKp4N3WTMdRYO0pIA0x6vTQlYZoohXaK3TSl
X-Authority-Analysis: v=2.4 cv=Kr5N2XWN c=1 sm=1 tr=0 ts=685698b8 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=dlmhaOwlAAAA:8
 a=Buv9VJQQgbVt63ATjJcA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=y4cfut4LVr_MrANMpYTh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-21_03,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 mlxlogscore=846 clxscore=1015 malwarescore=0
 impostorscore=0 lowpriorityscore=0 mlxscore=0 priorityscore=1501 adultscore=0
 spamscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506210068

On 6/21/25 12:53 PM, Luca Weiss wrote:
> 
> 
> Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> schreef op 21 juni 2025 12:11:00 CEST:
>> On 6/21/25 11:27 AM, Luca Weiss wrote:
>>> On 21-06-2025 9:07 a.m., cristian_ci wrote:
>>>> On Saturday, June 21st, 2025 at 00:20, Luca Weiss <luca@lucaweiss.eu> wrote:

[...]

>>> which means that you should only have one value for address, and one for size, so "reg = <0x84a00000 0x1900000>;". This is different to most other Qualcomm arm64 SoCs.
>>
>> reserved-memory {
>>                #address-cells = <2>;
>>                #size-cells = <2>;
>>                ranges;
> 
> Huh, why this mix'n'match in this SoC... Fun

I *think* some of these older SoCs should be able to address more than
32 bits of memory, so it makes sense in that way

Konrad
