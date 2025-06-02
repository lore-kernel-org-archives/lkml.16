Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8DED224245;
	Mon,  2 Jun 2025 17:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748885466; cv=none; b=UkZ1FW2xqzv/VihQh6M/FtpoQceGWRRypeHxRK6RkgvaA1qKdcHxSsOZRX+toTrX8SSqgwnntC4iEu6OmQZFuK25Pu+/UU3rTr6v0FYw4acsps/JMafuxDkML44JRMNWGkM0eEe+RKH4qTrz9C5cOOowsxq1cTLcCGdA3bm/KoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748885466; c=relaxed/simple;
	bh=A9MilKd7v8rxKZ+GFEjZyV9ZgWub5FkEKrTwUm7LxkE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NzcBmVAM2/NfhSd4aOmTM+3HpRTaONC7IGHQ1U3qhmPA1fHiGyi+14FiPg2ANyrJbeFUCbRJGvw6rRNYTYFuAjfiLgbZouTAmzqJ1Hypb9/xXK0qJBcfxZeskw75lCtp1mbORRKHjPSfvtEuTyIKZG2/5T4jRy6lKL0JOunR2v0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qLIpf8R2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qLIpf8R2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48436C4CEEE;
	Mon,  2 Jun 2025 17:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748885466;
	bh=A9MilKd7v8rxKZ+GFEjZyV9ZgWub5FkEKrTwUm7LxkE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qLIpf8R2lyZSyIjUxLP00WMUHLGwAT9GGxXNTVsqahLWzrxlLkDhLbuMAmI/y2sh2
	 IPDYn2bCJq68p3u2G3TdNETC3TzwGBZ7xDC3849wQ89INO5Rykp88+CYWVQnIpuKqZ
	 VAkuthiNLBsnqC38VnnQMDfLOmldRND9fNn0nUXeDUiTk67omcwQP1o9xTQeIFZhWh
	 AcaZDqRBhm2McNEIc14XwmWn0ryIUGxnTUEtDG4z7ctg+O/lg3a9NCyLTRYRr7H4Jo
	 1HSKL0z6WfwnYDmrtoQ7/ETSl57bnAQrWGdSIgvG74xEtmLijnkqlzZ1gNnOA33Nn1
	 EBLm6pI1Ifxnw==
Date: Mon, 2 Jun 2025 19:31:00 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>,
	Daniel Almeida <daniel.almeida@collabora.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v3 1/2] rust: irq: add support for request_irq()
Message-ID: <aD3f1GSZJ6K-RP5r@pollux>
References: <20250514-topics-tyr-request_irq-v3-0-d6fcc2591a88@collabora.com>
 <20250514-topics-tyr-request_irq-v3-1-d6fcc2591a88@collabora.com>
 <aCUQ0VWgoxdmIUaS@pollux>
 <aD3PCc6QREqNgBYU@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aD3PCc6QREqNgBYU@google.com>

On Mon, Jun 02, 2025 at 04:19:21PM +0000, Alice Ryhl wrote:
> On Wed, May 14, 2025 at 11:53:21PM +0200, Danilo Krummrich wrote:
> > On Wed, May 14, 2025 at 04:20:51PM -0300, Daniel Almeida wrote:
> > > +/// // This is running in process context.
> > > +/// fn register_irq(irq: u32, handler: Handler) -> Result<Arc<Registration<Handler>>> {
> > > +///     let registration = Registration::register(irq, flags::SHARED, c_str!("my-device"), handler);
> > > +///
> > > +///     // You can have as many references to the registration as you want, so
> > > +///     // multiple parts of the driver can access it.
> > > +///     let registration = Arc::pin_init(registration, GFP_KERNEL)?;
> > 
> > This makes it possible to arbitrarily extend the lifetime of an IRQ
> > registration. However, we must guarantee that the IRQ is unregistered when the
> > corresponding device is unbound. We can't allow drivers to hold on to device
> > resources after the corresponding device has been unbound.
> > 
> > Why does the data need to be part of the IRQ registration itself? Why can't we
> > pass in an Arc<T> instance already when we register the IRQ?
> > 
> > This way we'd never have a reason to ever access the Registration instance
> > itself ever again and we can easily wrap it as Devres<irq::Registration> -
> > analogously to devm_request_irq() on the C side - without any penalties.
> 
> If we step away from the various Rust abstractions for a moment, then it
> sounds like the request_irq API must follow these rules:
> 
> 1. Ensure that free_irq is called before the device is unbound.
> 2. Ensure that associated data remains valid until after free_irq is
>    called.
> 
> We don't necessarily need to ensure that the Registration object itself
> is dropped before the device is unbound - as long as free_irq is called
> in time, it's okay.
> 
> Now, if we use Devres, the way this is enforced is that during cleanup
> of a device, we call free_irq *and* we destroy the associated data right
> afterwards. By also destroying the associated data at that moment, it
> becomes necessary to use rcu_read_lock() to access the associated data.
> But if we just don't destroy the associated data during device cleanup,
> then that requirement goes away.
> 
> Based on this, we could imagine something along these lines:
> 
>     struct RegistrationInner(i32);
>     impl Drop for RegistrationInner {
>         fn drop(&mut self) {
>             free_irq(...);
>         }
>     }
>     
>     struct Registration<T> {
>         reg: Devres<RegistrationInner>,
>         data: T,
>     }
> 
> Here you can access the `data` on the registration at any time without
> synchronization.

I was just about to reply to Daniel proposing exactly this alternative, it's
equivalent with what I went with in the MiscDeviceRegistration patches for
supporting the device driver use-case [1].

So, I'm perfectly fine with this approach.

[1] https://lore.kernel.org/lkml/20250530142447.166524-6-dakr@kernel.org/

> 
> Note that with this, I don't think the rcu-based devres is really the
> right choice. It would make more sense to have a mutex along these
> lines:
> 
>     // drop Registration
>     if devm_remove_callback() {
>         free_irq();
>     } else {
>         mutex_lock();
>         free_irq();
>         mutex_unlock();
>     }
>     
>     // devm callback
>     mutex_lock();
>     free_irq();
>     mutex_unlock();
> 
> This avoids that really expensive call to synchronize_rcu() in the devm
> callback.

This would indeed be an optimization for the special case that we never care
about actually accessing the Revocable, i.e. where we have no need to make the
"read" have minimal overhead.

However, I think we can do even better and, at the same time, avoid this special
case optimization and have everything be the common case with what I already
plan on implementing:

I want that regardless of how many devres callbacks a driver registers by having
Devres wrapped objects around, there's only a *single* synchronize_rcu() call for
all of them.

We can achieve this by having the devres callbacks on driver unbind in two
stages, the first callback flips the Revocable's atomic for for all Devres
objects, then there is a single synchronize_rcu() and then we drop_in_place()
all the Revocable's data for all Devres objects.

As mentioned above I plan on implementing this, but given that it's "just" a
performance optimization for the driver unbind path and given that we're not
very close to a production driver upstream, it haven't had the highest priority
for me to implement so far.
