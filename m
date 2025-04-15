Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A9D545C18;
	Tue, 15 Apr 2025 09:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744710494; cv=none; b=JGYueDHD7B3mE2WJeqdTHdYcuh+VDuEUAty7nLG5y8TUjZmw+kInUUKO6QdZiovmg/5Sisn9RVszZfqbjRZKVZi0/aFy81A94SSjbtqZHjCmw9RQ4EtQRdlEm14vreb6oqIX3W8bpfsF7teM2fx9TaG3eIP63g2ksjYceZFY8bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744710494; c=relaxed/simple;
	bh=yUDOtL59iR5TIGbk9FlCT53L9VrFtzpvAbsj9EwZ4Nc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YoXMDM25/7em2/Xon3RzNSrkRKyjDYdLnSIoKp+I6706DWQGZ9DdBYPkjRoJu+dX5XuVcN+h+iruvdrx+2Gaj5jP3oXlhKSxUmTt0dh8X1KeSlaKUMc27/daBaRhnV/pEsFjQ8APrcsbe3CioMsryUXxyBtesGO27IHHQqm7qgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LwQUxlN3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LwQUxlN3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8ACDAC4CEDD;
	Tue, 15 Apr 2025 09:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744710494;
	bh=yUDOtL59iR5TIGbk9FlCT53L9VrFtzpvAbsj9EwZ4Nc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LwQUxlN3IhuTC9DttPgBP/p4Zzm3jgByNlywNderSDuuqMNJr33MxEb2UQY29oPkk
	 eRi8bIbxCgfiMYkxA4MmIlLJ+Eo9uy7DcEzDIikFkBBzoSeeyoeYD/n5fRTS78OdIq
	 82d0a+Ex6UAD0Qw0+/9JTkmf9JceR7zgANkLKJr/3d9l0KinXJtjKKa29kguXhTJWG
	 MqSgBG2KVEVe8liD41gRzvW3MppGwnLoL0Mvtq2TSWORM65KjL82CVfvVwOlDPb8ae
	 geA8XoUKUEGecyKuLbAXw/Q/Qycprv5xHLTR2vWj9DjhiL3peCx8FWx1xc3qVf7IkM
	 CMcx/0cJG90Ow==
Date: Tue, 15 Apr 2025 11:48:07 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Remo Senekowitsch <remo@buenzli.dev>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 2/5] rust: Add bindings for reading device properties
Message-ID: <Z_4rVyUjK1dlnTsT@pollux>
References: <20250326171411.590681-1-remo@buenzli.dev>
 <20250414152630.1691179-1-remo@buenzli.dev>
 <20250414152630.1691179-3-remo@buenzli.dev>
 <Z_1Jfs5DXD2vuzLj@cassiopeiae>
 <D96RNFS3N8L2.33MSG7T019UQM@buenzli.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D96RNFS3N8L2.33MSG7T019UQM@buenzli.dev>

On Tue, Apr 15, 2025 at 01:55:42AM +0200, Remo Senekowitsch wrote:
> On Mon Apr 14, 2025 at 7:44 PM CEST, Danilo Krummrich wrote:
> > On Mon, Apr 14, 2025 at 05:26:27PM +0200, Remo Senekowitsch wrote:
> >> The device property API is a firmware agnostic API for reading
> >> properties from firmware (DT/ACPI) devices nodes and swnodes.
> >> 
> >> While the C API takes a pointer to a caller allocated variable/buffer,
> >> the rust API is designed to return a value and can be used in struct
> >> initialization. Rust generics are also utilized to support different
> >> types of properties where appropriate.
> >> 
> >> The PropertyGuard is a way to force users to specify whether a property
> >> is supposed to be required or not. This allows us to move error
> >> logging of missing required properties into core, preventing a lot of
> >> boilerplate in drivers.
> >
> > The patch adds a lot of thing, i.e.
> >   * implement PropertyInt
> >   * implement PropertyGuard
> >   * extend FwNode by a lot of functions
> >   * extend Device by some property functions
> >
> > I see that from v1 a lot of things have been squashed, likely because there are
> > a few circular dependencies. Is there really no reasonable way to break this
> > down a bit?
> 
> I was explicitly asked to do this in the previous thread[1].

I'm well aware that you were asked to do so and that one reason was that
subsequent patches started deleting code that was added in previous ones
(hence my suspicion of circular dependencies and that splitting up things might
not be super trivial).

> I'm happy
> to invest time into organizing files and commits exactly the way people
> want, but squashing and splitting the same commits back and forth
> between subsequent patch series is a waste of my time.

I don't think you were asked to go back and forth, but whether you see a
reasonable way to break things down a bit, where "reasonable" means without
deleting code that was just added.

> Do reviewers not typically read the review comments of others as well?

I think mostly they do, but maintainers and reviewers are rather busy people.
So, I don't think you can expect everyone to follow every thread, especially
when they get lengthy.

> What can I do to avoid this situation and make progress instead of
> running in circles?

I suggest to investigate whether it can be split it up in a reasonable way and
subsequently answer the question.

With your contribution you attempt to add a rather large portion of pretty core
code. This isn't an easy task and quite some discussion is totally expected;
please don't get frustrated, the series goes pretty well. :)

> 
> Link: https://lore.kernel.org/rust-for-linux/20250326171411.590681-1-remo@buenzli.dev/T/#m68b99b283a2e62726ee039bb2394d0741b31e330 [1]
> 
> >> +    /// helper used to display name or path of a fwnode
> >> +    ///
> >> +    /// # Safety
> >> +    ///
> >> +    /// Callers must provide a valid format string for a fwnode.
> >> +    unsafe fn fmt(&self, f: &mut core::fmt::Formatter<'_>, fmt_str: &CStr) -> core::fmt::Result {
> >> +        let mut buf = [0; 256];
> >> +        // SAFETY: `buf` is valid and `buf.len()` is its length. `self.as_raw()` is
> >> +        // valid because `self` is valid.
> >> +        let written = unsafe {
> >> +            bindings::scnprintf(buf.as_mut_ptr(), buf.len(), fmt_str.as_ptr(), self.as_raw())
> >> +        };
> >
> > Why do we need this? Can't we use write! right away?
> 
> I don't know how, can you be more specific? I'm not too familiar with
> how these formatting specifiers work under the hood, but on the face of
> it, Rust and C seem very different.

See below.

> 
> >> +        // SAFETY: `written` is smaller or equal to `buf.len()`.
> >> +        let b: &[u8] = unsafe { core::slice::from_raw_parts(buf.as_ptr(), written as usize) };
> >> +        write!(f, "{}", BStr::from_bytes(b))
> >> +    }
> >> +
> >> +    /// Returns an object that implements [`Display`](core::fmt::Display) for
> >> +    /// printing the name of a node.
> >> +    pub fn display_name(&self) -> impl core::fmt::Display + use<'_> {
> >> +        struct FwNodeDisplayName<'a>(&'a FwNode);
> >> +
> >> +        impl core::fmt::Display for FwNodeDisplayName<'_> {
> >> +            fn fmt(&self, f: &mut core::fmt::Formatter<'_>) -> core::fmt::Result {
> >> +                // SAFETY: "%pfwP" is a valid format string for fwnode
> >> +                unsafe { self.0.fmt(f, c_str!("%pfwP")) }

I think this could just use write!() and fwnode_get_name(), right?

> >> +            }
> >> +        }
> >> +
> >> +        FwNodeDisplayName(self)
> >> +    }
> >> +
> >> +    /// Returns an object that implements [`Display`](core::fmt::Display) for
> >> +    /// printing the full path of a node.
> >> +    pub fn display_path(&self) -> impl core::fmt::Display + use<'_> {
> >> +        struct FwNodeDisplayPath<'a>(&'a FwNode);
> >> +
> >> +        impl core::fmt::Display for FwNodeDisplayPath<'_> {
> >> +            fn fmt(&self, f: &mut core::fmt::Formatter<'_>) -> core::fmt::Result {
> >> +                // SAFETY: "%pfwf" is a valid format string for fwnode
> >> +                unsafe { self.0.fmt(f, c_str!("%pfwf")) }

This one is indeed a bit more tricky, because it comes from
fwnode_full_name_string() in lib/vsprintf.c.

Maybe it would be better to replicate the loop within fwnode_full_name_string()
and call write! from there.

> >> +            }
> >> +        }
> >> +
> >> +        FwNodeDisplayPath(self)
> >> +    }
> >>  }
> >>  
> >>  // SAFETY: Instances of `FwNode` are always reference-counted.
> >> @@ -73,3 +257,200 @@ unsafe fn dec_ref(obj: ptr::NonNull<Self>) {
> >>          unsafe { bindings::fwnode_handle_put(obj.cast().as_ptr()) }
> >>      }
> >>  }
> >> +
> >> +/// Implemented for several types that can be read as properties.
> >> +///
> >> +/// Informally, this is implemented for strings, integers and arrays of
> >> +/// integers. It's used to make [`FwNode::property_read`] generic over the
> >> +/// type of property being read. There are also two dedicated methods to read
> >> +/// other types, because they require more specialized function signatures:
> >> +/// - [`property_read_bool`](Device::property_read_bool)
> >> +/// - [`property_read_array_vec`](Device::property_read_array_vec)
> >> +pub trait Property: Sized {
> >> +    /// Used to make [`FwNode::property_read`] generic.
> >> +    fn read(fwnode: &FwNode, name: &CStr) -> Result<Self>;
> >> +}
> >> +
> >> +impl Property for CString {
> >> +    fn read(fwnode: &FwNode, name: &CStr) -> Result<Self> {
> >> +        let mut str: *mut u8 = ptr::null_mut();
> >> +        let pstr: *mut _ = &mut str;
> >> +
> >> +        // SAFETY: `name` is non-null and null-terminated. `fwnode.as_raw` is
> >> +        // valid because `fwnode` is valid.
> >> +        let ret = unsafe {
> >> +            bindings::fwnode_property_read_string(fwnode.as_raw(), name.as_char_ptr(), pstr.cast())
> >> +        };
> >> +        to_result(ret)?;
> >> +
> >> +        // SAFETY: `pstr` contains a non-null ptr on success
> >> +        let str = unsafe { CStr::from_char_ptr(*pstr) };
> >> +        Ok(str.try_into()?)
> >> +    }
> >> +}
> >
> > I think it would be pretty weird to have a function CString::read() that takes a
> > FwNode argument, no? Same for all the other types below.
> >
> > I assume you do this for
> >
> > 	pub fn property_read<'fwnode, 'name, T: Property>(
> > 	   &'fwnode self,
> > 	   name: &'name CStr,
> > 	)
> >
> > but given that you have to do the separate impls anyways, is there so much value
> > having the generic variant? You could still generate all the
> > property_read_{int}() variants with a macro.
> >
> > If you really want a generic property_read(), I think you should create new
> > types instead and implement the Property trait for them instead.
> 
> Yeah, that would be workable. On the other hand, it's not unusual in
> Rust to implement traits on foreign types, right? If the problem is
> the non-descriptive name "read" then we can change it to something more
> verbose. Maybe `CStr::read_from_fwnode_property` or something. It's not
> meant to be used directly, a verbose name wouldn't cause any damage.

Yeah, if we keep this approach, I'd prefer a more descriptive name.

However, I'd like to hear some more opinions from other members of the Rust team
on this one.
