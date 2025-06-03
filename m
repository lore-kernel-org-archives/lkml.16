Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF79664C6;
	Tue,  3 Jun 2025 10:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748945345; cv=none; b=pToPqpMKiC2M/ujCIWFscoev+iYUSbKn8dIs7nx5IlfTcs7OTDVInnD9HcPLmjo57BBTdchf9XlfjdC0Q1eY/vEgwyUTDnWX3WmxVcB2Wwqtf0vbtUnxunhn7+bvPovVxDmMCko/wSdT+EkKamUaVDrxgMgAm7zQQNyErOsrs7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748945345; c=relaxed/simple;
	bh=UwI4XUZPbK9PisF4gurC498orwO4ATvOHiOSueoRh7M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kjOaVmcBKV4c2p9LTBVxZSUWFrF/K0PXjYFiHVm9EcTdXXnq4IflnsQb38w36uVJyO2eh9GOhY49o1s8rLCIRK9m5KB5ZECVQBWppiePnikU3w2CP/5crfaNGm6V2O1ZOa/jAQOwck0YiL7mK7nUSss8BysZwWCGoIpaAgR2cHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LPqQCrVB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LPqQCrVB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E772C4CEED;
	Tue,  3 Jun 2025 10:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748945345;
	bh=UwI4XUZPbK9PisF4gurC498orwO4ATvOHiOSueoRh7M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LPqQCrVBVIOulCDtCmHVq5P7G3rxEeCe06XDoOMpLf8Cy50ZjUDFVB2ouI8NHaU3b
	 xKS2p8GGzhqUx7PO3NFHyclntCfVc/dMBzG+eeGsLm4FUIlgrMLr3q5c3Ee+3imp8p
	 epgPMz5KCJjt9Dl96QlXbvyrRH4qfaSY5mCpVVFX+3/+6PAK2hgAFiv8RoLh/kC06f
	 7XmEthyo3Z12D5FEMcEoyyTGLS+Lx/9obRo+U/rk7YhBI8+AjrRt+CD9EaxRG4GV7D
	 JF5UzdmfFj8IDY2EuVPBa58D1r/IFKUyq+NhtPkUVSacqPl8jJYLJY603Ru3w+TZRd
	 j18VRQEV76Tsg==
Date: Tue, 3 Jun 2025 12:08:59 +0200
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
Message-ID: <aD7JuyVRVr5dSqE9@cassiopeiae>
References: <aCUQ0VWgoxdmIUaS@pollux>
 <aD3PCc6QREqNgBYU@google.com>
 <aD3f1GSZJ6K-RP5r@pollux>
 <aD6yOte8g4_pcks7@google.com>
 <aD62ZGBwqXxTroeX@cassiopeiae>
 <aD64YNuqbPPZHAa5@google.com>
 <aD68BzKRAvmNBLaV@cassiopeiae>
 <CAH5fLgjweugttOtuiyawNp5s2N9JPoo5FTJ+Zs9t_S87ggC1Gg@mail.gmail.com>
 <aD7DvBfAxKi7Fpg_@cassiopeiae>
 <CAH5fLggKL4jMjrJJEYV=Snqftu+oc4-sTNj9spinON5kHVP9xg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAH5fLggKL4jMjrJJEYV=Snqftu+oc4-sTNj9spinON5kHVP9xg@mail.gmail.com>

On Tue, Jun 03, 2025 at 11:57:22AM +0200, Alice Ryhl wrote:
> On Tue, Jun 3, 2025 at 11:43 AM Danilo Krummrich <dakr@kernel.org> wrote:
> >
> > On Tue, Jun 03, 2025 at 11:18:40AM +0200, Alice Ryhl wrote:
> > > I don't think that helps. If Devres::drop gets to swap is_available
> > > before the devm callback performs the swap, then the devm callback is
> > > just a no-op and the device still doesn't wait for free_irq() to
> > > finish running.
> >
> > True, this will indeed always be racy. The rule from the C API has always been
> > that devm_{remove,release}_action() must not be called if a concurrent unbind
> > can't be ruled out. Consequently, the same is true for Revocable::revoke() in
> > this case.
> >
> > I think Devres::drop() shouldn't do anything then and instead we should provide
> > Devres::release() and Devres::remove(), which require the &Device<Bound>
> > reference the Devres object was created with, in order to prove that there
> > can't be a concurrent unbind, just like Devres::access().
> 
> What I suggested with the mutex would work if you remove the devm
> callback *after* calling free_irq.
> 
>     // drop Registration
>     mutex_lock();
>     free_irq();
>     mutex_unlock();
>     devm_remove_callback();

I think it would need to be

	if (!devm_remove_callback()) {
		mutex_lock();
		free_irq();
		mutex_unlock();
	}

>     // devm callback
>     mutex_lock();
>     free_irq();
>     mutex_unlock();

Yes, we could solve this with a lock as well, but it would be an additional
lock, just to maintain the current drop() semantics, which I don't see much
value in.

The common case is that the object wrapped in a Devres is meant to live for the
entire duration the device is bound to the driver.

> Another simpler option is to just not support unregistering the irq
> callback except through devm. Then you don't have a registration at
> all. Creating the callback can take an irq number and a ForeignOwnable
> to put in the void pointer. The devm callback calls free_irq and drops
> the ForeignOwnable.

That's basically what Devres::new_foreign_owned() already does.
