Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0679D298CAE
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 20:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747082703; cv=none; b=SPwWiuLNW6QcqDmZg7khlnS5im62CA+l3LdabW0r/wqhYDQii6o89MaoLyAZ8qTzQDbdU1Bymw6cAQ4qfLlOxzhKmd2KbplnPvCUTreuNm/BUJeeBVNsR8X+CAGHuERB/H4rUKBP3ALAz6qSU5QerJTvUMjhSgDRssZNoY1Zq/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747082703; c=relaxed/simple;
	bh=Cly3ilsjS0XRzgF3hcHJNrzf9HoincfhdLKioF6KkrM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QG8L285M8yeaWFq5qunkHIAy55NS0xjl2NDLRf2tLpquaacHp50crDHEWk/Mo8xg1BAedQdJtJ0uJBz9tblPShcx7owCUrIQz+hy/Zz28fqsJr+I29uvvo5fJDWwhqAhdAdR09u8/MdNd1GVZQyJgsKM1xEjXkiPHG3VCJ5HsAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d62fv+0n; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d62fv+0n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BACFC4CEE7;
	Mon, 12 May 2025 20:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747082702;
	bh=Cly3ilsjS0XRzgF3hcHJNrzf9HoincfhdLKioF6KkrM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d62fv+0nwSgUjYqcu64CH9Mgyy9Nm91sfwXVM31cTie66lRDPI9AF3eUemDZ/w9X9
	 rmPWweuJEQTSoTBGMud54t64UqmCVUaT/S9niiOy34jXGMdY2IIQRXoOvkTF915aJz
	 lrcr9pbzU3tvh9yHKnuxMrDRLtioeqtJuLFeZCwIAQkjOny32/B856oZk29CxzWYFP
	 WuOPXD8doN6InRnQIAb3uIq89ABCrOIw7Lvxjvngz/xBPJff5C7z1KtJlSmJNBWg5D
	 OhQ8f15MzUQyO6b7bfjiYRhPaPm99wOq0K9ahOV8dB6JX2xbGe3Q0BOsDIIqvy3Zk8
	 m46wUGL3XQtzw==
Date: Mon, 12 May 2025 13:44:59 -0700
From: Kees Cook <kees@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	kunit-dev@googlegroups.com
Subject: Re: [PATCH] MAINTAINERS: add crc_kunit.c back to CRC LIBRARY
Message-ID: <202505121344.4ED1902A1@keescook>
References: <20250511052151.420228-1-ebiggers@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250511052151.420228-1-ebiggers@kernel.org>

On Sat, May 10, 2025 at 10:21:51PM -0700, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> Restore lib/tests/crc_kunit.c to CRC LIBRARY following the rename in
> commit db6fe4d61ece ("lib: Move KUnit tests into tests/ subdirectory")
> which made it no longer match the file pattern lib/crc*.
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
> 
> I'm planning to take this patch via the crc tree.

Oops, thanks!

Reviewed-by: Kees Cook <kees@kernel.org>

-Kees

> 
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c59316109e3f8..ac70e19c53cfd 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6251,10 +6251,11 @@ S:	Maintained
>  T:	git https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git crc-next
>  F:	Documentation/staging/crc*
>  F:	arch/*/lib/crc*
>  F:	include/linux/crc*
>  F:	lib/crc*
> +F:	lib/tests/crc_kunit.c
>  F:	scripts/gen-crc-consts.py
>  
>  CREATIVE SB0540
>  M:	Bastien Nocera <hadess@hadess.net>
>  L:	linux-input@vger.kernel.org
> 
> base-commit: 46e3311607d6c18a760fba4afbd5d24d42abb0f3
> -- 
> 2.49.0
> 

-- 
Kees Cook
