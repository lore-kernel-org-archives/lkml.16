Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB1E1C6FF3;
	Mon, 14 Apr 2025 21:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744665875; cv=none; b=cbgZ4DtnrbSw4EkSSwKDOI2H/D6afo4l4MXIlzbYsexKv0Ertox8Sz2beimFZdecgMdWRbRhxjaU/aZVArWhtV9p+t5KQ43ZHm22FPX4mLSF0faQ98+f9ViwGbbVw/se6RLT07fLk2t+6pdhBbacn/rD5WlgUHJEv+Esk5QgwLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744665875; c=relaxed/simple;
	bh=r51HquxAjj1e3J4hoZ8kYc6DK4uVQyCgiKCWgJu3yuc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EsWezD2QXknIP+0jIwTJpZKfFG7viG1a/dgLPl/cYa4ciwjxc0xMdTJjME1e4s4NK/nrpxXPvzohAUzN7uDAgwhLyZZv1i5xfSCtvoj9wxMDYeP1ShjDwed8HDToLlfwJPT/0ZWpm4zimSKy/kWKQrmoOTU6g/4xL13fnBX9gT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B3AgtQT1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B3AgtQT1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F71FC4CEE2;
	Mon, 14 Apr 2025 21:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744665875;
	bh=r51HquxAjj1e3J4hoZ8kYc6DK4uVQyCgiKCWgJu3yuc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B3AgtQT1DqOXlNGmXFoDoJbQ6DOgxRNLyOEjvDIE9ujvy4plDoQO0/b5GxMBgteKi
	 IjfE8ZP5/9mQS7VOwwAH2Z2Zw2waobvHpR0Y2q06MKtvhEsUzYE9iMpwNbbraohHB7
	 tyWJs35onHfoJdGoMrQzHb0PlMZvrhv1kzqnBqYmp5OaXmnqt2DeRjxjTlKS/Sz8tQ
	 89ddgTHxjzQ+sgAbpPk70oNLRdWivQfFhw/Atay5WNDe7Fy5bT5Ugq6xk8AkLfKSXd
	 AQ+RfixN1GOinFfSKBQ3D+7GLrrYp4Pw132+7krF0qEXnmUZ9eupL9T+/4cnZ0vSUY
	 BkoqBXkvQU3sA==
Date: Mon, 14 Apr 2025 23:24:29 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-um@lists.infradead.org, richard@nod.at,
	anton.ivanov@cambridgegreys.com, johannes@sipsolutions.net,
	geert@linux-m68k.org, logang@deltatee.com, sbates@raithlin.com,
	dinguyen@kernel.org, miguel.ojeda.sandonis@gmail.com, arnd@arndb.de
Subject: Re: [PATCH v2] rust: helpers: Remove volatile qualifier from io
 helpers
Message-ID: <Z_19DaVwN2TRt_nG@cassiopeiae>
References: <20250412005341.157150-1-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250412005341.157150-1-fujita.tomonori@gmail.com>

On Sat, Apr 12, 2025 at 09:53:41AM +0900, FUJITA Tomonori wrote:
> Remove the `volatile` qualifier used with __iomem in helper functions
> in io.c. These helper functions are just wrappers around the
> corresponding accessors so they are unnecessary.
> 
> This fixes the following UML build error with CONFIG_RUST enabled:
> 
> In file included from /home/fujita/git/linux-rust/rust/helpers/helpers.c:19:
> /home/fujita/git/linux-rust/rust/helpers/io.c:12:10: error: passing 'volatile void *' to parameter of type 'void *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
>    12 |         iounmap(addr);
>       |                 ^~~~
> /home/fujita/git/linux-rust/arch/um/include/asm/io.h:19:42: note: passing argument to parameter 'addr' here
>    19 | static inline void iounmap(void __iomem *addr)
>       |                                          ^
> 1 error generated.
> 
> Fixes: ce30d94e6855 ("rust: add `io::{Io, IoRaw}` base types")
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

Reviewed-by: Danilo Krummrich <dakr@kernel.org>

@Miguel: This originally landed through driver-core, but I guess subsequent
patches should go through the Rust tree.
