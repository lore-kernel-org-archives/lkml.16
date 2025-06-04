Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B30B22257E
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 07:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749023342; cv=none; b=pIMGmv78M2nFxtt6XjQWqs8YFiwXKvE/rqKfVhvXEFg/HWoQ5pxQD09pzDF8fyrflEwNWpVoHQY4B3c7CxPBjBJByyE3424Kjzr4h8NauTUrCPQhmeUB2uOoqD2dirv3/+80FKq0rRojcPLXnHzLsdPkqcikDgeIF1CXMUSzGuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749023342; c=relaxed/simple;
	bh=Y91tevR+W6PcM+zpcBt8Z9NKZ5dKqVTzohjnHawtCfs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mdwG+mhxLmYqnRUSZkgq1WNczL1P9xSF85ILPsE/V2gatpYesJpqXl7d4zUsMMbiyMb8DcLEFq93ifUBfLUEgiXmjNyhwv7r6iSqNLE/4GSZWV3d5LPY+EQ7R3LR+Lm2rtzbCPUjPOpiSdFmaK4ex2B4lkuVwZunzHeAIa2a3Oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=u89felaa; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="u89felaa"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a4ef2c2ef3so5172730f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 00:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749023339; x=1749628139; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r2JrrLVXtWq0ZlEcT+ggQ7B1+aTqnF51jgo4AjW5G5g=;
        b=u89felaa6rJPLj2BXSVEpXoWCc/3bh8E9mlwe4TwkNOOTH48hcnECupGO/Sz5w22Dq
         fqe9ovah4PUKJdl1Pb+CFDnjSoB4ZbZmzIpfwKzsQC8VnzvMY7u0gG1/ZtEuhthTBNQT
         eY6cJZPY68RHEvipIt89OqeN145D/OMKk3WOMMgSa9pcNsUTs2LK408Nvr6SVzfOLqLx
         9cqqG7L4HZuVQSRA2S/wXNDntSRKvi44Bj8UC44C8YJFGRjUZZY0m+rPMxl9W2/kuOWF
         O0nK029BVEu4qHsF9+rnqXE0RYtIno8zq6Y2GEevQI2JZnCTsxmGVYxvKbVAsre951Vb
         LEhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749023339; x=1749628139;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r2JrrLVXtWq0ZlEcT+ggQ7B1+aTqnF51jgo4AjW5G5g=;
        b=RB1kBQ0KTbNPN1YCRP08XHm4AM28hywJqdX54Bx3GFgdTAvX5DWyI9kGWCHoG1hpai
         aebN1/cxywZofsBmb+CU7GVTsnJs4K8JrtuhvmvhbePjAHFO1FGyi7fKaCoPASXPoTL4
         sj+6Qei5RAMWm2qbNWQEWYmlpIJ8Z2bUsuOFImz/waVoyTfNjBRaDSyn+EUCuRVJn6/E
         +qiRp7cLmqkC2i79JgvKXw1vaOvnSIetl0D75kL6L2WxiSFRrv6goqmzs1UBdGI0jPcK
         PCF44sIDWzg94MfWQ+EXmWtJSf1q+pJ7sqSWaPI27d6rTdW/3sv9aFOJjlNJQyVFxiob
         FzvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCz4p1anOHzo0mMz+XKhyOOu5p8ZouRstA6IMDEuOrlQnm6Qh+SjSWXDblCgdu+Hl0Tt3stcrS1V3lm1Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKfDDTPGjeoegUhGNR2jPMxXIpMha3T8SyNbkAOG2EtlKwx2dO
	CvNTE/nKqg+GjklHhxFdkFmTrNqgaWexWU7iBh19kYZuOn6EooUtgTS08LuEH4GZ6te20POYgq9
	+aR1aTzHREhXEd20zJR7UuMYKdSKuh3Vlhpbf0NWP
X-Gm-Gg: ASbGncsu5iJH86NRJ+Q5hnYgFLiV+si8K60fahVsIrF4RgvOyAl8g4L1x4IZTHsQ2WX
	K2f86waNNmCntm4DVi3RAhCbudVdGd3zEdv6iHug0UoloYPPHQmUe0z0H296YyS1OZjYhJ+xWh9
	/6xr/9a3wwYCVpFq0CAu3hMAZ0oOtF+EDUItkXgFB/J6G8nPRRo/2GFmiv/eH4HRSaZ5WPTlvg0
	Q==
X-Google-Smtp-Source: AGHT+IG5fofWbTd+9m+cs8Z7tCQ3tl+PCcjzqzka/RHMWIN8bFHJ9Sf5raaS3fFJBTe+KjOTZgpIqj4KeLulT47o4j8=
X-Received: by 2002:a05:6000:430c:b0:3a3:648d:aa84 with SMTP id
 ffacd0b85a97d-3a51d9244abmr1399593f8f.5.1749023339205; Wed, 04 Jun 2025
 00:48:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250514-topics-tyr-request_irq-v3-0-d6fcc2591a88@collabora.com>
 <20250514-topics-tyr-request_irq-v3-1-d6fcc2591a88@collabora.com>
 <D9W5IX9Z7QMU.3DL48O2KYTN1Z@kernel.org> <aD3BN7-MAyYq2NAX@google.com> <DADKRV2K4A5I.3UAZF5O9EW6R8@kernel.org>
In-Reply-To: <DADKRV2K4A5I.3UAZF5O9EW6R8@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 4 Jun 2025 09:48:46 +0200
X-Gm-Features: AX0GCFsuec_TXyVmEM9CpLpMb7PLpxoI4bzL_Ly2apsNuRiv8yFkcxrhqPX8rOQ
Message-ID: <CAH5fLggaX18dAzWqLLkn9ii+hpu14u4aY5vd=kSCkk6LvsW-eA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] rust: irq: add support for request_irq()
To: Benno Lossin <lossin@kernel.org>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 4, 2025 at 9:37=E2=80=AFAM Benno Lossin <lossin@kernel.org> wro=
te:
>
> On Mon Jun 2, 2025 at 5:20 PM CEST, Alice Ryhl wrote:
> > On Wed, May 14, 2025 at 10:04:43PM +0200, Benno Lossin wrote:
> >> On Wed May 14, 2025 at 9:20 PM CEST, Daniel Almeida wrote:
> >> > +                )
> >> > +            });
> >> > +
> >> > +            if res.is_err() {
> >> > +                // SAFETY: We are returning an error, so we can des=
troy the slot.
> >> > +                unsafe { core::ptr::drop_in_place(addr_of_mut!((*sl=
ot).handler)) };
> >> > +            }
> >> > +
> >> > +            res
> >> > +        };
> >> > +
> >> > +        // SAFETY:
> >> > +        // - if this returns Ok, then every field of `slot` is full=
y
> >> > +        // initialized.
> >> > +        // - if this returns an error, then the slot does not need =
to remain
> >> > +        // valid.
> >> > +        unsafe { pin_init_from_closure(closure) }
> >>
> >> Please don't use `pin_init_from_closure`, instead do this:
> >>
> >>     pin_init!(Self {
> >>         irq,
> >>         handler,
> >>         _pin: PhantomPinned
> >>     })
> >>     .pin_chain(|this| {
> >>         // SAFETY: TODO: correct FFI safety requirements
> >>         to_result(unsafe {
> >>             bindings::request_irq(...)
> >>         })
> >>     })
> >>
> >> The `pin_chain` function is exactly for this use-case, doing some
> >> operation that might fail after initializing & it will drop the value
> >> when the closure fails.
> >
> > No, that doesn't work. Using pin_chain will call free_irq if the call t=
o
> > request_irq fails, which is incorrect.
>
> Good catch. That's a bit annoying then... I wonder if there is a
> primitive missing in pin-init that could help with this... Any ideas?

I believe initializers for underscore fields would do it. We could
potentially abuse the _pin field, but frankly I think that's too
confusing to the reader.

Alice
