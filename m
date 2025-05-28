Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CBAD1DE8AD;
	Wed, 28 May 2025 19:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748461599; cv=none; b=tzihsas16rIwrOGW+537EehOxQQBdll8sI1YQ4sqr6KU6VH3r4uPRGvvJDEOENtYmGf7dm6Her2XpqJ07lJ8aY0iLwl4c9QXOxHfhzVI2uGm5KhgWgVjDhathblOOgXSjOTFpH6cXXRkt+p5OrPQTYneHeLqfsKIBIp6sz63QKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748461599; c=relaxed/simple;
	bh=vazK55BnxBHAJLIAa4pyZuj8/xOPR6T6afws02P2cRs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CZ+WXL+Ys1lZWJ3K1vpdEY4H19DTPh/zmVfrn3RE+Qya5/8uRWF7PIjrAPeu0+2CLOsRBkJs/m/s3B1SYeSoC7c3fqDy+yVGQQ335uq6fJCkITOOj+Ob7rAaEApuORa2WaCdY+1UIQIBP049uvtiJ/hlhdN72ICDiSR6HEVBhYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jqaHsF1W; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jqaHsF1W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1306C4CEE3;
	Wed, 28 May 2025 19:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748461598;
	bh=vazK55BnxBHAJLIAa4pyZuj8/xOPR6T6afws02P2cRs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jqaHsF1W2uYSpPEoxiCV0ytE9qdIlMAZ7IClo4LatOHE5JRR4ZuY2bj8gSTqAMqLl
	 yLprQom5QIxk+UCUz5FGYL3t1ZodS8be0e76pyAxITDJk+5SJ7cEeTeusnlhws8HeL
	 BF4QvrtBDtfdKW3uSdBhfi7awejkivsYFEnmfMZbiFY+x3XoIq8z4SiRSZ/AjLwXn0
	 KxEoIqH9LMK+07wFeVLiAQUHOC9OiXrOFpQ0c0BSYV8d9v11/ZNX3zq3kUZbC+jqTi
	 7wtwV3ubU2sHmQVQopv/7Nr256MJKzGEGxKUuAQVgRjgcd3DSswiWqY1LhYX9yZdQM
	 zCzxRmuJXSvrg==
Date: Wed, 28 May 2025 21:46:33 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: "Christian S. Lima" <christiansantoslima21@gmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	~lkcamp/patches@lists.sr.ht, richard120310@gmail.com
Subject: Re: [PATCH v6] rust: transmute: Add methods for FromBytes trait
Message-ID: <aDdoGfo1kynqWCDm@cassiopeiae>
References: <20250330234039.29814-1-christiansantoslima21@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250330234039.29814-1-christiansantoslima21@gmail.com>

Hi Christian,

On Sun, Mar 30, 2025 at 08:40:15PM -0300, Christian S. Lima wrote:
> Methods receive a slice and perform size check to add a valid way to make
> conversion safe. An Option is used, in error case just return `None`.
> 
> The conversion between slices `[T]` is separated from others, because I
> couldn't implement it in the same way as the other conversions.
> 
> Link: https://github.com/Rust-for-Linux/linux/issues/1119
> Signed-off-by: Christian S. Lima <christiansantoslima21@gmail.com>

What's the status of the series? Are you still working on this topic?

- Danilo
