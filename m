Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02E111D90DF
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 11:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748343645; cv=none; b=GtAkGvIXAWQMUv8ZXm2lYqs2U/9LxRYu5q2ny+ru7nT7REK38dy60R80Bz9LKXQoLvtNalfzhpDirDNLOiI0HeedeKI4ubskz+iJpUypmXTBDNfEPTrK9418Ma4StYpqFuojSGYGZO1Ek9zhg7wTOh7BBQpgVzHS1boELK+0UNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748343645; c=relaxed/simple;
	bh=U6pKDs2mOQBNxfLvwMT/KbWRi6T7oO/1foUXXEwPqko=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l5GpoV3ZOgGAZiB92HapBytIkv2FwEzdalg2OcFIpjjAooCnCryzSqg4Q3JLH7OACZKIeib+WAZgeliSmcfDnZkM0X6uiX8V5s57FqFL+fRcuD5F/4d0F8zp1fFNpGzx/J1YD+11Y48ITsGM9UbJZ+U1n43ifvjxZuYB9kIOUaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fB9yk8K7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fB9yk8K7"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54R2pbjt022688
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 11:00:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zgVk85DAmmpZs++PLF2UBmQ+DGiZz0Emih1vTSs5OXU=; b=fB9yk8K7uV8T/fq6
	DO1Ni/h8nKW7CNmKL96zZ1bf0epG22PvNYkhTmno5rDgk2+OzHSmXigIIm3o6foz
	To1Zppqw6y+7fKH3A7LscpMUJupwr8dawfyi5Bme2vi+Kpd710uu6Q+xnccmYqOi
	4JeaueW7dj/+EOHecWjN+hTYCctbSWZSwPDu1rkYZM/EjDp3tKY7Wzq/YVi+sN0U
	C09I7hiprznbgkEu8dGez2ivfULrCi6jNbVXtpMJnPy5pi4se76oAOTQg0Q4o2BC
	gt2NzvjoRe2w9fdG+fFoBsSEiz9Xgr6XEf3fC1hQsaZX6gVzenwRUZu0BunRdCNJ
	2Z1uzQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u79p6k2b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 11:00:42 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4768b27fef3so2691591cf.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 04:00:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748343641; x=1748948441;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zgVk85DAmmpZs++PLF2UBmQ+DGiZz0Emih1vTSs5OXU=;
        b=QiUP8Xf5CzWW51kB6XXqUBFoM1azOQbR37jqUEttJ8CZrNLhJiH3T4KXuwV03BlZxV
         SN0UA3wr9c7Ktq+uaznQe01HnC3RkFwscPVgmCpLUBiKiUcqpfNK+jMvCGw/RJALkOsx
         H4SQXpw4krlQUv5lqcYOGvZ2pMVLrx+r9Bmu0mKJTeudhfmzcePae4ol+fpOR9deGmjU
         BV+UepQ7v0zPR7I5HdppiHILFfdg1MKFJ+umddQcYstqXJmKMGkxmUa94x6lruZ1XfJu
         hvWfh/O3hIxoMhZAWKp5mZzAS77dZlIEay3v/noHN1X3yXwg/2D51l5vMj2xPuTNZf7J
         q6YA==
X-Forwarded-Encrypted: i=1; AJvYcCUW03Re+zFCBpqZEFd/zlLYYJMkY3creVzadp7pJ36CuzIunM5sKomDDs19/XAXn7YzlOaX0D1/R0axZ5A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0htJX6t4tcaopDdrCrYvL4ot2/N6789cV7uV4gaMtIGFoahss
	XRL/Vipxp1vjYL6MuMzebd4caDgFUi8TgcwQP1/oIgzgc8e4TZw5elU2zEZoZPdBlWE8H1Wps7k
	BB+KXLr95Lmw7sPWC8vyOCU3cNQH75sxVJD30pFsnKTuqYVFLsuGk6kK9vX8nxKFLwy0=
X-Gm-Gg: ASbGncuSEShThPh7LkSWqAChkb/dviC5t8efomiCQl63CNhWQbdErQP+L1Yglq76eWb
	ct5uS/FvefSBrxSGjBWccpxhFGBXZjk5OfbzpmZseJv8IOC9MzrE0WsC6JlXcGdj+ivvNqvSv5n
	FqIDy0qLtbve+EBcGy6RhOdo30Bxaq9hOnCFLLddftfdh1dQfHNqN6lwqk919R55IzEghhUvuuE
	fqi1JpU7cgUGhMHkPl8eM1b9kolA4YL0oMq9nMukJRbYlLH/jSNdoiJewCBGV6OQNDHpXnrws+y
	nm93h8Y5wJDwKJ330WnUTbKdanrDvD/ATzqfmxzj2C33yJPoE0iQq/CbMUn8pr4/AA==
X-Received: by 2002:ac8:7fd4:0:b0:471:f437:2973 with SMTP id d75a77b69052e-49f484b59a0mr63741601cf.14.1748343641567;
        Tue, 27 May 2025 04:00:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+5TD+MYI12ASNGgNhrVbg3teRggfUA7Nt0ihpblmSv3AXfO5j1mU3F1jH13ruzx816Fmvxw==
X-Received: by 2002:ac8:7fd4:0:b0:471:f437:2973 with SMTP id d75a77b69052e-49f484b59a0mr63741331cf.14.1748343641067;
        Tue, 27 May 2025 04:00:41 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad88d055609sm100472066b.28.2025.05.27.04.00.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 04:00:40 -0700 (PDT)
Message-ID: <337068fa-adc2-478e-8f3f-ec93af0bb1c6@oss.qualcomm.com>
Date: Tue, 27 May 2025 13:00:37 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] clk: qcom: gcc-ipq5018: fix GE PHY reset
To: george.moussalem@outlook.com, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King
 <linux@armlinux.org.uk>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20250525-ipq5018-ge-phy-v1-0-ddab8854e253@outlook.com>
 <20250525-ipq5018-ge-phy-v1-2-ddab8854e253@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250525-ipq5018-ge-phy-v1-2-ddab8854e253@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: NbBlgQcYtMDC1sQJkhPN13KlsAF-g-ws
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDA5MCBTYWx0ZWRfX5OU9UsXIjc23
 pF561SRPy8Gr5GT+5/UJqbAuI0torR3S3tqH87gOUsWGGQ21KfzeZNzPtSjJe5i9v9ViL95PsKt
 i7ZggPfsWa5JTNCqfA2b69GJflSr6RSt866sfqYxgDkLt2o1QHzCzWZuIIQwcsHdPsqQKlm+jUC
 0iDCKWUnxOiSnrUjHi5Sg2j7mB5+2SlO/4pd3aIrCXcTS0e2kHTLZQ5JFbNEZFJq7iuCf3hMyzN
 wQEKqBOmQF7j9dSgBGqcFv9RO6O1EbLFbFTy7sS3vAVKgcjiSd38GAQkr8bbFgNvcZIKLk5t9w7
 ftg0pCNaht9F6XAorUIrcnC3HODq1NZbi+kynYqq3Wvvhmip7jVhoBcYNI2oI2+g5ocqT6IO+6h
 slsd/HrHSn0//7UCOKXdQ9vmmpYHplnPQtP2N6JrFuhxZYb8PBWGHZAHimx/ByE4dYzeNuiu
X-Authority-Analysis: v=2.4 cv=HNnDFptv c=1 sm=1 tr=0 ts=68359b5a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=qC_FGOx9AAAA:8 a=UqCG9HQmAAAA:8
 a=rZqdB0JiAKPJAkIg25gA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: NbBlgQcYtMDC1sQJkhPN13KlsAF-g-ws
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_05,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 mlxlogscore=999 phishscore=0 mlxscore=0 spamscore=0
 bulkscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505270090

On 5/25/25 7:56 PM, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> The MISC reset is supposed to trigger a resets across the MDC, DSP, and
> RX & TX clocks of the IPQ5018 internal GE PHY. So let's set the bitmask
> of the reset definition accordingly in the GCC as per the downstream
> driver.
> 
> Link: https://git.codelinaro.org/clo/qsdk/oss/kernel/linux-ipq-5.4/-/commit/00743c3e82fa87cba4460e7a2ba32f473a9ce932
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---
>  drivers/clk/qcom/gcc-ipq5018.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/gcc-ipq5018.c b/drivers/clk/qcom/gcc-ipq5018.c
> index 70f5dcb96700f55da1fb19fc893d22350a7e63bf..02d6f08f389f24eccc961b9a4271288c6b635bbc 100644
> --- a/drivers/clk/qcom/gcc-ipq5018.c
> +++ b/drivers/clk/qcom/gcc-ipq5018.c
> @@ -3660,7 +3660,7 @@ static const struct qcom_reset_map gcc_ipq5018_resets[] = {
>  	[GCC_WCSS_AXI_S_ARES] = { 0x59008, 6 },
>  	[GCC_WCSS_Q6_BCR] = { 0x18004, 0 },
>  	[GCC_WCSSAON_RESET] = { 0x59010, 0},
> -	[GCC_GEPHY_MISC_ARES] = { 0x56004, 0 },
> +	[GCC_GEPHY_MISC_ARES] = { 0x56004, .bitmask = 0xf },

The computer tells me there aren't any bits beyond this mask..

Does this actually fix anything?

Konrad
