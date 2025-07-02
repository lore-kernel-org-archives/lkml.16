Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9A362417E6
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 10:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751453708; cv=none; b=WgQ8rl/ZQX6LO+eViK3gbUSiS+rQSMXepjFtU5JOxbo6jbZQT8Xvbsu7qmiTFENYScjHVru7TNUM35er6cxNo+XiNDAEhPt7LSVttAGaLJkg9NPPdoGZxYs6bmK7NoAuMid6BKBrSiV6ddTI1clxAdX9LVR4XSI4jkQuEbj5tdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751453708; c=relaxed/simple;
	bh=HJyf305xWispnULlnnZ3Q3DtQcVy4HyrdmFWRFyLtuc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tEfeDSz+Edw19Tcxh2jeFYYxHtiRsHH0p5/h8EGoMJaiaYKCThbN2qPCSrsARLyZoxGebLHlrqcwB/E4LZLMjAbf9gM3shedox+ocjhywZsob9pRNeHVTbtAWe1RdxXnvjrabK8jPBhXzWu2wzjSI1W78LU+t1mQ5eAZw+VtXtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m/X6c4iF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m/X6c4iF"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56270fQH024875
	for <linux-kernel@vger.kernel.org>; Wed, 2 Jul 2025 10:55:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vk7TqcM/VAPxFNM7d3Vzya/VRZ4hi3qF661iXGADBDM=; b=m/X6c4iFCTta0kJR
	zo6MvIGC3UD3V0FUVx/TXYrsL6IY1pAoqm8srfIx7DBcf6/lnIrk0JA8ZpCTvH4Z
	o6uFzzZPsEuHVEWmaVwPlrRmRlVshqPzWtiD2fgqAYV93+OrILVoeksFdWbaygqA
	RBPSY0rBRUB1HGBiTjdSXZClhgU4BUirMCpMR93/0rwds9u+Q2rWydI0mstHFx82
	nRww7j5a+aZs+bLk8t0UWJvYe6Gukr4nSuiMdLUtIrd4WeJNIqGIO8JCIj2fDvxA
	FSRBtL1kC1NHVIG6moQms8qGt+QWCs2nJIevpV3CuUjZjNXUeoDzLA6sGSUP02nI
	sT2NiA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j80246qb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 10:55:05 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d0a9d20c2eso147978885a.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 03:55:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751453705; x=1752058505;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vk7TqcM/VAPxFNM7d3Vzya/VRZ4hi3qF661iXGADBDM=;
        b=LqrV7qPjbisIqcwmh5cagiEiCG2etqVKMSJ/HhpCLR6TsLpRhS2FQJycjECiGzTQ2o
         7lnivjGiBJbcG2c0VHjnTaollXpgx+xMNneTuDc4a5bJ3g2zai5Hsk1QfDThOlibO4BX
         C36wnmssB5PNLAyGoYJAo5ySh/3200g8G22gWwuZMF/MDBlUY5G9CGJGR2IvrhUk3CGv
         5kDlCyUBOyxnSLl2DAYh69pR8CA7PbG8sC5Foa3O3L8F1hbyLJpslucupTkuqe9j4aEK
         OISDt1A/2X2k7q5Vv0KfStbNHOwsrpsyWjNLhOhndTROe/xiPcD5n1T7MzT6n7mGz4lw
         UJFw==
X-Forwarded-Encrypted: i=1; AJvYcCVWA4sn0zT9ZasU+/OwgYtLx76VgtkQoEHOf2WsLOqbwkVG6AXRPzbqfpRgw9E5N+TGZfBz4KdB2+SBCRA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqpXARHZtCCLHCUEtpFFM7I9EgvlsZq36/4DzBv/iftA+eFi3s
	xJkl/D4+bRDfcMxEnR73vJh5aQ5ZgofGfVqmONAkq2ekOv6eFtuPUXY7mvMIB8pASeNsKdw5v35
	gUE/aw8EekcmGrSIUy4N6e7GU7WLc0D7UgMU+C076t1UPgrcRHHZHPChidYnXSI468SA=
X-Gm-Gg: ASbGncu/ykZpYX2CnEY4UijDp8fH76JEfgZ0e+Qubyb8bdvt/CK9cF0aXeQyohlVaa1
	Gd7NGMUw8FovYLasQGrPQIhuPQy4Y5PJEjI4kubDOC+Ay3+PFYX4JWa/L3NSi6a2gobznDchIs2
	hZC0sE7poV/CbTO2ZYjgTmfhxNDXGRJHNCwo3rxH6T4FrWLvrr+GkGgJeU7aT87p+6i9dBuNKnr
	ho2Lm3M+0jZxxQXfqtwaCL8JXdcBsqI19LZc3cmyDITBTZoaN/K+6k0NvnVVmqEwKShU3D0OC2A
	/f5XlVznjkTGElZoNIURsPrX1SHGyGp5YBbbnWYCXPr7f5Arpyv8FUs4VOtIWgFGi6Eu4r5865w
	K/SI=
X-Received: by 2002:a05:622a:82:b0:494:b869:abf7 with SMTP id d75a77b69052e-4a97689a84fmr11869601cf.3.1751453704791;
        Wed, 02 Jul 2025 03:55:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH7S2eRUdhaoYyMorGOcDEdRDtdhRw10Y97aNdF7YBj0R59JlX2lq1116ZUFVEFw99flEQ4Vg==
X-Received: by 2002:a05:622a:82:b0:494:b869:abf7 with SMTP id d75a77b69052e-4a97689a84fmr11869461cf.3.1751453704291;
        Wed, 02 Jul 2025 03:55:04 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c828bb118sm8938089a12.2.2025.07.02.03.55.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 03:55:03 -0700 (PDT)
Message-ID: <9c4005b7-8c01-4880-b0dd-5be4841616c7@oss.qualcomm.com>
Date: Wed, 2 Jul 2025 12:55:01 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 3/5] pinctrl: qcom: sm8650: mark the `gpio` pin
 function as a non-strict function
To: Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexey Klimov <alexey.klimov@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250702-pinctrl-gpio-pinfuncs-v1-0-ed2bd0f9468d@linaro.org>
 <20250702-pinctrl-gpio-pinfuncs-v1-3-ed2bd0f9468d@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250702-pinctrl-gpio-pinfuncs-v1-3-ed2bd0f9468d@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 6bsWzrjwY25iRGy5LSeRYXkXsHERuoJ1
X-Authority-Analysis: v=2.4 cv=YPWfyQGx c=1 sm=1 tr=0 ts=68651009 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8 a=JchxpsDTO30hHQ2eRcMA:9
 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 6bsWzrjwY25iRGy5LSeRYXkXsHERuoJ1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDA4OCBTYWx0ZWRfX8quUy3SYD6gE
 3SmofW+0AFGJRNEcErWNIMh3W6qRoDkNDTDYIsOadpJq+YV7GbOWR86r9l+nM7Z8AivzBZK1zYZ
 zxXai11XQPftkAfDZsQ/LLxlMMK+DC+ozsTEEjh6myPxT/LsDfcJh5/SZyPUw9W6lDc6tzH4Dxp
 QC8fZF/1lSoHs2F1+VkYnFlh0ZV8A/j3spgeD76wzCAOIVBfGw04Ifo5YzMkEps1wW/yo5qNjvm
 ijW54H1aPBT6283WA7D/FdNJZHdDRy15S5m/2ReKrhaQnwpkyJ/tKluCh7luJGBAHTExYYrqC9A
 W0AoW1bcuSyf5gYtdjdm/HV/aCUUXH8C6kdCqn0ueYUS4fPGY7jLRGxjpV2YNSH/iKhT4ja+lss
 qtyvRvaLdpgOOJom35uHMuq65KsGor5IC4PYccVDSR+/+h1j6O2GKZ1CpRSTUeItyJN4nWn3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_01,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxlogscore=563 mlxscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507020088

On 7/2/25 10:45 AM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Allow pins muxed to the "gpio" function to be requested as GPIOs even if
> pinmux_ops say the controller should be strict.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

fwiw this simple change could be a single 'run sed on all files' if
we decide to go with this approach

Konrad
