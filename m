Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F82124169E
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 19:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744746877; cv=none; b=bSS5vXik14yaeWoLcDYd0q4HMznAECb9HkQNt9DEp/czYd30Pw6q6jiPTkZgfezcG0ZbY+8ckZPvweUcyThKb8D01RhglYak8gkYOW9nN29INJenjw6sW19YTP3GldpDqHAZ9pMWRF9vpXTUhS4btMYSY7ono4F8CzxIwzhDu5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744746877; c=relaxed/simple;
	bh=Zaepws7nExyxvpluQDywwkg0I9h0UUo2vpZOf2K/GoM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=roL5HObXKAm/cbNicwL5jKdNzt3qLu+D5sUyKeEjf46u60NqElTKfFOfYBDK1nrpiOfZQMornR+7Xw2fiGrySUfDHkGsRNvEEGggZGp681n4jtlYvcRSPrvcvXgUgPOV36vQaZRajkDwfMZFaoRqr/36E9mU7CAY9RdyKWMSCP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JTorOXx/; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JTorOXx/"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6fece18b3c8so58823277b3.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 12:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744746874; x=1745351674; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yAi1HpDyCH5qHMnYK7rZqJqXCXRMxpW4p8owZruiAAY=;
        b=JTorOXx/jQ/nPNCYECwIpQR0Dog14SOlD5PjYba3YUnGWOVhVHocvAbWT7mt5gsP1S
         /Ff5DYL57cChHoBwFNn9On0CQdzFWTdmIVFSSCy6G9d6opa3v7RugYviro9fNTTGFupO
         ohaYmN5qlsCWbMmKt4FKfYFbqKaEvaW45Sulro+0xZw3hdwOxnMeJKJOKijYQNbHe30h
         X6Es555KPKNtv9hHowOxJBOY4rTPYQ/E/b/QmDk6A2AtVsR4096ArUnAGxbOZ4LLU6F/
         BfS4v4D8/3wLywlfeZlG0tnYq1uwJxD5F1CcARG4w9hXPymwibp3ZGwjddJqoTxs2XW0
         TpHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744746874; x=1745351674;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yAi1HpDyCH5qHMnYK7rZqJqXCXRMxpW4p8owZruiAAY=;
        b=S+NyXsibTfffotsdAkmXhJtDFmV/6i9soW0atvVR9gLNa3eWoiWdIax74f0rcNBZid
         NU41ET2s9eBS/fCYmVr1ZZt0lSXSI7suBND/X+cLageiXVHW9bYHBmO34l57lP91dXKt
         4RMSv2yE/zgbuSs25xw/rDpd+HQob7whXTbQbyAWi0d4kg0UMJtb3aHXX/cwvii65/RT
         ywO2ufGuFc+edyrW9/1dMoTrefra7PUyDoFqwr5Vau+3wjbbvalK0bJ6PkqEMJDeCxu8
         6WHVDQ7+0TYo/wjdTIPeBsZE43CTxV6bK2/UdTSwWGd30Nbf0f75tXjMYk3VPy6yx1V2
         +6Wg==
X-Forwarded-Encrypted: i=1; AJvYcCXzlyF02TOMuSDXn362bbaTwZjQNVzTQa3z0/RBcKA2LLqJajQkC/3WcL07bYM0lYqitucjKY+XPkbhWYo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdzccPVkui/oFRl+0gp+MXZwORkX0isneJpVWZGP7gRh6B7AfH
	qskyjmZGC+O5FREwxRRubSYh19xOn9CGpSsDcgjWIjIXJZ6JkUUXSpECv/kKPR1kIgH9a29PM48
	uBNbMzEO7/8X+C527rkFaVJC9Lhk=
X-Gm-Gg: ASbGncvrjRRum4btYNKkFrYPedCt0ZzpkanGuNF3sLZw8tu+2xm+7po/xuZw/WeMDiO
	Q2AFRamtSc09x7sFJlb5i9+2oadEleHAB6JYjF0pHWEdjqGtn4SriIlREYF5BrzL/gwCDGJmuSq
	3EuVqhBttDfbX5j2bT7TSo
X-Google-Smtp-Source: AGHT+IGlvmJGXcVyW5hA9lpQC3pfTq/acR7QSuaZFT2Z/sDAbRX4tOnqvIe3e5bH4LTdduM75/dvdMi1J0a8Fv71kwk=
X-Received: by 2002:a05:690c:23ca:b0:700:b389:9246 with SMTP id
 00721157ae682-706ad1c6361mr9042927b3.38.1744746874177; Tue, 15 Apr 2025
 12:54:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250402174156.1246171-1-jim.cromie@gmail.com>
 <20250402174156.1246171-21-jim.cromie@gmail.com> <428d9ffb-70bb-42f3-bf4e-416cfd90f88c@bootlin.com>
In-Reply-To: <428d9ffb-70bb-42f3-bf4e-416cfd90f88c@bootlin.com>
From: jim.cromie@gmail.com
Date: Tue, 15 Apr 2025 13:54:08 -0600
X-Gm-Features: ATxdqUFKxNW9JmpIZE3lLHmW8mlHITUJ88JoVc4NFn6_RoSSyM2vkFzfaonZR-I
Message-ID: <CAJfuBxx17bgvP5PyP25yKoLXGp-3q1jdaNYKvJkE+8+BL9Akaw@mail.gmail.com>
Subject: Re: [PATCH v3 20/54] dyndbg: check DYNAMIC_DEBUG_CLASSMAP_DEFINE args
 at compile-time
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org, 
	intel-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch, 
	tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com, 
	ville.syrjala@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 15, 2025 at 4:04=E2=80=AFAM Louis Chauvet <louis.chauvet@bootli=
n.com> wrote:
>
>
>
> Le 02/04/2025 =C3=A0 19:41, Jim Cromie a =C3=A9crit :
> > Add __DYNAMIC_DEBUG_CLASSMAP_CHECK to implement the following
> > arg-checks at compile-time:
> >
> >       0 <=3D _base < 63
> >       class_names is not empty
> >       class_names[0] is a string
>
> I don't see where this is checked, did I miss something?

kinda/sorta ?   theres no explicit check for "string".
BUT
this would fail, cuz 1 doesnt fit into a char* arr[0]
> > +DYNDBG_CLASSMAP_DEFINE(fail_str_type, 0, 0, 1 /* not a string */);

Im perhaps over-simplifying the description

>
> >       (class_names.length + _base) < 63
> >
> > These compile-time checks will prevent several misuses; 4 such
> > examples are added to test_dynamic_debug_submod.ko, and will fail
> > compilation if -DDD_MACRO_ARGCHECK is added to cflags.  This wouldn't
> > be a useful CONFIG_ item, since it breaks the build.
> >
> > Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
> > ---
> > v3- $macro_name =3D~ s/DYNDBG/DYNAMIC_DEBUG/
> >
> > prev-
> > - split static-asserts to __DYNDBG_CLASSMAP_CHECK
> > - move __DYNDBG_CLASSMAP_CHECK above kdoc for DYNDBG_CLASSMAP_DEFINE
> >    silences kernel-doc warnings
> > ---
> >   include/linux/dynamic_debug.h |  9 +++++++++
> >   lib/test_dynamic_debug.c      | 11 +++++++++++
> >   2 files changed, 20 insertions(+)
> >
> > diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debu=
g.h
> > index 9af825c84e70..4941ef2adb46 100644
> > --- a/include/linux/dynamic_debug.h
> > +++ b/include/linux/dynamic_debug.h
> > @@ -99,6 +99,14 @@ struct _ddebug_class_map {
> >       enum ddebug_class_map_type map_type;
> >   };
> >
> > +#define __DYNAMIC_DEBUG_CLASSMAP_CHECK(_clnames, _base)               =
       \
> > +     static_assert(((_base) >=3D 0 && (_base) < _DPRINTK_CLASS_DFLT), =
 \
> > +                   "_base must be in 0..62");                        \
> > +     static_assert(ARRAY_SIZE(_clnames) > 0,                         \
> > +                   "classnames array size must be > 0");             \
> > +     static_assert((ARRAY_SIZE(_clnames) + (_base)) < _DPRINTK_CLASS_D=
FLT, \
> > +                   "_base + classnames.length exceeds range")
> > +
> >   /**
> >    * DYNAMIC_DEBUG_CLASSMAP_DEFINE - define debug classes used by a mod=
ule.
> >    * @_var:   name of the classmap, exported for other modules coordina=
ted use.
> > @@ -112,6 +120,7 @@ struct _ddebug_class_map {
> >    */
> >   #define DYNAMIC_DEBUG_CLASSMAP_DEFINE(_var, _mapty, _base, ...)      =
       \
> >       static const char *_var##_classnames[] =3D { __VA_ARGS__ };      =
 \
>
> Or maybe it was already enforced by this, but in this case the commit
> message contains too much checks.
>
> > +     __DYNAMIC_DEBUG_CLASSMAP_CHECK(_var##_classnames, (_base));     \
> >       extern struct _ddebug_class_map _var;                           \
> >       struct _ddebug_class_map __aligned(8) __used                    \
> >               __section("__dyndbg_class_maps") _var =3D {              =
 \
> > diff --git a/lib/test_dynamic_debug.c b/lib/test_dynamic_debug.c
> > index e42916b08fd4..9f9e3fddd7e6 100644
> > --- a/lib/test_dynamic_debug.c
> > +++ b/lib/test_dynamic_debug.c
> > @@ -146,8 +146,19 @@ DYNDBG_CLASSMAP_DEFINE(classid_range_conflict, 0, =
D2_CORE + 1, "D3_CORE");
> >   DYNAMIC_DEBUG_CLASSMAP_USE(map_disjoint_bits);
> >   DYNAMIC_DEBUG_CLASSMAP_USE(map_level_num);
> >
> > +#if defined(DD_MACRO_ARGCHECK)
> > +/*
> > + * Exersize compile-time arg-checks in DYNDBG_CLASSMAP_DEFINE.
> > + * These will break compilation.
> > + */
> > +DYNDBG_CLASSMAP_DEFINE(fail_base_neg, 0, -1, "NEGATIVE_BASE_ARG");
> > +DYNDBG_CLASSMAP_DEFINE(fail_base_big, 0, 100, "TOOBIG_BASE_ARG");
> > +DYNDBG_CLASSMAP_DEFINE(fail_str_type, 0, 0, 1 /* not a string */);
> > +DYNDBG_CLASSMAP_DEFINE(fail_emptyclass, 0, 0 /* ,empty */);
> >   #endif
> >
> > +#endif /* TEST_DYNAMIC_DEBUG_SUBMOD */
> > +
> >   /* stand-in for all pr_debug etc */
> >   #define prdbg(SYM) __pr_debug_cls(SYM, #SYM " msg\n")
> >
>
> --
> Louis Chauvet, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>
