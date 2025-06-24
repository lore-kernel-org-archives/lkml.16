Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49CB0770E2
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 16:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750780923; cv=none; b=GGeAKaxG+KRrBK6PRCJNkxwwm50c73BkoqqfVNr6Mx3SFuDz6XNc8vFeT/YugR9mPA0DpVLo8Hrm3gXfRNjDMu5G/edAyf9fjRgjn+raBWuO58xDFjlHQQHN9PKrBzuku/rSCWqWMB+9ntxmztif4ThInPVAHZtG+NQThqwzzdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750780923; c=relaxed/simple;
	bh=dy2arLagEzPcGqOL9oOnZw9S6LfuN84ri/cTpUjLYR4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PrRApvVDunVS5wDLrBtk2sYOh2zPHjEv83FpsjUy3h2Z1N+FqPUJsKK5gTsTlbxy4xUvsmtsBInar9MWelN13/VVxEye/fLjVWmBmd30+ca6hShLu8+IE6nCeHkEXv984VvpSC8oN+FKnTCRvtrlcBgA2UY2P0ApxlhOwUlyTIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XS7G+GuO; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XS7G+GuO"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ade33027bcfso98300466b.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 09:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750780919; x=1751385719; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lj9ti25DVp/MGP0VBReireOtkSjPAThxOLJ5ng8BnTs=;
        b=XS7G+GuOlXuMdwiRgw9lx/0RY79b8wpDja7It6KAH1MPbJir1pf/qP0V3s5vRLNFhA
         YIQu3Y9vxR/qeOaVaVYFz4kKr7Rd4u3UAbxxTrP09axE66+ySYBykrgVXJllTBeUiPyG
         R7CPC8dB/MDL9aKuG8YASw4re3SvveOzF6mor3PQOwEmtehyl0YswzDJIdVMK0rvDqvc
         ISYug5T4D/y1jxYDHI9JO1D8xkvEIt9yXrNpvpWAKOaIkm5EsT6PWQmGEotkOj84FYsQ
         gFF4nC0wLXv5Ys7SH7ZbIHB4GQpJjrbVtrlUCvKG/PXUS44bilVoAIEG3PyF8h9IQM2M
         z0kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750780919; x=1751385719;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lj9ti25DVp/MGP0VBReireOtkSjPAThxOLJ5ng8BnTs=;
        b=b6n683kj+LDvwzynD5CPAm8aiCuDk5oBD2Hjoxa32sPA21wfUWMiWV9sfn8CDB61/s
         Pw4RyFCg55jnQ+ELVHcTJ652lesmaha78q18Y5EjzlrNryVXcjcgWW/aSeHYPmyvKYgv
         UrTXIfCq7cpY5jeZIS9c1d5oZ0pV7QtYtYn5Sb0/9WqAL7zMuWXyLz2VLWA+iwZALqm1
         2tzvw57U+7eiDHnFlR3CKQtigB8nugHhLNx7lrcUq+/ALHVKOzKHt7PHsmw0yCIV0+Ow
         aJFo8sNqhoEP3x7dP5qW7crMJBwop3v3vx1WvCNpOS1e5jhKxbBPDQXsKN+6286veB5+
         Ni2A==
X-Forwarded-Encrypted: i=1; AJvYcCVsqITRLCy3G9q+Ni3BUp+xoR+pNGBeTjsMl7wrigF7negD3ZGazbBLTzWyA4A8HAUcYDXvC7c2HHBD+3g=@vger.kernel.org
X-Gm-Message-State: AOJu0YxzvCNjjHhBPR/adEtaVTJGpKRtHpErnu8XKZe4uFPnSQijplW5
	v018tQxzEllBZlJuylna/RhLHpouIHZgrl1CUhTo//9ytYVB1eN1tHtnPz7nGZTBz1h755+cFcc
	hvSWfmnRZhXt2pwGDv+pVPXvPF8h1JeE=
X-Gm-Gg: ASbGnctxV8sZRCWqAxIvkLRTJyVkDeuL2T0ZZb79jrtq4VD/3cZlSnwpfv5dipguWX7
	SPaV1c8pOmKYR1Zu0DYPdw+dOfDsoILGD5MPP7NG88O084HXRC67T/ldtk+X2LX2h4g/DK7Dl+v
	KPdj1M1Y0xOPRcCZER+XLGv8vakkXcI9E0LDNKzywm9mx6ukvg7LswXxTIOxCJxCycXNBrOczcb
	X5a
X-Google-Smtp-Source: AGHT+IE/rWo4LuQGQejkWuVAPfLkl7Xd0TELdgXEOKjve26xpJrrIkyPL0Z+tx9IZv45YFFgvtKu4whEyIbe0FKZE6w=
X-Received: by 2002:a17:907:3f1c:b0:ae0:a2c8:9e48 with SMTP id
 a640c23a62f3a-ae0a2c8a829mr561593466b.46.1750780917604; Tue, 24 Jun 2025
 09:01:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMvvPS4CNzc7gSF8Z+6ogB212V+GDJyW9PXrrrP+wMyDNfXKqg@mail.gmail.com>
 <20250624003408.47807-1-sj@kernel.org>
In-Reply-To: <20250624003408.47807-1-sj@kernel.org>
From: Bijan Tabatabai <bijan311@gmail.com>
Date: Tue, 24 Jun 2025 11:01:46 -0500
X-Gm-Features: AX0GCFtU5OmQ3KbpVJJoMB-ovknWAN2BFV8iD6U8wxsZVmH28WGU-r0OqL4pEVg
Message-ID: <CAMvvPS5kgOJtb6U+9TwEqSDYn0R2FG6rAPWjS98hAdHr4jkKbg@mail.gmail.com>
Subject: Re: [RFC PATCH v2 2/2] mm/damon/paddr: Allow multiple migrate targets
To: SeongJae Park <sj@kernel.org>
Cc: damon@lists.linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	akpm@linux-foundation.org, david@redhat.com, ziy@nvidia.com, 
	matthew.brost@intel.com, joshua.hahnjy@gmail.com, rakie.kim@sk.com, 
	byungchul@sk.com, gourry@gourry.net, ying.huang@linux.alibaba.com, 
	apopple@nvidia.com, bijantabatab@micron.com, venkataravis@micron.com, 
	emirakhur@micron.com, ajayjoshi@micron.com, vtavarespetr@micron.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 23, 2025 at 7:34=E2=80=AFPM SeongJae Park <sj@kernel.org> wrote=
:
>
> On Mon, 23 Jun 2025 18:15:00 -0500 Bijan Tabatabai <bijan311@gmail.com> w=
rote:
>
> [...]
> > Hi SeongJae,
> >
> > I really appreciate your detailed response.
> > The quota auto-tuning helps, but I feel like it's still not exactly
> > what I want. For example, I think a quota goal that stops migration
> > based on the memory usage balance gets quite a bit more complicated
> > when instead of interleaving all data, we are just interleaving *hot*
> > data. I haven't looked at it extensively, but I imagine it wouldn't be
> > easy to identify how much data is hot in the paddr setting,
>
> I don't think so, and I don't see why you think so.  Could you please
> elaborate?

Elaborated below.

> > especially
> > because the regions can contain a significant amount of unallocated
> > data.
>
> In the case, unallocated data shouldn't be accessed at all, so the region=
 will
> just look cold to DAMON.

"Significant" was too strong of a word, but if physical memory is
fragmented, couldn't there be a non-negligible amount of unallocated
memory in a hot region? If so, I think it would mean that you cannot
simply take a sum of the sizes of the hot regions in each node to
compute how the hot data is interleaved because those regions may
contain unallocated memory that shouldn't count for that calculation.
Does that make sense?

It's very possible I might be overthinking this and it won't be an
issue in practice. It might be best to not worry about it until it
becomes an issue in practice.

> > Also, if the interleave weights changed, for example, from 11:9
> > to 10:10, it would be preferable if only 5% of data is migrated;
> > however, with the round robin approach, 50% would be.

Elaborating more on this:
Imagine a process begins with a weights of 3 and 2 for node 0 and 1
respectively in both DAMON and the weighted interleave policy. If you
looked at the which node a page resides in for a group of contiguous
pages, it would be something like this (using letters to represent the
virtual addresses):

A -> node 0
B -> node 0
C -> node 0
D -> node 1
E -> node 1
F -> node 0
G -> node 0
H -> node 0
I -> node 1
J -> node 1

If we use a user defined quota autotuning mechanism like you described
in [1] to stop DAMON interleaving when we detect that the data is
interleaved correctly, no interleaving would happen, which is good.
However, let's say we change the DAMON weights to be 4:1. My
understanding is that DAMON applies the scheme to regions in ascending
order of physical address (for paddr schemes), so if using the
round-robin algorithm you provided in [2], the interleaving would
apply to the pages in node 0 first, then node 1. For the sake of
simplicity, let's say in this scenario the pages in the same node are
sorted by their virtual address, so the interleaving would be applied
in the order ABCFGHDEIJ. This would result in the following page
placement

A -> node 0
B -> node 0
C -> node 0
D -> node 0
E -> node 0
F -> node 0
G -> node 1
H -> node 0
I -> node 0
J -> node 1

So, four pages, D, E, F, G,  and I, have been migrated. However, if
they were interleaved using their virtual addresses*, only pages D and
I would have been migrated.

* Technically, the mempolicy code interleaves based on the offset from
the start of the VMA, but that difference doesn't change this example.

> > Finally, and I
> > forgot to mention this in my last message, the round-robin approach
> > does away with any notion of spatial locality, which does help the
> > effectiveness of interleaving [1].

Elaborating more on this.
As implied by the comment in [3], interleaving works better the finer
grained it is done in virtual memory. As an extreme example, if you
had weights of 3:2, putting the first 60% of a process's data in node
0 and the remaining 40% in node 1 would satisfy the ratio globally,
but you would likely not see the benefits of interleaving. We can see
in the example above that your round-robin approach does not maintain
the desired interleave ratio locally, even though it does globally.

> We could use the probabilistic interleaving, if this is the problem?

I don't think so. In the above example, with probabilistic
interleaving, you would still migrate, on average, 20% of the pages in
node 0 and 80% of the pages in node 1. Similarly, the probablistic
interleaving also does not consider the virtual address, so it
wouldn't maintain the interleave ratio locally in the virtual address
space either.

> > I don't think anything done with
> > quotas can get around that.
>
> I think I'm not getting your points well, sorry.  More elaboration of you=
r
> concern would be helpful.

I elaborated more above. Hopefully that clears up any confusion. If
you still have questions, maybe it would be easier to e-meet and have
a live discussion about it? I see you have a DAMON chat slot open
tomorrow at 9:30 PT [4]. If you have nothing else scheduled, maybe
that would be a good time to chat?

[...]

> > I see where you're coming from. I think the crux of this difference is
> > that in my use case, the set of nodes we are monitoring is the same as
> > the set of nodes we are migrating to, while in the use case you
> > describe, the set of nodes being monitored is disjoint from the set of
> > migration target nodes.
>
> I understand and agree this difference.
>
> > I think this in particular makes ping ponging
> > more of a problem for my use case, compared to promotion/demotion
> > schemes.
>
> But again I'm failing at understanding this, sorry.  Could I ask more
> elaborations?

Sure, and sorry for needing to elaborate so much.

What I was trying to say is that in the case where a scheme is
monitoring the same nodes it is migrating to, when it detects a hot
region, it will interleave the pages in the region between the nodes.
If there are two nodes, and assuming the access pattern was uniform
across the region, we have now turned one hot region into two. Using
the algorithms you provided earlier, the next time the scheme is
applied, it will interleave both of those regions again because the
only information it has about where to place pages is how many pages
it has previously interleaved. Using virtual addresses to interleave
solves this problem by providing one and only one location a page
should be in given a set of interleave weights.

When a scheme is monitoring one set of nodes and migrating to another
disjoint set of nodes, you don't have this problem because once the
pages are migrated, they won't be considered by the scheme until some
other scheme moves those pages back into the monitored nodes.

Does that make sense?

> >
> > > If you really need this virtual address space based
> > > deterministic behavior, it would make more sense to use virtual addre=
ss spaces
> > > monitoring (damon-vaddr).
> >
> > Maybe it does make sense for me to implement vaddr versions of the
> > migrate actions for my use case.
>
> Yes, that could also be an option.

Given how much my explanations here stressed that having access to the
virtual addresses solves the problems I mentioned, I think the path
forward for the next revision should be:

1) Have the paddr migration scheme use the round-robin interleaving
that you provided - This would be good for the use case you described
where you promote pages from a node into multiple nodes of the same
tier.
2) Implement a vaddr migration scheme that uses the virtual address
based interleaving - This is useful for my target use case of
balancing bandwidth utilization between nodes?

If the vaddr scheme proves insufficient down the line for my use case,
we can have another discussion at that time.
How does this sound to you?

> > One thing that gives me pause about
> > this, is that, from what I understand, it would be harder to have
> > vaddr schemes apply to processes that start after damon begins. I
> > think to do that, one would have to detect when a process starts, and
> > then do a damon tune to upgrade the targets list? It would be nice if,
> > say, you could specify a cgroup as a vaddr target and track all
> > processes in that cgroup, but that would be a different patchset for
> > another day.
>
> I agree that could be a future thing to do.  Note that DAMON user-space t=
ool
> implements[1] a similar feature.

Thanks, I'll take a look at that.

[...]

Thanks again for the time you are spending on these discussions. I do
appreciate it, and I hope I'm not taking up too much of your time.

Bijan

[1] https://lore.kernel.org/damon/20250623175204.43917-1-sj@kernel.org/
[2] https://lore.kernel.org/damon/20250621180215.36243-1-sj@kernel.org/
[3] https://elixir.bootlin.com/linux/v6.16-rc3/source/mm/mempolicy.c#L213
[4] https://lore.kernel.org/damon/20250620205819.98472-1-sj@kernel.org/T/#t
