Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E2319AD89
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 22:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738363900; cv=none; b=LcPEmuNcyokP6sjN4d5YlJKAn5T+LkNq4wR+Vrs0frRiwR1oqAcev8LoRQReyvZEbt5giL0QMiZGACXuIAGbcLpi9zfZ2MTvbw+YmtF8JZTB9MZNpEbb6knsyxd6PQ/KsLxWANaSb4EzW2mdLOpSlrVpSmT0eDQ6xhimjH7HUn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738363900; c=relaxed/simple;
	bh=C1h6Z2sFOraagiETj1CBal6IdPQUgA7SBT1KnqE4yig=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=StIHjwC9kgLuzJZF39ogsXs4fQ9HVDb8ehhAR2miz5og3cmY7tQYa7KTpRes2GpQdIoPn3Gy0INQ2ztGuMmp61g3rNOO8vh7satEyu4E3sGNBZxaNkv89Ec3tgxvN3c0NtU/oa3bkBwqFHWMoYwn1AS9xUX79LgP8HpzQmceOb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=x7CXGHXL; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="x7CXGHXL"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4678c9310afso40491cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 14:51:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738363897; x=1738968697; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CRVZdM+iGM9ixXB9jH54KsnnAGGH880gk3OgBWFCBzc=;
        b=x7CXGHXLri+obmHeUdOLatbPVx1xfnBl5KOT/Msqd1Y+71EekGMi0MtNQiR+bPM8Nd
         XZTcHmRulQHgo36el00q4TirQLb/UuGuLOKtBMj0dlmU/7iEz2CPBJbL/FQK7S1PdKMr
         M+fuvdkVmMVeILjUyNeeBXMOEPwO/Xc9zZaWphTE/zkgdyljBlxCsMv274ZTu40znI94
         34GapEK2mXPzTNifbAwEhPUxrTUPC98lqlP6LzWKInhDVarVanh5edyKBDoNJc7vWMN+
         MJrDzZZaplBv2Yq9G75XySMoMappcIJZC8cwzAbnnrV8HRscU52UowHdjLbvDsDW7kiW
         XVZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738363897; x=1738968697;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CRVZdM+iGM9ixXB9jH54KsnnAGGH880gk3OgBWFCBzc=;
        b=EpiZdDXCwGhaVWRz5QGX4/QuWzdHQpRDmynfshXKymfoliE1ATY41sWAG5Yvfif0nf
         cOa/7ZPaBAd+Kx2F7fCugEJsHNS/QyZvH1j6UXmst48IUknG8j2wOA/3r9myY2ORq1GH
         eYvbvyF2RXB883RoZYGRp27Ed0B2ggy57MefW1peKXv1eU8KUoSmkEPuH1GaheSPVGNj
         rL+lxuqcQqq7+4V1mhAecjcXyB0gnodHLMigH70RoibMq0aD/bHwUAqIdTsQsVWwkO36
         1T2osX4HZJ0/Ouhhy03KQPNDWCI0e7jyCg+BZtH8BpvhbY3ZWFBlOVyCRopo5hvgA7Ri
         2Cdw==
X-Forwarded-Encrypted: i=1; AJvYcCUyugBt7dYdF3pNzg9sAXXk2EvrZLBXD8kuWkz2XnJ8IyFDJ1e4g/9cO0xDIPUJeny8PneD+3MsZ8RLS1c=@vger.kernel.org
X-Gm-Message-State: AOJu0YyikFdS2WDf52ND/0bgHJdjG2Gv9KTnVZHllakueCV4/7RDMpFP
	eHPynbasOWCcF30PdKAAt0FBfZJrGVLP3OHjr81KRsLrSLX5z+WtQgjMMPqvCGjKvKKIX6kH2LW
	245VBIRrx4fHnnhroXzwJp0IaYB22OMaXMkZi
X-Gm-Gg: ASbGncu/kOpD+74sPIxltxrDZUL3KFJC6DkZ5DNxUcq3EFIqUdLMiNuZgAOxBN5cAzi
	PdHJsWEgx8KLHtcmTXmSy5RqSRcsl7spVSdJ06X3W20a5FekcDlBkOARiOVndjaLeu3zSh5AJ
X-Google-Smtp-Source: AGHT+IFn95EDOnLUL1dUh/vKQ/WcHaa4smXqFzp8XNAWIroKTAhFFlnSIRV81inl9dFmq/5Ed0TXvh8N3q1yC6FeJQc=
X-Received: by 2002:a05:622a:5888:b0:466:90dd:19f3 with SMTP id
 d75a77b69052e-46ffa8a3422mr323001cf.7.1738363897110; Fri, 31 Jan 2025
 14:51:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <202501310832.kiAeOt2z-lkp@intel.com> <CAJuCfpGrtTK=reeVPrS+GQngs=WS-cZvy_YU9-JGyRgVFdofAw@mail.gmail.com>
In-Reply-To: <CAJuCfpGrtTK=reeVPrS+GQngs=WS-cZvy_YU9-JGyRgVFdofAw@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 31 Jan 2025 14:51:26 -0800
X-Gm-Features: AWEUYZlLsJlinlpuc_ktKy61kMuqHR2WwvZrzqjG4qkcCrG5A1g2N4iZxUIhXLA
Message-ID: <CAJuCfpF56btBuHKn6j2SzY8KRUbjQ_oHCYtj5oqP88HBBBQ_3A@mail.gmail.com>
Subject: Re: drivers/auxdisplay/panel.c:1454:2: error: call to
 __compiletime_assert_309 declared with 'error' attribute: BUILD_BUG_ON
 failed: !__builtin_constant_p(_dest_len) || _dest_len == (size_t)-1
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, 
	Linux Memory Management List <linux-mm@kvack.org>, Kent Overstreet <kent.overstreet@linux.dev>, 
	Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 31, 2025 at 8:55=E2=80=AFAM Suren Baghdasaryan <surenb@google.c=
om> wrote:
>
> On Thu, Jan 30, 2025 at 4:06=E2=80=AFPM kernel test robot <lkp@intel.com>=
 wrote:
> >
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git master
> > head:   b4b0881156fb8209bf5ef6cb63211bb0ad6e1a6b
> > commit: 07438779313caafe52ac1a1a6958d735a5938988 alloc_tag: avoid curre=
nt->alloc_tag manipulations when profiling is disabled
> > date:   5 days ago
> > config: hexagon-randconfig-r133-20250131 (https://download.01.org/0day-=
ci/archive/20250131/202501310832.kiAeOt2z-lkp@intel.com/config)
> > compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f2=
8c006a5895fc0e329fe15fead81e37457cb1d1)
> > reproduce: (https://download.01.org/0day-ci/archive/20250131/2025013108=
32.kiAeOt2z-lkp@intel.com/reproduce)
>
> Just saw this report (was on vacation). Will try to figure out what's goi=
ng on.

I confirmed that my change at
https://lore.kernel.org/all/20241226211639.1357704-1-surenb@google.com
indeed causes this.
Looks like due to the additional mem_alloc_profiling_enabled() check,
the compiler considers allocation size as unknown at compile time
(__builtin_object_size(obj) returns -1) even though both branches of
that condition make the same exact allocation.
I tried changing it to:

#define alloc_hooks_tag(_tag, _do_alloc) \
({ \
        typeof(_do_alloc) _res; \
        struct alloc_tag * __maybe_unused _old; \
         if (mem_alloc_profiling_enabled()) \
                _old =3D alloc_tag_save(_tag); \
        _res =3D _do_alloc; \
         if (mem_alloc_profiling_enabled()) \
                 alloc_tag_restore(_tag, _old); \
        _res; \
})

and that fixes the problem, however this would require two static key
checks... I wonder if there is a way to tell the compiler that both
branches cause the same result. Let me dig around.

>
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202501310832.kiAeOt2z-l=
kp@intel.com/
> >
> > All errors (new ones prefixed by >>):
> >
> > >> drivers/auxdisplay/panel.c:1454:2: error: call to __compiletime_asse=
rt_309 declared with 'error' attribute: BUILD_BUG_ON failed: !__builtin_con=
stant_p(_dest_len) || _dest_len =3D=3D (size_t)-1
> >            strtomem_pad(key->u.kbd.release_str, release, '\0');
> >            ^
> >    include/linux/string.h:417:2: note: expanded from macro 'strtomem_pa=
d'
> >            BUILD_BUG_ON(!__builtin_constant_p(_dest_len) ||            =
    \
> >            ^
> >    include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG=
_ON'
> >            BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #conditi=
on)
> >            ^
> >    include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BU=
G_ON_MSG'
> >    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
> >                                        ^
> >    note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-lim=
it=3D0 to see all)
> >    include/linux/compiler_types.h:530:2: note: expanded from macro '_co=
mpiletime_assert'
> >            __compiletime_assert(condition, msg, prefix, suffix)
> >            ^
> >    include/linux/compiler_types.h:523:4: note: expanded from macro '__c=
ompiletime_assert'
> >                            prefix ## suffix();                         =
    \
> >                            ^
> >    <scratch space>:127:1: note: expanded from here
> >    __compiletime_assert_309
> >    ^
> >    1 error generated.
> >
> >
> > vim +/error +1454 drivers/auxdisplay/panel.c
> >
> > 7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau            2=
008-11-13  1426
> > 7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau            2=
008-11-13  1427  /* tries to bind a key to the signal name <name>. The key =
will send the
> > 7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau            2=
008-11-13  1428   * strings <press>, <repeat>, <release> for these respecti=
ve events.
> > 7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau            2=
008-11-13  1429   * Returns the pointer to the new key if ok, NULL if the k=
ey could not be bound.
> > 7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau            2=
008-11-13  1430   */
> > 36d2041a3d57b9 drivers/staging/panel/panel.c Peter Huewe              2=
013-02-15  1431  static struct logical_input *panel_bind_key(const char *na=
me, const char *press,
> > 36d2041a3d57b9 drivers/staging/panel/panel.c Peter Huewe              2=
013-02-15  1432                                              const char *re=
peat,
> > 36d2041a3d57b9 drivers/staging/panel/panel.c Peter Huewe              2=
013-02-15  1433                                              const char *re=
lease)
> > 698b1515f03914 drivers/staging/panel/panel.c Willy Tarreau            2=
008-11-22  1434  {
> > 7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau            2=
008-11-13  1435          struct logical_input *key;
> > 7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau            2=
008-11-13  1436
> > fdf4a4948ca8a1 drivers/staging/panel/panel.c Dominique van den Broeck 2=
014-05-21  1437          key =3D kzalloc(sizeof(*key), GFP_KERNEL);
> > eb073a9bf2b6ed drivers/staging/panel/panel.c Toshiaki Yamane          2=
012-07-12  1438          if (!key)
> > 7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau            2=
008-11-13  1439                  return NULL;
> > eb073a9bf2b6ed drivers/staging/panel/panel.c Toshiaki Yamane          2=
012-07-12  1440
> > 698b1515f03914 drivers/staging/panel/panel.c Willy Tarreau            2=
008-11-22  1441          if (!input_name2mask(name, &key->mask, &key->value=
, &scan_mask_i,
> > cb46f472cbb08c drivers/staging/panel/panel.c Kulikov Vasiliy          2=
010-07-12  1442                               &scan_mask_o)) {
> > cb46f472cbb08c drivers/staging/panel/panel.c Kulikov Vasiliy          2=
010-07-12  1443                  kfree(key);
> > 7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau            2=
008-11-13  1444                  return NULL;
> > cb46f472cbb08c drivers/staging/panel/panel.c Kulikov Vasiliy          2=
010-07-12  1445          }
> > 698b1515f03914 drivers/staging/panel/panel.c Willy Tarreau            2=
008-11-22  1446
> > 7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau            2=
008-11-13  1447          key->type =3D INPUT_TYPE_KBD;
> > 7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau            2=
008-11-13  1448          key->state =3D INPUT_ST_LOW;
> > 7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau            2=
008-11-13  1449          key->rise_time =3D 1;
> > 7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau            2=
008-11-13  1450          key->fall_time =3D 1;
> > 7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau            2=
008-11-13  1451
> > a952abcdaa2211 drivers/auxdisplay/panel.c    Justin Stitt             2=
023-09-11  1452          strtomem_pad(key->u.kbd.press_str, press, '\0');
> > a952abcdaa2211 drivers/auxdisplay/panel.c    Justin Stitt             2=
023-09-11  1453          strtomem_pad(key->u.kbd.repeat_str, repeat, '\0');
> > a952abcdaa2211 drivers/auxdisplay/panel.c    Justin Stitt             2=
023-09-11 @1454          strtomem_pad(key->u.kbd.release_str, release, '\0'=
);
> > 7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau            2=
008-11-13  1455          list_add(&key->list, &logical_inputs);
> > 7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau            2=
008-11-13  1456          return key;
> > 7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau            2=
008-11-13  1457  }
> > 7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau            2=
008-11-13  1458
> >
> > :::::: The code at line 1454 was first introduced by commit
> > :::::: a952abcdaa22116d940ca9cb9253caad1622ae93 auxdisplay: panel: Repl=
ace deprecated strncpy() with strtomem_pad()
> >
> > :::::: TO: Justin Stitt <justinstitt@google.com>
> > :::::: CC: Kees Cook <keescook@chromium.org>
> >
> > --
> > 0-DAY CI Kernel Test Service
> > https://github.com/intel/lkp-tests/wiki
