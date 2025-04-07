Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAF85227BA4
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 08:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744015254; cv=none; b=QZrcsX55LaO453GlkuOXBX3Sip0x2R7BIzKwDMCE9Y0bfQLcsHXgG0Tt/XG4lfVqsGFiLz5cqe1ZyZiJWIGO4GxXXKx561f/zfmyDLVJhO90OqM6RNzAfeL0AJ0bEAC5yiYX+HpEAcKDH0DlAsCl3iXga+OSfxFbosiDaPefprg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744015254; c=relaxed/simple;
	bh=onZLseSQqRpgk7xz8fY3EmUBMLegLFqoFajCvjWiZiY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZpXyHC1g7b9fjuB65sNuwGjJJxiwpeWnlaMHTibw2yMHkQJtk9Jj/UH1GGXJQJvsMP+h9DX6lgaiI6NNAAPfrFVOPnJ6bPzGHrJXx+FqrFK3hVn321Fb7zfXBdSB7LLu6k5btKoJQQDiOresnHgXPcMKF17PlZ0pCt/JwS/iXsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VOIuQ/Fg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VOIuQ/Fg"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5378dkP4022388
	for <linux-kernel@vger.kernel.org>; Mon, 7 Apr 2025 08:40:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cwWO+kRWwZtdaXCwtTkeE3DeChgwl5XhdMAVcSTTaXs=; b=VOIuQ/FggEfjWtaZ
	sbpFY8lSiISTDqAh4/iH33p9nKWCwqBojDZncXN1d7lKC/GMYMwaN04l8YuciECG
	Jz4PBjMNxhhHexDA3eKwcl1UcPXdUUBwJ60CPvb7THSMneyBUJCGeOCNGWlAOP1n
	5iO8NsydiQmiEBdLeRqHbzOe+QLDL1d338LfHCLGikqROvO5YeKGzW24Qds+1KgC
	YqnJPzCxD81xNfyDaRnFL8wpQ0/gE34xXzUVxidOEmBFzXZpuyaQObJ+9b9as7Xg
	KSvH2+hloaN+vWc+S7HSD2dtiBNiNgfbkAaZliM7RKlwyzGUoGJrIuWK1uydZlNw
	etar+A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twcrbknu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 08:40:51 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c54734292aso102632785a.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 01:40:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744015250; x=1744620050;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cwWO+kRWwZtdaXCwtTkeE3DeChgwl5XhdMAVcSTTaXs=;
        b=k9GoVMmMRla32OxQ34FEuN786l7dus/M1ZsR29K650cCeF2zVk8yjI+aN8DOjp+dVc
         mC0AjhDL6yCJIJHiAXJ3lYCRfR6HVqFrQIYnFr9WwTUkFllv7TiyT2tZZ+aOE5aBncA4
         wRSrNsttrwxzYNOlnhTmlJToAF7mEmmi21oxieVHWKxIlcY9b9DhdJgrd/p08BwNUlDi
         +UQHIkqE8uqb7gYw/rukXDNtX6ass7QWxF9eZOpQ5E7S/Hg/QVDGKBJU73rsB7xTQ02K
         TYkVRJwEdA8R+s8pNFCorfI7mriCPPaAPEwBL+rDqLptBjoXtXvaZP7TSx8QG0QjwtJ/
         oTGA==
X-Forwarded-Encrypted: i=1; AJvYcCURMBU3WkGtuY47ftDtaGeOKBHIwbZ2IRn9RPES9x0nn2wcq6+n9u1q7n1AaHY9wfvTBI0M2Cnj9/ZDX2o=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJ+QqmK3g5wAYyoMsPcGSt9VyO6yCU6fLNOvzyey/fJypB7V8X
	OKw+qCvQ5/Pgm8KbXugLH78WMUUO7/UlfbYvTofInHVwrGbW7/QyN3zrUzsmjhfPRLMAr3VTY5F
	m5v2p6wMUHtnV/7K7AGroR+MRHM7ILoUpv8jzyX1dRm7ArKXA6gz/KX3fGNDiv1w=
X-Gm-Gg: ASbGncsKyj1/HMvgzoele/mywQdXiv/P3Hp9RJPXKzMRoKPsgtJCPjQljOxLe0GN8dV
	lqvaKhM001wi5VWYSu0DdF9HFHINbe6e2SWJA6Qv2VVuDdlBtfCRJtLcRmFAhlsG0q2v7tD7YWr
	u8lBKv0A35e/0Y/4CT8HarZocDtqRZ7l993DNgJRCb1fcbCmGeYD9kU7lXCcsd8z+U/V72NHeWV
	lU0Dn+iHAlNEvKXFcXetxcxRZ4aowskFnH5N1V9yk1RcNBVqGf753Sh3LtkaS0Mbnr71UNzu3jP
	Qe5PgCL95402y2iubww8EtOVHfgwUUjpt9d53wEw5gmWzEPc6q7EuhW3Ew4bmqebhB2AiA==
X-Received: by 2002:a05:620a:2849:b0:7c3:e1ef:e44d with SMTP id af79cd13be357-7c774bedaf6mr590207885a.0.1744015250611;
        Mon, 07 Apr 2025 01:40:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IETuFZ+vsD5+Sv9K/PkFBkn5sgkSbEsPdKQDRnhPrYiuCM1GOPeod7sM/VUOp7RK+3maRUJxg==
X-Received: by 2002:a05:620a:2849:b0:7c3:e1ef:e44d with SMTP id af79cd13be357-7c774bedaf6mr590206585a.0.1744015250316;
        Mon, 07 Apr 2025 01:40:50 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7bfe9ae46sm723668066b.60.2025.04.07.01.40.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Apr 2025 01:40:49 -0700 (PDT)
Message-ID: <0c374a5b-b2fb-410f-9d2e-3b42e8eceb0f@oss.qualcomm.com>
Date: Mon, 7 Apr 2025 10:40:46 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sdm632-fairphone-fp3: Add AW8898
 amplifier
To: Luca Weiss <luca@lucaweiss.eu>, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Weidong Wang <wangweidong.a@awinic.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250406-aw8898-v1-0-58a2d554693f@lucaweiss.eu>
 <20250406-aw8898-v1-3-58a2d554693f@lucaweiss.eu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250406-aw8898-v1-3-58a2d554693f@lucaweiss.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ILMfYnBJYWbnMCVGZPiG-g73Rv7dTuUy
X-Authority-Analysis: v=2.4 cv=QuVe3Uyd c=1 sm=1 tr=0 ts=67f38f93 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=dlmhaOwlAAAA:8 a=EUspDBNiAAAA:8 a=RC7kgf61jvLRIQ5xqpwA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=y4cfut4LVr_MrANMpYTh:22
X-Proofpoint-GUID: ILMfYnBJYWbnMCVGZPiG-g73Rv7dTuUy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_02,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 spamscore=0 malwarescore=0 mlxlogscore=835 bulkscore=0 priorityscore=1501
 clxscore=1015 phishscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504070062

On 4/6/25 3:03 PM, Luca Weiss wrote:
> Add a node for the amplifier found on Fairphone 3, receiving sound via
> I2S from the SoC and being connected to the speaker.
> 
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
