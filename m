Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E9D72F0C75
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 15:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751471859; cv=none; b=iY5pCkmK11zH79hcEYoI2TmLZA7+SjfAsmVp5fh3OZNYeiR/OX49k3QQkwQ/iFKC4G2MuliJClZUJDneqNrIff19U+Tm9WWfP3CmKVtaxDwKy/3CmljoQBlohJGwQtCvi+c9JKJcX/zEKGFZU6Syx3os7dgisH0NJKeGTTF+7c0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751471859; c=relaxed/simple;
	bh=icUCd4XoO+ixIyAWZBgZUyMnIuHBPaRzMS9ZyPOV1Ik=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LP6a+RYxgDPqqYa6NI5JcRt8rLul2/mlDsqXKIa77j/QTpx7gk0PY5aNPFGnh1ml7cxMRfQNXi6mNrf6AN68XhNnjgRQv/4I7kp7lA4wUUOlTIbGkNDTbVaKCwBHJX5WbL7p+W6GGK43DO17zfqtSXfWbTGXw9ODFWHk/M6h/gQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XpPh8MjB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XpPh8MjB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9129C4CEF3
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 15:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751471858;
	bh=icUCd4XoO+ixIyAWZBgZUyMnIuHBPaRzMS9ZyPOV1Ik=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=XpPh8MjByIOPP4AiSLtG/PQsg+bn5DEXyqO4qjqcz7EEGNexSnCgwPb1zQWy3S2iB
	 ca8Yrpuh9FyQUyxqkkMI07iE3BiMpkUgiKaqm9o8zwImTb/AFzlnJdgqGWRLH29V5+
	 ZBR0mIO6Vx354DwCtg0eNziCYm237csec5kQyKz4hS17q4S+VuIN/ST24V5L3sYjCw
	 XJMTYIsLm2kO5R0kYxXpnP0pfZoGrISc1XukcZmkOXZzNyDSfwbRF9FlSvmyjkZvTd
	 psODv6AfbFzsNWqiaVWpm/gj3ffJFGWNK8pGG7VxN1WVlg/42j7N2EvsS+F5olu+gh
	 y/rl5Ajydwe8A==
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-453663b7bf1so185725e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 08:57:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWXuGt57Ph7baOPiCLVgR64m0TSAfIARmgaoL4mEvqWIwfJH0Uyvf/CCRsYqW3m051zC1aM4KKybaw6glY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJuDSiAmwRPfr6ikM4jzFWuUcIdrv3IDP131ohNBzABUyacikS
	byk/bnQJ7c1zR6XO7nnfz//JZiyFC0gOuJ3yRW3Zdc/VCPbJQ1xvlozQUsWU0C1RwFVuwcwiFO4
	e2aBPiP92ef/8Zw88MUJs+FtnTTbsw+q5TggQJ0tq
X-Google-Smtp-Source: AGHT+IEVuhRP9qv7REEXVzOStfhDxCO6n42Vb8ZcYZ95zGQslwOSozI88HAej5o0C3XLsF6LQ9oecrhVYjWWJOz/KE4=
X-Received: by 2002:a05:600c:a301:b0:453:5ffb:e007 with SMTP id
 5b1f17b1804b1-453e03a982cmr2956115e9.4.1751471857355; Wed, 02 Jul 2025
 08:57:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250610214140.2775339-1-mclapinski@google.com>
 <CAMj1kXErKwmiM5AiGOCE5D39U+3o_MXz5vqJmE5pkjQV308d9w@mail.gmail.com> <CAAi7L5dmAYJoB0BfKvoT0iKOeWuc5hLqFPBPQr99TkdEB1dtHg@mail.gmail.com>
In-Reply-To: <CAAi7L5dmAYJoB0BfKvoT0iKOeWuc5hLqFPBPQr99TkdEB1dtHg@mail.gmail.com>
From: Chris Li <chrisl@kernel.org>
Date: Wed, 2 Jul 2025 08:57:26 -0700
X-Gmail-Original-Message-ID: <CAF8kJuMvX31n8yNWn11bo1wCgXXOwOAp8HbYpSEBy94LR6phDA@mail.gmail.com>
X-Gm-Features: Ac12FXwgDT4Etg9QMws7VA7RvdyydRx1ZyLTsK5ww-DProVDGcjSMhRV950grDY
Message-ID: <CAF8kJuMvX31n8yNWn11bo1wCgXXOwOAp8HbYpSEBy94LR6phDA@mail.gmail.com>
Subject: Re: [PATCH 1/1] x86/boot/compressed: Fix avoiding memmap in physical KASLR
To: =?UTF-8?B?TWljaGHFgiBDxYJhcGnFhHNraQ==?= <mclapinski@google.com>
Cc: Ard Biesheuvel <ardb@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Dan Williams <dan.j.williams@intel.com>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Michal,

That change looks correct to me, thanks for the explanation of the
execution behavior.

Acked-by: <chrisl@kernel.org>

We can add some test input cases to help better explain the issue. I
quote from your offline message:
-------------- quote -----------
 The old code worked for inputs like this:
"memmap=3Dsomething,something,something,something,something"
but didn't work for inputs like this:
"memmap=3Dsomething memmap=3Dsomething memmap=3Dsomething memmap=3Dsomethin=
g
memmap=3Dsomething".
------------ quote -----------

Such kind of example test input in the commit message would help
understand the patch.

On Sat, Jun 21, 2025 at 2:51=E2=80=AFAM Micha=C5=82 C=C5=82api=C5=84ski <mc=
lapinski@google.com> wrote:
>
> Hi Ard,
>
> On Sat, Jun 21, 2025 at 10:19=E2=80=AFAM Ard Biesheuvel <ardb@kernel.org>=
 wrote:
> >
> > Hi Michal,
> >
> > On Tue, 10 Jun 2025 at 23:42, Michal Clapinski <mclapinski@google.com> =
wrote:
> > >
> > > The intent of the code was to cancel KASLR if there are more than 4
> > > memmap args. Unfortunately, it was only doing that if the memmap args
> > > were comma delimited, not if they were entirely separate.
> > > This change fixes it.
> > >
> > > Signed-off-by: Michal Clapinski <mclapinski@google.com>
> > > ---
> > > I would like KASLR to support more than 4 memmap args. Do you think
> > > I can just increase the MAX_MEMMAP_REGIONS or should I implement
> > > support for the general case?
> > >
> > >  arch/x86/boot/compressed/kaslr.c | 3 ---
> > >  1 file changed, 3 deletions(-)
> > >
> > > diff --git a/arch/x86/boot/compressed/kaslr.c b/arch/x86/boot/compres=
sed/kaslr.c
> > > index f03d59ea6e40..4aa9c9781ca7 100644
> > > --- a/arch/x86/boot/compressed/kaslr.c
> > > +++ b/arch/x86/boot/compressed/kaslr.c
> > > @@ -162,9 +162,6 @@ static void mem_avoid_memmap(char *str)
> > >  {
> > >         static int i;
> > >
> > > -       if (i >=3D MAX_MEMMAP_REGIONS)
> > > -               return;
> > > -
> >
> > It isn't obvious at all why simply dropping this condition is fine.
> > Could you elaborate?

Right, this code is very tricky due to the static variable. One of my
nitpicks is that the code structure does not reflect well the
execution flow. That is a pre-existing condition before this patch.

> Of course. Let's look at the whole function without my change:
>
> static void mem_avoid_memmap(char *str)
> {
>         static int i;
>
>         if (i >=3D MAX_MEMMAP_REGIONS)
>                 return;
>
>         while (str && (i < MAX_MEMMAP_REGIONS)) {
>                 int rc;
>                 u64 start, size;
>                 char *k =3D strchr(str, ',');
>
>                 if (k)
>                         *k++ =3D 0;
>
>                 rc =3D parse_memmap(str, &start, &size);
>                 if (rc < 0)
>                         break;
>                 str =3D k;
Just want to point out that "str" gets reassigned a new value,
possibly NULL here.
I was wondering why it needs to repeat testing str in the later part
of if statements.

>
>                 if (start =3D=3D 0) {
>                         /* Store the specified memory limit if size > 0 *=
/
>                         if (size > 0 && size < mem_limit)
>                                 mem_limit =3D size;
>
>                         continue;
>                 }
>
>                 mem_avoid[MEM_AVOID_MEMMAP_BEGIN + i].start =3D start;
>                 mem_avoid[MEM_AVOID_MEMMAP_BEGIN + i].size =3D size;
>                 i++;
>         }
>
>         /* More than 4 memmaps, fail kaslr */
>         if ((i >=3D MAX_MEMMAP_REGIONS) && str)

Just want to note that we test "i" vs MAX_MEMMAP_REGIONS here.

>                 memmap_too_large =3D true;
> }
>
> This function is called for every memmap=3D param. Let's say we supply
> only separate memmap=3D params (instead of comma delimited). Then on the
> 4th param, `i` will be equal to MAX_MEMMAP_REGIONS but the last `if`
> won't execute since `str` will be null. Then on the 5th param the
> first `if` (the one I want to remove) will execute and
> `memmap_too_large` will never be set.

The test input for the above explanation is "memmap=3Dsomething
memmap=3Dsomething memmap=3Dsomething memmap=3Dsomething memmap=3Dsomething=
".

>
> With my change, while parsing the 5th param, the `while` loop will be
> skipped since `i` is not smaller than MAX_MEMMAP_REGIONS and the last
> `if` will execute setting `memmap_too_large`. Basically, my change is
> safe because the `if` I want to remove is already baked into the
> `while` loop condition.
>
>
> >
> > >         while (str && (i < MAX_MEMMAP_REGIONS)) {

And we test "i" vs MAX_MEMMAP_REGIONS again.

I did attempt to reduce the repeat test condition and make the flow
more straight forward.
The bloat-o-meter said it is a tiny little bit better, mostly due to
avoiding repeat testing "i" again MAX_MEMMAP_REGIONS.

$ ./scripts/bloat-o-meter arch/x86/boot/compressed/kaslr.o /tmp/kasl-new.o
add/remove: 0/0 grow/shrink: 0/1 up/down: 0/-8 (-8)
Function                                     old     new   delta
mem_avoid_memmap                             403     395      -8
Total: Before=3D7992, After=3D7984, chg -0.10%

The flow is slightly better there, but that is much a bigger patch to revie=
w.

Chris

diff --git a/arch/x86/boot/compressed/kaslr.c b/arch/x86/boot/compressed/ka=
slr.c
index 948da3b01cac..f25704f1e1a6 100644
--- a/arch/x86/boot/compressed/kaslr.c
+++ b/arch/x86/boot/compressed/kaslr.c
@@ -189,14 +189,16 @@ static void mem_avoid_memmap(enum parse_mode
mode, char *str)
 {
  static int i;

- if (i >=3D MAX_MEMMAP_REGIONS)
- return;

- while (str && (i < MAX_MEMMAP_REGIONS)) {
+ while (str) {
  int rc;
  u64 start, size;
- char *k =3D strchr(str, ',');
+ char *k;
+
+ if (i >=3D MAX_MEMMAP_REGIONS)
+ goto max_memmap;

+ k =3D strchr(str, ',');
  if (k)
  *k++ =3D 0;

@@ -217,9 +219,11 @@ static void mem_avoid_memmap(enum parse_mode
mode, char *str)
  mem_avoid[MEM_AVOID_MEMMAP_BEGIN + i].size =3D size;
  i++;
  }
+ return;

+max_memmap:
  /* More than 4 memmaps, fail kaslr */
- if ((i >=3D MAX_MEMMAP_REGIONS) && str)
+ if (str)
  memmap_too_large =3D true;
 }
