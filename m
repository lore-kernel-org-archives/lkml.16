Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E40EC28EC11
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 23:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747956916; cv=none; b=adl53P+pFTB1PGESQX4WUH3qFNxezkBZtj4XYqf/3SF9ssewWEx7pU1MSsu8UluFBb90pJePbayw0YRK0Ot8tZelsKu3d8XOoW3XJ0F9GAzCcR31ttTDLyOcbrbzwbLy3UxmHYYmbzj5SH/1rvfeg6Et6i7k0FRw48xwrJ5hBjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747956916; c=relaxed/simple;
	bh=BCg/xKCvgmbWFjMe/V+4gUuee6V7OELp6ZgmHBaY2l0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mg1aHYEY/4kAKmUumxqYca1bFWpYX6GjlA9HDUcjcKkOSRA+NE4hsZelPPEWFZdA4EJpq9a6K4Efac1KXyOwOB63HryN6nq+haass0WTc8ua/OSduYxMSC2mz163Z6QIiP2759m0vUnZJGQ3QQ3rgcyX/xnnJH4BmDHipbqeVuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AGNq5UD7; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AGNq5UD7"
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-525b44b7720so2548146e0c.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 16:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747956914; x=1748561714; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PhbDibMW6rB2j7UXHc3PdZ57ETGCvWFeOSRMt4WT++k=;
        b=AGNq5UD7TVi4q3GHHwFeS+yAW3IAHFiNNTePmocMKDlIsNKfYn0Q+vvZHtqAGSVCSB
         neaaAyXqiAfWCG6Du2Wk5fsmOvdQB7NtSDWUJ01IeHW9HSvYaqk582oxiu3vpElSJpVb
         2cNRysYWlZxNp7CbE4gktnqW5wTtZE/3iuCzOg0COJ1cbfIwQCmvwKCYaFWPHycohDoj
         /6trSW4qlXwcIK6+eRlKlrw9Mx82wIj5sb6WkrJHTPJKgNU8iBJY5+nx6cISa1oYV3iL
         E+2OynDecJ+UhF3NNqRdODEjLE+5r8TuwxtGZQPzXoOFbnI6lww7Yxf9015cht9lEkHF
         JaDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747956914; x=1748561714;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PhbDibMW6rB2j7UXHc3PdZ57ETGCvWFeOSRMt4WT++k=;
        b=vDyqRpi+flyYkOidcGFmem0y7m3E5e79+s/HqyEDUhBmL6otmYic3cVyMu3269agEV
         OmYwyfAQWzw1Z+QWCogx9SYEtP42y/J7jQSffriL+pZIER4BRVLOGBD00i0qXXpTzTVy
         OlMSZx7Q1QkwstmebrBnxjEAjR1uoP2317ooyeG+XDNjNJT7jm9HRw3ccbu5Emr3Wc14
         MAlmQ7BCA7M5DpoNTyY5P0dB9qedlOctvxzZDkvjApLhFuLUJn5w7SPQtGqnTCz9UllI
         p0G/9f2xydAR0acDTnNbhAWKUe53HxmrzONDbyfuFtxMkxvC+yxVJwxVE1TH2/rxBtk4
         iOaw==
X-Forwarded-Encrypted: i=1; AJvYcCVPZgrLgVQq3GTg13OfH7R4aYh2OUGQU9+WODuXBRpipswMDA2cQmACrD6ctE6VF7bHkhxGIf9Es6Pn2zg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzN48uE73MwWZmxHS8aUafdX626kHfZxXyKnturVwnEb6xT5L6E
	/zCGlDeSP0QnWxDYz1LVC8+N+0xpPCWL4iBgH+uIq2lnwCcZSZaUYNal9jKRPGf3iUHmWY9W0O6
	FoCLTlNl9wtay5Dqx8tYV1dZTAxwMEJVxQV/vvGE1
X-Gm-Gg: ASbGncsShjBLhQrlm925w1UfiWypgiSHWMuiim97ZTn48If2Zms+I+R4jhc72+w/CVe
	C0WnAVdhuocgcN2aPrLCk6TBBa3XI2SxLZZYYa3C1UVfrXpYpfYgD2Pd2d9R9IQsw7Ub+eMeBbT
	loZ1kL7bmO8QOOvr/9b6UYfMVf8bAz2itJ/9jCwkD0Yg0=
X-Google-Smtp-Source: AGHT+IEM/DFBzItMDvMT3GgRPsQthZnDZfh8oK1+E1W0b9o/n9MYajDbrxj5M/kFns8zsnpmrkISXZ+vKbECT65sysg=
X-Received: by 2002:a05:6122:428a:b0:520:60c2:3fd with SMTP id
 71dfb90a1353d-52dbcc8547emr23488507e0c.3.1747956913425; Thu, 22 May 2025
 16:35:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250412010940.1686376-1-dylanbhatch@google.com>
 <20250412010940.1686376-3-dylanbhatch@google.com> <20250509161508.GB5984@willie-the-truck>
In-Reply-To: <20250509161508.GB5984@willie-the-truck>
From: Dylan Hatch <dylanbhatch@google.com>
Date: Thu, 22 May 2025 16:35:02 -0700
X-Gm-Features: AX0GCFs1KL1GwnkdFjpSiBC0RbR_upY_O1F4fBatrZc5VR2faRf35nbV_nq9o_s
Message-ID: <CADBMgpzZz_Nn63DLwEbdurwkEUK7RsFXPhMf7Fw3WwOdpp67BA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64/module: Use text-poke API for late relocations.
To: Will Deacon <will@kernel.org>
Cc: Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Puranjay Mohan <puranjay@kernel.org>, 
	Xu Kuohai <xukuohai@huaweicloud.com>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, "Mike Rapoport (Microsoft)" <rppt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Song Liu <song@kernel.org>, 
	Ard Biesheuvel <ardb@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Roman Gushchin <roman.gushchin@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Will,

I've sent a v4 of these patches that should address your comments,
feel free to have a look.

On Fri, May 9, 2025 at 9:15=E2=80=AFAM Will Deacon <will@kernel.org> wrote:
>
> Hi Dylan,
>
> On Sat, Apr 12, 2025 at 01:09:39AM +0000, Dylan Hatch wrote:
> > To enable late module patching, livepatch modules need to be able to
> > apply some of their relocations well after being loaded. In this
> > scenario, use the text-poking API to allow this, even with
> > STRICT_MODULE_RWX.
> >
> > This patch is largely based off commit 88fc078a7a8f6 ("x86/module: Use
> > text_poke() for late relocations").
> >
> > Signed-off-by: Dylan Hatch <dylanbhatch@google.com>
> > ---
> >  arch/arm64/kernel/module.c | 129 ++++++++++++++++++++++++-------------
> >  1 file changed, 83 insertions(+), 46 deletions(-)
>
> On its own, this isn't gaining us an awful lot upstream as we don't have
> livepatch support (arm64 does not select HAVE_LIVEPATCH), however I'm
> not against incremental changes towards enabling that. Are you planning
> to work on follow-up changes for the rest of the support?

As Song mentioned, hopefully
https://lore.kernel.org/linux-arm-kernel/20250320171559.3423224-1-song@kern=
el.org/
in combination with this patch should be enough for initial support of
livepatch on arm64. I'll need to follow up with Weinan on next steps
for the SFrame approach.

>
> > diff --git a/arch/arm64/kernel/module.c b/arch/arm64/kernel/module.c
> > index 06bb680bfe975..0703502d9dc37 100644
> > --- a/arch/arm64/kernel/module.c
> > +++ b/arch/arm64/kernel/module.c
> > @@ -18,11 +18,13 @@
> >  #include <linux/moduleloader.h>
> >  #include <linux/random.h>
> >  #include <linux/scs.h>
> > +#include <linux/memory.h>
> >
> >  #include <asm/alternative.h>
> >  #include <asm/insn.h>
> >  #include <asm/scs.h>
> >  #include <asm/sections.h>
> > +#include <asm/text-patching.h>
> >
> >  enum aarch64_reloc_op {
> >       RELOC_OP_NONE,
> > @@ -48,7 +50,8 @@ static u64 do_reloc(enum aarch64_reloc_op reloc_op, _=
_le32 *place, u64 val)
> >       return 0;
> >  }
> >
> > -static int reloc_data(enum aarch64_reloc_op op, void *place, u64 val, =
int len)
> > +static int reloc_data(enum aarch64_reloc_op op, void *place, u64 val, =
int len,
> > +                   void *(*write)(void *dest, const void *src, size_t =
len))
> >  {
>
> I think it's a bit grotty indirecting the write when in reality we either
> need a straight-forward assignment (like we have today) or a call to
> an instruction-patching helper.
>
> In particular, when you get to functions such as:
>
> >  static int reloc_insn_movw(enum aarch64_reloc_op op, __le32 *place, u6=
4 val,
> > -                        int lsb, enum aarch64_insn_movw_imm_type imm_t=
ype)
> > +                        int lsb, enum aarch64_insn_movw_imm_type imm_t=
ype,
> > +                        void *(*write)(void *dest, const void *src, si=
ze_t len))
> >  {
> >       u64 imm;
> >       s64 sval;
> >       u32 insn =3D le32_to_cpu(*place);
> > +     __le32 le_insn;
> >
> >       sval =3D do_reloc(op, place, val);
> >       imm =3D sval >> lsb;
> > @@ -145,7 +150,8 @@ static int reloc_insn_movw(enum aarch64_reloc_op op=
, __le32 *place, u64 val,
> >
> >       /* Update the instruction with the new encoding. */
> >       insn =3D aarch64_insn_encode_immediate(AARCH64_INSN_IMM_16, insn,=
 imm);
> > -     *place =3D cpu_to_le32(insn);
> > +     le_insn =3D cpu_to_le32(insn);
> > +     write(place, &le_insn, sizeof(le_insn));
>
> we're forced into passing &le_insn because we need the same function
> prototype as memcpy().
>
> Instead, how about we pass the 'struct module *mod' pointer down from
> apply_relocate_add()? That's already done for reloc_insn_adrp() and it
> would mean that the above could be written as:
>
>
> static int reloc_insn_movw(struct module *mod, enum aarch64_reloc_op op,
>                            __le32 *place, u64 val, int lsb,
>                            enum aarch64_insn_movw_imm_type imm_type)
> {
>         ...
>
>         insn =3D aarch64_insn_encode_immediate(AARCH64_INSN_IMM_16, insn,=
 imm);
>         insn =3D cpu_to_le32(insn);
>
>         if (mod->state !=3D MODULE_STATE_UNFORMED)
>                 aarch64_insn_set(place, insn, sizeof(insn));
>         else
>                 *place =3D insn;
>
>
> meaning we can also drop the first patch, because I don't think we need
> a text_poke() helper.

Dropped the first patch in v4 and switched to the method suggested
here, so we use a normal assignment for the non-late case. Though, it
does seem a little repetitive, with 6 different sites doing this
module state check. If having a straightforward assignment directly in
the reloc_* functions isn't too important, I wonder if we can make
local memset/memcpy-like helpers to contain this check? Like:

static void *write_insn(void *place, u32 insn, struct module *me);
static void *write_data(void *place, s64 *sval, struct module *me);

>
> > +int apply_relocate_add(Elf64_Shdr *sechdrs,
> > +                    const char *strtab,
> > +                    unsigned int symindex,
> > +                    unsigned int relsec,
> > +                    struct module *me)
> > +{
> > +     int ret;
> > +     bool early =3D me->state =3D=3D MODULE_STATE_UNFORMED;
> > +     void *(*write)(void *, const void *, size_t) =3D memcpy;
> > +
> > +     if (!early) {
> > +             write =3D text_poke;
> > +             mutex_lock(&text_mutex);
> > +     }
> > +
> > +     ret =3D __apply_relocate_add(sechdrs, strtab, symindex, relsec, m=
e,
> > +                                write);
> > +
> > +     if (!early)
> > +             mutex_unlock(&text_mutex);
>
> Why is the responsibility of the arch code to take the 'text_mutex' here?
> The core code should be able to do that when the module state is !=3D
> MODULE_STATE_UNFORMED.
>

Moved the locking to kernel/livepatch/core.c in v4, since other call
sites to apply_relocate_add() don't attempt late relocations. Since
the locking was already being done in the x86 module code I had to
remove this. It also made sense to me to split out the text_mutex
changes into a separate patch because they only touch module/x86 and
livepatch code, so that's how I did it in v4. But they can just as
easily be squashed into one patch.

Thanks,
Dylan
