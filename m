Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E065221FCE;
	Wed, 14 May 2025 22:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747260864; cv=none; b=LwqpJTDtsDfxtxABqbX9XRd3X4ZTsVmqCa2okaYRTEQvqK4zIjRlPGG56xpDhaoEot4SbKiuoFs1YqeT5v28tcmCNZRkqwc4GZRJPKtzkAFxtHN3YS6zZvfMwRA1ZTLsSwcN/BWfUGEmbyGHT1S+aEcpSZ9n01S1qnl9FqUz8iA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747260864; c=relaxed/simple;
	bh=E6fL/Nh/cGSne4KWSvMAVkm3g30wfFAm4/j5LB41is8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EjA953pWVH+EpRmID9C6tG7zAeBR/s01YXCR2ZgHu2yvNJLnq/RDHjluAsRdf6T+lJRP0Et539yZvXB4IOdsmHVhHzKBEGREqY0MTmqNQQanzQxRHevyNZn423SbHKwLPf4784aKBAufFtkZRjuKZs/WV5X1iFomBsafNAP5+fE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NgCUsUHT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NgCUsUHT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 198A5C4CEE3;
	Wed, 14 May 2025 22:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747260863;
	bh=E6fL/Nh/cGSne4KWSvMAVkm3g30wfFAm4/j5LB41is8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NgCUsUHTbxycn3v4K6MrPPNH1nVBglRGL0niFlaMB+4bHGSqYQd3d2NQp4NllzWyJ
	 Ltu/kusf94smajJdNyOUdgewNFHg24uEDuAX5aqiGYJRx0LhppMUgO6cT9eJ5eVukM
	 /xzX8eVuwa5KzFgk5VHScIk83nhTtfO7rYA0APlZLpb+qictAM1qJPaAFzdY0G/gza
	 8xciVMtpbHkwkb2qHThFgkmdzlIE9ct8kFld7hnkA2z4oyYEPgAzfariu1EC/g+vTo
	 1nSoDHycHIPKO/9FTjeXrSqMvZrZQgIcP/wuEG51TDhNf0BqFucdrt4q7xSPy9TEaB
	 hC+QRyahZAU3Q==
Date: Thu, 15 May 2025 00:14:17 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Matthew Maurer <mmaurer@google.com>
Cc: Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
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
Message-ID: <aCUVuXO_jORqlxwr@pollux>
References: <20250505-debugfs-rust-v5-0-3e93ce7bb76e@google.com>
 <20250505-debugfs-rust-v5-4-3e93ce7bb76e@google.com>
 <D9VPA1M45WBK.1TB4KOUXD24BD@kernel.org>
 <aCRdNJ2oq-REBotd@pollux>
 <D9VSJTPCSNXV.1LCXKGKVDGP96@kernel.org>
 <CAGSQo00Pj0qF90712K7xACNEvr2e0q=98b8-0VUcXLD5V+oDhg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGSQo00Pj0qF90712K7xACNEvr2e0q=98b8-0VUcXLD5V+oDhg@mail.gmail.com>

On Wed, May 14, 2025 at 03:08:21PM -0700, Matthew Maurer wrote:
> On Wed, May 14, 2025 at 2:54 AM Benno Lossin <lossin@kernel.org> wrote:
> > Another problem that only affects complicated debugfs structures is that
> > you would have to store all subdirs & files somewhere. If the structure
> > is dynamic and changes over the lifetime of the driver, then you'll need
> > a `Vec` or store the dirs in `Arc` or similar, leading to extra
> > allocations.
> 
> Yep, this is part of why I tried to follow the "Build it, then hold
> the needed handles to keep it alive" approach rather than keeping the
> entire structure around.

I already replied to that [1]:

"If it changes dynamically then it's pretty likely that we do not only want to
add entries dynamically, but also remove them, which implies that we need to be
able to drop them. So, I don't think that's a problem."

It is much more of a problem if we can't remove certain entries anymore without
removing all of them.

[1] https://lore.kernel.org/rust-for-linux/aCR9cD7OcSefeaUm@pollux/
