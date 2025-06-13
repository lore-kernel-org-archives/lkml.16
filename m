Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B35F22E11D5
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 16:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749830533; cv=none; b=TjvCBSosE0k6MieVDy+VgjlCRpsXmyGYe99gDSMe08gnqBN4v2PfEaW5B/1E9OwbGAIh3KHbs+Rj4WMZYdsWHwtfN72qGuMLYX7kpinuCH25zkAoB3qF2E2HpU9PgiSVT3bKg2kn5jcs42cnEqZDJwTHX0x6nWKLLXzlHXDyjz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749830533; c=relaxed/simple;
	bh=jPCR+LaBbmEVU4VOICWsIxHc0vZRsHldHenJthMW508=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JTNsFQWLpr+XjprpKVVYlrvT+fVD7UJhhlAjC6fUlybjug7hgJK/vuLqrpUvPsZi8cKDaCZxEuvHim6rK4ngYnjNyraNvahWHORhqfIF1Scgk6XTrdxf12g+g03Q1piW/Xk3z2qxkQW7gDTWSw4IoIZSTqtzCM0FQDa8Bco6jJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LnZZPTDd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LnZZPTDd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 632DAC4CEF3;
	Fri, 13 Jun 2025 16:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749830533;
	bh=jPCR+LaBbmEVU4VOICWsIxHc0vZRsHldHenJthMW508=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LnZZPTDdkoWT2wctmLLuh3mC8dVrKFZ2Z8qXDRG51qvd7juxbjBkGtoL1a1JQJ+cv
	 nlKRQVKXOpnZlz7pso+b3fsbiknZvc6fVpcXleAIX3QarFksaH3wioVPWjCVVHcQk4
	 W6mq8YjUKBzcPeea9S1P0myPE0cb6LAfqnxJfF0vD+cs9UHF4y8cYzGY8trztQns8E
	 OlrK0NAWP8ws1v0brH+qGLsMpQFJQdBg/XBRQr5+BAltVlutwsjreiNsnOvh4pUAEa
	 mk4Cop8gxdLouJcF9YyVRkS/f+N5lRWW1nLBlfDV0QJz6cU8Pa8Lwc40a2FGhf0MYj
	 dr6Y0K/l/a0Nw==
Date: Fri, 13 Jun 2025 19:02:06 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Alexander Graf <graf@amazon.com>, Changyuan Lyu <changyuanl@google.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <bhe@redhat.com>, Pratyush Yadav <ptyadav@amazon.de>,
	kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH] MAINTAINERS: add linux-mm@ list to Kexec Handover
Message-ID: <aExLfnFrpgoJBjTA@kernel.org>
References: <20250613131917.4488-1-pratyush@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250613131917.4488-1-pratyush@kernel.org>

On Fri, Jun 13, 2025 at 03:19:14PM +0200, Pratyush Yadav wrote:
> From: Pratyush Yadav <ptyadav@amazon.de>
> 
> Along with kexec, KHO also has parts dealing with memory management,
> like page/folio initialization, memblock, and preserving/unpreserving
> memory for next kernel. Copy linux-mm@ to KHO patches so the right set
> of eyes can look at changes to those parts.
> 
> Signed-off-by: Pratyush Yadav <ptyadav@amazon.de>

Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 99fbde0077927..7a0bc21d906bd 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -13346,6 +13346,7 @@ M:	Alexander Graf <graf@amazon.com>
>  M:	Mike Rapoport <rppt@kernel.org>
>  M:	Changyuan Lyu <changyuanl@google.com>
>  L:	kexec@lists.infradead.org
> +L:	linux-mm@kvack.org
>  S:	Maintained
>  F:	Documentation/admin-guide/mm/kho.rst
>  F:	Documentation/core-api/kho/*
> -- 
> 2.47.1
> 

-- 
Sincerely yours,
Mike.
