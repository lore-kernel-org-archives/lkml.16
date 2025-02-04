Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B1211BC3C
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 12:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738673118; cv=none; b=BPIH+7NhhiyI73Uu6Y8wHVG+WstzEjHtGdBxZBe3xd0UlV8NdaVY+WuqAqWEcWzxoZhXG52A8ppUDKOXzs+YEaJ+giD0PL3mWFDxht+i2ubKypeFXtps/EXXi1oTkgx9qg45pkTK6AhpOynAwMLuK/9mAJVPVWI1PRpvmX36OGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738673118; c=relaxed/simple;
	bh=EbFd2mQWgXaSts2Tv2FnOFYK5XnK2tbdTUZ2o3zizOo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=JDnOrsypnl5NZx8gX+6+kWGI55EdmVl+7WiJbiE1IWVZf5Y1P7jAx5gJ9I0dD3pjhqb4SL8vpzedhUu4qLlzbEUTI0ir/1mlOKmAtKUQ1HtpCy1yVOfrKEdXyCCVynhG2qCv1wnOW/o3REj5q8q0m/NfvPYInjyvfEHuCB2G/Kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rUpG//Ow; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rUpG//Ow"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-436a03197b2so38173735e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 04:45:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738673113; x=1739277913; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LoXJE3ykK2IyJltJSvnFg+xcHFmtht2j+zENZGxvBgs=;
        b=rUpG//OwMftxDiMFURVqivboAUYuD3X/DesLYwf64raW/U1qXEuBblEe/cjNeendBK
         lvSI/F13KW2k16hLLRPOAJnaL91OcVAJfSSMfbtRpKjdKKVnT9PDhBA/cgyJVO3JwAZC
         iIIU/BCpiFAh87ozumOpOlB2RmjZQ6W02KJeT3QuQxy0xDtS+5FZfLnjltyKMh+hXRD6
         t96f/OWZFd9jke+EQsRjUchE0jwdk782Ht0GSXfS/6PeX1bUYBfKc8aanc895nNq8q0d
         gvkCdCZLbi7imUuYcOorFuXWKYg57JrJWhrGF2IAvlk+dACFh+wizZQooNaov1M/h+Ak
         5P1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738673113; x=1739277913;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LoXJE3ykK2IyJltJSvnFg+xcHFmtht2j+zENZGxvBgs=;
        b=j1wIVrCeLXu3HfUZ/ZuverJ+6hq+rYlJzScbNa7QKwNSm0lIlr8vfrOw7t+Ng6UW/F
         OW3oXYzoOf6dRNsrGX9xSNdSdIiukwNup4uaeeSipDCJDSG89Uhiun7KzkjU+GVL3ijF
         ceBJzwdsyPV1xwS7xSHP5HcFjV5ZaRpsVGWe6/iYCZM8sItv/SzhBlGf+v02hZrTG1t7
         3XpBCuVF21iq5+J/JHp/1HlrnQmSZEGR+tl1PsnNBrn0pFSR9Znc8uO6s8O7d0VLM+JP
         Syrg9zC9VJL1+SnRug3CpUimSFfJM4/m/mDNlkMOxFmVeCKMPsN4gHKumpi5hwmUz6oW
         PkMw==
X-Forwarded-Encrypted: i=1; AJvYcCXzWMPsth9rTU2XfycZt8Sp2wrre6LCavDQxTBQkRDNVrjDyhB7iO/0FCUZcPIoZ7/cvJT2FpyQlAt+uO8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3oU+VbBdi9/vZvWi+MyD5gtx/KbZSFyiXVnq8OVdQGOoHn/Kd
	tE8KQXfWSVHFTLXHWlz7PkLa0XQHzrx75m+3UZqUi0frFtqLVx2c4X/0+30GehcxRqhHiOb18vg
	MW1IDIuJf9E1R7a6Hq7uIIDdV5fO2mA04lNLq
X-Gm-Gg: ASbGncvVM1ZGs3LUQLpBTB1ss5H2SYTCGsKrMwVMCdb3lPIS9+6jIuK1sY0XZJxOaQO
	jPVGpaXUZLKZ759QIHJQc4YucHIxXVi3PWT5t1G3ZctaO2+uLkvKayQUWF0L9reTjvWqhyCTF2S
	UaSV2opYgU4Thiop6/dugxqSYEyQ==
X-Google-Smtp-Source: AGHT+IGLublWl9F89PbsgxVMnM6oF5TiMelRRa2OcDUdpOzd1+u/nfcuJ+oiHenJG/FUn+Brh6IzKP1iNPH1goM7TGo=
X-Received: by 2002:a05:600c:c17:b0:436:51bb:7a52 with SMTP id
 5b1f17b1804b1-438dc3bd7e3mr239782735e9.7.1738673113074; Tue, 04 Feb 2025
 04:45:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250203-vma-v13-0-2b998268a396@google.com> <20250203-vma-v13-2-2b998268a396@google.com>
 <r5xkc2i3tk4za3xkrrvbeqto4kf5l425ursytc3n6tmcy2gylb@eusudybb5dqa>
In-Reply-To: <r5xkc2i3tk4za3xkrrvbeqto4kf5l425ursytc3n6tmcy2gylb@eusudybb5dqa>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 4 Feb 2025 13:45:01 +0100
X-Gm-Features: AWEUYZmZtlTW4vkVtV9EtFizlhhuOo5vqgV13DO87MCPZV7TprFw86-lpsIaGAY
Message-ID: <CAH5fLgj00hRAEBvNc8RR8iBwKQ2okDqmWWQ+kqmNkr9mOjfU0w@mail.gmail.com>
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

On Mon, Feb 3, 2025 at 4:44=E2=80=AFPM Liam R. Howlett <Liam.Howlett@oracle=
.com> wrote:
>
> * Alice Ryhl <aliceryhl@google.com> [250203 07:15]:
>
> Hi Alice,
>
> These comments are probably for my education.  I'm holding back my
> training on naming and trying to reconcile the snake-case and upper case
> camel of the rust language.
>
> > This adds a type called VmAreaRef which is used when referencing a vma
>
> How did you land on VmAreaRef?  Why not VmaRef?  We mostly use vma for
> vmas today, not vm_area.  Is it because the header declares it
> vm_area_struct?  I'd be happier with VmaRef, but I'm guessing this is a
> direct translation from vm_area_struct?
>
> > that you have read access to. Here, read access means that you hold
> > either the mmap read lock or the vma read lock (or stronger).
>
> I have questions.. they are below.
>
> >
> > Additionally, a vma_lookup method is added to the mmap read guard, whic=
h
> > enables you to obtain a &VmAreaRef in safe Rust code.
> >
> > This patch only provides a way to lock the mmap read lock, but a
> > follow-up patch also provides a way to just lock the vma read lock.
> >
> > Acked-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > Reviewed-by: Jann Horn <jannh@google.com>
> > Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > ---
> >  rust/helpers/mm.c      |   6 ++
> >  rust/kernel/mm.rs      |  21 +++++
> >  rust/kernel/mm/virt.rs | 215 +++++++++++++++++++++++++++++++++++++++++=
++++++++
> >  3 files changed, 242 insertions(+)
> >
> > diff --git a/rust/helpers/mm.c b/rust/helpers/mm.c
> > index 7201747a5d31..7b72eb065a3e 100644
> > --- a/rust/helpers/mm.c
> > +++ b/rust/helpers/mm.c
> > @@ -37,3 +37,9 @@ void rust_helper_mmap_read_unlock(struct mm_struct *m=
m)
> >  {
> >       mmap_read_unlock(mm);
> >  }
> > +
> > +struct vm_area_struct *rust_helper_vma_lookup(struct mm_struct *mm,
> > +                                           unsigned long addr)
> > +{
> > +     return vma_lookup(mm, addr);
> > +}
> > diff --git a/rust/kernel/mm.rs b/rust/kernel/mm.rs
> > index 2fb5f440af60..bd6ff40f106f 100644
> > --- a/rust/kernel/mm.rs
> > +++ b/rust/kernel/mm.rs
> > @@ -17,6 +17,8 @@
> >  };
> >  use core::{ops::Deref, ptr::NonNull};
> >
> > +pub mod virt;
> > +
> >  /// A wrapper for the kernel's `struct mm_struct`.
> >  ///
> >  /// This represents the address space of a userspace process, so each =
process has one `Mm`
> > @@ -200,6 +202,25 @@ pub struct MmapReadGuard<'a> {
> >      _nts: NotThreadSafe,
> >  }
> >
> > +impl<'a> MmapReadGuard<'a> {
> > +    /// Look up a vma at the given address.
> > +    #[inline]
> > +    pub fn vma_lookup(&self, vma_addr: usize) -> Option<&virt::VmAreaR=
ef> {
> > +        // SAFETY: We hold a reference to the mm, so the pointer must =
be valid. Any value is okay
> > +        // for `vma_addr`.
>
> Is this true?  In C we hold a reference to the mm and the vma can still
> go away.  We get safety from the locking on the C side.

Notice that this function is in the `impl MmapReadGuard` block. This
implies that you *must* hold the mmap read guard to call this
function.

The safety comment should probably be updated to mention that we hold the g=
uard.

> > +        let vma =3D unsafe { bindings::vma_lookup(self.mm.as_raw(), vm=
a_addr) };
> > +
> > +        if vma.is_null() {
> > +            None
> > +        } else {
> > +            // SAFETY: We just checked that a vma was found, so the po=
inter is valid. Furthermore,
> > +            // the returned area will borrow from this read lock guard=
, so it can only be used
> > +            // while the mmap read lock is still held.
>
> So We have complicated the locking of the vmas with rcu and per-vma
> locking recently.  We are now able to look up and use a vma under the
> rcu read lock.  Does this translate to rust model?
>
> I believe this is true in recent version of binder as well?

Yes. The safety requirements of VmAreaRef is that you must hold the
mmap read lock *or* the vma read lock while you have a VmAreaRef
reference. This particular method achieves that requirement by holding
the mmap read lock. But there is also a Rust lock_vma_under_rcu(), see
patch 4 for that.

> > +// Methods you can call when holding the mmap or vma read lock (or str=
onger). They must be usable
> > +// no matter what the vma flags are.
> > +impl VmAreaRef {
> > +    /// Access a virtual memory area given a raw pointer.
> > +    ///
> > +    /// # Safety
> > +    ///
> > +    /// Callers must ensure that `vma` is valid for the duration of 'a=
, and that the mmap or vma
> > +    /// read lock (or stronger) is held for at least the duration of '=
a.
>
> What is 'a?
>
> > +    #[inline]
> > +    pub unsafe fn from_raw<'a>(vma: *const bindings::vm_area_struct) -=
> &'a Self {
>
> This 'a?  What can I look up in rust to know what this is about?

This is called a lifetime. It represents some region of code, and the
idea is that the returned reference is guaranteed valid inside the
lifetime 'a. For this particular function, the caller chooses what the
lifetime is completely unsafely, so there is no check, but in other
cases it's enforced by the compiler.

For example, if we take vma_lookup from above, then its signature is
short-hand [1] for this:

pub fn vma_lookup<'a>(&'a self, vma_addr: usize) -> Option<&'a
virt::VmAreaRef> {

This signature tells the compiler that the returned pointer to
VmAreaRef can only be used in the region of code where `self` is also
valid. In this case `self` is an `MmapReadLock` (because that's the
impl block the function is defined inside), so the returned VmAreaRef
is valid in the same region as the MmapReadLock object. This enforces
that the returned pointer can only be used while you still hold the
read lock. If your code does not follow that requirement, then that's
a compilation error.

[1]: https://doc.rust-lang.org/book/ch10-03-lifetime-syntax.html#lifetime-e=
lision

> > +        // SAFETY: The caller ensures that the invariants are satisfie=
d for the duration of 'a.
> > +        unsafe { &*vma.cast() }
> > +    }
> > +
> > +    /// Returns a raw pointer to this area.
> > +    #[inline]
> > +    pub fn as_ptr(&self) -> *mut bindings::vm_area_struct {
> > +        self.vma.get()
> > +    }
> > +
> > +    /// Access the underlying `mm_struct`.
> > +    #[inline]
> > +    pub fn mm(&self) -> &MmWithUser {
> > +        // SAFETY: By the type invariants, this `vm_area_struct` is va=
lid and we hold the mmap/vma
> > +        // read lock or stronger. This implies that the underlying mm =
has a non-zero value of
> > +        // `mm_users`.
>
> Again, I'm not sure this statement still holds as it once did?

If it's possible to hold the mmap/vma read lock for a vma that is part
of an mm whose mm_users count has dropped to zero, then it is
incorrect for us to have this method.


Alice
