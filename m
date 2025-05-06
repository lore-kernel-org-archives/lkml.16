Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C20311DE2D6
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 17:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746552334; cv=none; b=C15hDtCdJlYST/bZMhsRNxHr5btxFeaATNu9EMDtaZF6U1RLZYTEmh1ZkF9AovRv3tmqtGuxlsf/mUTmA2yFsO4R6TfsH9u0YrdXo6YghcHc9v4BXG5HLkERrXfprNhX0CIp8J+Yt1NorpUuDAzB196Pec2FXWIUN+BLsJbyIX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746552334; c=relaxed/simple;
	bh=5a56dQDEutJTmqgRPih/Ry3sGTN2OYIrRMLRWB4MAwM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JYmagKIFdSjuwMsWBn8FQYsXoimkeIpu7+/O76yq/TCcjmEdjHqDE1Frt964divirIDke1LkW+jDoF+SnD0kVInEobbrLT1xGooG5oYiqtbg7H5x0EWBgwBhoduGNMzMDfvblbhEk4s5bvdiaj2V+Dr4AHl9MjEYOd9z5C1uZSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=snRpqE+6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="snRpqE+6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D142C4CEEF
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 17:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746552334;
	bh=5a56dQDEutJTmqgRPih/Ry3sGTN2OYIrRMLRWB4MAwM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=snRpqE+6lFf84+OsX9hWAOmFoTwgfi5P1R8AEl0fFZO2NQjOIhSfaT1UTrxcZdsGR
	 gWNcBFHqPbtMlVKs0vs1Rm1BQxJRKHn5hV18ogAFbcb3ZHbGYv+H3dqXJn4CHJddIq
	 vWwzmdd2b2+bEkp4P/PiHzIQK6XzMX/is7QBDyylpAO7LEKlzuNtegOU+FsaP/DG3R
	 MH89AWn2+SYSnoNbdrvFo8nHTWDmnI6UXrKx9O4Y9ZuQKuwG5dJLCwX8yfImkuzwJJ
	 WRm6REIrzksbc87PR4ji5bZW9xKWGqduPGHGelZosrKha/4H6R24LfV/n7SOPKviOS
	 PauGCA7QMPFCg==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-30beedb99c9so51082451fa.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 10:25:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVAOvBHsWCqJ00dIZJqDTs7ZRa0UdJ+OU7MpNX2EqajbV0LgtkJciUCe6hkwKs3BmH10e4GKuu2+bXiQKg=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywxz3mg24FZ6gE8/jBniaVUxh0ukvjDrnvwngvGbBrTHHmwaIt7
	JeFirce3DXX8zSOiDwezslSCzdOwP5i1sZ4UpqnyCgYTwrKWDOpRphaGECU+rcpjDCKQRn/NmQT
	zZxdsxohKccpQLSe3dt8eylWSCkA=
X-Google-Smtp-Source: AGHT+IElVA0KIhRQe6kB6avljzeG1VSuma2ANk7BEmzkRrbcR49aWMamlloGWn2N67t6TSOMlaGJdWyJxjxly41Dmug=
X-Received: by 2002:a05:651c:312e:b0:30d:b309:21b6 with SMTP id
 38308e7fff4ca-3266b2a4df5mr15771271fa.6.1746552332558; Tue, 06 May 2025
 10:25:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250506154532.1281909-5-ardb+git@google.com> <20250506154532.1281909-8-ardb+git@google.com>
 <CAHk-=whrcutH0LcMmaeJxxMeYpw2R5T80yoQAXbrRHNSTCB0Pw@mail.gmail.com>
 <CAMj1kXFSae=stazUv8doka-zLOnDdXXR4ASxHKe5f97ikg3V2A@mail.gmail.com> <CAHk-=whxP5Ywpv-U=2NPFhk929VHB9_kdp10+HFJQ4VxEGdX9A@mail.gmail.com>
In-Reply-To: <CAHk-=whxP5Ywpv-U=2NPFhk929VHB9_kdp10+HFJQ4VxEGdX9A@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 6 May 2025 19:25:18 +0200
X-Gmail-Original-Message-ID: <CAMj1kXGwYXXpjPgDwjKMEZJkuGJ8ZuCpMpc7fTvo58PNtu-czA@mail.gmail.com>
X-Gm-Features: ATxdqUHtkoFw4wdd9RHGTEXkk0gDtz1gEdBk0krUapeAu4fUCh_si_5h07qFUUk
Message-ID: <CAMj1kXGwYXXpjPgDwjKMEZJkuGJ8ZuCpMpc7fTvo58PNtu-czA@mail.gmail.com>
Subject: Re: [RFC PATCH 3/3] x86/boot: Use alternatives based selector for
 5-level paging constants
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org, x86@kernel.org, 
	Ingo Molnar <mingo@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 6 May 2025 at 19:03, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Tue, 6 May 2025 at 09:35, Ard Biesheuvel <ardb@kernel.org> wrote:
> >
> > I think the first two patches are important, though, as they are about
> > robustness/consistency rather than optimization.
>
> That first patch already has another copy of that insane inline asm
> optimization.
>
> Let's fix this properly, not this disgusting way.
>
> Let's get rid of that USE_EARLY_PGTABLE_L5 crazy case entirely, and
> fix the few places where it is currently used.
>
> That code is bogus *anyway*, because your argument for these patches
> is "one single truth", but the fact is, there's at least *SIX*
> different values that get set depending on this value: pgdir_shift,
> ptrs_per_p4d, vmalloc_base, etc.

Yes, there are many. But that is not what I meant by source of truth.

Currently, we are conflating two things
- whether the CPU has the LA57 capability
- whether the CPU is using the LA57 capability to support 5-level paging.

The CPU feature gets set too late to be useful, and then needs to be
cleared again if we happen to run with 4 levels of paging.

> All of those change depending on
> whether we do 5-level page tables or not, so the whole argument that
> "pgtable_l5_enabled() is special" is just wrong to begin with.
>

In my original patch, which is the one Ingo objected to,
pgtable_l5_enabled() is unambiguously based on whether CR4.LA57 is
set.

> Any code that makes pgtable_l5_enabled() will fundamentally then just
> have *another* inconsistency, namely the inconsistency between that
> "is_enabled" and all the other values that L5 paging actually
> modifies.
>

Not sure I follow you here.

> So I don't think your patches even fix anything. They only paper over
> one very particular issue.
>
> For example, as far as I can tell, the only real reason for it in
> arch/x86/kernel/cpu/common.c is *one* single use where we do that
>
>         if (!pgtable_l5_enabled())
>                 setup_clear_cpu_cap(X86_FEATURE_LA57);
>
> in early_identify_cpu().
>

Yes, this is needed because we conflate the CPU capability with
whether or not we are running with 5 levels of paging.

> And then we have __early_make_pgtable(), but that's the SAME FILE that
> has all the magical special __pgtable_l5_enabled logic anyway. So that
> damn well could just write out the actual real logic, instead of using
> that "is L5 enabled" helper function THAT IT IS ITSELF INITIALIZING.
>
> So I reall ythink this whole issue goes much deeper, and is much more
> broken than your patches imply. And I think your patches in many ways
> make it *worse*, because they may make that pgtable_l5_enabled() be
> set up early, but that just hides all the *other* issues that aren't.,
>
> As a very real example of that, just look at what happens in
> arch/x86/mm/mem_encrypt_identity.c
>
> It does all that page table setup, but if __pgtable_l5_enabled hassn't
> been set up yet, then all those *othger* values that go with it also
> haven't been set up yet, so now it uses the *wrong* value for
> ptrs_per_p4d etc.
>

That code runs after __startup_64() so it should observe the correct
value. But it's flaky as hell, which is why I am trying to fix this.

I'd much rather get rid of those variables entirely, which is what I
proposed initially.

> And I just checked: that code very much does use ptrs_per_p4d,
> although it's hidden by
>
>                 memset(p4d, 0, sizeof(*p4d) * PTRS_PER_P4D);
>
> so I really think this is all papering over things. That code CANNOT
> WORK before __pgtable_l5_enabled hass been initialized in its
> *current* location.
>
> IOW, I think your patches only make things *less* consistent, not more.
>

In the light of the above, care to comment on the previous approach?

https://lore.kernel.org/all/20250504095230.2932860-28-ardb+git@google.com/

That also uses the ALTERNATIVE_TERNARY() so the CR4 access gets
patched away, and I'm happy to take suggestions how to improve that.
But it replaces those global variables with expressions that are
directly derived from CR4.LA57, which I think is likely the most
robust approach.

I'd still like to split off the LA57 CPU capability from the 5-level
paging state, but that needs careful consideration of the existing
users: for instance, KVM might need the capability in some cases, but
the current state in others. There is also some IOMMU driver code that
refers to the feature.
