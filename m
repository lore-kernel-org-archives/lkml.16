Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 056BA221DB7
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 10:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745664524; cv=none; b=Mt0BfbE/FItL9D4IhlrEypS0gP48riRxL0KHLYiNJzE6yIy3Vjasx81gabYRuXPgwMuSMw049E/D2UrRc+XAtFxKA8SqZiVhMiCzTPctShwykhm9A9ktQ61Av8m32RZzLJskXCrqGziAjWa5WuhRZCnTte+BATshKERtlb4mxfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745664524; c=relaxed/simple;
	bh=4sRaghWWcD60w7uXTlO9CQBIPxZMoc5Qe6bm0cuHaKk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ap28rsPSR2Km+gjFDzoxYvtUUBovTOBv51kxvkdYPXSS9vD8eOHPeKtqkuTrHefhem55Kh/6yJycTyh1QZTkJRwdIRABUaeqTCqDvMSdkz9AdpoCT9HPCKdYbt0XMRfPLicvqZAKOwBI1brWT6f8dtNaWwp9xD9tKZHD8nZzP4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G1XVeFCq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G1XVeFCq"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53Q4drpZ016115
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 10:48:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DJpZvWXgtHuZU26lIpKxv2J9vl2iSDRp1jpslHEmWKI=; b=G1XVeFCqeV64K18k
	D+nNmwVTTSzGjSYxggyku5VPu1UdxPOxm85OuA7HWLzt4AUAXEatMgGS767fDH4R
	W/6oyMft4wNca25RNUIm1/xD0s00h7OmjiUbruR6cbA3qcbtx/l9I8qIvLGAXoEw
	1V8rYvjFA6Or3PbhOucfyRqD38miP7BFEhBS/0ZySZ7SM8u4PHdGmFJKUf+wOvtr
	gOUEWy/QDhqDT+kdzOuspZwDMVNcQj8CKt5Ajsa3oq1Glogk6Onzz3KBZu5D/uEI
	+HJkRuDIh6izodPEcC2iDS+EvKVUhXcttEr+2FgbDyPUexOBwgzcCw9JN893uPs1
	KJtvmg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468rnmrrw9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 10:48:42 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6eeb8a269a7so9524286d6.0
        for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 03:48:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745664521; x=1746269321;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DJpZvWXgtHuZU26lIpKxv2J9vl2iSDRp1jpslHEmWKI=;
        b=QXrzsOJiiKSjr+Jn5FItZIW4/p2Ngstc1wckDxKSeWG4FjS+O192oVL0Q0aogZ29aY
         OUbXqGWj/uQNnt+e2KJ0mliN7+BD77C+zNpWCr2AlWYnp8722bikY1BdCEbHeylVAG4s
         0T8DtFkuvLzcPWW1lvIzta+DQMft+mnK8h2AJv76k93GwvySNRAmIY8nOTjSEzptoZxC
         DeDW2rUrIQR9SbQWyuJd3K12BAU2e1W1zK8SLN0rk2StZnyZQEzwdSyp+2/yK5FeXdKl
         +hcbpE6ikjufmS76u56iRFyDMvunCY4epUxVvDpssAAFQivZJb1Tayvw0XJHl3I27Hbr
         QhEw==
X-Forwarded-Encrypted: i=1; AJvYcCUKb3FNXSgiw70F6bp/8OQsnXoxICk0KV+6QRvbxuuPsRVjk17R12kKZtT1KDMTgqOgyxfa56FFq6V18J0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzcv0/5ZKZ/JorK4Ykm+WxVT7dn+71zeD8Xm0i3PDZqMNvlHyQ1
	ptKu7CezcrwDt757xWOVke2TOq48ss4hLstcWOC80opjLGeONRnFVBJoILYaJW4aGxlWj4O9HfR
	hR3EBMCs/bAwqbu2E2UCZ/tKGdVebIO/LuTTeqR4SOeMHLypgMUU5WzueCn+WaTw=
X-Gm-Gg: ASbGncuSZbLtJQByOXLD0PDnoAosXyR2jJnQcExVHqc3sSV9ZU4G7o2ExGtEaNqQ9Dp
	YpmerZDTi/BNF32WTVFaJ++DG/HiAw+wnbK+qQ46+ourOSSpglOQQIcRnCAq64iJVlKi5cd4vHo
	rdVnrHkAB727g1zjIghTMXNobllzRmIjU18YdqMc1/SY5756KfCsOw4dcMzBw+vZDR2M6UPpVp/
	6y8bviH+1KUVZMFunT2+09MNNBa2P1bv5tLugldBTtpbgNOJ6PQWesSV9L1Zod9bFyA+WiLjkjq
	oeNAAzvjqnJDNMQ5Lp6xD7anINc+yaEol2ZniXy9d4mf15pdan96D8V5CLsxJHkovBU=
X-Received: by 2002:ad4:5ca8:0:b0:6e8:fcd2:360e with SMTP id 6a1803df08f44-6f4cba61ff7mr32939266d6.8.1745664520785;
        Sat, 26 Apr 2025 03:48:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF66thbVT17q0t+hsUlfIDPNUs130uihaEVBIxsM6mBjrr8hzmW8LMlanJd82uYVVyB8uTOEg==
X-Received: by 2002:ad4:5ca8:0:b0:6e8:fcd2:360e with SMTP id 6a1803df08f44-6f4cba61ff7mr32939076d6.8.1745664520440;
        Sat, 26 Apr 2025 03:48:40 -0700 (PDT)
Received: from [192.168.65.154] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f7014006desm2478040a12.31.2025.04.26.03.48.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Apr 2025 03:48:39 -0700 (PDT)
Message-ID: <17a1a4d9-fdc5-477a-bf4e-91cae5a62479@oss.qualcomm.com>
Date: Sat, 26 Apr 2025 12:48:38 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: x1e80100-qcp: Add qref supply
 for PCIe PHYs
To: Johan Hovold <johan@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Wenbin Yao <quic_wenbyao@quicinc.com>, catalin.marinas@arm.com,
        will@kernel.org, linux-arm-kernel@lists.infradead.org,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        krishna.chundru@oss.qualcomm.com, quic_vbadigan@quicinc.com,
        quic_mrana@quicinc.com, quic_cang@quicinc.com, quic_qianyu@quicinc.com
References: <20250425092955.4099677-1-quic_wenbyao@quicinc.com>
 <20250425092955.4099677-5-quic_wenbyao@quicinc.com>
 <aAtbFQIQMJO-BYe_@hovoldconsulting.com>
 <e82eda3b-b27f-4584-ad23-562ca4b22847@oss.qualcomm.com>
 <aAt54vikoREWZyGY@hovoldconsulting.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aAt54vikoREWZyGY@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: iRkgQqcuOnRNWanqXkIC2rQTnB9RlQ_1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI2MDA3MyBTYWx0ZWRfXyUBT/+5rHdl1 UlfOJHQin5zycbyB3uWRUJS12vXLSB2H42MbHe2MI1DLtofpwFdPXlrHa2qDCoMdrDJVd9Ay7uj ZHH7qR/1wIVP/cz5etvDg/Jy7APKuzfR83SCHbopk44XEggeRWwGqHxo9XcZZp1T0UTjbkNSKyA
 6aYotYHKkOBcE+gfr6yWc62hdbczgVuSatu/9pCyVBmzAFOVP/38oIaGmtzj1pxVRqfk3pu3MwU 8GYLdRrILTrBEb0zhzk2xZrFMG+xkGUWYIEsk3Ks/2W9at2QhLOY1/arZxCRpaSEx85FSGB3Fyk wTgy0KfZc0kqSfyZWtpot7GeKV/fd2nA4NUS173dGp5TohOuh5wiU+CEmELR9pLd+tkENYoV09e
 hdfALnNcpjKoT9M1mPivh0pU+CwCgrzWiK7/ONmbaorvDUwq6dxZ3PNNHMBmy/4W+2sO2NwU
X-Proofpoint-GUID: iRkgQqcuOnRNWanqXkIC2rQTnB9RlQ_1
X-Authority-Analysis: v=2.4 cv=V9990fni c=1 sm=1 tr=0 ts=680cba0a cx=c_pps a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=8SvZGl_aAWB78hht054A:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-26_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 adultscore=0 mlxlogscore=999 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 mlxscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504260073

On 4/25/25 2:02 PM, Johan Hovold wrote:
> On Fri, Apr 25, 2025 at 12:03:06PM +0200, Konrad Dybcio wrote:
>> On 4/25/25 11:51 AM, Johan Hovold wrote:
>>> On Fri, Apr 25, 2025 at 05:29:55PM +0800, Wenbin Yao wrote:
>>>> From: Qiang Yu <quic_qianyu@quicinc.com>
>>>>
>>>> All PCIe PHYs on X1E80100 require vdda-qref power supplies, but this is
>>>> missing in the current PHY device tree node. The PCIe port can still
>>>> function because the regulator L3J, which vdda-qref consumes, is voted by
>>>> other components.
>>>>
>>>> Since the device tree should accurately describe the hardware, add the
>>>> vdda-qref power supply explicitly in all PCIe PHY device nodes.
>>>
>>> AFAIU the PHYs do not use this qref supply directly so it does not
>>> belong in the PHY node (but possibly in the tcsr node that provides the
>>> refclk).
>>>
>>> Since commit 031b46b4729b ("phy: qcom: qmp-pcie: drop bogus x1e80100
>>> qref supplies") it also won't have any effect for pcie4 and pcie6.
>>
>> QREF is a separate hw block distributing the reference clocks across
>> certain on-SoC peripherals
>>
>> If its power goes out, I don't think much of the platform would be
>> functional anyway, so it's redundant here..
>>
>> It doesn't have its own single register region and it's frankly
>> one-shot-configured way before Linux starts up, so there should be
>> no need of describing it at all.
> 
> Then it sounds like the qref supplies should be marked as always-on. Can
> they be disabled at all?

The best answer I can say is "maybe". I would (without knowing any better)
assume RPMh wouldn't let you turn them off. QREF predictably takes VDD_CX/MX
and some additional lines

Konrad
