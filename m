Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC1CF15A842
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 15:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738769067; cv=none; b=XSAEJ1C6equrvOadh+iDDYYrT2F4/GGup9Jl43bOQJUJtYFpsYw4nQWAtceNYUGU9XgOhg5suEPapfeEBxCiTLI697BMZyRFlL4GiBYzV7Vy/o0prXnJQlcgQUVowhueT9NYyYC2B0Ko3/QYux1JUvQ+hXwUZKBlTU/F/YX50sY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738769067; c=relaxed/simple;
	bh=RgnLrNkg9LQXYy1twLEj6EteqD+deF14Iq9XrS1HPZI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=d/zqBgY9OB1Y2kPKYJP63iCL0looiE8s9EPz+JB/K+JNsA1XluUjrltU2QcakCpWqdS2bw1dhB72QJw52Jc3IJ6kwi7c34uhPtx5DkBg9VrSRrxGv3B+RPWDevDVQ1eo73Vhjizt2I0W0MPx6LREBRSdlRRB+zee5pvgBHQ7M/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PWCmvD6K; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PWCmvD6K"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2f9cd8ecbceso3208871a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 07:24:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738769065; x=1739373865; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KGUFj/mah/kn+/uxQ4Btu9bKF0UOsIAWYRzSd3+gFfM=;
        b=PWCmvD6KmJm9h+wuCzf2bdNMHbls/yTGicth9HdWrA3xHpTnpoM5QZfkVdOmmfXMV1
         5frvYCPq1xmbIJwr8QTeKZtZrvmlGyXj6RD6HI0edRc4TkEIODSykcPQg1e6OTdp4rS1
         h5KLg736daBW59WubR71+dk8Us/bH0OnIkcj5zDMZbMdItKhS48QcUAYJBenxrLYbI9a
         7TIIIBH++O5kvADoXYdPLLghhv7cIqBQhGtktIv9gMsy5MgNEv6bDhvxilZxi1j1RcNr
         I4H7UZZGV53y1PrTq/zUWmM2xugjBxnTGPP5ndj6rM0i1pWOPx7CCDFqSIl8FD5+A2OW
         AAuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738769065; x=1739373865;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KGUFj/mah/kn+/uxQ4Btu9bKF0UOsIAWYRzSd3+gFfM=;
        b=xKkjXdrnNmia7ScsVr54GsrY8w1I6Jiw9YI55ubGGfF9SYTcQgWTjVwQNuS5vIR28p
         StO+Z8EuJRdTdXXXX/d1jkNLwDE3Htpqx/4bBH8iKKjNU4K0uYbbS1uandVRGaRmXp5m
         tjbW0F0wjp6chVYUed4ZKFXCAIfxlY9+OAOWwUIgwyYdUaN8mtdKSsJ33n1Q/WJrPVdM
         SEb4M2EBx+oDvdATm/bw07zNsl3GssZoBSNSyY2OP5K7TmrFEUXv97103pk7hwjRvjtb
         hWV1ijh35284oW5oUGMnpW04QgBRQyKIP2v0OmdhsSEJ6OsdGN+c2luCwQOXDNNb6dUf
         kJFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWuy3Ro7JsM5jngU1khrs3l/27e194tlR5w0Fs750KvELchEIULaJ0CSz9m9C7FhB0YjbmwI0Q6V/zi7so=@vger.kernel.org
X-Gm-Message-State: AOJu0YwpCroZumeZO6VnLmf0YBqrwuc/FCSR1hXe7hr54Ysh9r9S7RFs
	FKMyHKTvkgBSJn8tZSSoNLvRcPd87aOjFX2lp+Wa06VxCJsvBVu4To1r3d93RjhnA2ESIiFvVyH
	XMXz4Jm0I9V1DLsvolrePoY/o8RQzcxmiuILv
X-Gm-Gg: ASbGncsNTWuMyf58w1Wvlek+BK0428xBfRdPEcqDNBJGc88m8mfO2tWwaJjvNTH+hd2
	TGCJh3dJunOol8uNTWmG5F2G5WiTKxDxRXVcgqf8uXrH7VM92RWBJuFDd5dNTttKWNqqkyaX4hx
	oEKbqUr5dhSw/+FblqCeYhXOw6v+g=
X-Google-Smtp-Source: AGHT+IFbR/Za3bzQ561Moir1l01pSJAcHP+agVl6hNv1WMjaZabDacA+FBKaP1s+i3G2zvW5BNr6B5Ren6dXC7QGv6w=
X-Received: by 2002:a17:90b:370c:b0:2ee:c91a:acf7 with SMTP id
 98e67ed59e1d1-2f9e0753763mr5096043a91.4.1738769065057; Wed, 05 Feb 2025
 07:24:25 -0800 (PST)
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
 <CAH5fLgh2Y0rG5ntpdiK-ycn9eBvrSXekxPsjDaYWuHBDUYNppw@mail.gmail.com> <ndell4l7fo2pkixo6q5xgdaryuj6wrmnyzthhe42wtumpacak5@oxlrwuwa5e5g>
In-Reply-To: <ndell4l7fo2pkixo6q5xgdaryuj6wrmnyzthhe42wtumpacak5@oxlrwuwa5e5g>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 5 Feb 2025 16:24:11 +0100
X-Gm-Features: AWEUYZmq_vX8tVFSj3KjtvPi2OOSFFsq6QpKo6Pfs-lOXylEZQu2sCfVDes0wgA
Message-ID: <CAH5fLggzX2fZe7zdPXibosYAn3752XeoxXhcbSrAYpw99sdj9w@mail.gmail.com>
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

On Wed, Feb 5, 2025 at 3:38=E2=80=AFPM Liam R. Howlett <Liam.Howlett@oracle=
.com> wrote:
>
> * Alice Ryhl <aliceryhl@google.com> [250205 07:10]:
> > On Tue, Feb 4, 2025 at 4:46=E2=80=AFPM Liam R. Howlett <Liam.Howlett@or=
acle.com> wrote:
> > > > > > > > +        let vma =3D unsafe { bindings::vma_lookup(self.mm.=
as_raw(), vma_addr) };
> > > > > > > > +
> > > > > > > > +        if vma.is_null() {
> > > > > > > > +            None
> > > > > > > > +        } else {
> > > > > > > > +            // SAFETY: We just checked that a vma was foun=
d, so the pointer is valid. Furthermore,
> > > > > > > > +            // the returned area will borrow from this rea=
d lock guard, so it can only be used
> > > > > > > > +            // while the mmap read lock is still held.
> > > > > > >
> > > > > > > So We have complicated the locking of the vmas with rcu and p=
er-vma
> > > > > > > locking recently.  We are now able to look up and use a vma u=
nder the
> > > > > > > rcu read lock.  Does this translate to rust model?
> > > > > > >
> > > > > > > I believe this is true in recent version of binder as well?
> > > > > >
> > > > > > Yes. The safety requirements of VmAreaRef is that you must hold=
 the
> > > > > > mmap read lock *or* the vma read lock while you have a VmAreaRe=
f
> > > > > > reference. This particular method achieves that requirement by =
holding
> > > > > > the mmap read lock. But there is also a Rust lock_vma_under_rcu=
(), see
> > > > > > patch 4 for that.
> > > > >
> > > > > Right, okay.  Thanks.  You can get the reference by only holding =
the rcu
> > > > > read lock, but you should hold the vma lock to ensure that the vm=
a
> > > > > itself (and not just the pointer) is safe to use.
> > > >
> > > > Hmm... To modify the vma, you must hold the mmap *and* vma write lo=
ck,
> > > > so holding the mmap read lock prevents mutations?
> > >
> > > Sorry, I think I confused things with my answer.  Your code is fine.
> > > The phrasing of the "only be used while the mmap read lock is still
> > > held" made me wonder about further clarification on the locking here
> > > (because the locking is confusing).
> > >
> > > Yes, mmap read lock means there are no writers that can modify the vm=
a.
> > > Essentially, you are using the lock to ensure the entire vma space is=
n't
> > > changed during your operation - which is heavier than just locking on=
e
> > > vma.
> >
> > I could extend the safety comment like this:
> >
> > SAFETY: We just checked that a vma was found, so the pointer is valid.
> > Furthermore, the returned area will borrow from this read lock guard,
> > so it can only be used while the mmap read lock is still held. This
> > ensures that there are no writers because writers must hold both the
> > mmap and vma write lock.
>
> How about just changing the last part to:
>
> Furthermore, the returned vma is still under the protection of the read
> lock guard and can be used while the mmap read lock is still held.

Well, the important part here is that you can't do this:

let guard =3D mm.mmap_read_lock();
let vma =3D guard.vma_lookup(...)?;
drop(guard);
vma.foo();

since that would use the vma after the lock has been released. The
reason that the above is prevented is because `vma` borrows from
`guard`, so you can only use `vma` while `guard` is still valid.

Alice
