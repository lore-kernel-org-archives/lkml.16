Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BAF025B68F;
	Wed, 30 Apr 2025 12:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746014779; cv=none; b=Cc1fsxH/tFYCfa5VWt2mvRpZbmXNhXHqmzaIN2Zg4RcyMrmmh1joXShpVZ2dZvu7nfinQ89TPBDj7KSkDRE6LTgugjEix7bRqR6RVeG15QbkidS+1W3op69SqmOJloJm8+X2kC9k3wfJ1aBwZXLhG/kJCPVzlOQQLvArVvxqlCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746014779; c=relaxed/simple;
	bh=ltaDlLvaYT0GRQbAcHRoFMpI3CiMobtSujVpoPzOcGg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FO3k2eOOgCoqVnZMlmSbbItAxO8kUH6Wfc02s446Cs3TdimRS06nLKmMJHBQTr3lEztWMShEXveOItcKwtRDV3UtY8TbpvFI6xFoVJmFjUYTv7rtTmCjOFNfHyDfIekLQ9smqRnZBS5BjPfH8NM7jlsy9zuCn9nmiV3NKkqAnPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=T4FNZilJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="T4FNZilJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FCB9C4CEE9;
	Wed, 30 Apr 2025 12:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1746014779;
	bh=ltaDlLvaYT0GRQbAcHRoFMpI3CiMobtSujVpoPzOcGg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T4FNZilJFM0sycy/xaza2S7S/X8gFrVx8ktle1ZMCJhZrg9KmhibZ+17tJkI+7wuS
	 9yRR8FCHsVXD0zD4sxABfy2dnih6aDyKl+cPJrGi7feWWl3RbUvQ/jRJi+6E3xzil9
	 Oos6bkAwMnFLYBGG5fZ4yjd8WkftF9GghfIsjWFg=
Date: Wed, 30 Apr 2025 09:58:26 +0200
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
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 4/8] rust: debugfs: Allow subdir creation in builder
 interface
Message-ID: <2025043022-depletion-sneezing-a89c@gregkh>
References: <20250429-debugfs-rust-v1-0-6b6e7cb7929f@google.com>
 <20250429-debugfs-rust-v1-4-6b6e7cb7929f@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250429-debugfs-rust-v1-4-6b6e7cb7929f@google.com>

On Tue, Apr 29, 2025 at 11:15:58PM +0000, Matthew Maurer wrote:
> Allows creating subdirectories in the builder intended to be cleaned up
> by `debugfs_remove` at the same time as the root.
> 
> Signed-off-by: Matthew Maurer <mmaurer@google.com>
> ---
>  rust/kernel/debugfs.rs | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/rust/kernel/debugfs.rs b/rust/kernel/debugfs.rs
> index f6240fd056f8598d5ef06bdaf61c5c33eab5b734..6c7cf7e97741b98d2c0654d01fca3de0d8047e97 100644
> --- a/rust/kernel/debugfs.rs
> +++ b/rust/kernel/debugfs.rs
> @@ -347,6 +347,32 @@ pub fn display_file<T: Display + Sized>(&self, name: &CStr, data: &'a T) -> Resu
>          core::mem::forget(unsafe { self.inner.display_file_raw(name, data)? });
>          Ok(())
>      }
> +
> +    /// Creates a nested directory that may live as long as its parent

Ick, why make it complex?

> +    ///
> +    /// # Example
> +    ///
> +    /// ```
> +    /// # use kernel::c_str;
> +    /// # use kernel::debugfs::{Dir, Values};
> +    /// let dir = Dir::new(c_str!("foo"), None)?;

Again, no checking please :)

> +    /// let foo = KBox::pin_init(Values::attach(0, dir), GFP_KERNEL)?;
> +    /// foo.as_ref().build(|_value, builder| {
> +    ///   builder.dir(c_str!("bar"))?;
> +    ///   Ok::<(), Error>(())
> +    /// })?;
> +    /// // foo/bar will still exist at this point in DebugFS
> +    /// # Ok::<(), Error>(())

Again, no errors :)

thanks,

greg k-h
