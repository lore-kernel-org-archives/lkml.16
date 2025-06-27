Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7A0320A5F3
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 19:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751052415; cv=none; b=k+zKNa/e1e3+8Nd9mOzZPYH0b4pJHoeaOnooB/VFHL9JSirO+tfBgn1uyJT/r03iSRfmJ7bI9srE/G9/83kLzwG0PeiGpL8YI0RfZbJbzQVpsM5PLQ090O0wi7bgkI0nPIeRUg32Qc/EG+BMjzTwVNIVFms3BVJddiuJSrHwKiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751052415; c=relaxed/simple;
	bh=PgKJBp53dR2Ai67YO4V4HA071loDKNdxLue3b8RIr58=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=awnAEPYR35KqSN1m21pJeETRN5ZRSe/1QqvuxQ7ZebppSNwe+JA3qG8FO7UPLncjdNF/qa5WwPPWL5lJ+bNZew50sToLH2BoriCLFvwY/YTM6jY2xPNPCzIZeRR+iX24OKrPh6EaOWfuynCmUAww96BFnmja1rIA+/nXBgzqJx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fAvw9ewj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fAvw9ewj"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RBZlda027379
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 19:26:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C34ONTM+joY3ACRb//NUdUTbM2c8N4wd1fosaRZcrkY=; b=fAvw9ewj+WXk6hsR
	H7EEKDhYakCtAsWIFBtBE704V+9MVIFwgkjPJ8+ByILnTPMBhoHyLjXHyaSwHHY+
	IHkBisTMnVksCJqHulekIir75GZ2VaWmMqFx1EfJ2Ko5YHW/k85gItEJnRMT/HPX
	Tn2S/HQdebfWS+YHYrbAu5AhqdraMR8jQLpfw1e5VvOpNveO6+rDXIwdWEtnJR5P
	vHUoOfLgbSNXQCBZwaDfnqVcxDryD4X4olYv2DRN9DEbzpK4n3H+IRZPFF3JB26V
	gisA2Amo4581exSBsuQnRAGtivDoI4MC14M95n8FMm1RaQ69rdCzFqmFYmw4pzR5
	AJqAtg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ec26j8hj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 19:26:51 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d21080c26fso39387285a.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 12:26:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751052410; x=1751657210;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C34ONTM+joY3ACRb//NUdUTbM2c8N4wd1fosaRZcrkY=;
        b=YIn/K7EoV0z76qpRLDFY5FKE6yWOEZPWLuo1bXCUscXCkB9Kr2U20uHRP4mXLWy+P9
         NT9DPr42BlNTyF6w+h5L1C94cDLMy3U2gdbGNH8YqVpONgMm0zuU9n/gTip4nf5SoMww
         8YA4fY9TFXstbYWAXt1x7+B9Kg87U/bB6OAGTH6rNJLnY/oLfjdiRwkMR/G1UvlzHIOH
         T1GN7YBVVTmM8uS8w5JdBs+tQ75F1ze8MquaOonMamNZkgvzlSVFVeNwiJVVd5IX/M5Q
         HAawDBRskdLeAkILs15c5hnQwFpxOPepVJxJ+umauQ3pWU3EJReoDfh217uOGAdNOk4b
         kwJQ==
X-Forwarded-Encrypted: i=1; AJvYcCXOUnQ5QFG4fQwiJpD1VYinwyCUJZrXwWcxm9gEr0Xpr9HcGMxKYVhzfgjmlsspfryFR1d4pM3AZ2o2C5U=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPAqbEdSefJEWtyXiYsjH+XsSyN7WOXIngZdaIdL6cQZoiBG35
	xIO0Z5SFoRLm/yCyxKvZcK3RQ+fcTKOP4SvNubUwynX7Zq2eWF6pihwBpuQueNpojUAhBfBXrcC
	Yuwd28j0QJFRJDvUDDB7Wk8pzPw8nXiLbWsdYavMxhKgBopLJuc82WNRdwYTjjvc+vIg=
X-Gm-Gg: ASbGncuz9IShfVDVtWj6FdmdR+BiiR+fg5o8vtt/Bc4umc7as3K0CnlnWwUqx89xUnL
	ouuytJN3DrVb35LOm2Ijozj6HCk1s4/ZMiNMDchCsdpR4x75LuZrqXSRtPrt2k+aTjXqoOoK7kb
	7rubbH8iMAOv6pM4XeDlhf7Su7f98/xQE16K1yc6wjvisMS93JT4zqFfJyI9e5QZ428tVWUjemi
	KbCKBDBhO8K2H8iPJjjjP7jsLU2Z1VDLtngYLwsKquv94tJpsSmCMwy7u7FzFVNOWqwhfbjEFkb
	2wmeFyJh6cpcfdnnQ89gJz0IrIy1PMUG4GgPr9WVnUiTYdq6MxDZHbqGJH8VpBlu3ESi0LsvC1P
	rUlU=
X-Received: by 2002:a05:620a:4384:b0:7c3:cccc:8790 with SMTP id af79cd13be357-7d44c21acefmr18327985a.5.1751052410503;
        Fri, 27 Jun 2025 12:26:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHDPYkLsnmO2nGzNZ10OMjymrNY7J2wqTDz4VWNzNFIV4cSvpU0BqsujQtneyalnxm/ShhOA==
X-Received: by 2002:a05:620a:4384:b0:7c3:cccc:8790 with SMTP id af79cd13be357-7d44c21acefmr18326485a.5.1751052410034;
        Fri, 27 Jun 2025 12:26:50 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353c6bc2dsm181908766b.136.2025.06.27.12.26.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 12:26:49 -0700 (PDT)
Message-ID: <18dddd39-6118-4b46-ba07-8304d1830798@oss.qualcomm.com>
Date: Fri, 27 Jun 2025 21:26:46 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] clk: qcom: rpmh: Add support for RPMH clocks on
 SM7635
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250625-sm7635-clocks-misc-v1-0-45fea645d39b@fairphone.com>
 <20250625-sm7635-clocks-misc-v1-2-45fea645d39b@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250625-sm7635-clocks-misc-v1-2-45fea645d39b@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDE1NyBTYWx0ZWRfX4dZX6ODgfJ2Z
 sqORE3BgGDGtUkSZhsrv7wMc3ywIk89odiFd6yZdOIiq6ptxexvF53hR3C3O4SuuNNFH+vKbiLK
 PtzZMzD7rxO65M8t30mz7FFmEHHjB+OgYLNBWkUkJVD2rbUXDNsaapuJnb4GRZgaM5AeuSWkwOn
 hAHeIUatAInEAmYSDtzan5/eNDADDRgtK/Y12urZXxXyCsyYppuYxgQaZfbJnNFUMCQaX7ZvUOn
 kMLN/lhmkcz7RGimXbPk9WU6IIp7L7m+J4QXjEgXlYUCiFZ2uYUcQdCY47QWi1fjX5fs+uPACGA
 04ZmSDhDKN9r7FxrNSmOUee4+lK0+KfK/Qp7/YlCovew8GNrfFjfZDsuFLSbuB0tA/QT/h9BEHu
 do03CK/AEVB39O2F0HnWB841JqJ+ryqLnEh8QHbFpc3POYnFj9E/wfTKpYQIFnpGIW8/HERb
X-Authority-Analysis: v=2.4 cv=XPQwSRhE c=1 sm=1 tr=0 ts=685ef07b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8
 a=WWQFUNGd85j635JlVwcA:9 a=QEXdDO2ut3YA:10 a=AYr37p2UDEkA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: xHDoOMZjHPKxirHQHpv06WdYQXCV81LP
X-Proofpoint-ORIG-GUID: xHDoOMZjHPKxirHQHpv06WdYQXCV81LP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 suspectscore=0 mlxscore=0
 spamscore=0 phishscore=0 malwarescore=0 mlxlogscore=884 bulkscore=0
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506270157

On 6/25/25 11:12 AM, Luca Weiss wrote:
> Add support for RPMH clocks on SM7635 SoCs.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
