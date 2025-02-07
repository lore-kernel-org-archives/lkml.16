Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAF49238D56;
	Fri,  7 Feb 2025 15:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738941305; cv=none; b=j7dXGQrDkHyPDtV6lS6+DVB3ZvUf5Fdnr26cfwiMpj9a+XIjbZo7iG1NQgvFm7LEApRZtWxyQMn29oF5PW4OPiPYtZ0d8euQ8S4Hhw8jZS0i3Hpijr61JPQ3wPcJaiEHKf/iYfhNKVn7g2w0drlpAuvLP/QexMEq59xnqP4ZBOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738941305; c=relaxed/simple;
	bh=4aQHZL17KzDSkEIgs4SxDbSylwmGyGTEP4iOI4qQiNc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kwhA46/xzgYN9VlsD04Z+XpF5mOSaT/E1IBQgUfqHaIW4l29GdJBk9A14FZn1GVlRHI5Kaqc9Za4VmyULFkk9An8fmJNTyW1O5bWwaXYuVmWz4BbvNMkXiW392lTbsfKVYjFSkVdmExA0b/d9QfGATvwTANoPofkBdBwIBv4prE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=a00CFLc6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="a00CFLc6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88C6FC4CED1;
	Fri,  7 Feb 2025 15:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1738941305;
	bh=4aQHZL17KzDSkEIgs4SxDbSylwmGyGTEP4iOI4qQiNc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a00CFLc6+63VzLsCrBNcU53PO9PYnHW2NQdOPCX+M3szPPOvUJHMHu1KTeBogsbIg
	 pAv5xKWw1FkT6KKa78sdMtVVGJe47rNZ+BWJkikb1dY2xP5uDnNgkWIj4Dc1ZGOgI6
	 mYaALWiE5snTvQMunfN9V6nUylGydbOoGC0OWNI8=
Date: Fri, 7 Feb 2025 16:15:01 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Danilo Krummrich <dakr@kernel.org>
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
Message-ID: <2025020721-squirt-jam-e7f9@gregkh>
References: <20250207004049.178049-1-lyude@redhat.com>
 <2025020702-garlic-kindly-8377@gregkh>
 <Z6X56URWy8zSHV9i@pollux>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6X56URWy8zSHV9i@pollux>

On Fri, Feb 07, 2025 at 01:17:45PM +0100, Danilo Krummrich wrote:
> On Fri, Feb 07, 2025 at 10:25:09AM +0100, Greg Kroah-Hartman wrote:
> > On Thu, Feb 06, 2025 at 07:40:45PM -0500, Lyude Paul wrote:
> > > +
> > > +/// The registration of a faux device.
> > > +///
> > > +/// This type represents the registration of a [`struct faux_device`]. When an instance of this type
> > > +/// is dropped, its respective faux device will be unregistered from the system.
> > > +///
> > > +/// # Invariants
> > > +///
> > > +/// `self.0` always holds a valid pointer to an initialized and registered [`struct faux_device`].
> > > +///
> > > +/// [`struct faux_device`]: srctree/include/linux/device/faux.h
> > > +#[repr(transparent)]
> > > +pub struct Registration(NonNull<bindings::faux_device>);
> > > +
> > > +impl Registration {
> > > +    /// Create and register a new faux device with the given name.
> > > +    pub fn new(name: &CStr) -> Result<Self> {
> > > +        // SAFETY:
> > > +        // - `name` is copied by this function into its own storage
> > > +        // - `faux_ops` is safe to leave NULL according to the C API
> > > +        let dev = unsafe { bindings::faux_device_create(name.as_char_ptr(), null()) };
> > 
> > I'm fine with null() here, but why wouldn't a rust binding want to allow
> > this?  What's unique here that make it this way, or is it just that the
> > current users you are thinking of don't care about it?
> 
> This is what I meant when I mentioned allowing NULL for the faux_device_ops
> allows us to simplify the Rust abstraction quite a bit.
> 
> Having probe() and remove() doesn't do a lot for us in this case in Rust other
> than needing a separate faux::Driver trait with a corresponding faux::Adapter
> implementation to handle those callbacks. It'd be an unnecessary indirection.
> 
> Do you see any advantage going through probe()?

Only reason I implemented it was that we have a real user of it in the
kernel that needed it, the regulator dummy driver.  Odds are we could
rewrite the C code to not need it, but for now let's leave it.

If over time, no one else actually needs it, I'll refactor and remove
the callbacks entirely after more of the tree is moved to the faux code.

If you all don't need the callback, wonderful, I'll not complain :)

thanks,

greg k-h
