Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C99519F130;
	Sat,  3 May 2025 12:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746274494; cv=none; b=pPVQqAjGUMmlK5iNvvgzg7EwRBPIMBlNUpi2rPjn5GNwqIT2EzzhQdp2s0/YQgPbXPizTy8JY5reSS4gzOmL+Pla+fVcHYV5rieKWT9TMNo+5qQWNsUtwQr3/vQo3BzCKghO9aZ1uWjxkYfq/rj15ITL1e67UQoh3WY/ObdouMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746274494; c=relaxed/simple;
	bh=5QSKVIWIyE0G0SOrr3V+CMtcq+HMng2o9oPwArw/ys8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bj+CM3aivgztl1LT7LbTbPgVjnPJ6r8ucRQqSvLr/HQkE9IEagmZXhquXDpSAmNe5TiAwqiaMkG+jWPb3hyBSw2bPlDhR/hEuI9huhgjTT552EqY9hKm5TY8AbEgcWTABMcmvXIv/tXHlq/ibi7rMRAHZ5CktwS/xvXY81QbxsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GpseRRlz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GpseRRlz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49663C4CEE3;
	Sat,  3 May 2025 12:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746274493;
	bh=5QSKVIWIyE0G0SOrr3V+CMtcq+HMng2o9oPwArw/ys8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GpseRRlz5KWkNw9uTxAqUrsdJNiI623pvI6Awe96LbPfqKazWdizWGIAykVF2NXS8
	 1MT8rYe/c6DREdlgKcXxt6jdDPw5skQOrVcE1D9j0ltI5CDxLVIaatFRIztWpBXO7l
	 u7zQ0d8bn8DkIxgeJl+h8V2MSEwAVwCItE6lXmYzPOEiEed5IdBwhG7IwuqVocsCsO
	 qcBO5/FuL1d+Q0mAK4RCpu4cWa7mlLzDJPAD0voa6axjjhS7wBrrAGITOOSagUkP2q
	 9cvfLtai9NX+1dri+Oa4sXU+K1MNvpvfOQsPubCNqAc3nf6Xv+4ccbE3YJJIlVPUxp
	 VGK3R/lKFg2HA==
Date: Sat, 3 May 2025 14:14:46 +0200
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
Subject: Re: [PATCH v3 2/4] rust: debugfs: Bind file creation for long-lived
 Display
Message-ID: <aBYItvyLspP5lzBA@polis>
References: <20250501-debugfs-rust-v3-0-850869fab672@google.com>
 <20250501-debugfs-rust-v3-2-850869fab672@google.com>
 <aBRrniLfCzWX7nbR@pollux>
 <CAGSQo02bU9HLG=KoYAukUWDX=Ky+kx_wCJszpS-x4gjWXWrYjQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGSQo02bU9HLG=KoYAukUWDX=Ky+kx_wCJszpS-x4gjWXWrYjQ@mail.gmail.com>

On Fri, May 02, 2025 at 11:07:47AM -0700, Matthew Maurer wrote:
> I'm making this change, but so that I can be correct in the future,
> can you explain why taking an intermediate reference to private is UB?
> My understanding is that my provided vtable are supposed to be the
> only methods looking at this field, and they don't mutate it.

You're right, I confused it with something else.
