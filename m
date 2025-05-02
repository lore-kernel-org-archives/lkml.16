Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C7419E83E;
	Fri,  2 May 2025 07:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746170012; cv=none; b=BqWdNKGFnrd5b5yFp6yAMzbPywagRmnQOsJ8CIslnO3ne8rif1syRtD5Bpt1XV0/YSWe1rNFTwBB/hh9Sq5dwbWaqGdHOXNG1zhoLFy1iIYbgtnJ2Zmx0yn656p4obZM+g/U8E/70NQJQRXopg727Kan24Pc1Mj+T4PzJTvnJ4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746170012; c=relaxed/simple;
	bh=L66J/eQYes/GoM+dSimhqwXOafQgvfhtmOkECvbQyYk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JUl7oBY9M6wXpIxJOjegA9IMpVPRbYDh/myGT/VnrZLISbNRNDfYUXIXVeW7XMNSOIFGNO6/DZyS9b9irrGnmE70J7b/189Fy39XUnXOpzr1kj2XxUS+H/SZ6+ne6Gz7E/qhbSTEQvBRQiNrBKzc+igdUg6utps4dBotsYIjb+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=olWs2xSb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="olWs2xSb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 358F9C4CEE4;
	Fri,  2 May 2025 07:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1746170010;
	bh=L66J/eQYes/GoM+dSimhqwXOafQgvfhtmOkECvbQyYk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=olWs2xSb9VKrNz3V3Tz8OaqO0bZEmj/zi6rjuraKEBP+kHtGZIoAbqY8QwnJOyEe6
	 c3ynuHQGlwxyAPsd5NcEz9Z/b+HQxyC/hqsdll3Tp5FbRE5P/Vh3Z7D//xjDghcp4S
	 LZBoHFVmI+iMk+q1cyGqyyxZAq/WE5Viy0fkJpGk=
Date: Fri, 2 May 2025 09:13:28 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Matthew Maurer <mmaurer@google.com>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Timur Tabi <ttabi@nvidia.com>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v3 4/4] rust: samples: Add debugfs sample
Message-ID: <2025050253-wriggly-pod-e420@gregkh>
References: <20250501-debugfs-rust-v3-0-850869fab672@google.com>
 <20250501-debugfs-rust-v3-4-850869fab672@google.com>
 <aBRtrfTaaC3Vk9fL@pollux>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBRtrfTaaC3Vk9fL@pollux>

On Fri, May 02, 2025 at 09:01:01AM +0200, Danilo Krummrich wrote:
> On Thu, May 01, 2025 at 10:47:44PM +0000, Matthew Maurer wrote:
> > +struct RustDebugFs {
> > +    // As we only hold this for drop effect (to remove the directory) we have a leading underscore
> > +    // to indicate to the compiler that we don't expect to use this field directly.
> 
> This feels like an introduction to Rust in the kernel for Rust beginners, which
> is a great thing!
> 
> However, I wonder if, instead, we may want a dedicated (or even multiple) sample
> modules or sample drivers, where we go into such detail and leave those samples
> to focus only on the corresponding API?

People search for the specific example of what they want to do, so I
recommend just leaving all of these comments in for now as knowing to
search for a different example is usually not going to happen :)


> 
> > +    _debugfs: Dir,
> > +}
> > +
> > +static EXAMPLE: AtomicU32 = AtomicU32::new(8);
> > +
> > +impl kernel::Module for RustDebugFs {
> > +    fn init(_this: &'static ThisModule) -> Result<Self> {
> > +        // Create a debugfs directory in the root of the filesystem called "sample_debugfs".
> > +        let debugfs = Dir::new(c_str!("sample_debugfs"));
> > +
> > +        // Create a subdirectory, so "sample_debugfs/subdir" now exists.
> > +        let sub = debugfs.subdir(c_str!("subdir"));
> > +
> > +        // Create a single file in the subdirectory called "example" that will read from the
> > +        // `EXAMPLE` atomic variable.
> > +        sub.fmt_file(c_str!("example"), &EXAMPLE, &|example, f| {
> > +            writeln!(f, "Reading atomic: {}", example.load(Ordering::Relaxed))
> > +        });
> > +        // Now, "sample_debugfs/subdir/example" will print "Reading atomic: 8\n" when read.
> > +
> > +        // Change the value in the variable displayed by the file. This is intended to demonstrate
> > +        // that the module can continue to change the value used by the file.
> > +        EXAMPLE.store(10, Ordering::Relaxed);
> > +        // Now, "sample_debugfs/subdir/example" will print "Reading atomic: 10\n" when read.
> > +
> > +        // Save the root debugfs directory we created to our module object. It will be
> > +        // automatically cleaned up when our module is unloaded because dropping the module object
> > +        // will drop the `Dir` handle. The base directory, the subdirectory, and the file will all
> > +        // continue to exist until the module is unloaded.
> 
> Same with this comment.
> 
> @Greg: I know you proposed this one; for educational purposes I suppose. What's
> your take on the above?

I like it and want to see this here as it helps explain both how to use
this, AND how to have maintainers review code that uses the api that are
not that familiar with how Rust does things.

thanks,

greg k-h
