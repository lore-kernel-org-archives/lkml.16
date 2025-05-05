Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6996F1DEFFE
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 17:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746467614; cv=none; b=GhEwEjyIjMF/5guzLN/kvpiADg6jxwxwQeHU23ZFZD1EHAfZ/HZFT3POVJgFGM4+su6M3ZX1MEa4q//ghFm/Gmc8ziemTxDvWbqI742GfFX3pfA2oqWHevU/O2EVMiXEeCrgkkPxzx5Kj9nVFdDtPVqDuhgzW6wPPKteqFqS6kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746467614; c=relaxed/simple;
	bh=NPTw3TvsMda/BtskMku/nisKOR9hZguAMuSGpvPjzgU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=USYrXPqblByJYTLCiSV7SCPHGmGIqmwu6nE9Xf2qTi8knuEKuwY1VpCZxHZjVy16N0RnYPuLaLm+yuHvn3wzBRClyPsxeaFFVVoNjbMQlCYzx/GVHtCnb6zh+5tdnGMfInWPd+wXraryH/laHmZ48jF4zl5I7hfydnGRLbP/+EE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=NS4JNS8u; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="NS4JNS8u"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5e8be1bdb7bso6975471a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 10:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1746467610; x=1747072410; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FUR5Bbe6vkCHrXghv04CQXxSrceX3A+xEZsbO0fMA3Q=;
        b=NS4JNS8u6MKIbJvAW83ZJaV/Zm3F11KGtUoPiVrJvl4CHPRP6D1lZ5R8X3rjRm5yFD
         Y1KbYi94CBJj+7IK0pbKxf0K2S7GgoIeWVenigPEKTazUYOHYU57733Zzp3U+7BzYwTo
         qdaeY++X4gVPs+Qzu9cjUUoHDCQArUq5ZgjigOcYiLgqxp77ANJ403o49yRb0XMz0dFR
         e/FomZxtbOVZPfTwhG2d6dU1YmJ7k4xCVXSt/BWdO2OTRI5r9XPh2MlPr3inVAoz3cw+
         mHoUvnw7d+3lfg3c8RvkAKvc789Lk2el/IDGjxtSaXEighc14hQFBwUydGcXfjAGs+2B
         xZ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746467610; x=1747072410;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FUR5Bbe6vkCHrXghv04CQXxSrceX3A+xEZsbO0fMA3Q=;
        b=eYQ3WdaDVb+YXZdBYXFkLtB6UOpNGrhJaovFa6q1+DSMEnWtPCgs/UEflYiKeIwvLV
         c/9ZjTGmF05WvSjrdNaW2WvGQirP1odq9jx3bOtpj/TgVJysT3inhdwbAyFOqs5w4/zz
         +ruSIEvh6wAx3MXYJ0T/rnDGJoAeJGk0+L+m56el81z/Bdj8Ij8MGgvViCldyoNDb2yI
         5SsbNv+zwRxCgE/pQhdBr4uxRue1clnZbHm37rFjIGzngFQfXMJQSWeFCZcujbr/MHHy
         XEWTvB61XoXBCkicD5juOYIez3jG1PrcDeYpHwQaiP2GcKJbQ8cJwWOyEp0+OgdBir7j
         iLqA==
X-Forwarded-Encrypted: i=1; AJvYcCXBOFzd+HhFPtb51JxdZVc5EjGYx9+zS9daGeq25ln40wrjNEBmViOEZQK3KjpYple6r04S3JiGxyL4sM4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBqBqk7mpklYHcGANydpWH8sGPTv/1tuU3mKwX7sUJQ5KN4FAy
	j9FxIvPMH7w+I07hzLMkxBuniAboeYB5n3c/qU4ft0+liaF68oautrsoAO675zT+FaepfxMVFdh
	wJt8BYmWMkGf4wph1SrBTCSBKuH0G0En4SNq4MA==
X-Gm-Gg: ASbGnct5BkLWGmZV9eLx3HosP+UNtwmfPE4NOEid3JLQGxEtLYxgWjMJuJAVGIbyLLc
	M1Z980S6/KaN7wKRFPjUJyWl0Ng/UqQ0jEpgeS6xa04y2mRioEFu9It61tAP+45VdEY3tNvtwjc
	L5Bxv+yDms+YbhKsH+b3i4
X-Google-Smtp-Source: AGHT+IEHRtDRx5HFynS+EDSrTYt1Fma7/XNpUynGJutMyIAPewpV368hIKjACS5qJHIERSpMB1O8lSN6JnEC6RXBDTk=
X-Received: by 2002:a17:907:1c1e:b0:acb:5583:6fe4 with SMTP id
 a640c23a62f3a-ad1905d7cb0mr805227166b.6.1746467609596; Mon, 05 May 2025
 10:53:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250505115056.1803847-1-neelx@suse.com> <20250505115056.1803847-2-neelx@suse.com>
 <20250505151817.GX9140@twin.jikos.cz>
In-Reply-To: <20250505151817.GX9140@twin.jikos.cz>
From: Daniel Vacek <neelx@suse.com>
Date: Mon, 5 May 2025 19:53:16 +0200
X-Gm-Features: ATxdqUHcaDndKHa0L6pyjnX53G91GvgxchF5EMwRJc8tKO56uvY3lpzDHOZ3Upw
Message-ID: <CAPjX3FfbeGmPkXY1NDnecrtcLe5dqX7+vLOLGe3sdggUfS-WSg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] btrfs: remove extent buffer's redundant `len`
 member field
To: dsterba@suse.cz
Cc: Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>, 
	Boris Burkov <boris@bur.io>, linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 5 May 2025 at 17:18, David Sterba <dsterba@suse.cz> wrote:
>
> On Mon, May 05, 2025 at 01:50:54PM +0200, Daniel Vacek wrote:
> > Even super block nowadays uses nodesize for eb->len. This is since commits
> >
> > 551561c34663 ("btrfs: don't pass nodesize to __alloc_extent_buffer()")
> > da17066c4047 ("btrfs: pull node/sector/stripe sizes out of root and into fs_info")
> > ce3e69847e3e ("btrfs: sink parameter len to alloc_extent_buffer")
> > a83fffb75d09 ("btrfs: sink blocksize parameter to btrfs_find_create_tree_block")
> >
> > With these the eb->len is not really useful anymore. Let's use the nodesize
> > directly where applicable.
>
> You haven't updated the changelog despite we had a discussion about the
> potential drawbacks, so this should be here. But I'm not convinced this

Right. That's because I was not sure we came to any conclusion yet. I
thought this discussion was still ongoing. I understand that so far
this is still all just a theory and any premature conclusions may be
misleading.

But yeah, I may write some kind of a warning or a disclaimer
mentioning the suspicion. Just so that it gets documented and it is
clear it was considered, even though maybe without a clear conclusion.

> is a good change. The eb size does not change so no better packing in
> the slab and the caching of length in the same cacheline is lost.

So to be perfectly clear, what sharing do you mean? Is it the
eb->start and eb->len you talking about? In other words, when getting
`start` you also get `len` for free?

Since the structure is 8 bytes aligned, they may eventually still end
up in two cachelines. Luckily the size of the structure is 0 mod 16 so
just out of the luck this never happens and they are always in the
same cache line. But this may break with future changes, so it is not
rock solid the way it is now.

> In the assebly it's clear where the pointer dereference is added, using
> an example from btrfs_get_token_8():
>
>   mov    0x8(%rbp),%r9d
>
> vs
>
>   mov    0x18(%rbp),%r10
>   mov    0xd38(%r10),%r9d

I understand that. Again, this is what I originally considered. Not
all the functions end up like this but there are definitely some. And
by a rule of a thumb it's roughly half of them, give or take. That
sounds like a good reason to be concerned.

My reasoning was that the fs_info->nodesize is accessed by many so the
chances are it will be hot in cache. But you're right that this may
not always be the case. It depends. The question remains if that makes
a difference?

Another (IMO valid) point is that I believe the code will dereference
many other pointers before getting here so this may seem like a drop
in the sea. It's not like this was a tight loop scattering over
hundreds random memory addresses.
For example when this code is reached from a syscall, the syscall
itself will have significantly higher overhead then one additional
dereference. And I think the same applies when reached from an
interrupt.
Otherwise this would be visible on perf profile (which none of us
performed yet).

Still, I'd say reading the assembly is a good indication of possible
issues to be concerned with. But it's not always the best one. An
observed performance regression would be.
I'll be happy to conduct any suggested benchmarks. Though as you
mentioned this may be also picky on the used HW. So even though we
don't see any regressions with our testing, one day someone may find
some if we merged this change. In which case we can always revert.

I have to say I'm pretty happy with the positive feedback from the
other reviewers. So far you're the only one raising this concern.

So how do we conclude this?

If you don't want this cleanup I'd opt at least for rename eb->len
==>> eb->nodesize.

> And there's a new register dependency. The eb operations are most of the
> time performed on memory structures and not just in connnection with IO,
> I think this could be measurable on a fast device with metadata heavy
> workload. So I'd rather see some numbers this will not decrease
> performance.
