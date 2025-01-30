Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A94351E6DCF
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 14:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738247105; cv=none; b=Yrof9K4wpLiWI5C6mCBXqPjdRt/nPYO59u6jotmDTU4Dgk/J8z6Ld3luB7z6XhjT5rjjQBcnTfkmPKeXqBmNLKf3xYOcB4i4fj3yx/UQSetGHgrj5OA/pDX+frG71NAhCbBcWSzKIWMyr97t5TymYmx7iG3OIa9iOcCigXjC9rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738247105; c=relaxed/simple;
	bh=Iy/xG3SkC+UDJNTJyBx1NonxLGE6Q/iYylKG6XvhG1g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L/oaG2a+tcFMieriaMPpS2CxO/Zpq4ALSZxobfroJL2+P+CWOE5g/NkgLaJBY9ICKiRU1dGfB+R3tX06lLVz70HN+oaMglKCPmW/wmoabMt4d31JSvSFXX1QGJHmg9Xm95JGYR75jPA1IPZBaNLzrf8E1DzgyCohw+PJAVrgTv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ab6ed8a3f6aso74476466b.2
        for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 06:25:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738247100; x=1738851900;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3OqrPZhmeATdEa/SarwcrPzfDvhKK4nRH2GJQ3Y2/Ao=;
        b=Yv3HNnkUwINdBMqmRwafDE+UYZswjKaDyP/hrxgjcBC34zFtUy0ZqHBogFxHFnsCLw
         US1AdXbFoBQfgxnRtgFlAWaSwkkdPHrSHRR0fGLa97wqyydClg5zFdPa93GK9AJF+o8p
         iHwt8ZnEWHVbIRQCQ+6wsS0S5PF9Iuu4whbunLdnjzrGIkEYgoiW7yeFcU8Rr7ZW0YoK
         U3C/msCxYQY55fp9vudvUUteNLR2T3J3KYKr2A/yafVxtUP4tMnm3XEuw/gaUAGNocxE
         lEhPoR/uYXbELEoa4dy8m8/Adg8Ncbmpi/SZvqD3CqYEZDhFYf09vUEsJptKtBMFkDgY
         WXWg==
X-Forwarded-Encrypted: i=1; AJvYcCW6G8g3BpNOCXVmOBbsKv3QIq79hmRWx1DLtTttS5XR72q5qdWgGpGsJ09CFaHzCj89Q0HHtMl5APdTj1U=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQccr9PCI6hlYnRqtz+QxkXYemOZ49YA8BKXap+rJecG6vSmS3
	xTl4KUMgoysxVs0Fr97N1w64KFbZ8c+PQPCrvQyf4MVnvy1SNlPsEtOZrvzHigA=
X-Gm-Gg: ASbGnctcPwqFAh56eT732ycWPWD1MespLn70cDzPhzWDY8syhB8sj6gOhWA1Di2lVfI
	5i7E9CC5UzhWrgUUG1USPxOu7jssf/x9RlMZW8hojazc42/5/ITF/ienz/CzS/ISQ0Twvj0L/gR
	xJo5hqFvIygmk4UhsJcq+8wSVi9wx8W+Lrd1mM35+xzukWbO8nhy3FGJ4K2hY0Vg96+EtmyObFR
	IIN7YKRWYYNXNX2ym5ZnycoTTgTx3NMhn4+u1OWO6v8Sckb9lzPDxqbZrrxPysuMl1nPEM5SEsA
	ItXu2zi6IBwMkVwSbgCCfA1qNSGCMZK8Mwu56zcBMG7fwtFI+j1XBA==
X-Google-Smtp-Source: AGHT+IHS3qa8waJPpOyqkZEsCusZdkNgXjtWCuQmwgXoPBUJWi7GEz0dOzvASeNd+zRqwy4jxCgQQg==
X-Received: by 2002:a17:907:94d1:b0:ab6:eec9:5c08 with SMTP id a640c23a62f3a-ab6eec95d8emr139698766b.10.1738247099743;
        Thu, 30 Jan 2025 06:24:59 -0800 (PST)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com. [209.85.208.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e47a7dcfsm130907466b.17.2025.01.30.06.24.59
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jan 2025 06:24:59 -0800 (PST)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5d3e6f6cf69so1453844a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 06:24:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUmoii2no1U88SJm3WoFQ5ePLanXCj40hp4P5Sa+Y/+TdQ/qaG920LidVeEbVcH0UkRQkEk1MnrTGOniWk=@vger.kernel.org
X-Received: by 2002:a05:6402:40c9:b0:5d0:efaf:fb73 with SMTP id
 4fb4d7f45d1cf-5dc5efc5baamr7107488a12.15.1738247099100; Thu, 30 Jan 2025
 06:24:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241205-xarray-kunit-port-v1-1-ee44bc7aa201@gmail.com>
 <07cf896e-adf8-414f-a629-a808fc26014a@oracle.com> <qdq4k6323orqifgzo7pbg5vakezr3gptfdehghxsyfrhc4kwvb@d4fxbwcl4gjm>
 <CAJ-ks9=U4PZv4NgyH8B7SbHkecGLy+M=G639hSTv-hnPySqk6w@mail.gmail.com>
 <xf3445vgszstqfwycf5wc5owhnifxb3mny5xjjaihghqgnozmd@3h7hnifir4vu>
 <CAMuHMdVcuhzO57Qn-kcUJDM=HmkSwuheyNJPF1tx+gxRKnKZXA@mail.gmail.com>
 <mp6lnt3stfnfd74rwaza5xffh2ya5gylqnxotgrnqaqo3eh2zl@5g257jeiugfn>
 <CAMuHMdWDRLi8AE0PgfAnXundbS0hyTyovUH7yScrY7GtmYYPOQ@mail.gmail.com> <zlcagbwyskb4nkl4usbq4foc4vjcau3exp42zpfsl5b4tabr7u@o42mpfcsfygr>
In-Reply-To: <zlcagbwyskb4nkl4usbq4foc4vjcau3exp42zpfsl5b4tabr7u@o42mpfcsfygr>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 30 Jan 2025 15:24:45 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVUZQTgLpa9L9R117s39nEqxdGy=CJLyLQaTv_16EDhZg@mail.gmail.com>
X-Gm-Features: AWEUYZmmaZQOtaNUMvBrswZCS49ixh1s35CzIVK-s4dUf7w23LLrATAr9KprGzw
Message-ID: <CAMuHMdVUZQTgLpa9L9R117s39nEqxdGy=CJLyLQaTv_16EDhZg@mail.gmail.com>
Subject: Re: [PATCH] xarray: port tests to kunit
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: Sidhartha Kumar <sidhartha.kumar@oracle.com>, akpm@linux-foundation.org, 
	christophe.leroy@csgroup.eu, justinstitt@google.com, 
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	linuxppc-dev@lists.ozlabs.org, llvm@lists.linux.dev, maddy@linux.ibm.com, 
	morbo@google.com, mpe@ellerman.id.au, nathan@kernel.org, naveen@kernel.org, 
	ndesaulniers@google.com, npiggin@gmail.com, 
	Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Liam,

On Thu, 30 Jan 2025 at 15:06, Liam R. Howlett <Liam.Howlett@oracle.com> wro=
te:
> * Geert Uytterhoeven <geert@linux-m68k.org> [250130 08:26]:
> > On Thu, 30 Jan 2025 at 13:52, Liam R. Howlett <Liam.Howlett@oracle.com>=
 wrote:
> > > * Geert Uytterhoeven <geert@linux-m68k.org> [250130 03:21]:
> > > > On Wed, 29 Jan 2025 at 23:26, Liam R. Howlett <Liam.Howlett@oracle.=
com> wrote:
> > > > > I've never used the kunit testing of xarray and have used the use=
rspace
> > > > > testing instead, so I can't speak to the obscure invocation as bo=
th
> > > > > commands seem insanely long and obscure to me.
> > > >
> > > > The long and obscure command line is a red herring: a simple
> > > > "modprobe test_xarray" is all it takes...
> > >
> > > That command worked before too...
> >
> > Exactly, great!
> >
> > > > > You should look at the userspace testing (that this broke) as it =
has
> > > > > been really useful in certain scenarios.
> > > >
> > > > BTW, how do I even build tools/testing/radix-tree?
> > > > "make tools/help" doesn't show the radix-tree test.
> > > > "make tools/all" doesn't seem to try to build it.
> > > > Same for "make kselftest-all".
> > >
> > > make
> >
> > Where?
> > > > BTW, how do I even build tools/testing/radix-tree?
>                                 ^^^^^^^^^^^^^^^^^^^^^^^

Things like "make -C drivers/net/ethernet/" stopped working
ca. 20y ago.

> > > Or look at the make file and stop guessing.  Considering how difficul=
t
> >
> > There is no Makefile referencing tools/testing/radix-tree or the
> > radix-tree subdir. That's why I asked...
> >
> > Oh, I am supposed to run make in tools/testing/radix-tree/?
> > What a surprise!
> >
> > Which is a pain when building in a separate output directory, as you
> > cannot just do "make -C tools/testing/radix-tree" there, but have to
> > type the full "make -C tools/testing/radix-tree O=3D..." (and optionall=
y
> > ARCH=3D... and CROSS_COMPILE=3D...; oh wait, these are ignored :-( in t=
he
> > source directory instead...
>
> I'll await your patch to link all this together.  Please Cc the authors.

I gave it a try for kselftests a few years ago.
https://lore.kernel.org/all/20190114135144.26096-1-geert+renesas@glider.be
Unfortunately only one patch was applied...

> > > it is to get m68k to build, you should probably know how to read a
> > > makefile.
> >
> > Like all other kernel cross-compilation? Usually you don't even have
> > to know where your cross-compiler is living:
> >
> >     make ARCH=3Dm68k
>
> Ignoring that I had to make a config - which asked challenging
> questions...

make ARCH=3Dm68k defconfig

> And ignoring the steps to get m68k compiler...

apt install gcc-m68k-linux-gnu?

> > > > When trying the above, and ignoring failures due to missing package=
s
> > > > on my host:
> > > >   - there are several weird build errors,
> > > >   - this doesn't play well with O=3D,
> > > >   - lots of scary warnings when building for 32-bit,
> > > >   - ...
> > > >
>
> In file included from ./include/linux/sched.h:12,
>                  from arch/m68k/kernel/asm-offsets.c:15:
> ./arch/m68k/include/asm/current.h:7:30: error: invalid register name for =
=E2=80=98current=E2=80=99
>     7 | register struct task_struct *current __asm__("%a2");

Which compiler are you using?

> > > > At least the kunit tests build (and run[1] ;-) most of the time...
> > >
> > > Do they?  How about you break something in xarray and then try to boo=
t
> > > the kunit, or try to boot to load that module.
> >
> > If you break the kernel beyond the point of booting, you can indeed
> > not run any test modules...
>
> Which is extremely easy when you are changing code that runs so early in
> the boot.
>
> My code found a compiler issue because it's the first function that
> returns a boolean.  This is stupid.

Sorry. I don't understand this comment.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
