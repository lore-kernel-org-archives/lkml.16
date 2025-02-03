Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F0341D5176
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 09:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738574781; cv=none; b=eswxjV/VQCH25eYwvgwUxTXP23vCcTXqV8Dcpz8cE+vb/VPFi4KX9NtocDBonX9HORTN/+eQRn2BQyIzzGACDtoXINlsxBTscuVlOMrGNRV0taXwQCYCA3GrGHlXzAedQ2CWYljsedGUc+HDWb0Yw0YLGzS7702ricd75VltwsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738574781; c=relaxed/simple;
	bh=soG1zahVTHjELikAUS07gcrLIhx0vB5Dfv6mJUvPmg8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KGl96jnfkhDJXfPZErV7gU5QgRDAv/qUS5AiBdPn+b+ZPi8QTt3kbmn+N05oW9a1fGnbypfv7NtkygEkgilRWuZuqcpzCFeFurrQ1a0RFw9SHl8wT/bssJIqpymRDUzfw5NUNqz7BvYd0Rvj2jthFqb/bvaiHvxMzTlrmirMxLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=18HA4VZp; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="18HA4VZp"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4363dc916ceso31754125e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 01:26:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738574777; x=1739179577; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aaeLKOYFFNDzUVC+4k3ip38hUc6BjgRcCCAhtJeIZdE=;
        b=18HA4VZp1qgfI5pGR78UyeNYwmFJBptxT4ez/iQ6ntjKtvV1epusnAWS4Y1Z8GNYJm
         g+4ZdCa15dBQWcm+B4rMgXrWivSyQ0RoNpFAKDqgPhIa2jWFf9P0lGQTOlRvUvfZioZe
         +DjJVi6z5It+o2qVidPTihdTCyh4bIQdHzvIMbYypf21x4eAzq004+Dlbko3cjCIPim4
         Q8Rj6cMpEf/3s7XJQDEyfASFkwRgSprd0+uLnaYBYvb6XSr6+8K/4o0CkBy0cXzisVd7
         dJiLSMH/M1naey9oTjaYM6K73LobYToIvvlxAfWuAiCFFeLaj82ptoiVGYVLDXAz0e9N
         krHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738574777; x=1739179577;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aaeLKOYFFNDzUVC+4k3ip38hUc6BjgRcCCAhtJeIZdE=;
        b=fuFJipASUP9VAJ7C9NvSipCO6IGSh06CVtOYa1VX/eB6oAaqri+pl8BTtFoyDZiFb0
         0GQmZsk/RkZAtMMAD3T0kxLlez+TncUVJiZzy7HKp3gsGNoXDzlZHQq1yp5xvVhLeI9Y
         EsY0OOX0+oBL3fZqmfSz6LGmF4dLyn+tx/Wc1iFUCbgeEh/c6zd9cvpF1oCuxG9yprA9
         CJELuFkkykphUIupPxkmEzcQj+L3B28YinEJkRprFO88rKBlR7r4QCZhiB/0+XkObwx1
         7cbJBXEEPhq0xsdN3EOXKGUGcWrRFwh3KFrbqsk9hGizQkNx9D+xBsE4PF7x9elgFAOU
         i27Q==
X-Forwarded-Encrypted: i=1; AJvYcCU5N4x1hIt5zqfa4oD2r6u0vYMOQN1TX1hnqYStNNZ17l8+3Xx7zvDAzZkJ7bxqDl58GKe7xdN1xmx/f9Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YwL8K0uEiYbNHZBjvi9VHAB29B0+Uv8hhVDgZ3ZJ53SHe2Ow6ze
	KhfsWH22l1z4JN2OINQWNAHsoe7LUwpOhcVpgSBRVCI5J1oAxR00oEbczje23yR3MCfbxZ85EmT
	SkktjY1DAS5DKI0skExBQXWpZYKDc7hLGa0qS
X-Gm-Gg: ASbGncvIwN1FITxRPUkJ5QSmcEiI3OQ7JYl02zPTOGIPx45XEDrsYsKgHcdijK/wtc3
	lORFc/Fdj9+3GxRlbaKvBln7uv9cz9rVDHaziB6Gbm0l2otGWM0LHXZQRhPFnGP255vzdOCad0f
	8mOearQi6d+Y27j9vENRjGWtow
X-Google-Smtp-Source: AGHT+IGjVyTSYmrkqIaz+SBUPm17EBR0tJKBzrLv6Sh6Gx3Sg8GvAYe1u0Y8jPk4vj65E7mPy8cuotnd+MIfEXhGTQE=
X-Received: by 2002:a05:600c:1913:b0:42c:b8c9:16c8 with SMTP id
 5b1f17b1804b1-438e16ebb49mr134237585e9.10.1738574777508; Mon, 03 Feb 2025
 01:26:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250130220529.665896-1-daniel.almeida@collabora.com>
 <20250130220529.665896-3-daniel.almeida@collabora.com> <b5538fda-1926-4280-8e46-e0ff299a4f72@asahilina.net>
In-Reply-To: <b5538fda-1926-4280-8e46-e0ff299a4f72@asahilina.net>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 3 Feb 2025 10:26:05 +0100
X-Gm-Features: AWEUYZnSd3CBEJWwxtbtiGFehHXUIGlaje_eOGQ57LBXOdnQrouyr3N9qoxsRR8
Message-ID: <CAH5fLgjf4VArJ21DaAY9SP+AF4k+706naR+UfcVFx3S9aJfmJQ@mail.gmail.com>
Subject: Re: [PATCH v6 2/3] rust: io: mem: add a generic iomem abstraction
To: Asahi Lina <lina@asahilina.net>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, ojeda@kernel.org, alex.gaynor@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.mco, 
	benno.lossin@proton.me, a.hindborg@kernel.org, tmgross@umich.edu, 
	gregkh@linuxfoundation.org, rafael@kernel.org, dakr@kernel.org, 
	boris.brezillon@collabora.com, robh@kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 2, 2025 at 11:45=E2=80=AFPM Asahi Lina <lina@asahilina.net> wro=
te:
>
>
>
> On 1/31/25 7:05 AM, Daniel Almeida wrote:
> > Add a generic iomem abstraction to safely read and write ioremapped
> > regions.
> >
> > The reads and writes are done through IoRaw, and are thus checked eithe=
r
> > at compile-time, if the size of the region is known at that point, or a=
t
> > runtime otherwise.
> >
> > Non-exclusive access to the underlying memory region is made possible t=
o
> > cater to cases where overlapped regions are unavoidable.
> >
> > Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
> > ---
> >  rust/kernel/io.rs     |   1 +
> >  rust/kernel/io/mem.rs | 125 ++++++++++++++++++++++++++++++++++++++++++
> >  2 files changed, 126 insertions(+)
> >  create mode 100644 rust/kernel/io/mem.rs
> >
> > diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
> > index 566d8b177e01..9ce3482b5ecd 100644
> > --- a/rust/kernel/io.rs
> > +++ b/rust/kernel/io.rs
> > @@ -7,6 +7,7 @@
> >  use crate::error::{code::EINVAL, Result};
> >  use crate::{bindings, build_assert};
> >
> > +pub mod mem;
> >  pub mod resource;
> >
> >  /// Raw representation of an MMIO region.
> > diff --git a/rust/kernel/io/mem.rs b/rust/kernel/io/mem.rs
> > new file mode 100644
> > index 000000000000..f87433ed858e
> > --- /dev/null
> > +++ b/rust/kernel/io/mem.rs
> > @@ -0,0 +1,125 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +//! Generic memory-mapped IO.
> > +
> > +use core::ops::Deref;
> > +
> > +use crate::device::Device;
> > +use crate::devres::Devres;
> > +use crate::io::resource::Region;
> > +use crate::io::resource::Resource;
> > +use crate::io::Io;
> > +use crate::io::IoRaw;
> > +use crate::prelude::*;
> > +
> > +/// An exclusive memory-mapped IO region.
> > +///
> > +/// # Invariants
> > +///
> > +/// - ExclusiveIoMem has exclusive access to the underlying `iomem`.
> > +pub struct ExclusiveIoMem<const SIZE: usize> {
> > +    /// The region abstraction. This represents exclusive access to th=
e
> > +    /// range represented by the underlying `iomem`.
> > +    ///
> > +    /// It's placed first to ensure that the region is released before=
 it is
> > +    /// unmapped as a result of the drop order.
> > +    #[allow(dead_code)]
> > +    region: Region,
> > +    /// The underlying `IoMem` instance.
> > +    iomem: IoMem<SIZE>,
> > +}
> > +
> > +impl<const SIZE: usize> ExclusiveIoMem<SIZE> {
> > +    /// Creates a new `ExclusiveIoMem` instance.
> > +    pub(crate) fn ioremap(resource: &Resource) -> Result<Self> {
> > +        let iomem =3D IoMem::ioremap(resource)?;
> > +
> > +        let start =3D resource.start();
> > +        let size =3D resource.size();
> > +        let name =3D resource.name();
> > +
> > +        let region =3D resource
> > +            .request_mem_region(start, size, name)
> > +            .ok_or(EBUSY)?;
> > +
> > +        let iomem =3D ExclusiveIoMem { iomem, region };
> > +
> > +        Ok(iomem)
> > +    }
> > +
> > +    pub(crate) fn new(resource: &Resource, device: &Device) -> Result<=
Devres<Self>> {
> > +        let iomem =3D Self::ioremap(resource)?;
> > +        let devres =3D Devres::new(device, iomem, GFP_KERNEL)?;
> > +
> > +        Ok(devres)
> > +    }
> > +}
> > +
> > +impl<const SIZE: usize> Deref for ExclusiveIoMem<SIZE> {
> > +    type Target =3D Io<SIZE>;
> > +
> > +    fn deref(&self) -> &Self::Target {
> > +        &*self.iomem
> > +    }
> > +}
> > +
> > +/// A generic memory-mapped IO region.
> > +///
> > +/// Accesses to the underlying region is checked either at compile tim=
e, if the
> > +/// region's size is known at that point, or at runtime otherwise.
> > +///
> > +/// # Invariants
> > +///
> > +/// `IoMem` always holds an `IoRaw` inststance that holds a valid poin=
ter to the
> > +/// start of the I/O memory mapped region.
> > +pub struct IoMem<const SIZE: usize =3D 0> {
> > +    io: IoRaw<SIZE>,
> > +}
> > +
> > +impl<const SIZE: usize> IoMem<SIZE> {
> > +    fn ioremap(resource: &Resource) -> Result<Self> {
> > +        let size =3D resource.size();
> > +        if size =3D=3D 0 {
> > +            return Err(EINVAL);
> > +        }
> > +
> > +        let res_start =3D resource.start();
> > +
> > +        // SAFETY:
> > +        // - `res_start` and `size` are read from a presumably valid `=
struct resource`.
> > +        // - `size` is known not to be zero at this point.
> > +        let addr =3D unsafe { bindings::ioremap(res_start, size as ker=
nel::ffi::c_ulong) };
>
> This does not work for all platforms. Some, like Apple platforms,
> require ioremap_np(). You should check for the
> `IORESOURCE_MEM_NONPOSTED` resource flag and use the appropriate
> function, like this (from an older spin of this code):
>
> https://github.com/AsahiLinux/linux/blob/fce34c83f1dca5b10cc2c866fd8832a3=
62de7974/rust/kernel/io_mem.rs#L166C36-L166C70

Hmm. Is detecting this based on the flag the right approach? On the C
side, they use different methods and I wonder if we should do the
same?

Alice
