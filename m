Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF9DA29826A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 11:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750074278; cv=none; b=S2PvwbMcHngV1RT5qIIMouC/Y6cyl4TdAFt/LDLZi87hXXnwlgyJ1tPWOfPJg4DUeYcntRirBjqH4v0NCh5pm18yrOGT+umKDzV6v3ZvZkHEKrvsENbBoYVbeZb2QDGQbkpcTSgbQ7lAKzOHSDdk0m+J4cOdmM60sQiI3dDQVuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750074278; c=relaxed/simple;
	bh=SqNvndz7A9Zt7yPcqFNmLJBQM6AtUHxshTQy3ysSsRk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fR48CuZWuGYxI50vMvF+LSLLoaUejMZNNXV1djgLmBfLI2rd+ewJatxP8LZVmmNiSNkmmW6pRXRkjiUQXI54slX9oYreR28s2WatKEohPy76GF6INsCC9gsGO2gSIJid8nWYrlVEFRoatjNGFAL7eV4P+GRZQ5jybG63gHhd094=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k7iYKOZD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k7iYKOZD"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55G8uKaV032348
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 11:44:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aBwqXHaqOGLYdlWyP5aCWSTDntNxsctiiIHM3sIcSwE=; b=k7iYKOZDjeXvftUZ
	VcALSh6MEOv7Ws+8QQMfj6hShQ1cOCO0aAmoBlLrHaBr+u0FaQYtxsTiMugkxAp/
	zn/NaEg+D5Odva3c+e9YiJx3ORTAGELltdL0orhh1ogbEosFqMMYfSgECKGnvz06
	7YZnzDoXYTQgRCr2jt7hsQOFLLDZYOwyoPvxS3/j2iqvbEBlQUiDA7wTje0MtvOz
	+9w8SSC4mR9KmoOh0CeGMvCHl3b7LYb+z7i9V0TrUisEXu7FYHofMmMect8sCg9l
	Xgf7CfSuDk8VxSYDKbvA7lLG8vzbftMsGXQN/KzNQcKpcE9Vk8SXZA1SY9+lbF9K
	J+JMNA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791hfccnq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 11:44:36 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4a5a9791fa9so9746131cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 04:44:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750074275; x=1750679075;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aBwqXHaqOGLYdlWyP5aCWSTDntNxsctiiIHM3sIcSwE=;
        b=LnLhWUzT8XAQcpGrHMSbm4KIeXihmlnvsE2LJHeib6V8fWsbKHt9bBKXodt115iWa1
         cVyD6iWLgmZVIr92O9dNNVQMqsGLEGLAw95FGbHlJAIVo9X9d+ZWfPBfJpb8nYPCwE5l
         PoGa614RrtFF4YV6IhRjJfOTz0qpnK1quYP2/Q6PoqBUcOgN0m8DoelehGVVwRIHcm+l
         hkKsCsbVrtVk5sS/on2djDuaIyHolDITBUndGZJTAN7k7E1bi4LfVdQIglWJuil9TIiU
         94blLZYI/waw7TNSy8i3VCzeaycFiTXJekmQtuXx8JzZ4wxhpTwVlHM2XCe4V0LEyWol
         FihA==
X-Forwarded-Encrypted: i=1; AJvYcCVmIPQ8PG5cpPoGEfVjK2cbzFZFVSBoqBJteWCGzkQerSwZWPcdzJZMsboNIDG+P9pzEVR+N+cqBn5YmyU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNLt43X5WBUZTvzzas0MuNKyCxyTx86+9CAkq7jJMraWLL4C+B
	nJj6ufSqwj+tm6OVEGjpCUeZBkwYmF1lgP1rhYsoV36SiVoJsN6B/ryYwoCpEtk+9/hDdYVm1r7
	1Scaui0rq3CkSkit6TzK6F5q89ksQ5mbXHMbuQavlL9XZtOOgHgb7J0gwFGUXvBCDWAA=
X-Gm-Gg: ASbGncu5B0BRC+qZxYVgMrnQNhYMKt75IxsudkmkqM2VxUMtH0Y4oUDa/JTI4POkeOq
	fq+8TgN1lYwdqg2vvOcwfhVvw8lEFdkbqtJv7cL4O/06DPCoitqUEuzMpd/KUCPL6pSO/R1ptnq
	ZMrAE7GqnkLY4QtkNgoqcQbqDQjb2SLJQbJ9QUozbVbYJcKLQP97voq+sEF94vOg5kYaWKqFoWp
	wA7MiZr/ckSLu2m2STG7pDFjnmXYZu2IQHowMb5ZA7bQclQ6SyKaiA33XcqA2CeYBAxHIF6w8Op
	pgG1zqENwwOCBOB7dxWyhijv9r4MJ/eqF1PqNiGGC0/3am8Hgqhe3cqrjoLncRxsHTsKD0qaXzR
	/sjg=
X-Received: by 2002:ac8:5f53:0:b0:47a:ecd7:6714 with SMTP id d75a77b69052e-4a73c5a460bmr56637211cf.9.1750074274662;
        Mon, 16 Jun 2025 04:44:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFLYGv6rn1SzgWDD2ehrxqokbIF+2wTCG5SWoRKjsh1D8V6/aT4j9BPofzMk3ijGeS/grAFJA==
X-Received: by 2002:ac8:5f53:0:b0:47a:ecd7:6714 with SMTP id d75a77b69052e-4a73c5a460bmr56637041cf.9.1750074274262;
        Mon, 16 Jun 2025 04:44:34 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6097ad640bcsm332234a12.25.2025.06.16.04.44.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 04:44:33 -0700 (PDT)
Message-ID: <bdb171c3-5395-414a-88cf-eb002af96804@oss.qualcomm.com>
Date: Mon, 16 Jun 2025 13:44:31 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] phy: qualcomm: phy-qcom-eusb2-repeater: Don't
 zero-out registers
To: Luca Weiss <luca.weiss@fairphone.com>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Abel Vesa <abel.vesa@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250616-eusb2-repeater-tuning-v1-0-9457ff0fbf75@fairphone.com>
 <20250616-eusb2-repeater-tuning-v1-2-9457ff0fbf75@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250616-eusb2-repeater-tuning-v1-2-9457ff0fbf75@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDA3MiBTYWx0ZWRfX5ePIzFxoJJUp
 GW/Vtfh6bsf6up/kCHibPzSBfHyk06u/l2v4MTQbp4D9YN0YJ+tmxzlhm1dm9wPdgbol87sh55F
 t86rya1N++BQy8v28Pph6aLhQhgeWdLLJmAHf7Opt/4FsUJq7uDTsWmAVkEP/VpPJQI6V797Nid
 KWqF7agS1DAVX/PygcFGmhXltXvT4XF5xMAE4yp6mF42K9DwE7mql+fjQdeg89Auq7Q62ZRTerR
 4RLxNUH/je7pzKFh5yNPNGQRb37H8Er7ZGdEHNvUoscbalYSQHpTnLRwHJqcT671I10z39DzkNj
 AXpPhXfINx+ZSZ4YCZraIsU78UCdw1TkAMkfMB0GS9AYZB2Pe2QDVWXjaIOFql9WjUWv8ELQOAR
 F0Sg5czdzQmNeclj09ZBGYkuUDwoPHIeW9Vni+X1gltRoYnhBpKxaghct+2bNP8RLlzTlRQD
X-Authority-Analysis: v=2.4 cv=VvEjA/2n c=1 sm=1 tr=0 ts=685003a4 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8
 a=cispc58g6-s63dKQH_wA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: V8bLV49GtAwndJ02aIS1qYee9luF-ZCw
X-Proofpoint-ORIG-GUID: V8bLV49GtAwndJ02aIS1qYee9luF-ZCw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_05,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 lowpriorityscore=0 spamscore=0 mlxlogscore=875
 malwarescore=0 impostorscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506160072

On 6/16/25 11:45 AM, Luca Weiss wrote:
> Zeroing out registers does not happen in the downstream kernel, and will
> "tune" the repeater in surely unexpected ways since most registers don't
> have a reset value of 0x0.
> 
> Stop doing that and instead just set the registers that are in the init
> sequence (though long term I don't think there's actually PMIC-specific
> init sequences, there's board specific tuning, but that's a story for
> another day).
> 
> Fixes: 99a517a582fc ("phy: qualcomm: phy-qcom-eusb2-repeater: Zero out untouched tuning regs")
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Riiight I thought this was effectively reverted already..

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
