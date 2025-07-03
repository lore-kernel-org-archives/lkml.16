Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E14142E03F6
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 10:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751537076; cv=none; b=bSALCUDxBo9zofChz8U8lpXxRUla6oRpW/llsU4Ua3wQhhJKEiP/LG6+rBNWq/dnPEbC7bPke9x3kxCoGZcjQ1TEbL04oCarWqjdWuCt7Qwn4e9zD+B23bL4AwudeN2Z6WB1p/lY4dx1fGpvqzbQ1wGCUsj30xkZPgLTJeJB69w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751537076; c=relaxed/simple;
	bh=cyTu142mWOH15jjQQR8zgkNVkfWZan1wub5jXvzfRWY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tphm2+QAI/Vt4hbTdcgkRbCULYlH86x7rlLt4Y3oCW6DDBNk8h3uhIAK/08+MpcUzkCyk0XkAZUCWW/hICeMu3QiHhWd+T6Sdbhn+/H/PVm6bW/rPQ5IYuSvU1qE+CaSy1OrwbO2sBH8eX78udF43bgcr8r45mCz44gBasMkLVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gvFnyOSB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gvFnyOSB"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56366Gs2007174
	for <linux-kernel@vger.kernel.org>; Thu, 3 Jul 2025 10:04:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oUtfiWChnTptD8GgF9Q1eg1hm3mYO2U2DifbMke4nQM=; b=gvFnyOSBx5Zh75xU
	SLvcJThJvf6mWMXWPebbqcXw/LQKVtbzvTkao9o7jI2W3/eLsTxYdQOcYqabZbGQ
	p+DRhgT1UPNJE3UiSUnW7SK+d6r+JHQ0Gnp50MYM119vTpQxOENAKRFxTIrI2uGV
	Sx4otX5eeXvOsL5MJRxRr3N5bIdAgZ7pm12TeQjBbfboIvVwY33ocojvZkqnQ1gg
	2kKZ9DcUj5Jvs4MWbh422O5U/tNiYfZC6fyzMDqc8yMjbaVDWOoB9IJycbJuIuz1
	0anRYOh8dnf59cVcVUSQ9VK8ia2EoF5WYaXcUQ9DzSBgVpIa6fy69ZFLyZv9lsNF
	TNHwFA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47napw2733-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 10:04:33 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6fd1dcf1c5bso15889546d6.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 03:04:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751537072; x=1752141872;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oUtfiWChnTptD8GgF9Q1eg1hm3mYO2U2DifbMke4nQM=;
        b=izMvl0VlrVnXyr+EKhcHN9Fm+AQheNP7qL/PH50/5BSZ3/RTnXtRAaQKk7klAjG0YL
         gPJLm9CBgtth34EYMSnQMjuCVGEJb+g1adCQadzV4i3OoRPwZ/GEd8mGRQQOnysSIqUN
         3hKcKou4YxE2dirSgDiqe4/f0rZ6WIFrJWoOuCmsj6CuKyShrSCd/Xxj7epy8djG7a2f
         UoCvw3i4b2gYlEkaKibl3lsv9SFD8MbGRFsfs9yOpifKkSM8q6xRHypHUvxXjQ5VLEx1
         Da5Qeb/D251MkaPgd0XoPoRl/A+rb+xNEeIcv22zHBSeO4AQqPUnSbDXrYe1MD4YrmVS
         +Dvw==
X-Forwarded-Encrypted: i=1; AJvYcCXEAI9/0mOCTatyLqWAa4qOM1Ap33U62OtX1uF4YzeLzELY9lqSSe8sbmaBB5x/sL5XksII/pkSxHX/d9I=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXjIbxUYD/LsgmzuJX2JO5l6dBotqIClfov5jhBKU4+Tg+qIZq
	GSw+du37SYR39Acmfk+wW/7a9+zVNYbbn5iPfmkXb3U+1Git+w0vIHY12rZE1UQW1zTGxcp2eSu
	fIgQD9pWDQbsosAZE/n1Lz+q59DE9i1qEv20PMV8HQE9OG0LB6Bzjoolp5vFDhjJLeH0=
X-Gm-Gg: ASbGncvCZdTHxmrzz9SyzIqtk/q1eJY68l673O7TtDSw6v7Zxbxz6C0TcMWW+XPu8fz
	XwYW/DKiA2CWoyI5h3fzVT4k21tzoOfwrWqtZOAkDVvNotQNJqv9aOMiVU2XMf39yAZ4fLy+isU
	tpeM4zubosbLJh9XWkLllgsTPxkzS7OhKfqp9pxi8bQHydBqOclZiD3Sd8CKGNxWW3binQ4Xmph
	d6z+zSPJwhakUNhzVki9rGYCUKx+X44Qmf5BzVVYy7wiCVz7QE/gmbtit5i7b0P3b2ukKry1Fa4
	Pdker11cpOFYbdWHi2D1tnSNXz3veCR5qD8vJ4EWacHeGRsmvMP9pn8PHAqQ72XiBQPCpAsgGw7
	XOSrh+juI
X-Received: by 2002:a05:620a:170a:b0:7d3:c69e:267 with SMTP id af79cd13be357-7d5d3f81630mr79845385a.12.1751537072316;
        Thu, 03 Jul 2025 03:04:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG2LJCfxQ4Vlc6G/INeD4FSxm9U7KnRLIwjqUdsVZx1frVxI2yUcjNbNlDmF6QyLAOxpw/4TA==
X-Received: by 2002:a05:620a:170a:b0:7d3:c69e:267 with SMTP id af79cd13be357-7d5d3f81630mr79843585a.12.1751537071886;
        Thu, 03 Jul 2025 03:04:31 -0700 (PDT)
Received: from [192.168.1.114] (83.9.29.190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60e2a743d53sm4520080a12.28.2025.07.03.03.04.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jul 2025 03:04:31 -0700 (PDT)
Message-ID: <a453bd90-b7c7-42eb-b769-b4c87b6dac12@oss.qualcomm.com>
Date: Thu, 3 Jul 2025 12:04:28 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: document the Milos Top Level
 Mode Multiplexer
To: Luca Weiss <luca.weiss@fairphone.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250702-sm7635-pinctrl-v2-0-c138624b9924@fairphone.com>
 <20250702-sm7635-pinctrl-v2-1-c138624b9924@fairphone.com>
 <20250703-daring-burgundy-limpet-a1c97e@krzk-bin>
 <DB293G0PC5P8.13IW22M6DDESM@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <DB293G0PC5P8.13IW22M6DDESM@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dIKmmPZb c=1 sm=1 tr=0 ts=686655b1 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=fKQzr7EGRj+VoE0XNsDNvQ==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=K2Eths-FuMJ0g_30MjIA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDA4MiBTYWx0ZWRfX+5WFdcHr4Qsh
 AUCHrlxHa1LE7tUOdNo9uFPW3Enf/lwVus9F0Uu63hpOK6mCPWsekh6UehE9gch0W+/5OGejxh2
 /Y+h025GjH/I1igDdgoxzjt5Hb3aT9J1nGQPJF92KrvYDwYzM+ZBHQu4XmY2jYlm4Vw4dHuIJ4I
 5n/TDxobhlDQRTx51+MdVppY/OuoQ9LfUtSbIL+Ub47Aw8lHtORHaL3qhbeOfDRLW6y10XBmHCf
 xqpH4QxR1ecylS2QitaFmYF3q1MLmxxk6GEllQO8RzoKtjPQh3bBUaXR2LiI2TMRYHX3SaChFr4
 yZMuXNwdUtvui4dswNGKAJjSESX4tFXUuGrp0/N2wp9bN60MzRREZkFxdvjukjCIRdHhgHpdMvF
 pX6zMOc7Msmv/b/KM3B36HLap2Kwu2YOT+r3RCubOTHEpN1spqQDh6CwfZjm0mgJvrVH86xI
X-Proofpoint-GUID: SjTi-FtL_H0FuVFzwFwvGYatj93zCJOr
X-Proofpoint-ORIG-GUID: SjTi-FtL_H0FuVFzwFwvGYatj93zCJOr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_03,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 malwarescore=0
 impostorscore=0 mlxscore=0 adultscore=0 mlxlogscore=999 phishscore=0
 suspectscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507030082



On 03-Jul-25 09:44, Luca Weiss wrote:
> On Thu Jul 3, 2025 at 9:41 AM CEST, Krzysztof Kozlowski wrote:
>> On Wed, Jul 02, 2025 at 05:56:16PM +0200, Luca Weiss wrote:
>>> Document the Top Level Mode Multiplexer on the Milos Platform.
>>
>> What is Milos platform? Does it have some sort of model number how we
>> usually expect? Wasn't this SM7325 or similar?
>>
>> The problem with such new naming that it awfully sounds like family
>> names, so just expand the name and explain it.
> 
> Please go argue with Bjorn/Konrad about this, wasn't my idea.
> 
> https://lore.kernel.org/linux-arm-msm/aGMI1Zv6D+K+vWZL@hu-bjorande-lv.qualcomm.com/
> https://lore.kernel.org/linux-arm-msm/b98d305b-247f-415b-8675-50d073452feb@oss.qualcomm.com/

Milos is the "real-est" name of this silicon. All the associated
S[AM]|QC[MS]s are just variations of it, with different fusing.

You'll stumble upon it across e.g. firmware build strings, as
well as in any documentation pieces.

There are various internal reasons for the switch, but the most
obvious external-facing one is not to have the user buy a devkit
and wonder whether they should use QCS9100 or QCS9075 DTB, and
why there's zero drivers code for these magic numbers (they
include SA8775P). We can simply point them to "codename" and
all C code will refer to it as well.

As for external reviewers not knowing what the platform name
refers to, this is nothing new - AMD submits colorful fish names
and it's broadly accepted practice

Konrad
