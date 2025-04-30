Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D1C25B1CD;
	Wed, 30 Apr 2025 12:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746014773; cv=none; b=UP8l/bECvd7chb8TEu1e5s+1GzqEBCR2P6aXOPqO3G6VJlCsSR8Q3pFb2P7jIfY+/2SZpXo+I+kgS0xHPYPGitaKbftiLYl9EAGdUKnuVywG0WmiH55gQmcJlpvjwPAZNICu+uRapb8/hn2Zu3U9DDc31rJlCRs7VIYrDQ1ltow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746014773; c=relaxed/simple;
	bh=q6PpuZdJWVVoQFyU9VS3Le2qZH7Adh2ADocJ02zd8KQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UYWRlU9bnEXCAm2lcxA9wQoGdEPgNAvLvn59r26BqlIxs5yMp5a/FJIdIcu2kMiCfAZcxm7RBhdsM/AzAbU5rp/aEncW0UQiTGnmqHEAHRcyhbJRtxrMZoUq2XY8xr6psM2rH/V1kA1a7Ua2cV8yOI6fy+oY+1pwkD+ABr+p/4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=kPLnN5rw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="kPLnN5rw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD1A2C4CEE9;
	Wed, 30 Apr 2025 12:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1746014772;
	bh=q6PpuZdJWVVoQFyU9VS3Le2qZH7Adh2ADocJ02zd8KQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kPLnN5rwLYH15t5uH2rFR5AL6pcWN7rGG4lA7fMGaBDMRZFi33kgXtnLonJfnwOpm
	 zjkxjt7BwD6aKZUoy9nt8oEu96n7jBjjQXOR66jivGJ0SFtMwdLPD20Qu4zO28P2kD
	 ZSEeojLP2fgD+jNR9uDmHqZXeSFG+Weq9k50JRes=
Date: Wed, 30 Apr 2025 09:55:24 +0200
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
Subject: Re: [PATCH 2/8] rust: debugfs: Bind file creation for long-lived
 Display
Message-ID: <2025043006-snowflake-headless-e417@gregkh>
References: <20250429-debugfs-rust-v1-0-6b6e7cb7929f@google.com>
 <20250429-debugfs-rust-v1-2-6b6e7cb7929f@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250429-debugfs-rust-v1-2-6b6e7cb7929f@google.com>

On Tue, Apr 29, 2025 at 11:15:56PM +0000, Matthew Maurer wrote:
> +    /// Create a file in a DebugFS directory with the provided name, and contents from invoking
> +    /// [`Display::fmt`] on the provided reference.
> +    ///
> +    /// # Example
> +    ///
> +    /// ```
> +    /// # use kernel::c_str;
> +    /// # use kernel::debugfs::Dir;
> +    /// let dir = Dir::new(c_str!("my_debugfs_dir"), None)?;

Again, can never fail, so don't check it.

> +    /// let file = dir.display_file(c_str!("foo"), &200)?;

Again, can never fail, so don't check it.

And "200" is wrong, did you test these?


> +    /// # Ok::<(), Error>(())
> +    /// ```
> +    pub fn display_file<T: Display + Sized>(
> +        &self,
> +        name: &CStr,
> +        data: &'static T,
> +    ) -> Result<ARef<Self>> {

Again, will always succeed, you don't want any checking of Result<>

thanks,

greg k-h
