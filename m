Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E912D2AEF1
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 08:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748939327; cv=none; b=hWq+agJU7dmj443kY58VdOYsu4OirlNI+ZJh10l00yjTAwaTl54iM02pPmW8HmwVZ23R6ahaBoiOoLSjGfpIzCDsorG5ThA84HBOB57IkYnvkUpNWCAfBQ5qNelnvLC0qafiN2GGRHOjMuT0o2woBYbWAP8L/K3weDjIE0kVCGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748939327; c=relaxed/simple;
	bh=fR5uG73M1Zmo/F/EfXLNtbe02orN27IMBiuBa8oMiE0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=swASmEp94ruTOIAR2P7qFnE0vXqFQR2vlPQvgVLXUgBmwZhSxqLLHPnDXYfNXn72K+N+IHWAHGpqew+dx/1RsmF23hlzCf+UEGwIBstPU1j3PKZn3b9xdy+SapuDRdbPOVDc4itGjrTdhmDWBCwZa8ySJl3JhJpn68FIzeKa02U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=x7IQ5nfX; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="x7IQ5nfX"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4517abcba41so17701455e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 01:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748939324; x=1749544124; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=GQ0VvJnIzT1+EN3W5MConvlQrO30Hn+2ClVpKXxeTRU=;
        b=x7IQ5nfXpu4Nyd9rjS94M1KxRTWKr2tmDnoZ2piU3Eks7LJ+BFsSMPFOmy3ZZyECbL
         3/eoo+SfgNOjiHHXXhrZEDHhUbm7qGA5+fcUEZnBMj8VNG+02ArZJxm/3Zuezn7gZNM3
         27GBAfN6o9LpxsfHqG0RIkz8m3IMMex2trL7Px1hTZt7TEWK/jQf7VSplEzrpiZZOPQA
         tckGN1ptUoidvuaYmHS4xcfss3Z/PKr6kH0kD7rm91I3GOSheYQGt7UwhDwhY5rErqDa
         xYT0WX+cAFAGRz3UZDJEwUXfh0/XlExgjennlTUhT+QEbal6mviZWnTASblOkkjN9piZ
         mOdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748939324; x=1749544124;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GQ0VvJnIzT1+EN3W5MConvlQrO30Hn+2ClVpKXxeTRU=;
        b=didzV7ErdoAg5QX+EVlE1bA3WXJV3vTQRJiRGp4M7feALFfNuzoLMhCUJTYv/d66ot
         lIs4Btr+fFyF6DItPvJzpnLNTBnqipbetlJyzxoY63ikO8J96a9Z7xtTrfKZZnE5kiFk
         5BTJuntpGPN7f7fccfastRDArrira5fTo0XVBeqJICsCFnhPCELZyC0GwpIF6NrEg5QA
         NiJ0/1eoldXIWnfVliptRxA1Y2DDHOtV1vlsQWhCgJ8AiUiAhYgfrw2akIYFPl5hDAVx
         pA2xWYqZh7aGuiajD7SOVHYtsGCRE8I+l+RKScHfv9KdmmvtgROAhrQ6hVgogos80YVS
         h2Nw==
X-Forwarded-Encrypted: i=1; AJvYcCXRHjtRoz8olt5ib8AOwEA92ooRe935CBUL2upV8AmpnYbvyNytWRBJnSNOwRPBi6CJzjab58GXE/ecf+M=@vger.kernel.org
X-Gm-Message-State: AOJu0YzW3gzUFnz1zjM6bvDPeXEGZ2jKdOa7Dgjp4Ap7ft3WviU245t5
	t/8W2ZQ/pZyHZgXBDlC+kOqpLc/eFcRY0GMy+jaEceEHQm6nGinAq4b6v2v5s3WtsqC9U+dYyzk
	HXNi0nde0gb2VpfvHmA==
X-Google-Smtp-Source: AGHT+IGD6dDaLc68TZA4IPE+uie06M/8+5fGtLBwtAQrZjhcYSy5uESPsnmpErj6d0BKEI0MwUH9MfLQNIQONLo=
X-Received: from wmbbi20.prod.google.com ([2002:a05:600c:3d94:b0:451:d70f:eb87])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1c2a:b0:444:c28f:e81a with SMTP id 5b1f17b1804b1-450d887e0f4mr138940435e9.27.1748939324248;
 Tue, 03 Jun 2025 01:28:44 -0700 (PDT)
Date: Tue, 3 Jun 2025 08:28:42 +0000
In-Reply-To: <aD3f1GSZJ6K-RP5r@pollux>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250514-topics-tyr-request_irq-v3-0-d6fcc2591a88@collabora.com>
 <20250514-topics-tyr-request_irq-v3-1-d6fcc2591a88@collabora.com>
 <aCUQ0VWgoxdmIUaS@pollux> <aD3PCc6QREqNgBYU@google.com> <aD3f1GSZJ6K-RP5r@pollux>
Message-ID: <aD6yOte8g4_pcks7@google.com>
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

On Mon, Jun 02, 2025 at 07:31:00PM +0200, Danilo Krummrich wrote:
> On Mon, Jun 02, 2025 at 04:19:21PM +0000, Alice Ryhl wrote:
> > On Wed, May 14, 2025 at 11:53:21PM +0200, Danilo Krummrich wrote:
> > > On Wed, May 14, 2025 at 04:20:51PM -0300, Daniel Almeida wrote:
> > > > +/// // This is running in process context.
> > > > +/// fn register_irq(irq: u32, handler: Handler) -> Result<Arc<Registration<Handler>>> {
> > > > +///     let registration = Registration::register(irq, flags::SHARED, c_str!("my-device"), handler);
> > > > +///
> > > > +///     // You can have as many references to the registration as you want, so
> > > > +///     // multiple parts of the driver can access it.
> > > > +///     let registration = Arc::pin_init(registration, GFP_KERNEL)?;
> > > 
> > > This makes it possible to arbitrarily extend the lifetime of an IRQ
> > > registration. However, we must guarantee that the IRQ is unregistered when the
> > > corresponding device is unbound. We can't allow drivers to hold on to device
> > > resources after the corresponding device has been unbound.
> > > 
> > > Why does the data need to be part of the IRQ registration itself? Why can't we
> > > pass in an Arc<T> instance already when we register the IRQ?
> > > 
> > > This way we'd never have a reason to ever access the Registration instance
> > > itself ever again and we can easily wrap it as Devres<irq::Registration> -
> > > analogously to devm_request_irq() on the C side - without any penalties.
> > 
> > If we step away from the various Rust abstractions for a moment, then it
> > sounds like the request_irq API must follow these rules:
> > 
> > 1. Ensure that free_irq is called before the device is unbound.
> > 2. Ensure that associated data remains valid until after free_irq is
> >    called.
> > 
> > We don't necessarily need to ensure that the Registration object itself
> > is dropped before the device is unbound - as long as free_irq is called
> > in time, it's okay.
> > 
> > Now, if we use Devres, the way this is enforced is that during cleanup
> > of a device, we call free_irq *and* we destroy the associated data right
> > afterwards. By also destroying the associated data at that moment, it
> > becomes necessary to use rcu_read_lock() to access the associated data.
> > But if we just don't destroy the associated data during device cleanup,
> > then that requirement goes away.
> > 
> > Based on this, we could imagine something along these lines:
> > 
> >     struct RegistrationInner(i32);
> >     impl Drop for RegistrationInner {
> >         fn drop(&mut self) {
> >             free_irq(...);
> >         }
> >     }
> >     
> >     struct Registration<T> {
> >         reg: Devres<RegistrationInner>,
> >         data: T,
> >     }
> > 
> > Here you can access the `data` on the registration at any time without
> > synchronization.
> 
> I was just about to reply to Daniel proposing exactly this alternative, it's
> equivalent with what I went with in the MiscDeviceRegistration patches for
> supporting the device driver use-case [1].
> 
> So, I'm perfectly fine with this approach.
> 
> [1] https://lore.kernel.org/lkml/20250530142447.166524-6-dakr@kernel.org/

Ah, ok.

> > 
> > Note that with this, I don't think the rcu-based devres is really the
> > right choice. It would make more sense to have a mutex along these
> > lines:
> > 
> >     // drop Registration
> >     if devm_remove_callback() {
> >         free_irq();
> >     } else {
> >         mutex_lock();
> >         free_irq();
> >         mutex_unlock();
> >     }
> >     
> >     // devm callback
> >     mutex_lock();
> >     free_irq();
> >     mutex_unlock();
> > 
> > This avoids that really expensive call to synchronize_rcu() in the devm
> > callback.
> 
> This would indeed be an optimization for the special case that we never care
> about actually accessing the Revocable, i.e. where we have no need to make the
> "read" have minimal overhead.
> 
> However, I think we can do even better and, at the same time, avoid this special
> case optimization and have everything be the common case with what I already
> plan on implementing:
> 
> I want that regardless of how many devres callbacks a driver registers by having
> Devres wrapped objects around, there's only a *single* synchronize_rcu() call for
> all of them.
> 
> We can achieve this by having the devres callbacks on driver unbind in two
> stages, the first callback flips the Revocable's atomic for for all Devres
> objects, then there is a single synchronize_rcu() and then we drop_in_place()
> all the Revocable's data for all Devres objects.
> 
> As mentioned above I plan on implementing this, but given that it's "just" a
> performance optimization for the driver unbind path and given that we're not
> very close to a production driver upstream, it haven't had the highest priority
> for me to implement so far.

That optimization sounds like something we definitely want, but I have
one question: is free_irq() safe to use in atomic context / inside
rcu_read_lock()? What about the threaded-irq variant? After all, don't
they sleep until existing callbacks finish running?

Alice
