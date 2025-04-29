Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D282417B418;
	Tue, 29 Apr 2025 20:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745959758; cv=none; b=sfGuBqJDLHdkEYMDb08h78L2z/bdZxWHIGeQtDd7BBATjf9uSQRqCFhKq32nFnJvGOLRFA1bLgTy1MHLDxfNJpeMuSc6tEQVYvY3wpUqc+cOnrVfFjBbeQFwWTRmCcsVrhjtrj1XFu2ExbXjNSgM6KE0bJpnl8SAADgKqgoQQFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745959758; c=relaxed/simple;
	bh=ptTQiYQiUBpqi5BLqP8hyOPwFhTGOu4vZpnI6PDLdBs=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=sVJIJAaChMO/gpzF1igfpKb0yDRRqg3M1vzyfAYkUFE0WypwYrEJEKnTGbgQe5rokUHjpRklWLYEaso+EhwAjgQRQoc/7Q0Nnz+VHox3DEGFjtak5A5Hbt8X7VKa3gT9VD3EkpdaRUKgC8rM+0Uegjp+0BUjsLQzZ3ntRnxZIhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OrhdEdqE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OrhdEdqE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 358ACC4CEEA;
	Tue, 29 Apr 2025 20:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745959756;
	bh=ptTQiYQiUBpqi5BLqP8hyOPwFhTGOu4vZpnI6PDLdBs=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=OrhdEdqEAxCDMWJLTEDqp3ErrJlbvGWWQOO/ZStLLVK5GCM3LbBJ16nOCXCPob9dn
	 ypLkVxKcaBoKS5gBcXPbA9qZkCrQ/vHKRxf5CzpNGJIcckj8Z4qu0eHuXytxlc3knh
	 MRAWJJKtVfJVmeZqZ8cQYToxXsbyjb35XWgx3SYA3Y7Bc7SsJCUV648Ny/MoF39nH8
	 pJhbo6niOVSfKAKzzzewfpeqQIs2It9x7jB2CtjNzbh6ePyGH2Oqkd5hC0CB85DcFd
	 yLcSN0xeTbro68O/ctjfMbg/m5BfHT13x8QIEJ+TKy8TbrJJ6D+Ab4Tn8OFSqfvsIw
	 Q6bUkl0IGFD6Q==
Message-ID: <deb072638716e9978bd6381352cc721b@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250415004612-GYB29591@gentoo>
References: <20250412074423.38517-2-heylenay@4d2.org> <20250415004612-GYB29591@gentoo>
Subject: Re: [PATCH v7 0/6] Add clock controller support for SpacemiT K1
From: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Haylen Chu <heylenay@outlook.com>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, spacemit@lists.linux.dev, Inochi Amaoto <inochiama@outlook.com>, Chen Wang <unicornxdotw@foxmail.com>, Jisheng Zhang <jszhang@kernel.org>, Meng Zhang <zhangmeng.kevin@linux.spacemit.com>
To: Haylen Chu <heylenay@4d2.org>, Yixun Lan <dlan@gentoo.org>
Date: Tue, 29 Apr 2025 13:49:14 -0700
User-Agent: alot/0.12.dev8+g17a99a841c4b

Quoting Yixun Lan (2025-04-14 17:46:12)
> Hi Haylen Chu:
>    I'm quite happy with this version, as all the issues are solved,
> Thanks for working on this. I will give my RY and start to queue them.
>=20
> Hi Stephen Boyd,
>   My plan to send a PR for inclusion to the clk tree in the 6.16
> merge window. But, let me know if there is still problem I overlooked.

You should send the code now. The merge window is when subsystem
maintainers like me send code to Linus, not when SoC maintainers send
code to subsystem maintainers. Typically folks wait until around -rc5 or
-rc6 to send it for the next merge window.
