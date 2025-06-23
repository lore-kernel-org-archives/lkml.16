Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CB261BEF8C
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 10:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750673796; cv=none; b=L2iQVdcFAFGVyRlufXg49NwvDzlwCdDFMGemTTbpOOFVENfuoZb7btcax7b68SMvxxhDQgN83EyFyMFJmgduK+9Ss6sJ7H4w/6Yir+RS5fpG8mogN23R3R5b3An96QXQoE7fHgYzbqmiU2wgPcRm9a31BqD6mj/LdkHCAX7ISl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750673796; c=relaxed/simple;
	bh=sOYwnsD0J+xxTdJBrWtF62Dve/ltjAqoPZ0RC6eB3q0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FehgRwLs0PFhW+HOlrx5jLJ07ENUtlqpyGxl3XxNnwJ3uZY4AbpeHY70VO16yDCQ+zULGXFspAp0oCIoELEdqgX7R68IokVR3fTqFXFC85sZXKaomoMQ3jtA/hicBFI98NJjXm6J9lTJtrb8RkE+H0W8r8pR5BOJt8VgVpNH0rA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ikQ9z5DV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ikQ9z5DV"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N3eVDR029883
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 10:16:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2SlDmKSsNzdYdPWzZxnDLI0jZ+Dr5yKFvIhxTvVVGIA=; b=ikQ9z5DV+jcVazYe
	5tQdq4rfIbPEbnAzNNnW6A3kHH3yjYVEAfgph0V9pZ9E2zwnVc3byGMWnbn3wXE9
	lAuxyMq8SweuFfjz+skgEsZH87vdGAjmoY8tHkSqri8xCffYHlscCa9Bq3G/t28a
	5SEPI1wblw0gc6eT6PBopFHfYGyF5q0OC20wjPL9kU4DPyFy/2aBmOlzx665VT5c
	EY8xyeQF+8KVZxECCTSDzpHPrbrYFAVABlULRkjeohpsvbq/yEYzLa5qyo+ge762
	N7Eq48dqrgeouCJcSjmLWGyaEA/6WbTMJs45nKmVcjlsegy3e4T+Zt1n9E5tWzj1
	8Pol3Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ey7k11uv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 10:16:34 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d0976a24ceso147894485a.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 03:16:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750673793; x=1751278593;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2SlDmKSsNzdYdPWzZxnDLI0jZ+Dr5yKFvIhxTvVVGIA=;
        b=FKdHL3UT2qtvrPnLc2JpxXCLYr0Qa1bH/Cc1nqvY+sLhO4tXMz02137AL+3AeIbBwK
         IppzhnJA21OwJwt9s2lQErmBMObe7MccfOI2/tIaE4RlNk2EVUTKQqKI5LzurJdEsuJ2
         WVpSDWGCrmUbmZiEfitRcmLlYiMtahBZ1uVEc/2ZBmxYV9rwEHZFma2mOTS6pysC6j/2
         gfEcZomkM1vnF/fBqSDHcUBVtqSzUllc8ArgJH8rCkgoxDcni14Hl/5SkUAAWbRMRNtc
         aClPRQzenWIS50teMAYWnYRRskArSwJFdW1QAa/W8MiEoX6DAeRnvY4UPZ9TxnCQk2zz
         G/FA==
X-Forwarded-Encrypted: i=1; AJvYcCV7pJCG98aDZUPUtgyyirRP3ARWtxkDBodEaqmHX2U+iw4p0xH1Qi7t5rts6OPhh5j+HaSO0ysFkgojCUQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZAJz9vwYEBbOmlc/7oqThN5j3nIEK3vKOLwYqs/Svfk6Ze3UU
	StRXWeCrSCBrD9YzMR1j3O2t+Ac17L5oC2X1/xmBwjpOCxBH0ffM1SfOAt9e1qy4T5ES4vVGuQk
	JjCue2ckM5q0Z32cmSRwtaWWTA5ImP9ZVgw0MCbhb2azPD+JIvOEcNb0h4ZrAVfqVVZw=
X-Gm-Gg: ASbGncspYZ4HSRXc44YtuSyUlUMOwUdDOLorj8zJnPaDNXo2PZuD3CxR65Nw0v39s8h
	N5YULwjDUiauwoW27pMklx2MJJqfGO/ThNGYQfY3S7NO6PZn8AhRZqF4GVJw1LsFEj1tUxjyi5Q
	gSb+MvVDF3XBcZn7F9uwt0P01CoIi0eg54hLrN+QKdwiQtiqXB+FH/l9DylwaEzX4df0JD+6kEF
	kWREklWchQtB5lBCRgeWKXPBnLF3OcvU+ncIxOQPyiWYQIT+a28FA3GjBQ9Y4hhuEuUScbFD9M8
	Aismr8kmTeqpNJmm0pyx1C2TeKVhKMbmw6QV/vbtiqR4xcwNwzjE+6chDh8Zduyt1o/GsUMhEeZ
	XVOI=
X-Received: by 2002:ac8:5fcd:0:b0:4a7:79e1:cd54 with SMTP id d75a77b69052e-4a77a1bccadmr56054001cf.6.1750673793573;
        Mon, 23 Jun 2025 03:16:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGgUfDzyPIwCHeQDEwA6qykj5CrocIwRAGCcAAOLEMk3iHjz6Ei/uX0xUXjX6QkfYbNoV4T2g==
X-Received: by 2002:ac8:5fcd:0:b0:4a7:79e1:cd54 with SMTP id d75a77b69052e-4a77a1bccadmr56053821cf.6.1750673793220;
        Mon, 23 Jun 2025 03:16:33 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0541b7438sm677772266b.125.2025.06.23.03.16.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 03:16:32 -0700 (PDT)
Message-ID: <85adb1bf-2624-4280-b1e2-1bd2aed141b7@oss.qualcomm.com>
Date: Mon, 23 Jun 2025 12:16:30 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] arm64: dts: qcom: x1-asus-zenbook: support sound
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
References: <20250622134301.10403-1-alex.vinarskis@gmail.com>
 <20250622134301.10403-3-alex.vinarskis@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250622134301.10403-3-alex.vinarskis@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YoEPR5YX c=1 sm=1 tr=0 ts=68592982 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=jVxV0LTIGXaBgX6IzjgA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 7HuQADIMvTLrrct-Wd7pVs49YxDSImgq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA2MSBTYWx0ZWRfX5SOuzj6VK4OM
 mlClKCNXg6muUlu722S2t5VfA1U9/4ElWuWbbVH4sBdVhV4uXNq6RUeBPDJej/haohyjC/eeCud
 FyjS9R2R9Y9uzmrhZSuutILAvZAPonVya71jHqN2TEFJgRtImjUdWkm5jqJFEn7W7HywEwHff6p
 A02smgTwn3lrHQznH1nXEMnle7Bt6pVsbD6RSo1svYPgBymq2xGPJb8bpe2+qhaRedVK4b3FH45
 U26NOc20JsbmTrYWA+yU82m9o3hcYR4AJXwFSOQqAn9XP1JAhGJtoAlXkndO/iZLXCk5s6C/ILj
 AGQP6D6wdLjBwXcqE+W+Yd41ZZhVaaRCSi1YUrHNZQTCx6QVqEy3Znvmk0bV3j8F5sV6+rl+eji
 HaMJhxAxMP9DAZTN7npxOgSyv2fpevvBcHcYtopjH7IxAOnMQTp0jGiXus/GNKpF36dve9Rv
X-Proofpoint-GUID: 7HuQADIMvTLrrct-Wd7pVs49YxDSImgq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_03,2025-06-23_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 mlxscore=0 adultscore=0 suspectscore=0
 malwarescore=0 mlxlogscore=907 spamscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506230061

On 6/22/25 3:40 PM, Aleksandrs Vinarskis wrote:
> Works:
> * Both speakers
> * Both MICs
> * Headphones jack, L/R channels
> * Headphones jack, MIC
> 
> Now working/untested:
> * Sound over DisplayPort
> * Sound over HDMI
> 
> Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
> ---

[...]

> +		va-dai-link {
> +			link-name = "VA Capture";
> +
> +			cpu {
> +				sound-dai = <&q6apmbedai VA_CODEC_DMA_TX_0>;
> +			};
> +
> +			codec {

'co'dec < 'cp'u


with that

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
