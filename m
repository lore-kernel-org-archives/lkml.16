Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D7D16A95B;
	Fri,  7 Feb 2025 12:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738930671; cv=none; b=RcW1jfL1k4KdvmQ6ciKThrETDdH96ROrv0hACgojmHNZnrsRMGRfeNjdGOHKlFeCN5TmT1uqrEEmTlXVVPjHKxua+YWKPYBBKcuAHUu1NZskwpc3358NUq7yOR4OOTLYBZ6SXlKV8UmGxKAI43bFM8Of6+q7pUJcIPAY+TTXi2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738930671; c=relaxed/simple;
	bh=bf8DBZCUM8J3LvQ2Du0d66p+za3gm1XatxHVyOIRTxk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Njl7K0PB94c+Oy3rY3CuDVeM4SmacV8mBHDq3gvwvNgWxg4KlCfrNM7uVu1dqad+Vt0jxClRgmnfYCqz9s1xEbGoZ0qJhCxJVGVDFap7EugYUxJ3q93+dyMYv+Lv62QMyjQNBnY4GbtL7graMxjClvdynVTZ4Lu3GaEw0tOL2cI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bAkbTOkf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bAkbTOkf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F2E5C4CED1;
	Fri,  7 Feb 2025 12:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738930671;
	bh=bf8DBZCUM8J3LvQ2Du0d66p+za3gm1XatxHVyOIRTxk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bAkbTOkfjcgCjv+YHr/Eld/oS7A4IZFK7+i34SkqUxeth89sXGDZIvAuEhKL4Us7k
	 lAJKcCXEn78ZYZU71GwJ4jRKzew/4/sG7ciN9TNo9xHOfXJ2frLiWiPtnAvVbBEi1E
	 YF6I/MIQ2hw1mX6ml8XhNtH3DDZGm1v3xwIyWddvurGMRU+urjk8qCuPepP3XmsOm5
	 hDGD5xCqSWNDfVu14ZzSXhL2R46w5HshBFiiXsYZ8g/ZRuT1m9F4iH6eizUT80n9c1
	 7RpV1zj6rnBeuJHz2YO0PZcknsxn9wP3OQSTZ5g4ywrmHQJEwJmvwLfsFCtPA1nRfC
	 ptn3+iRplC4gQ==
Date: Fri, 7 Feb 2025 13:17:45 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Lyude Paul <lyude@redhat.com>, rust-for-linux@vger.kernel.org,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Xiangfei Ding <dingxiangfei2009@gmail.com>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] rust/kernel: Add faux device bindings
Message-ID: <Z6X56URWy8zSHV9i@pollux>
References: <20250207004049.178049-1-lyude@redhat.com>
 <2025020702-garlic-kindly-8377@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025020702-garlic-kindly-8377@gregkh>

On Fri, Feb 07, 2025 at 10:25:09AM +0100, Greg Kroah-Hartman wrote:
> On Thu, Feb 06, 2025 at 07:40:45PM -0500, Lyude Paul wrote:
> > +
> > +/// The registration of a faux device.
> > +///
> > +/// This type represents the registration of a [`struct faux_device`]. When an instance of this type
> > +/// is dropped, its respective faux device will be unregistered from the system.
> > +///
> > +/// # Invariants
> > +///
> > +/// `self.0` always holds a valid pointer to an initialized and registered [`struct faux_device`].
> > +///
> > +/// [`struct faux_device`]: srctree/include/linux/device/faux.h
> > +#[repr(transparent)]
> > +pub struct Registration(NonNull<bindings::faux_device>);
> > +
> > +impl Registration {
> > +    /// Create and register a new faux device with the given name.
> > +    pub fn new(name: &CStr) -> Result<Self> {
> > +        // SAFETY:
> > +        // - `name` is copied by this function into its own storage
> > +        // - `faux_ops` is safe to leave NULL according to the C API
> > +        let dev = unsafe { bindings::faux_device_create(name.as_char_ptr(), null()) };
> 
> I'm fine with null() here, but why wouldn't a rust binding want to allow
> this?  What's unique here that make it this way, or is it just that the
> current users you are thinking of don't care about it?

This is what I meant when I mentioned allowing NULL for the faux_device_ops
allows us to simplify the Rust abstraction quite a bit.

Having probe() and remove() doesn't do a lot for us in this case in Rust other
than needing a separate faux::Driver trait with a corresponding faux::Adapter
implementation to handle those callbacks. It'd be an unnecessary indirection.

Do you see any advantage going through probe()?
