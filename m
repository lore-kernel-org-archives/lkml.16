Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D7328A400;
	Wed,  7 May 2025 16:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746636402; cv=none; b=C5QwnRMZZ4mGvsYXF4gsESyMTAu1Tfv7b3s6elXc79T+E4SkB9xij1V4awgPPwYGcnxe3T0T/74wJ3KYEdM1M4gQ7YDaGh+OctN2mhPDDV5vKeB2D5A1dgd4UqFSXd0cNjX9Kj5XQl+tg9medE4fMLMdnQNjDkDhEhXTzydePZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746636402; c=relaxed/simple;
	bh=XXbCBLc6h+1265izanXKjKqjwUTk2zihyq448RKb4TM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mbifLQBA1HHbHunYeQZ2xK7gmfeNcGIeR2v2HJKCSku8NYcnPAKhB1soJnh+02bHzg+5YRiUzDZosDuqAuaw4btt1xf0wZWJL632Za1bEa6Q+D2HcEKTVgSRXClr+ehtB88X2OlVDg/PwV6MpKwO7ibT+23Vg3qx3qQml5/cBhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AS0Pp1eR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AS0Pp1eR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B60EDC4CEEB;
	Wed,  7 May 2025 16:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746636402;
	bh=XXbCBLc6h+1265izanXKjKqjwUTk2zihyq448RKb4TM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AS0Pp1eRz7XyfMdZJwDTnQtbd2uvOrCYlh+6MDJUv8iK1De2eLwWGWICzjozUr4Yt
	 dUUo2srgO/t8UCqoDYB8xRRBwm+ntSIcpp3RE7UkbEe5pM3s+7ToS1UYHRp+6+/41i
	 EUwDvm+lPXc8rZCxSAT/umTPIkU5JRSH5KrRz/43aRE4txishbD52AWu4a9SrrurN+
	 kYCioKCkJaRiwoG6HJ9SpSmtfacfNY9uNyRvVOjzy+iNXmQSlzBBwy33b5jQatcXaI
	 9TQTNF4KNJsYsO1Or41OQ05Ptf2gq2rRvyzcx3rSlB9zPXIM/e41t2Pc1ET2iEg85h
	 C2vtQXEM6rPOw==
Date: Wed, 7 May 2025 18:46:36 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Matthew Maurer <mmaurer@google.com>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, Benno Lossin <benno.lossin@proton.me>,
	Tamir Duberstein <tamird@gmail.com>
Subject: Re: [PATCH v5 0/7] Additional methods for Vec
Message-ID: <aBuObOAWNc7nuSlt@polis>
References: <20250502-vec-methods-v5-0-06d20ad9366f@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250502-vec-methods-v5-0-06d20ad9366f@google.com>

On Fri, May 02, 2025 at 01:19:28PM +0000, Alice Ryhl wrote:
> This adds various Vec methods. Some of them are needed by Rust Binder,
> and others are needed in other places. Each commit explains where it is
> needed.

Applied to alloc-next, thanks!
