Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E0321BC09A
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 20:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743367375; cv=none; b=UGVnXJdT0CAqsoOVhBjMfd3xrDcSdX4dvhPjO36PdvrK0FdmyTqFYtrbEQ8fwslRUubltSOqt8m6EE2Rp2REoi224NV7/OeMkTksYYbtgfuoAwC9/TL32yoEzuMpX2WBHhVPE5rYiVHQeaI3CAhMNQSQld8IMLnke2vbWgwB/gM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743367375; c=relaxed/simple;
	bh=ehWKatrLmUvmecRB4zhJ43uwF2+JtIX0Y9h6WFT8VcI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VKRHpDzGGbKaXkU0QKBg7w0aQNNkHO7/I5EMfv1oEQgO2OlO3LIkeGZL/asmuquoeOda36w+L3nkTkewcCxHZuqWkCFwja/jrsCtMAMgvqraP0RBzr1HcUoke6MDCRe+j1cV0gzeIYc71HJ5Iadjsw/DKVpkxJEb3awWI1Ei6GE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=F5DQBhey; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="F5DQBhey"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ac339f53df9so698243266b.1
        for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 13:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1743367371; x=1743972171; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Q9bbo4m0YKczHWopSRDS1sLs4WUH12+PaT6dXT6fcFw=;
        b=F5DQBheypQvnPb0jHDEPcu/26ZvmqtMxnuigy8U1qzMdJMq9SkU4YMkLEXhIBwyPid
         MrgbI1664+DBxqdQnAJlGijNfvk0BblLgaWrmDC9+ublsnup0OynA+WhA7yv2qW/GHHk
         RQmxkN09GvftDWeGdpMeczk1l5ikVGwF60OVE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743367371; x=1743972171;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q9bbo4m0YKczHWopSRDS1sLs4WUH12+PaT6dXT6fcFw=;
        b=NeyzHEeYzF/89lkxXNgpupL+TiHVNXnxYgANVS5k/e1kITWwavw6b1icx7bYcNiu8V
         K9+zsHNiLC1bv9UvoUFgFFnWgFCJ5Vx93twonGGDXevyDEShPtboCW+hnr0TTUbnJQjR
         Spw6tJVZHbbwai0ivBQExlJ+iPozZFfgWh10NyZYE+Kr/KZW6MpD2deZ6hVjtelP+Xwc
         Qi/dqhRv9yiVSFue1FxqdLvcGXw72ihlVD+FX0lvKRh5fk0KUcOlIfLRETGzXgBo4wdq
         hTnYqcF6a4LaiXoMXbr+T+Gg8qy19Hp/qheuUGLDVnVL0PE/PsZ2oJ90Npryvwo8LEYe
         iauQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDreStPE31hlpmdDdldXUeg/AIlh2Zr+2+ZQtdqkxsahBHvcmsuH7aHrMbPrTXoMD7j7Iazhw1tmvFW/E=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKVAmcR/m8a5EmsjVr8ZBOJEpnUo7gPMKhTCQdE20yWVs6ZrKy
	OEqtjs2hwnzwCaS+mnNM4Kxv6kjq+4+xK9xHhWQ3XtNcUHru3ReBAU7Hy1swtXyW7T06nnDLIhp
	4Qm4=
X-Gm-Gg: ASbGncs1jFbJKD5HOyMYOHaTyVtS1vJmZZ+MrEIDZinPzPu+D99TA+JW4/GQ4X8o83b
	V+FKEMA3tfWcIo63yGwj60BkmYDs7r7An8vUlOTn3RiSJOC/eP5Joc4KBIBEIzFMNJfqlu3BRWq
	ZS5V1IMRdtRXmooRQjiCDUuG7b8eqmIgpuKeYB9iDcxj2gCN5i1W0xZ0WqzYckAgtKUI1sXh7XH
	znccbRyzgBLVBsYkvud64da/QVhKN7rHJNwgsfgM09fHAKsKtvbb38q1b0IepEGkd8gjodwTDIM
	HKeBQFzfd+7jXPzdsjvJryXeZ+oakr8mndNu8o94QeKTB0uGOGKIvr1OEvLkCZPXuq9SJU/gJ1V
	IS2hdrH+3biMRn1ziTmU=
X-Google-Smtp-Source: AGHT+IFABE4Lk4WxG5sxbxe98v3hsjb9qgEBbx7CMdAKQYsYZXNfmaJ9OQ6WF/LhWtcj4Fl1CiuFWw==
X-Received: by 2002:a17:907:96a7:b0:ac4:2a9:5093 with SMTP id a640c23a62f3a-ac738bae0cemr634037466b.41.1743367371193;
        Sun, 30 Mar 2025 13:42:51 -0700 (PDT)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com. [209.85.218.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac718f7159bsm523257666b.0.2025.03.30.13.42.50
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Mar 2025 13:42:50 -0700 (PDT)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ac339f53df9so698240666b.1
        for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 13:42:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXN4MWk0b2gOG8wiib7t+bB3oyiSejbdubxz1/5H7oQDSD4x0cwsUduKewlmXl5eIIhtojYUk16txwRsYA=@vger.kernel.org
X-Received: by 2002:a17:906:d553:b0:abf:6264:a624 with SMTP id
 a640c23a62f3a-ac738a8ea3amr567488066b.32.1743367370064; Sun, 30 Mar 2025
 13:42:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250327145159.99799-1-alexei.starovoitov@gmail.com>
In-Reply-To: <20250327145159.99799-1-alexei.starovoitov@gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 30 Mar 2025 13:42:33 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgRbk2ezu1TNewZQSrT1MCzP-xAXrcHXULMeW=RRSak5A@mail.gmail.com>
X-Gm-Features: AQ5f1Jo5PmHauyYbc5x0xsHSrONdOA84_jiW0Ke6tVTWo1pXzyKY5d-PBNExuF0
Message-ID: <CAHk-=wgRbk2ezu1TNewZQSrT1MCzP-xAXrcHXULMeW=RRSak5A@mail.gmail.com>
Subject: Re: [GIT PULL] Introduce try_alloc_pages for 6.15
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: bpf@vger.kernel.org, daniel@iogearbox.net, andrii@kernel.org, 
	martin.lau@kernel.org, akpm@linux-foundation.org, peterz@infradead.org, 
	vbabka@suse.cz, bigeasy@linutronix.de, rostedt@goodmis.org, mhocko@suse.com, 
	shakeel.butt@linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 27 Mar 2025 at 07:52, Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
>
> The pull includes work from Sebastian, Vlastimil and myself
> with a lot of help from Michal and Shakeel.
> This is a first step towards making kmalloc reentrant to get rid
> of slab wrappers: bpf_mem_alloc, kretprobe's objpool, etc.
> These patches make page allocator safe from any context.

So I've pulled this too, since it looked generally fine.

The one reaction I had is that when you basically change

        spin_lock_irqsave(&zone->lock, flags);

into

        if (!spin_trylock_irqsave(&zone->lock, flags)) {
                if (unlikely(alloc_flags & ALLOC_TRYLOCK))
                        return NULL;
                spin_lock_irqsave(&zone->lock, flags);
        }

we've seen bad cache behavior for this kind of pattern in other
situations: if the "try" fails, the subsequent "do the lock for real"
case now does the wrong thing, in that it will immediately try again
even if it's almost certainly just going to fail - causing extra write
cache accesses.

So typically, in places that can see contention, it's better to either do

 (a) trylock followed by a slowpath that takes the fact that it was
locked into account and does a read-only loop until it sees otherwise

     This is, for example, what the mutex code does with that
__mutex_trylock() -> mutex_optimistic_spin() pattern, but our
spinlocks end up doing similar things (ie "trylock" followed by
"release irq and do the 'relax loop' thing).

or

 (b) do the trylock and lock separately, ie

        if (unlikely(alloc_flags & ALLOC_TRYLOCK)) {
                if (!spin_trylock_irqsave(&zone->lock, flags))
                        return NULL;
        } else
                spin_lock_irqsave(&zone->lock, flags);

so that you don't end up doing two cache accesses for ownership that
can cause extra bouncing.

I'm not sure this matters at all in the allocation path - contention
may simply not be enough of an issue, and the trylock is purely about
"unlikely NMI worries", but I do worry that you might have made the
normal case slower.

It's easily fixable later if it ends up being the case, so I don't
worry too much about it, but I did want to mention it since going
through the code made me react to it.

                Linus
