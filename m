Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC111F0E35
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 10:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739268163; cv=none; b=DHNkFriuswGnJQnV2Nsb5B3IBAkUPtfvA6W7p+jSW46OD2KtvXhLeVI+d/zClcb61qwKWj49yjv4ebD34tAN/a+OeUIgz75ChyqNFP8R0SRkwHiC7CeFQWzV2BMg/PgAyzY9rpcENhsskwnYwOIrN4IUs3h8o12JNTyt00X08Hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739268163; c=relaxed/simple;
	bh=hd1+YDeZXS/nC19xOZjHxxY6j4PlH4gVKU/KpBbuMUE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a9MPmCMRclmNclZKs0Xsjm4/brozS32GMz/pQjTLehi1tJkv1l7ik1z4wDE5Scwj5EcYnvhw7XLAL2fjnvBrfcD5SkZgKP+fX4glAcbMieS8wiCi/cmldx78IvK6QSt33338yQGUCGTJ+qFv6WktN5aQNSncRSv+RH/A2LpNfzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=i9kWw8by; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="i9kWw8by"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-47180c199ebso201251cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 02:02:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739268159; x=1739872959; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eKLVYn9MNX6w1agOYUoY0ZzZutoTaHUPZL5isC3H0Ic=;
        b=i9kWw8byd/pjpIRPTIrD2wK1vW5zdr6tYQgIE+JU0Zt0qLAYDof0WJROwmiHJNDCjE
         HXR8eUD2vBVEAnjQ1rSdFo+FfYyna/iRLgSkyV9xn/h9TzCALiDdq9VZm7+uJ4KaYDm5
         dnBE9qdczM5zWcWUZbeG1onCWEp+7/Zrsa0mfYKxzID+csmd/+FkykhuycCruahqXghl
         Zz2wMJtCj3m0Ehq97AuspwNvtWjaWVyA/f5Er64pjsLqflLqI8Dx1uFWrPt4kNJPNwUA
         BbiTx+Vfz5tTAAXa5PZ9gpSSmfgo2CcH/odxbSpXSZP97n7kUi4fTsaj61nAl+/dkHdX
         E5Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739268159; x=1739872959;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eKLVYn9MNX6w1agOYUoY0ZzZutoTaHUPZL5isC3H0Ic=;
        b=ZddBBkaWUO4odqEID8BHLJY/jvxbTjfqelxde3ijBTqHVvrD1h8jJZsQy+enCR4C7/
         WpZhn16d+B6y21/FlfRxm17sc2OCxvRyQO3kZl54DpLiUY46cDZSrv3GM2zyAlstTx2D
         tr5DqWgmIjOzTimZK04l7lyGytb4rBJ+vZrksa811aZXAghbaSyeknoNjL9wCtYptacm
         a0nYzWXIYHjwAm6jLKwBPzfCMCzGle7fihVw92E+/jHcMIZe6q8t0vQn7PmOGq0C+Zt2
         E7DO56fKtP1+FOZTQ+nx72gDHT54HgQE3Ft9dGgDEz8AtR3ZH3i1Z9ikQep3pX8vFyd8
         AF1w==
X-Forwarded-Encrypted: i=1; AJvYcCUcD51D8kO3A1o3bT7ogF6H1VqNOE9bvVt5RyXe7dL4ZEVX90rzOmIi7bXwCtTOXL5llO5Sfa7iBg2awCQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxy13IMoNAWJTIYWvys5H4RPbKeCCrqcFgCoD03dQjPK7N5scnD
	nCDGAKzjg8juYWdgqHnBDbzNAwRK0WtSKfiDKKZP1VVAFI0UaSDN95YJHQfS9rYrJ3a0GcEyoR7
	H1IURDIJEs/2FiQObhPbzOXXCgUk3b8lbTHzC
X-Gm-Gg: ASbGncsPWBqus/wMvpjCkQrWWw8UUofNATEL+70bawS8qP46kGAPammD3tWQwrLB4nQ
	pZI02O/rgnHIE1u+i8/61Ss2QWctfOvgC46ruuPqlT2FeDFVELXCeuq5mHx9MeODTGDPjCbZuVk
	29t/gSx2J1ariRgrNs/OXZLu/F9Mg=
X-Google-Smtp-Source: AGHT+IG9wgWbPuNrL5f3yGYLS5oyE9nJ8NVKVFY1HedcZ2iODNFy9eXq2tqvtxaiX1EX+N4ZCbS4zR4ophnheDMh7Bk=
X-Received: by 2002:ac8:5707:0:b0:465:3d28:8c02 with SMTP id
 d75a77b69052e-471a2400771mr3200741cf.26.1739268158790; Tue, 11 Feb 2025
 02:02:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250206044346.3810242-1-riel@surriel.com> <20250206044346.3810242-11-riel@surriel.com>
 <CA+i-1C2zuctxx6oPVVu0zBJ=Q=Hs73mgrWs5jsp8obARNcUS9g@mail.gmail.com> <2d20c333400b890f4983cf799576435abf1d8824.camel@surriel.com>
In-Reply-To: <2d20c333400b890f4983cf799576435abf1d8824.camel@surriel.com>
From: Brendan Jackman <jackmanb@google.com>
Date: Tue, 11 Feb 2025 11:02:27 +0100
X-Gm-Features: AWEUYZmACdHAjvQ84WF4VaVnnZCnBE3s7R27fpvrPXwIWGvbu2V7Sf7mmtUYrlg
Message-ID: <CA+i-1C16x5u-1qAqDPSONgs+pGWrfUTO1zq2r6Rrvq=q48NHpw@mail.gmail.com>
Subject: Re: [PATCH v9 10/12] x86/mm: do targeted broadcast flushing from
 tlbbatch code
To: Rik van Riel <riel@surriel.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, bp@alien8.de, 
	peterz@infradead.org, dave.hansen@linux.intel.com, zhengqi.arch@bytedance.com, 
	nadav.amit@gmail.com, thomas.lendacky@amd.com, kernel-team@meta.com, 
	linux-mm@kvack.org, akpm@linux-foundation.org, jannh@google.com, 
	mhklinux@outlook.com, andrew.cooper3@citrix.com, 
	Manali Shukla <Manali.Shukla@amd.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 11 Feb 2025 at 04:50, Rik van Riel <riel@surriel.com> wrote:
>
> On Mon, 2025-02-10 at 16:27 +0100, Brendan Jackman wrote:
> > On Thu, 6 Feb 2025 at 05:46, Rik van Riel <riel@surriel.com> wrote:
> > >  /* Wait for INVLPGB originated by this CPU to complete. */
> > > -static inline void tlbsync(void)
> > > +static inline void __tlbsync(void)
> > >  {
> > > -       cant_migrate();
> >
> > Why does this have to go away?
>
> I'm not sure the current task in sched_init() has
> all the correct bits set to prevent the warning
> from firing, but on the flip side it won't have
> called INVLPGB yet at that point, so the call to
> enter_lazy_tlb() won't actually end up here.
>
> I'll put it back.

Sounds good.

FWIW I think if we do run into early-boot code hitting false
DEBUG_ATOMIC_SLEEP warnings, the best response might be to update the
DEBUG_ATOMIC_SLEEP code. Like maybe there's a more targeted solution
but something roughly equivalent to checking if (system_state ==
SYSTEM_STATE_SCHEDULING) before the warning.

> > > @@ -794,6 +825,8 @@ void switch_mm_irqs_off(struct mm_struct
> > > *unused, struct mm_struct *next,
> > >         if (IS_ENABLED(CONFIG_PROVE_LOCKING))
> > >                 WARN_ON_ONCE(!irqs_disabled());
> > >
> > > +       tlbsync();
> > > +
> > >         /*
> > >          * Verify that CR3 is what we think it is.  This will catch
> > >          * hypothetical buggy code that directly switches to
> > > swapper_pg_dir
> > > @@ -973,6 +1006,8 @@ void switch_mm_irqs_off(struct mm_struct
> > > *unused, struct mm_struct *next,
> > >   */
> > >  void enter_lazy_tlb(struct mm_struct *mm, struct task_struct *tsk)
> > >  {
> > > +       tlbsync();
> > > +
> >
> > I have a feeling I'll look stupid for asking this, but why do we need
> > this and the one in switch_mm_irqs_off()?
>
> This is an architectural thing: TLBSYNC waits for
> the INVLPGB flushes to finish that were issued
> from the same CPU.
>
> That means if we have pending flushes (from the
> pageout code), we need to wait for them at context
> switch time, before the task could potentially be
> migrated to another CPU.

Oh right thanks, that makes sense.

So I think here we're encoding the assumption that context_switch()
always calls either enter_lazy_tlb() or switch_mm_irqs_off(), which is
a little awkward, plus the job of these functions is already kinda
hazy and this makes it even hazier. What about doing it in
arch_start_context_switch() instead?

That would mean a bit of plumbing since we'd still wanna have the
tlbsync() in tlb.c, but that seems worth it to me. Plus, having it in
one place would give us a spot to add a comment. Now that you point it
out it does indeed seem obvious but it didn't seem so yesterday.

Now I think about it... if we always tlbsync() before a context
switch, is the cant_migrate() above actually required? I think with
that, even if we migrated in the middle of e.g.
broadcast_kernel_range_flush(), we'd be fine? (At least, from the
specific perspective of the invplgb code, presumably having preemption
on there would break things horribly in other ways).
