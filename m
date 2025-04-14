Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE9620012B
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 23:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744673089; cv=none; b=DyVbH9eLwTmeJlbAJO0RUXu1E8oCkYwhIXyKqeenuHRmeeywPlm9xPpCcvPBhdoBfj8I5r+MnWxM+m9AMMG8roj9are/5yZPWqBbcsplYn0rNLoS4EidLagw6ks19oK00Qja9v0fLFaDO6AdfBwCnMUGJpqtjMepVEB2etNzOss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744673089; c=relaxed/simple;
	bh=h2pvihb+r7IyXNDpZp7U3oD4Rj//hdL1D90IbYTHZEE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CtxKpgMSQSvuOFbFuXWvvxdJ1EptzPP/Ami66Gb9a56hs35og2YKVRHzsaC8NIFNtdp/hBL5cfHdTRT2RZODHwuN6HgeOLPKImR0mOLiuQLeTmYB2u8FmqR9dRs5YEiKAlVuWZde8bc8p6OGsumIePKmneFBmdU1HR7B91DurIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CH/Jp3Zl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CH/Jp3Zl"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53EKeIAV002577
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 23:24:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	syhqoSLgiLKWoYixmoWsnuqaN8xZFF6IGsZlfy3D5A0=; b=CH/Jp3ZlxAsXNIyd
	OaYFKyz7rkikQgyuxvJJNnDkc5RUxsvlOXIXSrZeZdpjZuR5EX9O22TRIdaWix2t
	28bxFz2f9ExCKEpH8Yd7R2bUwF7gxgGHCpet+GfiJFZAsr9Vyox2lG84p1NMjAG1
	+kdp4O3KKsY7j5TJA5+ONm63RUxkiDFelubHeCueny1l6pV27G8RrsYa2kFgBaHo
	MGoVdsxv1zU0gw52qPCJfqlJZM3SSDav0fsE9lps60qXgMNQ+aHtAgfqjF36vEY5
	o7r/C8SQZ7LB3QzzksSiyM6gf+jhs5QQSf8ftnAbmxAg0gv96tfHgBZ16fFo+zj3
	FeqlbA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ydhq69gk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 23:24:47 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6e906c7cd2bso10495726d6.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 16:24:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744673086; x=1745277886;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=syhqoSLgiLKWoYixmoWsnuqaN8xZFF6IGsZlfy3D5A0=;
        b=SA50xQ5kORlZW/bxGtwD7xp5yteHegpaRv2PNFNooBDdZk5nLhdbqdLSd/tiuM4H5H
         gR3DghEvEdh3PKTRfpBJw+DXU5dgqs24D2TM2ySGkJXZQaWcEL54/gN+Iv3DH3z9Mz5O
         txhFt0BOR4C7zWkrQ1Hg24PhtI0fN99dzcpDOV3UlSLAtnyECpEf8yV1Z8tWPDjfd8AI
         NUceDjG0zlgLdt5YGWnVz3rdqKoxbHYqf9dI0ZwznvHz6AWHsK6FE96qO/sjFz68Fl7H
         bI/0FW+QwthZ0bVDahbyANKI7EVrhv26dOKSFycZe9NBdSQ725uNB7KcfeZVdewsMMSQ
         oERQ==
X-Forwarded-Encrypted: i=1; AJvYcCWEcjTzMY3Rp/fCbzh7KvA3IgA0SNE9g/aPZ7LAEHga5vOXe6GqIXn/T6oUYT/fdDENcZ+R+sAyBzjSHaI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHda+mAPZFlWTH9mbQa22hijCYrEyz4AA/otEzOvtiAa6WPG/W
	rDLkGBKBZq8FXvNN9JGSHIgj8c2HDJz/yVfBEyAP3X012OhjJRWWpy56r7v329FHutHUNKkWpLI
	XzjbnFxabfFdZfDYCRLE6s0qRK4PgRUflMKPK7RKwvihz0n/ZeYDb93nE7vTnGi8=
X-Gm-Gg: ASbGncsP+CRPbIcr0c7ByYhO35AOzB/QhUyVhFYBGci1q4Cb56K3QPrBwx6DcYB1IOs
	tlVwAlkH+Fswt72PR1EF1Iaz5fHxcCGHwDUZlFRSxDH0kUV/soa6IN5SNMZgV+nuWpSoyqltx+7
	K/3pSV1UMzJJHS2EskZOz/PhYDGFA46UnCcYumo+4FTciVrCW0hZ0jmHON5yzmfB5UyJkQ1NGpM
	wmOKT1uUvdssrozLsdtVrP1CEij2nHvR9H2v4lpGjAcGay55Pz8Bua4l75Rze8M71otDjMP2tQi
	+9/tuFgqF9jVqUeMzdniUgZZUyq7C3EScqe1LGy9CzkMGjESiZ2q7c2shH9OAlvgpg==
X-Received: by 2002:a05:620a:424f:b0:7c0:be0e:cb09 with SMTP id af79cd13be357-7c7af113653mr670670885a.7.1744673086260;
        Mon, 14 Apr 2025 16:24:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF8PTRomTehXQkpJAD665EuLX7SUm59eGe5gjBmCc2IHLMBCvASYa1s8Eb5SDTMHqQU4Sc4Hw==
X-Received: by 2002:a05:620a:424f:b0:7c0:be0e:cb09 with SMTP id af79cd13be357-7c7af113653mr670669185a.7.1744673085863;
        Mon, 14 Apr 2025 16:24:45 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1bb2ed4sm994857166b.34.2025.04.14.16.24.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 16:24:45 -0700 (PDT)
Message-ID: <ac789ed9-da73-4a1b-8dd4-925441d62baa@oss.qualcomm.com>
Date: Tue, 15 Apr 2025 01:24:43 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] soc: qcom: llcc-qcom: Add support for SM8750
To: Melody Olvera <melody.olvera@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250414-sm8750_llcc_master-v4-0-e007f035380c@oss.qualcomm.com>
 <20250414-sm8750_llcc_master-v4-3-e007f035380c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250414-sm8750_llcc_master-v4-3-e007f035380c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: B9opdw-CNhOOvR2uV0zRw3u4uNaAG-iz
X-Authority-Analysis: v=2.4 cv=C7DpyRP+ c=1 sm=1 tr=0 ts=67fd993f cx=c_pps a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=DTz9NSAdtq1ik8-Tc7kA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: B9opdw-CNhOOvR2uV0zRw3u4uNaAG-iz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_08,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=585
 priorityscore=1501 suspectscore=0 clxscore=1015 spamscore=0 bulkscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 mlxscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504140168

On 4/15/25 1:21 AM, Melody Olvera wrote:
> Add system cache table and configs for SM8750 SoCs.
> 
> Signed-off-by: Melody Olvera <melody.olvera@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
