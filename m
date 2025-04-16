Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC9961FBE87
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 15:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744815720; cv=none; b=exQ2ih1v5jGBWif5LvEr+kC/xOxZ5xkCYyBe54E5q+pwRNF8k2EEuZwr2XJdS3MoUIGNDV+ZG55x554uVJG+hEeyjYKHqrBZKrwPyC29jJVrR6fL50Z3FwFrH4Pusl+KwKuD38pndfWTv+BbxzrwavqYge03r17rcLPV7FesHu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744815720; c=relaxed/simple;
	bh=q+pwn+mTg05s/EzUlLJnkTpgVmwJvA1ZdeBL481JB0c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MNesPvga9RxlL+7FdpN/V7vKrkdTmoUGb9O9Ut5lLT0aaWziq3hRpavTa/fT9G0i0APQ0Cr1rEG3zvr+Jphki2K9FrUvwGzfmzuypwIXatSMy7V+VWmXgFHIuVjjszBMr5jHvxEuo1yNwojbPd9CySEkGssdRqnQJN/j5Mj+eek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DKEN7RTJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DKEN7RTJ"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53G9mhOp025492
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 15:01:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OFYziKxJG8xVp8i/T0EL0nwln/WDTU0Zw36EWWYoZO4=; b=DKEN7RTJjU9VBohb
	anNsJDKr7ZDtUfG6uNu/AeBNJWGyFJPY5IhYhEiOiTXEAC9nw3p3gqeeyDr76b0W
	sN1vX86hjGt6GigKL4hpPMzMB+HFvnM/yDydln81AFW0JOowo3sGQjjpLJgV4oNV
	dSCDnL4U9RM/VAn+NXsDnw4DcKVZnnOTJvq6d/TOMGJoABXFOT8ERg9OGpASGmBW
	tq0jHEqGau+v9N/J7vU1DAUWcTV26HaVl6MaWkNO+7/ZnzSV7m6LGhKQlhR3uGGp
	2yhlV+EgVoKOY1i4Bj3Z1Lpz6Yt92XRJNV/l6n5kHjjd2s8C+42R3STnIwsTKmRh
	GFX6VQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ydvjc3f7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 15:01:55 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6ead1d6fd54so10007186d6.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 08:01:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744815714; x=1745420514;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OFYziKxJG8xVp8i/T0EL0nwln/WDTU0Zw36EWWYoZO4=;
        b=xPrFbdl5fYdOnK5E0rr5JlUjPUUU9ieM8qK3iw7o0LvJqBP3Zkv/u+WWeZnZIbhE9O
         OwlmA7lrFRWFOltzeVV4KnvLKUdAhp3Q+e3Tf8zC35Xw6ltMyM1UAlfUXyHvOWm//KPG
         ckHCvx2r59BMzdeDPuNXCyoGrlCiqHgxE/8HZSdHm7m1LuL2gJv/40EmvvTv1auwTJoA
         5tu+8B3C1iSZPDsl/zHIL7xNI6j4WaLu4bnC2cICxkwiwnTjEvzvYNxtcRakshcpYbkw
         HZDK2radQzE4USf26H1P14V3yuaCnm1DuasXj0VVe7l1kT8jby352sDnmQ04g9IBC/+i
         h3nw==
X-Forwarded-Encrypted: i=1; AJvYcCXzxDOciWBUSiML/odKZhVCXkMmmROA12N8SHdOryPEaL8G8H/P/0fPZ4lJ0Nz28Sl5KEUvHzaxYcNCTlI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNFUe6YBj7t6A/Mqa6rrxcAR6tfz/EoJLR3Bkc2jIL4nqmm84Y
	2bSlGaeQzIhjwnUCrI4OZVluHdra1ej4w7UgG9/qvmdABkmXNlgIQo/9FG6PbpLtXa3qlv794dc
	Wx5YXFC1HukUSvo/e6pK51a4Th/7bZ/QlupHDGTQkoiDXoGRdRIIiV8lO/THQIyLMLM4MOxo=
X-Gm-Gg: ASbGnctMayr7e/08Dy4IdyY7sehvmeZxfurAkG3l9i8PDdjmsHiZmgfyd1rhPoSW7QK
	KWpJr++6FkWhWCWnNAxf5ebW7vy6hxUTutUBnFxn+svs560njCVc+7sdzjHGg/SAjLzKVOEeesW
	l2eXTq0jgl8TUBWPG9PoOvQ4EvZA10G/JemzNj8qNbDe+hPfc7SLvj09LrDFO5C2UdAaZcpfSV1
	hkBtrtQsMxyYLtkN5aaIwuhY98MCFx8/I/REn7Sd8L3jKw01Abjs4YSNTQ5GlsD/zwlfruI/rE3
	lCYoACzRnB+xDZGvRYvtSt2QtkiR4s5jMM1l1Wy89xqDMkK8SmPaebk5M/osIgNkrGg=
X-Received: by 2002:a05:6214:2386:b0:6e8:9f7e:8116 with SMTP id 6a1803df08f44-6f2b2f5707dmr12167586d6.5.1744815714450;
        Wed, 16 Apr 2025 08:01:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELlRZxT4JGjUFMDcyO4UGKfpFEuuZ1EimZ1MIk+XizDS3GTqyqLgfM+L0mkHYpw7kfYzTbdA==
X-Received: by 2002:a05:6214:2386:b0:6e8:9f7e:8116 with SMTP id 6a1803df08f44-6f2b2f5707dmr12167276d6.5.1744815713910;
        Wed, 16 Apr 2025 08:01:53 -0700 (PDT)
Received: from [192.168.65.178] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb3cd6257bsm143250266b.13.2025.04.16.08.01.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 08:01:53 -0700 (PDT)
Message-ID: <9f09d4db-b586-4a9f-b15c-6cc2a8af2934@oss.qualcomm.com>
Date: Wed, 16 Apr 2025 17:01:50 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/2] arm64: dts: qcom: ipq5424: Add PCIe PHYs and
 controller nodes
To: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: quic_srichara@quicinc.com, quic_varada@quicinc.com
References: <20250416122538.2953658-1-quic_mmanikan@quicinc.com>
 <20250416122538.2953658-2-quic_mmanikan@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250416122538.2953658-2-quic_mmanikan@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ZIrXmW7b c=1 sm=1 tr=0 ts=67ffc664 cx=c_pps a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=wBC3ykCyNm9gZvjdBcsA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 345TCnK9kxrLqB5vivnOeQ5e4FY_y4Yn
X-Proofpoint-ORIG-GUID: 345TCnK9kxrLqB5vivnOeQ5e4FY_y4Yn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_04,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 phishscore=0 mlxlogscore=949
 spamscore=0 impostorscore=0 malwarescore=0 mlxscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504160123

On 4/16/25 2:25 PM, Manikanta Mylavarapu wrote:
> Add PCIe0, PCIe1, PCIe2, PCIe3 (and corresponding PHY) devices
> found on IPQ5424 platform. The PCIe0 & PCIe1 are 1-lane Gen3
> host whereas PCIe2 & PCIe3 are 2-lane Gen3 host.
> 
> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
