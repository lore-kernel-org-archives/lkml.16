Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AB32201100
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 17:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743786533; cv=none; b=GOgZPbWF84dQzX0gTNijrtrgE00zt8FgBJPL+eIWkJQaWFOQ7TqVMHbMRbaiUWBVd1QCh3l3kiu8KBkmivqfmDFCuSUE+BryYPK63i+cGKKYuo00W/2uuPxZd8QPgTzUYtK5zNe5o1AABGbt9RvCqMs9Ntmp19W5O0TIQqLUttc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743786533; c=relaxed/simple;
	bh=3H8XUIuU7zJJqEby8YCDJHboHaQa0ACsX2Y9w3eUYLE=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Q28KXRMMUiO2TPamL/dGMygdBsA0iKLY8MtiC7UpVYm0apTF8qVx3fLmb7Iwk6zmvDJNojfBCOSTCAiT1EBixU8Czr61HIIuE0pEWK4qBdRY1DrKwgo9NXAejyvSM0AgEf3uS0nd8ZClh1xJltF2qwC33L0QMc9V1vam0EJ4JEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fEHqeQEp; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fEHqeQEp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743786530;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ys3YStBzVIW9p1pNIqm8YntfCYD4UiISU7PULF3P1xo=;
	b=fEHqeQEpQlMoiYPKlq4zcHmSjWYL4LAGAtB1blto4kEe9Xp71+ej95m3lquiUPMyWKlOGf
	G9msILjk0+qX0mYXwfmPvOWEtLJO/CM2t8/XwEHno7cRHYvS1GYOqWexDzjmLED04c1elS
	tL8wuGVmJ8VQD6RFBwSYPRQaDfGS4GA=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-614-9A-Hz1D1ME2skBpiEv1TNA-1; Fri, 04 Apr 2025 13:08:48 -0400
X-MC-Unique: 9A-Hz1D1ME2skBpiEv1TNA-1
X-Mimecast-MFC-AGG-ID: 9A-Hz1D1ME2skBpiEv1TNA_1743786528
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6ed0526b507so37141136d6.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 10:08:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743786527; x=1744391327;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ys3YStBzVIW9p1pNIqm8YntfCYD4UiISU7PULF3P1xo=;
        b=OhkwNbmi2wo2VwYQyQOrKD1xGad+9ZbUw/M5QTMWONKqkV91hUuWACQilvlEqnS4Kh
         bTbemt1v2Oog+EVbxhQBX7nGgJ1pags7xj0A+lpL3neQRIxIr6I0Samt1197+1IfXJI0
         NYQe2+OFBKUBQlXf2HtPYEEyVm8w5pQgw63I9eshh1XzbW64P64tJjYB92Xey7gOxZhw
         1buP9ZY5+d+UysIFn6qCKWVVeZGLrXabvy+Yv51ACJmb38q7MMrSzUnQ7nhdvl3DvXDz
         tV/83MCwrLl/e7RQhLxEv0J8vfBq8esXRPPgfFy3CzL5YKzrTJgfRwnj0ud0rq86MGmC
         8MGw==
X-Forwarded-Encrypted: i=1; AJvYcCVqlghqS1/+BE3jhug0rLHXy7c/Oal3VqmqCRxhi2464CcwQHyRVRV55Ubl0rcuRhWPIFJKCfm0kfn7cPI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3WVwxkt0WKinMra0K5eaLiNQgIkSurNuD40MPh/R0Y8Kf7DyH
	a2rCY+92fnY9JOU3Qo6ah9CUw8XLv8nSmtPnxajFVI6n+mdr49kA1PHduekyKXD7ASqXYKnFD2Q
	C7Tm1pxsg1OdnPbpeft7OhIcgr7UB55RCWYk6K7ULGexOY57z5UQIZhTyqfpAvVrEqi/TIg==
X-Gm-Gg: ASbGncvKFJucQbVPvtHChDB8QIcMzQiGPvWil/NOS2lI+mYmvmyOWVUYJBk3pPpTNTz
	5zKWLQpbWgfouYlb2UPDkc18orO9b8SWkWIJh09wgHUz7qKZTZQ7lP9w0+x3QYzY++Yk7E9+p7o
	bW5k/HXLbWKIsKoQ3qeWuOc75/xm+nZLbls+E7jUAgqi68KB7iRyNilDr5f4HQkYyhvWBiBAJjb
	uPABf84yRXIQf4DSr+Tnx1zQSOV3WsJaxzhNlY3lcTskHRabzMIwEfIR2ojlOvAm/rkc7xZAzIh
	p5SO63WI31/9fyekX06iqR6p8MGkjlwn8TdCf9cHUpKV5DvzKTD/B6JrtdkXwA==
X-Received: by 2002:a05:6214:300e:b0:6d8:a1fe:7293 with SMTP id 6a1803df08f44-6f064b5d815mr51333596d6.42.1743786527267;
        Fri, 04 Apr 2025 10:08:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEtRfYM160P3wKk8uH3phQLRNd9Tol+JMZcOPa8kszJH+gmj4NEydApUh/MaOD8X5hxNSKXig==
X-Received: by 2002:a05:6214:300e:b0:6d8:a1fe:7293 with SMTP id 6a1803df08f44-6f064b5d815mr51333316d6.42.1743786526912;
        Fri, 04 Apr 2025 10:08:46 -0700 (PDT)
Received: from ?IPV6:2601:188:c100:5710:315f:57b3:b997:5fca? ([2601:188:c100:5710:315f:57b3:b997:5fca])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ef0f0486f6sm23750286d6.64.2025.04.04.10.08.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Apr 2025 10:08:46 -0700 (PDT)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <eba3c40a-b777-4f52-b9ce-6cae59b5f586@redhat.com>
Date: Fri, 4 Apr 2025 13:08:45 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] sched/fair: Mark some static const with
 __maybe_unused
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-kernel@vger.kernel.org
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Will Deacon <will@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>
References: <20250404165204.3657093-1-andriy.shevchenko@linux.intel.com>
Content-Language: en-US
In-Reply-To: <20250404165204.3657093-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/4/25 12:52 PM, Andy Shevchenko wrote:
> GCC considers that some static const defined in the lockdep_internals.h
> are unused, which prevents `make W=1` and CONFIG_WERROR=y builds:
>
> kernel/locking/lockdep_internals.h:69:28: error: ‘LOCKF_USED_IN_IRQ_READ’ defined but not used [-Werror=unused-const-variable=]
>     69 | static const unsigned long LOCKF_USED_IN_IRQ_READ =
>        |                            ^~~~~~~~~~~~~~~~~~~~~~
> kernel/locking/lockdep_internals.h:63:28: error: ‘LOCKF_ENABLED_IRQ_READ’ defined but not used [-Werror=unused-const-variable=]
>     63 | static const unsigned long LOCKF_ENABLED_IRQ_READ =
>        |                            ^~~~~~~~~~~~~~~~~~~~~~
> kernel/locking/lockdep_internals.h:57:28: error: ‘LOCKF_USED_IN_IRQ’ defined but not used [-Werror=unused-const-variable=]
>     57 | static const unsigned long LOCKF_USED_IN_IRQ =
>        |                            ^~~~~~~~~~~~~~~~~
> kernel/locking/lockdep_internals.h:51:28: error: ‘LOCKF_ENABLED_IRQ’ defined but not used [-Werror=unused-const-variable=]
>     51 | static const unsigned long LOCKF_ENABLED_IRQ =
>        |                            ^~~~~~~~~~~~~~~~~
>
> Fix this by marking them with __maybe_unused.

The code changes look good, but the "sched/fair" heading is misleading. 
It is not related to scheduler at all, it should be "locking/lockdep" or 
just "lockdep".

Cheers,
Longman

>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>   kernel/locking/lockdep_internals.h | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/kernel/locking/lockdep_internals.h b/kernel/locking/lockdep_internals.h
> index 20f9ef58d3d0..82e71335f367 100644
> --- a/kernel/locking/lockdep_internals.h
> +++ b/kernel/locking/lockdep_internals.h
> @@ -48,25 +48,25 @@ enum {
>   };
>   
>   #define LOCKDEP_STATE(__STATE)	LOCKF_ENABLED_##__STATE |
> -static const unsigned long LOCKF_ENABLED_IRQ =
> +static __maybe_unused const unsigned long LOCKF_ENABLED_IRQ =
>   #include "lockdep_states.h"
>   	0;
>   #undef LOCKDEP_STATE
>   
>   #define LOCKDEP_STATE(__STATE)	LOCKF_USED_IN_##__STATE |
> -static const unsigned long LOCKF_USED_IN_IRQ =
> +static __maybe_unused const unsigned long LOCKF_USED_IN_IRQ =
>   #include "lockdep_states.h"
>   	0;
>   #undef LOCKDEP_STATE
>   
>   #define LOCKDEP_STATE(__STATE)	LOCKF_ENABLED_##__STATE##_READ |
> -static const unsigned long LOCKF_ENABLED_IRQ_READ =
> +static __maybe_unused const unsigned long LOCKF_ENABLED_IRQ_READ =
>   #include "lockdep_states.h"
>   	0;
>   #undef LOCKDEP_STATE
>   
>   #define LOCKDEP_STATE(__STATE)	LOCKF_USED_IN_##__STATE##_READ |
> -static const unsigned long LOCKF_USED_IN_IRQ_READ =
> +static __maybe_unused const unsigned long LOCKF_USED_IN_IRQ_READ =
>   #include "lockdep_states.h"
>   	0;
>   #undef LOCKDEP_STATE

