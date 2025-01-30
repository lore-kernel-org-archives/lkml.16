Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F5DE819
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 13:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738243575; cv=none; b=YOfIJyNtM0mZfVaJBHctDh8WClrOlz30dMhDnsxWFG8Dz/QT8K8kpmqhEjpSo1zKFxjZ9WkuoZDHStf96eMTYLDOV2K8OnW+AjtV+Y4dOcNDiWQSOGEhuPC/TzB8fFEsPascdqobeyEiTSet01Nw5EEqkT/c3XOMfxPWq+gY3B8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738243575; c=relaxed/simple;
	bh=EluioHgTrDfBtlMLrqNjhpzUXx5fQlBJiL9K5UDjawM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L5BNOWyjrqGDJbfaCg+c+HlxZ8pJjAT2ruQo6xvi8v/rWcmdWvRo1/LBf1m9JgxVQ8FkXRXMh3JiRwetOciDJhKCu7I/ttwZ/iDlQZbeFKM3RvE980v/aU07h4STw7M9Hilp1TcZcj6rk6rk9Hqc7T9O6IeTo9M/xrxav1GhP08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5188c6f260cso252827e0c.1
        for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 05:26:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738243570; x=1738848370;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RcnCdea0Cg2xhZ905GiM0LEi2fn/A0TJy6vLZwAFU5g=;
        b=wdaedNmSf0Rt9wvt2mDCDhnV55AFIj5ceDmDCG/ILHWAmRaO77WxUu/L+4gjmda2iM
         /Zbsl8V3V4yRKeHcGqr3STpgZ9K+p3mSLg4UEvlDsLBNz9HvBCgUxByqoaizVf5UTKIG
         A3sIYRsCRuV4PoGpPaxQ6rT7PYDfIrzuC445vkuDPzHVOnE7NCLG5lrCfV+VY2knxg7W
         banvqync4LjruFmURBufLAFbYTY8gUq7yA3w9FyVHXgCoqhDfW63oNOvhxzIR0BpWnqy
         Fw5zOddRlclHEVRwEwZ3shpU4uWiR5koAa3G2NfSOSb7XmdpbUzrDeOn8L0JwZ9a/N8H
         64uw==
X-Forwarded-Encrypted: i=1; AJvYcCX9OR+zPCd2BDbn+uWtaLTOOx5wqYRtn5YLnColitgHyfCdH1c5eTzSopZ8/MEJ1DA/Y61y0wPHqTf11TQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIT33LsEAl6Z2yxOIYBpCbJYuACfmcRbgOGoeyN1dVSXMYMuEd
	I+itxbo2sCoGvEO2PBK4/9Nmg3AqvOZ87roKrg0OgvLIn0eLeXrJvJyxmUMa
X-Gm-Gg: ASbGncsZHwJbZm50GJF8EhD/dy/82fZQA+PT9ONCLKVAYwKqwv/EWnqHRoFhyueL0Op
	WiCHPnfgH1behNM1Dj+0vvETc104KxJ8Gtvhr2DdvHWikdGQAwcB11hwHcQBzGYimodKgNXtQyL
	Ak2AtbBVSYDFiNXMKwwOpIM9NgcGc0BxpZsgY3tKl/s+lzhQGZox6oJ15NYo+v+RCftKCq4WsNI
	jqyQRMqwn6Ixjg69sYjcn/Fe9SQEoOkrlcOBdKjeBFzVDQju9EuN2Ahv51+e/Z6sZ/E8W5LdeNd
	TVbk7+mmzzr6Eqt/+ALbgtLBF28nn7dmtZzmZ06DqnGeJxvQPZQmxg==
X-Google-Smtp-Source: AGHT+IFJhGUl+mH+UbQuEUrHdBs2UYBaFFG1kvKDTgBjNtLbd+R1FCdr6SSr4mb87tz1meo8TZ0AKQ==
X-Received: by 2002:a05:6122:32cb:b0:516:2833:1b8d with SMTP id 71dfb90a1353d-51e9e55db69mr6851377e0c.11.1738243570375;
        Thu, 30 Jan 2025 05:26:10 -0800 (PST)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51eb1d917c1sm183095e0c.43.2025.01.30.05.26.09
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jan 2025 05:26:09 -0800 (PST)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-4affd0fb6adso291507137.1
        for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 05:26:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX+u1uKwFcxrYvfVpXi3n5HMaIZOij/GHy6zVhvZWRBaXnJtabmorfwPm40l0et5hdGVDnLIc6B42A4kG4=@vger.kernel.org
X-Received: by 2002:a05:6102:2ad3:b0:4af:bb06:62d with SMTP id
 ada2fe7eead31-4b9a4f499c9mr6186530137.11.1738243569336; Thu, 30 Jan 2025
 05:26:09 -0800 (PST)
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
 <CAMuHMdVcuhzO57Qn-kcUJDM=HmkSwuheyNJPF1tx+gxRKnKZXA@mail.gmail.com> <mp6lnt3stfnfd74rwaza5xffh2ya5gylqnxotgrnqaqo3eh2zl@5g257jeiugfn>
In-Reply-To: <mp6lnt3stfnfd74rwaza5xffh2ya5gylqnxotgrnqaqo3eh2zl@5g257jeiugfn>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 30 Jan 2025 14:25:57 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWDRLi8AE0PgfAnXundbS0hyTyovUH7yScrY7GtmYYPOQ@mail.gmail.com>
X-Gm-Features: AWEUYZn0su9wB3Rua7xZlN_jsLurJgHhePP-DQxZFLycHjingwrtS3E5xZdT-fo
Message-ID: <CAMuHMdWDRLi8AE0PgfAnXundbS0hyTyovUH7yScrY7GtmYYPOQ@mail.gmail.com>
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

Hi Liam,

On Thu, 30 Jan 2025 at 13:52, Liam R. Howlett <Liam.Howlett@oracle.com> wrote:
> * Geert Uytterhoeven <geert@linux-m68k.org> [250130 03:21]:
> > On Wed, 29 Jan 2025 at 23:26, Liam R. Howlett <Liam.Howlett@oracle.com> wrote:
> > > I've never used the kunit testing of xarray and have used the userspace
> > > testing instead, so I can't speak to the obscure invocation as both
> > > commands seem insanely long and obscure to me.
> >
> > The long and obscure command line is a red herring: a simple
> > "modprobe test_xarray" is all it takes...
>
> That command worked before too...

Exactly, great!

> > > You should look at the userspace testing (that this broke) as it has
> > > been really useful in certain scenarios.
> >
> > BTW, how do I even build tools/testing/radix-tree?
> > "make tools/help" doesn't show the radix-tree test.
> > "make tools/all" doesn't seem to try to build it.
> > Same for "make kselftest-all".
>
> make

Where?

> Or look at the make file and stop guessing.  Considering how difficult

There is no Makefile referencing tools/testing/radix-tree or the
radix-tree subdir. That's why I asked...

Oh, I am supposed to run make in tools/testing/radix-tree/?
What a surprise!

Which is a pain when building in a separate output directory, as you
cannot just do "make -C tools/testing/radix-tree" there, but have to
type the full "make -C tools/testing/radix-tree O=..." (and optionally
ARCH=... and CROSS_COMPILE=...; oh wait, these are ignored :-( in the
source directory instead...

If these tests are not integrated into the normal build system (see
also [1]), I am not so surprised the auto-builders don't build them,
and breakages are introduced...

> it is to get m68k to build, you should probably know how to read a
> makefile.

Like all other kernel cross-compilation? Usually you don't even have
to know where your cross-compiler is living:

    make ARCH=m68k

> > When trying the above, and ignoring failures due to missing packages
> > on my host:
> >   - there are several weird build errors,
> >   - this doesn't play well with O=,
> >   - lots of scary warnings when building for 32-bit,
> >   - ...
> >
> > At least the kunit tests build (and run[1] ;-) most of the time...
>
> Do they?  How about you break something in xarray and then try to boot
> the kunit, or try to boot to load that module.

If you break the kernel beyond the point of booting, you can indeed
not run any test modules...

Which does _not_ mean the userspace tests are not useful, and that I
approve breaking the userspace tests...

[1] https://lore.kernel.org/all/CAK7LNASdA+5_pdTjr1dY-cKGSDq804Huc_CX_8-Gg+ypFCmajQ@mail.gmail.com/

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
