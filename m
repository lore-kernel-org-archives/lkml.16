Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B3925A2BC;
	Tue,  1 Jul 2025 17:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751391295; cv=none; b=if/q4Xnrx5Q016cFgQ5LNFLSMzI2VD3wXnLEbFeIkAIVODi2DtFaxoneYNbHe/vRHmYG1Vetn1lIB6hULQfJdwEREW7iQnjwJnFDww0EOAUXMYzdKpPPZZVqNdYD5rFMJJ3vuoWiKK6c1gci7lTpHXaUUXbrq+5Fax3NdGkfSO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751391295; c=relaxed/simple;
	bh=Se7Gtkkk90SXCT9cJj7ZvM8q7WY/FjCqqXgfwGctlbM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L/+tJVDr9sz2AwPHcypTrMWvGFcqD4BRR961lVjMuXj/7l9ldowJjAl0kpTnvK9ICF3U4FdMGNLtkviZQhBrTIVRoaYTOz9my5fR8IT00pGQZZTV25/l1MPSuRtjJOZkdzOiIAoCpYQ7vJCUsP6uScQCe8mz0KpMYdYUO51q3yI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bmtdmBku; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bmtdmBku"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EF06C4CEEF;
	Tue,  1 Jul 2025 17:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751391294;
	bh=Se7Gtkkk90SXCT9cJj7ZvM8q7WY/FjCqqXgfwGctlbM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bmtdmBku9oDv7zQel+ctz6e9hWIDRMYUvkHTvqbeVTlWr57WF6spUw5ZW0Vai+lYw
	 5Pz5KVh21iv6gTVOyYxJWcTr98giKgJu4ofwk8PTtJVKPzbMXtE2vdUGp7znyNmZ+2
	 HXCJkVf5nVupjM2TkzBrQTjAvPieBYkKzzum7hLOKWBFrOnXAJa80JQzFOdiv4hePD
	 +d8nXKv7j/LOyeBhtQj4LsgrBAbqRO43pRo0niaTqux5Sl4jAIxGKlQZikHrGKmvfA
	 vsMOUwdMwsq9n2T+tzYbYPu01qF2NsBCl7OXoicxoZx/zvzGfNlwaXNiQLlbDfmQK2
	 psrAyISjWEdEg==
Date: Tue, 1 Jul 2025 19:34:48 +0200
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
Message-ID: <aGQcODIzMiB46gKF@pollux>
References: <20250627-debugfs-rust-v8-0-c6526e413d40@google.com>
 <20250627-debugfs-rust-v8-6-c6526e413d40@google.com>
 <2025070148-primer-stillness-0409@gregkh>
 <CAGSQo00UiOUAgYODhXT9BWLW0bXoCxMzt9fV2F2aiTEOG1vwyA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGSQo00UiOUAgYODhXT9BWLW0bXoCxMzt9fV2F2aiTEOG1vwyA@mail.gmail.com>

On Tue, Jul 01, 2025 at 10:24:04AM -0700, Matthew Maurer wrote:
> On Tue, Jul 1, 2025 at 7:03 AM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Fri, Jun 27, 2025 at 11:18:29PM +0000, Matthew Maurer wrote:
> > > +        // An `Arc<Mutex<usize>>` doesn't implement display, so let's give explicit instructions on
> > > +        // how to print it
> > > +        let file_2 = sub.fmt_file(c_str!("arc_backed"), my_arc.clone(), &|val, f| {
> > > +            writeln!(f, "locked value: {:#010x}", *val.lock())
> > > +        });
> >
> > While cute, is this really going to be the way to describe all "custom"
> > debugfs function callbacks?  No other way to point to a function itself
> > instead?  Look at "fun" debugfs functions like qh_lines() in
> > drivers/usb/host/ehci-dbg.c that is dumping tons of data out.  Putting
> > that inline here is going to be a bit ackward :)
> 
> Good news, function pointers are legal to pass in here as well
> already, I can add that usage to make it clear.
> 
> >
> > So can you show an example of a "traditional" debugfs file output with
> > multiple lines that is dealing with a dynamically allocated device that
> > is associated with the module (not the static example you showed here),
> > as that's going to be the real way this is used, not with static
> > variables.
> 
> Sure, do we want to:
> * Finish creating the driver struct early in `init`, then call dynamic
> `.create(&str)` or `.destroy(&str)` `.modify(&str)` type things on it
> in `init` to show how it would work
> * Actually wire up an input source to drive create/destroy/modify
> dynamically (e.g. I could implement a miscdevice) - if you want this
> one, do you have a preference on where I get my input signal from?

I think the idea was to show how it works in a real driver context, e.g. a
platform driver, just like what samples/rust/rust_driver_platform.rs does. Not a
miscdevice registered from a module, which is a rather rare use-case.

If you rebase on the latest driver-core-next, you can write a platform driver
with an ACPI ID table, which can easily probed by passing
`-acpitable file=ssdt.aml` to qemu, i.e. no need to mess with OF.
