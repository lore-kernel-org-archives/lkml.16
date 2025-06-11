Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F42F22CBD0
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 12:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749644603; cv=none; b=MANBAONjKWcp4jlPplT0O8vJkfQnxDxWFpRd4c6TLUbKQZlwzRGcXMPMMwECaGNITxvlC/saQRStLdvJqaMpN8kKbHLcnMGbEKqFdIFdsyppkmHmFMpnl4j5nnKgpOTHe5rxNdr54uLtch6DrpfSgidJLT5qZrnsTzlBdLx7FsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749644603; c=relaxed/simple;
	bh=qAIBoTbU/lac517I9f0eMnENz2xp/0peBDS5tMCiPa8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bFlNOsCCz82LUvTVG687uOK9Ncg3ef9/1CivF4yv0LMUk4uQ0D58kKtBgK4gRmkkQHOd7Nzgg2fGqag1RNkq5IMvoA+EsWWm1sqj28L7i6DkWeU3pxtaohI5tVy3RDIOQPtGDJkEWxMdIMACjsDy3xe90tGll8yyk97qsaJcdjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=gdrhmnIs; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="gdrhmnIs"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=H3ise0VFG8pfLlwhh4aDRYm/oyQ+lfeQt6Rofx90ivg=; b=gdrhmnIsyC8BRbmMYK105bCcx2
	0bxTfrt7cObwbW2wOoGgXjLSD/NfFS8g1G4chdbO/IdzPmmp5zRaU9wvrQFdIfK0kdbgwvxmfFR6A
	arfoq729S4omQ5nOFZqNwzqmngvAc8mx+JIez02iUF90u3J4xj8JmJZVYLBzAoTFsu1hH2p5+QUlc
	1WymyW6bAYwB2k/jwZ/bhIZ20g5YxeaPDDkBWUyzVHZN26paUZpZwjDoqeeF2tB4n6XW/pOorzJOP
	1l4Y+MezkJeKrUmBXDhzZEfHIGgI90vSRIMmJ9L4fogD92hNOO8sbZ9D/LpnDmSGnHzer6ev60Vq5
	ETSJRPAA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPKUA-00000002O5z-3zmC;
	Wed, 11 Jun 2025 12:23:19 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 238EC302F8E; Wed, 11 Jun 2025 14:23:17 +0200 (CEST)
Date: Wed, 11 Jun 2025 14:23:17 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Alexandre Chartre <alexandre.chartre@oracle.com>
Cc: linux-kernel@vger.kernel.org, mingo@kernel.org, jpoimboe@kernel.org
Subject: Re: [RFC 03/13] objtool: Disassemble code with libopcodes instead of
 running objdump
Message-ID: <20250611122317.GA2278213@noisy.programming.kicks-ass.net>
References: <20250606153440.865808-1-alexandre.chartre@oracle.com>
 <20250606153440.865808-4-alexandre.chartre@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250606153440.865808-4-alexandre.chartre@oracle.com>

On Fri, Jun 06, 2025 at 05:34:30PM +0200, Alexandre Chartre wrote:
> objtool executes the objdump command to disassemble code. Use libopcodes
> instead to have more control about the disassembly scope and output.
> 
> Signed-off-by: Alexandre Chartre <alexandre.chartre@oracle.com>
> ---
>  tools/objtool/Makefile                  |   2 +-
>  tools/objtool/arch/loongarch/decode.c   |   6 +
>  tools/objtool/arch/powerpc/decode.c     |   6 +
>  tools/objtool/arch/x86/decode.c         |   7 +
>  tools/objtool/check.c                   |   4 +-
>  tools/objtool/disas.c                   | 186 +++++++++++++++---------
>  tools/objtool/include/objtool/arch.h    |   5 +
>  tools/objtool/include/objtool/check.h   |   5 +
>  tools/objtool/include/objtool/objtool.h |   4 +
>  9 files changed, 154 insertions(+), 71 deletions(-)
> 
> diff --git a/tools/objtool/Makefile b/tools/objtool/Makefile
> index 8c20361dd100..00350fc7c662 100644
> --- a/tools/objtool/Makefile
> +++ b/tools/objtool/Makefile
> @@ -34,7 +34,7 @@ INCLUDES := -I$(srctree)/tools/include \
>  # is passed here to match a legacy behavior.
>  WARNINGS := $(EXTRA_WARNINGS) -Wno-switch-default -Wno-switch-enum -Wno-packed -Wno-nested-externs
>  OBJTOOL_CFLAGS := -Werror $(WARNINGS) $(KBUILD_HOSTCFLAGS) -g $(INCLUDES) $(LIBELF_FLAGS)
> -OBJTOOL_LDFLAGS := $(LIBELF_LIBS) $(LIBSUBCMD) $(KBUILD_HOSTLDFLAGS)
> +OBJTOOL_LDFLAGS := $(LIBELF_LIBS) $(LIBSUBCMD) $(KBUILD_HOSTLDFLAGS) -lopcodes

Would it be possible to make this optional? Such that when people do not
have libopcodes installed they can still build the kernel.

Or is libopcodes a mandatory part of any binutils installation?
