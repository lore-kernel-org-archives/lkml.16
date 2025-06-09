Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15564E571
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 00:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749430762; cv=none; b=FwvkhC9KAs7CENUJzg6WZDVcFSwlyr9dg5AMtbBYzESC2cS7RTJE8Hw//LwZRzGf1b+LpLf2nVea9q9XhmI3SUODnUHiNEapk1BFRXNhELxtXt9u2k/sYUmTe4EaM+mQi+hlBve1WHHq7GSwQ2vuNndPDAUvjeamz3D4Dn7ORgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749430762; c=relaxed/simple;
	bh=c6l9ufRRoGOscqC3FabhsY/Mo9ZiRC+yqg941zptjYA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=qNcjaaAusQVxrubIn6nxtJJW/Uo2++etSFQ7hyY7DggmYyx5cU+gx9upSR6oEumtXkzHaPzh2d0v1D8NRCpdi8Y6yjnB4uQp2uEX1iyW0gPgcSjFd/YfC7yZduBML+2Bjk3f4Nw3OFfIt6cOY7Wul0utkR/Bu6g71FhCa7z8p3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; spf=pass smtp.mailfrom=ellerman.id.au; dkim=pass (2048-bit key) header.d=ellerman.id.au header.i=@ellerman.id.au header.b=Ke5VAEJ9; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ellerman.id.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ellerman.id.au header.i=@ellerman.id.au header.b="Ke5VAEJ9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1749430756;
	bh=4/H+TmUR2tygGIxwAez9mPf8QusglDEHcU7sswYD2R8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Ke5VAEJ9Rwl5k9l3Doyp2lyQPAXjZY+2EQgYBxN/OHBA5sWtCWLY9tam0W86gfFRa
	 uIGLkLtjQAcitx3RJDcXQZunVLEn4q2J82Qq2+uNXHZFAUL6QMw1nsZaObRHg/YznW
	 zX+6cw9oSghPnxd/Mbf1DZUdV9n4vz/BGCFWwWAOodA7OiwF7m2ZasakbIdh8SbbO+
	 S7eQc+KJodiuFLzGAj43Df+k7qkfOp0qqRQZyPHF173GcsAfDr262oPs8EwJ4ELuds
	 zC9WJAccmYlY62nJoxKP3T5FzBSKlB3qopRRkN2LusgB+SxbXdkBAwxT6gUwDxAhAK
	 lY+GQpHtv1Mrg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bFtq8008Mz4wcZ;
	Mon,  9 Jun 2025 10:59:15 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Masahiro Yamada <masahiroy@kernel.org>, Madhavan Srinivasan
 <maddy@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Christophe
 Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>,
 linuxppc-dev@lists.ozlabs.org
Cc: Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] powerpc: unify two CONFIG_POWERPC64_CPU entries in the
 same choice block
In-Reply-To: <20250607102005.1965409-1-masahiroy@kernel.org>
References: <20250607102005.1965409-1-masahiroy@kernel.org>
Date: Mon, 09 Jun 2025 10:59:12 +1000
Message-ID: <875xh5wx0f.fsf@mpe.ellerman.id.au>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Masahiro Yamada <masahiroy@kernel.org> writes:
> There are two CONFIG_POWERPC64_CPU entries in the "CPU selection"
> choice block.
>
> I guess the intent is to display a different prompt depending on
> CPU_LITTLE_ENDIAN: "Generic (POWER5 and PowerPC 970 and above)" for big
> endian, and "Generic (POWER8 and above)" for little endian.

Yeah.

> I stumbled on this tricky use case, and worked around it on Kconfig with
> commit 4d46b5b623e0 ("kconfig: fix infinite loop in sym_calc_choice()").
> However, I doubt that supporting multiple entries with the same symbol
> in a choice block is worth the complexity - this is the only such case
> in the kernel tree.
>
> This commit merges the two entries. Once this cleanup is accepted in
> the powerpc subsystem, I will proceed to refactor the Kconfig parser.

OK. Sorry for the trouble.

It could be split into two symbols to keep the separate prompts, but it's
probably not worth the trouble.

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

cheers

> diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
> index 613b383ed8b3..7b527d18aa5e 100644
> --- a/arch/powerpc/platforms/Kconfig.cputype
> +++ b/arch/powerpc/platforms/Kconfig.cputype
> @@ -122,16 +122,11 @@ choice
>  	  If unsure, select Generic.
>  
>  config POWERPC64_CPU
> -	bool "Generic (POWER5 and PowerPC 970 and above)"
> -	depends on PPC_BOOK3S_64 && !CPU_LITTLE_ENDIAN
> +	bool "Generic 64 bits powerpc"
> +	depends on PPC_BOOK3S_64
> +	select ARCH_HAS_FAST_MULTIPLIER if CPU_LITTLE_ENDIAN
>  	select PPC_64S_HASH_MMU
> -
> -config POWERPC64_CPU
> -	bool "Generic (POWER8 and above)"
> -	depends on PPC_BOOK3S_64 && CPU_LITTLE_ENDIAN
> -	select ARCH_HAS_FAST_MULTIPLIER
> -	select PPC_64S_HASH_MMU
> -	select PPC_HAS_LBARX_LHARX
> +	select PPC_HAS_LBARX_LHARX if CPU_LITTLE_ENDIAN
>  
>  config POWERPC_CPU
>  	bool "Generic 32 bits powerpc"
> -- 
> 2.43.0
