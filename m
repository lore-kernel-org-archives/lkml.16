Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B176227E8A
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 09:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747216176; cv=none; b=gZQDMIUKFVBcyTt8afF5beiy3/v69w3y2A7Y86qbuHRgmJVc9uP2I8oYK2vvp74bIgosIofPWVbo6YU+XygkaKrBdUlyI6FyS49+nk+TE2iLq9h6zDC3X1bBlgSHE9WKxfVYt9DRUyT3Yy3PhDUGfGIaW13/l+zT9zzg2Y7UCsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747216176; c=relaxed/simple;
	bh=ZUxbNPok00xgvrse1DjvLDyCIT7mk7E3kbSUMYBuso4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G8JK6ukl7YhCwNcQmeVKHvwST/YeLHkFd4UqPjA4yFJ+nsP6ZsLVFGST+uA7a6xaTpzdak/tDNkqb6juwvlGDOznigaI+MHAgHWJxlFtHzgigDaRzMQ3IRrXSiED8BPOw92Q6b+GN7lW2tdQaK4+d9ns6aod1XG1oPspN9NC2hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pKs64Hxf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pKs64Hxf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86DF0C4CEEB
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 09:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747216175;
	bh=ZUxbNPok00xgvrse1DjvLDyCIT7mk7E3kbSUMYBuso4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=pKs64Hxfr0pbJnuU2141K4FiyslXU1SlDxswblZN32yPY2NejkYjy1qmN7sVx2dCQ
	 jTBKFJoP+MFnuWnIg11Byu7zHWnXisFbQdxQkkhV3q6hQ/Pqq3YKzmlarNLkj8xrgw
	 P0qXXEaeHR/9U1b1XLMkn8UDUzAutVs904kx5Hc09nwb1/err2atVs12hhdEgRq7dg
	 8aTEqfLT6d+sLml6dZ/i1OF8cnSsdHq14jM2LswQSJML7BdSI2ucEdl/clceK8LJQu
	 eV9jOUi953aMLCMEjn7FAORNFKExw2miBoR7HAIDL/onNF7GEVl8cmtJK5YPw+M/6i
	 aUwmMtqfdjyJg==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-550d7afa0c7so604015e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 02:49:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUYboJqPJ0gQsBCNZMpwiWUTBVFZZTglriy1rCy0mz1WCffY7SYZt/aVIArWJHvPivOoqsnfUSdH8foT2o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5v/dtZ53j3hqtnSJ66LG2TkLx+2JdcuRAL8Rt4sGjeLR+ErEV
	vEW458gRHVB21Df/8J8QAc0ZyN6ZnclzokdtXDtFh+kEGkQvu3JOPoQ+eBqdCCe6vCLvRPVsokH
	z5SGE7yb6SgEHGlm3c7s57KEac00=
X-Google-Smtp-Source: AGHT+IEPzdcrMfT1Ez4KIAIvZfz2GLh7DiH0sGOmc7zP8edxV82ODHEYybJ00DImdZZ4KfCTfu10LIriE8XyAMu9OdU=
X-Received: by 2002:a05:6512:2910:b0:54f:c3b7:e618 with SMTP id
 2adb3069b0e04-550d5fa264cmr766809e87.13.1747216173875; Wed, 14 May 2025
 02:49:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250513111157.717727-8-ardb+git@google.com> <20250513111157.717727-11-ardb+git@google.com>
 <CAMzpN2jTPFTA9NhXfsrTZ0-prUH-1DbZ5ewt92BZSMqBCZyskw@mail.gmail.com> <aCRRk_4hLD36UQVd@gmail.com>
In-Reply-To: <aCRRk_4hLD36UQVd@gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 14 May 2025 10:49:22 +0100
X-Gmail-Original-Message-ID: <CAMj1kXHzka4hXXE8UU9MvPnuqa1Jd0XBiNP8FGkj6Oc9J5JaWQ@mail.gmail.com>
X-Gm-Features: AX0GCFvArFk_Oy7vp7W8qygCPXZZwSMStOu8NQhes0onEfh3dX8jspWAGFVUajs
Message-ID: <CAMj1kXHzka4hXXE8UU9MvPnuqa1Jd0XBiNP8FGkj6Oc9J5JaWQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 3/6] x86/cpu: Allow caps to be set arbitrarily early
To: Ingo Molnar <mingo@kernel.org>
Cc: Brian Gerst <brgerst@gmail.com>, Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org, 
	x86@kernel.org, Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 14 May 2025 at 09:17, Ingo Molnar <mingo@kernel.org> wrote:
>
>
> * Brian Gerst <brgerst@gmail.com> wrote:
>
> > On Tue, May 13, 2025 at 7:40=E2=80=AFAM Ard Biesheuvel <ardb+git@google=
.com> wrote:
> > >
> > > From: Ard Biesheuvel <ardb@kernel.org>
> > >
> > > cpu_feature_enabled() uses a ternary alternative, where the late vari=
ant
> > > is based on code patching and the early variant accesses the capabili=
ty
> > > field in boot_cpu_data directly.
> > >
> > > This allows cpu_feature_enabled() to be called quite early, but it st=
ill
> > > requires that the CPU feature detection code runs before being able t=
o
> > > rely on the return value of cpu_feature_enabled().
> > >
> > > This is a problem for the implementation of pgtable_l5_enabled(), whi=
ch
> > > is based on cpu_feature_enabled(X86_FEATURE_5LEVEL_PAGING), and may b=
e
> > > called extremely early. Currently, there is a hacky workaround where
> > > some source files that may execute before (but also after) CPU featur=
e
> > > detection have a different version of pgtable_l5_enabled(), based on =
the
> > > USE_EARLY_PGTABLE_L5 preprocessor macro.
> > >
> > > Instead, let's make it possible to set CPU feature arbitrarily early,=
 so
> > > that the X86_FEATURE_5LEVEL_PAGING capability can be set before even
> > > entering C code.
> > >
> > > This involves relying on static initialization of boot_cpu_data and t=
he
> > > cpu_caps_set/cpu_caps_cleared arrays, so they all need to reside in
> > > .data. This ensures that they won't be cleared along with the rest of
> > > BSS.
> > >
> > > Note that forcing a capability involves setting it in both
> > > boot_cpu_data.x86_capability[] and cpu_caps_set[].
> > >
> > > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> > > ---
> > >  arch/x86/kernel/cpu/common.c | 10 ++++------
> > >  1 file changed, 4 insertions(+), 6 deletions(-)
> > >
> > > diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/commo=
n.c
> > > index bbec5c4cd8ed..aaa6d9e51ef1 100644
> > > --- a/arch/x86/kernel/cpu/common.c
> > > +++ b/arch/x86/kernel/cpu/common.c
> > > @@ -704,8 +704,8 @@ static const char *table_lookup_model(struct cpui=
nfo_x86 *c)
> > >  }
> > >
> > >  /* Aligned to unsigned long to avoid split lock in atomic bitmap ops=
 */
> > > -__u32 cpu_caps_cleared[NCAPINTS + NBUGINTS] __aligned(sizeof(unsigne=
d long));
> > > -__u32 cpu_caps_set[NCAPINTS + NBUGINTS] __aligned(sizeof(unsigned lo=
ng));
> > > +__u32 __read_mostly cpu_caps_cleared[NCAPINTS + NBUGINTS] __aligned(=
sizeof(unsigned long));
> > > +__u32 __read_mostly cpu_caps_set[NCAPINTS + NBUGINTS] __aligned(size=
of(unsigned long));
> >
> > Is there any scenario where capabilities are changed after boot?
>
> Not supposed to...
>
> > If not, this could possibly be __ro_after_init.
>
> Yeah, and in a separate patch.
>

OK.
