Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A059227FB3F;
	Tue,  1 Jul 2025 19:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751398814; cv=none; b=mCU3w2qp0+xh3ZSqr1f8qFgFGF6KNf489H1DWQzD5ahihfvYkym8VlURI4jFPxI88IeLZJTSkg7OSR6KFWA+ZT4Hnsb/IOhrnThyeqO8n4tTMb8lyUAzDe1bewBgUrzIsl25MSmqwXQ2aRb0FdGot9YLSr85G1HhM/pqDxid/PA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751398814; c=relaxed/simple;
	bh=qDqy+qgeIUi2C2gVwLTG95hTERQBglNcydwyUBdTspA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GmnkV9WiK6LkKqZZwnbBelNLsZrU14rY646VU46CIwdoBFUP3UWMeqpB8myoAeduiHLpPYCx4jMmh5kfEHCsQ9BpOZnhjXEO4GM0OFXdF5GX/BsKegNd3SL4vQHdBntdLVMrHUQw9v2/Dp6EH5fgFsctyUZunS8h5PD1xxj65C0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nuNqCalA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nuNqCalA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C756BC4CEEB;
	Tue,  1 Jul 2025 19:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751398814;
	bh=qDqy+qgeIUi2C2gVwLTG95hTERQBglNcydwyUBdTspA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nuNqCalAFLsuuyOkIeWDlE1BpYjyFWspjlAep2zXjoVl9xs749qRMN9IiDEJPO7FB
	 00kAYfnIEZyVEK53qWKZytvJKIS0WeQlkvPvCLH/SUniqtDRPClIJTDjsNDp/lwb37
	 dyikyS5J0ifpP/vMxi91qbX4pbbsy/F0zxiT7Y3efzls6igZHrXILCaRHtallyTWG/
	 TYdE/pBj8hzjwC7jg+MPtv7wqsoeeOT7xR1d8UN6ajA1gbq2aANkLMpviwljS8IfZ8
	 wANS+iLZdRxPCY3o6LC0ECMlbymUPV0PeGQ02GlrtbytBllWBP7pkIobtLJN7mYqWl
	 wTC8TUfKYDqJw==
Date: Tue, 1 Jul 2025 21:40:08 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Matthew Maurer <mmaurer@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Timur Tabi <ttabi@nvidia.com>, Benno Lossin <lossin@kernel.org>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	Dirk Behme <dirk.behme@de.bosch.com>
Subject: Re: [PATCH v8 6/6] rust: samples: Add debugfs sample
Message-ID: <aGQ5mO6WjQb9Wq8f@pollux>
References: <20250627-debugfs-rust-v8-0-c6526e413d40@google.com>
 <20250627-debugfs-rust-v8-6-c6526e413d40@google.com>
 <2025070148-primer-stillness-0409@gregkh>
 <CAGSQo00UiOUAgYODhXT9BWLW0bXoCxMzt9fV2F2aiTEOG1vwyA@mail.gmail.com>
 <aGQcODIzMiB46gKF@pollux>
 <CAGSQo02tdxoqTE1z5_M8g0PpXYEdWr4Yy31yaoPK8C_O2G_QoQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGSQo02tdxoqTE1z5_M8g0PpXYEdWr4Yy31yaoPK8C_O2G_QoQ@mail.gmail.com>

On Tue, Jul 01, 2025 at 11:32:42AM -0700, Matthew Maurer wrote:
> On Tue, Jul 1, 2025 at 10:34 AM Danilo Krummrich <dakr@kernel.org> wrote:
> >
> > On Tue, Jul 01, 2025 at 10:24:04AM -0700, Matthew Maurer wrote:
> > > On Tue, Jul 1, 2025 at 7:03 AM Greg Kroah-Hartman
> > > <gregkh@linuxfoundation.org> wrote:
> > > >
> > > > On Fri, Jun 27, 2025 at 11:18:29PM +0000, Matthew Maurer wrote:
> > > > > +        // An `Arc<Mutex<usize>>` doesn't implement display, so let's give explicit instructions on
> > > > > +        // how to print it
> > > > > +        let file_2 = sub.fmt_file(c_str!("arc_backed"), my_arc.clone(), &|val, f| {
> > > > > +            writeln!(f, "locked value: {:#010x}", *val.lock())
> > > > > +        });
> > > >
> > > > While cute, is this really going to be the way to describe all "custom"
> > > > debugfs function callbacks?  No other way to point to a function itself
> > > > instead?  Look at "fun" debugfs functions like qh_lines() in
> > > > drivers/usb/host/ehci-dbg.c that is dumping tons of data out.  Putting
> > > > that inline here is going to be a bit ackward :)
> > >
> > > Good news, function pointers are legal to pass in here as well
> > > already, I can add that usage to make it clear.
> > >
> > > >
> > > > So can you show an example of a "traditional" debugfs file output with
> > > > multiple lines that is dealing with a dynamically allocated device that
> > > > is associated with the module (not the static example you showed here),
> > > > as that's going to be the real way this is used, not with static
> > > > variables.
> > >
> > > Sure, do we want to:
> > > * Finish creating the driver struct early in `init`, then call dynamic
> > > `.create(&str)` or `.destroy(&str)` `.modify(&str)` type things on it
> > > in `init` to show how it would work
> > > * Actually wire up an input source to drive create/destroy/modify
> > > dynamically (e.g. I could implement a miscdevice) - if you want this
> > > one, do you have a preference on where I get my input signal from?
> >
> > I think the idea was to show how it works in a real driver context, e.g. a
> > platform driver, just like what samples/rust/rust_driver_platform.rs does. Not a
> > miscdevice registered from a module, which is a rather rare use-case.
> >
> > If you rebase on the latest driver-core-next, you can write a platform driver
> > with an ACPI ID table, which can easily probed by passing
> > `-acpitable file=ssdt.aml` to qemu, i.e. no need to mess with OF.
> 
> I'm confused as to how registering as a platform driver would result
> in an input source that would let me trigger the creation/destruction
> of DebugFS files. I need some kind of input stream to do that. Is
> there some input stream that's available to a platform driver that I'm
> missing, or are you suggesting that the input stream would effectively
> be the probe's `id_info` field? If I did that, wouldn't I still have a
> static arrangement of DebugFS files in my driver struct?

If it's about having some dynamic input stream, creating an example with a
platform driver clearly doesn't help by itself.

But that wasn't my understanding. My understanding was that the request is to
show it in a driver context, where you won't get away with statics. :)

But that's maybe because *I* would like to focus more on this case, because it's
the common one.

> I could have misunderstood, but I don't think that's what Greg is
> asking for - I think he wants to see how at a data structure level, I
> can handle creating and destroying DebugFS files that correspond to
> some kind of object being created and destroyed, rather than just
> having a static list of slots in my driver struct for keeping them
> alive.

If that's the request, you could simply create a function that returns a
Vec with some random entries and then you just iterate over it in
Driver::probe() or Module::init()?

I don't know if that case is too interesting, since conceptually it doesn't make
a huge difference to the case where you have a single instance, i.e.

Current
-------

	struct Bar {
	   a: A,
	   b: B,
	}

	// Single.
	struct Foo {
	   bar: Arc<Bar>,
	   bar_file: File,
	}

	// Multiple.
	struct Foo {
	  bars: Vec<Arc<Bar>>
	  bar_files: Vec<File>, // contains a File for each field for every Bar
	}

Proposed (pin-init)
-------------------

	struct Bar {
	   a: File<A>,
	   b: File<B>,
	}

	// Single.
	struct Foo {
	   bar: Bar,
	}

	// Multiple.
	struct Foo {
	   bar: Vec<Bar>
	}
