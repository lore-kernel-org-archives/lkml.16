Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14942220F50;
	Fri, 30 May 2025 21:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748641435; cv=none; b=ApbwCILncVVIxKV3zzA7gebJz43H2PQj7WLXHOTVJAZtM4JAfYdKHKj/CTN05+f34Cgc7kYU0aZ53VePlCYmaUIf2PwT41fBgG50jKit+zst/13+89nm9EfAyLehYv1hqFPIQMENnz5Zd7WWdgIeey44xY3NR39HWYH6f9flgdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748641435; c=relaxed/simple;
	bh=vwvbEjMvFyOZbpM9X3YRY0jUYKcR+uYAzw5C46mK8jI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HXbtDyAJZLI25Rwb//Y0gRkBFyCHI4YLHQSSGikPwpi+ElrnsE0dGAm0pWveHdaMmBCCiIpQmTq9aPxQjyDoR7jJDGmNtPo2qGBxCeN6a+PT/KPPKe7aHttB8EVsiUUFJzWLw5aFNZyZj4rWn5lq8sSVnSd9DYg7qKGCjtUzUv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iA3+8PSw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iA3+8PSw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15F8DC4CEEA;
	Fri, 30 May 2025 21:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748641434;
	bh=vwvbEjMvFyOZbpM9X3YRY0jUYKcR+uYAzw5C46mK8jI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iA3+8PSwE8ZlEjFaPY3Mn3AziOxG+w+vELbxBAr09sz6YpXCmWobQjr878UiHGVBt
	 4KoDGXkvqzL9YKgWfA+jgD4spnnTqaVnmvpGoaH9uQ6396GBGbk61prC+DWgtMzEie
	 ntOvRpkBlkm47Ph0iY/aId+R1uEQMDGomqIKDRjvNYdHrOazlay4v4AJ3wV+W4apN7
	 d33t0kpjtC9Lsyi1QBFhiLv4OgE6cJS8KmAlr2TFz5HxYLhi1AkW5xsdr23Eiui6t3
	 wm9gh1w3saCO2CsRVUG7td35j+lUxYRfMAYKoqoemZuidmtOVmy3n6XAMQGvBExg2/
	 G9tIZMz+3zhTw==
Date: Fri, 30 May 2025 23:43:48 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Christian Schrefl <chrisi.schrefl@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lee Jones <lee@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Benno Lossin <lossin@kernel.org>,
	Gerald =?iso-8859-1?Q?Wisb=F6ck?= <gerald.wisboeck@feather.ink>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/3] rust: implement `Wrapper<T>` for `Opaque<T>`
Message-ID: <aDomlACshW4beFj_@pollux>
References: <20250530-b4-rust_miscdevice_registrationdata-v4-0-d313aafd7e59@gmail.com>
 <20250530-b4-rust_miscdevice_registrationdata-v4-1-d313aafd7e59@gmail.com>
 <fa66bd89-e52b-45ef-969c-c6f147f20185@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fa66bd89-e52b-45ef-969c-c6f147f20185@gmail.com>

On Fri, May 30, 2025 at 10:53:21PM +0200, Christian Schrefl wrote:
> On 30.05.25 10:46 PM, Christian Schrefl wrote:
> > Moves the implementation for `pin-init` from an associated function
> > to the trait function of the `Wrapper` trait and extends the
> > implementation to support pin-initializers with error types.
> > 
> > Adds a use for the `Wrapper` trait in `revocable.rs`, to use the new
> > `pin-init` function. This is currently the only usage in the kernel.
> > 
> > Reviewed-by: Gerald Wisböck <gerald.wisboeck@feather.ink>
> > Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> > Reviewed-by: Benno Lossin <lossin@kernel.org>
> > Signed-off-by: Christian Schrefl <chrisi.schrefl@gmail.com>
> > ---
> 
> Danilo, FYI this is basically a patch from my `UnsafePinned`
> series [0] that I've used instead of your patch [1] that does something similar.
> (I've only dropped `the call is infallible` from the safety
> comment like in your patch since I missed that before).
> 
> Let me know if you want me to handle this any different.

No, that's fine, I wasn't aware of this patch, let's go with this one then.

	Reviewed-by: Danilo Krummrich <dakr@kernel.org>

> [0]: https://lore.kernel.org/rust-for-linux/20250511-rust_unsafe_pinned-v4-2-a86c32e47e3d@gmail.com/
> [1]: https://lore.kernel.org/rust-for-linux/20250530142447.166524-2-dakr@kernel.org/
