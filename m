Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE5BB2DE1FF
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 14:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750170605; cv=none; b=lKwGHzNkgsF66ic/hiHbjr2Y3JwR4yTumCSnR4Tye8aCXHPNVai1Ip4L657fPgrakCch4uTS2a4iTxFDFEfP3sJ952zUZ62m8taZwMxOrxD4gJMwRwXYf2hr5MarpEjdfoh3Ld4qHxtc1VFV9L8YluQUUby0b7EIXKeXpwEXujc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750170605; c=relaxed/simple;
	bh=1ht4S85AVwey5d7l0NR7hBt1ryp6HndTt4PB7ev0J5o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kYH//Tx8BCmtqglXalMZwEAMY22Ms7hzQmgMcy2eEgJQeFO3omZX+SoRiMCQi8hg568wOJcXny90z9GJP+louq4Yu4MfAprRVNS7R9UBvBnfJv4bwnjmc5RFZlfJPgL7w+ZHCjk8bvShLmHoa8kF+ayciASA7NTokVm9kAknK8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=K53yQI+4; arc=none smtp.client-ip=209.85.166.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="K53yQI+4"
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-3de18fdeab0so18428115ab.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 07:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1750170601; x=1750775401; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qm8ZESSFLfTrfNAmN4pCFwQBlQ23CDIRq2yjCkvIDts=;
        b=K53yQI+4B2PZ4L25WyHx/wS1azXhVGVgbHo8KmWa6tdBZupmdpG/69dJ+PNKIC0enR
         LVTzZhjA93pKri32gi80H1mo7BKFHfAFVV7qfUru+sELFhFfgS5K5dCugJEpOFBBxONd
         b/k1/GXKIz/PEgXkE/QnhlWQZ47+cRlLGtpZFl/UdF1gOHXeyzWMbyhw0xEjFqlVQ0SR
         p0B0Z0Lig1ifg5hX7RSpMP02emad9dv4ffxkDdK39pr6lJI1tLADxnG9TQ1/MdruJUXu
         HnFvO9xU8hsaElN+2JJSgVFWNwbcB/M9LUQugCyU36rZLR1t7KTaJgK9YnPvGxNn0g14
         Zl0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750170601; x=1750775401;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qm8ZESSFLfTrfNAmN4pCFwQBlQ23CDIRq2yjCkvIDts=;
        b=SuSnMiSObEg5OnjmIwjEKOjhBH59aUUl3ZbtdfzHWnacfQc0W4i46zNTzvO9+6JUev
         /mmn2/7KseTNHCA3xEJs4QURLqXjwhx9wONKJPt5jRBwsRJrPq6lqjEDQGW8fBH2tfdQ
         MXkQs6MXLQuXXtneytCq8fdsLASm207GgciUgSPE6/vfDPOzy0QSoQRuUszTC66a5F3c
         jvycM1OC6zELoUj7YUFp+txlUHyQLaZCCCKGcaoQfnerUxsUb0KAbYpIonVPqiATqjNE
         Vsu5LnHPyqQ/fDVcW1sxuWXVSHb8P+y0bTn1wkymhUL5B3aptkabDn37YblLW/73yYSS
         a6Aw==
X-Forwarded-Encrypted: i=1; AJvYcCV1ZUHrqlbpWuuP3I/mJ+lxotRJ1KFeLqKUALRMhdn3YMPbPr7FwZuEO6gqaAPy3Q94Tn1bcCKyqE5Y1R0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/hsN8rymPrp06yaWXoYUxa2jPlPUItaujon2rT9LC3lN9Baku
	dmJOlWapdZV1MVcNHjnAs03ICVs/rCT0cGVNzEOisOPXzzdk6VeZwY+fxP/1slD0vSQ=
X-Gm-Gg: ASbGncvU51AlVRsl7rmAyfjnfj5kinGHvV/E8J9GBTjwh3iG/sJZ5sI1DK/A5lWP6Ek
	DfctDo4gETfaVwLzaoo4yz7grO8GKi8pHS9IQUle4BTwmqTWcC90KjQ+MUut1P6Ok0LCGxnWtNl
	Z29+Cxc2MXzKgxS4qmDgH+ZjbFya23FnWEnRcO0UizdUnZoRKnT+xfO++aSUOJ+yW5N1UOhfAxp
	+9wzo/AWJJSgCdtp/3O4rM2UMHx9rrJvVQnguHmVK4D2yB+0hbEWbVb35mE+7kzSYJtC5xb/IBF
	uTMoTGsSUPeJ5Ekrv10t/roXdzQ0ybeR+5i8MwjE/mc0t7KKW6nDVj1RdA==
X-Google-Smtp-Source: AGHT+IGrGXdxWmYblv4T9EhQC7vXeISVu8lyWpXAb/V85ozNTAbFF4tPag0Cl0RdG9Ltkd6m5yvdBA==
X-Received: by 2002:a05:6e02:1a2b:b0:3dd:d189:6511 with SMTP id e9e14a558f8ab-3de07cd433emr186895695ab.21.1750170600918;
        Tue, 17 Jun 2025 07:30:00 -0700 (PDT)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3de019b4379sm24654355ab.15.2025.06.17.07.30.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 07:30:00 -0700 (PDT)
Message-ID: <06a466e2-0904-447e-a0d7-73ddc2da937f@kernel.dk>
Date: Tue, 17 Jun 2025 08:29:59 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] io_uring: fix page leak in io_sqe_buffer_register()
To: Penglei Jiang <superman.xpt@gmail.com>
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org
References: <618aaa53-14a7-4d85-90d4-6e4a8e1ce3a1@kernel.dk>
 <20250617140234.40664-1-superman.xpt@gmail.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20250617140234.40664-1-superman.xpt@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/17/25 8:02 AM, Penglei Jiang wrote:
> On Tue, 17 Jun 2025 06:53:04 -0600, Jens Axboe wrote:
>> On 6/17/25 6:39 AM, Penglei Jiang wrote:
>>> Add missing unpin_user_pages() in the error path
>>>
>>> Fixes: d8c2237d0aa9 ("io_uring: add io_pin_pages() helper")
>>> Signed-off-by: Penglei Jiang <superman.xpt@gmail.com>
>>> ---
>>>  io_uring/rsrc.c | 4 +++-
>>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/io_uring/rsrc.c b/io_uring/rsrc.c
>>> index c592ceace97d..f5ac1b530e21 100644
>>> --- a/io_uring/rsrc.c
>>> +++ b/io_uring/rsrc.c
>>> @@ -804,8 +804,10 @@ static struct io_rsrc_node *io_sqe_buffer_register(struct io_ring_ctx *ctx,
>>>  	}
>>>  
>>>  	imu = io_alloc_imu(ctx, nr_pages);
>>> -	if (!imu)
>>> +	if (!imu) {
>>> +		unpin_user_pages(pages, nr_pages);
>>>  		goto done;
>>> +	}
>>>  
>>>  	imu->nr_bvecs = nr_pages;
>>>  	ret = io_buffer_account_pin(ctx, pages, nr_pages, imu, last_hpage);
>>
>> Wouldn't it be better to have the unpin be part of the normal error
>> handling? Not sure why the pin accounting failure doesn't do that
>> already.
>>
>> Totally untested...
>>
>> diff --git a/io_uring/rsrc.c b/io_uring/rsrc.c
>> index 94a9db030e0e..a68f0cd677a3 100644
>> --- a/io_uring/rsrc.c
>> +++ b/io_uring/rsrc.c
>> @@ -809,10 +809,8 @@ static struct io_rsrc_node *io_sqe_buffer_register(struct io_ring_ctx *ctx,
>>  
>>  	imu->nr_bvecs = nr_pages;
>>  	ret = io_buffer_account_pin(ctx, pages, nr_pages, imu, last_hpage);
>> -	if (ret) {
>> -		unpin_user_pages(pages, nr_pages);
>> +	if (ret)
>>  		goto done;
>> -	}
>>  
>>  	size = iov->iov_len;
>>  	/* store original address for later verification */
>> @@ -840,6 +838,7 @@ static struct io_rsrc_node *io_sqe_buffer_register(struct io_ring_ctx *ctx,
>>  	}
>>  done:
>>  	if (ret) {
>> +		unpin_user_pages(pages, nr_pages);
>>  		if (imu)
>>  			io_free_imu(ctx, imu);
>>  		io_cache_free(&ctx->node_cache, node);
> 
> Thank you for taking the time to address this issue!
> 
> However, if io_pin_pages() fails, it will also jump to the done label,
> but at that point, the value of nr_pages is undefined because nr_pages
> is only assigned a value inside io_pin_pages() if it succeeds.
> 
> 	pages = io_pin_pages((unsigned long) iov->iov_base, iov->iov_len,
> 				&nr_pages);
> 	if (IS_ERR(pages)) {
> 		ret = PTR_ERR(pages);
> 		pages = NULL;
> 		goto done;
> 	}
> 
> 	...
> 
> 	done:
> 		if (ret) {
> 			unpin_user_pages(NULL, undefined-value);
> 			...
> 
> I'm not sure what the impact of calling unpin_user_pages() in this way would be.

We should just check for 'pages' being valid first. Updated below. If
you want to test and send a v2 based on that, I do think that's the
better approach as it keeps all the error handling consistent.


diff --git a/io_uring/rsrc.c b/io_uring/rsrc.c
index 94a9db030e0e..454cd8855c6c 100644
--- a/io_uring/rsrc.c
+++ b/io_uring/rsrc.c
@@ -809,10 +809,8 @@ static struct io_rsrc_node *io_sqe_buffer_register(struct io_ring_ctx *ctx,
 
 	imu->nr_bvecs = nr_pages;
 	ret = io_buffer_account_pin(ctx, pages, nr_pages, imu, last_hpage);
-	if (ret) {
-		unpin_user_pages(pages, nr_pages);
+	if (ret)
 		goto done;
-	}
 
 	size = iov->iov_len;
 	/* store original address for later verification */
@@ -840,6 +838,8 @@ static struct io_rsrc_node *io_sqe_buffer_register(struct io_ring_ctx *ctx,
 	}
 done:
 	if (ret) {
+		if (pages)
+			unpin_user_pages(pages, nr_pages);
 		if (imu)
 			io_free_imu(ctx, imu);
 		io_cache_free(&ctx->node_cache, node);

-- 
Jens Axboe
