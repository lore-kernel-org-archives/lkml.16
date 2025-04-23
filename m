Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3475B1F8AC8
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 22:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745449192; cv=none; b=RIb1S7BxJMOWo1ja9L3G6wx0hxbMaWklonts+8y3dcUI8xCFgWcVINzGh4HrAzt4J9GM4NxDYqTCPxqi8W7ciNYOgoTSRLF0g3joLKHk7OKMwbPOirwBF1ZsdmofvV0Jbzib+gFvJzdPavBm5MQNOoKTpWdDNg8XQZ4ZBtALrhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745449192; c=relaxed/simple;
	bh=UrD/g0t/8k3InoMpafBwjPiw0iqI+bkhuZGrs7NEvCg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MKZ0EaV7h7gGF2UMu8YZMRn1/7Y45s0Bc1DKplrj9Iozd4qyMbXP0uOlzibj8IxdY8B2qE2WOCPcamsCxWvLe8lHgDZmr81sseRH4VwO+evBB8+D5AVxtzC8usoiAeyRqo9NXAXq8xedUMjjXgDLpSecWaJhlx584yMzLiuV4d4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hin7kFMK; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hin7kFMK"
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-523d8c024dfso183456e0c.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 15:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745449189; x=1746053989; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dXoZ2ZNwDhcNR07/SzFu2ZabtndHTESSbkDsuYdq6Zo=;
        b=hin7kFMKjBjEKSNknaj1LZpA2BYkarQoWlVdwoIoCif5Q5rsVOH4CygREQbrwT96Gq
         +JWHGyYm30n8z4wC7R6TGP5/RMpSK+OfTGi2rQqYaC4BmFzUA+Nb3wSChGVWQf7t8v+c
         gh087H1JE5w3UJ2FNi4EM1bIv/Uxsdo1FoTi5rkU7xK816ab6UIduVX3dnVQBvA2Ostj
         sHSzgKcqhlw16rs1uWTlGhGVkIHxSDlfDFrofCHRfZ+/7H+vMxxMrpnwW7q3MhgXl7ew
         DRe6dQnb2Do5cvFx6Bc+EILMECVhR7WBB7kDkPbmcJRl7Nq6Sal3tNA35Kc4BCKvTi8A
         91lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745449189; x=1746053989;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dXoZ2ZNwDhcNR07/SzFu2ZabtndHTESSbkDsuYdq6Zo=;
        b=dWKBHw+F63Qaen90VHGI6qM+xiw7RoWPWDTK0ZzdGT0kFfhqowx9vtTwFyL8vGMZNk
         1NGCEg/I7N47ACwUzYySDG07j2z4A9sRecokID6SKVQJeCkSUdCUAv/tYwDiUOUcyJr+
         08k1RoSYgClVLgiTjKVTHj7W0OjL2AUrgkTgi4u5kqX5L0PANApiuxxJXZNQmTtp8CPb
         6kr7ZrE/IebXneIGxxOgNaG+GOzRdqCAM0F1oSYx/J54ParJHfYLapVIwchnrFVbNa3n
         IdOGNcvxLONasoab4IR3bMdr50VQ/GV/XeEfUFGi4WCdQnbWw7eZcK3P9a9GjZuPA6JK
         kcCg==
X-Forwarded-Encrypted: i=1; AJvYcCV+/A0nw0XC1n3CM9eBpgULRrf7MU4E7cBZOW7g0kNoJsFARmgq0iSnQAi8Lk+cVVIAXg3vVwfauvJkSh0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKw8ZlGAqaZ3koYNA6fLVzxRbfLLpjerTGUbQK9dTvuez/sLhr
	WwPW1BCNiUarakeIE08QrG95g3pZpXfCwl1h9KrHWI1Aill6sgjUnFzYJccvlFDcevk7p4OESU9
	ZZ7+lV/bqkDm23M0E7LnBRMM1iZqiaZGJCXDM
X-Gm-Gg: ASbGncv9okTns+EOos6FZH8v/fM74dwYkaNSAxPC498wBcrVG5qmIQLiYr+zQiBTrk4
	6QUTC4EsHUP6qntY/1HIcMSMMuHs0RH9uSSKRDY7N65l+bIc7AxfFtsnWkRj8Ui+ZV9NqqKCzIy
	bI5CvSArJJjMKexeKYJx59fA==
X-Google-Smtp-Source: AGHT+IF60M8+ZNsWDyo47bTzOIYyhaVz5mclHJ/84MXkiPlA3bkadWKzAEzX7gG6htJoRI19TAQDjOHSQqBFbftMELk=
X-Received: by 2002:a05:6122:1ad0:b0:525:9ddc:381a with SMTP id
 71dfb90a1353d-52a78370ad2mr532588e0c.6.1745449188595; Wed, 23 Apr 2025
 15:59:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250412010940.1686376-1-dylanbhatch@google.com>
 <20250412010940.1686376-3-dylanbhatch@google.com> <TY4PR01MB1377739F1CC08549A619C8635D7BA2@TY4PR01MB13777.jpnprd01.prod.outlook.com>
In-Reply-To: <TY4PR01MB1377739F1CC08549A619C8635D7BA2@TY4PR01MB13777.jpnprd01.prod.outlook.com>
From: Dylan Hatch <dylanbhatch@google.com>
Date: Wed, 23 Apr 2025 15:59:37 -0700
X-Gm-Features: ATxdqUFYl-jdgZq2Dd_zI0bKdRlzsLg7pLKGs1yzI7EMMR3HJl_TD7140ifhmrU
Message-ID: <CADBMgpyJLM91ZaPZQmzKoDghxpVvsfXjAe83k_tnNAkWnu_Rsw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64/module: Use text-poke API for late relocations.
To: "Toshiyuki Sato (Fujitsu)" <fj6611ie@fujitsu.com>
Cc: Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Puranjay Mohan <puranjay@kernel.org>, 
	Xu Kuohai <xukuohai@huaweicloud.com>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Song Liu <song@kernel.org>, 
	Ard Biesheuvel <ardb@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Toshiyuki,

On Tue, Apr 22, 2025 at 11:05=E2=80=AFPM Toshiyuki Sato (Fujitsu)
<fj6611ie@fujitsu.com> wrote:
>
> Hi Dylan,
>
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
> >
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
> >       s64 sval =3D do_reloc(op, place, val);
> >
> > @@ -66,7 +69,7 @@ static int reloc_data(enum aarch64_reloc_op op, void =
*place, u64 val, int len)
> >
> >       switch (len) {
> >       case 16:
> > -             *(s16 *)place =3D sval;
> > +             write(place, &sval, sizeof(s16));
> >               switch (op) {
> >               case RELOC_OP_ABS:
> >                       if (sval < 0 || sval > U16_MAX)
> > @@ -82,7 +85,7 @@ static int reloc_data(enum aarch64_reloc_op op, void =
*place, u64 val, int len)
> >               }
> >               break;
> >       case 32:
> > -             *(s32 *)place =3D sval;
> > +             write(place, &sval, sizeof(s32));
> >               switch (op) {
> >               case RELOC_OP_ABS:
> >                       if (sval < 0 || sval > U32_MAX)
> > @@ -98,7 +101,7 @@ static int reloc_data(enum aarch64_reloc_op op, void=
 *place, u64 val, int len)
> >               }
> >               break;
> >       case 64:
> > -             *(s64 *)place =3D sval;
> > +             write(place, &sval, sizeof(s64));
> >               break;
> >       default:
> >               pr_err("Invalid length (%d) for data relocation\n", len);
> > @@ -113,11 +116,13 @@ enum aarch64_insn_movw_imm_type {
> >  };
> >
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
> >
> >       if (imm > U16_MAX)
> >               return -ERANGE;
> > @@ -154,11 +160,13 @@ static int reloc_insn_movw(enum aarch64_reloc_op =
op, __le32 *place, u64 val,
> >  }
> >
> >  static int reloc_insn_imm(enum aarch64_reloc_op op, __le32 *place, u64=
 val,
> > -                       int lsb, int len, enum aarch64_insn_imm_type im=
m_type)
> > +                       int lsb, int len, enum aarch64_insn_imm_type im=
m_type,
> > +                       void *(*write)(void *dest, const void *src, siz=
e_t len))
> >  {
> >       u64 imm, imm_mask;
> >       s64 sval;
> >       u32 insn =3D le32_to_cpu(*place);
> > +     __le32 le_insn;
> >
> >       /* Calculate the relocation value. */
> >       sval =3D do_reloc(op, place, val);
> > @@ -170,7 +178,8 @@ static int reloc_insn_imm(enum aarch64_reloc_op op,=
 __le32 *place, u64 val,
> >
> >       /* Update the instruction's immediate field. */
> >       insn =3D aarch64_insn_encode_immediate(imm_type, insn, imm);
> > -     *place =3D cpu_to_le32(insn);
> > +     le_insn =3D cpu_to_le32(insn);
> > +     write(place, &le_insn, sizeof(le_insn));
> >
> >       /*
> >        * Extract the upper value bits (including the sign bit) and
> > @@ -189,17 +198,19 @@ static int reloc_insn_imm(enum aarch64_reloc_op o=
p, __le32 *place, u64 val,
> >  }
> >
> >  static int reloc_insn_adrp(struct module *mod, Elf64_Shdr *sechdrs,
> > -                        __le32 *place, u64 val)
> > +                        __le32 *place, u64 val,
> > +                        void *(*write)(void *dest, const void *src, si=
ze_t len))
> >  {
> >       u32 insn;
> > +     __le32 le_insn;
> >
> >       if (!is_forbidden_offset_for_adrp(place))
> >               return reloc_insn_imm(RELOC_OP_PAGE, place, val, 12, 21,
> > -                                   AARCH64_INSN_IMM_ADR);
> > +                                   AARCH64_INSN_IMM_ADR, write);
> >
> >       /* patch ADRP to ADR if it is in range */
> >       if (!reloc_insn_imm(RELOC_OP_PREL, place, val & ~0xfff, 0, 21,
> > -                         AARCH64_INSN_IMM_ADR)) {
> > +                         AARCH64_INSN_IMM_ADR, write)) {
> >               insn =3D le32_to_cpu(*place);
> >               insn &=3D ~BIT(31);
> >       } else {
> > @@ -211,15 +222,17 @@ static int reloc_insn_adrp(struct module *mod, El=
f64_Shdr *sechdrs,
> >                                                  AARCH64_INSN_BRANCH_NO=
LINK);
> >       }
> >
> > -     *place =3D cpu_to_le32(insn);
> > +     le_insn =3D cpu_to_le32(insn);
> > +     write(place, &le_insn, sizeof(le_insn));
> >       return 0;
> >  }
> >
> > -int apply_relocate_add(Elf64_Shdr *sechdrs,
> > +static int __apply_relocate_add(Elf64_Shdr *sechdrs,
> >                      const char *strtab,
> >                      unsigned int symindex,
> >                      unsigned int relsec,
> > -                    struct module *me)
> > +                    struct module *me,
> > +                    void *(*write)(void *dest, const void *src, size_t=
 len))
> >  {
> >       unsigned int i;
> >       int ovf;
> > @@ -255,23 +268,23 @@ int apply_relocate_add(Elf64_Shdr *sechdrs,
> >               /* Data relocations. */
> >               case R_AARCH64_ABS64:
> >                       overflow_check =3D false;
> > -                     ovf =3D reloc_data(RELOC_OP_ABS, loc, val, 64);
> > +                     ovf =3D reloc_data(RELOC_OP_ABS, loc, val, 64, wr=
ite);
> >                       break;
> >               case R_AARCH64_ABS32:
> > -                     ovf =3D reloc_data(RELOC_OP_ABS, loc, val, 32);
> > +                     ovf =3D reloc_data(RELOC_OP_ABS, loc, val, 32, wr=
ite);
> >                       break;
> >               case R_AARCH64_ABS16:
> > -                     ovf =3D reloc_data(RELOC_OP_ABS, loc, val, 16);
> > +                     ovf =3D reloc_data(RELOC_OP_ABS, loc, val, 16, wr=
ite);
> >                       break;
> >               case R_AARCH64_PREL64:
> >                       overflow_check =3D false;
> > -                     ovf =3D reloc_data(RELOC_OP_PREL, loc, val, 64);
> > +                     ovf =3D reloc_data(RELOC_OP_PREL, loc, val, 64, w=
rite);
> >                       break;
> >               case R_AARCH64_PREL32:
> > -                     ovf =3D reloc_data(RELOC_OP_PREL, loc, val, 32);
> > +                     ovf =3D reloc_data(RELOC_OP_PREL, loc, val, 32, w=
rite);
> >                       break;
> >               case R_AARCH64_PREL16:
> > -                     ovf =3D reloc_data(RELOC_OP_PREL, loc, val, 16);
> > +                     ovf =3D reloc_data(RELOC_OP_PREL, loc, val, 16, w=
rite);
> >                       break;
> >
> >               /* MOVW instruction relocations. */
> > @@ -280,88 +293,88 @@ int apply_relocate_add(Elf64_Shdr *sechdrs,
> >                       fallthrough;
> >               case R_AARCH64_MOVW_UABS_G0:
> >                       ovf =3D reloc_insn_movw(RELOC_OP_ABS, loc, val, 0=
,
> > -                                           AARCH64_INSN_IMM_MOVKZ);
> > +                                           AARCH64_INSN_IMM_MOVKZ, wri=
te);
> >                       break;
> >               case R_AARCH64_MOVW_UABS_G1_NC:
> >                       overflow_check =3D false;
> >                       fallthrough;
> >               case R_AARCH64_MOVW_UABS_G1:
> >                       ovf =3D reloc_insn_movw(RELOC_OP_ABS, loc, val, 1=
6,
> > -                                           AARCH64_INSN_IMM_MOVKZ);
> > +                                           AARCH64_INSN_IMM_MOVKZ, wri=
te);
> >                       break;
> >               case R_AARCH64_MOVW_UABS_G2_NC:
> >                       overflow_check =3D false;
> >                       fallthrough;
> >               case R_AARCH64_MOVW_UABS_G2:
> >                       ovf =3D reloc_insn_movw(RELOC_OP_ABS, loc, val, 3=
2,
> > -                                           AARCH64_INSN_IMM_MOVKZ);
> > +                                           AARCH64_INSN_IMM_MOVKZ, wri=
te);
> >                       break;
> >               case R_AARCH64_MOVW_UABS_G3:
> >                       /* We're using the top bits so we can't overflow.=
 */
> >                       overflow_check =3D false;
> >                       ovf =3D reloc_insn_movw(RELOC_OP_ABS, loc, val, 4=
8,
> > -                                           AARCH64_INSN_IMM_MOVKZ);
> > +                                           AARCH64_INSN_IMM_MOVKZ, wri=
te);
> >                       break;
> >               case R_AARCH64_MOVW_SABS_G0:
> >                       ovf =3D reloc_insn_movw(RELOC_OP_ABS, loc, val, 0=
,
> > -                                           AARCH64_INSN_IMM_MOVNZ);
> > +                                           AARCH64_INSN_IMM_MOVNZ, wri=
te);
> >                       break;
> >               case R_AARCH64_MOVW_SABS_G1:
> >                       ovf =3D reloc_insn_movw(RELOC_OP_ABS, loc, val, 1=
6,
> > -                                           AARCH64_INSN_IMM_MOVNZ);
> > +                                           AARCH64_INSN_IMM_MOVNZ, wri=
te);
> >                       break;
> >               case R_AARCH64_MOVW_SABS_G2:
> >                       ovf =3D reloc_insn_movw(RELOC_OP_ABS, loc, val, 3=
2,
> > -                                           AARCH64_INSN_IMM_MOVNZ);
> > +                                           AARCH64_INSN_IMM_MOVNZ, wri=
te);
> >                       break;
> >               case R_AARCH64_MOVW_PREL_G0_NC:
> >                       overflow_check =3D false;
> >                       ovf =3D reloc_insn_movw(RELOC_OP_PREL, loc, val, =
0,
> > -                                           AARCH64_INSN_IMM_MOVKZ);
> > +                                           AARCH64_INSN_IMM_MOVKZ, wri=
te);
> >                       break;
> >               case R_AARCH64_MOVW_PREL_G0:
> >                       ovf =3D reloc_insn_movw(RELOC_OP_PREL, loc, val, =
0,
> > -                                           AARCH64_INSN_IMM_MOVNZ);
> > +                                           AARCH64_INSN_IMM_MOVNZ, wri=
te);
> >                       break;
> >               case R_AARCH64_MOVW_PREL_G1_NC:
> >                       overflow_check =3D false;
> >                       ovf =3D reloc_insn_movw(RELOC_OP_PREL, loc, val, =
16,
> > -                                           AARCH64_INSN_IMM_MOVKZ);
> > +                                           AARCH64_INSN_IMM_MOVKZ, wri=
te);
> >                       break;
> >               case R_AARCH64_MOVW_PREL_G1:
> >                       ovf =3D reloc_insn_movw(RELOC_OP_PREL, loc, val, =
16,
> > -                                           AARCH64_INSN_IMM_MOVNZ);
> > +                                           AARCH64_INSN_IMM_MOVNZ, wri=
te);
> >                       break;
> >               case R_AARCH64_MOVW_PREL_G2_NC:
> >                       overflow_check =3D false;
> >                       ovf =3D reloc_insn_movw(RELOC_OP_PREL, loc, val, =
32,
> > -                                           AARCH64_INSN_IMM_MOVKZ);
> > +                                           AARCH64_INSN_IMM_MOVKZ, wri=
te);
> >                       break;
> >               case R_AARCH64_MOVW_PREL_G2:
> >                       ovf =3D reloc_insn_movw(RELOC_OP_PREL, loc, val, =
32,
> > -                                           AARCH64_INSN_IMM_MOVNZ);
> > +                                           AARCH64_INSN_IMM_MOVNZ, wri=
te);
> >                       break;
> >               case R_AARCH64_MOVW_PREL_G3:
> >                       /* We're using the top bits so we can't overflow.=
 */
> >                       overflow_check =3D false;
> >                       ovf =3D reloc_insn_movw(RELOC_OP_PREL, loc, val, =
48,
> > -                                           AARCH64_INSN_IMM_MOVNZ);
> > +                                           AARCH64_INSN_IMM_MOVNZ, wri=
te);
> >                       break;
> >
> >               /* Immediate instruction relocations. */
> >               case R_AARCH64_LD_PREL_LO19:
> >                       ovf =3D reloc_insn_imm(RELOC_OP_PREL, loc, val, 2=
, 19,
> > -                                          AARCH64_INSN_IMM_19);
> > +                                          AARCH64_INSN_IMM_19, write);
> >                       break;
> >               case R_AARCH64_ADR_PREL_LO21:
> >                       ovf =3D reloc_insn_imm(RELOC_OP_PREL, loc, val, 0=
, 21,
> > -                                          AARCH64_INSN_IMM_ADR);
> > +                                          AARCH64_INSN_IMM_ADR, write)=
;
> >                       break;
> >               case R_AARCH64_ADR_PREL_PG_HI21_NC:
> >                       overflow_check =3D false;
> >                       fallthrough;
> >               case R_AARCH64_ADR_PREL_PG_HI21:
> > -                     ovf =3D reloc_insn_adrp(me, sechdrs, loc, val);
> > +                     ovf =3D reloc_insn_adrp(me, sechdrs, loc, val, wr=
ite);
> >                       if (ovf && ovf !=3D -ERANGE)
> >                               return ovf;
> >                       break;
> > @@ -369,46 +382,46 @@ int apply_relocate_add(Elf64_Shdr *sechdrs,
> >               case R_AARCH64_LDST8_ABS_LO12_NC:
> >                       overflow_check =3D false;
> >                       ovf =3D reloc_insn_imm(RELOC_OP_ABS, loc, val, 0,=
 12,
> > -                                          AARCH64_INSN_IMM_12);
> > +                                          AARCH64_INSN_IMM_12, write);
> >                       break;
> >               case R_AARCH64_LDST16_ABS_LO12_NC:
> >                       overflow_check =3D false;
> >                       ovf =3D reloc_insn_imm(RELOC_OP_ABS, loc, val, 1,=
 11,
> > -                                          AARCH64_INSN_IMM_12);
> > +                                          AARCH64_INSN_IMM_12, write);
> >                       break;
> >               case R_AARCH64_LDST32_ABS_LO12_NC:
> >                       overflow_check =3D false;
> >                       ovf =3D reloc_insn_imm(RELOC_OP_ABS, loc, val, 2,=
 10,
> > -                                          AARCH64_INSN_IMM_12);
> > +                                          AARCH64_INSN_IMM_12, write);
> >                       break;
> >               case R_AARCH64_LDST64_ABS_LO12_NC:
> >                       overflow_check =3D false;
> >                       ovf =3D reloc_insn_imm(RELOC_OP_ABS, loc, val, 3,=
 9,
> > -                                          AARCH64_INSN_IMM_12);
> > +                                          AARCH64_INSN_IMM_12, write);
> >                       break;
> >               case R_AARCH64_LDST128_ABS_LO12_NC:
> >                       overflow_check =3D false;
> >                       ovf =3D reloc_insn_imm(RELOC_OP_ABS, loc, val, 4,=
 8,
> > -                                          AARCH64_INSN_IMM_12);
> > +                                          AARCH64_INSN_IMM_12, write);
> >                       break;
> >               case R_AARCH64_TSTBR14:
> >                       ovf =3D reloc_insn_imm(RELOC_OP_PREL, loc, val, 2=
, 14,
> > -                                          AARCH64_INSN_IMM_14);
> > +                                          AARCH64_INSN_IMM_14, write);
> >                       break;
> >               case R_AARCH64_CONDBR19:
> >                       ovf =3D reloc_insn_imm(RELOC_OP_PREL, loc, val, 2=
, 19,
> > -                                          AARCH64_INSN_IMM_19);
> > +                                          AARCH64_INSN_IMM_19, write);
> >                       break;
> >               case R_AARCH64_JUMP26:
> >               case R_AARCH64_CALL26:
> >                       ovf =3D reloc_insn_imm(RELOC_OP_PREL, loc, val, 2=
, 26,
> > -                                          AARCH64_INSN_IMM_26);
> > +                                          AARCH64_INSN_IMM_26, write);
> >                       if (ovf =3D=3D -ERANGE) {
> >                               val =3D module_emit_plt_entry(me, sechdrs=
, loc, &rel[i], sym);
> >                               if (!val)
> >                                       return -ENOEXEC;
> >                               ovf =3D reloc_insn_imm(RELOC_OP_PREL, loc=
, val, 2,
> > -                                                  26, AARCH64_INSN_IMM=
_26);
> > +                                                  26, AARCH64_INSN_IMM=
_26, write);
> >                       }
> >                       break;
> >
> > @@ -431,6 +444,30 @@ int apply_relocate_add(Elf64_Shdr *sechdrs,
> >       return -ENOEXEC;
> >  }
> >
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
> > +
> > +     return ret;
> > +}
> > +
> >  static inline void __init_plt(struct plt_entry *plt, unsigned long add=
r)
> >  {
> >       *plt =3D get_plt_entry(addr, plt);
> > --
> > 2.49.0.604.gff1f9ca942-goog
>
> Thanks for posting the patch.
> We are testing this patch using two types of kernels.
> Both kernels are based on version 6.13, one is patched to use the sframe =
unwinder
> in livepatch [1], the other is patched to not use sframe [2].
>
> [1] https://lore.kernel.org/all/20250127213310.2496133-1-wnliu@google.com=
/
> [2] https://lore.kernel.org/linux-arm-kernel/20250320171559.3423224-1-son=
g@kernel.org/
>
> For testing, we used a kpatch for arm64 [3] and the package's integration=
 tests.
> In an environment where only the livepatch patch was applied,
> "module-LOADED.test" failed, but after applying this patch, it passed.
> Here are the comments on the test results:[4]
>
> [3] https://github.com/dynup/kpatch/pull/1439
> [4] https://github.com/dynup/kpatch/pull/1439#issuecomment-2781731440

Thanks for the help with testing here.

> I just want to confirm one thing.
> I think the issues this patch solves are the same as those in the previou=
sly
> posted patch [5].
> Am I correct in understanding that this is an improved version?

I wasn't aware the patch [5] existed, thanks for the link.

> Furthermore, this patch also supports rewriting data relocation sections,
> which the previously posted patch did not support.

Yes, this is correct. From this perspective, this patch is an improvement.

>
> [5] https://lore.kernel.org/linux-arm-kernel/20211103210709.31790-1-suraj=
js@amazon.com/
>
> Tested-by: Toshiyuki Sato <fj6611ie@aa.jp.fujitsu.com>
>
> Regards,
> Toshiyuki Sato
>

Thanks,
Dylan
