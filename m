Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 977EB13AD05
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 06:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748932316; cv=none; b=chZRJmoReIq5Qkf7OXNYx1qQkJrwRkJEsIF2ztTaEEEU2RYTY3tbYua7y3NjHk8YnCWDMjK+qqjultxTCo+5VpGlg7cwO6kVBuwYj7LYoeNlwl73tNQRBFmr2jSwJshfdnc0a76HSSxAkAlIK9qMQr9MgE5M7DYOV2ZSvlG1JVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748932316; c=relaxed/simple;
	bh=XQo9fDvD2YihXDD5sUzWDL7i7NgwHxES32sHZYgo+80=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q1zfBdoGDUAz6AxzZlUa/vHora6PjfNqEVspSDNTutTPXFx1udGEjlfepYioXEL0Jr0xRHzieyoD64Md4kZcQ4skg4g8ArLpmbZls+pSl3KwJau57lzzuaXrOYgmLKyg+KoGeJOEb/6Zbadn6pqnUW3hyyv/zq7S5CHXqcoAc20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tliTWB/A; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tliTWB/A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9845C4CEED;
	Tue,  3 Jun 2025 06:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748932316;
	bh=XQo9fDvD2YihXDD5sUzWDL7i7NgwHxES32sHZYgo+80=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tliTWB/ABtE+huZBN6ZBvcdetSTa0w35dQubD36R8K1vunfvz82nIl9/z0ofkZpBz
	 lO+vp3epcHoF5NvWrSZ1tnTGeKNUwlHG3U7uLQh8GIHiWzypeI7p8Adg4ci80U+Ksp
	 Z9626OWl8fLJDkeVscKChctdACL93mIkn1y9SFURm4GUBoQhnrtNC59yP5Zi1hghz9
	 RlkyWSYVGAPmzgZ/8KruxKHFYLOAMDcgLZSpTG75bHBW/0Em3zSIgLQPeEHSJ3+b9A
	 55YHiDxjHBaEaG8M/BrEMH8sXdoSIOC5rlP1WUrd3KIE/iC6OUWeQQvD55EygZtWx0
	 fTLeLxywbAycQ==
Date: Tue, 3 Jun 2025 09:31:48 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Zi Yan <ziy@nvidia.com>,
	Juan Yescas <jyescas@google.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm: Kconfig: Use verb *use* in plural form in description
Message-ID: <aD6W1JRDbUKt0m7j@kernel.org>
References: <20250603061303.479551-2-pmenzel@molgen.mpg.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250603061303.479551-2-pmenzel@molgen.mpg.de>

On Tue, Jun 03, 2025 at 08:13:03AM +0200, Paul Menzel wrote:
> *workloads* is plural requiring the verb *use* in plural form.
> 
> Fixes: e13e7922d034 ("mm: add CONFIG_PAGE_BLOCK_ORDER to select page block order")
> Signed-off-by: Paul Menzel <pmenzel@molgen.mpg.de>

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

> ---
> Reading the sentence it feels like, something is missing before the
> *please*, but I am no native speaker.
> 
>  mm/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/mm/Kconfig b/mm/Kconfig
> index f8bb8f070d0d..e3a07687ed0b 100644
> --- a/mm/Kconfig
> +++ b/mm/Kconfig
> @@ -1022,7 +1022,7 @@ config PAGE_BLOCK_ORDER
>  	  or MAX_PAGE_ORDER.
>  
>  	  Reducing pageblock order can negatively impact THP generation
> -	  success rate. If your workloads uses THP heavily, please use this
> +	  success rate. If your workloads use THP heavily, please use this
>  	  option with caution.
>  
>  	  Don't change if unsure.
> -- 
> 2.49.0
> 

-- 
Sincerely yours,
Mike.
