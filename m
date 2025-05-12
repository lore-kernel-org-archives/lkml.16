Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E7219E82A;
	Mon, 12 May 2025 14:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747059147; cv=none; b=TulnIiAnMRM4RabKeflq68fiMuhK6XkNsQ7UazyEQE22dxUVtzJB6K0HIuR2yZSUQaZ4eI7U9iySkgD7ng9CcTM+FlbS0TlstR47x2/YqyJqquuQx6yOnL6XE8wZK2UZH1GGIW9VPvwuDym2m96F8IVx+9K0cJKuWsuFxfmrk8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747059147; c=relaxed/simple;
	bh=SaSpsbgwY6SApMlm1DL1cUwGhzvzCUryR7xeotHGqbU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WpzPCFqfxDQ8cf6+gk6WLO7VpjND0VK1AsgUIztbdWguj/dgs7TkoTbhlQv97tH2LiiGkNVANj4rniqkIOAvm9X2k3cFQNKtkT1h5REpQEKzMd0uNyZdm1TaFCYJEqNHHiSjUv7PB6VZyWgB6xBOOTqvYtij7AZYNtym70xB9Wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rISpUdkW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rISpUdkW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87C62C4CEEE;
	Mon, 12 May 2025 14:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747059147;
	bh=SaSpsbgwY6SApMlm1DL1cUwGhzvzCUryR7xeotHGqbU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rISpUdkWsIg8sSZA4oB5QxXrcKTc+NaGR5NtSdcSNpvV9xvjRBaLkULkaHfW4iz9F
	 Y9yS2q9Ao8zzWgg1mX01FL4+2m8/uhwoj9rruXTzLW4hSTOl0XIcNnMKy/t0b/Bbmu
	 nnLt8n/RhKp5xA++JlELr4L2SFMVNBRlaoXVk/Ws9wKHmzWllO8Se75I9H88PG6w/o
	 3OsKzFiVik84HyO4z8mIG80Tq/cCq6ZVNrKzSl0JKf9M5GBug998zp0MWA9eGUR5qq
	 xNaf9Y+FCZi6DjAIo8mNuX5bp6nIVwkMaHRpewMyekrDKtyAZ6GMRrv44ZIi5sqzf1
	 m+AG9EE2B+qIg==
Date: Mon, 12 May 2025 16:12:20 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Remo Senekowitsch <remo@buenzli.dev>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Dirk Behme <dirk.behme@de.bosch.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v4 1/9] rust: device: Create FwNode abstraction for
 accessing device properties
Message-ID: <aCIBxN80L9wxCQ5H@pollux>
References: <20250504173154.488519-1-remo@buenzli.dev>
 <20250504173154.488519-2-remo@buenzli.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250504173154.488519-2-remo@buenzli.dev>

On Sun, May 04, 2025 at 07:31:46PM +0200, Remo Senekowitsch wrote:
>  rust/kernel/{device.rs => device/mod.rs} |  2 +
>  rust/kernel/device/property.rs           | 47 ++++++++++++++++++++++++

This one is my bad, I think I suggested rust/kernel/device/ and
rust/kernel/device/mod.rs.

Can you please change it to rust/kernel/device/ and rust/kernel/device.rs, like
we do everywhere else?

Thanks,
Danilo
