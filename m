Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3842B207E00
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 06:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746599091; cv=none; b=rK+1ONRhPwf0NjNNeZY7hVz5K9rhNOJ8AYB1oFaKAxlH7Hxwz1IcFWp2DGtC5KpUtTlrxG19m6MZvzqUD9QriZzPsL7Pd5bn8depoy5RfyRHmFTeLpOL1W4P6axpG2+DN5IPpuj3IKci/mvInuQtaWEuRG9Lxw2Ukg2lzo4rk0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746599091; c=relaxed/simple;
	bh=yIxpL7LJINcGQCYV3WKDg2l3cC2MaNWqR8MRzfpUgBM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=J/I9agPC7DFl7icZuJtiX67G+zVNVCcuDKNKTXZWYIsFz1bcvh91fTKsgrJJOjJfVF5udTHyJBprruXwZoIsVhxfVcceLKXYkewB3VostmKVC5Olva2l3erQAEgI4hWp5XxXYyVfmMnH9WVWGF6CIWCMqTQLWwEdINzsZG+t5+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JXYJ4VNS; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JXYJ4VNS"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43d0a037f97so34968795e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 23:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746599088; x=1747203888; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=hD9zIW42LA6slVSrrFyagI194Qso9e0OpjZIhXRXyvA=;
        b=JXYJ4VNSzuK5Dx3QGIgF3DqJaxKCNOjuajHX6j4kWTNmw4qUouNy0iZ9Gn4ZQpEANM
         TyvLfCWLbVMRSfMqdevgFzRqsrVbcRWEGaH8KU5kDWioknX/yVisAj0FI1lDSWpAa9xp
         pjSQzuII3jDMN5Hei1SgcAXkmTH6J6vY+UthHPELij6W7lU3ki5gooyNaK955Ul8g0p4
         EuZv0wue0lcd3zFS7wNgwwcnAEDcXze71F51lJlPAos2VVm0Nk0YbCb9wpzArvJg5phq
         Z4wZUAV5Gqv6li9E088s/+Pvrjnx9dVWNDoG4OiCMosOHPH64WhrrBu2SNfzd8mtmEnh
         o0MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746599088; x=1747203888;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hD9zIW42LA6slVSrrFyagI194Qso9e0OpjZIhXRXyvA=;
        b=th7FdeqxKDjske0HeIbGgB4aHiLSkkrkRyjb9BJKfDtILHaHzqPGL9KlV5k4flfzf0
         FbIyNzo7kYDR7frmnQkAQknXTiEALNdLoy39P1SLNF0jRgIP8XZRsWX1iY1oXvk8xV/l
         CE3ffrv1mYc1PkXbZDvo83z7U1m2pUI6btTm65XVnw4mzUw1iOZ2cVk4J1q0eXXhXt3+
         yhNUHYnb3xj2B0svgofgx39gjQ0FkyPlPPYj7YV0RmMXJiXLfYDl2VRw7miiC6Qj5RRe
         AumC2LgVfAl+zAHk2VG0lRaSGFQZtfLZtPVTaOco/RAw703/i/nZGNdTtMlDPuRKGW3j
         38vQ==
X-Forwarded-Encrypted: i=1; AJvYcCUD65LL1g7fHGFwxwEbBAgdN8BR/6tW7paTZJO3QIfmFQ3HEIckgumbVUUMLtXzxAHydy0T4lctUx1tqmQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw33XhM0mffrTPmYOLBykhJiIW8ZEw8gNW0FLbuPhGhaYuYWyJm
	E5nZgZAJCpZjsR1CD1E+lcK99PWdQ3Pt2dzc47MvOq/qyKd8lJAo56DDxRfYvopdtnHDaCRmiow
	zejlJLkkahoayPw==
X-Google-Smtp-Source: AGHT+IEQD3CUFYskBATw0XZ+FKCVzi/D0fVledLscEilaA+KhdfsGoZlOtCY+5Bdl7cSzmBzTJ++V5TmOaZ4qwQ=
X-Received: from wmbdr22.prod.google.com ([2002:a05:600c:6096:b0:440:60ac:3f40])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:a44:b0:43d:7588:667b with SMTP id 5b1f17b1804b1-441d44c2b9bmr13748615e9.10.1746599088658;
 Tue, 06 May 2025 23:24:48 -0700 (PDT)
Date: Wed, 7 May 2025 06:24:46 +0000
In-Reply-To: <aBoYYzj7sGEbsQzw@Mac.home>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250506-aref-from-raw-v2-1-5a35e47f4ec2@kernel.org> <aBoYYzj7sGEbsQzw@Mac.home>
Message-ID: <aBr8rnOk2QmBBR-n@google.com>
Subject: Re: [PATCH v2] rust: elaborate safety requirements for `AlwaysReferenceCounted`
From: Alice Ryhl <aliceryhl@google.com>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Andreas Hindborg <a.hindborg@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Oliver Mangold <oliver.mangold@pm.me>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, May 06, 2025 at 07:10:43AM -0700, Boqun Feng wrote:
> On Tue, May 06, 2025 at 10:29:02AM +0200, Andreas Hindborg wrote:
> > Clarify that implementers of `AlwaysReferenceCounted` must prevent the
> > implementer from being directly initialized by users.
> > 
> > It is a violation of the safety requirements of `AlwaysReferenceCounted` if
> > its implementers can be initialized on the stack by users. Although this
> > follows from the safety requirements, it is not immediately obvious.
> > 
> > The following example demonstrates the issue. Note that the safety
> > requirements for implementing `AlwaysRefCounted` and for calling
> > `ARef::from_raw` are satisfied.
> > 
> >   struct Empty {}
> > 
> >   unsafe impl AlwaysRefCounted for Empty {
> >       fn inc_ref(&self) {}
> >       unsafe fn dec_ref(_obj: NonNull<Self>) {}
> >   }
> > 
> >   fn unsound() -> ARef<Empty> {
> >       use core::ptr::NonNull;
> >       use kernel::types::{ARef, RefCounted};
> > 
> >       let mut data = Empty {};
> >       let ptr = NonNull::<Empty>::new(&mut data).unwrap();
> >       let aref: ARef<Empty> = unsafe { ARef::from_raw(ptr) };
> > 
> 
> Hmm.. I would say in this case, what gets violated is the safe
> requirement of ARef::from_raw(), because callers are supposed to
> guarantee that an refcount increment was passed to `ARef` and in this
> case, and unsound() cannot guarantee that here because it's going to
> clean up `data` when the it returns.

You can change the example to go through `impl From<&T> for ARef<T>`,
and then you have the same situation without this unsafe op.

Alice
