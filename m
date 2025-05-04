Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 209F5BE46;
	Sun,  4 May 2025 16:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746377919; cv=none; b=XubqOy3oC7a8PdpIyXgd77tU9uMA8Q/POa0t4wfN1Pe2Z5OBy2RHDOG+3ZWb1oLyr3uRwttsN0Ib8sIKOp/ZIEiE1ZuogWETBLWRcly3l8x67YycXarOqxT2T0Tn1pgjUEC4NsjFTIDA4ZBJjTcf/3W8Fg6x/QI9Tss32Oz8OT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746377919; c=relaxed/simple;
	bh=vvNLzZ8yrMFFKBVtFc8aEZBAtdKrrbXkNbseLUbekjs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GDTCx2pkv8eQoG0YrQJzJDsHzBqzKEYBo4tOG5qZTo69FYZTRcmzTfYjSBpenz+hs4qG8TtsTB+M2Dc1FeiebYu3IhJo77KBu5ML+KeUdeFIEknTcOK8ICLpBvyyfFJhYqsJ9dGkgZS3Kjo5T/Qs0X1f1Fs5PoNvt1p1VGjOVmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FNhWkwBs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FNhWkwBs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B236C4CEE7;
	Sun,  4 May 2025 16:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746377918;
	bh=vvNLzZ8yrMFFKBVtFc8aEZBAtdKrrbXkNbseLUbekjs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FNhWkwBsofkB0wSIvsTesLDhVCw0gRcjjTlIGz6VxEOoICDtoGKidUzxwZ1E+husy
	 pXE/L5X+uMZajooHBTyOW5FdeER32F2X1FtGKPKJyC5FCcITh2yB0ppuWsQGmats9I
	 NDJ96BIICAZ3RXusSSha0EsBjuuLPKTcJOfS0L2HRZHdwbV3/BtUlgWJ8ZGJFPSAah
	 pUUVh0WVLBQBpqmq3hacrms6hMs1u/TZXekAePxGEkD5AFry1feqB4adx1B/2iB2lx
	 CS5oWoX/bOLUjpwYZa1eHkS3BLGdvsZAljJS5CQZnrgMHYn6sktZQe1SeQcpvw2GDT
	 wOMT3VRAq/X9A==
Date: Sun, 4 May 2025 18:58:31 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Matthew Maurer <mmaurer@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Sami Tolvanen <samitolvanen@google.com>,
	Timur Tabi <ttabi@nvidia.com>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH WIP 1/2] rust: debugfs: Add interface to build debugfs
 off pinned objects
Message-ID: <aBectw_2jridu43O@polis>
References: <20250503-debugfs-rust-attach-v1-0-dc37081fbfbc@google.com>
 <20250503-debugfs-rust-attach-v1-1-dc37081fbfbc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250503-debugfs-rust-attach-v1-1-dc37081fbfbc@google.com>

On Sat, May 03, 2025 at 12:43:59AM +0000, Matthew Maurer wrote:
> +/// A DebugFS directory combined with a backing store for data to implement it.
> +#[pin_data]
> +pub struct Values<T> {
> +    dir: Dir<'static, false>,
> +    // The order here is load-bearing - `dir` must be dropped before `backing`, as files under
> +    // `dir` may point into `backing`.
> +    #[pin]
> +    backing: T,
> +    // Since the files present under our directory may point into `backing`, we are `!Unpin`.
> +    #[pin]
> +    _pin: PhantomPinned,
> +}

This only ever allows attaching data to the root directory, correct? What if I
want to remove (or replace) a file or a subdir? Then I'd be left with the data
for this specific file (or subdir) until the root is finally removed.

It would also require Option<V> (where V is the type of a field in T), if I
don't have an instance of V yet, when the root directory is created.

I think we should store the data per file, rather than per root directory.
