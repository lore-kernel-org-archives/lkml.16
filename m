Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFD45215067;
	Wed, 14 May 2025 21:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747259608; cv=none; b=U9FpWb628ZYwZLmGPuj0BtM1poTClaU5ik/fjLfx0TNML/nujZHIx1sR/ijnbtqeXQUTG15NcNFLucpMt9he6/8XnJ+6AsfMJ8Jt53rrwSgeZ0eFrhXLG+M+jayPaP/ddCC1lJLqC/Kj2BJMHWOgs6u1FXfmzh2Z3SMEJYCnlRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747259608; c=relaxed/simple;
	bh=nsObEfVCJShN7JaJ21c+UP71k1/2nGef1m5vgTn6OWc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P9bjOsor+k8XOWj5yo9GLfDN9/mUAndmWMMEksCde56M2Nts2bl/hK39tsEWkjcOTDwVhyN2qNiKcpOjpzUZbQNa1mkv+9xYZ893UtoqkDSjJjghamd83w7hIHDcMfL0hJuh4RnJ/2pvIYTkgKZJieonp5zs3deqrBSpc97dEI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qaNMTHIR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qaNMTHIR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DD2DC4CEE3;
	Wed, 14 May 2025 21:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747259607;
	bh=nsObEfVCJShN7JaJ21c+UP71k1/2nGef1m5vgTn6OWc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qaNMTHIRLq8tR2MREhvmYeBxjSkDvJGZedPyb3S0uwuhW+8tenU2aXeVUSNEJHNbl
	 WzTN4j/3ld7+qpo/PZ+NPdPFAUvdzjrHM0poiACebwu1y1xGmzS0SOi7uWVJqpoK8a
	 P5oo05p5Cfvk6QdekWJFx9qJeIYVsMqKvyIAwDy/7yDNw/bKTjlerPwS9ERtvv6pzy
	 l/9o+lLCquYqCrFgtsEWeXIr7Nku9bVberq6QyXX3C9DHbZePHK0LVGlbW1a2xR+rm
	 OHxKEC6OSpvvS+pgZdJPI3POS1iCaynSccpMqd66ImjpaTdy905/RnYhLTI+f24RO9
	 G4PUJRbuXofhQ==
Date: Wed, 14 May 2025 23:53:21 +0200
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
Message-ID: <aCUQ0VWgoxdmIUaS@pollux>
References: <20250514-topics-tyr-request_irq-v3-0-d6fcc2591a88@collabora.com>
 <20250514-topics-tyr-request_irq-v3-1-d6fcc2591a88@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514-topics-tyr-request_irq-v3-1-d6fcc2591a88@collabora.com>

On Wed, May 14, 2025 at 04:20:51PM -0300, Daniel Almeida wrote:
> +/// // This is running in process context.
> +/// fn register_irq(irq: u32, handler: Handler) -> Result<Arc<Registration<Handler>>> {
> +///     let registration = Registration::register(irq, flags::SHARED, c_str!("my-device"), handler);
> +///
> +///     // You can have as many references to the registration as you want, so
> +///     // multiple parts of the driver can access it.
> +///     let registration = Arc::pin_init(registration, GFP_KERNEL)?;

This makes it possible to arbitrarily extend the lifetime of an IRQ
registration. However, we must guarantee that the IRQ is unregistered when the
corresponding device is unbound. We can't allow drivers to hold on to device
resources after the corresponding device has been unbound.

Why does the data need to be part of the IRQ registration itself? Why can't we
pass in an Arc<T> instance already when we register the IRQ?

This way we'd never have a reason to ever access the Registration instance
itself ever again and we can easily wrap it as Devres<irq::Registration> -
analogously to devm_request_irq() on the C side - without any penalties.

> +///     // The handler may be called immediately after the function above
> +///     // returns, possibly in a different CPU.
> +///
> +///     {
> +///         // The data can be accessed from the process context too.
> +///         let mut data = registration.handler().0.lock();
> +///         *data = 42;
> +///     }
> +///
> +///     Ok(registration)
> +/// }
