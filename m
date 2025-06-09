Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF575227599;
	Mon,  9 Jun 2025 21:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749502860; cv=none; b=Qo78I3w5XhUN1zdQzyt0PLzL3ZPZRrTUSjaVYsZLZTQ3eXQyvCQVTYDge8x/adlFxkem4mnkGLD0LRJOIvXI5jx+FvFDyLl3oSTWcRiRydUpfQzZ/LAEnAJj+fninhHznAGrFl4tS49XCNLqI25IFkoCJbSrToEqIVczZAIDJoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749502860; c=relaxed/simple;
	bh=XzCQb2hs95nRYm8RcK32DtG5sjazppbKMDyZ0t0F2xU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=PkN3CgCrluj37UbNjarAMv87qEVfGxGtdLrsUGP4MMzhMx5qaOPvOzIZ1X1acRwqDSu2lTfi7WOdJXGHbfbc1wgipYNuXMUQyD5OPg2/e3J1OuAO3owTWC+WCMEUlIqA3qwIWP+TyHCfIH1/MNZK3ld30x6LRKp1hNkg8+OwRVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=MBKhHuMk; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="MBKhHuMk"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net A8BDE41AA1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1749502854; bh=Byi6ZbZeSTJ4d0f4c+Txg+G1R737uVa/AC1DuFNbhjQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=MBKhHuMk27quWMUCqecP/2rE811WfvZ88RlmLggZ67jpwR0HL4WAIxKp7uRQ7/iwM
	 wyoR83XEcQ6mPbBK0KcOb2Meua26eLYs1XOP+KGTaDEOtrjKhu+mg510aOFJByDZwJ
	 HtAEwskVmRqFe1WLiVLC5Poc4QTa0OHVzTL6hpCk/AIkNHYGWyWd2+P7GhBishdD7T
	 VBCwPji2GhB1AIULsTADjNtpFeaEIm9gnk6f5uhYuDvZa2q1VW2BBlWxxagCb7jc/W
	 bjNjvINyD8AFwiLK1bUBPv1qEbycLxyi/iy1eSvgKTaeLv0scXI+1mqbMwbxfrF2GE
	 GB1caN+/OV3iA==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id A8BDE41AA1;
	Mon,  9 Jun 2025 21:00:54 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Brigham Campbell <me@brighamcampbell.com>, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linux.dev, Madhavan Srinivasan
 <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas
 Piggin <npiggin@gmail.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Athira Rajeev <atrajeev@linux.ibm.com>,
 "open list:LINUX FOR POWERPC (32-BIT AND 64-BIT)"
 <linuxppc-dev@lists.ozlabs.org>, "open list:DOCUMENTATION"
 <linux-doc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Cc: Brigham Campbell <me@brighamcampbell.com>, Randy Dunlap
 <rdunlap@infradead.org>
Subject: Re: [PATCH v3] docs: powerpc: Add htm.rst to table of contents
In-Reply-To: <20250528054146.2658537-2-me@brighamcampbell.com>
References: <20250528054146.2658537-2-me@brighamcampbell.com>
Date: Mon, 09 Jun 2025 15:00:53 -0600
Message-ID: <87ldq0aauy.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Brigham Campbell <me@brighamcampbell.com> writes:

> Fix the following documentation build error, which was introduced when
> Documentation/arch/powerpc/htm.rst was added to the repository without
> any reference to the document.
>
> Documentation/arch/powerpc/htm.rst: WARNING: document isn't included in any toctree [toc.not_included]
>
> Fixes: ab1456c5aa7a ("powerpc/pseries/htmdump: Add documentation for H_HTM debugfs interface")
> Acked-by: Randy Dunlap <rdunlap@infradead.org>
> Tested-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
> ---
> Changes in v3:
>  - Edit commit message to conform better to de facto kernel development style.
>  - No changes to the diff.
>
>  Documentation/arch/powerpc/index.rst | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/arch/powerpc/index.rst b/Documentation/arch/powerpc/index.rst
> index 0560cbae5fa1..53fc9f89f3e4 100644
> --- a/Documentation/arch/powerpc/index.rst
> +++ b/Documentation/arch/powerpc/index.rst
> @@ -19,6 +19,7 @@ powerpc
>      elf_hwcaps
>      elfnote
>      firmware-assisted-dump
> +    htm
>      hvcs

Applied, thanks.

jon
