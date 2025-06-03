Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB1211DDA1E
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 17:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748971521; cv=none; b=SnGR7qQkyu4xgDtN5wXcX9k5sCsy+K6AgyMj0/OHSfkmNKs98AXDuPGbJk814flBGgAtRse2+McKd6BLZXIyXFcjbXlV3og4/2uw0hW5YDVKDugBqW4d9XHQFMCq3NH6ex5iN9qNfD++gHi1+KZxPE3v/XRrn9jFoHazYAfAxUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748971521; c=relaxed/simple;
	bh=h90cw/6QoeEFHlmpvTv3+6hC+f5XG9BjEBJiuRWkMts=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mZ5eCiy3LH5AR9XWsIxPwe1T6Ski8DCJEjYwho230q4S24YBNvwmU1qof7zbmjZYWr40a+dBFNkt7I6d0Epbs4pF9QgzndkR56XSBl4iwdnrl1PhQ0/5C9WJ/44sqioo+1kV32Y4SGsvfwSXgAo2d+mXCI22dE4xhEHB6AaExHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NqoYJOCi; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NqoYJOCi"
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5240a432462so39270e0c.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 10:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748971519; x=1749576319; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mPu057m0M5Z85V1gGXBsQTxBZdBxUkE8ENrmzPe4ALE=;
        b=NqoYJOCiBbOHcq8oi57jHYA+gKB4xaNxAah1r0kTwOlqh2J4V0yiCMNPi6hB8eTgPZ
         W8ZPfN6b2flZgESvJma32ndcbnN3EfPJxtDxDU+EE8Uk97Zib+hOz00HaPiO8LnaygbE
         46o2iL9+MAkQtYj+/fuquilQMvvrlhaoYEJHcixU92Wsq0MbLzUOu9XSyB6N0AyD0pnO
         mlxuwsnQ2qYaQygLw5SdjYOBPcUR+lavJWYRtDoE/u7MRrfquMjTdjvzrPzPNN8njvgq
         A5wd7/JxkGoT89UnHuF8bC8WIDAEPNP77HVp/yEPt2gVkoyVXQMRfuLdpXSj/ArUOG0O
         MhdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748971519; x=1749576319;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mPu057m0M5Z85V1gGXBsQTxBZdBxUkE8ENrmzPe4ALE=;
        b=GKElhl7prQgb3VUshXgYI2fjA1fEd/dQI5g0wz4J43F65khvfhiiHUU9wIGMa7x8uK
         O1eVAsh3eGAP6U8YJo+hXDjB2xqUyk28FjiIPZCHsm3c0djFwJHEgVBEoOnxvNcHN7R2
         fLlqjeQeDtLyjTrR1DAk2N8hAt5fuP1jDOVATqN7liNjgUGxkua4PgdEyZlK0oswsa1W
         r+IlreZYG3oqbG8une4B5dEyw4LeBMsvLRMmukgnaPP1lH1aATSmn274yb8jAe2t4+Gc
         dubrRdVGU+HwORXkGByJGqUWTCtfeMKqDXJ9jA3EakELZwPxJq5gVTWNFA2U+28XOVHR
         7wwA==
X-Forwarded-Encrypted: i=1; AJvYcCXHQUVML/2ShnqBLXnatf3h/Bkvsy3Y76C6AIF8aHy+ziSvcQ7XyYhv6jD7AJkMVeKXdecntPclJpz1zCs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMOoNMQBvBvpJHzGuuvPAgqO+OP/8GgQ7BRtICJHZEJK8ucTMa
	JDgHMFa+kL2mLdM5AfBJEyRH8mIsr280i6GfLI6TVoBV1hjWpOAaXpDCNJyKamd/fa/yS57wP4a
	CgZOvk8PLtMIjbNZOLRkujQMIvpl9CXqHuhwrACRj
X-Gm-Gg: ASbGncsH4EQgkwZ/czcGEQN8UwrK7hS8Xep1mC60k2VXuw21M0Sd7xVITNVQOZTSD4F
	Yjf3NvVeCb4ULKmfoyGNzFqN3Xr0Mi7DrG9Wvf7x6rvptjuuz4ZayqTM9tnj/dIvS/2cJxQFz/l
	dnDMFBuNxv9BaiYWYHcS0jIZoA+vav5PboFJK6N8BD5bVE9xHUCyDJVUR7vNdlT4Xj798Z48Vfn
	w==
X-Google-Smtp-Source: AGHT+IFSnKx7PV6xaaSh7fZTbkb7kPMU3rbQqfKSe65+cXZyNVr6BfBTcxpPzg9IDWREAcnB1sMGmEcYrZdMzRkJpHA=
X-Received: by 2002:a05:6122:470f:b0:52d:beeb:c6a3 with SMTP id
 71dfb90a1353d-530ba1d932emr3188572e0c.1.1748971518522; Tue, 03 Jun 2025
 10:25:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250530000044.341911-1-dylanbhatch@google.com>
 <20250530141325.GA30733@willie-the-truck> <CADBMgpx==FnFj4okXs1n3NPngh7Os1YpnGrDDe8z_t2X7bzOOQ@mail.gmail.com>
 <20250603151319.GA2611@willie-the-truck>
In-Reply-To: <20250603151319.GA2611@willie-the-truck>
From: Dylan Hatch <dylanbhatch@google.com>
Date: Tue, 3 Jun 2025 10:25:07 -0700
X-Gm-Features: AX0GCFtBaqvLhLw1g5o6yB_waFO9tC1BodRPARumIVGBpRyvz_jmEzOJS_umYAY
Message-ID: <CADBMgpzrQs=U8xXbD_Em5=P1=FnqtcC4uO0jDHqkF19CPng3Kg@mail.gmail.com>
Subject: Re: [PATCH v5] arm64/module: Use text-poke API for late relocations.
To: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Song Liu <song@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Roman Gushchin <roman.gushchin@linux.dev>, 
	Toshiyuki Sato <fj6611ie@aa.jp.fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 3, 2025 at 8:13=E2=80=AFAM Will Deacon <will@kernel.org> wrote:
>
> Hey Dylan,
>
> On Fri, May 30, 2025 at 05:11:00PM -0700, Dylan Hatch wrote:
> > On Fri, May 30, 2025 at 7:13=E2=80=AFAM Will Deacon <will@kernel.org> w=
rote:
> > >
> > > and this would be:
> > >
> > >         WRITE_PLACE(place, cpu_to_le32(insn), me);
> > >
> >
> > I'm seeing this part give a build error:
> >
> > arch/arm64/kernel/module.c:158:2: error: cannot take the address of an
> > rvalue of type '__le32' (aka 'unsigned int')
> >   158 |         WRITE_PLACE(place, cpu_to_le32(insn), me);
> >       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > arch/arm64/kernel/module.c:56:28: note: expanded from macro 'WRITE_PLAC=
E'
> >    56 |                 aarch64_insn_copy(place, &(val),
> > sizeof(*place));       \
> >       |                                          ^ ~~~
> >
> > I can't think of a clean way to get around this and still keep a
> > combined write helper. Setting an intermediate __le32 in the
> > reloc_insn_* functions would work but we were trying to avoid that.
> > Setting an intermediate value inside WRITE_PLACE would also work but
> > then (I think) it won't work for the data relocations because we'd be
> > converting a signed into unsigned value. Making WRITE_PLACE a function
> > instead of a macro also fixes the rvalue problem but then the args
> > 'place' and 'val' have to be of a fixed type so we can't do the
> > typecasting on 'place' and 'val' has the same signed/unsigned value
> > problem.
> >
> > Do you have a suggestion here? In the meantime I can send a v6 that
> > uses an intermediate __le32 for the instruction relocations.
>
> Sorry for the slow reply -- I see you already sent a v6. I think we
> could add a temporary in the macro. Diff below (on top of your v6). WDYT?
>
> Will
>
> --->8
>
> diff --git a/arch/arm64/kernel/module.c b/arch/arm64/kernel/module.c
> index 862f6d50ab00..40148d2725ce 100644
> --- a/arch/arm64/kernel/module.c
> +++ b/arch/arm64/kernel/module.c
> @@ -50,10 +50,12 @@ static u64 do_reloc(enum aarch64_reloc_op reloc_op, _=
_le32 *place, u64 val)
>  }
>
>  #define WRITE_PLACE(place, val, mod) do {                              \
> +       __typeof__(val) __val =3D (val);                                 =
 \
> +                                                                       \
>         if (mod->state =3D=3D MODULE_STATE_UNFORMED)                     =
   \
> -               *(place) =3D val;                                        =
 \
> +               *(place) =3D __val;                                      =
 \
>         else                                                            \
> -               aarch64_insn_copy(place, &(val), sizeof(*place));       \
> +               aarch64_insn_copy(place, &(__val), sizeof(*place));     \
>  } while (0)
>
>  static int reloc_data(enum aarch64_reloc_op op, void *place, u64 val, in=
t len,
> @@ -128,7 +130,6 @@ static int reloc_insn_movw(enum aarch64_reloc_op op, =
__le32 *place, u64 val,
>         u64 imm;
>         s64 sval;
>         u32 insn =3D le32_to_cpu(*place);
> -       __le32 le_insn;
>
>         sval =3D do_reloc(op, place, val);
>         imm =3D sval >> lsb;
> @@ -156,8 +157,7 @@ static int reloc_insn_movw(enum aarch64_reloc_op op, =
__le32 *place, u64 val,
>
>         /* Update the instruction with the new encoding. */
>         insn =3D aarch64_insn_encode_immediate(AARCH64_INSN_IMM_16, insn,=
 imm);
> -       le_insn =3D cpu_to_le32(insn);
> -       WRITE_PLACE(place, le_insn, me);
> +       WRITE_PLACE(place, cpu_to_le32(insn), me);
>
>         if (imm > U16_MAX)
>                 return -ERANGE;
> @@ -172,7 +172,6 @@ static int reloc_insn_imm(enum aarch64_reloc_op op, _=
_le32 *place, u64 val,
>         u64 imm, imm_mask;
>         s64 sval;
>         u32 insn =3D le32_to_cpu(*place);
> -       __le32 le_insn;
>
>         /* Calculate the relocation value. */
>         sval =3D do_reloc(op, place, val);
> @@ -184,8 +183,7 @@ static int reloc_insn_imm(enum aarch64_reloc_op op, _=
_le32 *place, u64 val,
>
>         /* Update the instruction's immediate field. */
>         insn =3D aarch64_insn_encode_immediate(imm_type, insn, imm);
> -       le_insn =3D cpu_to_le32(insn);
> -       WRITE_PLACE(place, le_insn, me);
> +       WRITE_PLACE(place, cpu_to_le32(insn), me);
>
>         /*
>          * Extract the upper value bits (including the sign bit) and
> @@ -207,7 +205,6 @@ static int reloc_insn_adrp(struct module *mod, Elf64_=
Shdr *sechdrs,
>                            __le32 *place, u64 val, struct module *me)
>  {
>         u32 insn;
> -       __le32 le_insn;
>
>         if (!is_forbidden_offset_for_adrp(place))
>                 return reloc_insn_imm(RELOC_OP_PAGE, place, val, 12, 21,
> @@ -227,8 +224,7 @@ static int reloc_insn_adrp(struct module *mod, Elf64_=
Shdr *sechdrs,
>                                                    AARCH64_INSN_BRANCH_NO=
LINK);
>         }
>
> -       le_insn =3D cpu_to_le32(insn);
> -       WRITE_PLACE(place, le_insn, me);
> +       WRITE_PLACE(place, cpu_to_le32(insn), me);
>         return 0;
>  }
>
>

This looks good to me. I can send a v7 with these changes.

Thanks,
Dylan
