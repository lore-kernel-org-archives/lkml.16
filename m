Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C0A028B51E
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 23:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748646364; cv=none; b=a4zvm6FUvVaLebPhumWQLcCO3xgLTasib7bpGgIKOHKLGlJJXi3esk6JMS+LtFT/PEyjDhM2xfeWOJUFXENkNjdfmJxShYS2QBxWqh7etMcKrDH2hZBbnkExVIj0fGL7lQu9VsLva8sU7+MZ/SPByqZUgd0ljlivLlmieBH4iPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748646364; c=relaxed/simple;
	bh=9Q3zkS6WlUm0i6xiWVQMrm/0W/fDGiRMReHSQnHCLd4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qgc4NjylO/L2AQX2+NaF8Oui+u+6HxksGxG6bVOIMxQqbiOEYRIWEK8jvHiSHEpEzzgArdf6TqZyAUnJMgSxznoEF3X7/BcE07ckD1Ri+Z3ZvuBytZrH8fpX+DyJt6fxnwmEUp00AOtcOHITSljmLjGoxHxkIhgL7vv2r0wMCaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fej/zpeY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fej/zpeY"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54UKmCYS008272
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 23:06:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0b1z4Tq2+rnRSWWaHM1bqTW0dz9iFSQvkviqR4iSpjM=; b=fej/zpeYIzthccqd
	Ht+CekZV1vFwNYEF+OZHz9+jijCByDJOipbPV+AFqF424SuQ0akrSp25VLUvb1nL
	jfeJULk2EW/bxG057/4dJ9G1+witZczS0JrS4XvFaWL3vB2rzKMjtB+Y9y/GsXUs
	ZiPvp19G7YHwAhE1jLRr7cDxWHzwFab1otTuC13GYWrHdFNuteu+dqcx7PDXBdvS
	RcuTHa6nrErT6nixTEvDB4bRTg+IVM30bitmjfOpLBv2HUuaiuEv7oAcGVLUAgMF
	oIzDrTgbFzImVxp7P7BbQao3Yjl1/XtitLv6Tgtp+7pw0TE7AikZosGoXDtDwilz
	JaM/6A==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46w992vucs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 23:06:02 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6f2c8929757so6615886d6.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 16:06:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748646361; x=1749251161;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0b1z4Tq2+rnRSWWaHM1bqTW0dz9iFSQvkviqR4iSpjM=;
        b=vDzVxgDmcCJJ7fLzkJW8Vrnj+13Dtr74/05F3eaekSRsPRRPG5DgZFWHmCBqF9xKz2
         rfXNkbjVtanGZBJKTDwRHRuo+ywJiCjxLvaP+5pF5n6WTcfznETLRSo6cqWUIlaug/Xh
         1PgTz2Wku3QL5y8xIv9JC3nPcJ2Yqmu/33yh2WyixqyQgzkFXO7Zzcb4OTjUolMWvE1n
         RAAdrGEqd0vnxhjIotH23KhfXbvJEuqzSuoEXBDbZLXfWXLNAUQVdaCf/pKPRjzegkW2
         JWMBoYq/UOKZoiW9UsRPGk7HYS0E4ji5OGXbfxTBB2ZTPq6V4W+GwPwqnRbX/RXa9cdh
         RzOw==
X-Forwarded-Encrypted: i=1; AJvYcCW6tqYWhrrW6uTvjEBsME2ZbwzI0svU8tAtvPCnG/NXhSKqJqOuHI/5LxqZkevZfqrpyiRK2FOfZXCmLA0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxxERJWogIJAVGlnn62ZintV4db4litWdoI5unaksiAqEZzEEM
	sFDF8awARf8bTLbnBeqtZC1hWHv5I8fVEyE9PkZWX0viYjLBF8VSnliyneYssrVI4OCMHmxcfNr
	0sysY5/kA5TdDjxuj4WAEwgNEMrzqdCYsY/5EAsSnb5SV0nNI7/kwsUj0hCe2ElL/65U=
X-Gm-Gg: ASbGncsQiQWnqN45nmJg9qb87MCnp0ACE7sKonqxinawyqinGbC5rx7JvymuBqvTFuf
	otCUZ8Rb20LHvQxDW8ZkRU2JzA7RZvT7chpijhdIRPVHnsqBquzOiEXQ3ffqEvQX0nNvXf2UBI9
	H8U9XdjOzNbYitJoUueXbeIPKpNfmPrh1Ct+F+lmrxsbNC7JvWmagAXzInu8fR0DOB4Lm+CW56p
	Puotu30F+eW68UWvMtGzyJkYT4RSN9AiChIebpS9WruShlMYuiWQxbQlxK6D1urHC/p/z5mPU6V
	ZOBMN8hlnLqJyCvTcZCpqcqVN1IRa4yyrIJd7nFzHHL7nLx861PkPDaRO/n5tdWFqA==
X-Received: by 2002:a05:620a:2490:b0:7d0:a0f2:e6ba with SMTP id af79cd13be357-7d0a3d938b3mr265414485a.5.1748646361296;
        Fri, 30 May 2025 16:06:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFuW2Dm90PJkMPjDICfbP64xe5O0WLmye4UORnfpkTbHgki69F3jdJ6Wt5UO/xLdcA+ckvMJA==
X-Received: by 2002:a05:620a:2490:b0:7d0:a0f2:e6ba with SMTP id af79cd13be357-7d0a3d938b3mr265412885a.5.1748646360949;
        Fri, 30 May 2025 16:06:00 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada6ad394e5sm398937566b.137.2025.05.30.16.05.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 May 2025 16:06:00 -0700 (PDT)
Message-ID: <f3f8f446-4f0d-482d-952d-35c80d7d7881@oss.qualcomm.com>
Date: Sat, 31 May 2025 01:05:58 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: qcs615: disable the CTI device of the
 camera block
To: Jie Gan <quic_jiegan@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Jinlong Mao <quic_jinlmao@quicinc.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250527015224.7343-1-jie.gan@oss.qualcomm.com>
 <5fbb515a-c3d0-4bbe-a689-41e730ecd952@oss.qualcomm.com>
 <9a156925-cf7b-4d2e-88a8-fdfed5528553@quicinc.com>
 <1fef810c-47fe-4f6d-95bc-0d72dbd63bf0@oss.qualcomm.com>
 <79f5e42f-f857-4247-abf9-d0f3f5c1a498@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <79f5e42f-f857-4247-abf9-d0f3f5c1a498@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDIwNyBTYWx0ZWRfX+Dr4qQ9wW0EJ
 U04Nat2OjYjEJqeN8RuJaCkrGCNvtkrNrmXwbhfcbGuMwMcESOQP1O8B+Jy+EvvC+oaLtL+nDgW
 /y7A7h0uFG62sd9VVAO6F+pCdozLzfEbZMpz9ATDlbUhabpaybksk3EI+FFca5GP/6Z8V+mEIz1
 SW8MJ0G74y8IdtxwfatbTvBdEckV1WtWJePTFi95tHif3kZXlui2NxalnzfNYDVEFoGzJOFrU1p
 qkjHXU2mLrmKeQiBzC6IvyF+OQ9iL3fQjXOgU7c/SFgWa4ifnyrH30uiBsCk1LEwWFI5sbC2Jz9
 JnpZaCg3ulxvWMaQzL+D3tDq3t55bfsyt/CQQtkMKm0GDCyEn/ExSRLv4U0gAReWkk+YzLalM/q
 i6p25F65U6AKA8DKdvtgMsdBgphP6UCzCDPNHoyqYZVvOZQXtLPCvx19m4nRgpPyjJDrf/JW
X-Authority-Analysis: v=2.4 cv=Fes3xI+6 c=1 sm=1 tr=0 ts=683a39da cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=P-IC7800AAAA:8 a=MEpl2RExcag3QXfMKmYA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: 3KIFugjHgaI1FZKp8fQ49ar6UZjn3vYH
X-Proofpoint-ORIG-GUID: 3KIFugjHgaI1FZKp8fQ49ar6UZjn3vYH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_10,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=774 spamscore=0
 adultscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505300207

On 5/28/25 5:02 AM, Jie Gan wrote:
> 
> 
> On 5/27/2025 6:41 PM, Konrad Dybcio wrote:
>> On 5/27/25 12:32 PM, Jie Gan wrote:
>>>
>>>
>>> On 5/27/2025 6:23 PM, Konrad Dybcio wrote:
>>>> On 5/27/25 3:52 AM, Jie Gan wrote:
>>>>> Disable the CTI device of the camera block to prevent potential NoC errors
>>>>> during AMBA bus device matching.
>>>>>
>>>>> The clocks for the Qualcomm Debug Subsystem (QDSS) are managed by aoss_qmp
>>>>> through a mailbox. However, the camera block resides outside the AP domain,
>>>>> meaning its QDSS clock cannot be controlled via aoss_qmp.
>>>>
>>>> Which clock drives it then?
>>>
>>> It's qcom,aoss-qmp.
>>>
>>> clk_prepare->qmp_qdss_clk_prepare
>>> https://elixir.bootlin.com/linux/v6.15-rc7/source/drivers/soc/qcom/qcom_aoss.c#L280
>>
>> I'm confused about this part:
>>
>>> However, the camera block resides outside the AP domain,
>>> meaning its QDSS clock cannot be controlled via aoss_qmp.
>>
>> Do we need to poke the QMP of another DRV?
> 
> The AOSS has a clock control register for all QDSS clocks. when we vote the qdss clock, the aoss_qmp driver will send a message to AOSS to enable the clock control register, then the clock control register will enable all QDSS clocks.
> 
> The QDSS clock is not a single clock source, it is a term that representing all the clock sources utilized by the QDSS.

What I'm trying to ask is, is there any way we could enable that
clock from Linux? Can the camera hw turn these on? Maybe we could
trick it into enabling them?

Konrad
