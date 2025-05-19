Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A7F2459C7
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 10:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747652031; cv=none; b=K75jfrF1TxQVBXHU2zuoZYQXck7B6DUDxoClQ3baveMjC8YLZ0a/3WwgS4OvtRO9/hea93BTilNH9uoFkUz2X6Nmk6F1Bee5x0GHkOlZupzVR0bzPmRRRg3cIxHe9Dhewc0iXKrPIP3OUDJT+I1ed3EPLrmZViKayS+NabGoSLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747652031; c=relaxed/simple;
	bh=hhHKNb/E8IQ4a1HJma0UcH/dXAFbp1KwEvzCsLqEII4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ey6eQphBd87tv9iirghsOYrsenW22emNWcjiMZ+cXvo1AU0mlVaibWXByRv+c7wFtUBajCJdvBk84GsGn09wThDJ7kdxDrQPOyZ7o6yRuda4i533fHGlUgZo99A+uTusUgbjSBKVlKaffmAfvKnJZPo1xxrI62/mSBRwICEWMAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H0kfU89D; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H0kfU89D"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J9XowG023467
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 10:53:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q+ZG7E/JOJn3gru/ymdvfkkcuGEZIz+WemC28vQ15Do=; b=H0kfU89Dgc91NYIj
	KM+/AZi0xRIPAUlSwDUQ1l6+kfMTHkXkr535vmRotWFjrSKfcirx0mqaTGcDZWLD
	ylwIzHwS80SHxKQOYqLH12zlJie6wTsZBdgTaRqq3l5/mT5uQyafOsmf5q9XE4E8
	uM8JCWa33VfJUXvU1vK5wxW+tYFeMrcoCDuuFkh6xo/7Ex4VL0nxnneyDiv8G6U6
	vr8aezUtBiYGhcuskFwXYhR27a4GZ9QBf3d6K8L/UINNUOEFd6HM0TAacSMd/u5f
	kVzfE1btF9DlK99RzzqT0FIvU50tnYme4xfKkbD5Aj9TpxRImOcY1LW80KfenYMe
	O0dfug==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pju7c29r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 10:53:49 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7370e73f690so5325901b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 03:53:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747652013; x=1748256813;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q+ZG7E/JOJn3gru/ymdvfkkcuGEZIz+WemC28vQ15Do=;
        b=suS1aLbSS57xOmc786gkyeFvVrvR6IN+zoQ4rb2xKY4A87uuKRCdZhv/eB1LlgY2N6
         JJHZg+JPCVfvOnKu6K9QQyr3FaYd9WO00tv2ru/oKdHntpBq3AmHyW7ROZh7E5fatriV
         ITTse6qh82U7h4xbclDdDfU6zzm3sVS07rn/w7Yb1734/IMmwWGWaa1SL2SbmmF9DgHx
         UGF72UfsD0X0HR5l+HqFAM7um3ZZFOz6qBbIeVnrhdf3nTgrBX0g9WrYVMZhL5T4v2F1
         djzSB+SIAPGKAWNU3jIrvG8Fmwz+NRVAGgCRuion4qML0siYuWxzB664UXPYSUqfQCcE
         RC/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUFtB2HNezOt+gUeN6GwAYWtmOeKemsRj/jRfX5GKNFxES1FkR0epc5pQ0bwxUVu4cvIiK1TFpzE8ngmAM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/jqLCtdb6M7JRs6bOjXIz/DbJsouD51xpZl5PuDSLVWuBxq3Q
	LAsIxxbkT7QNaSs+ruPuRUS/DRzzhF/Vt2bRsORfTyqgmCCv4EgYHBIXIKvVCdSHeN5uRIU7KLC
	DfDiIDU0hbJNJDoQbju4js5aHILFPEQCPLkS/uuD5KngdjDLdNqXwzrysB8a0ko/FcLM=
X-Gm-Gg: ASbGncuCAJzPmqt6lKSQ5FdZyjkZkxbT4RLwmAePBaffGfQsa+M5da8UetWYLcs2AWP
	EBLRdEJ1a8ureuvF3Nfem/7+yRLLz2SE2FdecrHuI+oSIRzSTSYsjXgIDmTdWn+q5REqSTDlYBo
	PEKSe0bj106rK9rC3HaBIWK5JQFshHl5x8/BTAMQKiLyZX6JtqM8E9SmDIUp5zVc/KgMqldw5G+
	3rownj72knQRN6wNQYvW+omCB6oY5p9MjnRGpZMgk7sdD9ikajlLC1YRsQTN4n1ueUzvJ42PVg5
	qC2oHVYK0wLKa+tiyaQXUB1tnrI3Knm8RpKDgw==
X-Received: by 2002:aa7:9307:0:b0:73e:30dc:bb9b with SMTP id d2e1a72fcca58-742a978948dmr17785604b3a.2.1747652013136;
        Mon, 19 May 2025 03:53:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGrCA3ts80vPVWBuJh01f2u87CCoVZB7Kcjv8ZQtCorGnLjmsfhC9Kytj6R6pn2YQJ8MxSw0w==
X-Received: by 2002:aa7:9307:0:b0:73e:30dc:bb9b with SMTP id d2e1a72fcca58-742a978948dmr17785575b3a.2.1747652012726;
        Mon, 19 May 2025 03:53:32 -0700 (PDT)
Received: from [10.204.65.175] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a98a2550sm5924978b3a.167.2025.05.19.03.53.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 03:53:32 -0700 (PDT)
Message-ID: <b1324d19-9a61-46d4-b7cd-5fffabf95685@oss.qualcomm.com>
Date: Mon, 19 May 2025 16:23:28 +0530
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
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <dgij4bftqzog6muu2tsaq7vxj2lpjh4ahwgrpt4ztsvch5juey@4ki5ly3pzuad>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=XKEwSRhE c=1 sm=1 tr=0 ts=682b0dbd cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=rIkCaffdF0HaKj1PvZkA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: WzF2EAQlxmv747XPDaL8xQZzgXbT_dIA
X-Proofpoint-GUID: WzF2EAQlxmv747XPDaL8xQZzgXbT_dIA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDEwMyBTYWx0ZWRfX69v6SAF0kAaN
 gHXRLSK/FhkaiX2OfrhqvzxnOlwHx25bP7Lcu+80F2xWL+gTT5f3wGrAXMEBZUkJQhQSrzsXa9F
 vs34i6I5ZXBcjlHmiekxiob2ZZL41o3Krkzp17sHeOykdHvLGEixQDIdFRkXF1/EjzXHi+T7/Tv
 sJh5jIv0X5lw4FKJaKZ/jw4M81kVcCd6LzSIM0TdJcColP1E2AlVLsAi8jtnn/w8k49D4Nif8iV
 Uta4W9JqqDQFN6vj23Q+TavU3If3wLOGuI6DZU9SQntZYm6pm0OSnE0zUQjDC/Cd7CNQPSQnO/x
 I6uN/crGF/gTmsmUfkVMeKOQdFb5CON//nlnO3mqW6/a++CDqF8x4OJHq2UWmY2hMZeuWU2GicW
 g9/22Mb/vpd4x3seOHzuJRpioKq1BlPzoU8ZETbLWvi2AogMA0+HC85X03F1YUbh+3gK5tgf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0 mlxscore=0
 mlxlogscore=999 phishscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505190103



On 5/19/2025 3:47 PM, Dmitry Baryshkov wrote:
> On Tue, May 13, 2025 at 09:58:23AM +0530, Ekansh Gupta wrote:
>> The initially allocated memory is not properly included in the pool,
>> leading to potential issues with memory management. Set the number
> What is 'properly'? Which issues?

inbuf.pageslen is getting updated to 1 in case buffer is allocated, which only
happens if (!fl->cctx->audio_init_mem).

Till now pageslen is always 0 irrespective of whether the memory is allocated
or not due to which audio PD is never able to use this memory.

I'll update this to the commit in the next spin.

>
>> of pages to one to ensure that the initially allocated memory is
>> correctly added to the Audio PD memory pool.
>>
>> Fixes: 0871561055e66 ("misc: fastrpc: Add support for audiopd")
>> Cc: stable@kernel.org
>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> ---
>>  drivers/misc/fastrpc.c | 7 ++++---
>>  1 file changed, 4 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>> index d4e38b5e5e6c..b629e24f00bc 100644
>> --- a/drivers/misc/fastrpc.c
>> +++ b/drivers/misc/fastrpc.c
>> @@ -1311,6 +1311,9 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>>  		goto err;
>>  	}
>>  
>> +	inbuf.client_id = fl->client_id;
>> +	inbuf.namelen = init.namelen;
>> +	inbuf.pageslen = 0;
>>  	if (!fl->cctx->audio_init_mem) {
>>  		err = fastrpc_remote_heap_alloc(fl, fl->sctx->dev, init.memlen,
>>  						&buf);
>> @@ -1335,12 +1338,10 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>>  			list_add_tail(&buf->node, &fl->cctx->rhmaps);
>>  			spin_unlock_irqrestore(&fl->cctx->lock, flags);
>>  			fl->cctx->audio_init_mem = true;
>> +			inbuf.pageslen = 1;
>>  		}
>>  	}
>>  
>> -	inbuf.client_id = fl->client_id;
>> -	inbuf.namelen = init.namelen;
>> -	inbuf.pageslen = 0;
>>  	fl->pd = USER_PD;
>>  
>>  	args[0].ptr = (u64)(uintptr_t)&inbuf;
>> -- 
>> 2.34.1
>>

