Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29B702AEE9;
	Thu,  1 May 2025 07:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746085214; cv=none; b=FLFg46pnjs1MOVsykA7YB40+UOgQI4X5yyphwNobUAc1pQWBOgOkCH9vgY6TVzmz/+cOSmLCKJq1EfapqynOLa7O4smzCDbdo7rEukznvrZmONwa6g89GfM5Nyn2JeGI+MI5q56BZSPBV/rd+KNmWypreS3PlHZBrJdfhGRdIkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746085214; c=relaxed/simple;
	bh=7i2UqjXjQwKO6jyCSU9SqsM1SVDehiVP499uIvMChZo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=axDDxsvjStj8swKheWnMyE4AHza9JqoPHm3ug2bV9vTxdnxCoLa7+wGkYwx4PlYH3W7+xjniuwFJ9k0TV5Sgu8HM4WkhFH+80GFrGR4QP/c5YzJqvxNCn4eIjqfqYOa2M9Y9AaqmnhRLrlx/ufyxjPXEFsTH423zKxnnEQSam+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Rg71Nflq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Rg71Nflq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0180C4CEE3;
	Thu,  1 May 2025 07:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1746085213;
	bh=7i2UqjXjQwKO6jyCSU9SqsM1SVDehiVP499uIvMChZo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Rg71NflqkGhgVVWBuZ4oSukhp/lsIaGT74TOvJ3LRmGh8Z2W7+nLdevQkeO8A7JjP
	 2mBulzE9Rp6vUvyXQ/Q7Ur0TaycbYAuMmGJ/sTnOyK4yokz+tkMHUTLMn756YFXm4x
	 HJlG1kiR8c7dCN6MQgClXzEPMd2Kt8I3cqKQmVFI=
Date: Thu, 1 May 2025 09:40:10 +0200
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
	Timur Tabi <ttabi@nvidia.com>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 4/4] rust: samples: Add debugfs sample
Message-ID: <2025050137-ongoing-such-46f6@gregkh>
References: <20250430-debugfs-rust-v2-0-2e8d3985812b@google.com>
 <20250430-debugfs-rust-v2-4-2e8d3985812b@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430-debugfs-rust-v2-4-2e8d3985812b@google.com>

On Wed, Apr 30, 2025 at 11:31:59PM +0000, Matthew Maurer wrote:
> Provides an example of using the Rust DebugFS bindings.
> 
> Signed-off-by: Matthew Maurer <mmaurer@google.com>

Much nicer, many thanks for this!

Some minor comments on the sample code here.  As someone coming from C
with limited Rust experience, I think I do understand it, but I think it
could use a bunch of comments to make it more "obvious" what is
happening, see below.

> +static EXAMPLE: AtomicU32 = AtomicU32::new(8);

Wait, why is this set to 8 and then you automatically set it to 10 after
you create the file?  No one is ever going to see 8 as a valid value
unless they really race to read the file, right?

> +impl kernel::Module for RustDebugFs {
> +    fn init(_this: &'static ThisModule) -> Result<Self> {
> +        let debugfs = Dir::new(c_str!("sample_debugfs"));
> +        debugfs
> +            .fmt_file(c_str!("example"), &EXAMPLE, &|example, f| {
> +                writeln!(f, "Reading atomic: {}", example.load(Ordering::Relaxed))
> +            })
> +            .keep();
> +        EXAMPLE.store(10, Ordering::Relaxed);
> +        Ok(Self { _debugfs: debugfs })
> +    }
> +}


How about this rewrite with comments added to help make things more
obvious:

impl kernel::Module for RustDebugFs {
    fn init(_this: &'static ThisModule) -> Result<Self> {

        // Create a debugfs directory in the root of the filesystem
        // called "sample_debugfs"
        let debugfs = Dir::new(c_str!("sample_debugfs"));

        // Create a single file in the directory called "example" that
        // allows to read from the EXAMPLE atomic variable, and make
        // sure it lives past the scope of this function by calling
        // .keep() on it.
        debugfs
            .fmt_file(c_str!("example"), &EXAMPLE, &|example, f| {
                writeln!(f, "Reading atomic: {}", example.load(Ordering::Relaxed))
            })
            .keep();

        // Change the value of EXAMPLE to be 10 so that will be the
        // value read from the file.  Note, the original value 8 will be
        // read if the file is read right before this is called.
        EXAMPLE.store(10, Ordering::Relaxed);

        // Create our module object and save off the pointer to the
        // debugfs directory we created.  It will be automatically
        // removed when the module is unloaded by virtue of the
        // reference count to the structure being dropped at that point
        // in time.
        Ok(Self { _debugfs: debugfs })
    }
}

thanks,

greg k-h
