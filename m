Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17DD210E4
	for <linux-kernel@vger.kernel.org>; Sat, 31 May 2025 02:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748660080; cv=none; b=uCzsrF1Km03T0thOWVXMam+5o7sOf622YIjtSYDuMBhptU2EDgt3YgDQpTYrrYCb1ZDbYOtp1HCaHNxvQIQA/MuX7yCod4647ngsXJq/13FEDZxPDgJ8YaS/c0xOS+cZhdBKKr5POzyW+zOLFISLN6ENYgYdesi9MhuA3w/v+u4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748660080; c=relaxed/simple;
	bh=40L5BE0Zh2QvgZzx1WSNHLyoFA+imT4Mq21GuRxB+jk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mRB4oeDN21uJzuTDBZycXVF5yCJ9WypcmV2j9rJVPBYg/OeLLOC7jGXsQzDTNj4nWOJ5q0/OYUtfSiSf/eW+T7nhNN6e2eLu1mdhYIqUCUq6r8kqGdm3u3rRZfeGZDuYng3fpaDazX7z5PfkQsWK9eWOXqdA7BXVtvvIPvO777Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Kwq5mRlD; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Kwq5mRlD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748660076;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4qsLu0lHA7bFYOFOBNnyYxJ9GC4MiYfojGvHdjpDapg=;
	b=Kwq5mRlDybTwh4W3iTipb9Hg9VhScRflRdwd37Xs2FgeOBeDYkXFJYetA0pId2juudFdna
	Aojvf6Wk5nb6+K+eQxWIboo1pFwEiks1ttMStEBWttjzRgxUjc15MVUB7i6MzJqG2TO7uH
	3FcANuVegpXjU9SAq2irvjtfRJmpuYg=
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-492-j20TbdLoOXavxfg5PFkbXQ-1; Fri, 30 May 2025 22:54:35 -0400
X-MC-Unique: j20TbdLoOXavxfg5PFkbXQ-1
X-Mimecast-MFC-AGG-ID: j20TbdLoOXavxfg5PFkbXQ_1748660074
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-4e1060d40f4so600880137.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 19:54:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748660074; x=1749264874;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4qsLu0lHA7bFYOFOBNnyYxJ9GC4MiYfojGvHdjpDapg=;
        b=noUsYzNIceKWtzkdOFsd7cgVmzRuc7YjPz1oS0FDlWfIcRcY/9CKxqpKWNmfBhe8En
         U9UK1GtlgO07b1uhNEzoVfzUPHOOgMKW8+AS/zxFXONyxhjFi4i0bIauijEjp/hK8Y2s
         X1TvMUwBP/j2/9KFWdrHLAzT4PnFqWfcrafREHU5FTl8AJSEOt0wI3kKPzlnV6Yo8Sw4
         UjRDcHEi57efDrJ1tFSj/+qdYbgdgDjQHru3RipOUE7WuMOJWk/thMfiRoai/2LWT7Li
         0xifW4Flu/6+g3BuZUYs+0WfHrXdzybWv83WIqhFMHKKYl7PoCnfb2wQudKegi9Ck+ob
         sJtQ==
X-Gm-Message-State: AOJu0YxWQNu0PJk7fQbZ7UYH7kUv8WT4scN7BufMzRNi1FMXbkrM1Pr8
	jbenN6190hX3ny3lMjXtf9UyI5+h5ahtsTSbvE7R0CfZUQCHpLUc5vUXkpTsZPLKAYRqeiUPdUS
	MN56G9zIrpUYY1FD5xWbRGTv+ZLuDmUI1z76KIH91wafZDHlswp9gxMAkRBW7hU6ePo1A5jGzbE
	c86cqbko20QlgcqDma3ooNGEcTBJ8uA3zE1YJ4MzJn8Y8n0ucMSq4+MA==
X-Gm-Gg: ASbGncu4DRSo7Ap6FhTs7sO5Oiorx8deTVsnOUgzEdecv3bOYzvJsv/rNrbaHNRNDKD
	GngOzXcbm7GS9/M2n5eEIEVyndQl3rTvJGACw/ZTUpJjzGe1bqIiTlrpRKjZxw2HOqqM=
X-Received: by 2002:a05:6122:17a0:b0:530:7ab8:49ab with SMTP id 71dfb90a1353d-53093308211mr348054e0c.0.1748660074503;
        Fri, 30 May 2025 19:54:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGHcGwqJFNf5deKBMtLwQtfyTH+MhR9a8ovR3jKJ2pIlVWWhPNfkdppfZjC2sxSJINu81RBblF+tPuimE1o5hY=
X-Received: by 2002:a05:6122:17a0:b0:530:7ab8:49ab with SMTP id
 71dfb90a1353d-53093308211mr348047e0c.0.1748660074155; Fri, 30 May 2025
 19:54:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250530211422.784415-1-cmirabil@redhat.com> <20250530211422.784415-2-cmirabil@redhat.com>
 <aDpq7kqJUyAjad9F@ghost>
In-Reply-To: <aDpq7kqJUyAjad9F@ghost>
From: Charles Mirabile <cmirabil@redhat.com>
Date: Fri, 30 May 2025 22:54:23 -0400
X-Gm-Features: AX0GCFu8cygWIhwriOzSHAzT63d4ZkJQlHOU6N0ITQKTtG-BnG0LOa7a0z-wsGw
Message-ID: <CABe3_aF0U5ej6ctQ0TQzecZ+ayaRSzJPTv5zf6kcD9U95rQXxw@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] riscv: fix runtime constant support for nommu kernels
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, 
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 30, 2025 at 10:35=E2=80=AFPM Charlie Jenkins <charlie@rivosinc.=
com> wrote:
>
> On Fri, May 30, 2025 at 05:14:22PM -0400, Charles Mirabile wrote:
> > the `__runtime_fixup_32` function does not handle the case where `val` =
is
> > zero correctly (as might occur when patching a nommu kernel and referri=
ng
> > to a physical address below the 4GiB boundary whose upper 32 bits are a=
ll
> > zero) because nothing in the existing logic prevents the code from taki=
ng
> > the `else` branch of both nop-checks and emitting two `nop` instruction=
s.
> >
> > This leaves random garbage in the register that is supposed to receive =
the
> > upper 32 bits of the pointer instead of zero that when combined with th=
e
> > value for the lower 32 bits yields an invalid pointer and causes a kern=
el
> > panic when that pointer is eventually accessed.
> >
> > The author clearly considered the fact that if the `lui` is converted i=
nto
> > a `nop` that the second instruction needs to be adjusted to become an `=
li`
> > instead of an `addi`, hence introducing the `addi_insn_mask` variable, =
but
> > didn't follow that logic through fully to the case where the `else` bra=
nch
> > executes. To fix it just adjust the logic to ensure that the second `el=
se`
> > branch is not taken if the first instruction will be patched to a `nop`=
.
>
> You have an accurate assesment here, I missed the zero case :/.
> Thank you for fixing the issue!
>
> >
> > Fixes: a44fb5722199 ("riscv: Add runtime constant support")
> >
> > Signed-off-by: Charles Mirabile <cmirabil@redhat.com>
> > ---
> >  arch/riscv/include/asm/runtime-const.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/riscv/include/asm/runtime-const.h b/arch/riscv/includ=
e/asm/runtime-const.h
> > index 451fd76b8811..d766e2b9e6df 100644
> > --- a/arch/riscv/include/asm/runtime-const.h
> > +++ b/arch/riscv/include/asm/runtime-const.h
> > @@ -206,7 +206,7 @@ static inline void __runtime_fixup_32(__le16 *lui_p=
arcel, __le16 *addi_parcel, u
> >               addi_insn_mask &=3D 0x07fff;
> >       }
> >
> > -     if (lower_immediate & 0x00000fff) {
> > +     if (lower_immediate & 0x00000fff || lui_insn =3D=3D RISCV_INSN_NO=
P4) {
>
> This comment is borderline too nitpicky so feel free to dismiss it :).
> It's slightly wasteful to have this check right after the if-statement
I agree. Your patch definitely works, but the complexity starts to get
kind of hairy though to handle it correctly. Especially given this is
the patching code that only runs once and is not in the hot path.
> that sets it. I am not sure what the most readable way of doing this is
> though. What would you think about a patch like the following instead?
>
> From 1c56536c1e338735140c9090f06da49a3d245a61 Mon Sep 17 00:00:00 2001
> From: Charlie Jenkins <charlie@rivosinc.com>
> Date: Fri, 30 May 2025 19:25:13 -0700
> Subject: [PATCH] alternate fix
>
> ---
>  arch/riscv/include/asm/runtime-const.h | 23 +++++++++++------------
>  1 file changed, 11 insertions(+), 12 deletions(-)
>
> diff --git a/arch/riscv/include/asm/runtime-const.h b/arch/riscv/include/=
asm/runtime-const.h
> index 451fd76b8811..085a0bb26fbb 100644
> --- a/arch/riscv/include/asm/runtime-const.h
> +++ b/arch/riscv/include/asm/runtime-const.h
> @@ -179,12 +179,9 @@ static inline void __runtime_fixup_caches(void *wher=
e, unsigned int insns)
>  static inline void __runtime_fixup_32(__le16 *lui_parcel, __le16 *addi_p=
arcel, unsigned int val)
>  {
>         unsigned int lower_immediate, upper_immediate;
> -       u32 lui_insn, addi_insn, addi_insn_mask;
> +       u32 lui_insn, addi_insn;
>         __le32 lui_res, addi_res;
>
> -       /* Mask out upper 12 bit of addi */
> -       addi_insn_mask =3D 0x000fffff;
> -
>         lui_insn =3D (u32)le16_to_cpu(lui_parcel[0]) | (u32)le16_to_cpu(l=
ui_parcel[1]) << 16;
>         addi_insn =3D (u32)le16_to_cpu(addi_parcel[0]) | (u32)le16_to_cpu=
(addi_parcel[1]) << 16;
>
> @@ -195,6 +192,15 @@ static inline void __runtime_fixup_32(__le16 *lui_pa=
rcel, __le16 *addi_parcel, u
>                 /* replace upper 20 bits of lui with upper immediate */
>                 lui_insn &=3D 0x00000fff;
>                 lui_insn |=3D upper_immediate & 0xfffff000;
> +
> +               if (lower_immediate & 0x00000fff) {
> +                       /* replace upper 12 bits of addi with lower 12 bi=
ts of val */
> +                       addi_insn &=3D 0x000fffff;
> +                       addi_insn |=3D (lower_immediate & 0x00000fff) << =
20;
> +               } else {
> +                       /* replace addi with nop if lower_immediate is em=
pty */
> +                       addi_insn =3D RISCV_INSN_NOP4;
> +               }
>         } else {
>                 /* replace lui with nop if immediate is small enough to f=
it in addi */
>                 lui_insn =3D RISCV_INSN_NOP4;
> @@ -203,16 +209,9 @@ static inline void __runtime_fixup_32(__le16 *lui_pa=
rcel, __le16 *addi_parcel, u
>                  * is performed by adding with the x0 register. Setting r=
s to
>                  * zero with the following mask will accomplish this goal=
.
>                  */
> -               addi_insn_mask &=3D 0x07fff;
> -       }
> -
> -       if (lower_immediate & 0x00000fff) {
> +               addi_insn &=3D 0x07fff;
>                 /* replace upper 12 bits of addi with lower 12 bits of va=
l */
> -               addi_insn &=3D addi_insn_mask;
>                 addi_insn |=3D (lower_immediate & 0x00000fff) << 20;
> -       } else {
> -               /* replace addi with nop if lower_immediate is empty */
> -               addi_insn =3D RISCV_INSN_NOP4;
>         }
>
>         addi_res =3D cpu_to_le32(addi_insn);
> --
> 2.43.0
>
> Let me know what you think!
Frankly, I wonder whether this whole optimization of replacing `lui` or
`addiw` with `nop` is even worth it. This isn't like linker relaxation
where we can actually change the amount of code by eliding an instruction.
Is `nop` actually that much faster to execute than `lui` or `addiw` to
justify the complexity?
>
> - Charlie
>
Best - Charlie

