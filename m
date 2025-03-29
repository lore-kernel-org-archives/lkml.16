Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80A8D35959
	for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 09:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743239484; cv=none; b=q4E/KH5UVq3nds2czji78LQolXJ5+0tv9ph4NLp5NDTKhUlB3pddjj5gBK1ULJACV5vbfTjnrnVOGNBPh9Vkb1SF6JoYDt2AU+0Pgc2sNt65ig1DYXdaIcwHpK5YzYQ+JGZIShQiYjRS1rTksAqBHlM51oyyiYVCY/oTwfqbROY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743239484; c=relaxed/simple;
	bh=8Xkug/LH7TrCkz1sdJZ3dz+PP7MP1YUbylsTLrJ9G8Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=LKkuiGQHKXkOxR53QeJ5iUoIlJuU65BgfFbE3+OOP81qIC0v8uRFbNwK9PVz1D4adEeFE6lFxbeUAcl8rhh8Bs8JbGl04VbD1Ye4RhUVyMpF2/VSWgbH0U6+62SMkMHxTCdzgkypqZ4vRen+h9AWnOZ+x18WpZ8oCn/i7G6X9M8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; spf=pass smtp.mailfrom=ellerman.id.au; dkim=pass (2048-bit key) header.d=ellerman.id.au header.i=@ellerman.id.au header.b=UjPmF/0W; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ellerman.id.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ellerman.id.au header.i=@ellerman.id.au header.b="UjPmF/0W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1743239475;
	bh=PG07tL+Y0H/qBBYy99tJTr1QzjohoQ87Q5SRquO/ses=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=UjPmF/0WsFqfzCZ25WR5X7bBuTApeNjqGKXSNraNYwNj3URKO8K5v0crtvy/g5OWC
	 r3X41uYC7LTFNIAH7UnmOqBfuPqiBtsn1G65Tyl1RNTNcERC6zefkxDGqCTcdneZ2L
	 8kwIu3A8UyzWgADIRkgizOj6r8OqOex8JsT7eZaJlcBA/B728NcL2mCiKOpxAOut5f
	 jSOe1LUl7RN+011FRNnfaYbcGiz4tCXy+vScOcMe2bQ7cdwyOcVueetYsSBmoX4D9c
	 D9IAlwH3XzsoUCls6ys75AX6IfMcaipnzdK1AIrv8YoC9A/mMqdJOKY5ak3iPhHE4C
	 anSaiwwVAhj4A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZPs7z5CH5z4x8W;
	Sat, 29 Mar 2025 20:11:11 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Michal Suchanek <msuchanek@suse.de>, linuxppc-dev@lists.ozlabs.org
Cc: Michal Suchanek <msuchanek@suse.de>, Madhavan Srinivasan
 <maddy@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Christophe
 Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>,
 Nicolas Schier <nicolas@fjasle.eu>, Masahiro Yamada
 <masahiroy@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 linux-kernel@vger.kernel.org, "Nysal Jan K.A." <nysal@linux.ibm.com>
Subject: Re: [PATCH v2] powerpc/boot: Fix build with gcc 15
In-Reply-To: <20250314092528.15506-1-msuchanek@suse.de>
References: <Z86liwlwP5WvrEkw@kitsune.suse.cz>
 <20250314092528.15506-1-msuchanek@suse.de>
Date: Sat, 29 Mar 2025 20:11:08 +1100
Message-ID: <875xjsjj6b.fsf@mpe.ellerman.id.au>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Michal Suchanek <msuchanek@suse.de> writes:
> Similar to x86 the ppc boot code does not build with GCC 15.
>
> Copy the fix from
> commit ee2ab467bddf ("x86/boot: Use '-std=gnu11' to fix build with GCC 15")
>
> Signed-off-by: Michal Suchanek <msuchanek@suse.de>
> ---
> v2: Move the fix outside of ifdef to apply to all subarchitectures
> ---
>  arch/powerpc/boot/Makefile | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
> index 1ff6ad4f6cd2..210c60d3d4cc 100644
> --- a/arch/powerpc/boot/Makefile
> +++ b/arch/powerpc/boot/Makefile
> @@ -32,6 +32,8 @@ else
>      BOOTAR := $(AR)
>  endif
>  
> +BOOTTARGETFLAGS	+= -std=gnu11
> +
 
BOOTTARGETFLAGS gets added to CFLAGS and AFLAGS.

I think -std=gnu11 should only be added to CFLAGS. In which case it'd be
better to add it directly to BOOTCFLAGS further down.

cheers
