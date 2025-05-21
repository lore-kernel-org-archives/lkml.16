Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B9919994F;
	Wed, 21 May 2025 14:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747836779; cv=none; b=cR9MUcxmXY7SgPhnXevFCxhYwGK+PCVJ4wICtXPGrCYV4kEhTw60GcKdiyFq1gcwS2WQWYFSjKWArTu3d+4GnXTcoVysTNcnqwxGRyynTDNUz1m+TjsqxwSVZyDqyBh0RqHSAiDcl6ODqQDFnh1g5rYureZ4ed8PrZ5EMvyMblk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747836779; c=relaxed/simple;
	bh=9koPT3VkQu5e46R8uquB22uxKLgPwZcQVQd4EqXZkeU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N65b2QVS7BDLGPlxUtA13sRaL9aR0LF2LYrH0zbQ5TL4N6GqtrnX5RIodR4D3kUUI7kTEpVSWPAP8C1ACQPLx00oOjxSOq0bXeFpA51tKXExbW4cgn4Trw7v4zIGgzjofzxaGvygsA22oRid6UIoBrSNKLEAWfqUokdFQcJ8Ivw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PNdjBJ7C; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PNdjBJ7C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C11FC4CEE4;
	Wed, 21 May 2025 14:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747836777;
	bh=9koPT3VkQu5e46R8uquB22uxKLgPwZcQVQd4EqXZkeU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PNdjBJ7CSO3ZqCZ/RnABu6MtND7cIX2CCbZbc/IhR5f+iSMQyGRlg5OCcEeimrO94
	 t1yMs9apazpeGnB/ZFy9oOh/EbWe+lFx5Vp09JvkzGBKQZqjfZb2JIqBkFFE3kTlxP
	 5RJBvrscnSmmKyT4g8NUzxRcIbSsmh4GTnWglhEknxL55oMBv7kh1RBxv92k31aWdr
	 mBQGUFhEmfZi/0ayRewsXoxeKI1dDN/HfYk+qf/53Bp3xgo93MZKbx4sCwurPt3t5B
	 0BJqP6HQIyGKpk7nYwS90z2kpUWlxaeKiXXzfwNE0HOMYNS7gC57t/UcZ7acItnk5O
	 DI6lcECyRW2Tw==
Date: Wed, 21 May 2025 16:12:51 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Christian Schrefl <chrisi.schrefl@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Arnd Bergmann <arnd@arndb.de>, Lee Jones <lee@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Gerald =?iso-8859-1?Q?Wisb=F6ck?= <gerald.wisboeck@feather.ink>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] rust: miscdevice: add additional data to
 MiscDeviceRegistration
Message-ID: <aC3fYyvPvTB1DkeR@cassiopeiae>
References: <20250517-b4-rust_miscdevice_registrationdata-v3-0-cdb33e228d37@gmail.com>
 <20250517-b4-rust_miscdevice_registrationdata-v3-1-cdb33e228d37@gmail.com>
 <aCiSRZjOETsD8MhX@pollux>
 <2025052107-awhile-drainer-38d0@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025052107-awhile-drainer-38d0@gregkh>

On Wed, May 21, 2025 at 01:55:36PM +0200, Greg Kroah-Hartman wrote:
> On Sat, May 17, 2025 at 03:42:29PM +0200, Danilo Krummrich wrote:
> > On Sat, May 17, 2025 at 01:33:49PM +0200, Christian Schrefl wrote:
> > > +pub struct MiscDeviceRegistration<T: MiscDevice> {
> > >      #[pin]
> > >      inner: Opaque<bindings::miscdevice>,
> > > +    #[pin]
> > > +    data: UnsafePinned<T::RegistrationData>,
> > >      _t: PhantomData<T>,
> > >  }
> > 
> > I recommend not to store data within a Registration type itself.
> > 
> > I know that this is designed with the focus on using misc device directly from
> > the module scope; and in this context it works great.
> > 
> > However, it becomes quite suboptimal when used from a driver scope. For
> > instance, if the misc device is registered within a platform driver's probe()
> > function.
> > 
> > I know this probably isn't supported yet. At least, I assume it isn't supported
> > "officially", given that the abstraction does not provide an option to set a
> > parent device. Yet I think we should consider it.
> 
> It's going to be a requirement to properly set the parent device, and
> as you point out, this really should be in some sort of scope, not just
> a module.
> 
> But, we have two types of users of a misc device, one like this is
> written, for a module-scope, and one for the "normal" device scope.  The
> device scope is going to be tricker as it can, and will, get
> disconnected from the device separately from the misc device lifespan,
> so when that logic is added, it's going to be tricky as you point out.
> 
> So I'll take this now, but in the future this is going to have to be
> cleaned up and modified.

I'm about to sketch up something based on this patch that works properly for
both cases, i.e. module-scope and driver-scope.

I think it would also be good for the misc device abstraction to demonstrate
how to properly make class device abstractions (such as misc device, DRM device,
input device etc.) go along with bus devices in the context of a driver.

misc device isn't *the* perfect example, given that it doesn't have the typical
create and register split and another complication is that we also have to deal
with the module-scope case, but it's still a very good candidate given that it
is very simple compared to other class devices.
