Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D226D2F94AB
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 22:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750890660; cv=none; b=o5/5xCf/ftSQmmpL3JtPi2M69totojtXTxd3qbxvPRhXfldqnxOjTVFtrhoHQ1A3wnkNrAnxK7psqgVorgaxUYPu36rQjL2X9CI/afkj4qlCsVUSIrSHzScGjEaQi0QDIolWrQE53LEZJKM1N92dufmcjt6xivdNh0I61aCrWx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750890660; c=relaxed/simple;
	bh=ip78U7FJGwdWCWq3mPf/GL+zTAtVscOWravLlP5bPi0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QSbXjGoDPvmN6fDgxoXaHXGbquXKI/391WS3cBoNQv8sDASqfvGbjNAQKoKVnOdGppppvtBeNoblR2oQYfsZbyZoZzPZU8ATvGV1xBoePK/QB3Axf68DYfto60wbNiGkqkya08+fi3cCsdy7isKmLRzic/qv6sesp4tVc7aeFiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=rZkayUqc; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="rZkayUqc"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7390d21bb1cso420240b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 15:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1750890657; x=1751495457; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V23QR8lTur6dL9HITTaGcQjvsH26N+rqNRRcVHpaf/I=;
        b=rZkayUqcGaiM6GrWf8/CCrAEtptZejLZcibllPXYlL08JsgEtGAn6Qlh5xNbofOU/Y
         qLRd/b8z9dE5wZIZFbOReCwCyXfXpZYo8+Mp81DK+r23uU41vZY2Jau/r6rhUDDpEzrF
         Is2EfJkxc3uI1b5nB1y1+W8R3aobyhi3HBf0yXq9lKIxowNOpy8s2fKTF6CyWDTVRSsb
         jrsS9SuQyFPvOo0lXGhSzHVniNW19VSVSUa7qo29PUl/PEeugnusfXXsDfGEnhGDkydu
         5AHyBAxdXuHrOigJmTjBBSXPILQ6nX29SJeiQbKGzBePKNrmMzVQNj5FH6ZAZs0Y8mFa
         oPew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750890657; x=1751495457;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V23QR8lTur6dL9HITTaGcQjvsH26N+rqNRRcVHpaf/I=;
        b=wYDF/JwR1jaEwOUyvWfRDn+80hERztS2OITzW5XuWbDGbObHIqlWCr5Ty8uZOlKFBK
         sjIT55UEwRM/RRj291/HZe1C2K4QyexZ6vusBhbvxEjYG4z/jeHodp4yaELXxK14IypU
         PDcy4jK+1bM48JDtTvivPU3CXw6KgUZi7w9BZBncmsziR1R9HcK4Ym/YqW8DDIXIOQnf
         zLRqKzcVmZwXPWAgTLWcpKNbuIb7/Rr+fAJsgShd1RqY0tYUWI/mwX8uDqQwQT2sa/jN
         I0mcchLnmJSxGxsykyvqHJAaOz5Ap04fwyVcoEf99O9kGBRVcepu7J5udMAnxd9Tk01T
         TySg==
X-Forwarded-Encrypted: i=1; AJvYcCWta1BQjZda+g+/ZO7B2KpjRArmCo9odysCkPDaPAAebqiu6CwrP3EcL6vmq9qLVCdIihLptbDI5N48F9E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4fzZDWohPnsOr+NpBsHZ8io2V4t25/lU+hwhhPNjtTOLG4m31
	GB6tonRThoucMeAth2zwMp1ndMZhjxQarfqUfDUCierTjV96U6xoP0hLoXI0C8lvIxs=
X-Gm-Gg: ASbGncv6bR39Sc2JLsQHTrIY84GydrmbqW2jujMRUIEgUSD3g2eqmTcfNY6F4sQ6RZn
	AFGTzqwXHB7VcRlFTwPbNc4ImTXRZplr0e3ZTwzph9VsAsydP8GcWcN9tkrIxVnfGqOfQFWLIM9
	Nzug9ifSyhLiev9wwWV7tdbl1np+7w6dxL1nLwDej43XXIFLlWAU7oPpcvIQKRBOlyU3cd3LK33
	13Qq6ZgnhjZrf6ThBm/cJRUOeFBf75bmDgitBQBL6ctaJhkBV4blAXuMb8dsTMHljouQ8MeNdLf
	QjAY1UfJDifbmBr6able0NZbuWs6ufirCjNbab7eWtw3D+iEvg/GyL1aI/cApIf0LGW2
X-Google-Smtp-Source: AGHT+IEWoj7prnDPorpawZ1ErQoLe8p6uaIe9QTPETbrmSXrIBG16MlB2fWTzxhXRWiS5nB6QJ0+Nw==
X-Received: by 2002:a05:6a21:670d:b0:203:9660:9e4a with SMTP id adf61e73a8af0-2208c732303mr2187244637.41.1750890656868;
        Wed, 25 Jun 2025 15:30:56 -0700 (PDT)
Received: from [172.20.0.228] ([12.48.65.201])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-749b5e4293dsm5667007b3a.66.2025.06.25.15.30.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 15:30:56 -0700 (PDT)
Message-ID: <ddcbdaa0-479a-4821-9230-d3207be20b3c@kernel.dk>
Date: Wed, 25 Jun 2025 16:30:55 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] stacktrace: do not trace user stack for user_worker tasks
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Jiazi Li <jqqlijiazi@gmail.com>, linux-kernel@vger.kernel.org,
 "peixuan.qiu" <peixuan.qiu@transsion.com>, io-uring@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>
References: <20250623115914.12076-1-jqqlijiazi@gmail.com>
 <20250624130744.602c5b5f@batman.local.home>
 <80e637d3-482d-4f3a-9a86-948d3837b24d@kernel.dk>
 <20250625165054.199093f1@batman.local.home>
From: Jens Axboe <axboe@kernel.dk>
Content-Language: en-US
In-Reply-To: <20250625165054.199093f1@batman.local.home>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/25/25 2:50 PM, Steven Rostedt wrote:
> [
>   Adding Peter Zijlstra as he has been telling me to test against
>   PF_KTHREAD instead of current->mm to tell if it is a kernel thread.
>   But that seems to not be enough!
> ]

Not sure I follow - if current->mm is NULL, then it's PF_KTHREAD too.
Unless it's used kthread_use_mm().

PF_USER_WORKER will have current->mm of the user task that it was cloned
from.

> On Wed, 25 Jun 2025 10:23:28 -0600
> Jens Axboe <axboe@kernel.dk> wrote:
> 
>> On 6/24/25 11:07 AM, Steven Rostedt wrote:
>>> On Mon, 23 Jun 2025 19:59:11 +0800
>>> Jiazi Li <jqqlijiazi@gmail.com> wrote:
>>>   
>>>> Tasks with PF_USER_WORKER flag also only run in kernel space,
>>>> so do not trace user stack for these tasks.  
>>>
>>> What exactly is the difference between PF_KTHREAD and PF_USER_WORKER?  
>>
>> One is a kernel thread (eg no mm, etc), the other is basically a user
>> thread. None of them exit to userspace, that's basically the only
>> thing they have in common.
> 
> Was it ever in user space? Because exiting isn't the issue for getting
> a user space stack. If it never was in user space than sure, there's no
> reason to look at the user space stack.

It was never in userspace.

>>> Has all the locations that test for PF_KTHREAD been audited to make
>>> sure that PF_USER_WORKER isn't also needed?  
>>
>> I did when adding it, to the best of my knowledge. But there certainly
>> could still be gaps. Sometimes not easy to see why code checks for
>> PF_KTHREAD in the first place.
>>
>>> I'm working on other code that needs to differentiate between user
>>> tasks and kernel tasks, and having to have multiple flags to test is
>>> becoming quite a burden.  
>>
>> None of them are user tasks, but PF_USER_WORKER does look like a
>> user thread and acts like one, except it wasn't created by eg
>> pthread_create() and it never returns to userspace. When it's done,
>> it's simply reaped.
>>
> 
> I'm assuming that it also never was in user space, which is where we
> don't want to do any user space stack trace.

It was not.

> This looks like more rationale for having a kernel_task() user_task()
> helper functions:
> 
>   https://lore.kernel.org/linux-trace-kernel/20250425204120.639530125@goodmis.org/
> 
> Where one returns true for both PF_KERNEL and PF_USER_WORKER and the
> other returns false.

On vacation right now, but you can just CC me on the next iteration and
I'll take a look.

-- 
Jens Axboe
