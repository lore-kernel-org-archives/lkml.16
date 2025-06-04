Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8066F1804A
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 07:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749020637; cv=none; b=feHc0PuR3DCWan2GyfbONsDZhI4VmYpPNwbZKAbUGKfGYwaDsXEpZm8Nx9ddfjAIB/s0a9UwKriQ81XYMbVbLkZG7m34+GgcAnQUOr83cx4QSLPYWdC2JSK1O3uGg1WDvTjFCcU+UhzxtygqZZ6z6IbEwHMdPOjUQQ+9l1XAcuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749020637; c=relaxed/simple;
	bh=Q3LfO/G8NrUMy3TOD7vTgTxVEtuU6puREeErEx0CNmM=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=BqYeYeeW6OxxwBbvr0TCQcUR+smqQZ49AIkYK/Q8AqplnD7JGY3hBoTPgiLtNLZfQ/BTP/7enmPSZrjMNfA/2ZI9fY0ogbdZP19DBMiLfqbrLAaGGQx/4QOHHThSC53/ULjRJey5QdSsL5VJ54megh9ft1gmlRcqxPr9JJbwsgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iMIAFKwC; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iMIAFKwC"
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-4034118aeb7so1409332b6e.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 00:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749020634; x=1749625434; darn=vger.kernel.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=40ajQCpqDRjpuGjCnS6LNsF3WHnh2o2xFeFnau3dKQk=;
        b=iMIAFKwC3AlZyQ/L1sZ4bKtUhbBBKJZcv0Q733J9u5nES5Vb5rByavVWyBCJusr56T
         rY/+w8pcDxF8Qai4afk3VlyyCFHySGFCel7MPlRTe9qGJ7hCFpUA2UNFruBbvaQ24TXz
         U7aOAuOJaxokzEs68OW6Kz81XOJas0gl/8Vltjmc7CeOVLp7CJph8pOhF54Al4zzoqbc
         9vQv4UDSBP6zWuggRuKcgLDlRW6+pBjU8PoH2ZztKa+NshqQ7dnwZsHX7mdQnvSFzJmr
         k9xFJol8c3XrNmW8sRqxCV/5O/JKW4df02tWpfi2n/hZyQRueb+F7/kXDtt+ouOdxoGk
         bChA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749020634; x=1749625434;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=40ajQCpqDRjpuGjCnS6LNsF3WHnh2o2xFeFnau3dKQk=;
        b=GKN0svygfY4wUlljxLyAHwdxXl+VO5EbQnrrfJZWItTysIGz8Y3RiUZMwZ6CjaweU8
         F6EuE5Uwwyb9d5Gw/tnZfBbHf9Hv7z93DtbYVW+t6ghU+KS8Fi1EatCl3Zve27kyDvm2
         Zfx6jWrpjfNgz9Mpquhc1FEJgroS6FRXMcFSWLHCz3+DuFq7HDc57bFxgyX48IDxB4p5
         6g53XvXr0ZnmfHro0FRtijutdfSTJJEmA9N2JhoGQir8EOC7GvYrZQr28ebVQOh3gnRG
         tkiy76J4/XHbtDQki1/+QIo8IUnffAuEbMFXbZ6061SUu56Xrd5Gt9Rr3AR3KFGkJ4a4
         EmRw==
X-Forwarded-Encrypted: i=1; AJvYcCWltUcK/9cKTOWIVFTpa3AVel5DlyVaEHlr+4U+NqluchhIZUVMCN9Q90wGZJJiaF+tEUp2uOJfdKn5OUY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3sNvNkROUXUvc0Xt2oUzQcIlpEXIt7nJzKouueEVA7QE9Hkof
	wn/iik/JPkx5gae+Uw21NYOlYpAG0zxzNKc86Q76ulWvWQHwWHROx1mVLBmQaylVpA==
X-Gm-Gg: ASbGncvPk7wil1/mevMay2P6sNh8cBIUqRgc17kEmjcEpQs9l55EQtvfSZQgkh3Q2gk
	m5hunAP/Xsj8WBvDeJlJs+ZDvD4Wy6uc2uAXX346fZpOMcnnpiyojTKadx/j31e1sjASQBOjiuJ
	3hv8gccp+EBwfd0yqVY3u7pCLoLISV3M4c5XU4jP9SG7VYC3U6sOI1la+vzXX32lX0WTyHQlfeZ
	lkZj5YfglpPydb4+lLyZmGS6W+nxIRTlr9tw2rFD0lHCWBwznVTQ4673JXQ1p+5h1T7EqX8sQPF
	xaEpso5tAxsA7IERLsGFBCS0bRjOtlWptjljsYfAzAGRg0s1QlFs3wG0YZMBgZzD/QvC3PSCzex
	C990tdK8S0BSupShAeUoXcg+50myGhpUHjqywJruHUWNcLA==
X-Google-Smtp-Source: AGHT+IFdbMc3chGS05aazK3NptvjeJGMEive3vKl+DZZ1wIg+JEq+OKIn9JnQGVLtzmO09GrSJUS4w==
X-Received: by 2002:a05:6808:6b96:b0:3f6:a476:f7d3 with SMTP id 5614622812f47-408f0ed6388mr1629259b6e.9.1749020634210;
        Wed, 04 Jun 2025 00:03:54 -0700 (PDT)
Received: from darker.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40678bf3374sm2140123b6e.8.2025.06.04.00.03.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 00:03:52 -0700 (PDT)
Date: Wed, 4 Jun 2025 00:03:18 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
    Steven Rostedt <rostedt@goodmis.org>
cc: Linus Torvalds <torvalds@linux-foundation.org>, 
    Matthew Wilcox <willy@infradead.org>, Hugh Dickins <hughd@google.com>, 
    LKML <linux-kernel@vger.kernel.org>, linux-mm@kvack.org, 
    Andrew Morton <akpm@linux-foundation.org>, 
    Christian Koenig <christian.koenig@amd.com>, Huang Rui <ray.huang@amd.com>, 
    Matthew Auld <matthew.auld@intel.com>, 
    Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org, 
    Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
    Maxime Ripard <mripard@kernel.org>, 
    Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
    Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH] mm: Fix compile error when CONFIG_SHMEM is not set
In-Reply-To: <20250603140632.168190f9@gandalf.local.home>
Message-ID: <dca861b8-a29d-b2b3-eba7-32aaf2b8eff7@google.com>
References: <20250602170500.48713a2b@gandalf.local.home> <20250602171458.7ceabb1c@gandalf.local.home> <aD4boBrdZXtz_5kL@casper.infradead.org> <fc2b6a94-bd2d-a5d9-c935-381a1613f47e@google.com> <20250603102959.20c85adb@gandalf.local.home>
 <aD8iL4cFoXpIVK_0@casper.infradead.org> <20250603132736.554f611d@gandalf.local.home> <CAHk-=whb2rMUCGsaNQC4pkCikJ7iX2_Tc1ye5_a6R9-vAkd2Cg@mail.gmail.com> <20250603140632.168190f9@gandalf.local.home>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="-1463770367-150941725-1749020632=:5058"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463770367-150941725-1749020632=:5058
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

Adding Thomas Hellstr=C3=B6m, father of ttm_backup_backup_page():
Steve doesn't have CONFIG_SHMEM=3Dy, so now gets a build error because
there's no shmem_writeout(); whereas before 6.16, backup_backup
writeback would have oopsed on calling NULL ram_aops.writepage
when CONFIG_SHMEM is not set.

On Tue, 3 Jun 2025, Steven Rostedt wrote:
> On Tue, 3 Jun 2025 10:54:49 -0700
> Linus Torvalds <torvalds@linux-foundation.org> wrote:
> > On Tue, 3 Jun 2025 at 10:26, Steven Rostedt <rostedt@goodmis.org> wrote=
:
> > >
> > >  config DRM_TTM
> > >         tristate
> > > -       depends on DRM && MMU
> > > +       depends on DRM && MMU && SHMEM =20
> >=20
> > Yeah, except I think you should just make it be
> >=20
> >           depends on DRM && SHMEM
> >=20
> > because SHMEM already depends on MMU.
>=20
> Yeah, if I had made this a real patch I would have done that, but this wa=
s
> only for seeing it it would work.

Many in drivers/gpu/drm do already "select SHMEM",
so I came to think that

--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -188,6 +188,7 @@ source "drivers/gpu/drm/display/Kconfig"
 config DRM_TTM
 =09tristate
 =09depends on DRM && MMU
+=09select SHMEM
 =09help
 =09  GPU memory management subsystem for devices with multiple
 =09  GPU memory types. Will be enabled automatically if a device driver

would be the right answer.

But perhaps that adds bloat to kernels that don't need backup_backup
writeback, and some #ifdef CONFIG_SHMEMs in or around backup_backup
would be more to the point.  Maybe add that "select SHMEM" line
before rc1, then refine ttm_backup.c with #ifdefs at leisure?

But I just don't appreciate backup_backup and its place in the
drm world: it's a matter for Thomas and dri-devel to work out.

>=20
> >=20
> > That said, our docs already say that if you disable SHMEM, it gets
> > replaced by RAMFS, so maybe just having a ramfs version is the
> > RightThing(tm).
> >=20
> > I don't think such a ramfs version should just return 0 - much less an
> > error. I think it should always redirty the page.
> >=20
> > IOW, I think the "ramfs" version should look something like
> >=20
> >         folio_mark_dirty(folio);
> >         if (wbc->for_reclaim)
> >                 return AOP_WRITEPAGE_ACTIVATE;  /* Return with folio lo=
cked */
> >         folio_unlock(folio);
> >         return 0;
> >=20
> > which is what shmem does for the "page is locked" case.
>=20
> I'll let someone that understand the code a bit more than I do to make su=
ch
> a change. My patch was just a "this makes my system build" thing and let
> those that know this code do the RightThing(tm).

I did start out from the position that mm/shmem.c should provide a good
shmem_writeout() stub for the tiny !CONFIG_SHMEM case.  But seeing as
nobody else has wanted it before, and backup_backup would have been
crashing in such a case, it now seems to me pointless to add such a stub.

Unless all those drm "select SHMEM"s got added long ago to avoid exactly
such crashes, and a shmem stub is preferred throughout drivers/gpu/drm.

I vote for the "select SHMEM", but Thomas and dri-devel and Linus
should decide.

Hugh
---1463770367-150941725-1749020632=:5058--
