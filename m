Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AC131940A1
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 20:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749068911; cv=none; b=PT0oQrZ8eIzA1zqVOq5EYzk1pX8DmecLnp1Dr3iCKxVx+iXwDatzq7EnjVtn2sGVOpsMhWUC6puesl+hyDSg/WHQwM7dP0WuVk8qvWr4b3gxj34VapYd9FHDye01xayUBHsFf40sC0lnXlzsLw8E1e/zAztRt++7uqv8LRRas7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749068911; c=relaxed/simple;
	bh=NW3NB2/XxYYHUk2UAEcXW8XZ0/osqZQKMSIp7sWXERg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R7i0MGqjw8O5FsqMXk6g52nOfsrwhqqdOGthZ4o2mQvGgs6LkwE1OZyfn3IDSTdEIDQzSEwUauzsx7LT/AWeQumfU2QQDxQtUf8FvwtQepy9qCGV9a7zUlj0mESdquewp+AZ8e1D5k7QTTE5RdI7ardS+/dPEkQQA+uQ9N28qPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=STbOoWeR; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="STbOoWeR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749068908;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=3mXomMYEWmzw8abJxYK0iDl2aIqCx2o/x5HDM6HbYQU=;
	b=STbOoWeRI4vXWc/XF6N4lG+9jTmvwetrMUHQcHRve9tL4vjDU/Wf7WWrVmI1PzmhY4DDNp
	3zZQ4BEhrUpGct+t2zCZjjxUJloh8K2knPySlhzpD5vYqwvXJWGixh6ygYJrNbpRrA92E3
	0GliFuT5fq/xmq+mI+qrNoRYHty4frM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-618-ZgYUGq9BP6qTJv7Dx3r-aQ-1; Wed, 04 Jun 2025 16:28:25 -0400
X-MC-Unique: ZgYUGq9BP6qTJv7Dx3r-aQ-1
X-Mimecast-MFC-AGG-ID: ZgYUGq9BP6qTJv7Dx3r-aQ_1749068905
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-450d50eacafso895185e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 13:28:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749068904; x=1749673704;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3mXomMYEWmzw8abJxYK0iDl2aIqCx2o/x5HDM6HbYQU=;
        b=eSznyASzdgeNmTXU8Y5zN0XFH/aV8MO4h94KcLK3qeh1gLt5qrVoxIB5c28lT9mDzk
         weprvRoXR1fR05wVj9lgnHR+l4ucQ7RgdCCkAkEoLIc0FvnJ8Rtw+Ca04gbGX4Ojgb+u
         T+jU8lU4BGkJEGU+qklhQRuQpk1jqWeOce+4c6W2AUuOdeR8LniNric1PrnT3uytMcdp
         2LT1PYcAzPA+klRSrtxgw3zvyEM4agfpT21OS+lkEb6M6DAKYr61MZw6qKEe8pVQwdjp
         7QOsBrGc9hFETywaXb7En2bETgeJm9V8HVBnziEzCr5CJZlMvIiJCZ+cAhFUCoq0OzgT
         p5Mw==
X-Forwarded-Encrypted: i=1; AJvYcCU8c6XxnPpdi7sL5n5u2+PzByWE691L55EqXb17/AiwDLaktTsT/mAW/u50TYupyhzPIg8Ut+RK7MQHFnQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzp/MYR4uFqCVsM9qbC2ed0kNofceDLM5KtkOc8JGUJtpDWIaay
	y0GJxH9RQVWwh6MdbC7GMZkEzhqZsHNF9DiwpKlCWR6Hv21J08SsvGTArxUwnYWwzJ0C/uaxofy
	LmTPGB9NCyTQtm5Ezb8dyBIkT4wBAll7MIYYWOYZE9gkG6YPmnlbjTocGF6zLc5owNA==
X-Gm-Gg: ASbGncvFU9uH3YXPKLqKq9zU3IxQmVoFYL81ulBrixaiRaxD9r64R7UFEW4G/CI05iP
	RtG+1yg/ZxhK/36Zc2bN/PBXET3e9FFAbeor0awNzE4a/dJCTTKehfNsntrvrRH52KOJBWTb9Ku
	mP7QtqjSvuqL058z7rLJQgr1wrz+KcfrDtqxEVRg+j7vGOordXp2EyxbxPQQ6TuVrt07dZgy2DU
	3/68ENbDECsvl55OyBmGG5KpgrpNc6ySR2WbN8Smnf0NJGOBuiRJqjBxJih55RxW6F7bFREYWmo
	EEIL4uIGS9nlaVRkNPyjsM7M8FNOG9xSLVGNLOX9j1WuHPKLNvKNs8Sua8OXS92fSK2DoTgTt8R
	EtypCi6OrjiuXtVyV9r4O1hP1k42nBShbJaoVhmc=
X-Received: by 2002:a05:6000:1a85:b0:3a4:eeb5:58c0 with SMTP id ffacd0b85a97d-3a51d927c98mr3695631f8f.20.1749068904470;
        Wed, 04 Jun 2025 13:28:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFnwlb5kel4xQbDHcn4LqfuGR/PisuYT/scZ+t4RYY2+IkwJD1KYgbue+UQgw017AB9pyitUg==
X-Received: by 2002:a05:6000:1a85:b0:3a4:eeb5:58c0 with SMTP id ffacd0b85a97d-3a51d927c98mr3695610f8f.20.1749068903977;
        Wed, 04 Jun 2025 13:28:23 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f1b:b800:6fdb:1af2:4fbd:1fdf? (p200300d82f1bb8006fdb1af24fbd1fdf.dip0.t-ipconnect.de. [2003:d8:2f1b:b800:6fdb:1af2:4fbd:1fdf])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-451f97f85casm2277055e9.4.2025.06.04.13.28.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jun 2025 13:28:23 -0700 (PDT)
Message-ID: <2c4767d4-7be1-417a-870f-283dba8cd061@redhat.com>
Date: Wed, 4 Jun 2025 22:28:22 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] mm/memory: Document how we make a coherent memory
 snapshot
To: Peter Xu <peterx@redhat.com>, Jann Horn <jannh@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250603-fork-tearing-v1-0-a7f64b7cfc96@google.com>
 <20250603-fork-tearing-v1-2-a7f64b7cfc96@google.com>
 <aEB8fFEXKPR54LdA@x1.local>
 <CAG48ez3cgG-PikyO7a84CFdPFvPY9BSNJOZ7wZVQ7Q9Qju_6Ng@mail.gmail.com>
 <aECoHDM3l2dKTfDw@x1.local>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <aECoHDM3l2dKTfDw@x1.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 04.06.25 22:10, Peter Xu wrote:
> On Wed, Jun 04, 2025 at 08:11:08PM +0200, Jann Horn wrote:
>> On Wed, Jun 4, 2025 at 7:04 PM Peter Xu <peterx@redhat.com> wrote:
>>> On Tue, Jun 03, 2025 at 08:21:03PM +0200, Jann Horn wrote:
>>>> It is not currently documented that the child of fork() should receive a
>>>> coherent snapshot of the parent's memory, or how we get such a snapshot.
>>>> Add a comment block to explain this.
>>>>
>>>> Signed-off-by: Jann Horn <jannh@google.com>
>>>> ---
>>>>   kernel/fork.c | 34 ++++++++++++++++++++++++++++++++++
>>>>   1 file changed, 34 insertions(+)
>>>>
>>>> diff --git a/kernel/fork.c b/kernel/fork.c
>>>> index 85afccfdf3b1..f78f5df596a9 100644
>>>> --- a/kernel/fork.c
>>>> +++ b/kernel/fork.c
>>>> @@ -604,6 +604,40 @@ static void dup_mm_exe_file(struct mm_struct *mm, struct mm_struct *oldmm)
>>>>   }
>>>>
>>>>   #ifdef CONFIG_MMU
>>>> +/*
>>>> + * Anonymous memory inherited by the child MM must, on success, contain a
>>>> + * coherent snapshot of corresponding anonymous memory in the parent MM.
>>>
>>> Should we better define what is a coherent snapshot?  Or maybe avoid using
>>> this term which seems to apply to the whole mm?
>>>
>>> I think it's at least not a snapshot of whole mm at a specific time,
>>> because as long as there can be more than one concurrent writers (hence, it
>>> needs to be at least 3 threads in the parent process, 1 in charge of fork),
>>> this can happen:
>>>
>>>    parent writer 1      parent writer 2    parent fork thr
>>>    ---------------      ---------------    ---------------
>>>                                            wr-protect P1
>>>    write P1                                                  <---- T1
>>>    (trapped, didn't happen)
>>>                         write PN                             <---- T2
>>>                         (went through)
>>>                                            ...
>>>                                            wr-protect PN
>>>
>>> The result of above would be that child process will see a mixture of old
>>> P1 (at timestamp T1) but updated P2 (timestamp T2).  I don't think it's
>>> impossible that the userapp could try to serialize "write P1" and "write
>>> PN" operations in a way that it would also get a surprise seeing in the
>>> child PN updated but P1 didn't.
>>
>> If the write at T1 hits a page fault, then it doesn't actually happen
>> at T1. The write instruction starts doing something at T1, but it does
>> not fully retire, and the architectural register state does not
>> change, and in particular the instruction pointer does not advance
>> past this instruction; just like when speculative execution is aborted
>> after a branch misprediction, except that the CPU raises an exception
>> and we enter the page fault handler. The write actually happens when
>> the instruction is executed a second time after page fault handling
>> has completed after the mmap lock is dropped. (Unless something during
>> page fault handling raises a signal, in which case the instruction
>> might never architecturally execute.)
> 
> Fair enough.  So maybe that's something like a best-effort whole mm
> snapshot anytime happened during the fork() but before releasing mmap write
> lock.
> 
> Your comment did mention one exception on the kernel, is it still pretty
> easy to happen?  I'm thinking this use case of trying to load some data
> from a O_DIRECT fd and then set the var to show it's loaded:
> 
>    bool data_read=0
>    read(...);
>    data_read=1;
> 
> Then IIUC this can happen:
> 
>      parent thread 1                        parent fork thr
>      ---------------                        ---------------
>      read(...)
>        using O_DIRECT on priv-anon buffers P1
>        pin_user_pages
>                                             fork() happens
>                                               Sees P1 pinned
>                                               P1 early COW (child sees no data loaded)
>        memcpy()
>      set data_read=1
>      (data_read can be a global private var on P2)
>                                               P2 wr-protected (child sees data_read=1)
> 
> Hence in child even if it sees data_read=1 it is possible the buffer may be
> uninitialized, or the buffer is partly loaded, still racing with the kernel
> early COW.

Just mentioning that O_DIRECT and fork() has had a problematic 
relationship for a long time, although we are getting better at handling 
it (IOW, not break common setups in nasty ways).

"man open" is still quite verbose on that "O_DIRECT  I/Os  should never 
be run concurrently with the fork(2) system call ..."

-- 
Cheers,

David / dhildenb

