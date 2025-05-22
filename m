Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4935F1A0BF3
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 04:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747889890; cv=none; b=m0jFI+elRh3tP9qGgqozwl0QKM5CAJ8EPCDxwgCbvonzkAR50onf5Kew/jXlfS8rB6p5jvtkvyrytHYQpGrJGBOO9ObYQaj0LbeCSgk0QRJwdpVzq5125PrmxyfQJOEckQDaMI1rezgSouHXQDGu52Norw536SrjOcTJcoT5MP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747889890; c=relaxed/simple;
	bh=yJiKEVbQQGNc5Hunh6IjNXb7O0oPVjSmIFL/eLDsTJ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lgayRJBRjyHxVPTUHmqQTDhSxC96LJWLeqqkfnzTY4wjiNWO3jN2JuBZ1EQUwXH8eeunX4zmIM75ucxNtD2YcgEav0AlEUEXhOLCIx2KHbYEDhlhzPPQbmnz1LpRee2aVQZl/08HHS5kpkFh6khWWca7gW1Ytx3pKTq1fXtbQw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M6NeIM76; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M6NeIM76"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54LHg0Z4000730
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 04:58:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TIhaT5G+O4jv+4Rppitttslv/f9qcTHwZaazaxC2X7A=; b=M6NeIM76qR3RGYkW
	GH263vXADcQAt/tpY4hKa4NMSSfJL4Wdvjb+3b4g7kEAdKFpuR5TS3FDZB/RqdBR
	9U/llcDtl5PZ0WRCUX2I411dxc3cbtnOWUhmq20P88WiGiChTRiUogEhsPLmdSsc
	YdAuUwvCa5u2u0QimnB5DoPh50nOizjvjQYsqeRc0rcn5vdzVhg0Vgz/HsFYMbMh
	e8UxUtRbGn0i58z/slD/8U8OULsY1v6rH6SbNP1GJerIjHOksFvc242CeAiG4VS8
	ED/t4r8v9ghRJSuZReTVW+LhU81uaBVHYi62FhpoIGdikH8gDyozTBJkUNKiyh38
	Pbwgeg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46s95tkdsb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 04:58:06 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3108d4ea2edso1469999a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 21:58:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747889885; x=1748494685;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TIhaT5G+O4jv+4Rppitttslv/f9qcTHwZaazaxC2X7A=;
        b=rnpKBaaJVsIn+yIIJh8QZXpNN1Q2K4c6Tw1TMogyRB6/KolOs8L3LWMQy5i2Js2W2c
         7saltkSAzO3r8dpsu7MXEYL+0bZpzAWfm57El+eqBKQu7N9LqemGxONkM+pzvqQSMj0D
         8ukZSfJSRRW7g9beMyDf+MF81a+dcobezuV7gUF/3OJSo1y0HnsD0ncedeNxph+KirGv
         2K7txbHEr9pysdS5Dzck+jhqPjJ4NIBj1RaJlAg0kgFnga45kWbqu4MwsyGDeVT5Tvaa
         Sxwngg67F5jSzq7+NGEGyPqikl7HxkhDp+Unv6x3avjnnkYkO5z6LjCa4QnEfWh43zp3
         ZAfw==
X-Forwarded-Encrypted: i=1; AJvYcCUBCAXEAp14VELvf+Gp6QQMWlMTDAggxqNqyocNKggo1fLFNcUOr+zP89LxD4YzqRe/sxebcNSbdqaU8HE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyseRBrITToPt3nA27qseLIq4uu38FOmZln7uj38MQT87QjzrPZ
	zbO1JdJ6KOE7LJqb+IaIWHWTErnTG2sC0hB6R2XgqhLPSbK6vnlGbMLYE59BcaMdDFTyhGT+L8i
	TlgWUZCw0idy28fEitbQEYiamPF58Qeep8xNgtC6HAtaPwqgNvroTm0WDOWpXxytpbjM=
X-Gm-Gg: ASbGnctPQRXzx9081Bn5Kqrma65qWDSZmp/1TPsWwZdHrqgL4YdkoEoGdj0Y5qw0/8S
	CzPzWctMMYBwrO/fVlg8wFCY/ecfwh0YyVhBogCAVHnHMwdMh3ph/nP2Mg5ZMisKEqrV2PEVRyE
	xUR8xXMeUHQPtfPWRsX1NaCR2cEfNtTdOHUo0NrZXCHISMdDcRSbx1ejF5A76EhDciPW9kszP7o
	IOBLCH9hyXki4bwI7RNPnHFZkdp1fdgMLsEVrEJzxWLVBS6HtvarxT923Y57GoAYYib1/2+R/Pe
	C0sODvH4fnDY3OfJnRsPgAuHMB2ghSwPyZHlAfA=
X-Received: by 2002:a17:90b:1d4f:b0:2ff:5267:e7da with SMTP id 98e67ed59e1d1-30e7dc1e9b5mr35746000a91.3.1747889885304;
        Wed, 21 May 2025 21:58:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHgFlJx8rTQWPzKRRylxW+8edqi7ODCCkLtM14szkgvjdsmG0w/1FW82rK8UWnnM3Flwuu/Og==
X-Received: by 2002:a17:90b:1d4f:b0:2ff:5267:e7da with SMTP id 98e67ed59e1d1-30e7dc1e9b5mr35745974a91.3.1747889884822;
        Wed, 21 May 2025 21:58:04 -0700 (PDT)
Received: from [10.206.107.125] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26f0824702sm9960426a12.62.2025.05.21.21.58.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 May 2025 21:58:04 -0700 (PDT)
Message-ID: <36327516-3db9-4bc7-ae2d-162135466e7e@oss.qualcomm.com>
Date: Thu, 22 May 2025 10:28:00 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/5] misc: fastrpc: Fix initial memory allocation for
 Audio PD memory pool
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: srinivas.kandagatla@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de, stable@kernel.org
References: <20250513042825.2147985-1-ekansh.gupta@oss.qualcomm.com>
 <20250513042825.2147985-4-ekansh.gupta@oss.qualcomm.com>
 <dgij4bftqzog6muu2tsaq7vxj2lpjh4ahwgrpt4ztsvch5juey@4ki5ly3pzuad>
 <b1324d19-9a61-46d4-b7cd-5fffabf95685@oss.qualcomm.com>
 <cqwvytawzuczg3drgojfddifsqjaxtzs4dcae2rjw7dag7n7b7@pa2mkmrlvqjb>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <cqwvytawzuczg3drgojfddifsqjaxtzs4dcae2rjw7dag7n7b7@pa2mkmrlvqjb>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=QKBoRhLL c=1 sm=1 tr=0 ts=682eaede cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=9ctudvHJBaFMfwVJERYA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: jBXvlkWS8aEFBAy4eYT1vKyKfrmQ-RhQ
X-Proofpoint-GUID: jBXvlkWS8aEFBAy4eYT1vKyKfrmQ-RhQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDA0NiBTYWx0ZWRfX9RtJcUUd+Tgy
 yYBsyozjNwlERNBy2nP1qKwWUnzpXeLOsj+GruckdXAuJIuZiRel02aQw7iwNEMgNzhaux3FmjS
 JK+4YUOG6XXyoeJBR15VAy6tG0BBGD/WRJdd6O4GKHV2zBRKAcVHDUzPPk8e1d2GJtR9zeXmmgn
 C/VG2zFsu/aOP3+CR7+20ndEimwFJOfHRvZwjB9bPamF2JizRApQBAf8OGziYUMWWHK54YGrTY5
 KGZ0/y1Lj0igiBqtKbD3nrhfjuGc8qX9HlscseRkn6lxgvwNPmyRBrZ8nPhO1B7DOYTtdy+uqcf
 D+iZ00ijsjZ2SR7vw/5x+8MDwOIYKkAuwkrTk4pBtbjAlHbOFAtIgnnsu1fpYj0v62AjtmBs1N8
 JzyF142vNcCOeAjs0AxB9PIMT8gC3NuOwd3F6vZ9L9pkty35bNqFbevb4872Ny6RWnW5z3O6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_02,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 adultscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505220046



On 5/19/2025 7:01 PM, Dmitry Baryshkov wrote:
> On Mon, May 19, 2025 at 04:23:28PM +0530, Ekansh Gupta wrote:
>>
>> On 5/19/2025 3:47 PM, Dmitry Baryshkov wrote:
>>> On Tue, May 13, 2025 at 09:58:23AM +0530, Ekansh Gupta wrote:
>>>> The initially allocated memory is not properly included in the pool,
>>>> leading to potential issues with memory management. Set the number
>>> What is 'properly'? Which issues?
>> inbuf.pageslen is getting updated to 1 in case buffer is allocated,
> Is it a flag or some page count?

This is page count, based on this count, DSP with add memory to audioPD
pool. If it is 0, the memory is not added.

>
>> which only
>> happens if (!fl->cctx->audio_init_mem).
> You are describing patch behaviour.
>
>> Till now pageslen is always 0 irrespective of whether the memory is allocated
>> or not due to which audio PD is never able to use this memory.
> and the is current behaviour. So this answers the first question.
> 'properly'. Now, the second quesiton. 'Which issues?'

The issues is actually memory leak as the initial memory is never
used by audio PD and it will immediately make a remote heap request
as no memory is added to the pool initially.

I'll capture this also in the commit text.

>
>> I'll update this to the commit in the next spin.
>>
>>>> of pages to one to ensure that the initially allocated memory is
>>>> correctly added to the Audio PD memory pool.
>>>>
>>>> Fixes: 0871561055e66 ("misc: fastrpc: Add support for audiopd")
>>>> Cc: stable@kernel.org
>>>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>>>> ---
>>>>  drivers/misc/fastrpc.c | 7 ++++---
>>>>  1 file changed, 4 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>>>> index d4e38b5e5e6c..b629e24f00bc 100644
>>>> --- a/drivers/misc/fastrpc.c
>>>> +++ b/drivers/misc/fastrpc.c
>>>> @@ -1311,6 +1311,9 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>>>>  		goto err;
>>>>  	}
>>>>  
>>>> +	inbuf.client_id = fl->client_id;
>>>> +	inbuf.namelen = init.namelen;
>>>> +	inbuf.pageslen = 0;
>>>>  	if (!fl->cctx->audio_init_mem) {
>>>>  		err = fastrpc_remote_heap_alloc(fl, fl->sctx->dev, init.memlen,
>>>>  						&buf);
>>>> @@ -1335,12 +1338,10 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>>>>  			list_add_tail(&buf->node, &fl->cctx->rhmaps);
>>>>  			spin_unlock_irqrestore(&fl->cctx->lock, flags);
>>>>  			fl->cctx->audio_init_mem = true;
>>>> +			inbuf.pageslen = 1;
>>>>  		}
>>>>  	}
>>>>  
>>>> -	inbuf.client_id = fl->client_id;
>>>> -	inbuf.namelen = init.namelen;
>>>> -	inbuf.pageslen = 0;
>>>>  	fl->pd = USER_PD;
>>>>  
>>>>  	args[0].ptr = (u64)(uintptr_t)&inbuf;
>>>> -- 
>>>> 2.34.1
>>>>

