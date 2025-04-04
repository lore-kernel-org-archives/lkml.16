Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8829619CC05
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 23:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743807773; cv=none; b=BB1TvHwaXh7eBn/rEfBj7yz7Smxm5B48QDKYPQ5AeIw/Q3FTJPKDcgwCIwQ3uwjlYMOWYmPSnO1Z5yfr2l2cnZ2sr8QsFITJv08fOIOdpboWPljymTRSuRJD4QRshl+c0da6ghzFLL9znOeT/aPdpxpwzKEuYSxFv1DFJQpD7OA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743807773; c=relaxed/simple;
	bh=/dlzUhzNunhYTNbApKqVE/hjFYpfPkh5ExgCEoMWEzQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ujnnLDHK4fE1pcCLXTWWIMwrKyd9JiND47Ln1vc1UkEuqt8N+9y5CGAvm6MMYwekBJERYyDWJWEEf3qTVXW7RnVLXstAbfjO4eFl/ilsHpepxVqYedtAXsWvkBaycNv86IwOuTEoYC0fBzl16bS3saPCWliQV8PSE+2GpP5pq9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gIaWJqp0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gIaWJqp0"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 534JEaX4000559
	for <linux-kernel@vger.kernel.org>; Fri, 4 Apr 2025 23:02:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LRA9/KTy8C2+7jeNa+M/5I1PVMUdhFQewhL8s+SLN4U=; b=gIaWJqp0+ubKz00p
	aNh+FjNpK6qhmfW0Do0djfTk17b2h9FJpvj/sN6wayZcBAW3taPyPJUC23+u89Wg
	0je86u2HdiYNBTY3Vj7CrihcB/K6sIZpBLENrmeKjAMQ/sZvQXilZfwhMjQatGNX
	yW5zl8QmGAMoj3tAohfivL6dMN3lCBno957RvhNSHJrqsPqmb5z+A7N/4SJ+OyD6
	kfrnKwtAJQ4CwNQZuJj147yVdbaDXZrxwVPa3/OphKm+rGsCMH36IaRecAVZUJY8
	O1TCwqiwv20tqFGUhKdOiybn0IYae7Kzoeiujl85uxUdMBksgghI431GOcF7ehqg
	qHEZsw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45t2d8b2nd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 23:02:51 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5af539464so64433485a.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 16:02:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743807770; x=1744412570;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LRA9/KTy8C2+7jeNa+M/5I1PVMUdhFQewhL8s+SLN4U=;
        b=wrg3tXd2RMAgD+0vjk73KFxnxxeXxUQZ5zMjngwsZixzp17t4GyQjMS0IwlzNVHau7
         WYHEl9HGEKfqPuEKGa4FVzcCynyHbvTfE9KOLmM5XHXQc5LLcYzYv8RYK60MxMst7und
         rwIG/v+4mAcKDrUm82lxzJqTfXKdOkXfPeoJ2V+tz8T49VPKpnV7iYsL6ryzgoVXo4Hk
         mYfSjqhA+hCyFF2s9Utr0ZFEMvlZfE8+3iPbAKttsRawVebG1sx7b9mbRiJXm1WnOnSF
         FF2eGqUxujtCTNKQuO+J+oe4gKIGNQSoNWMffisgfdBv0X/oIepknDPGF7A0LW0XFtVt
         KmuA==
X-Forwarded-Encrypted: i=1; AJvYcCWucdcU2hpxZNQGGz0DX6Re4yrt/v3+mvDhxNCwrMXHjgjqnGyr3+mELXGX4D4aE9D3Ln2bn8X9miegZEY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXRkDIRgkTDtyfGZbegehVJB8OkRnbavYzcS2QspZlVaYfaqWj
	E9bwgarIRUPeczun1w7v1xu0UuJgkxLqu4RcMwmjnl/aARijHsqqryay12hlt/MIBIlVmXGRtZ7
	Fol3m6aEZaY1DV8DsV8yz+PzaVXDrovEByLaQ2qYVmrRUsvnZSncR1S/w/5Oxcwo=
X-Gm-Gg: ASbGncuksOo0OMaxw9KMRtBJhEF7QtP/aW9MzRvO/zC67bjyOuh7XL+WgSAovaesQKe
	PhrzF+W+Gje9wUR6OeNM3Kd17IdK9oYvaYHwrB+taHQcd4HJHYZ/0xzdr0mQ7b+uZp2Ipt3y6x7
	ahNDpm18PFcnMYyxAihdZvRJ8VL/9fy7TzyAfPKLB+r2RfbpdIl6wphmWYzWU7yqzSyHoUurAH1
	+oZU1qAr9nNTdfMmsSpZcsoUP2d5DFAytzb3Tp+Avi8T1lid+Idd/9+eVWyhMIe6wLwMsBEuOw8
	7duMuWje5jguIJPV8NowJmsJT9O51BY3YDJoKsaHo3EnuR8F9p/PjXPjyJKvPg7VAzgB3A==
X-Received: by 2002:a05:620a:454e:b0:7c3:bcb2:f450 with SMTP id af79cd13be357-7c774deefb5mr256193785a.15.1743807769620;
        Fri, 04 Apr 2025 16:02:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG6MHU8Tgt8a8CQEhcefjPtj3ZIKu6Qtk7j4wVYGOhsJgBWQJhk02RvEJAWLOpHIAp8RfiPSA==
X-Received: by 2002:a05:620a:454e:b0:7c3:bcb2:f450 with SMTP id af79cd13be357-7c774deefb5mr256191985a.15.1743807769258;
        Fri, 04 Apr 2025 16:02:49 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7c013f66bsm321160766b.118.2025.04.04.16.02.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Apr 2025 16:02:48 -0700 (PDT)
Message-ID: <4adc7b02-94d8-4ce0-a65f-6cf1532c7d28@oss.qualcomm.com>
Date: Sat, 5 Apr 2025 01:02:46 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: ipq5424: Add CMN PLL node
To: Luo Jie <quic_luoj@quicinc.com>, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_suruchia@quicinc.com,
        quic_pavir@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com
References: <20250321-qcom_ipq5424_cmnpll-v1-0-3ea8e5262da4@quicinc.com>
 <20250321-qcom_ipq5424_cmnpll-v1-3-3ea8e5262da4@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250321-qcom_ipq5424_cmnpll-v1-3-3ea8e5262da4@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=PqmTbxM3 c=1 sm=1 tr=0 ts=67f0651b cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=FgJnXFQMKNkajvnM-RcA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: H_P4dAfBanuG5Nos4BOlIIeMVpzGprwU
X-Proofpoint-GUID: H_P4dAfBanuG5Nos4BOlIIeMVpzGprwU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-04_10,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 impostorscore=0 mlxlogscore=710 mlxscore=0
 clxscore=1015 suspectscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504040159

On 3/21/25 1:49 PM, Luo Jie wrote:
> Add CMN PLL node for enabling output clocks to the networking
> hardware blocks on IPQ5424 devices.
> 
> The reference clock of CMN PLL is routed from XO to the CMN PLL
> through the internal WiFi block.
> .XO (48 MHZ or 96 MHZ or 192 MHZ)-->WiFi (multiplier/divider)-->
> 48 MHZ to CMN PLL.
> 
> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
