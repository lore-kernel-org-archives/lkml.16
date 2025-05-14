Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8357121D3F8;
	Wed, 14 May 2025 09:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747213627; cv=none; b=ifsbuZWHYkRukpy6M8Vsm6GLrmbUL03u5FOh2QVV50O/MWN+et49JdOey+jGZe0dd+0JukzGjG7WiNNXlzcb4DRXYUWVoVFzdzmLFBL7nuRHkwqE606I032QzjTbMD8Ko8I+huJJRyS8l1LgcU6AX779n7RkUSVm9DrXC7KqdRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747213627; c=relaxed/simple;
	bh=1Ay91pQIr/kxqIgBdE0CINhcNvTb+Iv5tv8OnEo7WeQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dbxmgj+vjo8Hidq/5EkLm4+/plYsgpf/81yZNfn5WDqhX8RTru0ga+Cg9RSQD8AZ0FApqn8wXcrZbi3T02w8UHfUWKbNJobEQOWS2ewIxr8BKmCyztrXbFgkncWiE7vRp+UwPBQjD5WJ1ElkXCBmlAfDp6cnWk9Nr/quVOwXt1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gWVNPvoO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gWVNPvoO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0EBAC4CEE9;
	Wed, 14 May 2025 09:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747213626;
	bh=1Ay91pQIr/kxqIgBdE0CINhcNvTb+Iv5tv8OnEo7WeQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gWVNPvoOdLLSVh1tHgeSbUxni0SH6RxnyqdF9sNjtQazkLdHxDe2TK4Y3rmLhEdmq
	 aCMwhcZIFEcBRc4MAOQRpUDpcC8heN2jlF8eFmzjifU21G1Dk5tBIUTUd6LUn6GEy6
	 AlPNf5envYISTq696ezMGl+ANrCWcDd04vyhJEc4iV8pAe3Z+hOLMsTFQLEaldnro8
	 7YR7yYmmwvRepRrMzpthA8HcHAvO2ZVA4ncal2Bog8p/JAT5Rs6woZLp2c1qHXJkDp
	 XBBT0Ec6uLQOZFILt0SRwbX0B2fKw07aApJ8aP4DjXvQ91ca+nTDeBQdcN4tGmfl9m
	 L0uqB+FFVt2pg==
Date: Wed, 14 May 2025 11:07:00 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Benno Lossin <lossin@kernel.org>
Cc: Matthew Maurer <mmaurer@google.com>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
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
Subject: Re: [PATCH v5 4/4] rust: samples: Add debugfs sample
Message-ID: <aCRdNJ2oq-REBotd@pollux>
References: <20250505-debugfs-rust-v5-0-3e93ce7bb76e@google.com>
 <20250505-debugfs-rust-v5-4-3e93ce7bb76e@google.com>
 <D9VPA1M45WBK.1TB4KOUXD24BD@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D9VPA1M45WBK.1TB4KOUXD24BD@kernel.org>

On Wed, May 14, 2025 at 09:20:49AM +0200, Benno Lossin wrote:
> On Tue May 6, 2025 at 1:51 AM CEST, Matthew Maurer wrote:
> > +impl kernel::Module for RustDebugFs {
> > +    fn init(_this: &'static ThisModule) -> Result<Self> {
> > +        // Create a debugfs directory in the root of the filesystem called "sample_debugfs".
> > +        let debugfs = Dir::new(c_str!("sample_debugfs"));
> > +
> > +        {
> > +            // Create a subdirectory, so "sample_debugfs/subdir" now exists.
> > +            // We wrap it in `ManuallyDrop` so that the subdirectory is not automatically discarded
> > +            // at the end of the scope - it will be cleaned up when `debugfs` is.
> > +            let sub = ManuallyDrop::new(debugfs.subdir(c_str!("subdir")));
> 
> I dislike the direct usage of `ManuallyDrop`. To me the usage of
> `ManuallyDrop` signifies that one has to opt out of `Drop` without the
> support of the wrapped type. But in this case, `Dir` is sometimes
> intended to not be dropped, so I'd rather have a `.keep()` function I
> saw mentioned somewhere.

I agree, if we really want to "officially" support to forget() (sub-)directories
and files in order to rely on the recursive cleanup of the "root" directory, it
should be covered explicitly by the API. I.e. (sub-)directories and files should
have some kind of keep() and / or forget() method, to make it clear that this is
supported and by design and won't lead to any leaks.

Consequently, this would mean that we'd need something like your proposed const
generic on the Dir type, such that keep() / forget() cannot be called on the
"root" directory.

However, I really think we should keep the code as it is in this version and
just don't provide an example that utilizes ManuallyDrop and forget().

I don't see how the idea of "manually dropping" (sub-)directories and files
provides any real value compared to just storing their instance in a driver
structure as long as they should stay alive, which is much more intuitive
anyways.

It either just adds complexity to the API (due to the need to distingish between
the "root" directory and sub-directories) or makes the API error prone by
providing a *valid looking* option to users to leak the "root" directory.

- Danilo
