Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15126746E;
	Thu, 15 May 2025 12:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747313120; cv=none; b=Kb3IUy8Ok1UIFXP/g3Fj7q7H/QqV8hSN504RwTB58XbTNzIfdifxCbngkLUAp7skuUoijm36syP3dvwZjJlrgNlImap4/7vTs9nCl2FiWOa4TKvltl3GiV5n5DxU+Bb142DmGNI1TtgeAMCrhMdMMWWg6s8srKASNeOPNkpxRDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747313120; c=relaxed/simple;
	bh=n6t0QGGKj4SxZGOv74+Gcw/BcrsNt79VDm3c8SVl93w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RPvNS13KPY67TQb6lkT4KPUDETGiYk84MjQkc1xYjK8waNyKdNgQvkElwLZ7YvHLg0byaeShq1vO3hZot/rzJt9pFCib7AMyzcF7wDEeqPpZ9xJmgkFs/2LTlKnbV+tBD5u6TmcmV9rszysLZRjf1bGSOur7y+HLUEY2Jw9FrvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eRHT+ezS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eRHT+ezS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E19AC4CEE7;
	Thu, 15 May 2025 12:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747313116;
	bh=n6t0QGGKj4SxZGOv74+Gcw/BcrsNt79VDm3c8SVl93w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eRHT+ezSxCLkK6rCH9X1xj4GDVblvbfhHjGtn5uHF3zDo6VYUgUpuZafkswY6xQwm
	 kocZ+wHnYHAtAr1tKxrTcMDv89QazEO8ZoYK1mTDDg5JJW0bqsBjVXIktW8rKlvyfc
	 nBtsEf87aeq1x/LDf5ygfk6YGL2RdgvcLPXOJleaND8vbGWftcHdtq9yVlgWLO6xBm
	 mHrmxUAzUKl5jOMVTY6j8PTOHt4iSSfxJV7HCoOYh4QTIQ7rEPmFOHNkSSHv9o+00t
	 AEU69Cir+C6BAjjLu/VCzt2faZv6YDQNIN6UtDZhpSaxQPuGzzmA1LnCo328sIeBs6
	 XHFUkbj4C28Ng==
Date: Thu, 15 May 2025 14:45:10 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v3 1/2] rust: irq: add support for request_irq()
Message-ID: <aCXh1g5FWNiz7exb@pollux>
References: <20250514-topics-tyr-request_irq-v3-0-d6fcc2591a88@collabora.com>
 <20250514-topics-tyr-request_irq-v3-1-d6fcc2591a88@collabora.com>
 <aCUQ0VWgoxdmIUaS@pollux>
 <A7E3A124-AF77-4A4A-B4E2-AE7DDB1CE007@collabora.com>
 <aCXYaCGvO_tI1OOh@pollux>
 <39C56E3E-07C6-44BB-B5F6-38090F037032@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <39C56E3E-07C6-44BB-B5F6-38090F037032@collabora.com>

On Thu, May 15, 2025 at 09:27:51AM -0300, Daniel Almeida wrote:
> 
> 
> > On 15 May 2025, at 09:04, Danilo Krummrich <dakr@kernel.org> wrote:
> > 
> > On Thu, May 15, 2025 at 08:54:35AM -0300, Daniel Almeida wrote:
> >> Hi Danilo,
> >> 
> >>> On 14 May 2025, at 18:53, Danilo Krummrich <dakr@kernel.org> wrote:
> >>> 
> >>> On Wed, May 14, 2025 at 04:20:51PM -0300, Daniel Almeida wrote:
> >>>> +/// // This is running in process context.
> >>>> +/// fn register_irq(irq: u32, handler: Handler) -> Result<Arc<Registration<Handler>>> {
> >>>> +///     let registration = Registration::register(irq, flags::SHARED, c_str!("my-device"), handler);
> >>>> +///
> >>>> +///     // You can have as many references to the registration as you want, so
> >>>> +///     // multiple parts of the driver can access it.
> >>>> +///     let registration = Arc::pin_init(registration, GFP_KERNEL)?;
> >>> 
> >>> This makes it possible to arbitrarily extend the lifetime of an IRQ
> >>> registration. However, we must guarantee that the IRQ is unregistered when the
> >>> corresponding device is unbound. We can't allow drivers to hold on to device
> >>> resources after the corresponding device has been unbound.
> >>> 
> >>> Why does the data need to be part of the IRQ registration itself? Why can't we
> >>> pass in an Arc<T> instance already when we register the IRQ?
> >>> 
> >>> This way we'd never have a reason to ever access the Registration instance
> >>> itself ever again and we can easily wrap it as Devres<irq::Registration> -
> >>> analogously to devm_request_irq() on the C side - without any penalties.
> >>> 
> >>>> +///     // The handler may be called immediately after the function above
> >>>> +///     // returns, possibly in a different CPU.
> >>>> +///
> >>>> +///     {
> >>>> +///         // The data can be accessed from the process context too.
> >>>> +///         let mut data = registration.handler().0.lock();
> >>>> +///         *data = 42;
> >>>> +///     }
> >>>> +///
> >>>> +///     Ok(registration)
> >>>> +/// }
> >>> 
> >> 
> >> Up until this point, there was no need for the data to not be inline with the
> >> registration. This new design would force an Arc, which, apart from the
> >> heap-allocation, is restrictive for users.
> > 
> > Does the current design not also imply a heap allocation heap allocation? With
> > my proposal irq::Registration::new() can just return an irq::Registration
> > instance, not an impl PinInit that you need to stuff into a Box or Arc instead.
> > Hence, there shouldn't be a difference.
> 
> Well, not really, because this impl PinInit can be assigned to something larger
> that is already pinned, like drm::Device::Data for example, which is (or was)
> already behind an Arc, or any other private data in other subsystems.
> 
> IIUC what you proposed has yet another indirection. If we reuse the example
> from above, that would be an Arc for the drm Data, and another Arc for the
> handler itself?

Can't you implement Handler for drm::Device::Data and e.g. make Registration
take an Arc<T: Handler>?

The irq::Registration itself doesn't need to be allocated dynamically, so it'd
still be a single allocation, no?

> I definitely see your point here, I am just trying to brainstorm another way of
> doing this.
> > 
> >> Can’t we use Devres with the current implementation?
> >> 
> >> IIUC from a very cursory glance, all that would mean is that you'd have to call
> >> try_access() on your handler, which should be fine?
> > 
> > Well, that would work indeed.
> > 
> > But people will - with good reason - be upset that every access to the handler's
> > data needs to be guarded with the RCU read side critical section implied by
> > Revocable and hence Devres.
> 
> True, I totally missed that.
> 
> > 
> > We can easily avoid that in this case, hence we should do it.
> 
> — Daniel
> 
