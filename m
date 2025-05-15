Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 526834174A;
	Thu, 15 May 2025 13:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747316729; cv=none; b=HKetSE68cDU0f6JrjE7tylaZBndjLT0eC3BtjArQ2Xvs9Bik+ayTHWDhuUsfzTmj5EsoB9/+NdV3llWfCuohCVHoRw4c50m7Nu5IPKjx9FGO/0mU4Bn+KOsEHxdSkohB2jYhW1b4Qt723ox907J2e4M5bO20ZEi1zbBJI3fJics=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747316729; c=relaxed/simple;
	bh=Yf5ozxz5whqLQCo9jqPr8PaEfciL+7Ev1mmrhOrq60c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hZ2YDX+MXJKX4Hh2sm6jJuJMTq8QW20JKsMl+xEsKAkOkic03ssAAm4EqL3kUApkn72W/iupXuzzrfpccXJpVeIPIK8jHLMAlobeuO/myQFhj1/X6fY4cmCxZBo9EdG786sXBoDCQRbj5sPFCQsNSIkM61NI24UUItO6ZLPm2ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cwbUJbI5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cwbUJbI5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E054FC4CEE7;
	Thu, 15 May 2025 13:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747316728;
	bh=Yf5ozxz5whqLQCo9jqPr8PaEfciL+7Ev1mmrhOrq60c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cwbUJbI5lYhGkQhVds3dK/23UdMXETlsYDUcJIZjnUz4BRQ6SMpv5GoHaE+C/eM4Z
	 2vyABNSMUBguaMqIgq9yz/Oa2knRNrm8rhvu0097raKBkIWmUUA8QN12nqJThvzb2L
	 J1pzFFRW1WZL/JqivtIQ8E3tZiHwoL7BHHy2nmzUp2HxV8/JclFSZbit/aQV0JmDyV
	 MJrWOmIoRckd4WQPbHB7r436XsjavwvidSpvR1izFWalX+oypHJZL7tivVrEdA+I3A
	 VSbS3NX/4zc9p7nLO6yHjo3aZe1IkZR8FjZ6KXertEYeAtCAOJdJbI0KdqtZ40m+4N
	 fWMVAkd6Jg43w==
Date: Thu, 15 May 2025 15:45:23 +0200
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
Message-ID: <aCXv86nAARGgoqEq@pollux>
References: <20250514-topics-tyr-request_irq-v3-0-d6fcc2591a88@collabora.com>
 <20250514-topics-tyr-request_irq-v3-1-d6fcc2591a88@collabora.com>
 <aCUQ0VWgoxdmIUaS@pollux>
 <A7E3A124-AF77-4A4A-B4E2-AE7DDB1CE007@collabora.com>
 <aCXYaCGvO_tI1OOh@pollux>
 <39C56E3E-07C6-44BB-B5F6-38090F037032@collabora.com>
 <aCXh1g5FWNiz7exb@pollux>
 <BEDD659F-B222-4150-9018-3B59126140E6@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BEDD659F-B222-4150-9018-3B59126140E6@collabora.com>

On Thu, May 15, 2025 at 10:16:33AM -0300, Daniel Almeida wrote:
> 
> >> 
> >> Well, not really, because this impl PinInit can be assigned to something larger
> >> that is already pinned, like drm::Device::Data for example, which is (or was)
> >> already behind an Arc, or any other private data in other subsystems.
> >> 
> >> IIUC what you proposed has yet another indirection. If we reuse the example
> >> from above, that would be an Arc for the drm Data, and another Arc for the
> >> handler itself?
> > 
> > Can't you implement Handler for drm::Device::Data and e.g. make Registration
> > take an Arc<T: Handler>?
> 
> No, because drivers may need more than one handler. Panthor needs 3, for
> example, for 3 different lines.
> 
> > 
> > The irq::Registration itself doesn't need to be allocated dynamically, so it'd
> > still be a single allocation, no?
> > 
> 
> Right, the registrations don't, but the handlers do.

Why does the handler need to be allocated dynamically?

What about something like the following?

	pub struct Registration<T, H: Handler<T>> { ... };

	pub trait Handler<T> {
	   fn handle_irq(&T) -> IrqReturn;
	}

	// Could be `drm::Device::Data`.
	struct MyData { ... };

	// Implements `Handler<MyData>`.
	struct IRQHandler1;
	struct IRQHandler2;

	// `data` is `Arc<MyData>`
	irq::Registration::<IRQHandler1>::new(data, ...);
	irq::Registration::<IRQHandler2>::new(data, ...);

With that you can have as many IRQs as you want without any additional
allocation.
