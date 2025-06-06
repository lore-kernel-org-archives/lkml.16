Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B363610E0
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 00:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749168827; cv=none; b=bc4JXYJ5Jko3QbtGWUm+W/pLbiAz6+r0xACfEZbZMbUVdDaqtC/awlfJ8ZerBD/treVBwDURirBMJXabFmxz5HReBtvdnieemXWqFWU3d/ZS3lgd3fIDaz439z40pFugiR9zTyeiPwJWMsvCKuaw8x6EXP5oRACTjeEZLkBbT2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749168827; c=relaxed/simple;
	bh=1ci5R2NzDGs9Zy3z5xqfBnWX5eSyKx4GjoIMRSFtd0s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=esaD2Q+ypPoG2dP5XL9FM8xRy71p+FRgi6D6m8fGFjRgqTQnPQfcMsAWhPzexYRT4Fg9cwSIEdXQkWTVcsGY6Sfzu+GPzsxl/GJVKz8L80wtyP3haq8Ze7TaHkOCAUBviKTl2NqmYavOpAgmzlchP3ef5zmT3lMz7dRFg3x9TSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fGFFdSHE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fGFFdSHE"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 555H1BKH027543
	for <linux-kernel@vger.kernel.org>; Fri, 6 Jun 2025 00:13:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qKPeT7PKb1fxMnqUnO72Yv6GpwFkb9IAXywrH3wuK+I=; b=fGFFdSHEGNUdEOoH
	IvVwuSZolYy+p0nCQqjaGvQ29U3C77J8ZYRiBr73E7OWIlsmtOdaOM03xc1CDz4X
	Dj5xwJlmhAvoXrSoFjR47aKQOYJNOcjcqBCG75XhFQCC8FzP5NSvBjyObMtFDvfg
	1AvIJ7Dr2najsGkQF0HBB5qzkubdibAwpfGnOvyy07PSTGAicr/P2LasovSernuR
	gAsC8HKH03jtMamcbfVm2AaiAW3c5UHBEEmveMZ+rqhl0Hcs3UDwKTXG/MSKVw+x
	VDei3E1AW/2wFOkTOcITQE+CqE+R7+SyqveIfinEQwiGAxTjpxtTN/TGDChilDAx
	fNGhIA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8taxjm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 00:13:44 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6fabe7822e3so2778986d6.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 17:13:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749168823; x=1749773623;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qKPeT7PKb1fxMnqUnO72Yv6GpwFkb9IAXywrH3wuK+I=;
        b=Uj48mHKfs2tGQ/uDev0uIuepq41F1yak0bbMsCQAse9lyiNCJ/C2zDol194qIKFq2Y
         al878BzWAWr9schAGLrVN91vwTQXg+ui2xsWnKlF5MRWsFhrbE9PQPpoc+Z4sllcqus9
         3HKlZgWB6bddfsKr45EL7HE5ghUtx26UTP2Lo4wRstRrEu3P2NSaQULe8NNFJO/sV3/x
         J6zLmBnX3C+Sr5ie5x6SmyMt5NcaUmfKx4gElBLbmIxahNiPX+b9Uv3Jct9WKMZXT82D
         tl/kFHS44jGblUku8gE1EAMA658KpZElU9/+CQxBtmR6sWytCASsjIXCaSXao4VtGTEU
         B9bA==
X-Forwarded-Encrypted: i=1; AJvYcCV7FZ5qdpnkQrW0i9mHHOar7JGrMYLr1Uhit/XYHz3uQDjiU1BOGKEeUEn7mVhqaH0fembPGiRdrVWL3Bo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEyuueKOiC2k7dFnZyb3XAg174QS7aIgbRIOdd2l0/PGoABrTH
	xUeRLipoBi32lTileQSkNZM+Ok/Bt+nDBzgHdLttfUmPvY2mzpDTbGAxyH0qiU3AFg6Q978+uBf
	WRPz+invP6vXFhFEdwbANFPPDryjalYQtNJXmgCIwP0R6tgbpbkiaVTSNt1hgpk/gpOI=
X-Gm-Gg: ASbGnctCxVeij0TzQtQTIOKSoRolg7ko2Ed+bi/D7EQXusbkjlD4DyHooApqfc/Zrtt
	akv/M+/1+R5YB7cBP9qv3n5AVlBxrhrLqEuL6633LLhWf/oOulKRvuuQ1Hv2IDtkbq9ny/qgSB3
	oOVF0hIxefeCbI2MpCJNxSTMIiDvlGkWD8y+g5IiDv6T9IbwV5tCYAKkpQCrIjvp8anApH+nIod
	PG1JrmulfhKbesFKVKT2Qbrsppo6q/HAz462ogfI3ErT2gVcASpxwPV41KlZiYOYCs32d05+kTZ
	mww+/gKrTsMoh8swHKqo7IeotXDgThod0rAu/r5R3hoUrLux0UkWEkmMlekWNHrOdg==
X-Received: by 2002:a05:620a:3949:b0:7ca:e519:6585 with SMTP id af79cd13be357-7d331c4db9amr14443885a.4.1749168823028;
        Thu, 05 Jun 2025 17:13:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE1I88zELlFQymDFktqh3nqMKdf4ODb086uhCaONDMfm1wNpqDjMf6iaqOMJPu/FfdCdrxBuA==
X-Received: by 2002:a05:620a:3949:b0:7ca:e519:6585 with SMTP id af79cd13be357-7d331c4db9amr14442985a.4.1749168822649;
        Thu, 05 Jun 2025 17:13:42 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1dc383aasm30038966b.122.2025.06.05.17.13.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jun 2025 17:13:42 -0700 (PDT)
Message-ID: <c6256bd9-1316-4de8-a31c-cec782220b0a@oss.qualcomm.com>
Date: Fri, 6 Jun 2025 02:13:39 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: defconfig: Enable Qualcomm CPUCP mailbox driver
To: bjorn.andersson@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20250605-enable-cpucp-v1-1-111ecef7e4c9@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250605-enable-cpucp-v1-1-111ecef7e4c9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=eJQTjGp1 c=1 sm=1 tr=0 ts=684232b8 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=laPIkmKxayIJum0PPccA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: k4sB6aEH9q4p6UlCTlMSiYD45PlYZHEh
X-Proofpoint-GUID: k4sB6aEH9q4p6UlCTlMSiYD45PlYZHEh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDAwMCBTYWx0ZWRfX6dcf8ZeKNr+2
 8HSteqef1Fs2L/RWeL9OPHHE+mbKyES+Ih1tuhdoeml0kYORFIP4xinAieXXfAOEv20D332uINV
 O/1ZXlud+SbuLJTo9mR4wc6Z20uP3B75m+L2mH1rN0oTy2Kcw/kKvnpZscdyuPpSmtLLL28PYPi
 xcc4LaHvlsATqYcaG3DjMcI3wGQUEOm2+CmFYm6t531rGsN9IpDCC2mYrMxQtJc3bAhRzc120dQ
 vJ0PtLuZKCREKU0PkmrcKVrQ1Zk9VzrU7r0Pu22VSoHlANlpMArF48pVmuaQzT59KYE6WLTUusC
 WMMbBogpsLlira4xdwhWzrFcFStFvjzEb4rqfNIC2ndHsZ4bViccX12L6F6CfOaP+P9kLD4/DXS
 EYwCWazzcaPRKzoJQd7CVQfEIcN+xZONgWKb0afZEa1VVy9u/U29L6/QL5EzmL7Koi8Okbq5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_08,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 mlxlogscore=954 impostorscore=0 spamscore=0
 phishscore=0 mlxscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506060000

On 6/6/25 2:06 AM, Bjorn Andersson via B4 Relay wrote:
> From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> 
> The Qualcomm CPUCP mailbox driver needs to be enabled for CPU frequency
> scaling to work on the X Elite platform, so enable this driver.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
