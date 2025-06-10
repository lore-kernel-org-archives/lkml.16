Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7856C23ABAF
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 13:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749561438; cv=none; b=rt8CANP/SYFJ2jKF9JEuD+M4sZz6SNAFMKxE0CHAWwxdGe2d1BUFt1pRBx9Q/KRutYcFsRPvF193OcUR4nX62OSpLN0nxB1T/nEszFwp+yw/h+x/SSm6Oe/qdoI96gX+B7lPxWddviXA3tcNk4O3h7aywcI09Qch3UV1H3VosW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749561438; c=relaxed/simple;
	bh=bhvvbURtJCy6EqzmJP0I17274upQekqJQmILk5oNEhk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UjxJATryqCakemeiqvf2igDwFfEVrbh2o/S9+3ClLE4Lzlijetpardpo9iehAxYcoM5ry429MgYfyEyWP6XbBfM37zarHIWIy0d2UfDQJIBKWmMR7FBjMQoxMnpbEWAPdzgP7xyThdbMjw4LXyYog4j7VETfXlhsiHntRg+6hXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MGRbBcyx; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MGRbBcyx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749561435;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ak4+7YbD/BHNcPWV8U+CoZWWNhHBXTJwqMrKqSk+orY=;
	b=MGRbBcyxsKxEVwVL2gdDWTHCwpOCg8UjT0bTmsKocTCJsaOrXkFSGrXS6FtMcWsLqoYzvX
	L8pfxSp2RCDTs6DahXV7a+1zT5zYOt5tO3W7jFkKFuooyaDq1P+YvlKPd5aaXc78zAMTkl
	+UGRaBKOiuDkGNeQ0wCswe3rKl2303U=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-41-UUnqO8uDP0eYSc2UiIHztA-1; Tue, 10 Jun 2025 09:17:14 -0400
X-MC-Unique: UUnqO8uDP0eYSc2UiIHztA-1
X-Mimecast-MFC-AGG-ID: UUnqO8uDP0eYSc2UiIHztA_1749561433
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-45320bfc18dso2721625e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 06:17:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749561433; x=1750166233;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ak4+7YbD/BHNcPWV8U+CoZWWNhHBXTJwqMrKqSk+orY=;
        b=W3ruG2WtyGf4HMyAGAJv6qnqhSyaKsjZCcbct8j2pGO1YIpR6CX7GYgu+f0Ad+1WIt
         WKCkP0i9FWXtCXLZY1TtEMUp/UEXz7mUej9jN2OHVUDRK8puvFH5IKBCvl9ulL7jlt7H
         jyGsX0WhPXbKNBcXnqupHcvX11/ap+Tf1YqCQoxzcav1ichVOx6Ogj5W8LENuk6ZQkLz
         yX9kNhZhhfP4NtEKSJz7BpU3g2t9fe+uC9cUOVIv8ZuDqZSNjS4xzGmbMHb8+FG/lu6G
         JnCWeML6vDC4uBNXGRQUNerSE9Jx4C9McR+aq5o8dxvJtFTfyyJbQlS5aAmdAz5nq6aJ
         OdHA==
X-Forwarded-Encrypted: i=1; AJvYcCU5tPviXerIFlP8Gn5JOgMt4Q1z7PGYdz2KGseSGoSTz/I7JMvC47J+1+wtj6UDRE+nHTrYyMvqputD86M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzlwn1FgZIAouHTKZS4TjH/OU6U+APvndMEJctF3KNATgftYaCa
	RQS1evMCeJXhJ39lRNDdU6xM07P/OzNsUSDQAcZrQ5SnuRADuV6r91okoG+Yt/SLzQaBr2P8zBJ
	BQ8nOIuci9IZS/WV2KVIBfI85G04t7Klz7PYaeAOIAvVjsyTgvJqOJlL8UQY7dQmsaQ==
X-Gm-Gg: ASbGnctcbU/LIUYCW50YZJERw47nv8RIZi5PnRhb/CNForg+q4i5f9ETQFJu0MfMTFJ
	VXI8kn45v68TEs+iLwv31bZH17kadU4CJCfTNPuk1ip3rl7hWa1fhruFuPSsdVJspVMRaY7EFcq
	GnYXsbeZusYM6C/TFXWyxGXVR72uam5JqupacdM35BXwO/2qVNLx6vsanoEGCuRcYEa2++AVGPj
	0Nmy57PVcNPMgfTGG2hAVu59jN0FsEIdayT5H7J+LiEZLNM5Czhvh0nN7522WN2on99UkZ/gUNv
	9IO1LeE0uis5kGnf7O8xaLjAnKndQ+L8CMSjA0jVS4iUWaAX+tR0sYY=
X-Received: by 2002:a05:600c:5303:b0:442:f4a3:a2c0 with SMTP id 5b1f17b1804b1-4531cffa4bemr36285045e9.13.1749561432817;
        Tue, 10 Jun 2025 06:17:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEyyaHIrj9q+GFjz8GWwvAGu71/DGkKJFxt16IB12f5d/uDu2g7SjgZ1qZyi11yKN2a6ehCBA==
X-Received: by 2002:a05:600c:5303:b0:442:f4a3:a2c0 with SMTP id 5b1f17b1804b1-4531cffa4bemr36284745e9.13.1749561432413;
        Tue, 10 Jun 2025 06:17:12 -0700 (PDT)
Received: from ?IPV6:2a09:80c0:192:0:5dac:bf3d:c41:c3e7? ([2a09:80c0:192:0:5dac:bf3d:c41:c3e7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4526e0563cesm144924535e9.1.2025.06.10.06.17.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 06:17:11 -0700 (PDT)
Message-ID: <95d02c29-abde-4100-a670-035483e1ecc5@redhat.com>
Date: Tue, 10 Jun 2025 15:17:11 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] userfaultfd: remove (VM_)BUG_ON()s
To: Peter Xu <peterx@redhat.com>, Tal Zussman <tz2294@columbia.edu>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Andrea Arcangeli <aarcange@redhat.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org
References: <20250607-uffd-fixes-v2-0-339dafe9a2fe@columbia.edu>
 <20250607-uffd-fixes-v2-2-339dafe9a2fe@columbia.edu>
 <aEgu-DA3pgKSYHRK@x1.local>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <aEgu-DA3pgKSYHRK@x1.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10.06.25 15:11, Peter Xu wrote:
> On Sat, Jun 07, 2025 at 02:40:01AM -0400, Tal Zussman wrote:
>> BUG_ON() is deprecated [1]. Convert all the BUG_ON()s and VM_BUG_ON()s
>> to use VM_WARN_ON_ONCE().
>>
>> While at it, also convert the WARN_ON_ONCE()s in move_pages() to use
>> VM_WARN_ON_ONCE(), as the relevant conditions are already checked in
>> validate_range() in move_pages()'s caller.
>>
>> [1] https://www.kernel.org/doc/html/v6.15/process/coding-style.html#use-warn-rather-than-bug
>>
>> Signed-off-by: Tal Zussman <tz2294@columbia.edu>
>> ---
>>   fs/userfaultfd.c | 59 +++++++++++++++++++++++++-------------------------
>>   mm/userfaultfd.c | 66 +++++++++++++++++++++++++++-----------------------------
>>   2 files changed, 61 insertions(+), 64 deletions(-)
>>
>> diff --git a/fs/userfaultfd.c b/fs/userfaultfd.c
>> index 22f4bf956ba1..80c95c712266 100644
>> --- a/fs/userfaultfd.c
>> +++ b/fs/userfaultfd.c
>> @@ -165,14 +165,14 @@ static void userfaultfd_ctx_get(struct userfaultfd_ctx *ctx)
>>   static void userfaultfd_ctx_put(struct userfaultfd_ctx *ctx)
>>   {
>>   	if (refcount_dec_and_test(&ctx->refcount)) {
>> -		VM_BUG_ON(spin_is_locked(&ctx->fault_pending_wqh.lock));
>> -		VM_BUG_ON(waitqueue_active(&ctx->fault_pending_wqh));
>> -		VM_BUG_ON(spin_is_locked(&ctx->fault_wqh.lock));
>> -		VM_BUG_ON(waitqueue_active(&ctx->fault_wqh));
>> -		VM_BUG_ON(spin_is_locked(&ctx->event_wqh.lock));
>> -		VM_BUG_ON(waitqueue_active(&ctx->event_wqh));
>> -		VM_BUG_ON(spin_is_locked(&ctx->fd_wqh.lock));
>> -		VM_BUG_ON(waitqueue_active(&ctx->fd_wqh));
>> +		VM_WARN_ON_ONCE(spin_is_locked(&ctx->fault_pending_wqh.lock));
>> +		VM_WARN_ON_ONCE(waitqueue_active(&ctx->fault_pending_wqh));
>> +		VM_WARN_ON_ONCE(spin_is_locked(&ctx->fault_wqh.lock));
>> +		VM_WARN_ON_ONCE(waitqueue_active(&ctx->fault_wqh));
>> +		VM_WARN_ON_ONCE(spin_is_locked(&ctx->event_wqh.lock));
>> +		VM_WARN_ON_ONCE(waitqueue_active(&ctx->event_wqh));
>> +		VM_WARN_ON_ONCE(spin_is_locked(&ctx->fd_wqh.lock));
>> +		VM_WARN_ON_ONCE(waitqueue_active(&ctx->fd_wqh));
>>   		mmdrop(ctx->mm);
>>   		kmem_cache_free(userfaultfd_ctx_cachep, ctx);
> 
> I didn't follow closely on the latest discussions on BUG_ON, but here I
> just stumbled on top of this chunk, it does look like a slight overkill
> using tons of bools for each of them.. even if the doc suggested
> WARN_ON_ONCE().
> 
> David might have a better picture of what's our plan for mm to properly
> assert while reducing the overhead as much as possible.

There is currently still a discussion whether VM_WARN_ON an 
VM_WARN_ON_ONCE could be unified.

In a CONFIG_DEBUG_VM kernel, the overhead of a couple of booleans is 
usually the least concern (everything is big and slow already) :)

> 
> For this specific one, if we really want to convert we could also merge
> them into one, so one bool to cover all.

One loses precision, but yeah, they are supposed to be found during 
early testing, in which case one can usually reproduce + debug fairly 
easily.

-- 
Cheers,

David / dhildenb

