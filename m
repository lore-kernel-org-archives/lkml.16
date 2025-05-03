Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A35D1E47C5;
	Sat,  3 May 2025 12:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746276283; cv=none; b=uYn+iudrkTLjrtnMJGof3O11/GdEBftZ6dOpsDiNSn0VxViUO8XxhSbsyOspeTguxXYNpZtcMPFbLGTReqDICgkw4SOxYPFqsgPcJNBbfCJfQYR8HpIsOnHmutEM21kaBZAzyPKZTEfMDm3cCnvZKUjuHWEEaTnYdlqU+utpTzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746276283; c=relaxed/simple;
	bh=oHHg0TR7y9Q+KJp/WRgLIuLiDMxxpxgf0JijlvYGk1I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YLT3c5JLZl6t3m/X0/XQlXMLY/pjTtFhH932OANzVbH8GvntDkjZFUIY2gtLhtAlo+7z8NiSXRz+xMBu+EXVJWHu46Cw08irFiQSUx56+T0heb/SN2f1ESwFQkL8syuUv89luHsKpRNZDv4b2/jTpeCrZyq2glexIhUVeU/cFyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZEdZEyTy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZEdZEyTy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39324C4CEE3;
	Sat,  3 May 2025 12:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746276282;
	bh=oHHg0TR7y9Q+KJp/WRgLIuLiDMxxpxgf0JijlvYGk1I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZEdZEyTy5ceWNpw/cCiw63xzG4aNsHeQh1aqljYnRFgGmpKnouqokMcQdyt0LG/zr
	 stWgrSbsMVJuqdDWByhGaj7TZCrYMw7WBgtScpKUJWtFSr4yaegKiiZO3iKfyPe5Ux
	 qBsXyxDWiAKMi0FKSZb1fr84z5645uodbOXTAM83Tv+3uDBKZ3AJpjYKveS8oY0awI
	 6PjQxXIcpZUlcgxO0ZvmTPrGJLkM/5NsUrozC1YuqbpjfOhyLLNIGxD++qyg0F541P
	 oYOpM01S4gXA5w6UWiexcBzYnW6fB+wP/itPCiQYRQ58lRbYUwM3Bi9+7FDE+Hn6d9
	 LyAoe3sZbs2IA==
Date: Sat, 3 May 2025 14:44:33 +0200
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
Subject: Re: [PATCH v4 2/4] rust: debugfs: Bind file creation for long-lived
 Display
Message-ID: <aBYPsZe3i_JrBJgz@polis>
References: <20250502-debugfs-rust-v4-0-788a9c6c2e77@google.com>
 <20250502-debugfs-rust-v4-2-788a9c6c2e77@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250502-debugfs-rust-v4-2-788a9c6c2e77@google.com>

On Fri, May 02, 2025 at 07:49:31PM +0000, Matthew Maurer wrote:
> +/// Handle to a DebugFS file.
> +#[repr(transparent)]
> +pub struct File<'a>(Dir<'a, true>);

As mentioned in [1], please create a base type Entry. While it's an improvement
to not expose things like subdir() from File directly, it's still odd to base
File on a type that has invalid methods its purpose.

[1] https://lore.kernel.org/lkml/aBRrniLfCzWX7nbR@pollux/

> +impl<'a> File<'a> {
> +    /// Remove the file from DebugFS.
> +    ///
> +    /// # Examples
> +    /// ```
> +    /// # use kernel::c_str;
> +    /// # use kernel::debugfs::Dir;
> +    /// let dir = Dir::new(c_str!("foo"));
> +    /// let file = dir.display_file(c_str!("bar"), &0);
> +    /// // "foo/bar" is created.
> +    /// file.remove()
> +    /// // "foo/bar" is removed"
> +    pub fn remove(self) {
> +        drop(self.0.owning())
> +    }

Same as with Dir, please make it the other way around.
