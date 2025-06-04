Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA91438384
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 15:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749051773; cv=none; b=Frd9kllHg+ywcHfWuKOcQifIYHrx6SSuXbUMGWzRUjEy0NuCmRsLCUMren/Fuz6n/m1xG8ja6TgrAZkuZIRyzZiMoItvgimyLRq3lovjwHGnScumrjgzB/G8xCciPD7drJ+QvGNEp4P83rdub7k8eMMAaw2O1ko3V386xwqMro0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749051773; c=relaxed/simple;
	bh=Qhrjv6hZn1nxtaluhsK7WsV/D9fLlQ6PICV6uLJb4Ac=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LCxiByOUhdtF9BBPii6IsSsQL5UOWybGg43cDGxbAIyrPviXYepbvT0SJzsEsVqIJr2y2d9M6pgLMusdo2p46JXHp1aQ/dW2j9JXXZKkdOJGVNAwTS7lqeu3hLXWIXTjabgN8sNves8QtoZ42YM206VmHE130vSbSXbkrhPkkEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=gWiZVUlL; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="gWiZVUlL"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ad88d77314bso1249613266b.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 08:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1749051769; x=1749656569; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=72BR0mnOxHdy2FcQxO8/Op0YCccM3iuq7r9CRzFPZg4=;
        b=gWiZVUlLggnsgXVifPLmrLnlLRfOiNjVA2EpNYUwB5CwPjp7cuzucRhIbL8w4/Qsq2
         bRAwvZJbtyUvsuduQS5qqerwYmlmb7bioqa1ZzQPqWp5GyDw1U7oStiSVMd8cETpvMYk
         czbnUqBNM3IiD2KW04LRO8/d/qqPIOFnFblf0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749051769; x=1749656569;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=72BR0mnOxHdy2FcQxO8/Op0YCccM3iuq7r9CRzFPZg4=;
        b=JJVfgS+WLhtGuiNwGZV9/2UnXo97CCgsPkfBeTKhrES+bxr6pYqB4uJ8q9xYKEfnsQ
         HylpnrHEka8/caWU0XejjI47LMr5BOtrctpXe2Kq/I8w7cPYO4K5QjMKcqk3cJZgRokI
         UKLbmGvMfOqI+HyXKvKCIZhUQsL5atfAmfw5PzqMWmPCYMIF/wo3wK8upphRECSJcUdr
         73dkkP+yhpffzNYG2ZjJoOMCar7/j8f+thlVkopV3sDMNWRp1uSuuE/D0zxwzphcLSe8
         OVwbc2nuip2KwehiG240X2mU040gaovnSTcgyTJ/9ziN/2Fuq8JM1tFqePgFM+2CCDim
         mD+g==
X-Forwarded-Encrypted: i=1; AJvYcCWKsJWaUyAQsyBaWpoIGbsqNgsI8dlqvCmEpNGH4wawfMPg0Mnlj0cLUavvbU1/F8SYePyV6CPd8WidiD0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxcezw7HYnHT5puINQy0SayujrQQ3xkzJ33psGRv+qAwDmVxToA
	xKrIXXeR4jDvk8mx0N6TI7tBcRgGE8fIyOULlbaiJ720gAYE/K5CamQYXW2h+LeURRT2rVaPFkz
	DTneiK01zrQ==
X-Gm-Gg: ASbGncs+ya5ujWGFYKmvFTyc653CRe4rqvZQB6Rc4xLX+frM8t+Am3tokjElo9B2svx
	Y+dPM05sxXnepKEoB6kz7QzJW/z+SuRxiVAY0/K+3kUoHWVuLI6UK/UgrN2JWL1UkYp5xSNhbzN
	FZ2QZLwvlaPrE1I0Vpx+3RHHk0iLi9eclDaXn5lrG+VoCsLnOj9gbNJuyMiIV8N4fVrjmf/eyaY
	y418P/2+mO4snoaAvmmqGu7vLmoOI8ambJmQ8g26gS/P/sk3df5JYgnPvXuUCd6EJBsDJqE1T/X
	VMYE4s+h7RRqDFdeJ9O5Nc85koM/r2zxC4b2Pkk9bU+fYGRO9iNLyxl6zXTfYP1U1848l6NoQX3
	vyKHSmVkyaiiw9zply69YvlU6Nw==
X-Google-Smtp-Source: AGHT+IGwhafMrrrIAtnQfakYUC96IEg8QQZ+VS364EFr7wPvCQcJeclUz4PDIwBgVksVZERA0mZwhA==
X-Received: by 2002:a17:906:3b4b:b0:add:fa4e:8a7a with SMTP id a640c23a62f3a-addfa4e9117mr204254266b.34.1749051768798;
        Wed, 04 Jun 2025 08:42:48 -0700 (PDT)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com. [209.85.208.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d82e846sm1111034766b.70.2025.06.04.08.42.47
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jun 2025 08:42:47 -0700 (PDT)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-60179d8e65fso3195216a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 08:42:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWj5QvleocpInTOqvwWRfk8c1TV2858RoPtyWo5S8EpcplTlctoPhAUNJZ9nALdjCLLV3jNOw3EJ9OJyr4=@vger.kernel.org
X-Received: by 2002:a05:6402:50cd:b0:602:ddbe:480f with SMTP id
 4fb4d7f45d1cf-606e944ffdbmr3318338a12.9.1749051767165; Wed, 04 Jun 2025
 08:42:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250604140544.688711-1-david@redhat.com> <fb548cd0-4a6a-4e90-92b8-24c7b35df416@lucifer.local>
In-Reply-To: <fb548cd0-4a6a-4e90-92b8-24c7b35df416@lucifer.local>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 4 Jun 2025 08:42:30 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjO1xL_ZRKUG_SJuh6sPTQ-6Lem3a3pGoo26CXEsx_w0g@mail.gmail.com>
X-Gm-Features: AX0GCFsf8ms4gV6ZUTVFCM9XPKVFpcGv2mCqTXaG91B4GGR1O9kNamR8xKRlH28
Message-ID: <CAHk-=wjO1xL_ZRKUG_SJuh6sPTQ-6Lem3a3pGoo26CXEsx_w0g@mail.gmail.com>
Subject: Re: [PATCH v1] mm/gup: remove (VM_)BUG_ONs
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>, 
	Peter Xu <peterx@redhat.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 4 Jun 2025 at 07:49, Lorenzo Stoakes <lorenzo.stoakes@oracle.com> wrote:
>
> Linus's point of view is that we shouldn't use them _at all_ right? So
> maybe even this situation isn't one where we'd want to use one?

So I think BUG_ON() basically grew from

 (a) laziness. Not a good reason.

 (b) we historically had a model where we'd just kill processes on
fatal errors, particularly page faults

That (b) in particular *used* to work quite well for recovery - a
couple of decades ago ago.  A kernel bug would print out the
backtrace, and then kill the process (literally with do_exit()) and
try to run something else.

It was wonderfully useful in that you'd get an oops, and the system
would continue, but that *thread* wouldn't continue.

And decades ago, it worked quite well, because the system was much
simpler, and the likelihood that we held any critical locks was
generally pretty low.

But then SMP happened, and at first it wasn't a huge deal: we had one
special lock, and the exit path would just clean *that* lock up, and
life continued to be good.

But that was literally over two decades ago, and none of the above
actually ever used BUG_ON(). The page fault code would literally do

        die("Oops", regs, error_code);

on a fatal page fault. A "BUG_ON()" didn't even exist back then, and
die() looked like this:

        console_verbose();
        spin_lock_irq(&die_lock);
        printk("%s: %04lx\n", str, err & 0xffff);
        show_registers(regs);

        spin_unlock_irq(&die_lock);
        do_exit(SIGSEGV);

which tried to simply serialize the error output, and then kill the process.

When it worked, it worked quite well.

(And yes, page faults are very relevant, because this is what BUG
looked like back then:

    #define BUG() *(int *)0 = 0

so it all depended on that page fault printing out the state and exiting)

But as you can well imagine, it worked increasingly badly with
increasing complexity and locking depth.

When you come from that kind of "kill the process on errors" and you
then realize that you can't really do that any more, you end up with
BUG_ON().

The BUG_ON() thing was introduced in 2.5.0, and initially came from
debug code in the block layer rewrite.

And in that particular context, it actually made sense: this was new
code that changed the block elevator, and if that code got it wrong,
you were pretty much *guaranteed* disk corruption.

But then it became a pattern. And I think that pattern is basically never good.

I really think that the *ONLY* situation where BUG() is valid is when
you absolutely *know* that corruption will happen, and you cannot
continue.

Very much *not* some kind of "this is problematic, and who knows what
corruption it might cause".  But "I *know* I can't continue without
major system because the hardware is broken sh*t".

In other words, don't use it. Ever. Unless you can explain exactly why
without any handwaving.

Cloud providers or others can do "panic-on-warn" if they want to stop
the machine at the first sign of trouble.

                  Linus
