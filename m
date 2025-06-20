Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 988CD2D3217
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 15:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750433257; cv=none; b=uzgSBpPK8Qxb3kyhx+NBWQiDo7bRmBBWjhWrcneqUh/goNhBm+MA7FkEhZFDITyRpQIMZ/kV2ttk6UhADEn6f/+eDU0DS5jCbULn1qf7+W1/PxPDBiuYZVnywcwE0ssIvpueDsoPK33xajT7lu9oqnS4HyvFQi7wXCjg3jOw6Mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750433257; c=relaxed/simple;
	bh=P8Wo7fcybEshzotVDeA10midjInAL0LN6QVzD5tO3/Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Rn9wu9hWTRPTQJohNhy8Po5k2iANpcSl9y6tS4NqToBXC/0lEzu0HDmYchAQoCr3ymP2pnAIF3u7YubVu7fzhQrvM7E0GkxGFMebcwn1ssjrYi7fsmbYjH75KBawhJleA59eG8Fij5XFNKuX8OQbHssuLU9D6btfjB18ngRbrto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nx+GB/iM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nx+GB/iM"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55KDHOIJ018584
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 15:27:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z+rs8T4bgG+Rya1KkHRCXup+WnUD3pd+Ch7crhjLsi0=; b=nx+GB/iMPdkNPH/N
	D/YXGKSvHi2+F9e0KKpQvDrof8o7ce+Brwcn3tKoOfNuC56xLPlYMpy2KnBnKjDb
	78U6+NIe9C0+Z+duh0Vw1Nvz/IVDJa4+/KN8KbSp8TzfH62aVuFdlHrcIsR6W2gG
	a6e91uOs18qe9hQQOATMVBCG2fnjmyVItf70ZYip7BWCffFB2goCrc3S346OQE1j
	pocHC2EP551PSWC3mz1AkeO+I1y2/SgL5Q+wPw+SRZXozqq7thil4fbGhUUHbOH9
	9sb9JXod6AbtKd6ZEwiRaUKX5OfWm5ecx1fDFoQ7l2fjlwI1IGDbXSvFyMws2zF4
	CeswfQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791h9kpa6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 15:27:34 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-747adea6ddbso1748527b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 08:27:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750433253; x=1751038053;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z+rs8T4bgG+Rya1KkHRCXup+WnUD3pd+Ch7crhjLsi0=;
        b=gQoTvbDic07Cv1CkhLzmq/q20WXbcrXYRBD+elPgLKgpCafsnTRHJL9Tm1Xat0paUx
         hjvBU2PZs/OtJYNSgoYj1bOrxwZPP2stB8dYoWNp7ZpyrefmsE8250nubeGGEADi1XkS
         QYSca1QgfiCgMZYws8KVeMI7ob50ltqVhoYyvrC9hRDChmDUpGp6NuUfZOA8w2JpgfuQ
         EAeMt+EtRFVVKcyWgOCJvL5vvl9qd+Lin2oj7kZ0sePTSC+lHLCxqqqrw6ItKt63G3nc
         SGM7AoFxoi+HXZwKZWrqYntNKIjRE3iZPkPq9Hem94WRUB9iwZVdEr22mUjapnHQ1cGv
         nDpA==
X-Forwarded-Encrypted: i=1; AJvYcCVg49t7kiHvi5ZMCjQjYp29HClbMo6DBKPfneE9UI4xKRw+71DySmreEWHB+ydu41T8JwlPL62FJsqu6B8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzl/31qyH4pWviMp2MVss196Bw6nFlu9Zhk7FcSUkERN3bNpoqy
	ygYRev9B05nqZIsdhhhxwpZuOZWsgwKmUvHiW44vPUdwMf5w6Dr2TAG9VvwWiANVM935vNX3HFG
	c/Si5auSmm7S0puOFsVYuGX35/HjGGqCYlfo5aVfG1iuiDs4cRO9ZOYzsvPcURGpyc10=
X-Gm-Gg: ASbGnct+JkM4aigI4c3iHBNok4BMJ2DO4xXQdRduq1axPL98fGkc92zdaO2v0rJ4Gna
	pc7lup6u8LVPkW9yKUg+P1S7SYP8Ppz9jsfFCPx7NzPczXVB2hrvI+1wkztBEkQGJbvzLwFpjQu
	BKCUynEnvNCJTrYz6pyBfgL6JkQ1g0bxswbLQBffPbuVMaOG7GbZXQDjTm2xpNCN019JUv8QQAR
	6hxcbMAMHcqP7ICpP1RERIrF9JGs6kTFvmPya4vHl/R9IipSaaTQsb1T7x5OyI4u4rqgNSfrm9e
	bZmD0rtBFzn/vorab5jFFoE+PbXWMh+Nl0rWTDGQV29ClcLX5KpwwBrWGfeb0mmUSz9Wnq3jdJ5
	YCvZBu60MJTMfzko=
X-Received: by 2002:aa7:88c9:0:b0:742:a82b:abeb with SMTP id d2e1a72fcca58-7490d4e764bmr4526855b3a.2.1750433252933;
        Fri, 20 Jun 2025 08:27:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEX4ccPDFY5JvWE0aspZHNF7mwAxGry6wkBg5v00B/SdhZn5+MXU1O26M27rXpg1M2JouYaeA==
X-Received: by 2002:aa7:88c9:0:b0:742:a82b:abeb with SMTP id d2e1a72fcca58-7490d4e764bmr4526806b3a.2.1750433252434;
        Fri, 20 Jun 2025 08:27:32 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a64b1c9sm2239011b3a.115.2025.06.20.08.27.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jun 2025 08:27:32 -0700 (PDT)
Message-ID: <4a3ad8a6-90a9-45c5-bbdf-7b91d3c18e51@oss.qualcomm.com>
Date: Fri, 20 Jun 2025 08:27:30 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv5 0/5] wifi: ath9k: add ahb OF support
To: Krzysztof Kozlowski <krzk@kernel.org>, Rosen Penev <rosenp@gmail.com>,
        linux-wireless@vger.kernel.org
Cc: =?UTF-8?Q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>, nbd@nbd.name,
        Johannes Berg <johannes@sipsolutions.net>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:MIPS" <linux-mips@vger.kernel.org>
References: <20250609030851.17739-1-rosenp@gmail.com>
 <37561ac8-ac0f-4744-9495-c7589544d4bb@oss.qualcomm.com>
 <ef0db40a-14d1-4670-82ca-f724a0eeee0d@kernel.org>
 <ddc48fa7-3fca-46a3-9224-11c0c3fce4a4@kernel.org>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <ddc48fa7-3fca-46a3-9224-11c0c3fce4a4@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: vcKCOboQPIvlwciLFEtYoCPKBuRYUoZH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDExMCBTYWx0ZWRfX4GvDhTqw0wF8
 Pz2BFs8gh4s9aC8iA8Bh3XfzvHWxrLDLljVoP71TXH0/H4mO9vYlnV/pSjJfxZmh0Ik0J1eJALj
 A+VEblHPcmwV5UO8v93UCfV4RwgPu+rqWreZVuVpvoquTc7p7w3Ok0/l1LXgCThqgV6t4Yc4sg/
 sX9rb0xEC0SnI3ioxDDDdFqT8K18lvBB2CK/8GaU7AdouysLKrunoMVguS2tr+/Nogt7poKZllZ
 8gOAbOufxg0P5hCmKo+kiJiv40wen+OW+IEsY2Jz1e6jOaM9KAsc5V+xNapDQvAiOT0cyqTBqkZ
 9DrIO9NnomI8v26KDAWgN7Xq27lvkLbPS5iJyeaoW6HsznbVwfuaRBJfJ8A5u9waBAPthTEDNJJ
 vMDVOQbuY8sxaUa8wf2f+PHx8agKf0qQvAEEG3zyrhNksfIEmHFyL9sWPhZ9nL/Ovfy5FQv2
X-Authority-Analysis: v=2.4 cv=UL/dHDfy c=1 sm=1 tr=0 ts=68557de6 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=e70TP3dOR9hTogukJ0528Q==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=gBfMadwGajE8Mk97sbMA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: vcKCOboQPIvlwciLFEtYoCPKBuRYUoZH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_06,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 phishscore=0 mlxlogscore=937
 malwarescore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506200110

On 6/19/2025 10:39 PM, Krzysztof Kozlowski wrote:
> On 20/06/2025 07:32, Krzysztof Kozlowski wrote:
>> On 20/06/2025 02:33, Jeff Johnson wrote:
>>> On 6/8/2025 8:08 PM, Rosen Penev wrote:
>>>> First two commits are small cleanups to make the changes of the third
>>>> simpler. The fourth actually adds dts definitions to use ahb.
>>>>
>>>> v2: Add documentation, use kernel_ulong_t, and of_device_get_match_data
>>>> v3: Use qcom prefix and wifi suffix as in other ath drivers.
>>>> v4: fix up dts example in Documentation
>>>> v5: move back to using qca prefix. It makes no sense to diverge between
>>>> all the other drivers for MIPS based qualcomm devices. qcom as a prefix
>>>> is used for Quallcomm's ARM(64) stuff.
>>>>
>>>> Rosen Penev (5):
>>>>   wifi: ath9k: ahb: reorder declarations
>>>>   wifi: ath9k: ahb: reorder includes
>>>>   wifi: ath9k: ahb: replace id_table with of
>>>>   dt-bindings: net: wireless: ath9k: add OF bindings
>>>>   mips: dts: qca: add wmac support
>>>>
>>>>  .../bindings/net/wireless/qca,ath9k.yaml      | 23 ++++++-
>>>>  arch/mips/boot/dts/qca/ar9132.dtsi            |  9 +++
>>>>  .../boot/dts/qca/ar9132_tl_wr1043nd_v1.dts    |  4 ++
>>>>  arch/mips/boot/dts/qca/ar9331.dtsi            |  9 +++
>>>>  arch/mips/boot/dts/qca/ar9331_dpt_module.dts  |  4 ++
>>>>  .../mips/boot/dts/qca/ar9331_dragino_ms14.dts |  4 ++
>>>>  arch/mips/boot/dts/qca/ar9331_omega.dts       |  4 ++
>>>>  .../qca/ar9331_openembed_som9331_board.dts    |  4 ++
>>>>  arch/mips/boot/dts/qca/ar9331_tl_mr3020.dts   |  4 ++
>>>>  drivers/net/wireless/ath/ath9k/ahb.c          | 60 +++++++------------
>>>>  10 files changed, 84 insertions(+), 41 deletions(-)
>>>>
>>>
>>> DT team, should I take this series through my tree?
>>> Toke, Ack?
>> No, of course not. The same as you asked some time ago: DTS never, NEVER
>> goes via driver subsystem tree.
>>
> 
> Heh, you do not have any subsystem maintainers acks or reviews on DTS,
> so this should not be considered. It's like me taking wireless patches
> without your acks.

That is why I was looking for clarification.
All the DT stuff had your R-B and hence why I asked Toke for his Ack.
Will DT team take the entire series (I'm ok with that)?
Or just the DTS and I should take the rest?

/jeff
