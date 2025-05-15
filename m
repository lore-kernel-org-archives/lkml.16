Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE7171F8F04;
	Thu, 15 May 2025 19:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747335913; cv=none; b=gD7+7tkIwHYtcL4Af6jB7DAPkknrpQALeKxcHgU2oD2szQtCNbqlhWxEfYFJ/1HCJTOH5ot22gMDSOOa2eeVtinLuORN/BrKCJmCsPkaeuWUQfIj+liZziM4b7ZQDUk2UHpZv/Z738AQzi26zOaLDlQMdnUUbV7Gm2RDjc58DQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747335913; c=relaxed/simple;
	bh=wn9/xjxTayOUOYmwhbUCTjFzR31JrxtMr60iStCwDdg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BUpg2bcmtMXA9QKgJpMBo/XN1BBnwspcYLxcjDbSp5tm1RdhVJhO6giUcSNWak7Tx/PVXPHjXN2zQQ79Km+nW+FiLLL6U02poh5jOhfGx5BMvdDTgUeb/UTDSy71yxA20pI89zQ0cExV59gBrjWSKxrpHFd0lHlFoUvZXnWSpqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P2jKAkYr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P2jKAkYr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 914ECC4CEE7;
	Thu, 15 May 2025 19:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747335912;
	bh=wn9/xjxTayOUOYmwhbUCTjFzR31JrxtMr60iStCwDdg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P2jKAkYrdbP1ireKmr0EDd1VoCgYCkxv7y9Ue2gDbzq1DkwPbFJ8zJZTH33/ybHPI
	 2Y0f/1eYU1lNfcchWBjFK7XSh5Mb556F9m5XLklAC++R0+Nb+HJfcMVwTK8RUko3JK
	 ZbX4MmBeLy+qfMm1SFMJqOUZgfcZyFZGdVHkfP1hBmaQgeAfng9Kqe4kOXOHmGD3hF
	 ezqOWB9Q2H8XnqFFdi3kRbLQYnOHbMdW39vNBQiH19QGbOdg7Bzf2keOLAB81B+fR8
	 vzGQHrnpXPMnObTu3zNYFKdujZnu4HE0bkx+pKc9fE6YWgUaaH2tk3+wbng8HNVVYy
	 Hz7Vq6qyDHsNw==
Date: Thu, 15 May 2025 21:05:04 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Lyude Paul <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>
Subject: Re: [PATCH 0/4] drm: Rust GEM bindings cleanup
Message-ID: <aCY64BWE_L1Udw-k@pollux>
References: <20250501183717.2058109-1-lyude@redhat.com>
 <aCY5T0B4GHAo6WK5@pollux>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aCY5T0B4GHAo6WK5@pollux>

On Thu, May 15, 2025 at 08:58:29PM +0200, Danilo Krummrich wrote:
> On Thu, May 01, 2025 at 02:33:15PM -0400, Lyude Paul wrote:
> > Just some patches to fix a handful of minor issues, some of which were already
> > mentioned on the mailing list. Some of these patches also make it just a
> > little bit easier to add the shmem bindings from Asahi in the future.
> 
> Applied to nova-next, thanks!

Of course I applied v2 [1]. :-)

[1] https://lore.kernel.org/dri-devel/20250513221046.903358-1-lyude@redhat.com/
