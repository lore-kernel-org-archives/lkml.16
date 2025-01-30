Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 649921AF0CA
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 08:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738226545; cv=none; b=B22+GlF6uoPIJ9/CK9bwGp1+HEgAudEiQbLZ9FLwVs/NjlJMLPdyQMktkqIb6M5p1uZlzwo9TjPvJm51XCMS3uEtOh9ifaKMN+USBgBPXAAFROVhR8dDM1i2910pWwE9WFuA/gd8pnEmbbCXgb95HxERZCQ+26MnsV3ykyncxHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738226545; c=relaxed/simple;
	bh=Hns6xwQBsveKR1vKW31yktZyPYFYoDOUmz4ZKRbjlTo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=NBNvDWh3qfvviiN0mcMvUgBM4QwSkJU3nyKK/LDRsXVlYfGZJXKGBvr0UlC0OKBwzyAWiuB0G+zxU7k5ZSFGYXF69sf+Rb+sIy1u0MYYymwkpE6pyAaxKB2UInlKVvxUQchBl8c1wGuzw9OjuTgaRI7ZAkp3fCuRSCuneof3uT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vMzj4MYK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vMzj4MYK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E7D8C4CED2;
	Thu, 30 Jan 2025 08:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738226544;
	bh=Hns6xwQBsveKR1vKW31yktZyPYFYoDOUmz4ZKRbjlTo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=vMzj4MYKtAiqJ6RLff4zJDABl7+halshmCh0EvHM/8X2HgrGzphOmm/IaTDLL2HEf
	 p/9fD1tMNFp222OgdU2zOCRlhTlG1kDFeqYBoKW52i0oegKOaJ8nlfMprSIcYMsyW1
	 hwW7EUpyvJUayUv6fvRpQ1ViC3pJtLfUsXYSMuNMQyJ8gcKVZh04FkyCfRClMXX3Gk
	 1dIlONxzZo0i7Oe9+E5qtuou5p4mAtt/K2wF2pCxM+pe0jJT2VEL960qR8Q4l1yeew
	 p96p4fQVsGo7jz/LkVhj4gAqLH3vvZbuA0bUSwt85euHZ8Uum/sFSH+zLERjXHR5xn
	 6PyU2iGEfGhdw==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Chunyan Zhang <zhangchunyan@iscas.ac.cn>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Paul Walmsley
 <paul.walmsley@sifive.com>, Alexandre Ghiti <alex@ghiti.fr>, Andrew Morton
 <akpm@linux-foundation.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Chunyan
 Zhang <zhang.lyra@gmail.com>, Alistair Popple <apopple@nvidia.com>,
 linux-mm@kvack.org
Subject: Re: [PATCH V5 1/3] riscv: mm: Prepare for reusing PTE RSW bit(9)
In-Reply-To: <20241113095833.1805746-2-zhangchunyan@iscas.ac.cn>
References: <20241113095833.1805746-1-zhangchunyan@iscas.ac.cn>
 <20241113095833.1805746-2-zhangchunyan@iscas.ac.cn>
Date: Thu, 30 Jan 2025 09:42:21 +0100
Message-ID: <87frl0snf6.fsf@all.your.base.are.belong.to.us>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Chunyan Zhang <zhangchunyan@iscas.ac.cn> writes:

> The PTE bit(9) on RISC-V is reserved for software, it is used by devmap
> now which has to be disabled if we want to use bit(9) for other features,
> since there's no more free PTE bit on RISC-V now.
>
> So to make ARCH_HAS_PTE_DEVMAP selectable, this patch uses it as
> the build condition of devmap definitions.

Heads-up: It seems like Alistair's series [1] that removes the devmap
PTE bit will most likely land in 6.15.


Bj=C3=B6rn

[1] https://lore.kernel.org/linux-mm/cover.11189864684e31260d1408779fac9db8=
0122047b.1736488799.git-series.apopple@nvidia.com/
