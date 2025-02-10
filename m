Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8299D2E628
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 09:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739181510; cv=none; b=RqAQvevR5CUgM2TpR13y6F2PQjmQMBhwbGj+25D7iHDy4+g/u2V8p1Th2HyE7tMa5JKLBPxEX074u8zL73uIPari2QdHwI8QTeqBJMl/3r3AkGaEGbl4bxT9PQfGow/0OIkRSEsYMaUlE/eqs+uNdZ+duR4Au46zwZlhbVTZbJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739181510; c=relaxed/simple;
	bh=LLsCw6kASzhkAjk4nDNNOB0S6zg3/MVFEF2ruP4gnTc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pcPQ2rNLXyG6PyEuLgNVGthTCxI0thxavMwFPrrFdg9nmfNzXfdGYeb4IBxddCOyH4yMFi4BA48gkhrZ4pI9GGWiJ6RaMuZWTEwy4o0I2pHuZKmtzwUixKjep31tgF86gx7LTCJ9ouDe2Y0uH0J0ePm2xK6ZPfmLC5BEic0n4t8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=PcV/83K7; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="PcV/83K7"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-308eebd4938so7427071fa.0
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 01:58:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1739181506; x=1739786306; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lz7a8oG84+js9CrDUqiLSZ8YAPcqO5VoUXBzq5EVAfs=;
        b=PcV/83K7gRS1mIi5N1e9q/7W4bFaQT+qopCSxh7FbIRigyIx7JMkFBgYGmDLpJFCnR
         yToehkmDEpZldKFyTLtriXyqsnN99l4RBw3NaasOjEPop6hOhgkzTsDn59pw/QrrGSQI
         1IiSU3A3ZjYMWWqcu2n/5UmeM7aFkd+gU2YCBuqo1XaH95bSW9Wv+5PqdSBXiWi0u8np
         yBFH/LByG3rVa2BBSfKYDEVVRvixh9l+9SfjHqn5X/kxTtkNBUeZmCx9580WPfD3WoWU
         o66kgp/C30XzuyhIuSIUi2i4A6QWJZTv2ZJgn33aGmM3g3fpBEbGpju3d1UIieLjgQv8
         N4jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739181506; x=1739786306;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lz7a8oG84+js9CrDUqiLSZ8YAPcqO5VoUXBzq5EVAfs=;
        b=G4x3gYici3nO6sHAOUU13uH81xQRgqaXFWYjJLe1AWVH6/H6UNgVV7TYZG0e9joy/n
         88ZL9MU0lndn4s519DR4EV8vVrbUUYgtYwQxto7E7CSZu8opEdfEEEGYZw6tP0kRaWbJ
         L3CWddp7cQn+r3mkvTQ6nIiVV1FKUAkyH1ulRrSMgr3RDfvwph103ct4m/eMvnYAfy5v
         gJ/iTygp1L/HcAZwKWJDU4uW3yTZrXil7OQSZCuuSXgXH6oIs+lxVeENcQYQYAixABKj
         KIOfmxmbD2052CDGPiiclc4+5JlOvDREdIGRYwg9kE6NWSdJ7FvLLd8OvbJIXfTGORQm
         9sAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXL9+pFEi230d86rtFB1evm4hSaBTN6xKeQs/v09nLTlE4Am5gLxkRxVxFgUzfvTlwEz6WupJtZ8ZmOWgQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyy2QJIQI1XSyjX3OjAIGrdiTk0IIgFRr1NofgPZhB5Dr9AlFS+
	nn7f2PwfE/jdCwZ3qYVPVZ+6gNqj1RBQrMcLpot+9Gf5beIgqd25Y+0+NLOteUfuF8+0X0wO29I
	SmLbW7ZKdadakl2Pd6Bxu1uE4WbVUVVscf/9HHQ==
X-Gm-Gg: ASbGncvOl1nhextFvGCQ7pwMge6S6HeJR/leOmvO+zpnuSSRb8lBvZauN1+/cvmSTq8
	4i9+u05d/4oJ1I4ORccnybqoBz8ITN0vmj793uCzGD5Jh+GDQki22iPeT5U8orCzOtFcb+9PmdA
	==
X-Google-Smtp-Source: AGHT+IH3sd2iWumk0wk3iOPbZueUud59Dn5DSY5S0aDVJ1BDCzM6fwAq4LDmJmPd5QjvGfifb6c/WQK/vtvKlCb8xd0=
X-Received: by 2002:a2e:9fc5:0:b0:308:eabd:297a with SMTP id
 38308e7fff4ca-308eabd2eb1mr16802441fa.17.1739181506482; Mon, 10 Feb 2025
 01:58:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250207161939.46139-11-ajones@ventanamicro.com>
 <CAK9=C2XmFtLHAxuWJVdvkUHFQTM+mE-D8E4sLvKxxUj_CqcbAQ@mail.gmail.com> <20250210-d575562e04d84ca570e26f5d@orel>
In-Reply-To: <20250210-d575562e04d84ca570e26f5d@orel>
From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 10 Feb 2025 15:28:13 +0530
X-Gm-Features: AWEUYZmECa7UuKoGzvOCu3WthryUNQTBxalJl0J0QbjchfqKlrFJBDvtCle-H5c
Message-ID: <CAK9=C2X5Hu_LQHmXUea7Xhq5cHaJqtcncgwUeb2+2uMvbTiW3w@mail.gmail.com>
Subject: Re: [PATCH 0/9] riscv: Unaligned access speed probing fixes and skipping
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, charlie@rivosinc.com, 
	jesse@rivosinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 10, 2025 at 2:56=E2=80=AFPM Andrew Jones <ajones@ventanamicro.c=
om> wrote:
>
> On Sat, Feb 08, 2025 at 01:29:42PM +0530, Anup Patel wrote:
> > On Fri, Feb 7, 2025 at 9:49=E2=80=AFPM Andrew Jones <ajones@ventanamicr=
o.com> wrote:
> > >
> > > The first six patches of this series are fixes and cleanups of the
> > > unaligned access speed probing code. The next two patches introduce
> > > support to skip probing by matching vendor/arch/imp ids and checking =
a
> > > table for the access speed type. The last patch applies the new skip
> > > support to Ventana harts.
> >
> > Alternatively, we can also skip probing misaligned access when Zicclsm
> > extension is present in the ISA string. The Zicclsm extension is define=
d
> > as part of the ratified RVA23 profile.
>
> The definition of Zicclsm doesn't explicitly state that misaligned word
> accesses will be faster than byte accesses to the same addresses. There's
> also this spec issue[1] which appears to state that Zicclsm cannot be use=
d
> to infer fast misaligned accesses.
>
> But, like Charlie suggests, maybe we should advocate the creation of an
> extension (or "named feature") which allows specifically advertising that
> misaligned accesses are fast.
>
> [1] https://github.com/riscv/riscv-isa-manual/issues/1611

I am not sure when such an extension would show up so for now
skipping unaligned tests based on implementation ID seems
reasonable.

Also, it seems this series is totally skipping the existing boot-time
print for fast unaligned access. Please try to keep the boot-time
print in some form.

Regards,
Anup

>
> Thanks,
> drew
>
> >
> > Regards,
> > Anup
> >
> > >
> > > (I'd be happy to split the fixes from the new skip support if we want=
 to
> > > discuss the skip support independently, but I want to base on the fix=
es
> > > and I'm not sure if patchwork supports Based-on: $MESSAGE_ID/$LORE_UR=
L
> > > or not at the moment, so I'm just posting together for now in order t=
o
> > > be able to check for my patchwork green lights!)
> > >
> > > Thanks,
> > > drew
> > >
> > > Andrew Jones (9):
> > >   riscv: Annotate unaligned access init functions
> > >   riscv: Fix riscv_online_cpu_vec
> > >   riscv: Fix check_unaligned_access_all_cpus
> > >   riscv: Change check_unaligned_access_speed_all_cpus to void
> > >   riscv: Fix set up of cpu hotplug callbacks
> > >   riscv: Fix set up of vector cpu hotplug callback
> > >   riscv: Prepare for unaligned access type table lookups
> > >   riscv: Implement check_unaligned_access_table
> > >   riscv: Add Ventana unaligned access table entries
> > >
> > >  arch/riscv/include/asm/cpufeature.h        |   4 +-
> > >  arch/riscv/include/asm/vendorid_list.h     |   1 +
> > >  arch/riscv/kernel/traps_misaligned.c       |  14 +-
> > >  arch/riscv/kernel/unaligned_access_speed.c | 278 ++++++++++++++-----=
--
> > >  4 files changed, 200 insertions(+), 97 deletions(-)
> > >
> > > --
> > > 2.48.1
> > >
