Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C03B2F2A;
	Wed, 14 May 2025 13:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747227897; cv=none; b=pzmRG807nWcgqIknwOJsA7Z70lvoKFRZ4iyVPPsVrPEqqFoNGl3I14K+0aSE73k+oyikiT6mFxMiw1G9ok3p88EaBLTxk8V3x1Jw1jcP3vAw/4qhSfBV43qy1Ims0XtOVnFYFUSIbnKJ/vp6HKJ16j+zyv//NHzX+uKqFvfsnP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747227897; c=relaxed/simple;
	bh=1CuzB/n+2dUion5bvSox09piG72ix2gmzybtgOuAEu8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q0W0zmKeLy7rRr2fmvv0jNrjruUQNTTlQNhfdTn4y0G1xdMrSdlaX6CMtEqbiRhgVO1Oto+H4yVUUp459B0cO3S0OQjqe7bGSTfdbQDLhhM3FTydUJfLfHRS1lFGsXYCv/NPMI4j2Qz1kVvhreUCuIPYfXP9j3sQMYOHrN4aokE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eZoH326a; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eZoH326a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51C94C4CEE9;
	Wed, 14 May 2025 13:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747227896;
	bh=1CuzB/n+2dUion5bvSox09piG72ix2gmzybtgOuAEu8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eZoH326aJtFKfkIn2zJiqu8RIxgfuox6xYTnLBxNEjGVj8MzWCJD+eOyT5TYU7csb
	 7RGVSlHUTwQkk03hXpRf/NZFR9IZ8ZtrwgttG3vZTfL8lOn47PADW4qIRPErtiG5QI
	 6iofScLmUNk2RLjdxSnhWmB3GAjUm99nmm7qYX+V539KAFHpW1w0KMryReXoiR4jbZ
	 HSov7Jh1AVPP71FJKZZoqKksYxRmUYPepWn0pUAB3uFlm4SzxkBvOZpLxMQ/n4MJ4X
	 XzwgcQmrcA8WwXd3fvo5yKkpo3i52ZqpUshA8pKKUbLOEA4DaC21HtdjUoFCmCamVa
	 PEMn3IrlQzrgA==
Date: Wed, 14 May 2025 15:04:50 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Benno Lossin <lossin@kernel.org>
Cc: Matthew Maurer <mmaurer@google.com>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
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
Subject: Re: [PATCH v5 4/4] rust: samples: Add debugfs sample
Message-ID: <aCSU8pfqT3KPp1co@pollux>
References: <20250505-debugfs-rust-v5-0-3e93ce7bb76e@google.com>
 <20250505-debugfs-rust-v5-4-3e93ce7bb76e@google.com>
 <D9VPA1M45WBK.1TB4KOUXD24BD@kernel.org>
 <aCRdNJ2oq-REBotd@pollux>
 <D9VSJTPCSNXV.1LCXKGKVDGP96@kernel.org>
 <aCR9cD7OcSefeaUm@pollux>
 <D9VVOENW6H8P.32D4SGCFJ0LJU@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D9VVOENW6H8P.32D4SGCFJ0LJU@kernel.org>

On Wed, May 14, 2025 at 02:21:41PM +0200, Benno Lossin wrote:
> The docs on `keep` should definitely warn about leaks.

Sounds like it could be a good candidate for `FORGET` comments as discussed in
[1]. :-)

[1] https://hackmd.io/@rust-for-linux-/HyJipr_3Jl
