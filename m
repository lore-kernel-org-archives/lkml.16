Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C97B1C5F34
	for <linux-kernel@vger.kernel.org>; Sat,  1 Feb 2025 23:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738453687; cv=none; b=cRWDcgr++8MoPnOjMtHHukpFux74KTm5tzSS2SHJvd7BsvAD6QBFhfiybnIW8uXl5bHRftwfsMnGy2xsRQq4K/Je8a6OpIN8ec3Sz8WZHOuKN0Hk1sgZjHo8Kly/JkY7JBpYNhWq10EKaU6H/u20BoPfLMHiDBasuEuGh53oJCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738453687; c=relaxed/simple;
	bh=34MxCCMbzH50AYnOFIOwbFizBRMxv06qWCq8UsMrmRk=;
	h=From:To:CC:Date:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=VW0nizFLAHMTg32PsehBY1qveUGWa2TCOryrUKnF362eUlADa2w4sepS+gFQXtuzqVPrk5MQlNEsOqyfGKdmmEyU3rcPbNy5m5KcetsHHmv5fnx4SnXNtQCXUTSJMQv4PcP9iUdfT9Gx4KXZ2AW4oWFLrop3QrVUyiNlJLQqFxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=R5XmrETG; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="R5XmrETG"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6dd43aa1558so26768576d6.0
        for <linux-kernel@vger.kernel.org>; Sat, 01 Feb 2025 15:48:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1738453684; x=1739058484; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:subject:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kvUeHojusNiP/22DgYlgNRx/v3OYNWXx/KniIlV6akc=;
        b=R5XmrETGqJq3qjZw+pYWVWL7W9OhON7YBeLgVXV8KHUcaK1CFjnf5/bfBcq9IFF3LP
         ce9d5gB3OzWcGawfK4tCc5cyvPIer6JMGTjXqzYwL12HlNSI5AAYStXT8Ndt5jkP9vru
         pSUzH/z8JQt9IXmmWi+GOb13uKjaci+wCLCJm9RD4aXB9yOUOcR6YmGNmxL+8+l2Mg0H
         +dWlaD7K/zCextIZz7qjgRUiLVzFFaFC8UxZxXzxRMJ1MoGgt264hwHpNsxPn3MCj4Io
         EG7tyTs2CyTuqE6G6zOxfGDikMGSQcK0y0T0UQgQLMdPlzqJUGBYTKimVtMdTE7U1k7b
         8ZCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738453684; x=1739058484;
        h=content-transfer-encoding:mime-version:subject:user-agent
         :references:in-reply-to:message-id:date:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kvUeHojusNiP/22DgYlgNRx/v3OYNWXx/KniIlV6akc=;
        b=WP+ospZLa1HdmC0UE/348uvwQDSpP2k7qOQC/67yXu6CO9UOw7h2K1DiyfzdmJ+qmX
         XQOBtP2ZVx+d91Jfe15XlX+muiSCBZTtriujvUCuTytUIXMcBp2MnpDM8va0Kl5KcCT1
         P7Ff0eznZUKtnGxL2HXP1qE6bWaPtXbwM+Q1AtplwxxLT5hX8rrqd2r0fS/UumqaXv3Q
         jRI4K2lr1KsiTqnlUelCC/5HRXY06wfuimRrNPuHPa0ss6KMAOmdeizuKeyRycIuI/Yz
         2xNY1m1Bi7Wdx1a+sBZUm7gg6jfgIRjPJ8nKLl9CVophBryVVdv54ctn6NvBD+QaXMx1
         anTw==
X-Forwarded-Encrypted: i=1; AJvYcCU4AFkA/bJyO7v+oRtlRusJIc6U4V8LRfRGXJj/IUa6io/KEfn+3wPA/QYwtzZocuRyLJ733qBfoDqGGjo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxufWFerI2FmDmBtATIUIA69wM/MTlr+Y2cE4vPRiSrT5biTol
	eDgN/JUPGGrzVGntjejU6KPvCk7DSQMlF7zIg1ZrgUKHvY1iB3/eoa9BuF4gbg==
X-Gm-Gg: ASbGncviS+9l87+eLjoT2iEqVcDsA6Q2dWqVsztSX8iUS4wQpfky3CstiWF6FJt+m3r
	lY+78lJP6vtLuYRI1pmMZi6FJCVJ3IOAB3zwUECHpDPpBWHZzSSoOSUnCcGW9UxdSkY5yeCGV8N
	nVeEEKXMHpyygSsx32mTjv4qu3hKsjtmvL7+GK6r7EI7kg+buZAdNqPnwusDx9UIdGkqueQNPCv
	crAIEinIBvM7OglB2Zw25gaVpS9wa7U4owmI5ttMwGy/FcQpzB5ccAeWGM7FVus9vboLj8OAtSV
	MXbF9ozmZcS/N1WZLw==
X-Google-Smtp-Source: AGHT+IHX2dSn3RI92rD4d1pgX4qluRkbkN89AghtQb4oG9wp7/4QwhncSs/PiRPdnZni4g/7fvMkJg==
X-Received: by 2002:a05:6214:124f:b0:6d8:916b:1caa with SMTP id 6a1803df08f44-6e243c3bdbdmr285049226d6.27.1738453684391;
        Sat, 01 Feb 2025 15:48:04 -0800 (PST)
Received: from [10.42.99.114] ([166.194.191.161])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e254922e21sm33758246d6.92.2025.02.01.15.48.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Feb 2025 15:48:03 -0800 (PST)
From: Paul Moore <paul@paul-moore.com>
To: =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>
CC: Christian Brauner <brauner@kernel.org>, =?UTF-8?B?R8O8bnRoZXIgTm9hY2s=?= <gnoack@google.com>, Charles Zaffery <czaffery@roblox.com>, Daniel Burgener <dburgener@linux.microsoft.com>, Francis Laniel <flaniel@linux.microsoft.com>, James Morris <jmorris@namei.org>, Jann Horn <jannh@google.com>, Jeff Xu <jeffxu@google.com>, Kees Cook <kees@kernel.org>, Luca Boccassi <luca.boccassi@gmail.com>, Mikhail Ivanov <ivanov.mikhail1@huawei-partners.com>, Praveen K Paladugu <prapal@linux.microsoft.com>, Robert Salvet <robert.salvet@roblox.com>, Shervin Oloumi <enlightened@google.com>, Tyler Hicks <code@tyhicks.com>, <linux-kernel@vger.kernel.org>, <linux-security-module@vger.kernel.org>
Date: Sat, 01 Feb 2025 18:48:00 -0500
Message-ID: <194c3e9fb98.28a7.85c95baa4474aabc7814e68940a78392@paul-moore.com>
In-Reply-To: <20250201.quaizoh3taeV@digikod.net>
References: <20250131163447.1140564-1-mic@digikod.net>
 <20250131163447.1140564-3-mic@digikod.net>
 <CAHC9VhS=mMH9s2KUc2kSK7pW1yG8RB58hyJjW5oWsCK=i-1PdA@mail.gmail.com>
 <20250201.quaizoh3taeV@digikod.net>
User-Agent: AquaMail/1.54.1 (build: 105401536)
Subject: Re: [RFC PATCH v1 2/3] pidfd: Extend PIDFD_GET_INFO with PIDFD_INFO_LANDLOCK_*_DOMAIN
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On February 1, 2025 5:28:37 AM Mickaël Salaün <mic@digikod.net> wrote:

> On Fri, Jan 31, 2025 at 02:02:49PM -0500, Paul Moore wrote:
>> On Fri, Jan 31, 2025 at 11:43 AM Mickaël Salaün <mic@digikod.net> wrote:
>>>
>>> Because Landlock enables users to create nested sandboxes (i.e.
>>> domains), we might need to identify the domain with all restrictions
>>> (latest), or the domain we created (i.e. closest domain).  Indeed,
>>> because any process can create its own domain, the latest domain may not
>>> be known by the requester.
>>>
>>> The PIDFD_INFO_LANDLOCK_LAST_DOMAIN flag enables user space to get the
>>> latest (i.e. most nested) Landlock domain ID related to a sandboxed
>>> task, if any.  The domain ID is set in the pidfd_info's
>>> landlock_last_domain field according to the related mask.
>>>
>>> The PIDFD_INFO_LANDLOCK_FIRST_DOMAIN flag enables user space to get the
>>> closest (i.e. first hierarchy relative to the pidfd's credentials)
>>> Landlock domain ID related to a sandboxed task, if any.  The domain ID
>>> is set in the pidfd_info's landlock_first_domain field according to the
>>> related mask.
>>>
>>> It is only allowed to get information about a Landlock domain if the
>>> task's domain that created the pidfd is a parent of the PID's domain.
>>> Following the object-capability model, the pidfd's credentials are used
>>> instead of the caller's credentials.  This makes this command
>>> idenmpotent wrt the referenced process's state.
>>>
>>> If Landlock is not supported or if access to this information is denied,
>>> then the IOCTL does not set the PIDFD_INFO_LANDLOCK_*_DOMAIN flag in the
>>> returned mask.
>>>
>>> If PIDFD_INFO_LANDLOCK_LAST_DOMAIN or PIDFD_INFO_LANDLOCK_FIRST_DOMAIN
>>> is specified but the provided struct pidfd_info is not large enough to
>>> contain the related field, then -EINVAL is returned.
>>>
>>> Cc: Christian Brauner <brauner@kernel.org>
>>> Cc: Günther Noack <gnoack@google.com>
>>> Cc: Luca Boccassi <luca.boccassi@gmail.com>
>>> Cc: Praveen K Paladugu <prapal@linux.microsoft.com>
>>> Closes: https://github.com/landlock-lsm/linux/issues/26
>>> Signed-off-by: Mickaël Salaün <mic@digikod.net>
>>> Link: https://lore.kernel.org/r/20250131163447.1140564-3-mic@digikod.net
>>> ---
>>> fs/pidfs.c                 | 24 ++++++++++++++++++++++--
>>> include/uapi/linux/pidfd.h |  4 ++++
>>> 2 files changed, 26 insertions(+), 2 deletions(-)
>>
>> While there are exceptions, mostly for legacy things, we try very hard
>> to avoid having the kernel call directly into a specific LSM,
>> preferring to use LSM interfaces, both so that all LSMs can benefit
>> from the change and also so that we can avoid having a lot of very
>> similar, but LSM-specific, calls in various parts in the kernel.
>
> Making life easier for LSMs by sharing common code is a good thing, but
> making life easier for all kernel components by sharing common code is
> even better.  The PIDFD_GET_INFO IOCTL was design to be very flexible,
> and it follows the principle of "pay for what you request" thanks to the
> "mask" bitfield.
>
> Users specify a set of properties they want, and the kernel returns
> these properties if they are supported and allowed.  Each of this
> property is well-specified and has a clear semantic.  This patch series
> implements two Landlock properties, each clearly identified and
> independent.
>
> One important difference between the current LSMs attributes and these
> two new Landlock properties, is that the Landlock domain IDs are u64
> values instead of strings.  This makes the implementation quite forward
> and it fits well with how PIDFD_GET_INFO currently works, so there is no
> need for a new (PIDFD_GET_SECURITY) IOCTL handling complex data
> structure composing a set of strings such as what is required for
> current LSMs' attributes.

Landlock is a LSM.  Landlock properties *are* LSM properties/attributes, 
regardless of data types.  Look at a lot of the recent work to support 
arbitrary types in the LSM syscalls as well the very recent work to start 
moving away from the rigid secctx/secid concepts within the kernel.

Landlock is a LSM and just as all the other LSMs integrate with other areas 
of the kernel through the LSM framework, so should Landlock. Instead of 
adding landlock_* calls in the kernel, you need to adding security_* calls, 
or better yet, finding ways to work with existing security_* calls.

>>
>> There is an effort, albeit a slowly moving effort due to interrupts,
>> to add LSM support via a PIDFS_GET_SECURITY API:
>>
>> https://lore.kernel.org/linux-security-module/CAHC9VhRV3KcNGRw6_c-97G6w=HKNuEQoUGrfKhsQdWywzDDnBQ@mail.gmail.com/
>
> This effort is good, but it is a separate effort which is independent
> from this patch series.  This will be useful for LSMs (or hopefully
> other parts of the kernel as well) that deal with string-based
> attributes.
>
> Even with a common hook and data structure, any LSM need to implement
> their own attribute management.  This patch series just makes a call to
> the Landlock implementation the same way UID, cgroupid, and other
> properties are retrieved.  There is no need for a wrapper interface for
> simple data types that are already handled by PIDFD_GET_INFO.
>
> Simple property types should all be queryable with the PIDFD_GET_INFO
> IOCTL (compared to a dedicated LSM's PIDFD_GET_SECURITY IOCTL), which
> can batch queries, making it more efficient and easier to implement for
> user space.

I don't disagree that including LSM info in the existing PID_GET_INFO API 
would be preferable, see my request at the 2024 LPC session on this as well 
as some discussions with Luca, but you will see that Christian has blocked 
this idea and forced us into a LSM specific API. It's not ideal in my 
opinion, but it is better than nothing or having to do our solution in the 
LSM space.

>
>>
>> I don't see any reason why we couldn't support Landlock's domain info
>> as part of that, the lsm_ctx struct was created to support various
>> different LSM contexts/attributes.  You could either add multiple
>> lsm_ctx array entries for Landlock, one for each of the domain IDs, or
>> you could place all of the domain IDs in an expanded lsm_ctx.
>> Remember the lsm_ctx->ctx field can hold binary blobs and/or you can
>> expand past the end of lsm_ctx->ctx so long as lsm_ctx->{len,ctx_len}
>> are set accordingly.
>>
>> If you want to work on the PIDFS_GET_SECURITY patch(set) as a means to
>> add Landlock domain ID support, I think that would be great.  Luca
>> provided a basic skeleton in the link above, and I expect you would
>> have no issue adding the missing LSM bits.

--
paul-moore.com



