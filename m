Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55E56202965
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 19:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748375854; cv=none; b=aqo+1bf4GfJRmoCUYZ0Dr6g8PqhsdJwh4o3CwM7p7j3tkuesb9MtDFwR/qIupI+DLo8qceUp1pY8xGlfRaFpZ/ng7KZAhnp8PGGkpTB3rcEMYSWXImgQrKW/T5RM4oR4NHYdKcm9Wl8SkHU7KHiLT1Boapcwe8PsNeVriwcq9L8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748375854; c=relaxed/simple;
	bh=zZelD/Zr+oGQoQOE2Hu5+OEYHJjDgRJ6xr/NWsnNfyY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ckrT16fCSGuvPGzujKqfjjhKfRVRmRIcOMLI7Dv90Hu+w3p8DarFovHyYz3klpp+1EkQqPv45DbBYmgxkYiOT6oWRztgMUvb3HV2elDGueImPjiZLmKJuHM+lB5l6h/Yh3RJn/WQ8WdKrQsOo9AygGx2TMFLIegANyNNfthUeFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1w7rUsKB; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1w7rUsKB"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5f438523d6fso336a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 12:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748375850; x=1748980650; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R8RuieykYBcGiBZSEdz9WGv6YwEm4reve2v8Hq5XlEk=;
        b=1w7rUsKBWFIg+xIeqj0ZuB1ydbW8zALo3S9dRbwj/hLvxV0tY9DcSzWW/GKsIwnFoW
         8AdjCB/m7/cPZz/aZqCWip9rFW0sCQcYzQkplqxS7+k4trgmxisNTmlVDsCfaeNxNxi1
         AUh5gyCmasrsdwJFqoYz8J3VaXr1JoCswEi1Lbjb2UWDTdQ2g8KxnxdacyR56K6NOkgy
         dXoWynvt0IkfyHbYBHP/SOUHiWWkngWEk821b8Hx2zRLvRedaM5BBIkTF/oX5nXsNGUf
         edOtRt+OOmPkPQsCYpH94ezIg3HaD6LMakjuFS0rMpT1fxkcJ7CKwQV2aFlYPA8mTOrq
         ESpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748375850; x=1748980650;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R8RuieykYBcGiBZSEdz9WGv6YwEm4reve2v8Hq5XlEk=;
        b=VLE8xx7fOBThAgjFv93rRsihXknONdpBCfPDCSfEBcTYYOeBtkd1p9bWVn9xxx1DOe
         l6NA6OBXgfMno2lXy8zNeE8qxE51wWjXK98mY+9JkHGzZKrRZo9noteRpJBfJUwYlik7
         ffnckvokZXw9+mbDIvWbjX3auZIrBUWkoGf3g/QZjCig4HQ74Ky3naNGg+Er0jrUdx++
         VmvbaEBeqH/bqS2go08b9RYCVl0LCtQDtD0yE2Grt042I7iXwzAeZwKtOWCHxZu3oOhm
         cMciiiqI9SbSzUBzvygW+aGoEiIyDAJdcp+eqjA4g+sGrBfSb6haQPms4xFSWqRCgoEV
         cxhA==
X-Forwarded-Encrypted: i=1; AJvYcCUqtuha1x4JBF+xSH4smAud+XzGB7F983t/Fp5XKMv3/FsDHEIECp3wPIHdgP+Nlte7ziv/6d1x1L/fMyQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+l6kmPohscsY/hDY9Kwt3gz8QpEOV4fDb4gP/Zwm54mSI+JpF
	MSCXEoQucGhb0PlhxkGOK02bN3Bl0ZUjkvlQrwAQyTMO5R21Bc0rS07UgyOYMEeLbL7CDzI9OEn
	MGf6OTiJc9VsOXZqSjKsg24vOwWHKiqS9QzOiik4n
X-Gm-Gg: ASbGncsL3lpXLqNMzkK3YuEL5WdfJh6+Mwa89Ud/Yq642e8CzHcrprJELw1lNaUzfzd
	o+UsI3eGb/0qFP6Dq2kD132SI+DYNlxDoSVPit+5gUviCROwelZzwuuheugCK/pOymMTsnLesNy
	FctIEvY5imqE4yVv+dHPUOOx4ZtU/855Ug7woGL/ywQLvvuz5eD79MhB6Jo4fTlp/AKUqv32lVt
	Q==
X-Google-Smtp-Source: AGHT+IFaHCLVBvzFpB6iEHnOR3baQkWf9PrvgU230mgwmX/c+xhTQ0CBOWOklDzdBT7M4bLqQkd54ujFJix/4Jy9S+E=
X-Received: by 2002:a05:6402:341:b0:602:d49a:e8f1 with SMTP id
 4fb4d7f45d1cf-60515bd3ae6mr15700a12.7.1748375850357; Tue, 27 May 2025
 12:57:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250521213534.3159514-1-xur@google.com> <CAK7LNAQ6jy7FfNZqJ89UyvO4BbbbcFUne-aG3cmw58ucZWoHTg@mail.gmail.com>
In-Reply-To: <CAK7LNAQ6jy7FfNZqJ89UyvO4BbbbcFUne-aG3cmw58ucZWoHTg@mail.gmail.com>
From: Rong Xu <xur@google.com>
Date: Tue, 27 May 2025 12:57:18 -0700
X-Gm-Features: AX0GCFtGl7T_xQA7IX0Ly20EySUA3kSnn0i3TXaJCX1YkjjK6EIxyuja4_YNOno
Message-ID: <CAF1bQ=QHFJmqGOSOk-=SDh84+s-+qEcPiybFzXMOPpzanUiJZQ@mail.gmail.com>
Subject: Re: [PATCH v3] kbuild: distributed build support for Clang ThinLTO
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Eric Naim <dnaim@cachyos.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Alice Ryhl <aliceryhl@google.com>, 
	Sami Tolvanen <samitolvanen@google.com>, "Mike Rapoport (Microsoft)" <rppt@kernel.org>, 
	Rafael Aquini <aquini@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Stafford Horne <shorne@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Teresa Johnson <tejohnson@google.com>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 26, 2025 at 2:05=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> On Thu, May 22, 2025 at 6:35=E2=80=AFAM <xur@google.com> wrote:
>
> > +ifdef CONFIG_LTO_CLANG_THIN_DIST
> > +# Generate .o_thinlto_native (obj) from .o (bitcode) file
> > +# --------------------------------------------------------------------=
-------
> > +quiet_cmd_cc_o_bc =3D CC $(quiet_modtag) $@
> > +
> > +cmd_cc_o_bc      =3D $(if $(filter bitcode, $(shell file -b $<)),$(CC)=
 \
> > +                  $(filter-out -Wp% $(LINUXINCLUDE) %.h.gch %.h -D% \
> > +                  -flto=3Dthin, $(c_flags)) \
>
> I think this filter-out is fragile.
>
> I think it is better to use $(_c_flags), like this:
>
>     $(filter-out -flto=3Dthin, $(_c_flags))
Ack.
>
>
>
>
>
>
>
>
>
>
>
>
> > diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> > index 2fe73cda0bddb..9cfd23590334d 100644
> > --- a/scripts/Makefile.lib
> > +++ b/scripts/Makefile.lib
> > @@ -34,8 +34,13 @@ else
> >  obj-m :=3D $(filter-out %/, $(obj-m))
> >  endif
> >
> > +builtin_suffix :=3D $(if $(filter %.a_thinlto_native, $(MAKECMDGOALS))=
,.a_thinlto_native,.a)
> > +ifeq ($(thinlto_final_pass),1)
> > +        builtin_suffix :=3D.a_thinlto_native
> > +endif
> > +
> >  ifdef need-builtin
> > -obj-y          :=3D $(patsubst %/, %/built-in.a, $(obj-y))
> > +obj-y          :=3D $(patsubst %/, %/built-in$(builtin_suffix), $(obj-=
y))
> >  else
> >  obj-y          :=3D $(filter-out %/, $(obj-y))
> >  endif
> > diff --git a/scripts/Makefile.vmlinux_o b/scripts/Makefile.vmlinux_o
> > index b024ffb3e2018..f9abc45a68b36 100644
> > --- a/scripts/Makefile.vmlinux_o
> > +++ b/scripts/Makefile.vmlinux_o
> > @@ -9,6 +9,14 @@ include $(srctree)/scripts/Kbuild.include
> >  # for objtool
> >  include $(srctree)/scripts/Makefile.lib
> >
> > +ifeq ($(thinlto_final_pass),1)
> > +vmlinux_a :=3D vmlinux.a_thinlto_native
> > +vmlinux_libs :=3D $(patsubst %.a,%.a_thinlto_native,$(KBUILD_VMLINUX_L=
IBS))
> > +else
> > +vmlinux_a :=3D vmlinux.a
> > +vmlinux_libs :=3D $(KBUILD_VMLINUX_LIBS)
> > +endif
> > +
> >  # Generate a linker script to ensure correct ordering of initcalls for=
 Clang LTO
> >  # --------------------------------------------------------------------=
-------
> >
> > @@ -18,7 +26,7 @@ quiet_cmd_gen_initcalls_lds =3D GEN     $@
> >         $(PERL) $(real-prereqs) > $@
> >
> >  .tmp_initcalls.lds: $(srctree)/scripts/generate_initcall_order.pl \
> > -               vmlinux.a $(KBUILD_VMLINUX_LIBS) FORCE
> > +               $(vmlinux_a) $(vmlinux_libs) FORCE
> >         $(call if_changed,gen_initcalls_lds)
> >
> >  targets :=3D .tmp_initcalls.lds
> > @@ -59,8 +67,8 @@ quiet_cmd_ld_vmlinux.o =3D LD      $@
> >         $(LD) ${KBUILD_LDFLAGS} -r -o $@ \
> >         $(vmlinux-o-ld-args-y) \
> >         $(addprefix -T , $(initcalls-lds)) \
> > -       --whole-archive vmlinux.a --no-whole-archive \
> > -       --start-group $(KBUILD_VMLINUX_LIBS) --end-group \
> > +       --whole-archive $(vmlinux_a) --no-whole-archive \
> > +       --start-group $(vmlinux_libs) --end-group \
> >         $(cmd_objtool)
> >
> >  define rule_ld_vmlinux.o
> > @@ -68,7 +76,7 @@ define rule_ld_vmlinux.o
> >         $(call cmd,gen_objtooldep)
> >  endef
> >
> > -vmlinux.o: $(initcalls-lds) vmlinux.a $(KBUILD_VMLINUX_LIBS) FORCE
> > +vmlinux.o: $(initcalls-lds) $(vmlinux_a) $(vmlinux_libs) FORCE
> >         $(call if_changed_rule,ld_vmlinux.o)
> >
> >  targets +=3D vmlinux.o
> > diff --git a/scripts/Makefile.vmlinux_thinlink b/scripts/Makefile.vmlin=
ux_thinlink
> > new file mode 100644
> > index 0000000000000..13e4026c7d45b
> > --- /dev/null
> > +++ b/scripts/Makefile.vmlinux_thinlink
> > @@ -0,0 +1,53 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +
> > +PHONY :=3D __default
> > +__default: vmlinux.thinlink
> > +
> > +include include/config/auto.conf
> > +include $(srctree)/scripts/Kbuild.include
> > +
> > +
> > +# Generate a linker script to ensure correct ordering of initcalls for=
 Clang LTO
> > +# --------------------------------------------------------------------=
-------
> > +
> > +quiet_cmd_gen_initcalls_lds =3D GEN     $@
> > +      cmd_gen_initcalls_lds =3D \
> > +       $(PYTHON3) $(srctree)/scripts/jobserver-exec \
> > +       $(PERL) $(real-prereqs) > $@
>
>
> This is a copy-paste from scripts/Makefile.vmlinux_o.
>
> Is this linker script critical when generating the index file?

Our usual guideline for the ThinLTO indexing command is to use the
same arguments
as the final link. For this particular case, it probably does not
matter (i.e we can skip the linker script option).

>
>
>
> --
> Best Regards
> Masahiro Yamada
