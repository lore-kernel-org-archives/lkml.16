Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82D8E15B971
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 15:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745854425; cv=none; b=rAWWamiXie+KnnvnBhP+2oQnf5spwBGIog2KV+ZOIrvcfNHLQ8JG4nNInv1NEgvQGlRWJPCg27kK5J6XdfxjrR09VQxJXUO7Z+G0Y7tqhBHpXWpY1k6PCGwTjrLFQAapWdN4IPfBcecR4Xi//or6VBnUwo4mRD+9TXbP4UiJKZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745854425; c=relaxed/simple;
	bh=ZwBTfQiOLC5h/ueP8fzXUgqlkDc7WzUUPN/+RfBrDsg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VM5iZvqA+LgFfjzVRJxVR5q0/5KdQbC0BU08Wc7oiho/USkGLyYEVkEUmdob7ij/y0tm1dAVAGHsMWcu+mOMR78onfp1B0S6A3Wj7TZJNBRWRYeRQeZAIsF71rDZSgnKI+Jj1gbTW0r0uQOxdw0GQqqcUkWOpR+WVJ8H6D5UWE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Cn6U8qzW; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Cn6U8qzW"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ac25520a289so778560466b.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 08:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745854421; x=1746459221; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bPYRN4iTyc4wBxfv9JGUS3+HhUXE8EqK5Z+QKmCpoic=;
        b=Cn6U8qzWayFYV6JUUYTpU1pynYB3SgE+g3bd9KrYG/OtM05d7ZKjBJ3z00y/4tn4gE
         bQfizdgKaRHc8KvRSXZ2aDg6pPF3TJoO8BndUi10qs8u0sVa75pCSz+rQ6oA6cSWajqn
         sESOq7HL1UaF2xltpj/CQ1VqABGApJMAJ8Zu3Y2OBSwja/pX/d0WwT9u/ZbiWBIwaBBb
         ekzMohwMEUA5gsNPr9VgcAikSYuO7O8JTCt6hhWimb9Kjzy6/kiYZ1rwf06Hy+rx8nD+
         Ou3TY15ue0/2xDYMi5ZH0XxlOHTbKBMJFK+Ez67qu20vrqHW8uD35/FsBL87NuTYuvpq
         s5ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745854421; x=1746459221;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bPYRN4iTyc4wBxfv9JGUS3+HhUXE8EqK5Z+QKmCpoic=;
        b=ANaOI/zB+xihlGKZBjH6kUHOJgcJEXVmB6MFlThv0grt1CjW6z25IhSKgCZQnnAfhS
         JZM9k/tqR93bCHy8DY+mqOCEMO2bNf7AUwAkKwbn6c8cFeCDGLjow7hTplpLAr+Mplhi
         5g79Bqg1gG2xNqP09cbaZZi5samB7DsagxuffSf7GGdcb5lo5XsTfmXWQD8Rivunu9/Q
         KJl287egXcdCyHlLGXKsPGOPJ4xSmDipu2yh+BXTiNsqUMDWMCaC+kh0FF3G7DbcudYS
         laiJhvMjv4Bk/EkpNLjGX4AxuzSy8BLy2UmTcRC/LVnLxkviqWzxyXfdxJ2phIOr2UdD
         WaYw==
X-Gm-Message-State: AOJu0YwMdZKgzUSLduMZFaL0ox/dlJW1POo5Hb4WOMr+xLa4ZE6PmE1x
	cfFcynJQ2ApnYmrT+3c95xzno7VPjpKmA1EQYi2+1U+kyIZhSf8hUpkijFjpWSU=
X-Gm-Gg: ASbGncu1VkFCII6rGXcc7b1agvmNUIO+xEMFSUKb55ddyHkF+XPUL8fjyrPWe79V59b
	pkruuOyh662Rf+L1o8NWo1/a41MHP8IN4cQl5e4YiaJ0AjkS6txS1fcTObnRk6thj8AiwQQw634
	Q98GefpuGQbhQ+IZDpWHWj0oUbh1rGG5JW3Tmk7GiK+BMvjAPIrA89d0Ao1qAuKLVRDihtyeaKb
	fLUx0GNQ4fVHdZyBWio6tilq8KCTD89VTq3Z0KBB3u8R4e5RYHN8+FPmKsU2mZx+4IUas0AadOF
	197j5EtHaIbkrn6Mt96kyKTOAmQ6Vj3gLvFs2V0PYKMsqw51T9RM2g==
X-Google-Smtp-Source: AGHT+IEFRWrIeln/DA+aBHEbqqzfZaXJiu9WqqlUBGHXmlprOppsHLmMCzbWhXmO+8wZrtXWmG1GFQ==
X-Received: by 2002:a17:906:478a:b0:ac8:1798:c2e7 with SMTP id a640c23a62f3a-acec4eb4acbmr18180666b.41.1745854420612;
        Mon, 28 Apr 2025 08:33:40 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ecf8446sm648365866b.102.2025.04.28.08.33.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 08:33:40 -0700 (PDT)
Date: Mon, 28 Apr 2025 17:33:38 +0200
From: Petr Mladek <pmladek@suse.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: linux-kernel@vger.kernel.org, kernel-team@meta.com,
	Andrew Morton <akpm@linux-foundation.org>,
	Kuniyuki Iwashima <kuniyu@amazon.com>,
	Mateusz Guzik <mjguzik@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Jon Pan-Doh <pandoh@google.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Karolina Stolarek <karolina.stolarek@oracle.com>
Subject: Re: [PATCH v3 11/20] ratelimit: Force re-initialization when
 rate-limiting re-enabled
Message-ID: <aA-f0jpBBbdfsmn7@pathway.suse.cz>
References: <72ee57b8-9e2a-4cad-aaa0-1e3353d146d8@paulmck-laptop>
 <20250425002826.3431914-11-paulmck@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425002826.3431914-11-paulmck@kernel.org>

On Thu 2025-04-24 17:28:17, Paul E. McKenney wrote:
> Currently, rate limiting being disabled results in an immediate early
> return with no state changes.  This can result in false-positive drops
> when re-enabling rate limiting.  Therefore, mark the ratelimit_state
> structure "uninitialized" when rate limiting is disabled.
> 
> Link: https://lore.kernel.org/all/fbe93a52-365e-47fe-93a4-44a44547d601@paulmck-laptop/
> Link: https://lore.kernel.org/all/20250423115409.3425-1-spasswolf@web.de/
> Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
> Cc: Petr Mladek <pmladek@suse.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Kuniyuki Iwashima <kuniyu@amazon.com>
> Cc: Mateusz Guzik <mjguzik@gmail.com>
> Cc: Steven Rostedt <rostedt@goodmis.org>
> Cc: John Ogness <john.ogness@linutronix.de>
> Cc: Sergey Senozhatsky <senozhatsky@chromium.org>
> ---
>  lib/ratelimit.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/ratelimit.c b/lib/ratelimit.c
> index 7a7ba4835639f..52aab9229ca50 100644
> --- a/lib/ratelimit.c
> +++ b/lib/ratelimit.c
> @@ -35,11 +35,24 @@ int ___ratelimit(struct ratelimit_state *rs, const char *func)
>  	unsigned long flags;
>  	int ret;
>  
> +	/*
> +	 * Zero interval says never limit, otherwise, non-positive burst
> +	 * says always limit.
> +	 */
>  	if (interval <= 0 || burst <= 0) {
>  		ret = interval == 0 || burst > 0;
> +		if (!(READ_ONCE(rs->flags) & RATELIMIT_INITIALIZED) ||
> +		    !raw_spin_trylock_irqsave(&rs->lock, flags)) {

I though more about this. And I am not sure if this is safe.

We are here when the structure has not been initialized yet.
The spin lock is going to be likely still initialized.
In theory, it might happen in parallel:

CPU0				CPU1

___ratelimit()
  if (interval <= 0 || burst <= 0)
    // true on zero initialized struct

    if (!(READ_ONCE(rs->flags) & RATELIMIT_INITIALIZED) ||
      // same here
      !raw_spin_trylock_irqsave(&rs->lock, flags)) {
      // success???

				ratelimit_state_init()
				  raw_spin_lock_init(&rs->lock);


      raw_spin_unlock_irqrestore(&rs->lock, flags);

BANG: Unlocked rs->lock which has been initialized in the meantime.


Note: The non-initialized structure can be used in ext4 code,
      definitely, see
      https://lore.kernel.org/r/aAnp9rdPhRY52F7N@pathway.suse.cz

      Well, I think that it happens in the same CPU. So, it should
      be "safe".


Sigh, I guess that this patch is needed to fix the lib/tests/test_ratelimit.c.
It works because the test modifies .burst and .interval directly.

What is a sane behavior/API?

IMHO:

1. Nobody, including ext4 code, should use non-initialized
   struct ratelimit_state. It is a ticking bomb.

   IMHO, it should trigger a warning and the callers should get fixed.


2. Nobody, including the selftest, should modify struct ratelimit_state
   directly.

   This patchset adds ratelimit_state_reset_interval() for this
   purpose. It clears ~RATELIMIT_INITIALIZED. So this patch won't
   be needed when the API was used in the selftest.

It was actually great that ___ratelimit() was able to handle
non-initialized struct ratelimit_state without taking
the bundled lock.

What do you think, please?

> +			if (!ret)
> +				ratelimit_state_inc_miss(rs);
> +			return ret;
> +		}
> +
> +		/* Force re-initialization once re-enabled. */
> +		rs->flags &= ~RATELIMIT_INITIALIZED;
>  		if (!ret)
>  			ratelimit_state_inc_miss(rs);
> -		return ret;
> +		goto unlock_ret;
>  	}

Best Regards,
Petr
