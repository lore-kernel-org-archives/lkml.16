Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23F0E21B91F
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 21:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750973973; cv=none; b=Nu4jpO8BLxJVmM2MqVrsORQRsshYiqfrZTmPLG9nhZNdLmbDammkZvxIYKZoglxEgOODDeoCrw/WzwPqTFj9qJWe23V33wMDHi2CrMcIv5CdDmNKdp0IIWsXoxD1AU2N+5yNnE7kfFG2iwOdm7RPFFrkzGHRdHvO6mzhXX5S00Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750973973; c=relaxed/simple;
	bh=x69QRK5RucHC+6csbFYWaWitPETwel9PsQ4R9TfS79M=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=hue59Nj8SF6R4yRv3e3tlfJ1KWpaxj0UE1bCBKCkYt6DKvenuOrFWu4E0abs61mTtHj4VkY+Bqt8WfrTH0z35EC7L2btdHRQeHAdnJfhCvBP0/XyBwOJer4jSeIHZic+UoxfXgzIw4Edg8grEk5/PTCHp+cm1W1AMzd38jp/l0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=a/tR3+7V; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="a/tR3+7V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FA28C4CEEB;
	Thu, 26 Jun 2025 21:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1750973970;
	bh=x69QRK5RucHC+6csbFYWaWitPETwel9PsQ4R9TfS79M=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=a/tR3+7VlwCB16OuZnu7kef+T2i84B5dk13XMNTjd/UqdZmWmOnKUeFFdu44NqFDF
	 TiQ225pHCcAUNz2U2kwDGry8PYe/v6YE3Aj/TBlilp92/KzDZ8HRa/NzKjKbrDEAXO
	 qkS+YRR6O9YFmvfvEzDbQL8au8Bim0G8IG1fqtAs=
Date: Thu, 26 Jun 2025 14:39:29 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Luiz Capitulino <luizcap@redhat.com>
Cc: david@redhat.com, willy@infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, lcapitulino@gmail.com, shivankg@amd.com
Subject: Re: [PATCH 1/3] mm: introduce snapshot_page()
Message-Id: <20250626143929.a7f2bcbb8e90290f23af452e@linux-foundation.org>
In-Reply-To: <4a9745dd2989f7d5bf5bc69c37fc3e3cfda37e87.1750961812.git.luizcap@redhat.com>
References: <cover.1750961812.git.luizcap@redhat.com>
	<4a9745dd2989f7d5bf5bc69c37fc3e3cfda37e87.1750961812.git.luizcap@redhat.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 26 Jun 2025 14:16:51 -0400 Luiz Capitulino <luizcap@redhat.com> wrote:

> This commit refactors __dump_page() into snapshot_page().
> 
> snapshot_page() tries to take a faithful snapshot of a page and its
> folio representation. The snapshot is returned in the struct
> page_snapshot parameter along with additional flags that are best
> retrieved at snapshot creation time to reduce race windows.
> 
> This function is intended to be used by callers that need a stable
> representation of a struct page and struct folio so that pointers
> or page information doesn't change while working on a page.
> 
> The idea and original implemenetation of snapshot_page() comes from

tpyo!

> Matthew Wilcox with suggestions for improvements from David Hildenbrand.
> All bugs and misconceptions are mine.
>
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -4184,4 +4184,24 @@ static inline bool page_pool_page_is_pp(struct page *page)
>  }
>  #endif
>  
> +#define PAGE_SNAPSHOT_FAITHFUL     (1 << 0)
> +#define PAGE_SNAPSHOT_PG_HUGE_ZERO (1 << 1)
> +#define PAGE_SNAPSHOT_PG_FREE      (1 << 2)
> +#define PAGE_SNAPSHOT_PG_IDLE      (1 << 3)
> +
> +struct page_snapshot {
> +	struct folio folio_snapshot;
> +	struct page page_snapshot;
> +	unsigned long pfn;
> +	unsigned long idx;
> +	unsigned long flags;
> +};
> +
> +static inline bool snapshot_page_is_faithful(const struct page_snapshot *ps)
> +{
> +	return ps->flags & 0x1;'

	& PAGE_SNAPSHOT_FAITHFUL?

> +}
> +

All looks sane to me.  Small-system people (are there any left?) might
point out that all the new code could be under ifdef CONFIG_PROCFS?

I'll skip v1, see what reviewers have to say, thanks.
