Received: from 190-102-104-130.static.hvvc.us (190-102-104-130.static.hvvc.us [190.102.104.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD2E27F757
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 14:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=190.102.104.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745419147; cv=none; b=axUh6F6ROrWJw8KKlNtQXRbfZFvzNMLmZ3JrrcmDntfiY0FbkSJzDjqAelRdnTE9ZNKxkqhD5PSpHoJzFBYTOVKj08wCMsb/T53ZlmIvrzJnOCaZkhLTJLdSATCLYqJPe0luwUkTD36QlZqKApEyfLwVca4zVdFXvdnDJ53cAkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745419147; c=relaxed/simple;
	bh=8GouovEUUce40wJMEqAWPhT8EI0FiNSvFiQmAVQdSms=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lp1A/CsOy2UeaZdBGW/yK73P6FHozJ06z3ur1lVg8ZNV64b4KgXDsItQZ7znbO8/bsWLFCQWrd4dEqhhBew50Y88aZFIs1sTY0GK1ULhmwAFqxgRy8ZCwnNCmXWfrsTdwQPAttzCe5VJB8nCdpOS+8MU3+YlE2kGpRiDV8BJPXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=phoronix.com; spf=pass smtp.mailfrom=phoronix.com; arc=none smtp.client-ip=190.102.104.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=phoronix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phoronix.com
Received: from c-24-15-38-32.hsd1.in.comcast.net ([24.15.38.32]:7366 helo=[192.168.1.194])
	by milan.phoronix.com with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
	(Exim 4.98.1)
	(envelope-from <Michael@phoronix.com>)
	id 1u7bFh-0000000FA70-2e1K;
	Wed, 23 Apr 2025 10:39:03 -0400
Message-ID: <8626886c-59b7-4294-9bb2-08663650e199@phoronix.com>
Date: Wed, 23 Apr 2025 09:38:59 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Linux 6.15-rc3
To: Vlastimil Babka <vbabka@suse.cz>,
 Alexei Starovoitov <alexei.starovoitov@gmail.com>,
 Dave Airlie <airlied@gmail.com>, Shakeel Butt <shakeel.butt@linux.dev>,
 Sebastian Sewior <bigeasy@linutronix.de>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Alexei Starovoitov <ast@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <CAHk-=wgjZ4fzDKogXwhPXVMA7OmZf9k0o1oB2FJmv-C1e=typA@mail.gmail.com>
 <CAPM=9tzj_OBFJNsN9j7nMs4OR3=V9yrPmaH7VvN-KNYUYhf-vQ@mail.gmail.com>
 <CAADnVQ+KnfDLd-=Mg1BDJxCf80K_=RN0dJy_yp681gf1dQMhtg@mail.gmail.com>
 <0981c1fe-05d2-4bab-a0a4-6dc5666d98d7@suse.cz>
 <bb701616-26b8-41f0-8a19-0f76b2a64deb@suse.cz>
 <d1c0f057-63c8-4be5-9638-d1a67d9b9e15@suse.cz>
Content-Language: en-CA
From: Michael Larabel <Michael@phoronix.com>
In-Reply-To: <d1c0f057-63c8-4be5-9638-d1a67d9b9e15@suse.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - milan.phoronix.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - phoronix.com
X-Get-Message-Sender-Via: milan.phoronix.com: authenticated_id: michael@phoronix.com
X-Authenticated-Sender: milan.phoronix.com: michael@phoronix.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 

On 4/23/25 3:08 AM, Vlastimil Babka wrote:
> On 4/23/25 10:03, Vlastimil Babka wrote:
>> On 4/23/25 09:14, Vlastimil Babka wrote:
>>
>> Oh I see, replacing the default: which "local_lock_t *:" which is the only
>> other expected type, forces the compiler to actually tell me what's wrong:
>>
>> ./include/linux/local_lock_internal.h:174:26: error: ‘_Generic’ selector of
>> type ‘__seg_gs local_lock_t *’ is not compatible with any association
>>
>>
> This should fix the issue hopefully and prevent more unexpected default matches:
>
> diff --git a/include/linux/local_lock_internal.h b/include/linux/local_lock_internal.h
> index bf2bf40d7b18..8d5ac16a9b17 100644
> --- a/include/linux/local_lock_internal.h
> +++ b/include/linux/local_lock_internal.h
> @@ -102,11 +102,11 @@ do {								\
>   		l = (local_lock_t *)this_cpu_ptr(lock);			\
>   		tl = (local_trylock_t *)l;				\
>   		_Generic((lock),					\
> -			local_trylock_t *: ({				\
> +			__percpu local_trylock_t *: ({			\
>   				lockdep_assert(tl->acquired == 0);	\
>   				WRITE_ONCE(tl->acquired, 1);		\
>   			}),						\
> -			default:(void)0);				\
> +			__percpu local_lock_t *: (void)0);		\
>   		local_lock_acquire(l);					\
>   	} while (0)
>   
> @@ -171,11 +171,11 @@ do {								\
>   		tl = (local_trylock_t *)l;				\
>   		local_lock_release(l);					\
>   		_Generic((lock),					\
> -			local_trylock_t *: ({				\
> +			__percpu local_trylock_t *: ({			\
>   				lockdep_assert(tl->acquired == 1);	\
>   				WRITE_ONCE(tl->acquired, 0);		\
>   			}),						\
> -			default:(void)0);				\
> +			__percpu local_lock_t *: (void)0);		\
>   	} while (0)
>   
>   #define __local_unlock(lock)					\
>
>

In addition to fixing the Nginx performance, I can confirm this patch 
does also fix the other regressions I found as well caused by 51339d99c 
with Memcached, ClickHouse, and OpenFOAM. All the tests I have been 
running with current Git + this patch have been working out well and 
haven't noticed any other problems from it. Will keep running through 
some more workloads on that server but seems to now be in good shape.

Thanks,

Michael


Tested-by: Michael Larabel <Michael@phoronix.com>

