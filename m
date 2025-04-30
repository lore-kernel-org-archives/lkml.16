Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1FDA204F9C;
	Wed, 30 Apr 2025 15:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746026472; cv=none; b=kWn+zkQgoutzV4Ti9U2NRB7X5qP+32x8qrGoGidzLtwkL/9vpuJJk/a/NfBpHwZFPyRQuP9ptNDupCBth+UmpNAm/6A5PsTA57+2wKoAlpSFxFjIuDmIhrzEA0PyKRduO8BTj0zhOThtviaBFttB/IM5NwkaBLyHR1d9yOnDN80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746026472; c=relaxed/simple;
	bh=2t0avsYGFh5dbngitM91y3UXh//iU+YmHd1EzhAodJU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mNj7FAZVPZ/85DYVOZccADwBL2ee9zltj/4Fr7vSlBtCGWbbEMhLbZkXXhfvWer1uophnNGgjlJpfBT/l0HrnHJMFbwmoFNRjTczs28AHcz6unbYdJl9+233uVUoYv2aSVBjuU4HR+flWHWzOtEt1cEvf4GHg5w+oxyjtgVynrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Xvz7OAl1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Xvz7OAl1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 739D1C4CEE7;
	Wed, 30 Apr 2025 15:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1746026472;
	bh=2t0avsYGFh5dbngitM91y3UXh//iU+YmHd1EzhAodJU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xvz7OAl1AD3mMKNOz5ZJUvauSAKo6qYe65ZC9WN86ulr2CZCF+P0qBetm/9t9hAse
	 2dQXoL5mxH/KXXm/ZFBpjrGDJO15CgoavebDLVcCOZC5T1KCVCtkGd8HIrsY1FGfJ7
	 1o82B6fOxyTHtjT5v+Cv6Ptg0FoMddDXQs0EIcp4=
Date: Wed, 30 Apr 2025 17:21:09 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Matthew Maurer <mmaurer@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 0/8] rust: DebugFS Bindings
Message-ID: <2025043005-monkhood-caring-7829@gregkh>
References: <20250429-debugfs-rust-v1-0-6b6e7cb7929f@google.com>
 <2025043024-disk-rockfish-1c1b@gregkh>
 <CAGSQo0040a9efWj8bCr4KiMUXezJJ2HVQVR5aJ90rgrYSjKq1w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGSQo0040a9efWj8bCr4KiMUXezJJ2HVQVR5aJ90rgrYSjKq1w@mail.gmail.com>

On Wed, Apr 30, 2025 at 08:01:38AM -0700, Matthew Maurer wrote:
> > And yes, I know why you want to tie debugfs layout to a structure
> > layout, it makes one type of debugfs use really easy to write in rust,
> > but that's not the common user for what we have today.  Let's address
> > the common use first please, save the "builder" pattern stuff for after
> > we nail all of that down.
> >
> > thanks,
> >
> > greg k-h
> 
> I'll remove that API in the next version of the patch series to get
> the basics down first, but to give some motivation to what I was
> trying to support which *is* done in C today, see qcom-socinfo [1] -
> it uses a backing `socinfo_params` struct which is expected to outlive
> its whole directory structure.

What exactly do you mean by "outlive"?  Right now debugfs has no way to
"own" a structure and it just "has to work" so that the file will always
be there and hope that the backing variable is also still there.  I
guess you are trying to encode that "hope" into something real?  :)

> [1]: https://github.com/torvalds/linux/blob/b6ea1680d0ac0e45157a819c41b46565f4616186/drivers/soc/qcom/socinfo.c#L133-L156
> 

Yes, SOC drivers are a mess of debugfs files, but manually creating them
is "fine" to start with, let's not go wild to start with.  If we see
common patterns outside of the single soc driver use case, then we can
propose exporting structures as a directory structure in debugfs, but I
really think that is a very minor use of the api at the moment.

thanks,

greg k-h
