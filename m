Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 346D926560A
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 13:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747833741; cv=none; b=R1fYdKOfta/nAmUJSc0amnR3iuS9LHjW8d6ZnjstNcwScxxWXvhe0pErDLQwfpvLuBwOWYNt7OAth78VcIVS9nmI+LwcRjZH9MT8mcLSYSo6gPxZwQH+ex+KU7sP8UhsX2JWBUWqtTUI1vRQ/k8MFPcDaaMKbmZ2JkP9PSatRrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747833741; c=relaxed/simple;
	bh=pL7KrFPJBcnRvkIWPhrK9DH3N/TMrMEbdkvtYpq9ZfI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VMaqw8uM4Ran72mw/G1/GTmOfY6SlkWuW9CMSZc0I3+Md/hAfu9qCA9Z+lDHKD4dMDXag4QB+5dYwQVFKnmErbaL+TS8UqReA7nciICLAuohExJy6UfTFtA51+iqPHKrfP0P2hU7njkmPAdBhR2uhzcl9ms6UnUZRGWu4KjVu2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gJP9l5W8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gJP9l5W8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE59EC4CEE7
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 13:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747833740;
	bh=pL7KrFPJBcnRvkIWPhrK9DH3N/TMrMEbdkvtYpq9ZfI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=gJP9l5W8a8gc23lm7vCutuykMSn20MHY5j88UE9ZnTUnD4AXxU4eB55hZ17XZybYo
	 CcUpCiCd1n5u4/BlsDh55EWpHfl49VtnE24tTBVsfRUqNooH9vUXn7CxCGUCIc2lKn
	 JYw6DleKAB9AmH6fqi/1ruTJ74Ikn9Ck97F0jnA2yEpnikpLx+Hvwmh0r7PEgIRtZU
	 9auuk5GPkAxRhMb0DifaAi+lhHx6abCAL7jn+W/IWC4ls8uCJygy+vjtEJH9UtqgS4
	 2apdtdjCdUyhXv1dO+Ku74E/dDybc3vtm9amOg21q4FleayjldHTLC/95PigrD4rZe
	 m6cXntncONlNg==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-551fe540b74so1969653e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 06:22:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXBD+FwgK2vaccjN0GIDyCK0DpnBRV7Sn3jtbOmKsgWS/vqsTW00k4vdooA+0DgAmNZzS5IZqOtZ4F6o60=@vger.kernel.org
X-Gm-Message-State: AOJu0YxR1O9RbmSv17+sJWTXhZNXUYBiNxozFlzrkM1tjO2Zr380LRw4
	+QyYnbzukPZoJ0arGehC3iqPrXZBb2YFMWmm/zn71j5KvVYISrxhA1J6csl9Iy5hzyVE79fxe6J
	19Z8ctfmDJ7P1T7g94eanCpRqekPCHIo=
X-Google-Smtp-Source: AGHT+IGmKN13CvFDMKUqelNdcpGyhbQoEjCw6El3mvH6M4PpyqeXWZEY1G5GDvea4rEvDGLFsNfWPjDf9x9lSchC/xY=
X-Received: by 2002:a05:6512:3d91:b0:54a:cc75:3d81 with SMTP id
 2adb3069b0e04-550e971af25mr6861035e87.4.1747833739070; Wed, 21 May 2025
 06:22:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250513111157.717727-8-ardb+git@google.com> <20250513111157.717727-11-ardb+git@google.com>
 <CAMzpN2jTPFTA9NhXfsrTZ0-prUH-1DbZ5ewt92BZSMqBCZyskw@mail.gmail.com>
In-Reply-To: <CAMzpN2jTPFTA9NhXfsrTZ0-prUH-1DbZ5ewt92BZSMqBCZyskw@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 21 May 2025 15:22:06 +0200
X-Gmail-Original-Message-ID: <CAMj1kXEC38Gw=uY7suCw5=dZs6kTwX6w6vWyV9DKDpQpm0OtZA@mail.gmail.com>
X-Gm-Features: AX0GCFtdKNWL8WltQFtjk3CeA9Q_6OiU0QWAQ7ZIwKWj-O9ll15-kq1uNI2EIhE
Message-ID: <CAMj1kXEC38Gw=uY7suCw5=dZs6kTwX6w6vWyV9DKDpQpm0OtZA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 3/6] x86/cpu: Allow caps to be set arbitrarily early
To: Brian Gerst <brgerst@gmail.com>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org, x86@kernel.org, 
	Ingo Molnar <mingo@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 13 May 2025 at 20:37, Brian Gerst <brgerst@gmail.com> wrote:
>
> On Tue, May 13, 2025 at 7:40=E2=80=AFAM Ard Biesheuvel <ardb+git@google.c=
om> wrote:
> >
> > From: Ard Biesheuvel <ardb@kernel.org>
> >
> > cpu_feature_enabled() uses a ternary alternative, where the late varian=
t
> > is based on code patching and the early variant accesses the capability
> > field in boot_cpu_data directly.
> >
> > This allows cpu_feature_enabled() to be called quite early, but it stil=
l
> > requires that the CPU feature detection code runs before being able to
> > rely on the return value of cpu_feature_enabled().
> >
> > This is a problem for the implementation of pgtable_l5_enabled(), which
> > is based on cpu_feature_enabled(X86_FEATURE_5LEVEL_PAGING), and may be
> > called extremely early. Currently, there is a hacky workaround where
> > some source files that may execute before (but also after) CPU feature
> > detection have a different version of pgtable_l5_enabled(), based on th=
e
> > USE_EARLY_PGTABLE_L5 preprocessor macro.
> >
> > Instead, let's make it possible to set CPU feature arbitrarily early, s=
o
> > that the X86_FEATURE_5LEVEL_PAGING capability can be set before even
> > entering C code.
> >
> > This involves relying on static initialization of boot_cpu_data and the
> > cpu_caps_set/cpu_caps_cleared arrays, so they all need to reside in
> > .data. This ensures that they won't be cleared along with the rest of
> > BSS.
> >
> > Note that forcing a capability involves setting it in both
> > boot_cpu_data.x86_capability[] and cpu_caps_set[].
> >
> > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> > ---
> >  arch/x86/kernel/cpu/common.c | 10 ++++------
> >  1 file changed, 4 insertions(+), 6 deletions(-)
> >
> > diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.=
c
> > index bbec5c4cd8ed..aaa6d9e51ef1 100644
> > --- a/arch/x86/kernel/cpu/common.c
> > +++ b/arch/x86/kernel/cpu/common.c
> > @@ -704,8 +704,8 @@ static const char *table_lookup_model(struct cpuinf=
o_x86 *c)
> >  }
> >
> >  /* Aligned to unsigned long to avoid split lock in atomic bitmap ops *=
/
> > -__u32 cpu_caps_cleared[NCAPINTS + NBUGINTS] __aligned(sizeof(unsigned =
long));
> > -__u32 cpu_caps_set[NCAPINTS + NBUGINTS] __aligned(sizeof(unsigned long=
));
> > +__u32 __read_mostly cpu_caps_cleared[NCAPINTS + NBUGINTS] __aligned(si=
zeof(unsigned long));
> > +__u32 __read_mostly cpu_caps_set[NCAPINTS + NBUGINTS] __aligned(sizeof=
(unsigned long));
>
> Is there any scenario where capabilities are changed after boot?  If
> not, this could possibly be __ro_after_init.
>

Turns out that this is not possible.

https://lore.kernel.org/all/202505211627.1f9b653f-lkp@intel.com/T/#u
