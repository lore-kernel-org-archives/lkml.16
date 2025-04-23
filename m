Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 685C81E1E1E
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 07:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745392088; cv=none; b=RPMtweTejWrtV5ynSta506hqWpxdpWTcImShk9NUkgh4EDTBAT4J4XBeX/GuhZDsFonLqE7Cqf2aRW22lyyaMx9kyQUvYeX6P9KXP1m0Au6XgySJMOg0oOU84SoyCfayMNsvu/Fw3z/MoZSjet6c+lW1TUON5HRmUENSLp9M9NA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745392088; c=relaxed/simple;
	bh=WAg9j14egnq/UsvlKZWeYxfZf8S5VtNSLNLTfzky/QA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=raXc2xZ5TTkn7ddpHTKeBdp5Nw8s1Jok/aWe3u/9Cg5wo/vqxtHfBUOuarTb4os+STAk0t8SEv8lua+GYGY0A3Fv4DJrpUnSpfeuIBkT4HnS46WxweErnQCCiUjCNnfRWpG+py4L4ggrMUNOkb4/e7aYe+oh4Xl2NRGYM9ZSiyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ga1LUKQH; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ga1LUKQH"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-30c416cdcc0so56405521fa.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 00:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745392084; x=1745996884; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tDVZZVmLWPVUyZUrEP5wnstWpu6T03XwnNTWfvpgsmc=;
        b=Ga1LUKQH0XHBhHbe8Bic1/PHYMx1FFBB1VkLdmu6jdHAG3qFkATVG5bbGuU5aP2uoZ
         5ub4tQqif+wUWtTCpWbgOMfanRGY/nTpOtJJFtr0Ab3MTqR7AGR8o86gh0/qHIreVWAy
         XFRETXWAFb75yP/m8XCNirq8XboZZ8PmMfQmSSyQPKEdqeGtPUur6zCirPX1On2KQtnQ
         o8mSIDHCNLdKqv4c0z0MrkiEKfwdMVt48JqOHv2qUPSDKmMrMbdObONwT0g+UG9HqcwN
         1nRRBFiypaqK5/VC3WOOBOAGqDhKxfixKQu1m2Q3H+0nyZ8SAYTvFJt9cEIsVZaRykfF
         vBvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745392084; x=1745996884;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tDVZZVmLWPVUyZUrEP5wnstWpu6T03XwnNTWfvpgsmc=;
        b=lcLKK6MdzegYa35lOLbEEanYh8o4O4BRyKwKsqfcx82/EV7bMDen377m8hr95S5mNu
         Lgas5r/SWFqdljZttoHtPkQl/92bTbF+a1RN7qEjXNNvX2XwA4MTDU/nDD5yUnLqvuUI
         X46F519ePmmdzrhEXdPD3t/Dn5Rcsjll4xGP1aMrMMPjbHx8SyWG0OYBAkzrVPpBw1Dx
         G3jYnQIrKDRYSXXL7JxVqHj94rK0G10Gp1wBRdyfYMLtYUAb/Ttw5RtCv4C6Luum2/Zc
         9XlFx75479hIyVjk2YV4HIclC25VBhd8wirv3VhoSeoga+l95qbr4Om+X14Xmw0YQ9zj
         P7vg==
X-Forwarded-Encrypted: i=1; AJvYcCWGK0xBy1Be4AkwefSDV/+rYhhnodxW1WyfKV21VBtVGMlMyjuHCgZstP2/K69ryprPWwei3N38CC1ZmWE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFOerz8sSil3jvbdfP13EsunWlLJ63f5y4CYY0VA0p4WLR0M2T
	J80frcdZBceOt6H4/a8K2XS2JR/01osr8WMWtqbQzRxx2PHHR2amzjoIuuUT/U+hjMQwOOTDdhW
	Jdwzdq6Bi0FKEFJDG41k3Z5Zyv3aeuzJhBA0=
X-Gm-Gg: ASbGncus4wB6AF7NSsARaHwdqD208WJuhpUIwmZfOXdsXXL2SWdngRw94sGrq0v9KaX
	4xKQT8v37myxKB9XBVpWN479e0JVOV3BJ9PubPpDWJSncdamyZxBycxp4WeihHoEfPeMje6Yb6A
	LNuuCqWdao+LEQ4QfFLDV0T+rmO+UcSGYX
X-Google-Smtp-Source: AGHT+IH1P0mnXtz8esd9+KqnGwXccxh0aHTWyQCPU0QhX+GwULmkrPxirVAnyshtY25FyLkeNkMyJKJu698H7M/MDTc=
X-Received: by 2002:a2e:ad86:0:b0:30b:d44d:e76a with SMTP id
 38308e7fff4ca-31090553ed6mr68721551fa.25.1745392084031; Wed, 23 Apr 2025
 00:08:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <165d2a0b882050f3f6cc0315af66cd2d16e5925b.1744676674.git.jpoimboe@kernel.org>
 <aAeFYB7E2QiRNeoM@gmail.com> <CAFULd4bo0NGzZGLEs+pYoOJrDVLyKt2=Piug-LtU-WhFGwYTzQ@mail.gmail.com>
 <aAf2crZau98tHFSn@gmail.com>
In-Reply-To: <aAf2crZau98tHFSn@gmail.com>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Wed, 23 Apr 2025 09:07:52 +0200
X-Gm-Features: ATxdqUFR0l-Mc3_bvQj2u3F0H_j-iJW7DCOmA_78cTUrjEsf0ActbMekxNP6F_8
Message-ID: <CAFULd4ZiaboD7zT5tfz4Bdjah68E3iuBRVzrBOW3qQMoaBT5+g@mail.gmail.com>
Subject: Re: [PATCH v2] noinstr: Use asm_inline() in instrumentation_{begin,end}()
To: Ingo Molnar <mingo@kernel.org>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, x86@kernel.org, linux-kernel@vger.kernel.org, 
	Peter Zijlstra <peterz@infradead.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	"H. Peter Anvin" <hpa@zytor.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 22, 2025 at 10:05=E2=80=AFPM Ingo Molnar <mingo@kernel.org> wro=
te:
>
>
> * Uros Bizjak <ubizjak@gmail.com> wrote:
>
> > > That still doesn't make it clear where the apparently ~10
> > > instructions per inlining come from, right?
> >
> > The growth is actually from different inlining decisions, that cover
> > not only inlining of small functions, but other code blocks (hot vs.
> > cold, tail duplication, etc) too. The compiler uses certain
> > thresholds to estimate inlining gain (thresholds are different for
> > -Os and -O2). Artificially bloated functions that don't use
> > asm_inline() fall under this threshold (IOW, the inlining would
> > increase size too much), so they are not inlined; code blocks that
> > enclose unfixed asm clauses are treated differently than when they
> > use asm_inline() instead of asm(). When asm_inline() is introduced,
> > the size of the function (and consequently inlining gain) is
> > estimated more accurately, the estimated size is lower, so there is
> > more inlining happening.
> >
> > I'd again remark that the code size is not the right metric when
> > compiling with -O2.
>
> Understood, but still we somehow have to be able to measure whether the
> marking of these primitives with asm_inline() is beneficial in
> isolation - even if on a real build the noise of GCC's overall inlining
> decisions obscure the results - and may even reverse them.
>
> Is there a way to coax GCC into a mode of build where such changes can
> be measured in a better fashion?

There are several debug options that report details of inliner
decisions. You can add -fdump-ipa-inline or -fdump-ipa-inline-details
[1] to generate a debug file for interprocedural inlining.

[1] https://gcc.gnu.org/onlinedocs/gcc/Developer-Options.html

> For example would setting -finline-limit=3D1000 or -finline-limit=3D10 (o=
r
> some other well-chosen inlining threshold value, or tweaking any of the
> inliner parameters via --param values?), just for the sake of
> measurement, give us more representative .text size change values?

I don't think so, because inliner uses pseudo instructions [2] where:

    _Note:_ pseudo instruction represents, in this particular context,
    an abstract measurement of function's size.  In no way does it
    represent a count of assembly instructions and as such its exact
    meaning might change from one release to an another.

[2] https://gcc.gnu.org/onlinedocs/gcc/Optimize-Options.html#index-finline-=
limit

OTOH, there are plenty of --param choices to play with the inliner
besides -finline-limit=3D option. Please see [3]

[3] https://gcc.gnu.org/onlinedocs/gcc/Optimize-Options.html#index-param

In the dump mentioned above, you will  get e.g.:

IPA function summary for pfmemalloc_match/5736 inlinable
  global time:     8.200000
  self size:       11
  global size:     11
  min size:       7
  self stack:      0
  global stack:    0
    size:4.000000, time:4.000000
    size:3.000000, time:2.000000,  executed if:(not inlined)
    size:0.500000, time:0.500000,  executed if:(op0 not sra candidate)
&& (not inlined)
    size:0.500000, time:0.500000,  executed if:(op0 not sra candidate)
...

The estimator estimates size and execution time and decides how to
(and if) inline the function.

> Because, ideally, if we do these decisions correctly at the asm()
> level, compilers will, eventually, after a few decades, catch up
> and do the right thing as well. ;-)

We (as in gcc developers) are eagerly waiting for better tuning
parameters that would satisfy everyone's needs. Rest assured that many
have tried to fine-tune the heuristics, with various levels of success
;)

Jokes aside, it is important to feed the estimator correct data, as
precise as possible. There are limitations with asm(), because the
compiler doesn't know what is inside the asm template. It estimates
one instruction for every instruction delimiter, where the size of
"one instruction" is estimated to 16 bytes. In case of __ASM_ANNOTATE,
the estimator estimates 5 instructions and 80 bytes total vs. one
instruction when asm_inline() is used. Based on this fact, I think
that changing asm() to asm_inline() for insns with __ASM_ANNOTATE is
beneficial.

Thanks,
Uros.
