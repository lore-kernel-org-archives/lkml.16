Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6DA161FCE;
	Thu, 15 May 2025 13:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747317155; cv=none; b=M6oWxadd0amF22cxI09AR6w+waqD0QTGUraboMR1+F2Bm6hS+fzdyoszAe4I7HDeljT5cB+uRWdQiAVqUcFe/YyGQtdki1fGvDjgbny0EU+rBMIbSUdWZZk9S7tL7iXrfJ9GifGKNEY+3TuBWB3pCNkvjdd2KiycfIzEhlfsCzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747317155; c=relaxed/simple;
	bh=1goV/IH2W0v4lJhJQXfNOetGBRDKZao2V7PBJPLKVmk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fAMFn/cfSuXCDAd064qWG6M/RLdLQEJt4MZ4TOmAJUKijTv80tcW2fcePw7NvFDaWS4H5O1+4Nutbbqik6S/AMltANcq4gV9xHq/HYARWQBLeFJ3XTv0o1IhkWXJqR+6OAQOJdy722LRxMkAnmHwvf/gyoFz8F0/pV/SaFNtynw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eQrFOqpE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eQrFOqpE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8189C4CEEB;
	Thu, 15 May 2025 13:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747317155;
	bh=1goV/IH2W0v4lJhJQXfNOetGBRDKZao2V7PBJPLKVmk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eQrFOqpE4RICxz+SJSpwX/Zhfm4M8rhDAaYMYR5OlTf+yluWHNlVedJJHgj9DHGqN
	 g07i7GJ9zzFrPaUFZpYjtnWu9HPWJY1YLm93EzUpJHuYTTxE4dDsA0AcQ66tFTxyl9
	 mKzko4InbP2tuy5YRklogDJnX4DpTwl9m6d+7Emo7QCzluWnV/NXWI4Tp0PXw/eUIf
	 JmYdmtQuwgtkZMURBAz0wsUrUVrr2nc4+ma9kx8mbaRhlgYE7X+DBzrz1GrwikYj8n
	 abVNlv87C+im4CgkXm/oqjXZVQ03k4MAzJDSFYJA5Dl4JFl2XJKzyvkDw2uku4IHyZ
	 hNkfRoFCjWt3g==
Date: Thu, 15 May 2025 15:52:29 +0200
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
Message-ID: <aCXxnUdO8--5y8Zo@pollux>
References: <20250514-topics-tyr-request_irq-v3-0-d6fcc2591a88@collabora.com>
 <20250514-topics-tyr-request_irq-v3-1-d6fcc2591a88@collabora.com>
 <aCUQ0VWgoxdmIUaS@pollux>
 <A7E3A124-AF77-4A4A-B4E2-AE7DDB1CE007@collabora.com>
 <aCXYaCGvO_tI1OOh@pollux>
 <39C56E3E-07C6-44BB-B5F6-38090F037032@collabora.com>
 <aCXh1g5FWNiz7exb@pollux>
 <BEDD659F-B222-4150-9018-3B59126140E6@collabora.com>
 <aCXv86nAARGgoqEq@pollux>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aCXv86nAARGgoqEq@pollux>

On Thu, May 15, 2025 at 03:45:28PM +0200, Danilo Krummrich wrote:
> On Thu, May 15, 2025 at 10:16:33AM -0300, Daniel Almeida wrote:
> > 
> > >> 
> > >> Well, not really, because this impl PinInit can be assigned to something larger
> > >> that is already pinned, like drm::Device::Data for example, which is (or was)
> > >> already behind an Arc, or any other private data in other subsystems.
> > >> 
> > >> IIUC what you proposed has yet another indirection. If we reuse the example
> > >> from above, that would be an Arc for the drm Data, and another Arc for the
> > >> handler itself?
> > > 
> > > Can't you implement Handler for drm::Device::Data and e.g. make Registration
> > > take an Arc<T: Handler>?
> > 
> > No, because drivers may need more than one handler. Panthor needs 3, for
> > example, for 3 different lines.
> > 
> > > 
> > > The irq::Registration itself doesn't need to be allocated dynamically, so it'd
> > > still be a single allocation, no?
> > > 
> > 
> > Right, the registrations don't, but the handlers do.
> 
> Why does the handler need to be allocated dynamically?
> 
> What about something like the following?
> 
> 	pub struct Registration<T, H: Handler<T>> { ... };
> 
> 	pub trait Handler<T> {
> 	   fn handle_irq(&T) -> IrqReturn;
> 	}
> 
> 	// Could be `drm::Device::Data`.
> 	struct MyData { ... };
> 
> 	// Implements `Handler<MyData>`.
> 	struct IRQHandler1;
> 	struct IRQHandler2;
> 
> 	// `data` is `Arc<MyData>`
> 	irq::Registration::<IRQHandler1>::new(data, ...);
> 	irq::Registration::<IRQHandler2>::new(data, ...);
> 
> With that you can have as many IRQs as you want without any additional
> allocation.

Alternatively we could also do the following, which is probably simpler.

	pub struct Registration<H: Handler> { ... };

	pub trait Handler {
	   fn handle_irq(&self) -> IrqReturn;
	}

	// Could be `drm::Device::Data`.
	struct MyData { ... };

	// Implements `Handler`.
	struct IRQHandler1(Arc<MyData>);
	struct IRQHandler2(Arc<MyData>);

	// `data` is `Arc<MyData>`
	let handler1 = IRQHandler1::new(data);
	let handler2 = IRQHandler2::new(data);

	irq::Registration::new(handler1, ...);
	irq::Registration::new(handler2, ...);
