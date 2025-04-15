Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34D142957AD
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 10:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744713975; cv=none; b=HxJCa/PM7J3Js5lf2tRbl3aWgxS5KCVsU5Vmot3w4XgVv0AdMmuUwa0e+bwSLLEeUAPsM6BgqqptZdEf2QnsAPXgt8L+gKx/C1xzH8OleSG2E9avRkOX3fFMW+vOfZTSVfbLD1zdnIcedOtNfPsFqS3FjeIF4GzQyqRIMAtkz1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744713975; c=relaxed/simple;
	bh=PqtFIuf2PaqgdiInwLbpBw6+hS8F+gVD8HwKtn8pZqA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F+pdONtfj06G9AiczZfjbe9UCJPFRC34RKA2OHOvM4aiw2vHdUAqCHziDytfDlM5OPgCmYPn80Mwto13V1QZ0hlAPPyoH9u0GiGehqF/bBCUVkMGbFx+3JOJul/pYFjeT7mPM3/CRN0p5Gw/3Qo2T6pUqgIWe3ocerFfLMTcMLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g8ypdxxp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g8ypdxxp"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F8tCg2022972
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 10:46:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i+0K8i6mH8nJR7NC8EwJps6/hl4dOeR4gugtJgCdwYo=; b=g8ypdxxpr3LV8Um3
	Z/ZyuAVLK3BwY/L7Bj424vcO+BkZekjQN0kxu2qN8DSh5rpkFNZ076bXxkHLBbf6
	rp3lNreY6vQY+AgMOmZzBU1IF7wKUUk1+TKheS6RXwqIew8GkIcWS8fuTNDSTYMT
	L3/pkBR5StJqWlF2oKYpt5QyGV/b+hyKV0OanI723hme0h4KK6WgJpGnXAZ6SapO
	tyGpFSdOfH1aNeuOnG07F7spmrSMd7GBErQUvHfPnpB4dBBAo/kv/4Gn9O6N8Tbx
	VMs4WJXTtGuAyGUgsb98tZskjU4ythVGdpvbAPSDZv6tUVoSQhTfEcEpiIKBHuP5
	n9TAyA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygj97qc4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 10:46:11 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5560e0893so45732085a.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 03:46:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744713971; x=1745318771;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i+0K8i6mH8nJR7NC8EwJps6/hl4dOeR4gugtJgCdwYo=;
        b=PcAMwHIgLl1UVSBHLIvwop6/e7QlaSVJpEXeerV+uKq34fSdscLn5KUbP5jbDblYCq
         iSmHDLdLHOctFux2+tBEx04q3Nt8w8XC6SXR7As9fEgNk2ZOckoLshbEd9tshMGY6QN2
         eO7XJlE+yRiPWImMVUfpFo1efk9OLa8hcH+HA6WfXYPXNJ+BKQsQuB2pOYfPSSsx5VHY
         +ZZxCw4cb6hhCKfMc9Ldh6CzcY/lPocJ6ffCe86Lcw1YWHEGdChdDY3W5Jtxn9K5CP1n
         G92ftN6r6s4r8Te1Rci48MgBxiejyHWlKQSOT3C4CwyllMT1eiezAvoC4X1pObAqDhLq
         shaw==
X-Forwarded-Encrypted: i=1; AJvYcCXyChouKn6o5CKTZCjxllmFYVJ/yXklSgDO/RIoBq+Wfnc2++pHzt1AWuYTtz6Ux9vNoTR1VSJ7OBr+uBI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMy3vOudvGOnfQruTHyHud9zVYMe+HLkXPJU/KbCW0ypg1uNlt
	jmPr7sfT5eJRofEwwJJoTBTBFTaSi1ViTAZ3IQ7GTHHUemYtNCKPnobH2PrDhOA7yKxr25riGhr
	/WpmK/C3eVQhOCVgKkmEaQhPXKVzTHRtoJSKZwwk7rgPBdJvJfMOY2DQBbWrdiGs=
X-Gm-Gg: ASbGncuPTdCi2P8FbDRez6QZlnnyMTjaUNJODPtxs/+eSCg4cZqqxZbyF/67/fhc0wB
	IDP1icm6LX4PM8NyyioA3mHCikOviHeQKk4S7VUcVa/wcmm+xCt6yQ+B5coAHJEFbfVf8OxC8q7
	8fWvXZj/lOtdsGiy2Tf/PKwoWvaqOfwannzZ3gWEqDof0w5ooXboJDIovDI5Gj1tAzoSkjlTmRf
	dxUFcOX0IHmPyhslAoHyL/goUOaZ1wYmTf/WYLW2vBi7ntjytn9jQNsFXIO1Qm8iYrz8wT+dwD/
	pFpwuv+yrYfzI2W9keqwaRzmKKUxkplZZjI9bYDSN6c2uJrQQJL1lVXm62ecFl30a74=
X-Received: by 2002:a05:620a:191b:b0:7c5:9ab7:3012 with SMTP id af79cd13be357-7c7af120d6emr750532485a.11.1744713971218;
        Tue, 15 Apr 2025 03:46:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF94xlvxWc7th9BIukblM0D03IKJZK7WDPWripk3MUFqtFr1YK/7gv/MOjfx8f9zKnGkVZCXg==
X-Received: by 2002:a05:620a:191b:b0:7c5:9ab7:3012 with SMTP id af79cd13be357-7c7af120d6emr750530985a.11.1744713970920;
        Tue, 15 Apr 2025 03:46:10 -0700 (PDT)
Received: from [192.168.65.246] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ccd69asm1060503766b.159.2025.04.15.03.46.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 03:46:10 -0700 (PDT)
Message-ID: <8f0dd590-69d0-45f1-be54-c5b595ebdf81@oss.qualcomm.com>
Date: Tue, 15 Apr 2025 12:46:08 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/20] arm64: dts: qcom: sm8150: use correct size for VBIF
 regions
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250415-drm-msm-dts-fixes-v1-0-90cd91bdd138@oss.qualcomm.com>
 <20250415-drm-msm-dts-fixes-v1-15-90cd91bdd138@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250415-drm-msm-dts-fixes-v1-15-90cd91bdd138@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 0Z3P6qyyLwvuQqXbNntBf03mhM0tPRDe
X-Authority-Analysis: v=2.4 cv=PruTbxM3 c=1 sm=1 tr=0 ts=67fe38f3 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=da4WsfccAxvekxWPt1gA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 0Z3P6qyyLwvuQqXbNntBf03mhM0tPRDe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_05,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 spamscore=0 mlxscore=0 mlxlogscore=633
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150076

On 4/15/25 12:26 PM, Dmitry Baryshkov wrote:
> Use allocated region size for VBIF regions as defined by the docs
> (0x3000) instead of just using the last register address.
> 
> Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
