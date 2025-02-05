Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 330B71FC0E9
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 19:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738783615; cv=none; b=bSyBu3+2tvzWi8JWx/htFZ+uvdhMn2y+gK3Gbn7liQiS8AEtG2+kd1mlya17GKVWKkkNIyKstnkck44uXm7P707K7GR7BX1Ngv2WMrwL3G5QhPv9zKoAkR+zgcRVI3cs9kAE7DDWpt6ci5Cc5UuF9MxF8+ED46jT8DnuWbcOX7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738783615; c=relaxed/simple;
	bh=VtuzwaO1UIpSiN1NWgv13ji0EBt+Lm3iMDhCqtgAVv4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=NNfJ85FIRPm8URZnp6QFVY37H7HstNocmFxtVxpQDpXjeOwiKRA8oem6dQARGWxaLzFdHNX/tt6GEDz/Rtg03ZH/56CwFFexis66rDkSiNJRAkMo30BqsKA6dxta5I/Q4STsOUDL+tghcEkkAnhjHmNj3DNY4FNAGIL1WKMHf0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JOdhACKB; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JOdhACKB"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2f9bed1f521so70450a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 11:26:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738783612; x=1739388412; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MmbnpngJ3DL1qyen+QtnZGx2BFNC9m60wSqAfP+/agE=;
        b=JOdhACKBTrSQ0j0q9+qaKiiXUx0OkeGddlE+AfaC8/l/kvyON5TBeIwfuNeh4FtZOT
         8t+xoaUcWus66HYv9+cAi2NhuWcYG+xI2s46Bj4SLiIDp5fbpCcoIv1Q8xGWlieR7mcf
         9bSHtN5CKFym7rRnX92/CyuCVKWi1HoMrNUmUc26Gpe9k94LFFhJl4bXP1XSCnpyqZDj
         14XfRsHvNFfhMyem20yrdp4KakzPFAMoFiofguRbWhe3rW7d3FSqjSt+1K2pie04RqJv
         npdw+BKlAt/7B1xWiAWuJiict3BNJgAW6b0klDXmHeIsTBYAh2tUGvqtgP7fu2GVxirl
         pjBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738783612; x=1739388412;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MmbnpngJ3DL1qyen+QtnZGx2BFNC9m60wSqAfP+/agE=;
        b=UkTzHF5WipjM63X2aFZi66KbiUf4m88jfwOY+tM8mu3xm9qf+30zEvC/3E3Uqlx9Sr
         rKnF/NYICo2u0rqmpaDrUS5+c21vK1aEe5qE+PI2gRC808nLVXhWHgIDsFbU1ZTu06jJ
         uL5vJbomq+ByUyAuLmFVJzaxeYfDEweE2tGB19jdzzcu3yinxZ+AFQNmsZJUlk88y/mJ
         iF6fnscmCcu0pIWQnA9Zl1yIAI4rITrtBSmx2hSdDcoua9mVxNDsfDhD8WeOtyTpH90m
         mFMET6Ec1RaxHJtZhKdLL8H3LrHH0yj4JdIZbSHvcTwPa1kaHIpqxglBnasB+cvyB55J
         /8Aw==
X-Forwarded-Encrypted: i=1; AJvYcCUkM/cABxw8cnkseZFIA6lmW4ZEEErPNTKbJDaDYFzMoCSi6BV2G34g+HBZGGmTl0ekbyCiMFQ71SHFEVY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7ElRwknrHQ4uln+meQplapUNECF5j0PU5+sbvLxC8gJa+4Ngl
	r3Yx9sI6UcxzMh8Xsjzk7rcJRFrgUStqqkZN0FT/iq7bJ9mWsUcnXH1y7LFyA4jWM/Z0u+snDFq
	DGf7FGX6Tym0PV19OszYZvkT8+5HRj9eG0ZRV
X-Gm-Gg: ASbGncsrm6inFwchmfsLddOCkZbX9dPWsmshudeTV0datEAy2aATh4QvIRA6YsEiyRO
	CCoQvs5h2+9eGe2SX4IgNpNq0eghiqqEkuwuAY044cQd5y/vjJ+7gSCl2WH5+1OmV60529W7yqQ
	==
X-Google-Smtp-Source: AGHT+IHzVkEKXP6lO5RnqJmb9qi2tv+pxW8vj1o+pqT6K3FSm02zP+0yw9hTQ2smxMLPtNWgNGDZjFBTp2DOwaCNi30=
X-Received: by 2002:a17:90b:3a4f:b0:2ee:8e75:4aeb with SMTP id
 98e67ed59e1d1-2f9e07891d7mr6950893a91.17.1738783612153; Wed, 05 Feb 2025
 11:26:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <r5xkc2i3tk4za3xkrrvbeqto4kf5l425ursytc3n6tmcy2gylb@eusudybb5dqa>
 <CAH5fLgj00hRAEBvNc8RR8iBwKQ2okDqmWWQ+kqmNkr9mOjfU0w@mail.gmail.com>
 <ymjkf2l2otosunrs3e3mmsj2wr3tvrfmgl4aav5dcpm3gtdulh@dzz4njdwkspc>
 <CAH5fLggd75BvB6VXPjR=_jxn1u7kOfix2rynvMHU4CeUUDHnVA@mail.gmail.com>
 <ebwiebbxomsjamv2uk6gnpg2uzjpqw25llvcz7njadklfi66nk@ab5uyq4bvwlb>
 <CAH5fLgh2Y0rG5ntpdiK-ycn9eBvrSXekxPsjDaYWuHBDUYNppw@mail.gmail.com>
 <ndell4l7fo2pkixo6q5xgdaryuj6wrmnyzthhe42wtumpacak5@oxlrwuwa5e5g>
 <CAH5fLggzX2fZe7zdPXibosYAn3752XeoxXhcbSrAYpw99sdj9w@mail.gmail.com>
 <cpntwmq7ctikl7hh2p7bqzj4mikcletjob57ynx4jhzo3anxmp@mdp74mdbrsph>
 <CAH5fLgiubF6iamehogfOzY0ukx3W8XstK7tCCcYYx=QDu1uEcw@mail.gmail.com> <gj7gumsc4firifafsmh5lujdc2rtvift6zmlzlf2zs6vldtxoq@a3erpxzryuyj>
In-Reply-To: <gj7gumsc4firifafsmh5lujdc2rtvift6zmlzlf2zs6vldtxoq@a3erpxzryuyj>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 5 Feb 2025 20:26:37 +0100
X-Gm-Features: AWEUYZnnZJe07H7TIydA2x3nzJT0dH0fV9QfxfWxxhay7a-Ui4HLr0prchezvEo
Message-ID: <CAH5fLghSnbvBSvqDQj-7OnFEs0s3QXTRFL54au+YC3ML4eDN-w@mail.gmail.com>
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

On Wed, Feb 5, 2025 at 8:22=E2=80=AFPM Liam R. Howlett <Liam.Howlett@oracle=
.com> wrote:
>
> * Alice Ryhl <aliceryhl@google.com> [250205 14:13]:
> > On Wed, Feb 5, 2025 at 8:10=E2=80=AFPM Liam R. Howlett <Liam.Howlett@or=
acle.com> wrote:
> > >
> > > * Alice Ryhl <aliceryhl@google.com> [250205 10:24]:
> > > > On Wed, Feb 5, 2025 at 3:38=E2=80=AFPM Liam R. Howlett <Liam.Howlet=
t@oracle.com> wrote:
> > > > >
> > > > > * Alice Ryhl <aliceryhl@google.com> [250205 07:10]:
> > > > > > On Tue, Feb 4, 2025 at 4:46=E2=80=AFPM Liam R. Howlett <Liam.Ho=
wlett@oracle.com> wrote:
> > > > > > > > > > > > +        let vma =3D unsafe { bindings::vma_lookup(=
self.mm.as_raw(), vma_addr) };
> > > > > > > > > > > > +
> > > > > > > > > > > > +        if vma.is_null() {
> > > > > > > > > > > > +            None
> > > > > > > > > > > > +        } else {
> > > > > > > > > > > > +            // SAFETY: We just checked that a vma =
was found, so the pointer is valid. Furthermore,
> > > > > > > > > > > > +            // the returned area will borrow from =
this read lock guard, so it can only be used
> > > > > > > > > > > > +            // while the mmap read lock is still h=
eld.
> > > > > > > > > > >
> > > > > > > > > > > So We have complicated the locking of the vmas with r=
cu and per-vma
> > > > > > > > > > > locking recently.  We are now able to look up and use=
 a vma under the
> > > > > > > > > > > rcu read lock.  Does this translate to rust model?
> > > > > > > > > > >
> > > > > > > > > > > I believe this is true in recent version of binder as=
 well?
> > > > > > > > > >
> > > > > > > > > > Yes. The safety requirements of VmAreaRef is that you m=
ust hold the
> > > > > > > > > > mmap read lock *or* the vma read lock while you have a =
VmAreaRef
> > > > > > > > > > reference. This particular method achieves that require=
ment by holding
> > > > > > > > > > the mmap read lock. But there is also a Rust lock_vma_u=
nder_rcu(), see
> > > > > > > > > > patch 4 for that.
> > > > > > > > >
> > > > > > > > > Right, okay.  Thanks.  You can get the reference by only =
holding the rcu
> > > > > > > > > read lock, but you should hold the vma lock to ensure tha=
t the vma
> > > > > > > > > itself (and not just the pointer) is safe to use.
> > > > > > > >
> > > > > > > > Hmm... To modify the vma, you must hold the mmap *and* vma =
write lock,
> > > > > > > > so holding the mmap read lock prevents mutations?
> > > > > > >
> > > > > > > Sorry, I think I confused things with my answer.  Your code i=
s fine.
> > > > > > > The phrasing of the "only be used while the mmap read lock is=
 still
> > > > > > > held" made me wonder about further clarification on the locki=
ng here
> > > > > > > (because the locking is confusing).
> > > > > > >
> > > > > > > Yes, mmap read lock means there are no writers that can modif=
y the vma.
> > > > > > > Essentially, you are using the lock to ensure the entire vma =
space isn't
> > > > > > > changed during your operation - which is heavier than just lo=
cking one
> > > > > > > vma.
> > > > > >
> > > > > > I could extend the safety comment like this:
> > > > > >
> > > > > > SAFETY: We just checked that a vma was found, so the pointer is=
 valid.
> > > > > > Furthermore, the returned area will borrow from this read lock =
guard,
> > > > > > so it can only be used while the mmap read lock is still held. =
This
> > > > > > ensures that there are no writers because writers must hold bot=
h the
> > > > > > mmap and vma write lock.
> > > > >
> > > > > How about just changing the last part to:
> > > > >
> > > > > Furthermore, the returned vma is still under the protection of th=
e read
> > > > > lock guard and can be used while the mmap read lock is still held=
.
> > > >
> > > > Well, the important part here is that you can't do this:
> > > >
> > > > let guard =3D mm.mmap_read_lock();
> > > > let vma =3D guard.vma_lookup(...)?;
> > > > drop(guard);
> > > > vma.foo();
> > > >
> > > > since that would use the vma after the lock has been released. The
> > > > reason that the above is prevented is because `vma` borrows from
> > > > `guard`, so you can only use `vma` while `guard` is still valid.
> > > >
> > >
> > > But it implies that this isn't valid:
> > >
> > >  let guard =3D mm.mmap_read_lock();
> > >  let vma =3D guard.vma_lookup(...)?;
> > >
> > >  vma_lock(vma);
> > >
> > >  drop(guard);
> > >  vma.foo();
> > >
> > >  vma_unlock(vma);
> > >
> > > See mm/userfaultfd.c:uffd_lock_vma(), which falls back to mmap read l=
ock
> > > to do this if rcu lock + lock_vma_under_rcu() is unable to lock the v=
ma.
> >
> > This patchset does not have the functionality for doing that, but it's
> > definitely possible to add.
> >
>
> I don't think that's necessary right now.  It's just that I read that
> comment and it seemed to imply something that isn't strictly true with
> the "only valid" part.  I think?  Is rust doing something that makes it
> true?

The code would look like:

let guard =3D mm.mmap_read_lock();
let vma =3D guard.vma_lookup(...)?;
let vma_guard =3D vma.vma_lock();
drop(guard); // this is mmap_read_unlock()
vma_guard.foo();
drop(vma_guard); // this is vma_unlock()

So you couldn't use vma after drop(guard), but vma_guard would be
usable. (And of course the drop calls also happen automatically at the
end of the scope if you do not drop it explicitly.)

Alice
