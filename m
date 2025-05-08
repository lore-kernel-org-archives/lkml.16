Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FFA226F440
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 14:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746714600; cv=none; b=QxdSgT8jIuLbsvFImN3OLZH24CQ+YTM/rJebStbWWswspv7G33HRr3AIb0Km8MQiYGmRyLOFE5fsE1iHKx1vX3AY5QY1gAC3bknznflzK3IPuKMQwRE5cTHdqMhJ9aV/fWric8Ga+59WaU0IUrMWsSj2BgMr0klvTV4qmf9CeE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746714600; c=relaxed/simple;
	bh=pifsycc66KzqpKaUgTJMqgSi5C71iSmELI/zL5LoQMU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lBECN/BJBd/c1Kqg8cS72Pe5kLNcZmpLzRxN4J7peIvNhZjoz0WaXfa9CQWWO9Y45BoTMTXOXYP/Q6mFufAEE6TcW7Rxo9ulssSlhQv147V+FVLDpJwqsPIAcbPtYV3tVsMkAN33oLD647TOfv0btTqtPRi15XG9/HpvjvNNo8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=djN4lqYb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="djN4lqYb"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5488mHcx021197
	for <linux-kernel@vger.kernel.org>; Thu, 8 May 2025 14:29:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i/cgkTnxyg5jfdY6+Lyq4L5THEEwjAJtINqyd81Steg=; b=djN4lqYb4H0wJPQb
	K4O5bAJWtsSJsQCa4f6s4FobiXgYyW5Hg+NLhQwSa1OaNpB9wJemiy+SiP+tUhpY
	WKQp2BkM8Xv1WuUZwd/e11HMvOdT9VFL1AorrRfl7W9TxDDxvM8T2TobbhGEv+qk
	dA7fIi5jp1xOo+v3eNpYndMyrRNA5285CnsYMJfKIKQCXQ+eGpkH9PnH/wCiSX62
	iUvhPOPRwZDtvgEuUBqXLOvOTVrgS+6sLvi1ajrdsvnIAsjEF+iJbUfM4noUE3wP
	DF/VY/7/VTlVFaX6NAVT33pyl37kG+c2uCStfuY7E7FSQIV0kpzWH5guSmeUY4mT
	gUHmlw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gsdj10ch-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 14:29:58 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6eeb8a269a7so3183926d6.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 07:29:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746714597; x=1747319397;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i/cgkTnxyg5jfdY6+Lyq4L5THEEwjAJtINqyd81Steg=;
        b=SWzTrd5lqvNisN3ZNVw+WpX5vG9O7Gj3t7p6HoE9R+F+68IkD39zAlQ+s6u+tMRtYn
         BUnAIo41CItq4X0u9yaFoG/jOkqmQ8FiXdLxhCTpOIuntE107FDqEF6EXoOAAB3AhGzU
         +o01U/ZkFSe2H1FC8GqE5yfi1jqoGXh6F8T+pPsMZrl+bDcweJZA+OvtpD5jV0UMaMtx
         JJbj6w0wbnZZuJFspWD1KjHdbguNEAQDKrK1egVDjtb+sBvOWz8kgvU1STNsW6iv61nc
         DTn07Q5gOUsIbIDpUX1tliQLlPGPAnXzamXN+NFC793ANPpY6J9+mYvfM84AGIsq6qyV
         5Fpg==
X-Forwarded-Encrypted: i=1; AJvYcCVb7RX4fmTCAfEsF2HuKSYGkpGSsBpqoc1rLVpzZild3FqiLlnYv88avGKMAI2Lfi8Hb2o9/GMG7td7S9I=@vger.kernel.org
X-Gm-Message-State: AOJu0YwrqhsQ5Nmd2FpVqE06lyOK/jLtD9rZSvpBe+Q6kw4j15UkGUH7
	vjqPagLH6WazxK/2MDIo/DEG5U6G8rMZMURkKfRo94HSMWrAcJY8MK26aNybu93w1OCsJ3fWdEC
	Gfi6hkc/B2olBWbV6QaD250rzysQ1d6JrQeWswf9wYa/YW0CNiYZ78oyxJLvfmtE=
X-Gm-Gg: ASbGncu/NZ8T5oaVSlHY0p7xzapkioGg5tFzRTedoG7Q8AsnifbY90OC3YoXdmxWyPm
	SGjSSBp33STwDqou0noaUXlVk3mYdf1p6ZzvGymWPoXd2J+cITnCGXqNPFEriwsTgOthOzb1UOB
	UjvffR73TuvmO95hXw9gOcuavzJagARhBjGHUlx3FEIm1isK+38UyfX+DtdVr0O7f2Lsv+FPRs1
	uAOW4WaEEGGojT99G1yssweo1RhgK9GdlQBjUpeHdH3DLpLLgjiTlTxUwrl+Jx4NcZLcmaR1GIE
	YUP869Lructb0JRnWeSkfn1+k4U5m0cXBBnfLK3WFDdBSNqlii83puz9kMNtkbYIvgU=
X-Received: by 2002:a05:620a:390a:b0:7c3:c406:ec10 with SMTP id af79cd13be357-7caf741a8f3mr434991985a.14.1746714596769;
        Thu, 08 May 2025 07:29:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEfaVl8OObnjHQhd/SJGAsLqOH3DFL4CG4ytZ/Pzo30OjRSwoRvlTataNc/c/g5GA7RSzbphQ==
X-Received: by 2002:a05:620a:390a:b0:7c3:c406:ec10 with SMTP id af79cd13be357-7caf741a8f3mr434989785a.14.1746714596360;
        Thu, 08 May 2025 07:29:56 -0700 (PDT)
Received: from [192.168.65.105] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fa7781cffdsm11366152a12.46.2025.05.08.07.29.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 07:29:55 -0700 (PDT)
Message-ID: <7123afc3-ab67-43f7-b346-bdc336481992@oss.qualcomm.com>
Date: Thu, 8 May 2025 16:29:53 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] ARM: dts: qcom: msm8226-motorola-falcon: add clocks,
 power-domain to simpleFB
To: Stanislav Jakubek <stano.jakubek@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, phone-devel@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1746711762.git.stano.jakubek@gmail.com>
 <cdb6915bf40c055c77a0beb2f49c20458adf7481.1746711762.git.stano.jakubek@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <cdb6915bf40c055c77a0beb2f49c20458adf7481.1746711762.git.stano.jakubek@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=PMAP+eqC c=1 sm=1 tr=0 ts=681cbfe6 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=uq1pj42CD5qt1GRQKNoA:9 a=QEXdDO2ut3YA:10 a=8aNmnrDM0H8A:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDEyNCBTYWx0ZWRfX9ozD2cJt6RVL
 /UvW5as7u8rqorOMTvcdj4mWR4CdcPe7LcQpEdlR/xocCtrq7buLydRoqcYyU21j3HJvIEEC2HL
 d6p3uUNSoNGnT4lK4TwLibFV4dkHATzgCvtYPWuCpSLv9nUGR4ATscewnB6ZrQK2gc7a0WbptPp
 UziVWVETjSHCeaV+orBHnh3j2uahXNRAVfnNOAL69SgWS8FiW/sIkaGEKiRc4o+InVOhqqwqvB/
 OEBnr4htCbnV5Qm7gZ0tBRojulY4FdNJz5GR7/1HWLtLbl40BjsOpxihtHJs1EYlWwyZqG+Jg7Z
 K4BFBA8QSwpOxlPSBqNb+XHHuRZUybC6sSDzM+iLVmf0n+RTonkrnmQZd8+wToogYacNAQrkbaZ
 OEDakiRZj+Je8xLh4RFuFXuU9GGnp/vvo6KWeb0+gncsHd+C8tlWgd2ZxNq0PrUyh16gaTjv
X-Proofpoint-GUID: cjRx4sCvj9Fo69BShfuhcaT37YYhH2iG
X-Proofpoint-ORIG-GUID: cjRx4sCvj9Fo69BShfuhcaT37YYhH2iG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_05,2025-05-07_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 mlxscore=0 suspectscore=0 spamscore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 lowpriorityscore=0
 mlxlogscore=663 adultscore=0 malwarescore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505080124

On 5/8/25 4:11 PM, Stanislav Jakubek wrote:
> Makes the display work without clk_ignore_unused and pd_ignore_unused.
> 
> Signed-off-by: Stanislav Jakubek <stano.jakubek@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
