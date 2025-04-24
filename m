Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DE87288C93
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 16:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745512766; cv=none; b=J8D2Izn290vw761a+SzPgxy0+A9BVhtCeouc/En+9w7EmasgocGXI8yweN3w6SH8VUXhELaM5WqY8XY/5KZFPthhFbPFOoyFBTnEujbAvD6oUnnpRHE9XBkK6UMEKTTfCZVCibWHhYe1FDlsrLk5O6ls4TKKsRknZQOSU/avSWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745512766; c=relaxed/simple;
	bh=aSPeKLdpWqfF1kKLUZBV4vvyYbxDPCi/o6vS5c45bcY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TQEk2lP8Ror+hpIqviBUYCA0iI1ADXX2j4136vhhyb9D5g6UPOf78TNtfCbV+Wj3AmeVCRFAsDKB06OQtB7iCWbO8s1Yp1iE12oyfw5v6IZOQ6+05kANPAiV78K4E47sRAT2gPDz64Qum5IQHCSsN3TARuNipjHaqAy8pb3eTbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nv0UPKhn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nv0UPKhn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8807C4CEE3
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 16:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745512765;
	bh=aSPeKLdpWqfF1kKLUZBV4vvyYbxDPCi/o6vS5c45bcY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Nv0UPKhnGHFEEeVu4o6fjtQfp2Ypq5aKPalsLLdTciKEVivNo7nBtQYW9xR7SZqJv
	 y69uve3fdbPrGywOP0ycL+pz9KOMjNLZBV/7d5jMScpWpwf3W/z7PCmYSZzCHonbEE
	 uSGNuI65RQ/Kj+cGkZ7nGP14GXn8o6rcsvafPMsjCvHOgXMItIdygiTmfdswJLRqZq
	 +hp54ylGg+OyaOTdG6GvXWOTWqbXzPA1dgzUW79QoEBQGg4std3+6i0+KjkI578mwS
	 aZ3Iun9hL53smkAJ7wGWvL8Cim7RPmxLB5FkDh7JK0XAXTRlSkEqATglp/jsG/9llm
	 kgylqbU3PupHw==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-549b116321aso1528894e87.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:39:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVr+5+CiVECLFqID9l1YvMEM/YndnDFpBWJI5eDxR+FblDwc1rAAtuCnDrEtwh9aSQZJBL19PkyAqf/5+0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMdVPw78ZXkQio5yYyUSS+SyOR7rarAlr8V14pw2kZ/75hSQNQ
	5gyzIgZaEPPEB3mbRzomdPQleHiU+lRovSdsLnURzLxgWX/0YSnHpaFeHf3UqwP88MVKMwr+u4M
	xaDdKVpNXVnmkip3pKefjdX4T3NA=
X-Google-Smtp-Source: AGHT+IFIc9lYheUFVWYolX7FAxS6dEQNzEm40f1yzUwKSy9Vh4u9OhH6huouej2Ff2b0L0hl/4aHx+P/5bzVb7xxz2w=
X-Received: by 2002:a05:6512:12ce:b0:549:8ed4:fb5c with SMTP id
 2adb3069b0e04-54e7c3fcd69mr1193305e87.31.1745512764131; Thu, 24 Apr 2025
 09:39:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250424101917.1552527-2-ardb+git@google.com> <aApm-lvBjREPOW47@gmail.com>
In-Reply-To: <aApm-lvBjREPOW47@gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 24 Apr 2025 18:39:13 +0200
X-Gmail-Original-Message-ID: <CAMj1kXH7Vi8ruqohvRrPM+Dk2vPtyaMUkNRzi0Ak77aq6Q_peg@mail.gmail.com>
X-Gm-Features: ATxdqUFH3wsxvjBAoP-it9usqh5iuqPO6ZrIu_OlypSEG5GJMDGd3jx1QDJFavQ
Message-ID: <CAMj1kXH7Vi8ruqohvRrPM+Dk2vPtyaMUkNRzi0Ak77aq6Q_peg@mail.gmail.com>
Subject: Re: [PATCH] x86/boot: Work around broken busybox truncate tool
To: Ingo Molnar <mingo@kernel.org>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org, x86@kernel.org, 
	phasta@kernel.org, Linus Torvalds <torvalds@linux-foundation.org>, 
	Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 24 Apr 2025 at 18:29, Ingo Molnar <mingo@kernel.org> wrote:
>
>
> * Ard Biesheuvel <ardb+git@google.com> wrote:
>
> > From: Ard Biesheuvel <ardb@kernel.org>
> >
> > The GNU coreutils version of truncate, which is the original, accepts a
> > % prefix for the -s size argument which means the file in question
> > should be padded to a multiple of the given size. This is currently used
> > to pad the setup block of bzImage to a multiple of 4k before appending
> > the decompressor.
> >
> > busybux reimplements truncate but does not support this idiom, and
> > therefore fails the build since commit
> >
> >   9c54baab4401 ("x86/boot: Drop CRC-32 checksum and the build tool that generates it")
> >
> > Work around this by avoiding truncate altogether, and relying on dd to
> > perform the padding.
> >
> > Reported-by: <phasta@kernel.org>
> > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> > ---
> > I personally think using a busybox environment for building the kernel
> > is a terrible idea, and does not satisfy the build tool requirements
> > listed in the documentation. But apparently, it used to work and now it
> > doesn't, and the workaround is rather straight-forward.
> >
> > IOW, I don't care whether this gets applied or not, so I will leave it
> > to others to make the argument.
>
> >  quiet_cmd_image = BUILD   $@
> > -      cmd_image = cp $< $@; truncate -s %4K $@; cat $(obj)/vmlinux.bin >>$@
> > +      cmd_image = (dd if=$< bs=4k conv=sync status=none; cat $(filter-out $<,$(real-prereqs))) >$@
>
> So the workaround isn't too terrible, and since someone did trigger the
> bug, debugged it and reported it to us, it costs us very little to
> apply the workaround and (re-)enable someone's Linux build environment.
>

Indeed.

> Also there's almost no existing usage of 'truncate' within the kernel
> build system. Found one only:
>
>    drivers/firmware/efi/libstub/Makefile.zboot:                  truncate -s $$(hexdump -s16 -n4 -e '"%u"' $<) $@
>

Yeah, and it was me who added that one too :-)
