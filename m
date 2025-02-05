Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 333451FFC4F
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 19:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738782773; cv=none; b=uySL98VY8XZJZwf/yfe/9KP8HTTwEIvJzPwIuuBjLukUN4qz6jjv4m/L0RJ6wH8uZBVVT3BF5Q9uJzwVfXCA8q9S8zQDhBARNfZBVnXXb5xvBKSJiQOqdZvuXF+VbGCEzx1F8ssbVOTYJLMho13W27KoGc/8IZOOxycsAmIyP7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738782773; c=relaxed/simple;
	bh=iahdpYbNSFhSo34w3MSdClrbQdQIZ9xWlX1UUQzcAkg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=Ch6pmu03kWcgiZOxREvMVGLD9cEXUihLiTxPf6epL2oLkBqHmbBfyS6iA798ONEghe/bmS6WDRa7INfwENCloI/TIgXIE2N4i+Pt0F/ngl/Gvq3D/UEUe1/ozys4UOyOXJ3LDtNlFuupvdaU/SyHOuPlF6/oW5eahLbimn0bV5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=acsFPjcR; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="acsFPjcR"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-21f1d4111d4so2799565ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 11:12:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738782771; x=1739387571; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SDYGos4YuyhkmJWBTPLxeqNYUYDiehcz7TwhBHBC6OM=;
        b=acsFPjcRGOEVTZ1Lwk+bj/XmZR12cvxMQJ6JNXWJWMRXzGLT9neRK2vR7VHmO2I4NK
         9EVeMSDyXFG3F5ZJEQHS7U3a+2SQUTkonv2czYc/aWSC/8aechsiDlizTDbfE0cfxd2v
         YTWNvyiC4RTZ+6GrRoMtFu2P9xMPG213ZtnIDIGK2ZZxcntJKCATU31W51jI9PVV/gI+
         p86EiIbTyLbToJJnT8Frdw/vmFBfjj5idVG4IDvHgrdsONwU/rrtQL57kfPVn8oqnkXH
         ZT/UPKr0g4z2uaAtSEl+SBglAaKNPlMTVwUTwzb9FVhPMCNu6Lstm1bhV0eWMu00McU8
         OM5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738782771; x=1739387571;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SDYGos4YuyhkmJWBTPLxeqNYUYDiehcz7TwhBHBC6OM=;
        b=E+80n6Sy0qC43TMTLvbtWNInRu+erDYaJx0Pb8VVX0KYMfJTTxKjzhl6UOyOs2//Er
         iiuAiSOgIt68LfYD0aGb7kS7UWoTv10gNxXi1bWGhV7/D1EQABNrVu1Qa42j8xOxTqXz
         F0Fy+LpkY+TpA9sCvOLNBpQRNS3bTJIg+FqEzvmrfBa0Q+2FoLu7qfHsz6jXIMYqEXs6
         2WZEa+benM5H8/dePLFVcsuM5swMO3JpKSsxWLBEc2hkhWH7uwrl0Av71LIApt61vp3w
         NzeO5OfYkCrKPpLcDYKSLZF2/mtE7bc100cgO3kvbCnahOS5MRTeip0qJuDYXvdycOBf
         D+IA==
X-Forwarded-Encrypted: i=1; AJvYcCW+754gjfT1+CtQ1NhEaNgRLeY6LJ1qNGmcL+/0kgv768Wr0/lV+yWfowz2bl27O/GJhPdIuWenK1rWP9k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzv1VeijMAkcX8yeWHQ97yg61TW6VGtM5+dGAKK/9iuvJFu4oR+
	BGArgrv0I+Kt1yvyB43e5vBSK/csGrG82yfHpDr2HiloeWsDepwcVfSFSKnTvey5/07WsJDLxII
	BEIe5CihCLw97n0e+uOwFM70uAoabpVJd6/5pmbB4fbMp3Xcw0A==
X-Gm-Gg: ASbGncuqW7htyA6nxeu079rpxUbyAvzUber3xxA4jXoq8fDN+MiAOyob402ppoIWh+K
	ag7PwbDTmq2g3eCH86ykHcTmSKbaRNnvdZy9nWJxaLdI95aepvCqQqd8DDPWfwZCfvb/ij3N5lA
	==
X-Google-Smtp-Source: AGHT+IEKSG5yQ9LBWrVpCKsscgav4ruk5XTPVhXGdFOmv0GSC1jxAlCeWwG9SoIcUUj7tCQq87FIyMzqB3TzsXkB/14=
X-Received: by 2002:a17:902:d2d1:b0:21d:3bd7:afe8 with SMTP id
 d9443c01a7336-21f17ed0ee5mr70948535ad.49.1738782771138; Wed, 05 Feb 2025
 11:12:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250203-vma-v13-0-2b998268a396@google.com> <20250203-vma-v13-2-2b998268a396@google.com>
 <r5xkc2i3tk4za3xkrrvbeqto4kf5l425ursytc3n6tmcy2gylb@eusudybb5dqa>
 <CAH5fLgj00hRAEBvNc8RR8iBwKQ2okDqmWWQ+kqmNkr9mOjfU0w@mail.gmail.com>
 <ymjkf2l2otosunrs3e3mmsj2wr3tvrfmgl4aav5dcpm3gtdulh@dzz4njdwkspc>
 <CAH5fLggd75BvB6VXPjR=_jxn1u7kOfix2rynvMHU4CeUUDHnVA@mail.gmail.com>
 <ebwiebbxomsjamv2uk6gnpg2uzjpqw25llvcz7njadklfi66nk@ab5uyq4bvwlb>
 <CAH5fLgh2Y0rG5ntpdiK-ycn9eBvrSXekxPsjDaYWuHBDUYNppw@mail.gmail.com>
 <ndell4l7fo2pkixo6q5xgdaryuj6wrmnyzthhe42wtumpacak5@oxlrwuwa5e5g>
 <CAH5fLggzX2fZe7zdPXibosYAn3752XeoxXhcbSrAYpw99sdj9w@mail.gmail.com> <cpntwmq7ctikl7hh2p7bqzj4mikcletjob57ynx4jhzo3anxmp@mdp74mdbrsph>
In-Reply-To: <cpntwmq7ctikl7hh2p7bqzj4mikcletjob57ynx4jhzo3anxmp@mdp74mdbrsph>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 5 Feb 2025 20:12:36 +0100
X-Gm-Features: AWEUYZnTNTSi-53FnghUxBYk1LwBTRGMDI_5luJmomFNZ8nQjKuFcTubS-458MM
Message-ID: <CAH5fLgiubF6iamehogfOzY0ukx3W8XstK7tCCcYYx=QDu1uEcw@mail.gmail.com>
Subject: Re: [PATCH v13 2/8] mm: rust: add vm_area_struct methods that require
 read access
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, Alice Ryhl <aliceryhl@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Matthew Wilcox <willy@infradead.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	John Hubbard <jhubbard@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, Jann Horn <jannh@google.com>, 
	Suren Baghdasaryan <surenb@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 5, 2025 at 8:10=E2=80=AFPM Liam R. Howlett <Liam.Howlett@oracle=
.com> wrote:
>
> * Alice Ryhl <aliceryhl@google.com> [250205 10:24]:
> > On Wed, Feb 5, 2025 at 3:38=E2=80=AFPM Liam R. Howlett <Liam.Howlett@or=
acle.com> wrote:
> > >
> > > * Alice Ryhl <aliceryhl@google.com> [250205 07:10]:
> > > > On Tue, Feb 4, 2025 at 4:46=E2=80=AFPM Liam R. Howlett <Liam.Howlet=
t@oracle.com> wrote:
> > > > > > > > > > +        let vma =3D unsafe { bindings::vma_lookup(self=
.mm.as_raw(), vma_addr) };
> > > > > > > > > > +
> > > > > > > > > > +        if vma.is_null() {
> > > > > > > > > > +            None
> > > > > > > > > > +        } else {
> > > > > > > > > > +            // SAFETY: We just checked that a vma was =
found, so the pointer is valid. Furthermore,
> > > > > > > > > > +            // the returned area will borrow from this=
 read lock guard, so it can only be used
> > > > > > > > > > +            // while the mmap read lock is still held.
> > > > > > > > >
> > > > > > > > > So We have complicated the locking of the vmas with rcu a=
nd per-vma
> > > > > > > > > locking recently.  We are now able to look up and use a v=
ma under the
> > > > > > > > > rcu read lock.  Does this translate to rust model?
> > > > > > > > >
> > > > > > > > > I believe this is true in recent version of binder as wel=
l?
> > > > > > > >
> > > > > > > > Yes. The safety requirements of VmAreaRef is that you must =
hold the
> > > > > > > > mmap read lock *or* the vma read lock while you have a VmAr=
eaRef
> > > > > > > > reference. This particular method achieves that requirement=
 by holding
> > > > > > > > the mmap read lock. But there is also a Rust lock_vma_under=
_rcu(), see
> > > > > > > > patch 4 for that.
> > > > > > >
> > > > > > > Right, okay.  Thanks.  You can get the reference by only hold=
ing the rcu
> > > > > > > read lock, but you should hold the vma lock to ensure that th=
e vma
> > > > > > > itself (and not just the pointer) is safe to use.
> > > > > >
> > > > > > Hmm... To modify the vma, you must hold the mmap *and* vma writ=
e lock,
> > > > > > so holding the mmap read lock prevents mutations?
> > > > >
> > > > > Sorry, I think I confused things with my answer.  Your code is fi=
ne.
> > > > > The phrasing of the "only be used while the mmap read lock is sti=
ll
> > > > > held" made me wonder about further clarification on the locking h=
ere
> > > > > (because the locking is confusing).
> > > > >
> > > > > Yes, mmap read lock means there are no writers that can modify th=
e vma.
> > > > > Essentially, you are using the lock to ensure the entire vma spac=
e isn't
> > > > > changed during your operation - which is heavier than just lockin=
g one
> > > > > vma.
> > > >
> > > > I could extend the safety comment like this:
> > > >
> > > > SAFETY: We just checked that a vma was found, so the pointer is val=
id.
> > > > Furthermore, the returned area will borrow from this read lock guar=
d,
> > > > so it can only be used while the mmap read lock is still held. This
> > > > ensures that there are no writers because writers must hold both th=
e
> > > > mmap and vma write lock.
> > >
> > > How about just changing the last part to:
> > >
> > > Furthermore, the returned vma is still under the protection of the re=
ad
> > > lock guard and can be used while the mmap read lock is still held.
> >
> > Well, the important part here is that you can't do this:
> >
> > let guard =3D mm.mmap_read_lock();
> > let vma =3D guard.vma_lookup(...)?;
> > drop(guard);
> > vma.foo();
> >
> > since that would use the vma after the lock has been released. The
> > reason that the above is prevented is because `vma` borrows from
> > `guard`, so you can only use `vma` while `guard` is still valid.
> >
>
> But it implies that this isn't valid:
>
>  let guard =3D mm.mmap_read_lock();
>  let vma =3D guard.vma_lookup(...)?;
>
>  vma_lock(vma);
>
>  drop(guard);
>  vma.foo();
>
>  vma_unlock(vma);
>
> See mm/userfaultfd.c:uffd_lock_vma(), which falls back to mmap read lock
> to do this if rcu lock + lock_vma_under_rcu() is unable to lock the vma.

This patchset does not have the functionality for doing that, but it's
definitely possible to add.

Alice
