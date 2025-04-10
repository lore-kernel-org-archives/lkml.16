Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A981E1E10
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 08:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744274127; cv=none; b=TPpRp5m5r4jqBAY7gF06z366fcwZEHTVnpqo8WoUb+BG7ZgZpMVAVMud4OYXfkk1P76Y5ff1yp/r+3MGjkkVxPIb32WBL/Z9LK477POAE7KItGg7ELh80yXH7iThHKrap26vQcgAxkVBxC1NHuDOlHdrfIT5HHtDZVg2sKn5U3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744274127; c=relaxed/simple;
	bh=vm+n/DN3r38uNGuHnCe/hDNr8ZYmr9HpOBN6gHBJQ8I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R75wkJPsZMAuzLcVIPADRNv4XiaR0RUgg3AopfyuYCY6CmY8NrkajsxXEcepsXoGbrNLSw97+dXYXTaSyu7awFdUGysSH9IL1OqmcV3UjudJGfk5tXRvPNZ1RNZ8QEfJs/QjHn1N386d6zvqMtCdAlSeXxn2MrEUgvoy/j1qo+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=i2qeRoQe; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="i2qeRoQe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744274124;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CxHaTazFkHPO5uhaMckeowRpsl34ZLTSQwo1R7YrUH0=;
	b=i2qeRoQeiCRnQV3PF4HK3ZjUQdodtlDPccRse3l4Bx+R+K1g0sBWZEHuPhFxtTnOTj7paY
	lvAM40E99nfWbksUqZWYzSRZGsNeMWTUfbtsIJU3pTmpspiaoAWPfurISt+tW8pX3nv7Id
	YeMs6zfa8AhsfY1/DFfgYZhtfZcbbBg=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-17-vXEc_BuaNT2-A0S-b0lwlQ-1; Thu,
 10 Apr 2025 04:35:22 -0400
X-MC-Unique: vXEc_BuaNT2-A0S-b0lwlQ-1
X-Mimecast-MFC-AGG-ID: vXEc_BuaNT2-A0S-b0lwlQ_1744274121
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6680F1801A12;
	Thu, 10 Apr 2025 08:35:21 +0000 (UTC)
Received: from localhost (unknown [10.72.112.38])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id EE3683001D11;
	Thu, 10 Apr 2025 08:35:18 +0000 (UTC)
Date: Thu, 10 Apr 2025 16:35:09 +0800
From: Baoquan He <bhe@redhat.com>
To: Kemeng Shi <shikemeng@huaweicloud.com>
Cc: akpm@linux-foundation.org, sj@kernel.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [patch] mm: swap: add __maybe_unused attribute for
 swap_is_last_ref() and update it's comment
Message-ID: <Z/eCvQpn0gE75crD@MiWiFi-R3L-srv>
References: <20250410153908.612984-1-shikemeng@huaweicloud.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410153908.612984-1-shikemeng@huaweicloud.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

On 04/10/25 at 11:39pm, Kemeng Shi wrote:
> Add __maybe_unused attribute for swap_is_last_ref ()to fix following
> building warning:
> mm/swapfile.c:1517:20: warning: function 'swap_is_last_ref' is not needed and will not be emitted [-Wunneeded-internal-declaration]
>     1517 | static inline bool swap_is_last_ref(unsigned char count)
>          |                    ^~~~~~~~~~~~~~~~
>    1 warning generated.
> 
> Besides, original comment for swap_entries_free() is placed before
> swap_is_last_ref() which may introduce confusion. Update comment to
> address this.
> 
> Fixes: 6bb001b6b64ec ("mm: swap: enable swap_entry_range_free() to drop any kind of last ref")
> Suggested-by: Baoquan He <bhe@redhat.com>
> Tested-by: SeongJae Park <sj@kernel.org>
> Signed-off-by: Kemeng Shi <shikemeng@huaweicloud.com>
> ---
>  mm/swapfile.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)

LGTM,

Reviewed-by: Baoquan He <bhe@redhat.com>

> 
> diff --git a/mm/swapfile.c b/mm/swapfile.c
> index c46b56d636af..4b5fc0c33a85 100644
> --- a/mm/swapfile.c
> +++ b/mm/swapfile.c
> @@ -1537,15 +1537,19 @@ static bool swap_entries_put_map_nr(struct swap_info_struct *si,
>  }
>  
>  /*
> - * Drop the last ref(1, SWAP_HAS_CACHE or SWAP_MAP_SHMEM) of swap entries,
> - * caller have to ensure all entries belong to the same cgroup and cluster.
> + * Check if it's the last ref of swap entry in the freeing path.
> + * Qualified vlaue includes 1, SWAP_HAS_CACHE or SWAP_MAP_SHMEM.
>   */
> -static inline bool swap_is_last_ref(unsigned char count)
> +static inline bool __maybe_unused swap_is_last_ref(unsigned char count)
>  {
>  	return (count == SWAP_HAS_CACHE) || (count == 1) ||
>  	       (count == SWAP_MAP_SHMEM);
>  }
>  
> +/*
> + * Drop the last ref of swap entries, caller have to ensure all entries
> + * belong to the same cgroup and cluster.
> + */
>  static void swap_entries_free(struct swap_info_struct *si,
>  			      struct swap_cluster_info *ci,
>  			      swp_entry_t entry, unsigned int nr_pages)
> -- 
> 2.30.0
> 

