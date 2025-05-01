Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25F7533F6;
	Thu,  1 May 2025 16:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746117327; cv=none; b=EhxuHnVvQu6UPEOFqPV7hSB9M0eYuhpAv1dQf33Rhrn0T18cItzLXmoFQGMXMJ8uMKnPSYFVZeRUup4JvztXF39wSlrw67WS2RcrFcrJaTQoNFmhtwQRT7fUTD/nW9sc0hV7ODlD7zs/6dUYNusl9sfFTVKHqFwRIA9wtIrfnRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746117327; c=relaxed/simple;
	bh=4Wfg99HhQU1fQHRwEG2NytbqKJWV1vNC8E9enELUdHE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g/KJE3LX7RnXFSGF+ai1c5MedW6+oIP3zww0jIAw1bqJk4PtaFdbwp/5BmHabXGhzDASCiuMU1T5PYyxzW3zAk4pBV2bypJMPvzd9PPea5Uv+ouqVeibNQatxCtfZdyHJH+ziU+n6Nnx89U+qdngtzQyOYE+wO++yIAQQIB/8iQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AdauZo2f; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AdauZo2f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B164C4CEE3;
	Thu,  1 May 2025 16:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746117326;
	bh=4Wfg99HhQU1fQHRwEG2NytbqKJWV1vNC8E9enELUdHE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AdauZo2flQbdA9UpmmQ8rjvFpiExQxGfnoxq+mEeN1cC0XQd9iLRql1Zb30gXTJTG
	 utDRr0X2HGfrrVxyBOxzw+Z6rfA9RQqEmh9npp7bVZuTEkjhlB48DKbjhi3YGwI7iS
	 hei2yeHPbg/1MYYFJVqKi6EgJjPkDsZhghtYd07SWXImweuGMIhmbitnvY8fq9+Ltp
	 Ab+RmAp/xTeYT+dp9VQ+Hy0FAo7oBv3S81VOSidyAvXzpFwt30CnJaGkzKJ75Nwzfi
	 yznRu00+hWHjLCoQ36wlwQo0j+6wngfnpWBOrfcor4QzCfk9xbGz57ZYN/hMtT2EK+
	 z4N37cqseCiiA==
Date: Thu, 1 May 2025 18:35:20 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Matthew Maurer <mmaurer@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Timur Tabi <ttabi@nvidia.com>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 1/4] rust: debugfs: Bind DebugFS directory creation
Message-ID: <aBOiyB5fG_F60BNv@pollux>
References: <20250430-debugfs-rust-v2-0-2e8d3985812b@google.com>
 <20250430-debugfs-rust-v2-1-2e8d3985812b@google.com>
 <aBNKEewhCP8jRIZL@pollux>
 <CAGSQo01O8DFe1+APM2cYYFT_4ROKrbTQpNmozYk3NQwYc3Zv2Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGSQo01O8DFe1+APM2cYYFT_4ROKrbTQpNmozYk3NQwYc3Zv2Q@mail.gmail.com>

On Thu, May 01, 2025 at 09:02:58AM -0700, Matthew Maurer wrote:
> On Thu, May 1, 2025 at 3:16 AM Danilo Krummrich <dakr@kernel.org> wrote:
> >
> > On Wed, Apr 30, 2025 at 11:31:56PM +0000, Matthew Maurer wrote:
> > >
> > > +    /// Create a DebugFS subdirectory.
> > > +    ///
> > > +    /// # Examples
> > > +    ///
> > > +    /// ```
> > > +    /// # use kernel::c_str;
> > > +    /// # use kernel::debugfs::Dir;
> > > +    /// {
> > > +    ///    let parent = Dir::new(c_str!("parent"));
> > > +    ///    // parent exists in DebugFS here.
> > > +    ///    let child = parent.subdir(c_str!("child"));
> > > +    ///    // parent/child exists in DebugFS here.
> > > +    /// }
> > > +    /// // Neither exist here.
> > > +    /// ```
> > > +    pub fn subdir(&self, name: &CStr) -> Self {
> > > +        Self::create(name, Some(self))
> > > +    }
> >
> > I think this should return a new type (SubDir), which is a transparent wrapper
> > of Dir and dereferences to Dir.
> >
> > Subsequently, we can remove Dir::keep() implement SubDir::keep() instead. This
> > ensures that we can never call keep() on the root directory, which would always
> > be a bug.
> 1. If the code in question is builtin rather than a module, discarding
> this without tearing it down may not be a bug.

True, if builtin *and* never intended to remove, it's indeed not a bug, but
arguably not very useful either.

> 2. Users could always write `core::mem::forget()`, so this will always
> be reachable (even if we decide to remove `::keep` to make it harder
> to choose).

Yet I wouldn't encourage users to create bugs by offering them a convenient way
to do so, without any benefit. :)

> > As an alternative to the Deref impl, you can also implement
> > `From<SubDir> for Dir`, such that a SubDir can either be "kept" or converted to
> > a Dir. Probably, that's even better.
> 
> Yes, this was the "extra type complexity" I referenced in the cover
> letter that I was considering doing. I think that probably what I'll
> do for v3 is to have both the `Deref` *and* `From` implementation, so
> that `SubDir` still automatically gets all of `Dir`s stuff, since your
> later `File` comment convinces me we can't just have everything be
> `Dir`.

Sounds good to me, thanks!
