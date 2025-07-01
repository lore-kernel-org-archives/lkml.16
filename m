Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB1D71A29A;
	Tue,  1 Jul 2025 11:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751370403; cv=none; b=huX+3wN06MlWd+wQFFFL8W+0pF2zYi9ad+WLXFdxZfbz77IgK0C3vs+72IRgejYPrqwPvUo/vA1IArZGYm1ZI8mzR8iZ3QGeVJiNMD7/w+KcdO3xLpAZdQeUmtydtHsRinSukD8LrjkYxzbLU78AYpbEHYCz9UfemJl+2eSRwAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751370403; c=relaxed/simple;
	bh=hGfvCNiyBoNk5cIB+YRb6kE7fQC4+kMk0ik/Fyyn88s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Swfm8vBH4lDUAtiBuHZ8pe66TTY/F5jA5qA1DH9Yb0BU5uhvFZXa8vm1+Jk9rVNP4W3XM1XL6JMCLCnJxN5zYfWqmzm5Sl62SRsc0dASvZhVOis4yWu7UdVecdFKoZVQtVVRWIgd+ng3o8Hzo1VewvqsSjPGEbMfOyVTCdFpq6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DgbNuLu8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DgbNuLu8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2DC0C4CEEB;
	Tue,  1 Jul 2025 11:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751370403;
	bh=hGfvCNiyBoNk5cIB+YRb6kE7fQC4+kMk0ik/Fyyn88s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DgbNuLu8vSnXQyWxUTBrDto8ui8m6DxdawwQZXh8pgOA8FFxSb4nWoyXc1RBGbKQU
	 kO0TGaCCfh7+odL8vOLVKKQIhCSIttVz/MTKcRB2gyQuTwdE1B1YSEOUdRvvP1GS6R
	 bGBLeEMI2l2DQOuKBBgI+9pJeBeZA4OJU8Ua3HqwkN3EArFtDA87u2vcy3F6gfOQPv
	 eQOzW1j/zkZee4HiA5DwCKlS1mTCFbywnUC14hc9DkcL0A/H/5gLDSzESU8RldKVZ2
	 21y+RuMpjT7byGzlw8h+AVICDB39oF5zMHkNqumCsllfSik5vpFH+KAMKfDS1RZ+SU
	 QPrhTZLa5i5OA==
Date: Tue, 1 Jul 2025 13:46:37 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: Matthew Maurer <mmaurer@google.com>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Timur Tabi <ttabi@nvidia.com>, Benno Lossin <lossin@kernel.org>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v8 3/6] rust: types: Support &'static and &'static mut
 ForeignOwnable
Message-ID: <aGPKncH3wcLT7Y9j@pollux>
References: <20250627-debugfs-rust-v8-0-c6526e413d40@google.com>
 <20250627-debugfs-rust-v8-3-c6526e413d40@google.com>
 <b0d2a93e-4f23-4751-ab70-12c8357c46c6@de.bosch.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b0d2a93e-4f23-4751-ab70-12c8357c46c6@de.bosch.com>

On Tue, Jul 01, 2025 at 01:41:44PM +0200, Dirk Behme wrote:
> Just fyi, depending on what hits mainline first, this patch series or
> 
> https://lore.kernel.org/rust-for-linux/20250626200054.243480-5-dakr@kernel.org/

Thanks for pointing this out, but I dropped the linked patch for now.

- Danilo
