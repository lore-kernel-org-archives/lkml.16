Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 539C11917D0
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 16:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746549303; cv=none; b=rYztkdIwwozvuW40BHNrByxnoLXjf9XwPhLxU7KBCUK9KDJ54jGIlRYMNYoeXlyTFJfhz70BMYCauEDT6AnMS7Bestpf+3u8UyJm7sm1nXrq1yqKDprGFWLArutdpYGX1hpHNvgVSydB5dlbYCRcvHtUuJT6qxdMVxnv3s7Wc0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746549303; c=relaxed/simple;
	bh=iRXAb+3vaNgCvO5M83gpdj2uAzSQkA6tvQ5oae1TCnw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bLGo3LyR+3kS0HomGJ3mzUvlqec8hLrlawprTedoyYuAUU57E+Ubz/CKS2dsZszJltDHQ0MIT+IkScLcS73JzerzRNCkCNvOKgYlJDvH84zs2nDq3BTyg4EE0EcT6gBolPLRj7IXLfZVlgZTRNrbxOJ/o14qN/HknIx7TwFmSYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FLV64Fqs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FLV64Fqs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB5ADC4CEEF
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 16:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746549302;
	bh=iRXAb+3vaNgCvO5M83gpdj2uAzSQkA6tvQ5oae1TCnw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=FLV64FqszJ/svL+TuV9xOMB+mFphA/MbKl4VLlFdmyIFFLPob1E8JCEPfBU4iEaM8
	 ISSv6cBuhjiAyfh90CrtTxjPV17VcQtznBkys2yE6uAegv71Gy7D34FgflSOlsGBlV
	 k4ROGKZBsaUaBlIIPcefRTDhxk98lptYJE0QNLCPebZstRLXc6PsBDFNBRSpXXkIYh
	 E5odos2Afl8Ex8ow7ENd3Qgtl+DXVqHwXUCexyGRdhTrK6abVC6ZsuD0f07w0FBEUJ
	 NNzMzamf9Bfigaj9T3tScWihhVZW7yHbySidlJjPwtF/yJmD27C3L6Y8vCDvKtxNK5
	 C7rKEShF9WKlg==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-54e816aeca6so7616390e87.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 09:35:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUGI3GA2vV1x39IDMyQ8JiGVIXVLZ1o2bU6rKQp/Wb5M65TofCc8EIEltSu1XMlVjiHYeV7DpYfWZ0JTW8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9J7a/+u2xtwpdzTUgK3BZV+kXfjh2sJwc0hSZHuowWT7QoWWF
	JUNbU9J4/h99zc0BDTHe3OLT1NNvxjCj9PinPjpJCZdEKi3xlxVRn6lkU//iMJ+VhT/x2B93HjS
	qClSE5dlDMGrRmybxjMj7W88jAk8=
X-Google-Smtp-Source: AGHT+IFaVfg3LulmD1KiJh8o5lo4aZySnzXASU2gkQCV8P1QEofc7uOKI4Nx3QedXNA3WvPeS8AEj8Dr4NpWyvo87rI=
X-Received: by 2002:a05:6512:1296:b0:54e:a28b:7b31 with SMTP id
 2adb3069b0e04-54fb928f003mr79871e87.4.1746549301084; Tue, 06 May 2025
 09:35:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250506154532.1281909-5-ardb+git@google.com> <20250506154532.1281909-8-ardb+git@google.com>
 <CAHk-=whrcutH0LcMmaeJxxMeYpw2R5T80yoQAXbrRHNSTCB0Pw@mail.gmail.com>
In-Reply-To: <CAHk-=whrcutH0LcMmaeJxxMeYpw2R5T80yoQAXbrRHNSTCB0Pw@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 6 May 2025 18:34:50 +0200
X-Gmail-Original-Message-ID: <CAMj1kXFSae=stazUv8doka-zLOnDdXXR4ASxHKe5f97ikg3V2A@mail.gmail.com>
X-Gm-Features: ATxdqUGWiW2bqzzlO13mIubVEQH_xzYnRXCCU8VblznyBQg6wqMvBgFcwtXM0Ik
Message-ID: <CAMj1kXFSae=stazUv8doka-zLOnDdXXR4ASxHKe5f97ikg3V2A@mail.gmail.com>
Subject: Re: [RFC PATCH 3/3] x86/boot: Use alternatives based selector for
 5-level paging constants
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org, x86@kernel.org, 
	Ingo Molnar <mingo@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 6 May 2025 at 18:23, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Tue, 6 May 2025 at 08:49, Ard Biesheuvel <ardb+git@google.com> wrote:
> >
> > +       asm_inline(ALTERNATIVE_TERNARY("jmp 6f; 8:", %c[feat], "movl %[yes], %[ret]", "")
> > +               "       .pushsection .altinstr_aux,\"ax\"       \n"
> > +               "6:     pushfq                                  \n"
> > +               "       testb   $1, %a[l5en]                    \n"
> > +               "       jz      7f                              \n"
> > +               "       movl    %[yes], %[ret]                  \n"
> > +               "7:     popfq                                   \n"
> > +               "       jmp     8b                              \n"
> > +               "       .popsection                             \n"
> > +               : [ret]  "+rm" (ret)
> > +               : [feat] "i" (X86_FEATURE_LA57),
> > +                 [yes]  "i" (yes),
> > +                 [l5en] "i" (&__pgtable_l5_enabled));
>
> I really detest these things. I don't think it's worth the complexity.
> Is there really such a hot path somewhere that we should do something
> like this?
>

Not sure - Ingo's data only tells us how often these occur in the
code, not how often they are called.

The only constant that I know is likely to be hot is
KASAN_SHADOW_START, but that only matters when KASAN is enabled so I'm
not sure that matters.

For the remaining uses, I would assume that manipulations of PGD/P4D
level entries [where the 4-level/5-level distinction matters] are
extremely rare compared to lower level ones, so I wouldn't expect any
bottlenecks there.

> If we can't use some existing infrastructure for this, we should just
> keep it simple. Not write ten lines of specialized inline asm.
>

Fair enough - I'm not particularly attached to this, and I'm generally
averse to premature optimization. I was just addressing the concerns
raised by Ingo.

I think the first two patches are important, though, as they are about
robustness/consistency rather than optimization.
