Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1FC8283FF1
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 18:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750184751; cv=none; b=pl0aRLqggIPSn4fyuspi5gU/ZZd+4idcFJPflsfPiHXYQ6yyDSf28uBu1geOVC+ULCqKPkFlofLrUHJKh8PDxFoC2yaXO+iG//JNXKnpTMR7mZsbv6z59Ted9XfgZPiz+2lPqADZjDEWPKF5844t9TxM+fa/kkhVF987sjRL6fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750184751; c=relaxed/simple;
	bh=YSN4kBaKYewWU8qZ5+1Pm9k9exH+PhrG5dLr/jPnkm8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JsSUzpUrqiNOxbokIPyBog7rJEMActJjmtS0JN4F2BeqtWD6Gl2KP4cUibib7DhV88T4zwS9Vwm9rmYUzKNIF5CxskJ3NYyf2il/cjOuWdQxi4gP3o1B0KS8p+9i8g9pBSmEhW9/QlaSGjxf569w6FPmO+Qa53dn90N3yyPUGZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XPovYWGO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XPovYWGO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35B19C4CEF1;
	Tue, 17 Jun 2025 18:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750184750;
	bh=YSN4kBaKYewWU8qZ5+1Pm9k9exH+PhrG5dLr/jPnkm8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XPovYWGOdVYtVzaO8Tc4xhKDix6A54zZGx/Ipzr7OVKeNqBA4ZL26VLdJy35HoT34
	 mxpRssMaj5qAIhZNSbpGlh7HiqI8jCm8wwUpWLMpZU3+XbpBaWVGN6PvePECVuUpZI
	 zfSe/ijEvDtvB9VejoghYwjW91+W3rmQC2l5DaDym0TiWjGwnmXqlbIILZFAmQf0fI
	 TlpsCKZ+eKEZVU+ph8jtyPu/iCzAvPloOPduwLQUMS7zlKMkHETmV51qeYpNseElio
	 1V2Zx1+o3yu60LeAXyA2V4ZaMnTqC1q25cK8ZMc4w0z3e+mGvc24230REDHW5OfWrH
	 NI+rVYG3Tig0Q==
Date: Tue, 17 Jun 2025 21:25:45 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH] MAINTAINERS: add further init files to mm init block
Message-ID: <aFGzKZ_LyS0htQgB@kernel.org>
References: <20250617174538.188977-1-lorenzo.stoakes@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250617174538.188977-1-lorenzo.stoakes@oracle.com>

On Tue, Jun 17, 2025 at 06:45:38PM +0100, Lorenzo Stoakes wrote:
> These files comprise the bootmem info logic which is initialised on startup
> and also memory tests that are run on startup and as such this seems the
> most appropriate section for them.
> 
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

> ---
>  MAINTAINERS | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 08045f9efadd..1d24399643f3 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15679,8 +15679,11 @@ S:	Maintained
>  F:	Documentation/core-api/boot-time-mm.rst
>  F:	Documentation/core-api/kho/bindings/memblock/*
>  F:	include/linux/memblock.h
> +F:	mm/bootmem_info.c
>  F:	mm/memblock.c
> +F:	mm/memtest.c
>  F:	mm/mm_init.c
> +F:	mm/rodata_test.c
>  F:	tools/testing/memblock/
>  
>  MEMORY ALLOCATION PROFILING
> -- 
> 2.49.0
> 

-- 
Sincerely yours,
Mike.
