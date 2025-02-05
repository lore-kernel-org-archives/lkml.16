Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10C391FF617;
	Wed,  5 Feb 2025 19:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738782789; cv=none; b=F56DauH2+UK8rsmBswdGaXnlNMEFo8QO48yE9Eb3zVo1nM03Qob9j1S0Pn4glFw0fFdp4VUhW8MEummVwCm04xlfpRGmk26nohfYPZUzicq9mWlDDQgIZOoM5n47njK6/3ZAs3pYeLTWB7fbA7DYObg0cCFnB3by/EGjXIJN7gE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738782789; c=relaxed/simple;
	bh=L0zO+nk5ldcF7K6mGZTOL3IoNbynZ3LzlQY7fQANCuI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dT16U7wAg5AYuAAjcdPdx6hMc7Dv3VoT+z+Tgv3ld9vkArPneopcoU2N2SBPcmQR9pmhWjTYwu+ckVcytb2c+qO8Ig6vKlV7Ycxslf+Yj4GG6kFsp4244XvCKOTz1QNhbPS2gRmwc0xK0gL0CiyjaJ/gRgJIDKQUOVqxBBcnmus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N92K5sMu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N92K5sMu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14880C4CED1;
	Wed,  5 Feb 2025 19:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738782788;
	bh=L0zO+nk5ldcF7K6mGZTOL3IoNbynZ3LzlQY7fQANCuI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N92K5sMurRii4IlVBHVMUXvrVJ1cf/Yd4QH/Ce/kWqR8RJfJZwC9FdXT275JYhlSS
	 vUfrcAPdbz/W9OC9cnQMSuhQa+s5cx9P+6jYwmeDYutPrm4ecWnfUDA92116H3h25F
	 cG/gXYk201LI4NFqnp3BGkJcLgLSFYKoIBK0VctCi3saskIjzEVWnzZPZke++mHms/
	 6zmHs7t+sGBl72Eu0JSCZE2iyI1MtNdjRzlhH6OlSdE0pKaTXEDQkuYaTIzAb+B5mt
	 ndWgl7SdlzszjKUROyTr+xGbdiFrhu5HHyK4aRpSCljXp9787nwKxVv3wpN4BzYViT
	 SZInNIlPq8hYw==
Date: Wed, 5 Feb 2025 20:13:03 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Tamir Duberstein <tamird@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] rust: alloc: satisfy `aligned_alloc` requirements
Message-ID: <Z6O4P_BmiR2czXDf@cassiopeiae>
References: <20250202-aligned-alloc-v2-1-5af0b5fdd46f@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250202-aligned-alloc-v2-1-5af0b5fdd46f@gmail.com>

On Sun, Feb 02, 2025 at 06:27:16AM -0500, Tamir Duberstein wrote:
> The implementation added in commit dd09538fb409 ("rust: alloc: implement
> `Cmalloc` in module allocator_test") did not honor the documented
> requirements of `aligned_alloc`. These requirements may not be enforced
> on all systems, but they are on macOS. Ensure that alignment is at least
> `sizeof(void *)` and round size up to the nearest multiple of that
> value.
> 
> Fixes: dd09538fb409 ("rust: alloc: implement `Cmalloc` in module allocator_test")
> 
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> ---
> Changes in v2:
> - Shorten some variable names. (Danilo Krummrich)
> - Replace shadowing alignment variable with a second call to
>   Layout::align. (Danilo Krummrich)
> - Link to v1: https://lore.kernel.org/r/20250201-aligned-alloc-v1-1-c99a73f3cbd4@gmail.com
> ---
>  rust/kernel/alloc/allocator_test.rs | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)

Acked-by: Danilo Krummrich <dakr@kernel.org>
