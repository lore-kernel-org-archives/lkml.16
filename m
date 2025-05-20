Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25C37248F46
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 16:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747759481; cv=none; b=KKnp03u85TlG7o8p0vXOn5WfvLF7MKL9BWlSPQ5HgYs1Q4wB6sY4faoRN6K640f8XDVBY7jxEDUQwdKubo3eEYaKyC+kFT98lOMHrIAIyMKLaEw18dOvHUD/QX6nXjDYdNizpSZJf5ygH1SJiy3aM2MwTfHIL6UG2snbbYW5SSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747759481; c=relaxed/simple;
	bh=I842f8QC/KMfYaWpLg9cY6lpFSAzcGFG5grlUZY7DNU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ceUVPct/PESKs788o/j5OoXiMnwCGErCCzFVJfkJCtsiznZ3kqcMHKnBrW1It3NSLRlBaghUpw8TjaMcCLQiu2XH7SLB+gZ6LyPEUHXg9W5ASAMlHTldUfex8OLMp6SrqqFhB4/bUv8nr1MMRFIkSGf4NQNmscT/sqeNAs84UAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KiEKW9Dm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KiEKW9Dm"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54KGeDsf018394
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 16:44:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c2Cr0Q3aujptwyPPP/18wEcr3RB2aPvaUVraUjgKeIo=; b=KiEKW9DmkbNJnmvr
	vMjxlDtRo8r5fXRGGWzTBX04jtarGLosI/E+U2UD5kTdezwZwdfC6SeVORsmKP0X
	suf+Xf6LM4UoZYqwNZ7n5/WKCS9wlQuYRQGAkKCCTc66pqOjPCaEBt+8jLCsIB1+
	M1O9P1WnWhahyt/4WqEbjhFXwW65SRRCiogj47qj5vFid5XwMKc/nlM9wm4dVcT7
	EEm1w/pQ94qv/gWowM+LfF97uuQD1mVWeBZi1BG8U7kufy887DNIUA6L9reb9FfE
	BF/XJO2fEb2CAbXbsAhP/qAhoe0nDnTh0bMQAHa8Z2LkO6UlO4pJydCKu0x1kcXp
	r8Cmnw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf9r0dm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 16:44:39 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6f8a8883437so7569196d6.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 09:44:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747759478; x=1748364278;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c2Cr0Q3aujptwyPPP/18wEcr3RB2aPvaUVraUjgKeIo=;
        b=jqBiSQovbs9tmSJkPvgmLAFzHq6edCvr8r9dJbJhJjhWwg/dQyeoujCEs1jGfg7cYJ
         qeIKmgiioeZomyfsVzphdzsPMPg14/n5uovbmUVle999t1GQsGH/9CKn4gNj0X4/RPSx
         Wt57DBRTvGpIwHPOd6eq2c5TUFVNP3cjeA3EqRF1v3ZNYvby/hl11U1OIA93s6nUK0+w
         QyvHgrreb5N8EpII6M2Z/0sM5XnBNk+84gGI2IcimEugEsFkQVxNSO/CioUPUqfped3p
         hUfhqTtVZZVgYD1HL2USph7PF0orYNRE9LXCY5rGgtpQvg2M6yzxZnkuRCsigL171/MK
         L+cA==
X-Forwarded-Encrypted: i=1; AJvYcCXyLj5ZZWtCq4bhRH0g73THr/WarG71j5bbeGZ3Cnq5Ey0LzDSX1s6Cf6cv0y1+XR3VQqaLqo9Eokt5ZAI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxkUYE55sw7lDJg+jzll2pHuoOt4QA66W6lLB4g5B/wrCl8tTN6
	Vqviu4J7mkahIoQPuMNsM2o4cMh2m9othvIftcMDQPb4d6s7m51ALkEhzcyZUfGQPHsP8vA6k2h
	GgTY2mo7JXnhN9CWbyIQ8RQgRNChRwfczqJLO/YNbNSO+UDrzZ3/kBLAFPgLmU82hKrA=
X-Gm-Gg: ASbGnctKojOyRicFUXqeGb7hA3T+amSo9bezxP4+HuJlGlZpsWoqpqnEZdCMOkXm51L
	aqURtX13mB3JCqxYI8RoJYfM2zBdnmf91KtWUbT02Y0EKJPCpneV9UM00N0zUMeFnvV6bVO4eCv
	FTRDuGNz/4uAxbtxF5EQLQaAT4KkgPxcSPcyWcisqRekzja3nrshu3YuZfYUlNWvHIryPyICMtj
	aiWtFlkSyRVBP4tk/+rnFzGOihGuT+jMD9WAFTE0UlLKfbcXQjbuduLc+t9i+DWCrKdDQ3afjrK
	+k6Y8wdG9Ppthn6NTVseObOQpzdYq/9zhP6boz2DS+IsWv346nK5o+OUr/U+ekJ8DQ==
X-Received: by 2002:a05:6214:18f2:b0:6f8:b104:4186 with SMTP id 6a1803df08f44-6f8b10441bdmr82991726d6.2.1747759477861;
        Tue, 20 May 2025 09:44:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE4a0OdI4aLpuBYrJMMu6xHS4MmAbVCMTTGLWKZDGXZ+g4jOZbXkvgeQMFRDEnmvpFkP5lQcw==
X-Received: by 2002:a05:6214:18f2:b0:6f8:b104:4186 with SMTP id 6a1803df08f44-6f8b10441bdmr82991556d6.2.1747759477341;
        Tue, 20 May 2025 09:44:37 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d442069sm762552866b.103.2025.05.20.09.44.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 09:44:36 -0700 (PDT)
Message-ID: <6f12b7e6-5743-45ba-a425-029655096f5b@oss.qualcomm.com>
Date: Tue, 20 May 2025 18:44:34 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sm8750-mtp: Add sound (speakers,
 headset codec, dmics)
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250519-sm8750-audio-part-2-v2-0-5ac5afdf4ee2@linaro.org>
 <20250519-sm8750-audio-part-2-v2-2-5ac5afdf4ee2@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250519-sm8750-audio-part-2-v2-2-5ac5afdf4ee2@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: RidV3FKm5dZsbBRT7toC6E_NK6OhwU8X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDEzOSBTYWx0ZWRfX1fPJchTFqPuI
 j1eaKeLl7MyYKBtiikPHssegc1ZBIj++ySfeMmOQHXYsdTbTLbHvCjk1Ntw2NhwPCfaeYni+/su
 LUFpbWBRkebKskom+Rwt1CVT9mkJZcLjxfV41PxfSEnzkCZfeDLuxCsBNW47AXuskQTrRf2ZWb9
 3EWzlpHues6Qa14wfz8Bq9hYtG0Ic4uyLFaHYtHGhv36gw7ZiyAebHBopAEDyZ5V9E4XwLvMwlm
 UE9cGpLci5WWBY0ACZK6/350K9Vkz3zzMspjlDwQbUjugLEuUX8kGMC3PZ+dk4HwGDikvxowuMY
 VqdQ+HZzwFxXkJFV06SAU9rSa5zuzKRNmnK+6vsK1RpLNduTgBrqinEXAvtuSw=
X-Proofpoint-GUID: RidV3FKm5dZsbBRT7toC6E_NK6OhwU8X
X-Authority-Analysis: v=2.4 cv=V9990fni c=1 sm=1 tr=0 ts=682cb177 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=er6kI1bek27KySCzKVEA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_06,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=910 bulkscore=0 lowpriorityscore=0 spamscore=0 mlxscore=0
 phishscore=0 suspectscore=0 adultscore=0 malwarescore=0 classifier=spam
 authscore=0 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505200139

On 5/19/25 11:54 AM, Krzysztof Kozlowski wrote:
> Add device nodes for most of the sound support - WSA883x smart speakers,
> WCD9395 audio codec (headset) and sound card - which allows sound
> playback via speakers and recording via DMIC microphones.  Changes bring
> necessary foundation for headset playback/recording via USB, but that
> part is not yet ready.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
