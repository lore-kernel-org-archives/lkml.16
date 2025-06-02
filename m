Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43D5121B9C7
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 16:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748881167; cv=none; b=OAUOHadIAGQK49+HLbisfYCQyrREnF2O5rZkUi521iRq++QniprfASDejDkxi5x8DlTNC6ayzJmUVDU2/XFcR8w+Dm4Xs+D07vO9rFl0J/SsZEL2JyBhh+aru5Of4zaIE0cJGgn+bNGF60aL/t1carq1UkNl3hUhdJSfSjx+oN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748881167; c=relaxed/simple;
	bh=ljIrxYiJzxGe7Czc47ScoMraWr5MaF89zkDh0vKT6Tw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=iGlLL3Gpn6BFYiN0wzW+DPpT/R/nRibkh4KVfEAA8pnJbSPz1x2VOxrNyhjcplz0BiibanXm+r5F/88blohbXESByDe6xLjITU5byzc9w9EVmmwI+CJ7b5ntBbOkKC/wfN+rEwJ/4nx4O6rCwMckAtm4RZtaEK3J+/r7FDtRkkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1mXTW4nB; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1mXTW4nB"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-450d6768d4dso23163705e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 09:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748881163; x=1749485963; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=XuOsHwV8/b0lID06SIdHpZB8Xl8LCaN/OUfGvnqpXk8=;
        b=1mXTW4nBf73BVQjx9mCDmB6cLvSEk4nC74OM3gj6lEtfFzojAhPv7EcVMy2Rf15e/6
         q7uvEDZlKGc40DLRVIFooTxW3+Bkd+SIVigz6E1ia+53tdsKlp1Pw+7h4unQp9aLvHTB
         Okw3Lq5BbbFbTm/ipslLxGq2QDsEIIbspqS3GLAUO06pOO4RXlXOA/o8J7E2yb5nNsye
         Om/m6SkY2ydczEOYMnUIFNmeFVbLeHTAD4k6LDfmSu4g2bs1ua+p7rSf5cKg466W5iW4
         5r1Bx+4bu33GDzCdkvy7ztdN5ZK36dJ/vuu66ZGlikpIw4M55DwzFkM8fCBBonja1HDv
         mNZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748881163; x=1749485963;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XuOsHwV8/b0lID06SIdHpZB8Xl8LCaN/OUfGvnqpXk8=;
        b=mGudAbNjfrR6L+0zvjWuGJ/w2+lwHyH1y6fr9TVdEUElO+1vN8ffy21KJZbZw7rI5V
         rRlhYDPbfo9Ll0v+fK/gP55FzgGNyT7GxBSeOz3YGHAXlai8NCon1cbM+3SVyKpbvJOX
         jKACr5xono5rAp32ijDRwD9HYDM/T3C5ZTL1bEMR1T2T3xQbYxKfmFGrP4f0+tXWuRKh
         vfolWG7dHq3WzgQPb/selkqMXHuUCMaKUauREK5fjfyYwH3hIDP4nl0+0TOTo3X1yFgJ
         fpVezymOlcAJn1cwttDmJZKyWjz7+9QhXmE2CTQ2WlqYduJOfjkhFnj7TgtihAfqsMA+
         LMuA==
X-Forwarded-Encrypted: i=1; AJvYcCV/rLKtJhDmYyu0DR9u77gttd4S0+jakeRsm9PECUNJ4l3iQfSM9gCbfBWzmWEQh59WQdJbtTry5M/Agy8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzgC6ap6PoLs70HUHzjEWLwmH3Xj/v4Pi41olPFfcL7wPKCTS8x
	Bm2yPOsWGb63lC8xN/yOkNFE9yDuDi3n4UQvQ5mWDWK1JVhc4AP3nA1hHZCKBWn7R7SShhU2f3+
	vXjT8fyiIdS3UoJRrzQ==
X-Google-Smtp-Source: AGHT+IHSoq9Hg+bK+/GeaKnDjhYI/ippomoPHfGqVG5kdYjQ3Y/8lR8OvZ7OHaRyk7G5A2dqSYUHiV9mzFamY18=
X-Received: from wmbbi20.prod.google.com ([2002:a05:600c:3d94:b0:451:d70f:eb87])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:46cb:b0:442:d9fb:d9f1 with SMTP id 5b1f17b1804b1-450d882b051mr118531105e9.4.1748881163711;
 Mon, 02 Jun 2025 09:19:23 -0700 (PDT)
Date: Mon, 2 Jun 2025 16:19:21 +0000
In-Reply-To: <aCUQ0VWgoxdmIUaS@pollux>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250514-topics-tyr-request_irq-v3-0-d6fcc2591a88@collabora.com>
 <20250514-topics-tyr-request_irq-v3-1-d6fcc2591a88@collabora.com> <aCUQ0VWgoxdmIUaS@pollux>
Message-ID: <aD3PCc6QREqNgBYU@google.com>
Subject: Re: [PATCH v3 1/2] rust: irq: add support for request_irq()
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Wed, May 14, 2025 at 11:53:21PM +0200, Danilo Krummrich wrote:
> On Wed, May 14, 2025 at 04:20:51PM -0300, Daniel Almeida wrote:
> > +/// // This is running in process context.
> > +/// fn register_irq(irq: u32, handler: Handler) -> Result<Arc<Registration<Handler>>> {
> > +///     let registration = Registration::register(irq, flags::SHARED, c_str!("my-device"), handler);
> > +///
> > +///     // You can have as many references to the registration as you want, so
> > +///     // multiple parts of the driver can access it.
> > +///     let registration = Arc::pin_init(registration, GFP_KERNEL)?;
> 
> This makes it possible to arbitrarily extend the lifetime of an IRQ
> registration. However, we must guarantee that the IRQ is unregistered when the
> corresponding device is unbound. We can't allow drivers to hold on to device
> resources after the corresponding device has been unbound.
> 
> Why does the data need to be part of the IRQ registration itself? Why can't we
> pass in an Arc<T> instance already when we register the IRQ?
> 
> This way we'd never have a reason to ever access the Registration instance
> itself ever again and we can easily wrap it as Devres<irq::Registration> -
> analogously to devm_request_irq() on the C side - without any penalties.

If we step away from the various Rust abstractions for a moment, then it
sounds like the request_irq API must follow these rules:

1. Ensure that free_irq is called before the device is unbound.
2. Ensure that associated data remains valid until after free_irq is
   called.

We don't necessarily need to ensure that the Registration object itself
is dropped before the device is unbound - as long as free_irq is called
in time, it's okay.

Now, if we use Devres, the way this is enforced is that during cleanup
of a device, we call free_irq *and* we destroy the associated data right
afterwards. By also destroying the associated data at that moment, it
becomes necessary to use rcu_read_lock() to access the associated data.
But if we just don't destroy the associated data during device cleanup,
then that requirement goes away.

Based on this, we could imagine something along these lines:

    struct RegistrationInner(i32);
    impl Drop for RegistrationInner {
        fn drop(&mut self) {
            free_irq(...);
        }
    }
    
    struct Registration<T> {
        reg: Devres<RegistrationInner>,
        data: T,
    }

Here you can access the `data` on the registration at any time without
synchronization.

Note that with this, I don't think the rcu-based devres is really the
right choice. It would make more sense to have a mutex along these
lines:

    // drop Registration
    if devm_remove_callback() {
        free_irq();
    } else {
        mutex_lock();
        free_irq();
        mutex_unlock();
    }
    
    // devm callback
    mutex_lock();
    free_irq();
    mutex_unlock();

This avoids that really expensive call to synchronize_rcu() in the devm
callback.

Of course, for cases where the callback is only removed in the devm
callback, you could also do away with the registration, take a
ForeignOwnable that you can turn into the void pointer, and have the
devm callback call free_irq followed by dropping the ForeignOwnable
pointer.

Alice
