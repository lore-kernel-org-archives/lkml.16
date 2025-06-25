Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AD8B2638BF
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 14:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750860192; cv=none; b=NWyfcJb3vDqY99Rk696PS6KH8/oqWa0sNUHG+NSUgiOzxOzuG06ZxmsVXRra1QsHvqx8cg1aU0VFPQ69TFFwoYy7NMjnuYnCAK2gYva5IWd9Qpfsw54iRHtFdjpCQAb9MofdAD1OD1nAwHQmTLPGXHOqNw4UWFPA7VUbZNrD+P8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750860192; c=relaxed/simple;
	bh=5zMJXwwWW08GGXTySP2knMOGm23otbDvAH32Yql1p7k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZIKnBmLU6ejKhuABxpZNlwTnk+v11DJdSzVVgdSy44L3qiTKwqfB77RAlu6UZF7Nv1UDa3/pbbrmuhqfpB3+nB/d0rzyF7hhMf+N2JvEavm018/sEdJsDC7UbVI+Fbvs31I1IDTwnEki5NvZLds3CZB/x3FGDyPtaeHYb32GSdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X4cMehir; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X4cMehir"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PDEmOX015564
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 14:03:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XFqnMVGRQpupfxD1RJ2vO64N/c6NtFXjip6hXI1/5Fc=; b=X4cMehirXtoXBVvk
	ABmJsgAVU1YrN1uzZ6MEUfYF9AjNbW4SRjuWooTtKuxPC08owya/wc/Ckcyn+W8c
	OVOQ0H2BfBGrhgvhlX0VXyTiKmW1nsD+xNsyLqLuJy0edGOtiFXIK19qvKw86ZAj
	fcdo6v5zEd2tJX9qVdC+0rYnGPTxm+l0hTSE9T996loTAcNuGhLItlIB6mk+Zpoq
	FtsMDXw9IRBU7XSb5F4dyKD1G7g3hbMdXNGScjC6rtUasl+tokn1kXKiYoGt+b4U
	VwlzAo4aCBIRAyS3h/kjvHW6TGi8v1zUvzalSjARgzEZj9N22tLApLFw6QN53eJ9
	fFoFqg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbhqpkey-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 14:03:10 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5af539464so172837085a.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 07:03:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750860189; x=1751464989;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XFqnMVGRQpupfxD1RJ2vO64N/c6NtFXjip6hXI1/5Fc=;
        b=j4kLyyk99EJU7ddDrNCVOVS7bYosX0RV8AUaHYoc7vO/EeZh1cfH47ECKxSAijUe7V
         CSVN6W2YBHpQApWOcuiPPVpAJc1mXsqfvQyH5gtWmTIHyVtN4qEyewDH84MTowFDcd/c
         BhWxkxQP2EUQVynEtwkN3jX+OubMHCX7yjyj4k6G8a4r8hhPvX1GNjmJSU1plTOLknyF
         3PEoKqsNW4Q0oPwZ5XOqHXo/zMQmviSA7bqUXnovQLXJxbHRZATX4g/P0BuV+l9HeGW/
         mdF2gQqUw2BSvi8b3kXrnyvsl70FV0FPxQIIg3jtaqeBWZuM+ToYntj5QoO6qzoRPee0
         rTqA==
X-Forwarded-Encrypted: i=1; AJvYcCWsIKs1sp6d8n4F8/tvW+j4LuQ34XlA9QXo4g39DCbW+zcFXqjS+IEWNMTkeeOMoH0slWN8bTsirMph9Hk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBOP3elK/CYP/rPQEBOZfQw3ehgTAHiw2BV1kA4DIiojbpSQVk
	gtbSAnS2G0BMGOZFRA/5lC5b9WEcqA5FinauUAoFr/YNKmzZd40YNi1STjMsYaDR4+npxwtptIF
	bkIfMei8bf5kpPOcBJPb4FwXXnjkMFK1imN6Y2AKPmq3xOvuv6hh69Di+k1RwVzXtfM0=
X-Gm-Gg: ASbGncvA/EMfQ0hKMRCuJiOp7s213huh1RCx1K35VbXINH4TzWMNargZMd74OG/d8EF
	Oibq2sWu1NEt/RaCyMpKc4JGvygxr2AKVxyaJl6DVoHPnB8U5lHw5IIKrU2oiE1IIMOqqBmDUCt
	3xpZSKB7RHOvYvC3b0rhthGAJH/dIZ+Pmjuxk8QBKKlVthWvViqvj1BE49mXU/cC9x/CJQwruK0
	pJ1xxes8UcL9VNxHyYvyDphRZ8wmrEmCYje5UHMyY3oKhBg5PBFLIUFICX9VxuGBLqx1qLjkugE
	CrVU3jyJG2LXFCBCjb4QT4tq49BJYJoUhQYXfDbmImStZ7my+ZxMyll0+9TiVFQjN43EJML4oBx
	FBt4=
X-Received: by 2002:a05:620a:1b89:b0:7ce:e99e:bc87 with SMTP id af79cd13be357-7d4297074cfmr151196685a.6.1750860188780;
        Wed, 25 Jun 2025 07:03:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGdIBsWsp4TsebQh9ea0CxfPNx1LapgZvLTSmHhJ3o+vsH2NNt9o3OqUtv9riIIP+wKvxF8wQ==
X-Received: by 2002:a05:620a:1b89:b0:7ce:e99e:bc87 with SMTP id af79cd13be357-7d4297074cfmr151193085a.6.1750860188053;
        Wed, 25 Jun 2025 07:03:08 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae054209ad2sm1067888966b.148.2025.06.25.07.03.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 07:03:06 -0700 (PDT)
Message-ID: <8ed0cca0-c2ed-47b9-b2e0-bbd66e133f78@oss.qualcomm.com>
Date: Wed, 25 Jun 2025 16:03:04 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] regulator: qcom-rpmh: add support for pmr735b
 regulators
To: Luca Weiss <luca.weiss@fairphone.com>,
        Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20250625-pm7550-pmr735b-rpmh-regs-v1-0-cab8ef2e5c92@fairphone.com>
 <20250625-pm7550-pmr735b-rpmh-regs-v1-3-cab8ef2e5c92@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250625-pm7550-pmr735b-rpmh-regs-v1-3-cab8ef2e5c92@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: DGAXNXOM2w0EPZFLe8yfUN9bT7xxeOVJ
X-Authority-Analysis: v=2.4 cv=Id+HWXqa c=1 sm=1 tr=0 ts=685c019e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8
 a=FIv874YiPNcmhJNsip8A:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: DGAXNXOM2w0EPZFLe8yfUN9bT7xxeOVJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDEwMSBTYWx0ZWRfX3N9RRkT5/JMw
 9CllE5JRSWj+DoJu3gu27OuDn9Fc+rEptoO7JdrM10dEvg873DGxz17AciNFInGRcg1knnspNLU
 brwD5gZK4m8MJAFZOB0jrdYxTLcuSzv6a+yVZFzghZZKTDPJ0RwrV+ZBieYd0HAZ8QKGg3zVjvp
 XvSDiEEz2bi/kFmdfXQom73lCUJODYNrinXD8lpCFdp7TDt1F02rHeinPHITPXmRoiHlubo4Z3s
 33SsqFVN+G9plKfXCoOgmGrwBkiPkuz7J9l+COLeXmSMPSJRxvAGcdok1E07Eh+pBektCjuZBKb
 fAtgCRdcELZw+BmKvFtDvHfw1fAYRVNXmeyPYnsVyZNRJr3zLX7bOWgWWOViv/44OSVJYnJIbG8
 10+rXz6VNzvKARFzIUV0B6itfAdOEQe38DznK1Oo+1hexuBOWX4KfkK1HrNC+bWcHnqn6xqP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_04,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 mlxlogscore=937 phishscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506250101

On 6/25/25 11:18 AM, Luca Weiss wrote:
> Add RPMH regulators exposed by Qualcomm Technologies, Inc. PMR735B PMIC.
> It has 12 LDOs with 2 different types, L4 & L10 are LDO512 LV PMOS
> and the rest are LDO512 NMOS.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

As far as I can tell, this is in order

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
