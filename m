Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D17A2BE5E;
	Wed, 30 Apr 2025 15:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746027034; cv=none; b=NfsXFKJrNfSlUq6ug3qa00gc5KPVX/TJnXR5YeJJj2lHxeFVdrdutUh8GxaMlZ4gSPW1cDFoX5sKoELfe7YaBFVaWIVTbUO0EWiI1HTmI5JdMiVSiapZ2NU490CNNwstwMarDIbB9D4zhy460P/dPRZsB5B4owixs6IrcJ+PcwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746027034; c=relaxed/simple;
	bh=AS32/rHTjyOFXoo7tYTj0CBEoCErW9c1FZVBo3FZpE4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J2aFsqDCJHn3osCpf75VizpMJJZ9MDzL3vg62PJOq3eoCPCsBTIGt/E5IQ1PYNdDzsvqq87At8284as0a90mZ3R9vkVawvkORFeQ2CPU4kNbrmz6BjJrx7FrGfgWZ5CXsxyaGLdV6tMsCtDliD2BEGtZ7x2g6MVO0L9KHwT4z0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=h1M+70X8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="h1M+70X8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86DFEC4CEE7;
	Wed, 30 Apr 2025 15:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1746027034;
	bh=AS32/rHTjyOFXoo7tYTj0CBEoCErW9c1FZVBo3FZpE4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h1M+70X86HpkqWt+J93cvxLR36srNRdlFuuUluHV/oICxxaOlxKhTyVn9BDidDmSQ
	 rBCdgQOhNyZUolyoDZbcETnryEkRNMJC2uKnojKXe6qCcFKGwfD4iEy1myXDgptSS2
	 B4uuzz+fklh55JjGu2lmhKTlhqOZmDkISoxKO1Qs=
Date: Wed, 30 Apr 2025 17:30:31 +0200
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
Message-ID: <2025043044-suds-vascular-c7fa@gregkh>
References: <20250429-debugfs-rust-v1-0-6b6e7cb7929f@google.com>
 <2025043024-disk-rockfish-1c1b@gregkh>
 <CAGSQo0040a9efWj8bCr4KiMUXezJJ2HVQVR5aJ90rgrYSjKq1w@mail.gmail.com>
 <2025043005-monkhood-caring-7829@gregkh>
 <CAGSQo03=09qCj230-y3yqD_4zRJ9PE8U-9NLmOZokUfBpRdKCg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGSQo03=09qCj230-y3yqD_4zRJ9PE8U-9NLmOZokUfBpRdKCg@mail.gmail.com>

On Wed, Apr 30, 2025 at 08:24:14AM -0700, Matthew Maurer wrote:
> On Wed, Apr 30, 2025 at 8:21 AM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Wed, Apr 30, 2025 at 08:01:38AM -0700, Matthew Maurer wrote:
> > > > And yes, I know why you want to tie debugfs layout to a structure
> > > > layout, it makes one type of debugfs use really easy to write in rust,
> > > > but that's not the common user for what we have today.  Let's address
> > > > the common use first please, save the "builder" pattern stuff for after
> > > > we nail all of that down.
> > > >
> > > > thanks,
> > > >
> > > > greg k-h
> > >
> > > I'll remove that API in the next version of the patch series to get
> > > the basics down first, but to give some motivation to what I was
> > > trying to support which *is* done in C today, see qcom-socinfo [1] -
> > > it uses a backing `socinfo_params` struct which is expected to outlive
> > > its whole directory structure.
> >
> > What exactly do you mean by "outlive"?  Right now debugfs has no way to
> > "own" a structure and it just "has to work" so that the file will always
> > be there and hope that the backing variable is also still there.  I
> > guess you are trying to encode that "hope" into something real?  :)
> 
> Yes, the `Values` structure used by the builder interface enforces
> that the backing variable must live at least as long as the `Dir`
> corresponding to the lowest directory it's going to be used in. To
> make DebugFS safe in Rust, we either need to:
> 1. Have DebugFS files own things (not currently done, doesn't seem to
> match intentions).

Agreed, let's not do that.

> 2. Expose things that live forever (e.g. globals, like the early patches do)

Let's start with this for now.

> 3. Have a pinned structure that is guaranteed to outlive the files
> that use it (what the builder interface is trying to support)

Let's add this "after" we get the basics down.  Should make things
simpler for you to work on now, and for us to review.

Baby steps :)

thanks,

greg k-h
