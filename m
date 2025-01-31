Received: from mail-ua1-f65.google.com (mail-ua1-f65.google.com [209.85.222.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 329301487E1
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 07:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738309211; cv=none; b=D1WOArFSqS0Z47NI8hXQ1I3Mqejsm3HD8+z6+DsEMSKdmMhaxV2qwra2rA7hsUg1OnORFgDsi8PihKMdVm3SezgonaG/0kpK+BNKQ0ycmYw5uCR+Z2UvXkTP4bBSicBlTvjUyg/eL3zwCxY446pOYfbEuNapv4f1Yrm8YqmSGQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738309211; c=relaxed/simple;
	bh=eBBg1iptajengVqdm0pmKZfYXz/Bu4Dc0woU7WS/8QQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=Q2VbyRErA3xnRhwqLSCAZwFSYwTtrjl19C/rH/Vbwf/FCp6Wt3I506JF9y3K5eCfcLqEIivaEbsVVFSMHyZ677I3xikqC4+0B6uEUQ7KheGot1iTjFZCgpEiQIyc3uW/pnNasRrksioFHl67BWeoykMRrYWaGYIwiXSGkXouyIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f65.google.com with SMTP id a1e0cc1a2514c-85b95896cefso393901241.2
        for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 23:40:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738309207; x=1738914007;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8kQmZAAK+6ewvnmsf4szqYR99Nu9ojx8MPSG+efC0JQ=;
        b=P+qqYUDSWCPbm1yuU6YIQVeO5BiViIjB4TjL1dqJdA54q1bqWOplsrKK3Igrh9YOdL
         sX1hMDlKhqjrnQ3Wfx9OkAQGAXdQO3/e4bS9rJcLL76csSu7CkoPRyYWro4nhYB+XZFi
         FDVORO3Mo6MUxwMwWeGmHnvp4GwH4JRm4bcSHbSESiCgTVNSex7A+eEHfSiQ3TGhdhs0
         jgDKMzDfc6ldZ7B8RRWX79y07s5fwgPAdQ/BCVsRLrHYmEamaypi3Lw+zZM0U6Nh0LJJ
         0vBqiFLAUVdL8amce3PpPlDaPMmCDj1BuQcpsnAkIcpekZzMA+r6zLOx+JJqKfJPF6cz
         KvIg==
X-Forwarded-Encrypted: i=1; AJvYcCVPrboVrbvKuO4/RPAZg7nfCAzMefKKk4WsyP41l5NNbMNjOrYI5ESLTqeDEmgosoy0glm7CM9Aj+fW2P8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUI9Bp30XZRcO04tNlnwTUsDu4eZRC1XHg2YI8E0zj0so4mnv1
	rJb42cykCZMIAOO3c8Mjix2Dy7MJeKJmHDlXR5evRt9dUEdJIcOp5E13eo6goHymjA==
X-Gm-Gg: ASbGncsMbbS383UUnXE+wZbnIh16uBwVprjDW+pJzA8xukTqOnCMzi1obMqWBzNQtxs
	hd/2GUdY4bJSsQwqe1k987v+KoSqf9SUxRRJxvGaEG1UE4NJ3n9aKr1W/yKG2ucJIxzf/I+dQTH
	iIw4xwC8JqysW6corE9LU2QDh1/BSDo6u5V2PumAQNVHHxeFtUftFT+j0L93tYg42QksMF02F4r
	HERfekmmfk687ZEAm9K9vkyS08sUvLf70J+LXKiPvWTISklVKO7mq0stJGhRj3AvoyMoYe1xE1D
	bXAxAbJXqHqsK2ZDyIYiWHNzixQFjGDqYlDKFZE6WIEKSOmed3ddqQ==
X-Google-Smtp-Source: AGHT+IGculx/a6au4shJ7Wu1o51sBFbRHAKo7cMruX+uu/2sJwIZmpgqEOe46+l3mi6TAUSs9HmVZg==
X-Received: by 2002:a05:6102:3747:b0:4b4:3a28:6491 with SMTP id ada2fe7eead31-4b9a5279c21mr7815454137.25.1738309206883;
        Thu, 30 Jan 2025 23:40:06 -0800 (PST)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b9baa8e4cfsm542132137.11.2025.01.30.23.40.05
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jan 2025 23:40:06 -0800 (PST)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-85c61388e68so359661241.3
        for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 23:40:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVPJLFourcoTyF6RAMysxOVN97q/zvjlSjM+SvKUxTDa9TjB82aK127qZlb0HWvmaic9AFtZ1wlktDDVuc=@vger.kernel.org
X-Received: by 2002:a05:6122:d87:b0:518:81aa:899b with SMTP id
 71dfb90a1353d-51e9e4e2f3cmr8999970e0c.6.1738309205451; Thu, 30 Jan 2025
 23:40:05 -0800 (PST)
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
 <CAMuHMdWDRLi8AE0PgfAnXundbS0hyTyovUH7yScrY7GtmYYPOQ@mail.gmail.com>
 <zlcagbwyskb4nkl4usbq4foc4vjcau3exp42zpfsl5b4tabr7u@o42mpfcsfygr>
 <CAMuHMdVUZQTgLpa9L9R117s39nEqxdGy=CJLyLQaTv_16EDhZg@mail.gmail.com> <ihl4bxs65uphmepoyw4xoa26mr4f3gci2mgtoq4osrzeyh3mup@hww2utbkxkfn>
In-Reply-To: <ihl4bxs65uphmepoyw4xoa26mr4f3gci2mgtoq4osrzeyh3mup@hww2utbkxkfn>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 31 Jan 2025 08:39:53 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVUrCfL+UheG56tEtT6K7vm++dNHDmcaL3cWWHyzAaZnw@mail.gmail.com>
X-Gm-Features: AWEUYZkH_w9tBM_pRW6Ohl7HsK0YqaRuQD-fO1ItmvH8HD9xdtZANpKrFhiastY
Message-ID: <CAMuHMdVUrCfL+UheG56tEtT6K7vm++dNHDmcaL3cWWHyzAaZnw@mail.gmail.com>
Subject: Re: [PATCH] xarray: port tests to kunit
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Sidhartha Kumar <sidhartha.kumar@oracle.com>, akpm@linux-foundation.org, 
	christophe.leroy@csgroup.eu, justinstitt@google.com, 
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	linuxppc-dev@lists.ozlabs.org, llvm@lists.linux.dev, maddy@linux.ibm.com, 
	morbo@google.com, mpe@ellerman.id.au, nathan@kernel.org, naveen@kernel.org, 
	ndesaulniers@google.com, npiggin@gmail.com, 
	Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Liam,

On Thu, 30 Jan 2025 at 16:17, Liam R. Howlett <Liam.Howlett@oracle.com> wro=
te:
> * Geert Uytterhoeven <geert@linux-m68k.org> [250130 09:25]:
> > On Thu, 30 Jan 2025 at 15:06, Liam R. Howlett <Liam.Howlett@oracle.com>=
 wrote:
> > > > > it is to get m68k to build, you should probably know how to read =
a
> > > > > makefile.
> > > >
> > > > Like all other kernel cross-compilation? Usually you don't even hav=
e
> > > > to know where your cross-compiler is living:
> > > >
> > > >     make ARCH=3Dm68k
> > >
> > > Ignoring that I had to make a config - which asked challenging
> > > questions...
> >
> > make ARCH=3Dm68k defconfig
>
> That also prompts, defoldconfig did not.

Hmm, using a defconfig should never ask for questions.
Perhaps this might happen if it has an option enabled that depends on
specific compiler support?

> > > And ignoring the steps to get m68k compiler...
> >
> > apt install gcc-m68k-linux-gnu?
>
> There are a few compilers, multilib or such?  I've had issues with
> getting all the archs working for cross compile on the same machine
> (arm, arm64, riscv, m68k, ppc, ppc64, parisc).

I have installed all of the above (and more) from Ubuntu
(except for parisc, as Ubuntu does not have it), and more
from https://www.kernel.org/pub/tools/crosstool/.
All of them should work fine (for building kernels).

> > > > > > When trying the above, and ignoring failures due to missing pac=
kages
> > > > > > on my host:
> > > > > >   - there are several weird build errors,
> > > > > >   - this doesn't play well with O=3D,
> > > > > >   - lots of scary warnings when building for 32-bit,
> > > > > >   - ...
> > > > > >
> > >
> > > In file included from ./include/linux/sched.h:12,
> > >                  from arch/m68k/kernel/asm-offsets.c:15:
> > > ./arch/m68k/include/asm/current.h:7:30: error: invalid register name =
for =E2=80=98current=E2=80=99
> > >     7 | register struct task_struct *current __asm__("%a2");
> >
> > Which compiler are you using?
>
> I've had a hard time getting m68k to boot in qemu because of the lack of
> userspace.  I use m68k for nommu testing, but have a hard time getting
> the buildroot to work correctly to build what I need.

I only do m68k with MMU, and use Debian (ports) userland.
Perhaps https://landley.net/toybox/ might give you a nommu userland.

> More importantly, I think I get your point, you think that the testing
> should be integrated and complain if it's broken - at least by bots.  I
> don't think this is practical in all cases, unfortunately.

Exactly:
  - (cross)building kernel module tests is easy, and included in a
     kernel build, so build failures are detected early.
  - (cross)building the userland testing tools is cumbersome.
So there's an opportunity for improvement...

Thanks!

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
