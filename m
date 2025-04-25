Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F6520F090
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 19:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745610337; cv=none; b=BWomESE7sdOAN4lotdkQs0i9jjSeDq1sSunBhzOlqk/KLVg4IKayaSk3ltYXX63NvX5tvExZl+HafGpsrFaVG0rWBvxFnDfJf07ufEOyQZUlul5Tb+04yzp6rDpeEPlsu4VyrziEN8Bs77bINjYMw5KlDJ7qiyN/CuAcS+UMZrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745610337; c=relaxed/simple;
	bh=cswa6dW5aA9ue0GjESk6mDrCFdxgQa+QhzwAB+RgFxk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AmEVxNn0G/U0y11Etepsoxfj+FwWdEveQ0eJqB3Z/d53ybJSu8cswI9vLGZthBupfm4PrM4HG8Lvt/hbRNk8p2Yc/s49KaLZckHHSAa9xoNoSt5nJSFm6TtGrH6fSV2o8u5lwrkQnyKhYG/PMIy7CEmhTSvUl87cwOdU6TD2KN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=chkxq0cH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="chkxq0cH"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJqbA004615
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 19:45:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Rxx5wfe6aG6Fa55yWqNPwUBU+glFaz9EsS80UceDj08=; b=chkxq0cHtsnBj8R4
	Xu1TqV3UbHWb96//HVSO6DWneslIkkm41CwsmW1lW4LLrOlmtpNyEGcJbZKex8gs
	qr4e+syqx4wly4qj/LQXQAT58cuipVOspbWxeWDv0c9dXcg3yEvwxxubNsrvAwrB
	5gGRiGyx9glz2cqTh1zv4mcL0evZH8ymbVkteqS96NSvnBJZOSLzBWiLQ+oQym9d
	6H3vvc9BBHEViFn+tNhD/JWDDlSbT2BZYXBoy428d8DCSvWK+VP20lBZhvpZk8lL
	ruixfTNBZtmFB2wdDbY8m5V2eT/mJvFyb/4tU6wnzWx47TWlmToYdZD5guWoKvVP
	s+lkzg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0a5j5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 19:45:34 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-476786e50d9so4909611cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 12:45:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745610334; x=1746215134;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rxx5wfe6aG6Fa55yWqNPwUBU+glFaz9EsS80UceDj08=;
        b=s8fbjHViTypKihKIFLHOs1ZqB+jwynT67YBtrqbHYHQGgDCpY4GDctHF0xDno3lL5b
         GxUx7TspCAkZBHWUwoEmoQLfaKThkL6Pz5yKUCWT6UHuHXZte9v7ko8r+pQukB22d33o
         k3vivKw3z2jXMsqo8kfzkbVeO+NoqPHvkzhatvv6vyofJBKimWQ6tNvNkD86aSBbQu28
         k5pMArfs13gST5aIgRqmuasSaiBImPcxCCduSrVg832mw1p7bN9Uifxe2Ob/mdgv/C7u
         ps2Q65dW/lqg2P2wMkDGPWMdz95BFRixLFggjPGpPdyaS3iPQSc7mJDw7AJ6s+rx2nQX
         Uk2A==
X-Forwarded-Encrypted: i=1; AJvYcCVjgI3yg3G4lJzuOhqsGC1NoNSTC69Exj6AkwAnjVYTGe6f41dWCEnkLx2a46t7fWc6GavZtClNlci7kJM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9odZUCgjzb79+LPT7t+qENkdsAuEYnv2P3Zs1/L6flJLx40WA
	yDxubzB8dlE8WDlQGiTyIqRccWBtxaGIlfspjwYPpqrJElkKwwyMDnmKzN8K+c1VDNsUFy+X5qZ
	reBprQZ0ZHjpIzPQvOP0wqSps71p3I5h1yf13I9fvbhYaNb4lMHsBt6cCUNZ/OeA=
X-Gm-Gg: ASbGnctswCszZE63hUyaekIjqoKFxY8ojlFN5ksv4sUFcnc6M2kMeQFtawLgeuoZKUl
	PPTFjefsVbHiu9680WySR4slYUMX+YbxNafNFHKxCJl4FUm/U7eeL1TX2ojBzanaTiTgI+KylU9
	fgRHSqiZk0gQJi3gSWVfSYni3rQERlATTRgEHfMXhpJNVnV7AQHUSiB3ZqDlWiEFYBvx7OBqFrT
	PfATL4L81A4EDo2r4rI/ZMXwq8cuPAu+CKuQZtPsRG/cP7Hc2/W0shJK4vKe7hXwNwNlbIAW6tJ
	YAYTwuxe/RzjbVtAumTTVMdkWpPJ6oSzOeaaFB1zd/kdMI2lIx7JGKc4pjGIxBAGz/s=
X-Received: by 2002:a05:622a:1452:b0:473:88e7:e434 with SMTP id d75a77b69052e-4801eadc57cmr21800331cf.14.1745610334225;
        Fri, 25 Apr 2025 12:45:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHBMn9Y+Q3/QKqsAdN0ymIzhA38kSGeTKsCOv88eKpG69zK6HEh4pdNVXq7aJI9uMOK+nDotg==
X-Received: by 2002:a05:622a:1452:b0:473:88e7:e434 with SMTP id d75a77b69052e-4801eadc57cmr21800111cf.14.1745610333853;
        Fri, 25 Apr 2025 12:45:33 -0700 (PDT)
Received: from [192.168.65.156] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ecf8ca6sm178331566b.118.2025.04.25.12.45.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 12:45:33 -0700 (PDT)
Message-ID: <89f431c2-1b1c-4c83-b45f-68afc1a974ac@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 21:45:31 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: add
 retimers, dp altmode support
To: jens.glathe@oldschoolsolutions.biz,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
        Jos Dehaes <jos.dehaes@gmail.com>
References: <20250417-slim7x-retimer-v2-1-dbe2dd511137@oldschoolsolutions.biz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250417-slim7x-retimer-v2-1-dbe2dd511137@oldschoolsolutions.biz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDE0MSBTYWx0ZWRfX5jPjkoU7KYq9 YF+DyecZXnHDwfVTeVdf8PkB+2LyvvKJgex2CqsmcpkDfZwdRAa6EQ5DNxsC8nt8uPKVpe+qjiR SmyxDTGHdwaaQpaJom1ukNOgLXoq7sJimGPoRh/JturQGCwWK8B3GN9RQQ7VYEAHYJfYTprA4oO
 I3sIcS6UtjkgO4V8JiSr7TY+m4qhAhoHnnz+NBbkI9tqLG4PKtnszgca2gvqHjZECrte4S2OGdG 65RL7XlRYNRhfaruWmV42vvThI+DR94x8UuBFw+NyxRIzqCDy9I5rzSZtVVDPgFeGcU4/UF6PtE KdkkoKuv27RoDOn1IWaq+m1ij/NqYtxdGnLipZmH+BzZKfXT0LspyGwcPvuukEPds5fsUAYRp91
 xDfLkWOf/f7ZH/3A9fxnAukMCHx+7kGQlfUSJVh89CFYXIoclH+ebynDRs+4gqCuevDhZ+al
X-Proofpoint-GUID: itXqVWlp1uFD2dtIdUFgnZDgGN97qAi0
X-Authority-Analysis: v=2.4 cv=ZuTtK87G c=1 sm=1 tr=0 ts=680be65e cx=c_pps a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=gxl3bz0cAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=70XoFFO73b3tUdKEuYYA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-ORIG-GUID: itXqVWlp1uFD2dtIdUFgnZDgGN97qAi0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 mlxscore=0 adultscore=0 lowpriorityscore=0
 mlxlogscore=999 priorityscore=1501 malwarescore=0 suspectscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250141

On 4/17/25 6:35 PM, Jens Glathe via B4 Relay wrote:
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> 
> comparing with CRD and other dts for a more complete support of the 7X
> only retimers, gpios, regulators, dp outputs
> 
> Tested-by: Rob Clark <robdclark@gmail.com>
> Tested-by: Jos Dehaes <jos.dehaes@gmail.com>
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
