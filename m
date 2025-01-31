Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C47A61F03D4
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 16:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738342521; cv=none; b=I12YFpe3MYkyrc/BYcL9dEMJhdBFBJynxmPV1jXdnCKat63yqpklMGp1eNYpnqlTPX+kU3BdQFtOJailUzETiZOPBS6zj9tqJOlAN9ipuCOr3AztBpEV1h8jUTdq5DOwqop1gz5JGC1ACnuN8e427TZIGIg4esr8XoCD1Pdmi0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738342521; c=relaxed/simple;
	bh=pjps5y8eCDakmlM5FC2/Anvhtb8QY5n2MJnEURvNdFQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kktCekl7J+wppImo+h8HBmchfPQ+h5qMzfqlUG3hlWqz/EFK7Qr2BsYXGMi14GWAtL5DujR0weLW7B6bmRQYf0wSQfj/00UZxWaMhLPCVT9BEawCURU18Z94PLBrWu4HWsxIg4kdQx6gzf1wPLo+2nsN2geCmintbv0f7ClrZhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3lnagQFA; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3lnagQFA"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-467abce2ef9so275771cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 08:55:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738342518; x=1738947318; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CiUpenCZxJlzpmTDMs9YPmAFAkUqTeg5FHFQqHk9RHY=;
        b=3lnagQFA8LFiHm0m9Rp9Iu+pPms1qc2hHRXtVywGkTj3dYc3CXZCi5oFqNvlKq3C+C
         GPjBzt5jdUxpJEkrvsPxL3wnBvAcemDV+JsGI15yL3jRFToWJONif0LUHVxjV0DYHFjJ
         AhQJ/0St+DH+fgMbXv5KAV3KZY+3joQFF4YX+uzsQmv0kpCso0wpfkLlXjkilW41NyvD
         tL1bRAk0EZ1ydeki0Drc4mbIumev6ng9uw0M9iwp80o4PB3biS5xv6Topa8sinRGVmTo
         Iy4/P/qoWWqfvRKE8/ai24CVDXhHTirpi/qEnci6HQz1LWE+YFT4nPHeC1Vpk7UkR3Q2
         9eFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738342518; x=1738947318;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CiUpenCZxJlzpmTDMs9YPmAFAkUqTeg5FHFQqHk9RHY=;
        b=tarrTVp8xpvwBt1VgpMxsvTLb+cRN6Gb9NTIwEgySCGvl9hnB9KCBxBzbTkTlxabZU
         IP+xXBOyWfBeYwY7CTVogQD7J8V8qyHpo56XcSrpOwtDBPUAHLL5HSNBZI5k/28Ufa1z
         1I8/0x4BtDvDlEg+I5skJSaIIIOhKIO2uFkArTXhB1vpppL9LkTzqITNSZ8cpGybp80n
         n/MU9KVe3DHZmpjV4dRuRmwT0S9648jZY1H8TDw3i2MFxSZTJhGcYdapkf/fZRqYFT4p
         PmVdHDGZvP4EYFKpogtNwuP/tDKn5jFCqyzxWzhdOXWBNVJk5Edwoo+jauSfHN57zOzZ
         MHww==
X-Forwarded-Encrypted: i=1; AJvYcCVJmbjkuJFAzjdIlfQFi+oVisKb3FoTQfcuDdJE03EsVmA+zmAL8zQ0kwACRwGNPYpsekn9TJ1s70Vkkpg=@vger.kernel.org
X-Gm-Message-State: AOJu0YycWNX12QE+SZyq+5iwjVexMMw/aBg71szUz4VIzDDArAeNKmjG
	EQkxH1n5TO70q3kA5Z43tYFM+BMXqSOXMLNJBK3k6whp0sD1VyWNH7aGUOhTtnyH2hdiXfZXnF/
	r1S4KicnFIdHvoTIzVzyR+mHK42NaBTsyiHQs
X-Gm-Gg: ASbGncvtTW+xKF1Hc8ZeG5gKD/cbAThXkqoLZAbjWtwbMRXaiadxH28uFwtDM4PHPxD
	TpLtu1s7r27kqYvmwjzokWYEVPcag/irCthjnI7t9JiwgWyB04JQ8TzjCvLQu0SB5SFtEII85
X-Google-Smtp-Source: AGHT+IFMf+rwBBW0+s+U4Vnm90r1939kVenRZFSqmclphCk64JCB0JGIQO9cHEfYkOZIskrJCqf7t8+3AvdsvNV4Nrg=
X-Received: by 2002:a05:622a:6098:b0:46e:131e:5ba6 with SMTP id
 d75a77b69052e-46fead85a14mr4010531cf.0.1738342518324; Fri, 31 Jan 2025
 08:55:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <202501310832.kiAeOt2z-lkp@intel.com>
In-Reply-To: <202501310832.kiAeOt2z-lkp@intel.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 31 Jan 2025 08:55:07 -0800
X-Gm-Features: AWEUYZlYmGqQyjVr7VWqyAmQe2tSBpC7UL1Yuh4KOHDcRsgzbL_zqpzPBxkbf0s
Message-ID: <CAJuCfpGrtTK=reeVPrS+GQngs=WS-cZvy_YU9-JGyRgVFdofAw@mail.gmail.com>
Subject: Re: drivers/auxdisplay/panel.c:1454:2: error: call to
 __compiletime_assert_309 declared with 'error' attribute: BUILD_BUG_ON
 failed: !__builtin_constant_p(_dest_len) || _dest_len == (size_t)-1
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, 
	Linux Memory Management List <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 30, 2025 at 4:06=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   b4b0881156fb8209bf5ef6cb63211bb0ad6e1a6b
> commit: 07438779313caafe52ac1a1a6958d735a5938988 alloc_tag: avoid current=
->alloc_tag manipulations when profiling is disabled
> date:   5 days ago
> config: hexagon-randconfig-r133-20250131 (https://download.01.org/0day-ci=
/archive/20250131/202501310832.kiAeOt2z-lkp@intel.com/config)
> compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c=
006a5895fc0e329fe15fead81e37457cb1d1)
> reproduce: (https://download.01.org/0day-ci/archive/20250131/202501310832=
.kiAeOt2z-lkp@intel.com/reproduce)

Just saw this report (was on vacation). Will try to figure out what's going=
 on.

>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202501310832.kiAeOt2z-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> drivers/auxdisplay/panel.c:1454:2: error: call to __compiletime_assert=
_309 declared with 'error' attribute: BUILD_BUG_ON failed: !__builtin_const=
ant_p(_dest_len) || _dest_len =3D=3D (size_t)-1
>            strtomem_pad(key->u.kbd.release_str, release, '\0');
>            ^
>    include/linux/string.h:417:2: note: expanded from macro 'strtomem_pad'
>            BUILD_BUG_ON(!__builtin_constant_p(_dest_len) ||              =
  \
>            ^
>    include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_O=
N'
>            BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition=
)
>            ^
>    include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_=
ON_MSG'
>    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
>                                        ^
>    note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
>    include/linux/compiler_types.h:530:2: note: expanded from macro '_comp=
iletime_assert'
>            __compiletime_assert(condition, msg, prefix, suffix)
>            ^
>    include/linux/compiler_types.h:523:4: note: expanded from macro '__com=
piletime_assert'
>                            prefix ## suffix();                           =
  \
>                            ^
>    <scratch space>:127:1: note: expanded from here
>    __compiletime_assert_309
>    ^
>    1 error generated.
>
>
> vim +/error +1454 drivers/auxdisplay/panel.c
>
> 7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau            200=
8-11-13  1426
> 7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau            200=
8-11-13  1427  /* tries to bind a key to the signal name <name>. The key wi=
ll send the
> 7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau            200=
8-11-13  1428   * strings <press>, <repeat>, <release> for these respective=
 events.
> 7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau            200=
8-11-13  1429   * Returns the pointer to the new key if ok, NULL if the key=
 could not be bound.
> 7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau            200=
8-11-13  1430   */
> 36d2041a3d57b9 drivers/staging/panel/panel.c Peter Huewe              201=
3-02-15  1431  static struct logical_input *panel_bind_key(const char *name=
, const char *press,
> 36d2041a3d57b9 drivers/staging/panel/panel.c Peter Huewe              201=
3-02-15  1432                                              const char *repe=
at,
> 36d2041a3d57b9 drivers/staging/panel/panel.c Peter Huewe              201=
3-02-15  1433                                              const char *rele=
ase)
> 698b1515f03914 drivers/staging/panel/panel.c Willy Tarreau            200=
8-11-22  1434  {
> 7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau            200=
8-11-13  1435          struct logical_input *key;
> 7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau            200=
8-11-13  1436
> fdf4a4948ca8a1 drivers/staging/panel/panel.c Dominique van den Broeck 201=
4-05-21  1437          key =3D kzalloc(sizeof(*key), GFP_KERNEL);
> eb073a9bf2b6ed drivers/staging/panel/panel.c Toshiaki Yamane          201=
2-07-12  1438          if (!key)
> 7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau            200=
8-11-13  1439                  return NULL;
> eb073a9bf2b6ed drivers/staging/panel/panel.c Toshiaki Yamane          201=
2-07-12  1440
> 698b1515f03914 drivers/staging/panel/panel.c Willy Tarreau            200=
8-11-22  1441          if (!input_name2mask(name, &key->mask, &key->value, =
&scan_mask_i,
> cb46f472cbb08c drivers/staging/panel/panel.c Kulikov Vasiliy          201=
0-07-12  1442                               &scan_mask_o)) {
> cb46f472cbb08c drivers/staging/panel/panel.c Kulikov Vasiliy          201=
0-07-12  1443                  kfree(key);
> 7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau            200=
8-11-13  1444                  return NULL;
> cb46f472cbb08c drivers/staging/panel/panel.c Kulikov Vasiliy          201=
0-07-12  1445          }
> 698b1515f03914 drivers/staging/panel/panel.c Willy Tarreau            200=
8-11-22  1446
> 7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau            200=
8-11-13  1447          key->type =3D INPUT_TYPE_KBD;
> 7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau            200=
8-11-13  1448          key->state =3D INPUT_ST_LOW;
> 7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau            200=
8-11-13  1449          key->rise_time =3D 1;
> 7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau            200=
8-11-13  1450          key->fall_time =3D 1;
> 7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau            200=
8-11-13  1451
> a952abcdaa2211 drivers/auxdisplay/panel.c    Justin Stitt             202=
3-09-11  1452          strtomem_pad(key->u.kbd.press_str, press, '\0');
> a952abcdaa2211 drivers/auxdisplay/panel.c    Justin Stitt             202=
3-09-11  1453          strtomem_pad(key->u.kbd.repeat_str, repeat, '\0');
> a952abcdaa2211 drivers/auxdisplay/panel.c    Justin Stitt             202=
3-09-11 @1454          strtomem_pad(key->u.kbd.release_str, release, '\0');
> 7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau            200=
8-11-13  1455          list_add(&key->list, &logical_inputs);
> 7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau            200=
8-11-13  1456          return key;
> 7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau            200=
8-11-13  1457  }
> 7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau            200=
8-11-13  1458
>
> :::::: The code at line 1454 was first introduced by commit
> :::::: a952abcdaa22116d940ca9cb9253caad1622ae93 auxdisplay: panel: Replac=
e deprecated strncpy() with strtomem_pad()
>
> :::::: TO: Justin Stitt <justinstitt@google.com>
> :::::: CC: Kees Cook <keescook@chromium.org>
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
