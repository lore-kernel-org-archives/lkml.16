Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B40382820B5;
	Tue,  3 Jun 2025 09:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748943810; cv=none; b=ZWxjbAGviJbGK1Ds9fcBq3sWWF1z/+KvNVVwxEosaxPuLwcMflgY4JhMPQDNEQw3PIejtbtqcoAn5xKE+bJpjCqOosXaTJ8qAqngv0Uyr9sfU1VDWbZB4+QJjQ8Rxl2BJhLkleHgqOpAYdh6ir5POzJsfWnRsL+WpdZ6NdRKHHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748943810; c=relaxed/simple;
	bh=qP17+3iWiPn1wGGHbP/Gtri9Gy08Qm0Dsdo2SoPMpSs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RLvwxzWrCSvzdIvNDIcxUuBmIyBY4F/yPaMLXnMsrRq0yO/4hpjgm8ziRg4YLzFefKB04wHljNoga5gERlkCEMISHmd3Mssfojtxma/+OZ2+T0rdERCOsv0fdJboYMXZlPTkHbCrCrGZJGd2XtRxdiK7QW9qOJLewHXiwMO8uqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c7ICk3tL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c7ICk3tL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 476C6C4CEED;
	Tue,  3 Jun 2025 09:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748943810;
	bh=qP17+3iWiPn1wGGHbP/Gtri9Gy08Qm0Dsdo2SoPMpSs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c7ICk3tLO9R4sLjArr0+9M04GtCdBXbVXXgJ/WRCKq9Eq8Fq3bgff2DvVzwiykFtF
	 kWxf2ZDo9M/BklvxbtKgNDUkO1Ead5wWC8A9Z8QZcoXKQwx97BEECgcJWEHlDOJqHx
	 AtC7DtYDKnayGzs3MZilAsHfpGl/YLOHzJNl7ybaLTfqJmGSFugcMKGGkqqaCwh3ss
	 FJLXU4WyD6i7bvTOWoHiA9ObffAo651e2NP7rXAf54+NDhKd7MGDt8gXJwOlDLnBUF
	 Xr5NcRI4vXlOTTgm/ywsbSWCtkkus7B1Y0FPVseN08OhZyai3bXwRMzNtPmlcl+9D6
	 l4+v3jN9lVlPg==
Date: Tue, 3 Jun 2025 11:43:24 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
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
Message-ID: <aD7DvBfAxKi7Fpg_@cassiopeiae>
References: <20250514-topics-tyr-request_irq-v3-0-d6fcc2591a88@collabora.com>
 <20250514-topics-tyr-request_irq-v3-1-d6fcc2591a88@collabora.com>
 <aCUQ0VWgoxdmIUaS@pollux>
 <aD3PCc6QREqNgBYU@google.com>
 <aD3f1GSZJ6K-RP5r@pollux>
 <aD6yOte8g4_pcks7@google.com>
 <aD62ZGBwqXxTroeX@cassiopeiae>
 <aD64YNuqbPPZHAa5@google.com>
 <aD68BzKRAvmNBLaV@cassiopeiae>
 <CAH5fLgjweugttOtuiyawNp5s2N9JPoo5FTJ+Zs9t_S87ggC1Gg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAH5fLgjweugttOtuiyawNp5s2N9JPoo5FTJ+Zs9t_S87ggC1Gg@mail.gmail.com>

On Tue, Jun 03, 2025 at 11:18:40AM +0200, Alice Ryhl wrote:
> I don't think that helps. If Devres::drop gets to swap is_available
> before the devm callback performs the swap, then the devm callback is
> just a no-op and the device still doesn't wait for free_irq() to
> finish running.

True, this will indeed always be racy. The rule from the C API has always been
that devm_{remove,release}_action() must not be called if a concurrent unbind
can't be ruled out. Consequently, the same is true for Revocable::revoke() in
this case.

I think Devres::drop() shouldn't do anything then and instead we should provide
Devres::release() and Devres::remove(), which require the &Device<Bound>
reference the Devres object was created with, in order to prove that there
can't be a concurrent unbind, just like Devres::access().
