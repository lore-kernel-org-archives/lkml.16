Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCDC31EB1A7;
	Sat,  3 May 2025 12:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746275803; cv=none; b=ldkglY0SEg2zBXvJR05/Pi/GCTORa0EmuB1cxwDwL6ic2RKHDr7G5UNXukk6MMfjnZ4TG1kRKIa+wyhcVd9hPnyDrjCAlyAjvkP7xKjewbSF8hNJGSm1IVaNPFD4NeEO+ig2fuVX9k4nD+UHE4eqT4Nn175czjMlj8FDPoXuprs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746275803; c=relaxed/simple;
	bh=owBqTVcnDifgTSZfKatQXRw6YcVp6JZhiKahYi4emMU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i1eq6U8iNbXHTALbcuhwY4/ZywCn2wlUFQnQ7KiD4V+1tq40MpKSDirOtHi8VxV6zZ6col1XZd3r7jnm6Zu7uYGexGQTeKrbRUfzPDpngsVlm10ToQ2F8//kGx6ku/Vm+LHI+m10hsXGcKUnUAaaRoZy71SfG8OQHaKciBL7peM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JvP8PeLb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JvP8PeLb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1EE9C4CEE3;
	Sat,  3 May 2025 12:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746275803;
	bh=owBqTVcnDifgTSZfKatQXRw6YcVp6JZhiKahYi4emMU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JvP8PeLbawDcuEfi2fduAX2jkvrgcHcDDDrthkR+64W6tqcnXP3tnMwbVN70nAkGL
	 WQzJncAf31XKC4mxI64abi6ipy/ajNZf/ZjQmGsYJd04j2gTZpeEa6NfQT/zmR4s/f
	 DNNEdUnwDXRnSwnfh1mvHHoHi05SXynkXB//zVgscL18gU+wtNi+qnwlin2YAO5IfG
	 hb6Fs24vYeHecgyFCU1uogcMrTO71g8YeEGhPsOdz3MVksowDvqFfPTlAlEhGbIarO
	 p1p0wMOwF9ZWwE7ZEO7RcrpoIDgBoPl32IaoX1XVfQe5QlM4jjzLpzP+Z2MmgWuQ2N
	 aejAeWMpG0FiQ==
Date: Sat, 3 May 2025 14:36:26 +0200
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
Subject: Re: [PATCH v4 1/4] rust: debugfs: Bind DebugFS directory creation
Message-ID: <aBYNyqTRlpGAJVuB@polis>
References: <20250502-debugfs-rust-v4-0-788a9c6c2e77@google.com>
 <20250502-debugfs-rust-v4-1-788a9c6c2e77@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250502-debugfs-rust-v4-1-788a9c6c2e77@google.com>

On Fri, May 02, 2025 at 07:49:30PM +0000, Matthew Maurer wrote:
> +/// Owning handle to a DebugFS directory.
> +///
> +/// This directory will be cleaned up when it goes out of scope.
> +///
> +/// # Invariants
> +///
> +/// The wrapped pointer will always be `NULL`, an error, or an owned DebugFS `dentry`.
> +#[repr(transparent)]
> +pub struct Dir<'a, const KEEP: bool = false> {

Why did you move to a const generic, rather than a new type? What's the
advantage? AFAICS, it just makes it less obvious to see from the type itself how
it will behave. Reading Dir<true> doesn't make it obvious what it does.

While I prefer a new type over the const generic, I'm fine with it. But I think
we should use something more descriptive than a bool. Please see
device::DeviceContext for reference.

> +    /// Create a DebugFS subdirectory.
> +    ///
> +    /// This returns a [`Dir<'_, true>`], which will not be automatically cleaned up when it
> +    /// leaves scope.
> +    /// To convert this to a handle governing the lifetime of the directory, use [`Dir::owning`].
> +    ///
> +    /// Regardless of conversion, subdirectory handles cannot outlive the directory handle they
> +    /// were created from.
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// # use kernel::c_str;
> +    /// # use kernel::debugfs::Dir;
> +    /// let parent = Dir::new(c_str!("parent"));
> +    /// let child = parent.subdir(c_str!("child"));
> +    /// ```
> +    pub fn subdir<'b>(&'b self, name: &CStr) -> Dir<'b, true> {
> +        Dir::create(name, Some(self))
> +    }

The default should be that the directory is removed when the Dir instance is
dropped.

The common case (which people expect) is that an object is cleaned up on drop().

> +impl<'a> Dir<'a, true> {
> +    /// Upgrade a non-owning directory to one which will be removed on drop.
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// # use kernel::c_str;
> +    /// # use kernel::debugfs::Dir;
> +    /// let debugfs = Dir::new(c_str!("parent"));
> +    /// let subdir = debugfs.subdir(c_str!("child"));
> +    /// // If subdir were dropped, the directory would not be removed.
> +    /// let owned_subdir = subdir.owning();
> +    /// // If owned_subdir is dropped, "child" will be removed.
> +    /// ```
> +    pub fn owning(self) -> Dir<'a, false> {
> +        Dir {
> +            dir: self.dir,
> +            _phantom: self._phantom,
> +        }
> +    }

As mentioned above, please make it the other way around.
