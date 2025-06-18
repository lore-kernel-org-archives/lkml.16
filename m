Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71ED2F1991;
	Wed, 18 Jun 2025 15:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750261960; cv=none; b=b0dCYqfmyZKH3iUVB3scLFcFC7eyoL30L9Ke/X5rlNX1g3+P5uli8sVwkTaa2QTgwYhovi1oo7lvH1loOOw4H2ZLajOTaVIkSHPWMggMisNfcMgn8aViheITp8+dCyiwjNM08h2xKu2eaYPrcpofgOkr1c3j8iIlC0/PDOtZBWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750261960; c=relaxed/simple;
	bh=5OOLcXhQVhYD3cCLhfJ3zJ8TBfJ7Rqkh1aaRe7pC0o8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sRzcGEqtVs1IDKegLOMiszF67mYYQPfVw70uTOwdh4FAfiHWS5xo3RAzyXbGXDYVs3RZLKCLT6i+UGcwzhtGmw/vTjg5CDhkmtTr+MqmSmGbtogM1L5Dh1ZC7WjpoD8nj/xY7VYT+5cIyip2H3BimYuy/k4MxfonBPKNtJpXaHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i28Q94F/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i28Q94F/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B7D6C4CEE7;
	Wed, 18 Jun 2025 15:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750261958;
	bh=5OOLcXhQVhYD3cCLhfJ3zJ8TBfJ7Rqkh1aaRe7pC0o8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i28Q94F/LQWVxxr1Zww11wGgzwGlGfXd5+itJVZAR8hnaj8PuZfhcaLr+PefA2poV
	 DRPVzg7Qqq7aEr+aOQ75g5FSEma3EATA+sl5edHY9ytEv5lIeLYTNU3vpMqZTIgW4H
	 BxUIzNq67DFtCTVd7XMA1UYOS0Tv6aZGLmZjehrylZjWNO1Wo3ZICNb2lJ29koNv6V
	 16moSZfZW6485zufQMtdt9XW7FLsGrqX+pxDuKz6xvXB+cM3a/9lcofmW6DBUrccHp
	 Xi/On0Soy7qe3mPmQwyacL4Rd9vk8gFNkvMgwiP7dBJIyFsqKFdpcfSc4QfxtJQ3Gq
	 Akf//SGSJkOxg==
Date: Wed, 18 Jun 2025 17:52:32 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Matthew Maurer <mmaurer@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Timur Tabi <ttabi@nvidia.com>, Benno Lossin <lossin@kernel.org>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v6 5/5] rust: samples: Add debugfs sample
Message-ID: <aFLgwMQc_5pWsH4x@pollux>
References: <20250618-debugfs-rust-v6-0-72cae211b133@google.com>
 <20250618-debugfs-rust-v6-5-72cae211b133@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250618-debugfs-rust-v6-5-72cae211b133@google.com>

On Wed, Jun 18, 2025 at 02:28:17AM +0000, Matthew Maurer wrote:
> +config SAMPLE_RUST_DEBUGFS
> +	tristate "DebugFS Test Driver"

s/driver/module/

> +	depends on DEBUG_FS
> +	help
> +	  This option builds the Rust DebugFS Test driver sample.

s/driver/module/
