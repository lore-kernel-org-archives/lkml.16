Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F036EC4;
	Fri,  2 May 2025 07:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746169268; cv=none; b=Sx5XLYEXom7SGf39m/rOVoOqugc1MRR5i1qlBwjkADMOl9P1OknGa3s2vwp6UhIGsgK3vOydcvMh+EZRBRUAZmIUZcWt77SP3i4Ob/8KTuV7sN1zIqyRh35ANy/O3jvm19fco3XVbFHkXQNooXWPZkH0Y/W6xtgs12vuOnBi1p4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746169268; c=relaxed/simple;
	bh=IcRiTAcRFn4Z4s8s5pcO3DJLGHeQZh3uWEsA71CyQoo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kL6GtDGTDk6/RrUWDQXB55o8V/+elZm5/FtazIpXlMLp7SF+GDCC/xlDM7AIxtYz0i4bEMMWjgDtYzX8wczFDp8qSMamVyW6/ar3d+2MTQ28tVCxM2B+TdPgywwInrEOZ/0ucURY4Aq6uyyKHcEO2BxeBp5kYkz+xWs4104sPXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JHqlP51y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JHqlP51y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73E54C4CEEE;
	Fri,  2 May 2025 07:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746169267;
	bh=IcRiTAcRFn4Z4s8s5pcO3DJLGHeQZh3uWEsA71CyQoo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JHqlP51yoEph8k9zujm2yT/YRtDspS9K5r9jvfpH/XeaLad3/yhgrOp0AhqtfkoPA
	 9fYOLMB2RpMf9k41kH2kSmcBhFRM5DTAVotGJGtJ1qVhbhzMhV+NUWPxpMRCvPd1+y
	 7mAYLDXzxzV6FNWF1rrC5m9bofkn8L2WqeXTe5pZEhaFOTgrIYd+XRNVelnustSNHa
	 Dvnvxl5RJaDu4fwdc2hlTcORafFc8bvINHUFVJrZF0T9b606gTzxoe/MxRd3QNviEF
	 p6qdXHntaRdxZxGrWKTW4Cd6IFkYRD/YgGYW2lwC3Al1I+0KBoTmLXw5RpnNs3h/Iw
	 82n32m+btGWoA==
Date: Fri, 2 May 2025 09:01:01 +0200
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
Subject: Re: [PATCH v3 4/4] rust: samples: Add debugfs sample
Message-ID: <aBRtrfTaaC3Vk9fL@pollux>
References: <20250501-debugfs-rust-v3-0-850869fab672@google.com>
 <20250501-debugfs-rust-v3-4-850869fab672@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250501-debugfs-rust-v3-4-850869fab672@google.com>

On Thu, May 01, 2025 at 10:47:44PM +0000, Matthew Maurer wrote:
> +struct RustDebugFs {
> +    // As we only hold this for drop effect (to remove the directory) we have a leading underscore
> +    // to indicate to the compiler that we don't expect to use this field directly.

This feels like an introduction to Rust in the kernel for Rust beginners, which
is a great thing!

However, I wonder if, instead, we may want a dedicated (or even multiple) sample
modules or sample drivers, where we go into such detail and leave those samples
to focus only on the corresponding API?

> +    _debugfs: Dir,
> +}
> +
> +static EXAMPLE: AtomicU32 = AtomicU32::new(8);
> +
> +impl kernel::Module for RustDebugFs {
> +    fn init(_this: &'static ThisModule) -> Result<Self> {
> +        // Create a debugfs directory in the root of the filesystem called "sample_debugfs".
> +        let debugfs = Dir::new(c_str!("sample_debugfs"));
> +
> +        // Create a subdirectory, so "sample_debugfs/subdir" now exists.
> +        let sub = debugfs.subdir(c_str!("subdir"));
> +
> +        // Create a single file in the subdirectory called "example" that will read from the
> +        // `EXAMPLE` atomic variable.
> +        sub.fmt_file(c_str!("example"), &EXAMPLE, &|example, f| {
> +            writeln!(f, "Reading atomic: {}", example.load(Ordering::Relaxed))
> +        });
> +        // Now, "sample_debugfs/subdir/example" will print "Reading atomic: 8\n" when read.
> +
> +        // Change the value in the variable displayed by the file. This is intended to demonstrate
> +        // that the module can continue to change the value used by the file.
> +        EXAMPLE.store(10, Ordering::Relaxed);
> +        // Now, "sample_debugfs/subdir/example" will print "Reading atomic: 10\n" when read.
> +
> +        // Save the root debugfs directory we created to our module object. It will be
> +        // automatically cleaned up when our module is unloaded because dropping the module object
> +        // will drop the `Dir` handle. The base directory, the subdirectory, and the file will all
> +        // continue to exist until the module is unloaded.

Same with this comment.

@Greg: I know you proposed this one; for educational purposes I suppose. What's
your take on the above?
