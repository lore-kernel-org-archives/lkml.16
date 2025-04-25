Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE28C1A2393
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 16:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745598949; cv=none; b=pFI12G0fJt5bJ55H9OkCFBIaxvslZTBeXWA6IwIh00NZVbtntHQCaucCg41J8NCuMk3Rcc0jvxe6B8bEh1TQpXUFKoewibh5nuTPqDgFfPBAUm6jA9oa/RVsA5vbIF1X1Sv0X+rVCwyf/r1MR6uni0SHbdIsnoRsPwctR+mVv+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745598949; c=relaxed/simple;
	bh=mdIQCxdUYhtXLzXUmLDFNwoEcEWuoi78Lo+56Eh8rac=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N69VOQueA/Gy4pRZZqf2YMdiMqHGwCEn3MRQGWE+5xDwDf+s6/kzRYa+WedS9ejkJ1oOCbk6H4yE83ri+3rVqCOy8OpAksPSBYQRaRDYIzp3RX8+WYstAKjdzlViThGOf6iEOIXPhytSIXKQfsjMgyBBZ9dU1u/lXuAKjLmMjuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=AUT8y7Q2; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="AUT8y7Q2"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ac2bb7ca40bso430174666b.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 09:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1745598945; x=1746203745; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EIUARXjixZE2LMjIM7t5GFiqmmk274q2ndIpCfZ4HnU=;
        b=AUT8y7Q2pVqVvCMV42YSG5GNC1Xxj7a/ixWBwJTDz61OsXbgaV8BFJf8L2b+lPrUcv
         UiLtSm6Kd9x5Zo3voC7BNfPH6Ip5suH7AyhY/qWGkntDaUB7G8eSd65OzvDNqf+YRF7r
         17919hC3EDALbyKgFmv6kZjcwkhFgIXT0TzmE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745598945; x=1746203745;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EIUARXjixZE2LMjIM7t5GFiqmmk274q2ndIpCfZ4HnU=;
        b=glQWAUzJgAFT9qSAGBRdcqrrLhzkBVtse4sk4WDhHErMsvk8PLhT45rMf30Ap0FGn3
         VhjaZAQscfPa33+03eke0Rhd75wTHp3dWcmpfMa8cRryKATubkdST93dszLZqv7lDb9a
         gc/4ZI6XrbF+RX8N6a1ckvYm1Q1lpraKcm2N21ufT6AH1I8d5nIj+f8CumtppmJd5Zyi
         qHbyNcSvt2z6U3FLq1zo383xPAFI/Ku0z7MgK0ZEvsyQl3PRk6JTZUVYb1Oq0hGok5Vm
         f0T2hIL50Ycvohk7+7Zj+6bz9FF16I4c7raU8DjMcKwfDIQBwK9qgC5oyifoRVxT235y
         Yyhg==
X-Forwarded-Encrypted: i=1; AJvYcCWBPYF+1xQ8yMj186vQaVQTGvc8qNwOcA6uAFTyr1H4F/xVAAaSW8ERxXzvRFeEElLwAg/m0oUtzJAI1sg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxdrUl+Lm1w2FkAJJtkoNo28hG+gROo2Ulz53I+f2lfbTLRE/Zb
	fzw3qgeiAQGla9tn9LcgLqV8JdUg7umkfcpY1EWcf4EcMnhp0ZaETsEkCVbOpe4buELT4P/ddlR
	4Mh0=
X-Gm-Gg: ASbGnct3kalNPrE9R8iPuZL7xvEcLy9TgfOPQW++ssHfYH4MmUu3cBez86/vKiG3v5X
	GE4CkCk3kdy6wwbvVxOgSGLsjSvJ22hkc8iNt4zEBSRYYjz86FHK5KW77QooMAL6jfgQLrYl2hn
	LmCw12OAiP1UTHBUdQfjbhAqJvpHx6z5W8ikv2/Rp8+CxFSaNAVey3mM+Aj7nqXDBf67c3NL2rE
	yvNag7Wh3mav2N81HBzHWZLyfrxY7Qu0XOY7Q3z1rpMuUSeRlYpuKrKMvkV3Ejb+g9Glf5LW98/
	e++BN68FeRxp8jn9aq2rpAruwB6KS757AePsLhrCVFUGHtHrFjpyZH6zXlkH0thViib8PkEesUn
	SThheQeHBv+viGIA=
X-Google-Smtp-Source: AGHT+IEka1D6FEhBpC8L791UwfgmQyq8I+vV96voBhupIM1wn6N0OB/rzF9unMlOXsA2j2qPgBsa0g==
X-Received: by 2002:a17:907:720d:b0:ac6:e33e:9ef8 with SMTP id a640c23a62f3a-ace739dcdb1mr309645766b.2.1745598944885;
        Fri, 25 Apr 2025 09:35:44 -0700 (PDT)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com. [209.85.218.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e41bc36sm160618966b.33.2025.04.25.09.35.44
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 09:35:44 -0700 (PDT)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ac2bb7ca40bso430170466b.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 09:35:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWPZskGMKX+7AZQVYvOJLRARKFkNbTwE7pRrK1OwUIE9KXtJnQIqKv4XA2VPx4HJ4yL2hkgTNJoXwCG5w0=@vger.kernel.org
X-Received: by 2002:a17:907:26ce:b0:aca:c38d:fef0 with SMTP id
 a640c23a62f3a-ace736f5aa5mr267986666b.0.1745598943873; Fri, 25 Apr 2025
 09:35:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <l7pfaexlj6hs56znw754bwl2spconvhnmbnqxkju5vqxienp4w@h2eocgvgdlip>
 <CAHk-=wjajMJyoTv2KZdpVRoPn0LFZ94Loci37WLVXmMxDbLOjg@mail.gmail.com> <ivvkek4ykbdgktx5dimhfr5eniew4esmaz2wjowcggvc7ods4a@mlvoxz5bevqp>
In-Reply-To: <ivvkek4ykbdgktx5dimhfr5eniew4esmaz2wjowcggvc7ods4a@mlvoxz5bevqp>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 25 Apr 2025 09:35:27 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg546GhBGFLWiuUCB7M1b3TuKqMEARCXhCkxXjZ56FMrg@mail.gmail.com>
X-Gm-Features: ATxdqUHMp1icRsSCmBF8bQUPP7IOF6HLUDbKcNsbk2Yj391oWT65wJGBfC1ihnQ
Message-ID: <CAHk-=wg546GhBGFLWiuUCB7M1b3TuKqMEARCXhCkxXjZ56FMrg@mail.gmail.com>
Subject: Re: [GIT PULL] bcachefs fixes for 6.15-rc4
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: linux-bcachefs@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 24 Apr 2025 at 21:52, Kent Overstreet <kent.overstreet@linux.dev> wrote:
>
> And the attitude of "I hate this, so I'm going to partition this off as
> much as I can and spend as little time as I can on this" has all made
> this even worse - the dcache stuff is all half baked.

No. The dcache side is *correct*.

The thing is, you absolutely cannot make the case-insensitive lookup
be the fast case.

So it's partitioned off not because people don't want to deal with it
(which also admittedly _is_ true), but because partitioning off is a
firewall against the code generation garbage case that simply *cannot*
be done well and allows the proper cases to be properly optimized.

Now, if filesystem people were to see the light, and have a proper and
well-designed case insensitivity, that might change. But I've never
seen even a *whiff* of that. I have only seen bad code that
understands neither how UTF-8 works, nor how unicode works (or rather:
how unicode does *not* work - code that uses the unicode comparison
functions without a deeper understanding of what the implications
are).

Your comments blaming unicode is only another sign of that.

Because no, the problem with bad case folding isn't in unicode.

It's in filesystem people who didn't understand - and still don't,
after decades - that you MUST NOT just blindly follow some external
case folding table that you don't understand and that can change over
time.

The "change overr time" part is particularly vexing to me, because it
breaks one of the fundamental rules that unicode was *supposed* to
fix: no locale garbage.

And the moment you think you need "unicode versioning", you have
basically now created a locale with a different name, and you MISSED
THE WHOLE %^$*ING POINT OF IT ALL.

And yes, *those* problems come from people thinking it's "somebody
else's problem that they solved for me" without actually understanding
that no, that wasn't the case at all. Many of the unicode rules were
about *glyphs*, and simply cannot be used for filesystems or equality
comparisons.

Which isn't to say that Unicode doesn't have problems, but the real
problem is then using it without understanding the problems.

So the real issue with unicode is that it's very complicated, and it
tried to solve many different problems, and that then resulted in
people not understanding that not all of it was appropriate for
*their* use.

Part of it is the "CS disease": thinking that a generic solution is
always "better". Not so. Being overrly generic is often much much
worse than having a targeted solution to a intentionally limited
problem.

   "Everything Should Be Made as Simple as Possible, But Not Simpler".

and involving unicode in case folding is antithetical to that
fundamental concept.

What I personally strongly feel should have been done is to just limit
case folding knowingly to a very strict subset, and people should have
said "we're being backwards compatible with FAT" or something like
that. Instead of extending the problem space to the point where it
becomes a huge problem, re-introduces "locales" in a different guise,
and creates security issues because people don't understand just *how*
big they made the problem space.

Oh well. Rant over.

                Linus
