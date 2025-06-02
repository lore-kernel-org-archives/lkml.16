Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21E0722301;
	Mon,  2 Jun 2025 21:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748900655; cv=none; b=e/6SrHELiUCg8pztCl8SO0lCX9ApVh8nLJUGeWxhYJ/FE/ozCHaUKbnHAVB9PTE4JCQQWZo5Fb04t2c55KtCy3zIK9Jo20oM36dgZKYrqysQQnQ/0AD96xq/VP/f4a8M1PlTQ4xoFbhVbH9z9cKD3WzlbTWR+lXrlw3jDsKmjRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748900655; c=relaxed/simple;
	bh=BVPtXkgFTqznEmGzTWlIYy6Gd9G2jilHL2SBLhog4gw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=vDjFenRHPGP+pt2CDN6231X+MzHRvoxGH+AuXz9qz2cVOGxgiOrIqvNLjBRaIwIIApnTXRGGoGkWiLERQ0q0bNoH8LMcxklCq4ZTt4Hl/CSWVOU+yLKuLjGY2NDxhLaGAkwOSaRaFhYS3KgXKBloKzjCIvaawGSiP1lsiRR7/Rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=Asn9VQpg; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="Asn9VQpg"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 6FD9241A90
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1748900336; bh=Ul6JEfvKkXn4Ju4PyxymsrKGgYLL2i0zjIICcAO4IMg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Asn9VQpgN2Mti+VN4ioSRnUmD+EusZs8NWND6DgufnAzjzf7Gkukg9+dCnJzEllbc
	 KBIbQ7Bt4qYaERC5XQC9vB+BTIOycmvrFCuoEqUz8H9BwUf0ZQPgXVPeYg5etNmFoT
	 I7JKJWJcUwAKsZe+Cd3a9pvAKZvyQZt6GBzQIcyyWgVU0iKJOYjjhYFAZoEIR1nGKj
	 VRxI6pLnllf3577zYF4V6TEqS+vAzUGmNOacZHxR2i8Pnmjgjx6OJaAgyXfrpqqUyK
	 wwT8FVmy8rXBaMPfp6KWgwKWsmixhteTpkmMgYdKwiZJUvyBgqKQc0dJhv5jLi8TpU
	 YVgYVUWOtYE8g==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 6FD9241A90;
	Mon,  2 Jun 2025 21:38:56 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Andrew Morton
 <akpm@linux-foundation.org>
Cc: Suren Baghdasaryan <surenb@google.com>, "Liam R . Howlett"
 <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, Shakeel Butt
 <shakeel.butt@linux.dev>, Jann Horn <jannh@google.com>, Qi Zheng
 <zhengqi.arch@bytedance.com>, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs/mm: expand vma doc to highlight pte freeing,
 non-vma traversal
In-Reply-To: <20250602210710.106159-1-lorenzo.stoakes@oracle.com>
References: <20250602210710.106159-1-lorenzo.stoakes@oracle.com>
Date: Mon, 02 Jun 2025 15:38:55 -0600
Message-ID: <87bjr59634.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Lorenzo Stoakes <lorenzo.stoakes@oracle.com> writes:

> --- a/Documentation/mm/process_addrs.rst
> +++ b/Documentation/mm/process_addrs.rst
> @@ -303,7 +303,9 @@ There are four key operations typically performed on page tables:
>  1. **Traversing** page tables - Simply reading page tables in order to traverse
>     them. This only requires that the VMA is kept stable, so a lock which
>     establishes this suffices for traversal (there are also lockless variants
> -   which eliminate even this requirement, such as :c:func:`!gup_fast`).
> +   which eliminate even this requirement, such as :c:func:`!gup_fast`). There is
> +   also a special case of page table traversal for non-VMA regions which we

The "!gup_fast" caught my attention - I was unaware that Sphinx had such
a thing.  Its purpose would be to appear to suppress the generation of the
link that turns the cross reference into a cross reference.

The MM docs are full of these, do we know why?

I would recommend removing them unless there's some reason I don't see
for doing this.  Also get rid of the :c:func: noise entirely - just
saying gup_fast() will do the right thing.

> +.. note:: Since v6.14 and commit 6375e95f381e ("mm: pgtable: reclaim empty
> PTE + page in madvise (MADV_DONTNEED)"), we now also free empty PTE tables
> + on zap. This does not change zapping locking requirements.

As a general rule, the docs should represent the current state of
affairs; people wanting documentation for older kernels are best advised
to look at those kernels.  Or so it seems to me, anyway.  So I'm not
sure we need the "since..." stuff.

Thanks,

jon
