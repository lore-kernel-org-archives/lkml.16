Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A71F214208
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 15:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738681558; cv=none; b=R1lr9o4WDwFyoamEbTiL0tvXf1DrHg0dxevS5TJTVTwYa+6VuXga7dkpZ4lh9BgOSkku1BOzoSkvSd5tg1EHL88y53xgi1eOvAcY92IufOEdRmfz6Z7DGQi+zRC3q3e2gD9oz5WNEM0rrESKahnJWI35/UD6LDOLg4wmw5zcIu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738681558; c=relaxed/simple;
	bh=LgNx0+fDnKASTp8x1zfs0QGMK+VYYrWDjs3xdXfOBUI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=u5tbSnOHw6Fa5a14i4oTUU2AVwelFAbJeq8I71o3PHfPdiJzUPFoqDNe0xLYQ0TyVM8Q9gvFUL1GC1qWXF1gSOnDnUjc6WDydP1ILIqqgntD+uZn2wSeH1ZBdygthjjsE1S2Q30BidDftZWwJSxf73kIHvcdi6esXgQ/X/w9yJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dtyRX4Xx; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dtyRX4Xx"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4364a37a1d7so56913165e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 07:05:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738681554; x=1739286354; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6uoHeoAH7U5NCxnZILdDHxMpNV/SysSvNvz/L9W1pYA=;
        b=dtyRX4Xxge6f5sSOb+HteIGU+U5V8heOltFiSNvnVgwRizM25s9c8rc+fxB9rSDCXk
         IdfW8aQsp4d6tnaF140JG4YeOBYQNKDTkx9N4EhSrTD9WSsXpJuYlh8jw1puoFaedrUW
         RcNHlqsdmh03CJTPUiINfCbbyo9Y8ms84IE/wICLPJlGgP6ymOjjhcVM7Q/aKT02gSyI
         /ySerEyCDRIsKb84Fp5LLtmYGrGJHdEzOuNr6jnofMYVGy1/GhpKtlA9Cy1a3aPkO5Wd
         WbjMBkjReHbOiuwoytHZ5nvq2+ce0FNZgNraNhfSfGB/4iApK1k+g5O9bDqBqpfdypAu
         rHfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738681554; x=1739286354;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6uoHeoAH7U5NCxnZILdDHxMpNV/SysSvNvz/L9W1pYA=;
        b=GQIlKsBHzNZiLNyAMaqAHezVfnoScpj465J+yl4ZfyqMoNS/bxyRmbwp5C/oYV23TY
         Arcaid9TKFmq0SOWAMQukVK1cyvvW5JJesU0Wy20hNqgiXcawH3vgVmqALBwao52VPXB
         NdP3VGz4OVHO/nAxFKeiBrK+H8Bsgw/fJ6POae8EfkFUtihXFsfdqxbvg6C5/bs64BbH
         RS/HV4HaDz5m1uGZd2jA0faKKov2tQ4qDbwffd/pJUOGACpRwC8VnAe9oTWxRyys8Axo
         HHidAb31xTlkpcv9oKhmfo+vwAgZbP5uyldbkLNMck2mlrm+J90GDeyzGfxleafhNLSo
         cfTA==
X-Forwarded-Encrypted: i=1; AJvYcCXEpardbkQiaYGC8nY+hwFsBI4UQVHMarG7tXkQlFqm2YmgSYgZ78GXX09WwPIdgH/APjnpILvFHjQ5ezg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyn1+iXOFZzSK8CnHD/BOakhjyukwoRqgGM3+BzUGDjVZwExOIH
	SHHHH4+y0vOO7tuqTOQ3z2eg7HvT/uyxxrxTexYIbmyPLp5BXMSJDEDASOv9rR4YaCk64r+V29V
	o14mWdqHJ2vZYtSqqhA2gdada45I4Bkkg2qwQ
X-Gm-Gg: ASbGncvqxUfnGLOCESguM6pmaJwPr0EhcO865RpWrgZrHqKBvLd5JSoKzH39PMjQzqn
	OQMhI9luXLK5X93+RQuzplFhmqKJD+nASbGW2ugak4BouLLauPYntuBmn8KuWlzaw43+VCVmo1x
	pxXqRaHTBIGhC/2BKhU2AMCfufxw==
X-Google-Smtp-Source: AGHT+IFCNjH/V9P/Lg+ufbLepR71wOHfKTGoMwPDfuParFiZ8STiGxTr/Z3uh2hphaB4DIojQ500u5f0LwM9KxR09+Q=
X-Received: by 2002:a05:600c:1c1e:b0:432:7c08:d0ff with SMTP id
 5b1f17b1804b1-438dc40b8e6mr210901225e9.23.1738681553649; Tue, 04 Feb 2025
 07:05:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250203-vma-v13-0-2b998268a396@google.com> <20250203-vma-v13-2-2b998268a396@google.com>
 <r5xkc2i3tk4za3xkrrvbeqto4kf5l425ursytc3n6tmcy2gylb@eusudybb5dqa>
 <CAH5fLgj00hRAEBvNc8RR8iBwKQ2okDqmWWQ+kqmNkr9mOjfU0w@mail.gmail.com> <ymjkf2l2otosunrs3e3mmsj2wr3tvrfmgl4aav5dcpm3gtdulh@dzz4njdwkspc>
In-Reply-To: <ymjkf2l2otosunrs3e3mmsj2wr3tvrfmgl4aav5dcpm3gtdulh@dzz4njdwkspc>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 4 Feb 2025 16:05:41 +0100
X-Gm-Features: AWEUYZkL94U6cCe6csQSLh-rnC1NVTtoJ_Iv8CKpRx6GMPpdxyIltoAvX5ckcwA
Message-ID: <CAH5fLggd75BvB6VXPjR=_jxn1u7kOfix2rynvMHU4CeUUDHnVA@mail.gmail.com>
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

On Tue, Feb 4, 2025 at 3:55=E2=80=AFPM Liam R. Howlett <Liam.Howlett@oracle=
.com> wrote:
>
> * Alice Ryhl <aliceryhl@google.com> [250204 07:45]:
> > On Mon, Feb 3, 2025 at 4:44=E2=80=AFPM Liam R. Howlett <Liam.Howlett@or=
acle.com> wrote:
> > >
> ...
>
> > > >
> > > > +impl<'a> MmapReadGuard<'a> {
> > > > +    /// Look up a vma at the given address.
> > > > +    #[inline]
> > > > +    pub fn vma_lookup(&self, vma_addr: usize) -> Option<&virt::VmA=
reaRef> {
> > > > +        // SAFETY: We hold a reference to the mm, so the pointer m=
ust be valid. Any value is okay
> > > > +        // for `vma_addr`.
> > >
> > > Is this true?  In C we hold a reference to the mm and the vma can sti=
ll
> > > go away.  We get safety from the locking on the C side.
> >
> > Notice that this function is in the `impl MmapReadGuard` block. This
> > implies that you *must* hold the mmap read guard to call this
> > function.
> >
> > The safety comment should probably be updated to mention that we hold t=
he guard.
>
> Thanks.
>
> Does it imply you must hold the lock or does it enforce that the lock is
> held?

Not sure what distinction you're asking about. To obtain a
MmapReadGuard object, you need to call the `mmap_read_lock` function,
which locks the mmap lock and returns an MmapReadGuard. When the
MmapReadGuard object goes out of scope, its destructor runs which
unlocks the lock. You can only call this method given a reference to a
MmapReadGuard, so you can only call it after calling mmap_read_lock
and before its destructor runs.

> > > > +        let vma =3D unsafe { bindings::vma_lookup(self.mm.as_raw()=
, vma_addr) };
> > > > +
> > > > +        if vma.is_null() {
> > > > +            None
> > > > +        } else {
> > > > +            // SAFETY: We just checked that a vma was found, so th=
e pointer is valid. Furthermore,
> > > > +            // the returned area will borrow from this read lock g=
uard, so it can only be used
> > > > +            // while the mmap read lock is still held.
> > >
> > > So We have complicated the locking of the vmas with rcu and per-vma
> > > locking recently.  We are now able to look up and use a vma under the
> > > rcu read lock.  Does this translate to rust model?
> > >
> > > I believe this is true in recent version of binder as well?
> >
> > Yes. The safety requirements of VmAreaRef is that you must hold the
> > mmap read lock *or* the vma read lock while you have a VmAreaRef
> > reference. This particular method achieves that requirement by holding
> > the mmap read lock. But there is also a Rust lock_vma_under_rcu(), see
> > patch 4 for that.
>
> Right, okay.  Thanks.  You can get the reference by only holding the rcu
> read lock, but you should hold the vma lock to ensure that the vma
> itself (and not just the pointer) is safe to use.

Hmm... To modify the vma, you must hold the mmap *and* vma write lock,
so holding the mmap read lock prevents mutations? Is the mmap read
lock not enough to read from the vma?

> > > > +        // SAFETY: The caller ensures that the invariants are sati=
sfied for the duration of 'a.
> > > > +        unsafe { &*vma.cast() }
> > > > +    }
> > > > +
> > > > +    /// Returns a raw pointer to this area.
> > > > +    #[inline]
> > > > +    pub fn as_ptr(&self) -> *mut bindings::vm_area_struct {
> > > > +        self.vma.get()
> > > > +    }
> > > > +
> > > > +    /// Access the underlying `mm_struct`.
> > > > +    #[inline]
> > > > +    pub fn mm(&self) -> &MmWithUser {
> > > > +        // SAFETY: By the type invariants, this `vm_area_struct` i=
s valid and we hold the mmap/vma
> > > > +        // read lock or stronger. This implies that the underlying=
 mm has a non-zero value of
> > > > +        // `mm_users`.
> > >
> > > Again, I'm not sure this statement still holds as it once did?
> >
> > If it's possible to hold the mmap/vma read lock for a vma that is part
> > of an mm whose mm_users count has dropped to zero, then it is
> > incorrect for us to have this method.
>
> The non-zero statement is fine.  After re-reading it, I think this is
> accurate.

Okay, thanks!

> Thanks for taking the time to explain things.

Of course!

Alice
