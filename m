Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FFE021E0A2
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 23:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747868478; cv=none; b=f16eTu8QhoqKa3iU0KSrBYdmfDssEq7OkrsVp2LhFZ4jixMWaJZVTsDJGDF06ayk8XGKrusbvBrgc96HAqEL7Iumrrj488oucqu2/2jHcMmMUZne0uepuaOH4tRy0XQeVPEuhgxOyz8/e51pboLZxqb+9k4oQdRtaTKvxq65tLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747868478; c=relaxed/simple;
	bh=aTIA8Bv/B3rHhRdQllrZ/s7MaCzYtvbeUV0KMIwzSjE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=iplBQ9bKw4acVkTuVqY0x/o0gNa8/7UL8Dm3AOz6uGD1f0jDzFEYhlO4yc4RAUOnjXbRC1MF2BbdFTXC9NEZ6Yr3zBt7WHvvhHdET0Ca2eAq52OriPy8Fmyzy1gS+l042lLcCKtFuUKOLYgsXgUW1jFJKASA4dbDH8XUr79vvlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=m0hTmfjW; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="m0hTmfjW"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43cf5196c25so46955425e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 16:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747868474; x=1748473274; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=r+ytGeSc4ZCsauskF9c3cSaEKxaN1zbVXpeifv9HupU=;
        b=m0hTmfjWeZTfiEf//OovxxgsuFmUS7y1pv9nlvY2Q9HqAvkO6PWXXdp6T1Vd62wYbP
         Z3qru6Pf2tB2JH/D+96CHmPDjMFbTCLpjihT0k9idsztXGnsoUsmYdIM545nr1D9Ilmt
         Uc/jAnJAUB2wcuZNVuxlDH8Jf4/q7DqvuYOFDCbcv+aRIO4dnPlwC+BD5rOCSWAsyTyi
         54xm+6JDLEpzgvLWmNTVRM4L9tX1pEsHHIdlsp2pwZktR4KcremgbVdDy0Y8fb0lWgZR
         GxaplPqF426AJgo742aVyhBxZ3KROe1pDxUnOy4/4p5bivYCJev48ILxVwis5d1k5kvL
         LBLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747868474; x=1748473274;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r+ytGeSc4ZCsauskF9c3cSaEKxaN1zbVXpeifv9HupU=;
        b=hntjNp8S1fEyCzG11F2CLrGmBiWRdLvDCk0LQsCb/kDRGaw5XkHaC1qP9HNchF4jgH
         k/F30rkMDjaAt2onfWfi4Hi8eVwHL/dVNTb3e8lgDyuvlIyePi37NHzyFtkhv9PqpZ9M
         1FRNBkBCNIVYnDFfn7EZl7f5y3NNUIrIC3PhLuUEqUo1H6x3KQZXauKGIT6o2BJs+fkU
         SoEV0HOerWW3XBYnOxhAN0Silu4brhm557rjMsg3ZAu+6IipHOhX7OAyZsLzad/P6tsq
         Qyjtf36KAL4iAlXiYKXduzVkfJGKDYvOIevAn53Cx8F3E0D6OjGAY22cnbungE5ISNDk
         O8SA==
X-Forwarded-Encrypted: i=1; AJvYcCVunObBXxYtW6GR2J6szlXwVogcn6buRS2ulRJsWFhicxCKLB3kmVB6vlOmqs8LlDqYFRnOZpMDNnl5IYY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYe9RwbOlRoYVRRqz8Sgjp27VZoymVoQRONjsPvBohT+tw2zKf
	GPEtGlQXNTwEpmu/qfaSTDyz2jr+YWhbC88fRtyrEXB+Ys+otgY1k0g0CHLnyb3QRGTjgA+mbu1
	GCBMCXdlRek/IGmSKzQ==
X-Google-Smtp-Source: AGHT+IGd1Mj4La23om1PFex+OP2zgsLd5R9bY56HaPoKlycVWqoW6JMTXNJEqD+DPkd2Ydi5L7VSOHInaOvLAkM=
X-Received: from wmrs12.prod.google.com ([2002:a05:600c:384c:b0:442:fa35:dd50])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4f42:b0:43d:abd:ad1c with SMTP id 5b1f17b1804b1-442fd60b64dmr199313155e9.6.1747868474729;
 Wed, 21 May 2025 16:01:14 -0700 (PDT)
Date: Wed, 21 May 2025 23:01:12 +0000
In-Reply-To: <4616772d-0052-4c2f-afec-69ae32f908aa@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250517-b4-rust_miscdevice_registrationdata-v3-0-cdb33e228d37@gmail.com>
 <20250517-b4-rust_miscdevice_registrationdata-v3-1-cdb33e228d37@gmail.com>
 <aCiSRZjOETsD8MhX@pollux> <2025052107-awhile-drainer-38d0@gregkh>
 <2025052104-mockup-dupe-2573@gregkh> <4616772d-0052-4c2f-afec-69ae32f908aa@gmail.com>
Message-ID: <aC5bOLsdoAET_IPR@google.com>
Subject: Re: [PATCH v3 1/2] rust: miscdevice: add additional data to MiscDeviceRegistration
From: Alice Ryhl <aliceryhl@google.com>
To: Christian Schrefl <chrisi.schrefl@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, Arnd Bergmann <arnd@arndb.de>, 
	Lee Jones <lee@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	"Gerald =?utf-8?Q?Wisb=C3=B6ck?=" <gerald.wisboeck@feather.ink>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Wed, May 21, 2025 at 02:16:20PM +0200, Christian Schrefl wrote:
> Hi Greg,
> 
> On 21.05.25 2:04 PM, Greg Kroah-Hartman wrote:
> > On Wed, May 21, 2025 at 01:55:36PM +0200, Greg Kroah-Hartman wrote:
> >> On Sat, May 17, 2025 at 03:42:29PM +0200, Danilo Krummrich wrote:
> >>> On Sat, May 17, 2025 at 01:33:49PM +0200, Christian Schrefl wrote:
> >>>> +pub struct MiscDeviceRegistration<T: MiscDevice> {
> >>>>      #[pin]
> >>>>      inner: Opaque<bindings::miscdevice>,
> >>>> +    #[pin]
> >>>> +    data: UnsafePinned<T::RegistrationData>,
> >>>>      _t: PhantomData<T>,
> >>>>  }
> >>>
> >>> I recommend not to store data within a Registration type itself.
> >>>
> >>> I know that this is designed with the focus on using misc device directly from
> >>> the module scope; and in this context it works great.
> >>>
> >>> However, it becomes quite suboptimal when used from a driver scope. For
> >>> instance, if the misc device is registered within a platform driver's probe()
> >>> function.
> >>>
> >>> I know this probably isn't supported yet. At least, I assume it isn't supported
> >>> "officially", given that the abstraction does not provide an option to set a
> >>> parent device. Yet I think we should consider it.
> >>
> >> It's going to be a requirement to properly set the parent device, and
> >> as you point out, this really should be in some sort of scope, not just
> >> a module.
> >>
> >> But, we have two types of users of a misc device, one like this is
> >> written, for a module-scope, and one for the "normal" device scope.  The
> >> device scope is going to be tricker as it can, and will, get
> >> disconnected from the device separately from the misc device lifespan,
> >> so when that logic is added, it's going to be tricky as you point out.
> >>
> >> So I'll take this now, but in the future this is going to have to be
> >> cleaned up and modified.
> > 
> > Nope, can't take it, it breaks the build from my tree:
> > 
> > error[E0432]: unresolved import `crate::types::UnsafePinned`
> >   --> rust/kernel/miscdevice.rs:20:37
> >    |
> > 20 |     types::{ForeignOwnable, Opaque, UnsafePinned},
> >    |                                     ^^^^^^^^^^^^ no `UnsafePinned` in `types`
> > 
> > error[E0432]: unresolved import `pin_init::Wrapper`
> >   --> rust/kernel/miscdevice.rs:23:5
> >    |
> > 23 | use pin_init::Wrapper;
> >    |     ^^^^^^^^^^^^^^^^^ no `Wrapper` in the root
> > 
> > error: aborting due to 2 previous errors
> > 
> > :(
> 
> This requires my `UnsafePinned` [0] patches (& with that pin-init-next) like I wrote
> in the cover letter.
> 
> [0]: https://lore.kernel.org/rust-for-linux/20250511-rust_unsafe_pinned-v4-0-a86c32e47e3d@gmail.com/

It looks like there's still a fair amount of discussion going on there.
Do you want to just use Opaque for now and then I'll fix it later once
the other series lands?

Alice
