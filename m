Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A1E274FFC
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 14:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751380473; cv=none; b=W8MSiex3BKFd8Iz95rcYNIcZN7krlYXodsBCF6laTpL+s+EtMYfMDLTg9N1JsUpptlZuuSZHS2MAkme9AgddnzqhWJPTnBAZeU0yZHlDpfBoYyqvAA+cnAIsHW20OUCWrRPrQpLak0CDB7HHO36I3vJjIts1QtORvDRwfNyztxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751380473; c=relaxed/simple;
	bh=KxKFudIMAkAUupfpwIU+ReorMdQsudmQTUyXUYvg8m8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jUhe/R1GOALyxJXIPrhgUuRNLln/ZB2Q38t2weatl/m2w2Bh9SeFu3K+9fvfeAjsO0jlhHrg/Dl2j7DgmkpfbKwzQmz1qJaBY2qHQ0vmm7+cvOsgIBCa2oZwwJBYvAHO1r11hGjDH+dYJp1gbaTwD9BrINdtPA902vo3y7o+LpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gCfItxb1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gCfItxb1"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5619ppmJ007049
	for <linux-kernel@vger.kernel.org>; Tue, 1 Jul 2025 14:34:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xdHjDJl9WSRNdehYgLqdLZay3sL60YxMRcboor7qHbs=; b=gCfItxb13G37CKPQ
	AASzooRSJZVMwwejVp4lLzb7zl8DfyrN0zxXtF4eTo87H+iKWenBQ+E6KeURP7WE
	7n98SeapqgpVG3dCssUi40xhchUYEhRzlhZ54EZMVCi3ROKd1XKtTRzZvLE3wyfb
	ObmfrvHl5kisYUNTeYIyqKW/0/poCD/tLSbKm976Ru6OvNNDSN+/2JK357yircYp
	DeyD7bv2zrIgsVPOzhI2UDAxPozc9bnnZcmoonWLbEY7aye3+c4LNi7yXKoF1ooR
	ElpKnXVbnWuix9CIT9raRiTkLHSX3rOYuA2sVp+yv4MyctC8YR8l/SCuu7THgrOG
	IjbCtQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47kn5jdjnb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 14:34:30 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-748a4f5e735so3444901b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 07:34:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751380470; x=1751985270;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xdHjDJl9WSRNdehYgLqdLZay3sL60YxMRcboor7qHbs=;
        b=BsMcC1wuKa8d8n/rTNHRG3gETSXnmYY0ixWY+Spy7kB6Xu5+q0euhKPbrCWzfQYBDF
         JtS2QlR9YBT+IafshkO/aWZRz+6iwecSv8dGGsNjpAwKyOXUKu1IcP+UGjfZufDDQbb7
         QXwL8CUfkuuW4mOYM3pGigT7hlLvJG1i/JLiv5B7HEwGMRxcGt5LDsNLJFlVsnbWhN+t
         RuNYQt+7vb5B+M3wAscU3zXRzmv5JnXMSiPFaUuqBteA8fNOhyVRDadcJ+bZfcUM9ozO
         RxzsnLdKcBjQT/RSKpmb4CaSgk3utJ/XX9lfP5pvO0Vn0IAbPElCeneRda2F4KHJ/aqk
         3G2w==
X-Forwarded-Encrypted: i=1; AJvYcCWkgaRgmc3Vw3Ebr6mQNzKtqes+5f0VTRyMvYFs/NJsVvYVKzkPnadukewSAVT1AYYkpHo7hXq91mQ1xz8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzW/n3Y2cN7aQmV2tyWMg//Sh5w8Jn2MFyeGHhZ0n3GHws2vZMs
	Won3/Dug5fSyjcW2ExLmAMXHV3L+PIZ2v16NwnTM0zLbazQufsFrh3L2iIiYwo+HB0EF/h1NLlr
	IgZ69pwmWwx42XzzYW9iI6H5dXu3hqtF2bWL1m2FiMmabxhQsVJ/o1XuY25M7UyE4kLc=
X-Gm-Gg: ASbGncvhbZkbq8CZXBuHiONSumyabMMSQrZNT96hlqmP98jklbpGBcvmk+GXLEGqrB2
	4fYryh++6Ferd9GgjHnYuEaGQ7ueeViS4jCdhBlPL0bBtYcCdFtJ9ajnys3cK3WWmXXDqRRstqC
	JloHYGAOlDXNOI6oIb/LJEPGbSAD3mKtNOHUYoI1M0/z2PwOZjxrDYpi35mGxNfjD3kn5lh5O4F
	G0NXVm5sqXtqwdHvEiiLWojbW7bG1fDu9R91YbMYcHOTj1DqMMc85vGz94p1oBR1WN1RjvILLor
	ALJBSKEqRmz09yimM7BpZrvZDCirFFKauVxxpMdBGYza3ruMyqzpvoCrEKc7u+MOyg/pvtc/
X-Received: by 2002:a05:6a00:9283:b0:736:3979:369e with SMTP id d2e1a72fcca58-74af6ee09d2mr23287912b3a.9.1751380469814;
        Tue, 01 Jul 2025 07:34:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGQXaFmKt5xsajJ65+/iX9gSySkf4+TXFivGFr9tmmWAw7KyPrLyH4ID3FavxTAaBlZvEOVFA==
X-Received: by 2002:a05:6a00:9283:b0:736:3979:369e with SMTP id d2e1a72fcca58-74af6ee09d2mr23287877b3a.9.1751380469375;
        Tue, 01 Jul 2025 07:34:29 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af57f2280sm12260164b3a.165.2025.07.01.07.34.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 07:34:29 -0700 (PDT)
Message-ID: <fe166777-00bd-46a1-a971-46a513b6616c@oss.qualcomm.com>
Date: Tue, 1 Jul 2025 08:34:27 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] irqchip/qcom-irq-combiner: Rename driver struct to end in
 _driver
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
        Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Markus Schneider-Pargmann <msp@baylibre.com>
References: <20250630172333.73614-2-u.kleine-koenig@baylibre.com>
 <563db91f-3080-4a45-ba0d-04f415ed90d9@oss.qualcomm.com>
 <4396deb6-049a-4649-afbc-fd20986b118a@oss.qualcomm.com>
 <5782155d-c69a-4176-8e57-3af938e5527b@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <5782155d-c69a-4176-8e57-3af938e5527b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=KtJN2XWN c=1 sm=1 tr=0 ts=6863f1f6 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=IpJZQVW2AAAA:8 a=T5rYVBXz9qOjrkLPEW0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-ORIG-GUID: sVBgTRIGtjIWlbrB0CBvBSzmBhAI_WUN
X-Proofpoint-GUID: sVBgTRIGtjIWlbrB0CBvBSzmBhAI_WUN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDA5NSBTYWx0ZWRfX1Bd3gf7CTDo6
 g+NgOEgTRJsQ94rN9e2MsIVihsLvmgbUDL8/2sXFsRpGwjujvBk8CWL65ktYRkNNvZ4kXwly8Os
 CtwLQLxKAAOj+5f0E4mJm05iy7CN6o1ioTDhKc75QjoxNmK6GqsiteUUJVSozh0JTRDrZ9tWVlx
 sAs/3A/nVjLxtXN95B3aMVVJGSUcO4fZ18jK/lWcQUK5Ey128jDvMSF0JK0GmJ7P+N8D/oDlPmx
 GHH3PZY3nzOy5axx+nMaccXwpTOSEkksXkfOsuL3OFiWt9JwwnCeVR9IonU93cctIqvMX+ajEgG
 4AAyT96Es3t9EdLuKCJWmPHy2804iImkg4Koh9HZwgVYzKyoqYk34ZRQI1Z9xBOh9d18+gwec/s
 0V/g5CsbMgQLLv5hk6SVQaHMvEoaxFV33cFRQHZMVO6qwINL1Ou0s7rj0+zT9GM0G2vJ10rb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 mlxscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 clxscore=1015 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507010095

On 7/1/2025 1:40 AM, Konrad Dybcio wrote:
> 
> 
> On 30-Jun-25 20:31, Jeff Hugo wrote:
>> On 6/30/2025 11:25 AM, Konrad Dybcio wrote:
>>>
>>>
>>> On 30-Jun-25 19:23, Uwe Kleine-König wrote:
>>>> The modpost section mismatch checks are more lax for objects that have a
>>>> name that ends in "_probe". This is not justified here though, so rename
>>>> the driver struct according to the usual naming choice.
>>>>
>>>> Note that this change indeed results in modpost identifying a section
>>>> mismatch in this driver. This is not a false positive and should be
>>>> fixed by either converting the driver to use platform_driver_probe() or
>>>> by dropping __init from the .probe() callback. This problem was
>>>> introduced in commit f20cc9b00c7b ("irqchip/qcom: Add IRQ combiner
>>>> driver").
>>>>
>>>> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
>>>> ---
>>>> Hello,
>>>>
>>>> I don't know if platform_driver_probe() works here, it might happen that
>>>> the driver is probed before the matching device appears. As I don't have
>>>> a machine with such a device I won't create a patch fixing the issue,
>>>> but if you have questions don't hesitate to ask.
>>>>
>>>> Please consider this patch as a bug report and better only apply it when
>>>> the issue is addressed to not result in build regressions.
>>>
>>> +Jeff is probably the last person on Earth that officially has one
>>
>> We are talking about QDF2400 here?
> 
> Yes (or anything from the same family)

Ok.  Will take a look.

-Jeff
