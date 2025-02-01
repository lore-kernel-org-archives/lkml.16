Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E69F81C5D61
	for <linux-kernel@vger.kernel.org>; Sat,  1 Feb 2025 20:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738440427; cv=none; b=WqQxZXATx0VZTABekqFbQ3LyVpGzeMN2auyUi0iVHz95NaJK+LY69yqZfIkHGpMsiEEAlt9vQMRIvu0zeHPDpr+H9Te36pXoesXbtlpFWtwOgzKAyZkLow5XGCK/SwmiKwTmjnVOCSB1a4EP4vLcNk3Pkub5+R3hZNXSZtN/VSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738440427; c=relaxed/simple;
	bh=eT/l/fBe1ZYNW3z6uzmd5ZUJ53hX1EqNsdPFA5Ur88I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qRpj7wwv0BNQbOudLjbE4ISlaTGLKUjKtL8spdTjsfbk+jlGvrtHH84Y6+QMXJEbZ9hNy0RLGxSkNUcne4kXNK+6158b0VwOZIJuUjNRaKieHGYBitY7vnZ9gTKzAAnGM3IqFV3hXYEQLljyRUaIWlCwlRkRjFLS3Jafhj9C9no=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xwF5AwLe; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xwF5AwLe"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-467abce2ef9so197571cf.0
        for <linux-kernel@vger.kernel.org>; Sat, 01 Feb 2025 12:07:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738440425; x=1739045225; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6n+dd3xMQn5Y+r0NTIc5RKRpV9R1LhdDYsaSaI6Y4a0=;
        b=xwF5AwLe/2OBJtA/sGK1lPVjDX3VBpci4X75heIe+WMSHHCJ2iaiymVF81le+2DJhR
         1IJWsiaJHOV/YwTP6UBOdgKZuysnpK50f3pkZ/INn0k+6ZaV3FcZIjetGFTi8j8PWzOh
         UDOoPqYCwzskTuQT/REJFPytgDs7kEIgSngQjG4dTFosZ/YtReSnkLfRAIdjcGaIBlqM
         RshOm35pJgnq/GcpDurGf4FU7h9Gr4eLmvgvW5vyQ5DJUa34qbMQh/HVUF7GlyqlttJ5
         NTUVxd83LFDmxsHcheFt1wK5qUTOQrfLOQzdvi8hV53Q6mXEhxDoTtDXgimYCkNryTjt
         CEeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738440425; x=1739045225;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6n+dd3xMQn5Y+r0NTIc5RKRpV9R1LhdDYsaSaI6Y4a0=;
        b=hpbr9zVZPIjG4vJdDSMiBTQSTvTiDT4svRjMUAxvRVu0tno/bgSbQMraKhrJtiUsw7
         TveCOs3nRHHLxnCo3DKW/iW3bbvXEURU9Sj8oMouyqXYZSHoBhJxMlCfzOC/l/Bmk9zL
         ZZlHqyMs1fZ7XcFMMSPs1sLKMF/9HJBXewfuEYrH9x9R9pzNa0+yAKgMQ7Ds+VODLIhy
         AUDN309nC84d5wa1Cao9UAWvSoy/q93Ak0iOE8BqTzU6QMy/NU3bBD2gVltAj5wuD0jz
         GsuoDJ+fB/7L8xyLmPt4Sk6JU5FXwolAH2+s5hcd++SgVONPaHpuKwRCb2/TyNW54MlG
         2IPA==
X-Forwarded-Encrypted: i=1; AJvYcCUp5Zu0/bcWB/YphBUrrKojJx3qBnGU2qM9cnjorvzmYgp2LrZLdD/+thaMR3g5V7S5XYX2Ay5rk4TK5Gg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAaloLFsDRh00oC6zUkQ2Zt9sU2vDco8xbIaIiC8KuLLBB8QUR
	QVA/625X730VBhtP8ZPhGCedcdQ4fQm1bA7EG8chT1P99/keT3LaWuaZOlWpQeIC1JB/5efHazN
	NqBCM8pqHn018jRgpR47DeAg1nouP9Lp3bhWO
X-Gm-Gg: ASbGncu01IWsPOgvjJAf8QbevGbzhTpRubZA3bseMdHDwHajMCvFdZ2jYi3jby1D+4p
	It4q799vM0CLosYNMaoEH88idNS/gOE8WP5HOZjJnS/LqVT2KzX2GMuc0pDAPKyjtfZzIkNyojl
	6NVheJ32zywO013RBwYVWxhVcQijo=
X-Google-Smtp-Source: AGHT+IFGScRsZu/BSeeBdha40frViqOW3XvGsw73ciQbR25FNCf8NQtTdfM2PHZm54fHj/maOIj4GMqzJl2X2uWUDN8=
X-Received: by 2002:a05:622a:6204:b0:467:86b4:4e92 with SMTP id
 d75a77b69052e-46ffa8e17b4mr1859991cf.29.1738440424326; Sat, 01 Feb 2025
 12:07:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <202501310832.kiAeOt2z-lkp@intel.com> <CAJuCfpGrtTK=reeVPrS+GQngs=WS-cZvy_YU9-JGyRgVFdofAw@mail.gmail.com>
 <CAJuCfpF56btBuHKn6j2SzY8KRUbjQ_oHCYtj5oqP88HBBBQ_3A@mail.gmail.com> <CAJuCfpExBhWxWdj3G-uQXA8HA-+ES6y=sz2H4eeze4xw4snYZg@mail.gmail.com>
In-Reply-To: <CAJuCfpExBhWxWdj3G-uQXA8HA-+ES6y=sz2H4eeze4xw4snYZg@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Sat, 1 Feb 2025 12:06:53 -0800
X-Gm-Features: AWEUYZlprt5O7-6D2FTFY-_Zt2KqcyXzKkEksVKOi2hLmo6QpH2b5Im5TKCukqw
Message-ID: <CAJuCfpECssDC2VZuNkeqEbb68MuAvoWeSt-zsV6mqouMzEeE4Q@mail.gmail.com>
Subject: Re: drivers/auxdisplay/panel.c:1454:2: error: call to
 __compiletime_assert_309 declared with 'error' attribute: BUILD_BUG_ON
 failed: !__builtin_constant_p(_dest_len) || _dest_len == (size_t)-1
To: kernel test robot <lkp@intel.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Linux Memory Management List <linux-mm@kvack.org>, Kent Overstreet <kent.overstreet@linux.dev>, 
	Kees Cook <keescook@chromium.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 1, 2025 at 11:21=E2=80=AFAM Suren Baghdasaryan <surenb@google.c=
om> wrote:
>
> On Fri, Jan 31, 2025 at 2:51=E2=80=AFPM Suren Baghdasaryan <surenb@google=
.com> wrote:
> >
> > On Fri, Jan 31, 2025 at 8:55=E2=80=AFAM Suren Baghdasaryan <surenb@goog=
le.com> wrote:
> > >
> > > On Thu, Jan 30, 2025 at 4:06=E2=80=AFPM kernel test robot <lkp@intel.=
com> wrote:
> > > >
> > > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/li=
nux.git master
> > > > head:   b4b0881156fb8209bf5ef6cb63211bb0ad6e1a6b
> > > > commit: 07438779313caafe52ac1a1a6958d735a5938988 alloc_tag: avoid c=
urrent->alloc_tag manipulations when profiling is disabled
> > > > date:   5 days ago
> > > > config: hexagon-randconfig-r133-20250131 (https://download.01.org/0=
day-ci/archive/20250131/202501310832.kiAeOt2z-lkp@intel.com/config)
> > > > compiler: clang version 14.0.6 (https://github.com/llvm/llvm-projec=
t f28c006a5895fc0e329fe15fead81e37457cb1d1)
> > > > reproduce: (https://download.01.org/0day-ci/archive/20250131/202501=
310832.kiAeOt2z-lkp@intel.com/reproduce)
> > >
> > > Just saw this report (was on vacation). Will try to figure out what's=
 going on.
> >
> > I confirmed that my change at
> > https://lore.kernel.org/all/20241226211639.1357704-1-surenb@google.com
> > indeed causes this.
> > Looks like due to the additional mem_alloc_profiling_enabled() check,
> > the compiler considers allocation size as unknown at compile time
> > (__builtin_object_size(obj) returns -1) even though both branches of
> > that condition make the same exact allocation.
> > I tried changing it to:
> >
> > #define alloc_hooks_tag(_tag, _do_alloc) \
> > ({ \
> >         typeof(_do_alloc) _res; \
> >         struct alloc_tag * __maybe_unused _old; \
> >          if (mem_alloc_profiling_enabled()) \
> >                 _old =3D alloc_tag_save(_tag); \
> >         _res =3D _do_alloc; \
> >          if (mem_alloc_profiling_enabled()) \
> >                  alloc_tag_restore(_tag, _old); \
> >         _res; \
> > })
> >
> > and that fixes the problem, however this would require two static key
> > checks... I wonder if there is a way to tell the compiler that both
> > branches cause the same result. Let me dig around.
>
> CC'ing Nathan Chancellor, Nick Desaulniers and llvm@lists.linux.dev
>
> Looks like this error happens only with clang version 14 (more
> specifically CONFIG_CLANG_VERSION=3D140006). I tested with clang-13,
> clang-15 and clang-17 and all of them build this code fine. Same thing
> for other archs (clang-14 fails, others don't). I tried hexagon, x86
> and arm64.
>
> To fix the build I can add:
>
> #if defined(CONFIG_CC_IS_CLANG) && CONFIG_CLANG_VERSION >=3D 140000 &&
> CONFIG_CLANG_VERSION < 150000
> // do this the old way
> #else
> // do this the new way
> #endif
>
> but I'm not sure if that's the right fix.
>
> Andrew, while compiler folks investigate this issue, I'll post the
> above fix in case we need to deal with this build error urgently.

Workaround is posted at:
https://lore.kernel.org/all/20250201200503.2532357-1-surenb@google.com/

> Thanks,
> Suren.
>
> >
> > >
> > > >
> > > > If you fix the issue in a separate patch/commit (i.e. not just a ne=
w version of
> > > > the same patch/commit), kindly add following tags
> > > > | Reported-by: kernel test robot <lkp@intel.com>
> > > > | Closes: https://lore.kernel.org/oe-kbuild-all/202501310832.kiAeOt=
2z-lkp@intel.com/
> > > >
> > > > All errors (new ones prefixed by >>):
> > > >
> > > > >> drivers/auxdisplay/panel.c:1454:2: error: call to __compiletime_=
assert_309 declared with 'error' attribute: BUILD_BUG_ON failed: !__builtin=
_constant_p(_dest_len) || _dest_len =3D=3D (size_t)-1
> > > >            strtomem_pad(key->u.kbd.release_str, release, '\0');
> > > >            ^
> > > >    include/linux/string.h:417:2: note: expanded from macro 'strtome=
m_pad'
> > > >            BUILD_BUG_ON(!__builtin_constant_p(_dest_len) ||        =
        \
> > > >            ^
> > > >    include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD=
_BUG_ON'
> > > >            BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #con=
dition)
> > > >            ^
> > > >    include/linux/build_bug.h:39:37: note: expanded from macro 'BUIL=
D_BUG_ON_MSG'
> > > >    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), =
msg)
> > > >                                        ^
> > > >    note: (skipping 1 expansions in backtrace; use -fmacro-backtrace=
-limit=3D0 to see all)
> > > >    include/linux/compiler_types.h:530:2: note: expanded from macro =
'_compiletime_assert'
> > > >            __compiletime_assert(condition, msg, prefix, suffix)
> > > >            ^
> > > >    include/linux/compiler_types.h:523:4: note: expanded from macro =
'__compiletime_assert'
> > > >                            prefix ## suffix();                     =
        \
> > > >                            ^
> > > >    <scratch space>:127:1: note: expanded from here
> > > >    __compiletime_assert_309
> > > >    ^
> > > >    1 error generated.
> > > >
> > > >
> > > > vim +/error +1454 drivers/auxdisplay/panel.c
> > > >
> > > > 7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau         =
   2008-11-13  1426
> > > > 7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau         =
   2008-11-13  1427  /* tries to bind a key to the signal name <name>. The =
key will send the
> > > > 7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau         =
   2008-11-13  1428   * strings <press>, <repeat>, <release> for these resp=
ective events.
> > > > 7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau         =
   2008-11-13  1429   * Returns the pointer to the new key if ok, NULL if t=
he key could not be bound.
> > > > 7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau         =
   2008-11-13  1430   */
> > > > 36d2041a3d57b9 drivers/staging/panel/panel.c Peter Huewe           =
   2013-02-15  1431  static struct logical_input *panel_bind_key(const char=
 *name, const char *press,
> > > > 36d2041a3d57b9 drivers/staging/panel/panel.c Peter Huewe           =
   2013-02-15  1432                                              const char=
 *repeat,
> > > > 36d2041a3d57b9 drivers/staging/panel/panel.c Peter Huewe           =
   2013-02-15  1433                                              const char=
 *release)
> > > > 698b1515f03914 drivers/staging/panel/panel.c Willy Tarreau         =
   2008-11-22  1434  {
> > > > 7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau         =
   2008-11-13  1435          struct logical_input *key;
> > > > 7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau         =
   2008-11-13  1436
> > > > fdf4a4948ca8a1 drivers/staging/panel/panel.c Dominique van den Broe=
ck 2014-05-21  1437          key =3D kzalloc(sizeof(*key), GFP_KERNEL);
> > > > eb073a9bf2b6ed drivers/staging/panel/panel.c Toshiaki Yamane       =
   2012-07-12  1438          if (!key)
> > > > 7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau         =
   2008-11-13  1439                  return NULL;
> > > > eb073a9bf2b6ed drivers/staging/panel/panel.c Toshiaki Yamane       =
   2012-07-12  1440
> > > > 698b1515f03914 drivers/staging/panel/panel.c Willy Tarreau         =
   2008-11-22  1441          if (!input_name2mask(name, &key->mask, &key->v=
alue, &scan_mask_i,
> > > > cb46f472cbb08c drivers/staging/panel/panel.c Kulikov Vasiliy       =
   2010-07-12  1442                               &scan_mask_o)) {
> > > > cb46f472cbb08c drivers/staging/panel/panel.c Kulikov Vasiliy       =
   2010-07-12  1443                  kfree(key);
> > > > 7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau         =
   2008-11-13  1444                  return NULL;
> > > > cb46f472cbb08c drivers/staging/panel/panel.c Kulikov Vasiliy       =
   2010-07-12  1445          }
> > > > 698b1515f03914 drivers/staging/panel/panel.c Willy Tarreau         =
   2008-11-22  1446
> > > > 7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau         =
   2008-11-13  1447          key->type =3D INPUT_TYPE_KBD;
> > > > 7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau         =
   2008-11-13  1448          key->state =3D INPUT_ST_LOW;
> > > > 7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau         =
   2008-11-13  1449          key->rise_time =3D 1;
> > > > 7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau         =
   2008-11-13  1450          key->fall_time =3D 1;
> > > > 7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau         =
   2008-11-13  1451
> > > > a952abcdaa2211 drivers/auxdisplay/panel.c    Justin Stitt          =
   2023-09-11  1452          strtomem_pad(key->u.kbd.press_str, press, '\0'=
);
> > > > a952abcdaa2211 drivers/auxdisplay/panel.c    Justin Stitt          =
   2023-09-11  1453          strtomem_pad(key->u.kbd.repeat_str, repeat, '\=
0');
> > > > a952abcdaa2211 drivers/auxdisplay/panel.c    Justin Stitt          =
   2023-09-11 @1454          strtomem_pad(key->u.kbd.release_str, release, =
'\0');
> > > > 7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau         =
   2008-11-13  1455          list_add(&key->list, &logical_inputs);
> > > > 7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau         =
   2008-11-13  1456          return key;
> > > > 7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau         =
   2008-11-13  1457  }
> > > > 7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau         =
   2008-11-13  1458
> > > >
> > > > :::::: The code at line 1454 was first introduced by commit
> > > > :::::: a952abcdaa22116d940ca9cb9253caad1622ae93 auxdisplay: panel: =
Replace deprecated strncpy() with strtomem_pad()
> > > >
> > > > :::::: TO: Justin Stitt <justinstitt@google.com>
> > > > :::::: CC: Kees Cook <keescook@chromium.org>
> > > >
> > > > --
> > > > 0-DAY CI Kernel Test Service
> > > > https://github.com/intel/lkp-tests/wiki
