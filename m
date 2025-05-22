Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A28148827
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 05:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747890710; cv=none; b=E9uEaV54Q5Ftr4LPVwjVUZISyBT4WVHWubhpMe3kvxuENJMGWWTFoQON8NzBWeEHHoxg+BX7BAHkEPuwDsfyu/jtsgsBMpux3fasLZ1R03BXBPkfuACXFKIx2KCA9Tf0B1PlOYOn46NeZ43x0ppXpZuD6cQNppGeBVaG933yhAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747890710; c=relaxed/simple;
	bh=QjZeiDrbEQlfvjSKrEL51aJFlWsW79dljfVaMyaRPrA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FwL21bji5i5nHcC7fKNteitQHRIkTsuSwTiknmRKgszeemBP6Kug1ayrf4q24B/Efq/RVl+2NvBx+Nv5tN24SyZRvhxNpO2xlAj43tuvNJKpU8cH0KM7eE4DyLyCYpWQ39XA3Whye8ynpgbP9QCJ0jToewSXANY8kqSAfFtLrMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TgEz0WyI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TgEz0WyI"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54LI14dg031702
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 05:11:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yH0tvCc3KicUvHT3d3nDCnjROeZOFwEqUxq5ncMRAaQ=; b=TgEz0WyINhyGWgPz
	HGsDvSNeAOndlR+CKWxEVyTPCzPDJmcKZFaADEXCk3a4ISnBj7345Tv1JKqwt96u
	5P63qIIkXGcAck20iAxxQ5zGRPcDqspZ8zFqNVtSy/Eu5aJXKTLYcX0JJY02J32E
	zwRDrW62UrGJeFBN6o8t2sMxccNUgxTJ5AEvYsgggtCXNz4nD44jBHs2vnHs0Tqq
	TYdo5yEpLIzu3G4febfZ6XC5qKy/YMLVJ4IQPH6wOX0Um8bI44k8izE+bL1VayhL
	SBl9oPqRaVPiG9XgoJsNq5Racb8thhHeIzWnos3yNjD1J7FDyh473IFAnMYhtUBJ
	M9d4XQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46s8c23mjc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 05:11:48 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7429f7f9ee3so5350945b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 22:11:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747890707; x=1748495507;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yH0tvCc3KicUvHT3d3nDCnjROeZOFwEqUxq5ncMRAaQ=;
        b=kUGQmJnON0M9a3FAcE+lhWHq1WNmXkEP9CG5HwOGAqO55xXRH2M2Q6UwIaF4rTme/Z
         rZcc3KyZrOR7MVJudNwGyq4FdDxNsgXOCzFggnb85ieHfXg+b++OI/65sT7A9U68GByV
         13ULLOZyFGvWbFzLCk8bE8hNwOrQ+hJd+6AlZHWdAfOtYS4XG8d4KOjoJgAyJloONjsj
         NN28pBZjPz+xFH966bvXvFP4vHC1DhewPChRVzuH+NA4UjNEQNcN1D1uULUL+fS0Ufcp
         2hX8WsL7bP4J/CwxiocrDDfT/ZKmtgA1I+eK7MOPSZkjqbAm+HkotklLRzqQXWoBhH1Y
         azZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUf0gLogtKY+9cEZXl35dmN4b9dcQ3VyuDprG8+fSaPbhs0rSOIW0FCR0YxVcFMFYCNrKN1yzZbHtUtTyE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlVLwel94/4dNP51qXWiHRnk+SyD6NclVFalP7Q4IL5ASI1NyA
	Tex/h1KmOZ8CCt3URgwhpiqx7ACAOEynzFVm/RsJeZxQs2UwhCzplYllHvOIntC5lNogWcfa5XI
	Mjel/CIJ8FH1DIbxGrIqgwhpMtily2GEING3W4qZv3g8CLue0tLELoq96C21YjgozPMw=
X-Gm-Gg: ASbGncu6rt8nLDNNLGRwpwLXvzCG8S7A7IbCIOfDXDte3XSEk2N9q4Kc1yGTlQnBKkv
	yFBAQ+nVrZvA57rLee44wD/lWRsHwzPHGHS6U18VyYH92TCgNocPV7g44F5JfiFUhuD6de1sLlJ
	vfuUF639mITqfcjoSzt8SDPXHbaq6Qugx+FPXklazMd0szjjdpz+x0Qd54ufT+2w+KLRSNPzIVF
	f7B81ll+rTgzYuiH5rcgffOx3O1VSuotFICUqKqfrR9p0Ew2wv61IUKWp48nPtHGAGGMQTGC4DH
	lbiZdm6pznTRgLrTb4drU6tcZoAbipgx3s9Lefg=
X-Received: by 2002:a05:6a00:369a:b0:740:afda:a742 with SMTP id d2e1a72fcca58-742a9613980mr33868068b3a.0.1747890707071;
        Wed, 21 May 2025 22:11:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHG/dTVa4GXPqwNUeSN0A0GCG5iVoz9ExoAxjf6/frJwSzFAr6YcpgnUtwrLlA4Z+C+vjNWhw==
X-Received: by 2002:a05:6a00:369a:b0:740:afda:a742 with SMTP id d2e1a72fcca58-742a9613980mr33868031b3a.0.1747890706658;
        Wed, 21 May 2025 22:11:46 -0700 (PDT)
Received: from [10.206.107.125] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a982b853sm10824726b3a.98.2025.05.21.22.11.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 May 2025 22:11:46 -0700 (PDT)
Message-ID: <e9f540ce-725f-4def-9b95-edb86429e96b@oss.qualcomm.com>
Date: Thu, 22 May 2025 10:41:42 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/5] misc: fastrpc: Fix initial memory allocation for
 Audio PD memory pool
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de, stable@kernel.org
References: <20250513042825.2147985-1-ekansh.gupta@oss.qualcomm.com>
 <20250513042825.2147985-4-ekansh.gupta@oss.qualcomm.com>
 <a277c632-1701-49d8-a7e0-80d28afd3a2d@oss.qualcomm.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <a277c632-1701-49d8-a7e0-80d28afd3a2d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDA0OSBTYWx0ZWRfX+RsBCjVaPy8E
 ZE6vySou2uOnyeIhi3H8ZR97xdrCVZPxuzifW0ot7j0dglvmEtknwa3lRp9dasSVxnbfn0vIFlG
 nuK+dz6lh0ZezBxTUhCyYbzSkx4jLJnNwkmwK/GSDTW2gymwGWqDIJvD3rzXI506JtluMJHIP9s
 0t6jnkdY+LFQxFVTgQJk3K5aM1Q5BZFwbPtSf4otFVxvR9Dc4qtUwgtgtEnOeSJiTPEfpsUyj96
 NR4HsjC3FLK4xAp1U2IpHCI8jDkphZkvqDb/xNQzQUELZE4TQPjj/wZqyHIw81i3rXcPOoyRg7m
 iCcMGa4Vlnt07+gjk+AUVC0HDuNb81/UXA7OYOzjE9yZFYNDWoAbhmdZ6DG49T5ZbkoRK1NjOed
 tU+AF4h1VGVZaLAMPNEFf2mxVYNFEc19U0zS2fdRTVI3J9Xubvh4VqRGwbYXQRM8wJKtTTc1
X-Authority-Analysis: v=2.4 cv=RIuzH5i+ c=1 sm=1 tr=0 ts=682eb214 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=Z1Fpul6eystrl0X_OCAA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: FVL-blaIi0hCdJfkRZT9BXy66IV0jQdK
X-Proofpoint-GUID: FVL-blaIi0hCdJfkRZT9BXy66IV0jQdK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_03,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 mlxlogscore=999 spamscore=0 lowpriorityscore=0 mlxscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505220049



On 5/19/2025 5:11 PM, Srinivas Kandagatla wrote:
> On 5/13/25 05:28, Ekansh Gupta wrote:
>> The initially allocated memory is not properly included in the pool,
>> leading to potential issues with memory management. Set the number
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
> inbuf is not used till the invoke call, why are we moving these two
> lines here?

I just moved it above so that the pagelen is updated properly.

Would you prefer storing pagelen to some local variable and then eventually
assigning it to inbuf.pagelen before making the invoke call?

>
>> +	inbuf.pageslen = 0;
>
>
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

