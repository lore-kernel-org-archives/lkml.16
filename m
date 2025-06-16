Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FE712E06C1
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 13:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750080805; cv=none; b=qJyHHnzvSEyLIVP+JDfzYSYslF0zbyxm0e6gZvEQ6YzMyyfT5F16k33vQrKGXMBHIQMm3dwqcm1Yv0ToIi2Y3ViyUla2BJzZ7MHDoNgqtgtgdjJIim6Aqq6fIMO1miaso/rXVAnL/f0/RWoSZTIkUZ0U22U3R4o7oCYCvKoSvvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750080805; c=relaxed/simple;
	bh=h61zvk86mIy6HFIKb44/uFTca5tTMXV0Nl9/b3obT20=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CudieebF4FrhoofRP5wAWqJ4beHhRKbRNtBAsJrnN8PXrrM/u7Nnlb2xXqLwNxDarIyZANyk55gRpB6aPagFqOPHf/PLtQBOohodcLOnYRh1LS2cmyfgvQCfW9JQFtN+JkdC+IJz3+TjCGz7WEoo43GGMIWjpqClFDXUNJGLrw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=01dFRPvR; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="01dFRPvR"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-453066fad06so33896635e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 06:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750080800; x=1750685600; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+6b4Beq/LXHyQVf4U43/pXx65WWNeVARph73idBSy/s=;
        b=01dFRPvRfjuiD/kMP6K9WP1ziaLZSfdzf4KDPxS0sYi3lY9NFi780B/ohCVUM2mxuc
         secpGGeHJzmOOOQ0lb3N++T5OVfyZ/QweF0Uil238b7sqWzcytNWtv2ZTTvNLvA62Vjc
         gZ4+ilK2nuGkmEpJIh9vUzODYF1LkKdAu9RxKzbzSTPSsbZANNSLYLx5gKpjapef5z0s
         bRhh6nzG4I2BESq8DjX7+N5c/L6fFTrWXA5kad4IvTEQZeSN1Fha9EyVnkAAZQVdEcfH
         393/Fmtg7luiVx/+dHFL6bdI/vqtRgNPahyULOFvjiYZh23EU1gBrR77XTUCmyTn3dTs
         tI2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750080800; x=1750685600;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+6b4Beq/LXHyQVf4U43/pXx65WWNeVARph73idBSy/s=;
        b=dijR/rhS7mkglawgw5Cz4YvgEh/dF2pC1U7XElpwXvikH7Wh9FOhqjRzTXr5+oDfyf
         WW7eogmWpXz5f5s2ut4GPVYKGXKrhbrSz6oUdlPaSzjX/WDfoQpBc4DcwDJn4U0wnk/T
         0uR0AvTnN6i8P9IsNci5P0uHVwxJDHf23W1fhTb5XV4R3sruCa+nljmkmImxlM8Tx4Pl
         p9/YM2s5OeTBeAikZdow7f55/aNzFqvVh5qqi5kLdbPNZszvgFv7GC6PBkge41bxedet
         GA+hdWbVtOLIPO+qa1+pyXKG+Z0wuhd/k+oxbRYIoc2Nq4uj2T8tensotbAElTzkn5rU
         fMrA==
X-Forwarded-Encrypted: i=1; AJvYcCUCRTqcKupnZDFp9LCuNxGbLgfFpdz0dWCNXk6LSARI2kJlROXIaUeds7jOX7hW3DuiRvGr82FygB13Fjs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxj5j7sM8zCXD/CFkIHyoAx6NzdgS6k+cdCwoWoHDHTG+R4NPyn
	PFjeb44ikJrvDdJXaYXv91woPvW/15JZvTti4T3+k5rgQEL+76s7QAY5uMAZ0bPxgD/L4lOcYBj
	R0/mZwqaiHYekohPyaDfSnYlb5iczNM74ygRUfYuf
X-Gm-Gg: ASbGncuk202z2VWuXhCAYePpUsWlV//LUm0gInwgLN7d/jCNxYJWN91xUmTGyBAA4PL
	1eXumS/6bXYhLacEWk+RwM9eGTXtFW6lUYCQ0kNEiffaTP8al/eibc38iTjrm3uwdsRjzXRTDMD
	OhtbLML/TuT4QLOT52i2/ZpL3UAINWck9f9i+yncAN273u
X-Google-Smtp-Source: AGHT+IHoHIQWUh1tsB7VdpSgBe+HOR1+wnpYotOSJnim3yodaLfcWb+HX61Di4FQcFN8L/suGwt1uoWH/7fAgVfvJZs=
X-Received: by 2002:a05:600c:1d9e:b0:453:7bd:2e30 with SMTP id
 5b1f17b1804b1-4533cac455fmr88605775e9.29.1750080800258; Mon, 16 Jun 2025
 06:33:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250608-topics-tyr-request_irq-v4-0-81cb81fb8073@collabora.com>
 <20250608-topics-tyr-request_irq-v4-4-81cb81fb8073@collabora.com>
 <aEbTOhdfmYmhPiiS@pollux> <5B3865E5-E343-4B5D-9BF7-7B9086AA9857@collabora.com>
 <aEckTQ2F-s1YfUdu@pollux.localdomain>
In-Reply-To: <aEckTQ2F-s1YfUdu@pollux.localdomain>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 16 Jun 2025 15:33:06 +0200
X-Gm-Features: AX0GCFugHkgwu-8fmEBsdYNx2iQ--FaKirwILvqXSQM0todMUtf7WPLfkCI54O0
Message-ID: <CAH5fLgj+za85ajgNwJepoa7PSFkMm+3J2wJJVJ24m6YZoFVmVw@mail.gmail.com>
Subject: Re: [PATCH v4 4/6] rust: irq: add support for threaded IRQs and handlers
To: Danilo Krummrich <dakr@kernel.org>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Benno Lossin <lossin@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 9, 2025 at 8:13=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> w=
rote:
>
> On Mon, Jun 09, 2025 at 01:24:40PM -0300, Daniel Almeida wrote:
> > > On 9 Jun 2025, at 09:27, Danilo Krummrich <dakr@kernel.org> wrote:
> > >> +#[pin_data]
> > >> +pub struct ThreadedRegistration<T: ThreadedHandler + 'static> {
> > >> +    inner: Devres<RegistrationInner>,
> > >> +
> > >> +    #[pin]
> > >> +    handler: T,
> > >> +
> > >> +    /// Pinned because we need address stability so that we can pas=
s a pointer
> > >> +    /// to the callback.
> > >> +    #[pin]
> > >> +    _pin: PhantomPinned,
> > >> +}
> > >
> > > Most of the code in this file is a duplicate of the non-threaded regi=
stration.
> > >
> > > I think this would greatly generalize with specialization and an Hand=
lerInternal
> > > trait.
> > >
> > > Without specialization I think we could use enums to generalize.
> > >
> > > The most trivial solution would be to define the Handler trait as
> > >
> > > trait Handler {
> > >   fn handle(&self);
> > >   fn handle_threaded(&self) {};
> > > }
> > >
> > > but that's pretty dodgy.
> >
> > A lot of the comments up until now have touched on somehow having threa=
ded and
> > non-threaded versions implemented together. I personally see no problem=
 in
> > having things duplicated here, because I think it's easier to reason ab=
out what
> > is going on this way. Alice has expressed a similar view in a previous =
iteration.
> >
> > Can you expand a bit more on your suggestion? Perhaps there's a clean w=
ay to do
> > it (without macros and etc), but so far I don't see it.
>
> I think with specialization it'd be trivial to generalize, but this isn't
> stable yet. The enum approach is probably unnecessarily complicated, so I=
 agree
> to leave it as it is.
>
> Maybe a comment that this can be generalized once we get specialization w=
ould be
> good?

Specialization is really far out. I don't think we should try to take
it into account when designing things today. I think that the
duplication in this case is perfectly acceptable and trying to
deduplicate makes things too hard to read.

> > >> +impl<T: ThreadedHandler + 'static> ThreadedRegistration<T> {
> > >> +    /// Registers the IRQ handler with the system for the given IRQ=
 number.
> > >> +    pub(crate) fn register<'a>(
> > >> +        dev: &'a Device<Bound>,
> > >> +        irq: u32,
> > >> +        flags: Flags,
> > >> +        name: &'static CStr,
> > >> +        handler: T,
> > >> +    ) -> impl PinInit<Self, Error> + 'a {
> > >
> > > What happens if `dev`  does not match `irq`? The caller is responsibl=
e to only
> > > provide an IRQ number that was obtained from this device.
> > >
> > > This should be a safety requirement and a type invariant.
> >
> > This iteration converted register() from pub to pub(crate). The idea wa=
s to
> > force drivers to use the accessors. I assumed this was enough to make t=
he API
> > safe, as the few users in the kernel crate (i.e.: so far platform and p=
ci)
> > could be manually checked for correctness.
> >
> > To summarize my point, there is still the possibility of misusing this =
from the
> > kernel crate itself, but that is no longer possible from a driver's
> > perspective.
>
> Correct, you made Registration::new() crate private, such that drivers ca=
n't
> access it anymore. But that doesn't make the function safe by itself. It'=
s still
> unsafe to be used from platform::Device and pci::Device.
>
> While that's fine, we can't ignore it and still have to add the correspon=
ding
> safety requirements to Registration::new().
>
> I think there is a way to make this interface safe as well -- this is als=
o
> something that Benno would be great to have a look at.
>
> I'm thinking of something like
>
>         /// # Invariant
>         ///
>         /// `=C4=9Brq` is the number of an interrupt source of `dev`.
>         struct IrqRequest<'a> {
>            dev: &'a Device<Bound>,
>            irq: u32,
>         }
>
> and from the caller you could create an instance like this:
>
>         // INVARIANT: [...]
>         let req =3D IrqRequest { dev, irq };
>
> I'm not sure whether this needs an unsafe constructor though.

The API you shared would definitely work. It pairs the irq number with
the device it matches. Yes, I would probably give it an unsafe
constructor, but I imagine that most methods that return an irq number
could be changed to just return this type so that drivers do not need
to use said unsafe.

Alice
