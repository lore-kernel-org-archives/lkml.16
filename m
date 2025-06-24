Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFFD017A2F8
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 02:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750732824; cv=none; b=KkbR0faTcVvkGC1kEoEzIUz3E8rdkO7E8KxpPzhUVZjY0WsS0K3AP7F28nOSwyERit2MAXouvB6WkFnKvMaZaZyHHYSPyr2qqCKQuX2N0VWkGFwNNPg2OIoW9QnjHv2CJurfEylGaqHIsCzeM+hfKyiJbVcVrf1pXWOa9OAJLZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750732824; c=relaxed/simple;
	bh=enTOF6FIzn9wWsAyYbgHTZ9l+Kvoh1jGzhMq4Ig/1JY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VUO8brQtlcOXSg1vlRAZ9bDvZFBsTLJF2ulPXHm7MQb9KxPEUyg2SHB1Fq0xZOLjus1H/LKfQK9IGVQBxO0GECzViNzeRU3yhWD+MNpK/p51gFlqcim7Z6KkouytTjsNRUfgpMq7CumywkJKh3QuThPCAB/hu4zrOJfdWJmqu8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=auQ/emyc; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="auQ/emyc"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a5828d26e4so733508f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 19:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750732820; x=1751337620; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NwpXcIqfYnXwglQhFL6GpMu90ycYFYBcj7QErSUqSgA=;
        b=auQ/emyc/8mZNSoUU0/QoytTMJPExQbMJTeEVeVoV7v+deakUfMdwPrWHgLSMLiJgN
         biyfaNkla4q3bkAOHge+NgSL7IW3eHtiLqscqWtKGGR3WNVn7bLmrRHzP9IyHOpUgduq
         ACrt2JUdC39RG78KRFp3JacKuwUNY7fEocQL0cBinrKdIEH4pn2BGnwCdqf6WDa8VyvP
         Smi5Gy/kOb6t0YD1SDuQlN7vLisnZiFLTt0HOHsW0Ikvzibk44CsgJAkOocVg5b5zbKp
         i6CjM0PRKszrur0VHdPgJ4ic5DUMlM1tdUW4h4sV6A+YYQ5WrqzVDf6DyDT9AH6QK2S8
         OhJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750732820; x=1751337620;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NwpXcIqfYnXwglQhFL6GpMu90ycYFYBcj7QErSUqSgA=;
        b=SIcrnRsshJWxWDWTG087BrpcxnlLXzuctzcz84BsMFaMOPOHJa0ONkLildrZ/61CeY
         04BI7Oq/wkIFjF5ADCKUgEl3FA/Zdrjh6x+zrtu8bsOut2FaBEGhz0D9RHZ4ZSzir8O+
         b25rK7gN/PXAcjU6nlGEvzNd5hbvd7fwpi1he5Ea9sW8hslVtsFjv/y/pCJppaSdhzx1
         Xkyzl78H9jWbyZ9bIKu04zR393B/z7Kw3QA+BXVEWDZKAvMHMs9EvV2hyNsXexojlZNU
         9FfpBfVHKz8SGNQXNzBscqBsIBKpzhuPEEZXYSCG/62qib99E1iaIECnmPjyxOLP8Jvj
         bh5w==
X-Gm-Message-State: AOJu0YyjBUdlWVf+Q6jPBEwL6WUVvAKMQn4ENoDhWgAr31FJQN+Y3Ld2
	WoFyMSdBo995x4Sex3E3vOR3xQ4N/4NXzjoy6xcpS6tnRC8pgDM7kGAEi5+7DzLXQxg=
X-Gm-Gg: ASbGncufkLYJnIRs7PqML1Y30Rv6fr6N4CnBM7WIxWROkh57PfAm0haU2KPCgWHoKbK
	X8eVt87jQsVOhzSSrbx7gik6kQKb0pT1acOhr9A91aYXuQsaqXUITcnUx4gcEGAlZRx6fNQaEn9
	szy+OIf0Q6W0zLb/oUovzHLlnuB3YRW9nrU2zxYiEB1WS9RSd75J3Awyii8Trf5GzatLTgeHkeW
	FtMD2bESrTAoMqhkOhFMvmiglZErFuE725OezQ1jMZzYdmARKamx1oZlS3+txwGUNKBW45+jNRp
	VUexvHQifONJaZlEUnyWKWeIym2T2BWdemKEvsH8m7uOqmpFHI9g1FBufSmcM7rDZw8=
X-Google-Smtp-Source: AGHT+IEbqdclaAWUAWaYHwVY2zKq3xTnPeMuXhaeWz6w8mGwqFsDw03lzO3ccYAE94DQmRS/3SPWxA==
X-Received: by 2002:a05:6000:2486:b0:3a5:3369:52f3 with SMTP id ffacd0b85a97d-3a6d12d736emr3843326f8f.3.1750732820059;
        Mon, 23 Jun 2025 19:40:20 -0700 (PDT)
Received: from [10.202.32.28] ([202.127.77.110])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3158a331babsm11877556a91.46.2025.06.23.19.40.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 19:40:19 -0700 (PDT)
Message-ID: <c9467d9e-5cac-49b8-b839-179dc79d0bce@suse.com>
Date: Tue, 24 Jun 2025 10:40:15 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ocfs2: kill osb->system_file_mutex lock
To: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>,
 Joseph Qi <joseph.qi@linux.alibaba.com>, jiangyiwen <jiangyiwen@huawei.com>,
 Andrew Morton <akpm@linux-foundation.org>, ocfs2-devel@lists.linux.dev,
 Diogo Jahchan Koike <djahchankoike@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <934355dd-a0b1-4e53-93ac-0a7ae7458051@I-love.SAKURA.ne.jp>
 <faf70481-09dd-4c7a-bd43-f1e8bec877cb@suse.com>
 <675ea747-5c05-410c-888c-fe6dd2b48d87@I-love.SAKURA.ne.jp>
From: Heming Zhao <heming.zhao@suse.com>
Content-Language: en-US
In-Reply-To: <675ea747-5c05-410c-888c-fe6dd2b48d87@I-love.SAKURA.ne.jp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/24/25 10:17, Tetsuo Handa wrote:
> On 2025/06/24 10:33, Heming Zhao wrote:
>>> @@ -112,11 +110,10 @@ struct inode *ocfs2_get_system_file_inode(struct ocfs2_super *osb,
>>>        inode = _ocfs2_get_system_file_inode(osb, type, slot);
>>
>> In my view, the key of commit 43b10a20372d is to avoid calling
>> _ocfs2_get_system_file_inode() twice, which lead refcnt+1 but no place to
>> do refcnt-1.
> 
> My understanding is that concurrently calling _ocfs2_get_system_file_inode() itself
> is OK, for the caller of ocfs2_get_system_file_inode() is responsible for calling
> iput().

We have different perspectives on calling _ocfs2_get_system_file_inode().
In the current code logic, _ocfs2_get_system_file_inode() is expected to
be called only once. Subsequent local system inodes will be retrieved from
the cache (via get_local_system_inode()).

> 
> The problem commit 43b10a20372d fixed is that there was no mechanism to avoid
> concurrently calling
> 
>    *arr = igrab(inode);
> 
> which will result in failing to call iput() for raced references when
> ocfs2_release_system_inodes() is called.
> 
>>
>>>          /* add one more if putting into array for first time */
>>> -    if (arr && inode) {
>>> -        *arr = igrab(inode);
>>> -        BUG_ON(!*arr);
>>> +    if (inode && arr && !*arr && !cmpxchg(&(*arr), NULL, inode)) {
>>
>> Bypassing the refcnt+1 here is not a good idea. We should do refcnt+1
>> before returning to the caller.
>>
>>> +        inode = igrab(inode);
> 
> We do refcnt+1 immediately after cmpxchg() succeeds, for
> ocfs2_release_system_inodes() which clears *arr is the place for
> doing refcnt-1.
> 
>>> +        BUG_ON(!inode);
>>>        }
>>> -    mutex_unlock(&osb->system_file_mutex);
>>>        return inode;
>>>    }
>>>    
>>
> 

In my view, your patch has logical errors - at least from my perspective,
I have to vote NAK.

In my view, for this syzbot bug, the better solution is to block/deny write
operations during the ocfs2 mounting phase.
There are many syzbot bugs related to writing data during the mounting phase.
I don't believe there is any reason a user would want to write data before the
filesystem is mounted.

