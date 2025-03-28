Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB0A94C83
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 01:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743123627; cv=none; b=biyDF8ZZmVjjq04xOKlf3jCfnbZqTGyVxWOHpkTFt2cmpb5GfBCYmZ4pbt/axi/tBovgy5xnaQaEZhOSrk1GzjlW2di27PB8/UBixw/ECmb8QNOgI3LlDaW5RPYjOViLBit0jeb78cYPewHYxoq2zkqqn7o5sFV/zGmr12GpfqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743123627; c=relaxed/simple;
	bh=kgR0NgQuOg13kE9Z7i/dRBaGRtqP3bAjEX438uAAKv0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q8NBkDNNnHUBS1BH11VWEway8VFMWq6I2FgxDxE1IRYd7aL0QpNS4r8YUmlYxRddVxAfVKSlGSwHxbqw6cH1xLZDLEBP7s+FrPsanFlfMyFyqqvqG82ra2i8M2Zkl+PNGLpaMs5oF6WMKqQnsH+0Sof1GXavtYDWB6UaA8FDyio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=ebjdsi5E; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="ebjdsi5E"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5e5e63162a0so2354176a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 18:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1743123623; x=1743728423; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eVFTS0CrUR2pvpvgA8NwIshoSjq8S0ndC9OfX9P6sss=;
        b=ebjdsi5Evuy7jsNk788DZuA8U8EJUcNa9hFdlAlFz11vkFVlT1fNBvE2RUsJpGa0pN
         i2wuiJtJlrV25zKQCRurS+EUIepf6q4odDOAuGlreF9BNx2try1KxCid/owNG0xQk9zU
         Y3sJTfpF6arD2k+KfSqQZslh/zWybzLWDN6zA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743123623; x=1743728423;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eVFTS0CrUR2pvpvgA8NwIshoSjq8S0ndC9OfX9P6sss=;
        b=LNosMv1GhcfYjbup0fnKPQyf/eaw8Lna9a2W8NBdQi7cnBtuY/Z7AaEx4WnkibFKIS
         mE0959Nk8tak5EnCZQjyMLffTSpOjYtMDOgu0nfINDiu6TdotRbvefbRkKkK80UGHkxI
         YYXxRXH8hMmJ4RvfUN1/3T7OWXH2G2Ps3LBos5SPfIseaab2YbPCPjg3sF5RKqHOhMzc
         7g+42HlkM9F6QaBwfz+5o/zWh2C677NcYTuT2YEUDaLvciXWThrR2P1YhZNmJ/1EW0LJ
         tW9VCviEiGIKMw+/tNJNaA3Lo+lRdZkA7v+t5k+DfrgbaBFo407GK+OT5LiX33C/c2j3
         wXvg==
X-Gm-Message-State: AOJu0YxBovRDN4yWJWUiEdaaHQYHTuXwXxFnoQpdAs6/R+HMw/vklubY
	8p2e8p7ikWON5Ioh5tIVJqxD2b0StCdYEPOo3LOFfwaxG7MAQb8jfepKFKK66lFLAFaci0YYHyI
	Jq+s=
X-Gm-Gg: ASbGnctRdJ1d1mmbf7bJ+UrXn0KWBWEXX9CO4eqSiC9BJk4qHYk1PdzfdLzDTiY7fqB
	fInzompYNHhCJY2xjEGjynXdxyeJ/GvmjhunA8eJkOPnfqBAVq5HCXB959KpfUB8U/ElnBCPQCW
	ux9nIv6PQbqsMDt+eyKdlaSTOIj3o4797BWPRdGLmjnTVmmBd1rRIL6MTTOWY3QpBtQr9GaUyxA
	nPr24Kp28O9+SzrHWY3pWJOASHlUI9eXcmXIjDNlBvWU3XbgP6aFgP5sVeGOQ06i9KSvO7TKLOO
	zgCbknMJ/5/u43g9X1OC0/gViT3ZTZcbLlCRKwW1Gaxk9mPBOR505/O2pUGvWrXpHljzUcHR96L
	b/50a/BQvtzi1V4jSK+Q=
X-Google-Smtp-Source: AGHT+IGpc+V0CNPyoZw4TOTQLm09FW75HOXmO98XweoARgE9feJQlqzn8IKaLze5XIkBuH8JnBwVPA==
X-Received: by 2002:a17:907:2d08:b0:abc:b8c:7b2d with SMTP id a640c23a62f3a-ac6faf1041bmr422417066b.32.1743123622686;
        Thu, 27 Mar 2025 18:00:22 -0700 (PDT)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com. [209.85.218.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac71967fd28sm74020566b.126.2025.03.27.18.00.11
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Mar 2025 18:00:11 -0700 (PDT)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ac2bb7ca40bso313993766b.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 18:00:11 -0700 (PDT)
X-Received: by 2002:a17:907:60c8:b0:ac2:d5e6:dea7 with SMTP id
 a640c23a62f3a-ac6faec4137mr569038166b.13.1743123611075; Thu, 27 Mar 2025
 18:00:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250327171037.032bf7e7@gandalf.local.home>
In-Reply-To: <20250327171037.032bf7e7@gandalf.local.home>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 27 Mar 2025 17:59:54 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgD9MQOoMAGtT=fXZsWY39exRVyZgxuBXix4u=1bdHA=g@mail.gmail.com>
X-Gm-Features: AQ5f1JpBOZ65FsDFP7bIjhjYz9yxn5rbbU78YvwFyOQXqw7zzjv9ILss4UUIKAs
Message-ID: <CAHk-=wgD9MQOoMAGtT=fXZsWY39exRVyZgxuBXix4u=1bdHA=g@mail.gmail.com>
Subject: Re: [GIT PULL] ring-buffer: Updates for v6.15
To: Steven Rostedt <rostedt@goodmis.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Feng Yang <yangfeng@kylinos.cn>, 
	Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 27 Mar 2025 at 14:09, Steven Rostedt <rostedt@goodmis.org> wrote:
>
> - Allow persistent ring buffer to be memory mapped

Steven, I'm not going to tell you again.

Next time I see you making crazy mmap changes and trying to push that
shit to me, I'll just put you in my email spam filter and will stop
pulling entirely.

I'm done having to check your pull requests for crap you add randomly.
You have a *VERY* bad habit of writing code that "works", but not
because it should, or because it's well designed, but because it has
random hacks in it.

And dammit, THAT IS NOT OK when it comes to VM or core VFS code.

We don't do random shit that just happens to work. It needs to be
thought out, it needs to be correct, and it needs to be well-designed.

This is garbage. I pulled, I looked at it, and I puked. It is unpulled again.

And you have done this before, and I have complained about your
hackery before. You apparently learnt absolutely nothing.

Taking random kernel addresses, not knowing where they came from,
testing them with virt_addr_valid(), doing two different lookups to
turn them into a 'struct page', and then to add extra insanity, turn
that page into a folio - whether it was one or not - and using a folio
function on the end result, IS NOT OK.

And then repeating the same garbage five times to really *revel* in
rolling in that shit like some kind of animal? WHY? I have a dog that
loves rolling around in some dubious smelly stuff she finds on the
road, and I love her even if she's a disgusting thing and needs a
bath, but I damn well don't let her write kernel code.

Moral of the story: Don't be like my dog.

If this was a one-off thing, that would be one thing. But this kind of
behavior with "this works, but misuses core kernel functionality" has
been a PATTERN for you. To the point where I have to check your pull
requests and I dread going through them during the merge window.

I AM DONE.

Here's the things you DO NOT DO:

 - forget where your pointers came from, and then decide to ask the
core VM about the information *you* should have known about and
tracked

   Hint: keep track of how you damn well allocated the pages in the
first place, so you don't have to go to the VM code and say "how did I
allocate this"

 - repeat the same ugly and mindless pattern in five different places

   Hint: if you do the same ugly thing five times think about what the
heck you are doing

 - take a 'struct page', turn it into a folio with 'page_folio()' even
when it wasn't one, and use flush_dcache_folio() on the result

   Hint: there's a "flush_dcache_page()" function, for chrissake!

Dammit, as far as I can tell, you actually *did* have the information
about how something was allocated, because it's that
TRACE_ARRAY_FL_BOOT flag.

And the patch that implemented this crap actually *removed* the one
piece of code that used that information to make decisions, replacing
it with the crap that repeatedly just asked the VM "can you tell me
how I allocated this page"?

And the code could easily have been made to not look like the
disgusting mess it is by using a helper function to do all of this.
But no. Instead it wrote out that *disgusting* thing by hand five
times.

And that "subbuf_order" thing looks *very* suspicious, since it means
that any non-order-zero case will look up pages using
'vmalloc_to_page()', bvut then happily go on to assume that the
allocations are physically adjacent in those subbof_order chunks.

IOW, code like this:

                if (virt_addr_valid(cpu_buffer->subbuf_ids[s]))
                        page = virt_to_page((void *)cpu_buffer->subbuf_ids[s]);
                else
                        page = vmalloc_to_page((void
*)cpu_buffer->subbuf_ids[s]);

                for (; off < (1 << (subbuf_order)); off++, page++) {
                        if (p >= nr_pages)
                                break;

                        pages[p++] = page;
                }

is NOT acceptable, because look how it first looks the page up using
vmalloc_to_page() ("because it was vmalloc'ed") and then it just does
"page++" as if it was some physically contiguous thing.

Hint: those two things do not go together.

I'm *hoping* that subbuf_order is always zero for anything that has
been allocated with vmalloc(), and that this is another of those "it
works, even though it looks like crap".

But my point is that the code shouldn't be written in a way where it
just *happens* to work, and "hoping" is not a strategy for long-term
maintenance.

IOW, you should not have code that first says "I have no clue how this
was allocated, so I'll ask the VM", and then in the very next breath
says "oh, I'll just treat this as a physically contiguous allocation
even if it was a vmalloc address".

Yes, I've seen random drivers do this kind of garbage. It's wrong and
bad then too, but at least it's not some core functionality, and
drivers doing "random hacks that happen to work" is just another fact
of life. It's not great, but it is what it is.

Stuff that is under the "kernel/" subdirectory has higher quality requirements.

And the thing that really annoys me is that this isn't even *remotely*
the first time I've had to complain about this kind of behavior.

I'm not willing to have to step in and fix your mis-use of core VM or
VFS functionality, so I'm not pulling this.

And I'm serious: you need to stop doing this kind of crap. Get some
real VM person to help you if you do memory mapping. Do things
*properly*, not this kind of "random hacks that work in testing" crud.

Or don't do memory mapping or subtle VFS stuff at all.

Really. Those are the choices you have.

               Linus
