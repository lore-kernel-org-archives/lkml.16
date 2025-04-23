Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 824E87404E
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 13:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745413375; cv=none; b=W81bHogvalYDf+E6Ielor4OUP00JKqrMvpKmP5cQqp3h25wBhQSIbkWjRcYGSxtDIEl/WXG4yUpIWSfiyVP57dLHhtqhitJ/+M01eTsh4O0Cgfdnn58m0lvJmLBEDk2tJPqBtTv1E/pqRb58yd39zFV8gcJr4S364f8o9TIqcYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745413375; c=relaxed/simple;
	bh=BnvOXO+boD8aoX/yVyEiclGZPfk5b7M+Q3WLNEqtKXE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Rn7gdaLIP8yToAue2Bz8LCjhx73bhPvopj5AWOXbfVJgs1hA+zWK4U8ueBfExenKsqnmnbBS/7GVr6w2qwlfWr1EM1TWRyZZeK3jUTd5cZTs0e+NIkgVJQLEF8QVo2LdPrE1dbZP68Lw3usMS28/vxpYZeUPlx3HfHCnkTwJQzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CvHBibE0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CvHBibE0"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NAVHgH015748
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 13:02:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zfAVF+aMaiSo/7Us8CKrNfv3JkPdUAHjwZh9PyIZpAw=; b=CvHBibE04Ca2Uz9v
	lsgtR5XjledecTmtOP1xlkizF62cGjd1jH+g7A3Yadj6RK3aVxGiXykOBBWGhaal
	+oqEAQOv7l7jkwq3+02kMK91m2MxE9dt5XMEjpVTTL6awk9nY7ivOibVfqHwhzFd
	ygEFR7YcHzzT9/2OxV/G/7/wiyB1Xv5Be2f32ord0ohi6v9Llr682/iodh6WRS5g
	UN6L2glMhMHXkkEPRIo1vBwfSky54vZ0uj8cN5oI025R6VzUCutVd8LQqIB93d/y
	bVj7JGyGpHZpF3wkhj5SkmbudItYqmvSFyWEdsQCnE3+R7WaDIggDXZobQv37qJI
	K2zi5w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0j69u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 13:02:51 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c545ac340aso37978685a.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 06:02:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745413371; x=1746018171;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zfAVF+aMaiSo/7Us8CKrNfv3JkPdUAHjwZh9PyIZpAw=;
        b=mvWS33f2dvVRbGVuK5XOZf0NPSWzqAeU2HJnxuKAOQx2JbjnqK/D6Pg0IHCZrA3mlG
         sTjU50nDfC1JUHT1dZpai7oSmx4uX37tHk/+k/dDQTOS4775a572yIExIZei2h3SgHqI
         0LONc3vmwElmH7QamfArY/QiznhETFHZZF4CLfR0ig7sDHS2nDLSLTZCm8vQknE0Hprw
         5r9fFGLniq0v5He5Dj3NVQhJ4bVOPPcZuGBoMP97UKqxxdTtYYdQC15ZXg/3n2/wF5gy
         snGdgf2oF6PV2bweG1EF/tN2prBEVRiewM+8DXntklgmyaAO9d7bJJ8sY0QHRIEb8Lxp
         606A==
X-Forwarded-Encrypted: i=1; AJvYcCUdqtays5Pqynz/zHlBzFxWrKIpdqxfPEBDnz90GsRZ3ET47TsnueeuwmW8tMu2h8noXKb84IRCHcIwcPQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwErPnXDRUcrJZkQ9kqood6XKZuX/45CfMiYuOb9sIqIUz0TXhM
	fKxsV1xeiLZLgTHpPSKAkcG4VuGkjMWBqMWzjdHiOn27N2R+hzkia9y2YtdjoWdpSv0ZDOu846o
	W8oH0XmHygYn7ErRTiojItHVuMzhHw+SaOWiw4OKncEeFJSApNJ3AypK5ZVgFn+w=
X-Gm-Gg: ASbGnct6VzLJlNu823/CV707xuLIS69XSgfYEBRbXLsd2GRg3EOv1tqHAntxnAJ6vZo
	SS3P+TXJ76iwWYgx8jOXUcY16rFcVKOpzFoGXxEaB70aZHuJtprd2H5VNl5ua+ujoqZXFZc/zFq
	fqmHRPNbQzSzNxwSMQ7UVmGEK4ROdYYH3V0S09hWJKwCBMYQGcMGv0MS6lTwJtt8rdRnkYO0Jdk
	4n+/Ih78pBAiI3Y3e7jY2xsNxwDuDi+cy2GPVNx1/ehrJ8WzRmxDntq8xWSgdty1SmUzuOtxOFF
	rn4sXyVq/n6JpI+G5K1NF6rCA3dQiZiNPc1RNpmRA86T0cL5fiWUyUhefiKklsvCQbE=
X-Received: by 2002:a05:620a:17a1:b0:7c0:c42a:707d with SMTP id af79cd13be357-7c94d32ec56mr169898085a.15.1745413370764;
        Wed, 23 Apr 2025 06:02:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH/ovwutEM93izQp2u3D8TlzNzpz5TZzJ2ihH4iRdeWJCL9e6H4/DMIlsm5XIOUTBCuAmehFg==
X-Received: by 2002:a05:620a:17a1:b0:7c0:c42a:707d with SMTP id af79cd13be357-7c94d32ec56mr169895285a.15.1745413370184;
        Wed, 23 Apr 2025 06:02:50 -0700 (PDT)
Received: from [192.168.65.183] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6eefcf37sm805661966b.97.2025.04.23.06.02.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 06:02:49 -0700 (PDT)
Message-ID: <2dae7d88-4b3e-452f-9555-05f10b42dabc@oss.qualcomm.com>
Date: Wed, 23 Apr 2025 15:02:47 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100: Add GFX power domain to GPU
 clock controller
To: Abel Vesa <abel.vesa@linaro.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>,
        stable@vger.kernel.org
References: <20250423-x1e80100-add-gpucc-gfx-pd-v1-1-677d97f61963@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250423-x1e80100-add-gpucc-gfx-pd-v1-1-677d97f61963@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: y3wGKjWApA5dfgjh4PsQryxRb6kGAsWI
X-Authority-Analysis: v=2.4 cv=ftfcZE4f c=1 sm=1 tr=0 ts=6808e4fb cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=O4X4kKYYB9jgRp4dNnsA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: y3wGKjWApA5dfgjh4PsQryxRb6kGAsWI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDA5MCBTYWx0ZWRfXzm3wODBnGQaB +9iZOG3otXB+V8V3My8DfC/YRyMC0Bu9Y6svA+P0vP1RH3fQ7ZsO/H5JS3vrcwCCuit+lETOQK+ 4jVkiBkMNOnz2GlIkzkW0b1QF6wApAYS6fol3auyC25tIkcvdJN5hTJJNBvprgoxaIIwYnf3/DM
 qjZNxVXpPhPN0GWOQDg45qU0Mr8COdPmvSjdkDJ+PBcMLaw+58UhzkpTeuHVyaz9p+H0yI3+h3v shk5RHEWkeQBXTlxmL1YrXxyrz8emNn5RsTCRSAW8ybf2usvijIq4FWQlrGDqQNDe29xHfuB8im MnEcJj93YAdKwUOzYuPP7lxDxIsFFBI8OfNazoJXo+LsIOOoSGqIlbx/QH2bN6JHr72rbTx005U
 UMTwy0y6ye2JgE52UxFuUsZfTpAFpPanA2PozS5EJEo9YU593GabLqiHY+dBO0ztcpwTDK23
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_08,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 suspectscore=0 mlxlogscore=999 lowpriorityscore=0 phishscore=0
 malwarescore=0 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230090

On 4/23/25 2:58 PM, Abel Vesa wrote:
> According to documentation, the VDD_GFX is powering up the whole GPU
> subsystem. The VDD_GFX is routed through the RPMh GFX power domain.
> 
> So tie the RPMh GFX power domain to the GPU clock controller.
> 
> Cc: stable@vger.kernel.org # 6.11
> Fixes: 721e38301b79 ("arm64: dts: qcom: x1e80100: Add gpu support")
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---

You shouldn't be messing with VDD_GFX on platforms with a GMU.

Parts of the clock controller are backed by one of the MX rails,
with some logic depending on CX/GFX, but handling of the latter is
fully deferred to the GMU firmware.

Konrad
