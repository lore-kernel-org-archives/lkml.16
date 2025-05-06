Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FC2D20AF67
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 19:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746558908; cv=none; b=IdVF+/Hym9FwhNBMeeRlBbBwCnrLQx2Fg/Y3oyBjy1qPCKYbYd9T1CM+ABzpGpl/kya489RwMiwaWc5Rq/+hH4oAY0rNnOGqvKe7JeUbASNEa+t7tbrKOS/r0ctLFP12NILHfK+xZDEo4owJurHa/2hwGuJuTe2c/iUZy5SzugE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746558908; c=relaxed/simple;
	bh=uMlYw7BJ7BqtSlJ2dFCAID9nt+MOBb+zWfhrI61EITc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=joj26IXgLTXr/TI4lHUf7MwHpgLcS1KTsLuO90O1UcQncq6lvJhDH6TYVDf0Em0ZrhzmUwkkb95DQkoU/6/4X+zOD14uKoI5JndOADhSmmW5ElXipLCQW2n8Se1MEBihj88OG+iHYTelhDSYyv013oVXGIbU83OUp8StfB96Ggs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ap6QfqH6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ap6QfqH6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9C4FC4CEF0
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 19:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746558907;
	bh=uMlYw7BJ7BqtSlJ2dFCAID9nt+MOBb+zWfhrI61EITc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Ap6QfqH6HrgZonSmM9Ra2bo6hQrl0QttCDT/R/DeYFrtJYtJFTGIhD7qMH+w2qNEE
	 R8oxJohdBVALTjV74VpEf1livlaQYCokHRArFlylP5e6lQs/wZeIOafrxWJ0ZMuKk9
	 TYdHj6caMWbcHN3J3MkQFtpd9nivOMxKN8TncmylEsD0Vo+zcg61H47NoxrUyie2os
	 /I13bsOac6MHRwdZUfYGqUw6aEfmxzXoCTyKXn0lSaJBin5XRRNH0AradNs0ksBFf4
	 Jsuf4poxvd/Quh/JCJnwu0LrNMeB/la+ZAvj4+oS+72CZ2X3PNybjl3C4Vval11OcY
	 UlclnOAz/RXBA==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-54b0d638e86so7489082e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 12:15:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW9FeUxpwoKIqVPlRkkf2Gx6+tHxhc8lzUl53hsM+U+RQg1/8AyqEC4NwJl6Zig7ZWsA20xMlGvAUrLWwo=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywaz7rBeFxfCRHMOx+mxkMc+/iT6TSH+S6MPueh9QmoinBoS5kj
	m+2cTGgaW7Y7A3QOBUfq+9RW9hOW8BL+pa0ZWXspjGQOCaDGRccgju4/Iqw5LE6jKXWBiY/34N1
	Z6hQTuIRUacfZmfizSNsq+hpgz90=
X-Google-Smtp-Source: AGHT+IFeApfvSuxNJMKoxqfvWmuLIm9XuqkZ6TU4z+fD+sAVwwoTqOlKqfEkfs/2tXDvreRE9XHlg4KEpLXQMI28I24=
X-Received: by 2002:a05:6512:3985:b0:54e:8fd5:3f53 with SMTP id
 2adb3069b0e04-54fb95f4d97mr227475e87.10.1746558906104; Tue, 06 May 2025
 12:15:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250506154532.1281909-5-ardb+git@google.com> <20250506154532.1281909-8-ardb+git@google.com>
 <CAHk-=whrcutH0LcMmaeJxxMeYpw2R5T80yoQAXbrRHNSTCB0Pw@mail.gmail.com>
 <CAMj1kXFSae=stazUv8doka-zLOnDdXXR4ASxHKe5f97ikg3V2A@mail.gmail.com>
 <CAHk-=whxP5Ywpv-U=2NPFhk929VHB9_kdp10+HFJQ4VxEGdX9A@mail.gmail.com>
 <CAMj1kXGwYXXpjPgDwjKMEZJkuGJ8ZuCpMpc7fTvo58PNtu-czA@mail.gmail.com>
 <CAHk-=wiz5oXq2f_87hHViN2TZQO9VHpaWb5fWWGJbUWQw1ChVw@mail.gmail.com>
 <CAMj1kXEtW2bAQK4hN-S5C=Po5dk1q14+GJjzEJsjfz9OeOMoCg@mail.gmail.com>
 <CAHk-=whRNPK7hTtPYh3SEe0WXEHR=aedc3bc-y_e08ujOxmgJg@mail.gmail.com> <CAHk-=wj9jR8HVOoEsAppFCGH0BcRCY6CrVNUFpeSswxD3Ho67Q@mail.gmail.com>
In-Reply-To: <CAHk-=wj9jR8HVOoEsAppFCGH0BcRCY6CrVNUFpeSswxD3Ho67Q@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 6 May 2025 21:14:55 +0200
X-Gmail-Original-Message-ID: <CAMj1kXFNJEne4uDxjfq5=OiWJGA1Pu9O99mrJRky5CW4R3V32w@mail.gmail.com>
X-Gm-Features: ATxdqUGRhhGOL7vU96swpWak7i2haUW7zKDR6UIEkEwjBZdYhQNw8gbofNvg4Hg
Message-ID: <CAMj1kXFNJEne4uDxjfq5=OiWJGA1Pu9O99mrJRky5CW4R3V32w@mail.gmail.com>
Subject: Re: [RFC PATCH 3/3] x86/boot: Use alternatives based selector for
 5-level paging constants
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org, x86@kernel.org, 
	Ingo Molnar <mingo@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 6 May 2025 at 20:39, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Tue, 6 May 2025 at 11:17, Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > The early boot alternatives code fixup should be really easy - no need
> > to worry about IPIs and things like that.
>
> Actually, we already run the alternatives fixup before smp, so I guess
> we already do that.
>
> But I think we could fairly easily add another section for early boot
> alternatives and just use the existing apply_alternatives() for this,
> and run it long before arch_cpu_finalize_init().
>
> No?
>

Not great.

First of all, that would mean calling into even more C code from the
1:1 mapping of memory, and this whole effort is about reducing and
confining that, so we don't get more random breakage in confidential
guests at boot time because some absolute address is being used before
it is mapped. (i.e., all the RIP_REL_REF() changes)

But patching alternatives is fundamentally an optimization, and so
things will look something like

void __startup_64()
{
    if (cr4.la57)
        set_capability(foo)

    apply_alternatives();

    // set up the page tables etc etc
}

and given that the code would work equally well without the
alternatives being applied, I'm not sure what we gain here, given that
we are still relying on the C code not touching the page tables before
this code executes.

This is why I included patch #2, so that at the very least, the
variable cannot be observed by C code before it assumes the correct
value.

So what I'd like to do instead is

- make cpu_feature_enabled() work early on
- replace all global variables that are derived from
pgtable_l5_enabled() with expressions based on it.

That still means we need to set the capability before populating the
page tables, but we might be able to do that in a not too nasty way
from the startup asm code.

Then, if the codegen for those LA57 related expressions sucks, perhaps
we could look into expanding the runtime const stuff to handle those
constants. That code looks like it is more suitable for execution from
the confined early startup code that runs from the 1:1 mapping, and
conceptually already does what we need.
