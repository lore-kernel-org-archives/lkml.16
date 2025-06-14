Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F0D148830
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 19:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749930871; cv=none; b=Is2gixqPKmCkJ0dkBZPAC3llEnXx0Apgnq+Y7nfmYySDCGFpozQAQU1DKPJfD4+U/RDnLivwNacFYykKFxYRivbv/mJSTUT0ZqEX5JSE/25QlwglWTJqYmJMAp+JwOwe+ysl4fhXuR9jqHJN0uL5vk6/WMixehytP4RR8CISdfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749930871; c=relaxed/simple;
	bh=dkojOmJxr5zlSsVyIjL1aFGE71TCfhlwwA0JPuvDwxo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P/lO9KZE7jgwWym8guj84HiNApBV8NsamBjOJq/W1uyl82SFfhehG3qABsOsbIj5M7iIT2F5CtV4kWOXiAaoojE/tMv1Gen5/l7K+gKS+A5acC4aEkzPSToxTM5Xeyr2/1K8aSkEEBy+gSHYFDX/Xwrcd9xFxfmkZMvUG4oZ2Kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nAFi5kK1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nAFi5kK1"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55EFmSOE007285
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 19:54:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cxFuTlLUJL74lCTydZFM1J9TTXFA3EkUjAUJE8RBdOg=; b=nAFi5kK1gJ4y9AJk
	hV6AGURdqH0M/uCSTEN5aLxDIDacO3Ffc3bzhvjRQQt454rLOIGYBTW56DYu5iRP
	m3uS/flgBC8IS2XJZYc+t0H0DUgLMiSHIuwdrd/2pt83tXjRrUVWT6z3GR8TkZp/
	9ZvzqN2KsBEa2pt/Z1Je3P1Ahl8s4gq75GVghywJlfoNw2KgOucz1FFucD9/bOFZ
	BtUEB53y5Jk8S3Bd/0M9T3e19O4Udu1bxoUvgmVXsJRq8NNMdeRZ8i+LKi39A5eZ
	RSNArIVSvXBi3tXI+g5vAlZG/AHbwY+KaBQfGc8RW4o9HC1tH2T/O40FqitYqw0u
	WAxeVA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791fsrxrm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 19:54:28 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4a6f59d5ac6so6259811cf.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 12:54:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749930848; x=1750535648;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cxFuTlLUJL74lCTydZFM1J9TTXFA3EkUjAUJE8RBdOg=;
        b=FSZINhzW/OMnHzlI8jsHoZPpISnKHE1uhsaTp3c2gUpTCllIc6gA/NtIQuAovFk5aN
         KYOosXDYyCoXBeFlBxcZWB3R93o2q/EgA8Kjrg4WBL+xi2jFEjTbhoacE6Stm3pIX2eC
         iUaigc2dR6P4UYJfSOQWXRLDNxV690KcC9e/s6ME6PzqlDrolJ2xJbKMlaHDZzZnBHYk
         s7IxHh+h9qvjARzx8NHMuyV7bjAoiOjClS1jX/LBXTPfXkzqrwQxDxtJ88Gi3ZYjpQKz
         QR43Q7yoGv4B/g/esmzNZekLVbE36ttNuLe0EXRmGewKC6/pBV3b4+yiYb4SAB/Db7NL
         RIbA==
X-Forwarded-Encrypted: i=1; AJvYcCUuL7XQoG8XmwkBhT7dVULJzGp90VrsoOjQQ2p+tni9NXDAxOt+85EmNIk/wIcRsG9Ymw9kUHgCDcSYwDg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyaicOKHDUAca3sqD151yaPMzE4rPPD8fZCeX37Oj4SuzDVWoCf
	33u0bdtCvv9of1dWITralNtgpo6ALS+c+cB0fPKS4U9SgOw+vDp6fECifbOy5DRMeO7T8sMdoc6
	EcQ/3UtI9v2Q9eNnQgnDzagSi/fLd4LdO4g9KS91unFCr+zMHSia4XULnovVVb+MvGwOnqgun+A
	k=
X-Gm-Gg: ASbGncth6Mrbj1OQBLaq9ByKLmCVGrHaBqNtd3PnCNprKR66D78qEogH6dWzA0dXh86
	ltDQQFbAuWigW5pSqtiOvYpi5a3KetJ+UGl7AE7p1rQXEEkcA24+/iNd253oft3Vw2xXZEKFQNe
	58JG84JFKisxleNwFFjAGYYRmi1MvwcSCtGoS8n2ks1c/vNaDNiYLeQJyBsC+eWaxnj5C6tFvfS
	SdOWq4Jvco6s8/pUxRczj/VX5CcOHSVOAlkOlufi1gfJCpRXF5xgR7dhsYKMWeBIspvNUrbqxsi
	sEpg4JoPQL1mPKdWZenMPEOcTC2C0znetI7rLnDFJa3jaADbedwbvIa3ZZtBZ+NhAawdmKKjOx7
	sat8=
X-Received: by 2002:a05:622a:199e:b0:4a6:fd26:45de with SMTP id d75a77b69052e-4a73c5c1cbfmr23618591cf.12.1749930848317;
        Sat, 14 Jun 2025 12:54:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGpYLl1OjQ8NY63WwPuMd6FHnvexEg1pNbcnCIaqlxdYhOPswPO6imf7MUgR6eBjDMKpzS3Pw==
X-Received: by 2002:a05:622a:199e:b0:4a6:fd26:45de with SMTP id d75a77b69052e-4a73c5c1cbfmr23618431cf.12.1749930847930;
        Sat, 14 Jun 2025 12:54:07 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec88feb23sm355867266b.96.2025.06.14.12.54.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Jun 2025 12:54:07 -0700 (PDT)
Message-ID: <fbedfcb3-a326-4357-8d10-3be925e5df8f@oss.qualcomm.com>
Date: Sat, 14 Jun 2025 21:54:05 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: add
 Bluetooth support
To: jens.glathe@oldschoolsolutions.biz,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Anthony Ruhier <aruhier@mailbox.org>
References: <20250610-slim7x-bt-v2-1-0dcd9d6576e9@oldschoolsolutions.biz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250610-slim7x-bt-v2-1-0dcd9d6576e9@oldschoolsolutions.biz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE0MDE2NiBTYWx0ZWRfXxHnHB2VcU3zL
 LKyCXXkYHJPlC5YYhj6/H56djCbO0PX3+qCiWWZGWzFjhi8TMaZLUiA4aZkbcLXATnjnMEXeNPv
 0D4bsdzi1UIeWiAl6gTgEQmcYPZhuUNW719QWTujw6XoNIZPsv2WX61yaBiHa2rBHPZ2gS6VArM
 secYAbVCSFmSdsp5nNsb7KgxyA8QuWAuZgUBqI9l7oBRNw+fP9zcXgKsBj63kT4v6WvW067lqE3
 jmpg580ijGQxB5lCnFiaPiNlQyajx+Aq5ESoG3CtOUq9o1LbcieZ9Jgkpy9uYLkLPRTRRjjXu84
 eIwbAKqWNSfO95rZms+Dudzz8A6+PNp4lBkFVBLjyEIxu+hSLPp9WFgeeqlAzomikYH/Ix8ahKq
 Ya0ohgWFUMAcBEAFojc7Di7d+ZYSfuFssI7N7bWIW970pPpo9r3Bt0oaR4ppT8zwdm6JGiHC
X-Proofpoint-ORIG-GUID: 7MnupDrlN8-J6u_YQANoRNbC4pd-T5BG
X-Authority-Analysis: v=2.4 cv=OLIn3TaB c=1 sm=1 tr=0 ts=684dd374 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8
 a=gxl3bz0cAAAA:8 a=b3CbU_ItAAAA:8 a=gXSpMBu-KZCXFNnvIZ4A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=kiRiLd-pWN9FGgpmzFdl:22 a=Rv2g8BkzVjQTVhhssdqe:22
X-Proofpoint-GUID: 7MnupDrlN8-J6u_YQANoRNbC4pd-T5BG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-14_08,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 mlxscore=0 bulkscore=0 adultscore=0
 suspectscore=0 phishscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506140166

On 6/10/25 6:59 PM, Jens Glathe via B4 Relay wrote:
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> 
> To enable Bluetooth pwrseq appears to be required for the WCN7850.
> Add the nodes from QCP.
> Add uart14 for the BT interface.
> 
> Tested-by: Anthony Ruhier <aruhier@mailbox.org>
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> ---
> This patch adds the Bluetooth support for the WCN7850 card on this laptop.
> Since WCN7850 is supposed to need pwrseq, also added this from the QCP.
> 
> This is also part of my tree [1] for the Yoga Slim 7X.
> definition for the pwrseq and regulators.
> 
> [1] https://github.com/jglathe/linux_ms_dev_kit/blob/jg/ubuntu-qcom-x1e-6.15.0-jg-6/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts 
> ---
> Changes in v2:
> - rebased to next-20250610
> - added tested-by from Anthony Ruhier
> - Link to v1: https://lore.kernel.org/r/20250426-slim7x-bt-v1-1-d68f961af886@oldschoolsolutions.biz
> ---

I'm mildly confused given the multitude of options - but does this
check +Stephan's M.2 description appropriateness check?

Konrad
