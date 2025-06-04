Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53D33267F43
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 23:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749078093; cv=none; b=kzgV/ncR1f+T6iznKrLDdwZcCqGwcBm2T3Zt4+/J5O4d+kQde5qHb4Jm8YnoUQ1M9SJUdiAc4AoThcxNnhD55ccd/VS7WcgwuPpHP6ntgkVveHbAn9BGQd2XxSZ4E8RkaGHHjWztJ6nOeyBtsfE1PwraGJhvZFfZ3sYNLEFDFS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749078093; c=relaxed/simple;
	bh=+fSMmduX2kJsgH1ngkDSXnk2QMMNes2I6KBi7bEtLjA=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=W+Y/pR7yRV46KgSuyW8QSiIEEBKsX1MMaUJbJWNEZm1EtH7Jbatq0rvbzicH+TkTkIJVgrOankKto2DC6sJ1TKyUEI1cuYdafdIRLw8KEb4+Godcx2/EgcjMl5d+RRx/Q8maD5ph4SJiApynCzZhrZxp1g3WKeMcpMcmwILo0WE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=WaQ6qvmH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="WaQ6qvmH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64C89C4CEE4;
	Wed,  4 Jun 2025 23:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1749078092;
	bh=+fSMmduX2kJsgH1ngkDSXnk2QMMNes2I6KBi7bEtLjA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=WaQ6qvmH5ojYoIvtWNLC9bJK1w5sdN9M62gfDUTHx9/galg3N9ycakJCbhxd6SwLC
	 6YbYOyfk3ck3hkJ3RYcg0tQc4ngUc4aWtajlj4IhItRSjvkDV7tpXvSQYsNsuRhzxh
	 Gk0f6eeMqjpZXeG1a83qy7ytfPIRxm11nhMz5ZBg=
Date: Wed, 4 Jun 2025 16:01:31 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Kuan-Wei Chiu <visitorckw@gmail.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, jserv@ccns.ncku.edu.tw, Yu-Chun Lin
 <eleanor15x@gmail.com>
Subject: Re: [PATCH v2 1/3] lib/math/gcd: Use static key to select
 implementation at runtime
Message-Id: <20250604160131.d00e8a3a2230a00f3818a3a1@linux-foundation.org>
In-Reply-To: <20250524155519.1142570-2-visitorckw@gmail.com>
References: <20250524155519.1142570-1-visitorckw@gmail.com>
	<20250524155519.1142570-2-visitorckw@gmail.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 24 May 2025 23:55:17 +0800 Kuan-Wei Chiu <visitorckw@gmail.com> wrote:

> On platforms like RISC-V, the compiler may generate hardware FFS
> instructions even if the underlying CPU does not actually support them.
> Currently, the GCD implementation is chosen at compile time based on
> CONFIG_CPU_NO_EFFICIENT_FFS, which can result in suboptimal behavior on
> such systems.
> 
> Introduce a static key, efficient_ffs_key, to enable runtime selection
> between the binary GCD (using ffs) and the odd-even GCD implementation.
> This allows the kernel to default to the faster binary GCD when FFS is
> efficient, while retaining the ability to fall back when needed.
> 
> ...
>
> @@ -54,6 +58,11 @@ unsigned long gcd(unsigned long a, unsigned long b)
>  	if (!a || !b)
>  		return r;

Both binary_gcd() and gcd() perform the above.  Seems unnecessary?


I can merge this series if the riscv team are OK with it?
