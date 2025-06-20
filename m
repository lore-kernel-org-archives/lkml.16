Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 759691DC075
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 17:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750442187; cv=none; b=DAFriC6OZ+73wssBnFmrhibJlElGVEzUvmw4q7TYznYftYKF8BkE84p21TP2lMWdzLFIyL3e2zlvqP1upn2mG9m4bfx5KA8WN3SXiTCenOF0uI8v5b3g4vm119vEARiE/UPBZIjxbyUyimQGLXm9G9L0RosgTZluoVvL3RZZfT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750442187; c=relaxed/simple;
	bh=Wkc/tqdrdZQXATgu16su4gqQwzb6rMAGxAVUJLWfZDo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ub2Zgb96OcMnhuxWEEvUDPJlpZt6BpTy/BGFXP4ydzzJ4R2Ay64F2U/PMjIHPCkrQpBz/hHy5fS6qLaGytQnCft1ylCmFXrD7wTiwuFTxejprHAuldQ0unfuvrSrkXSndNRSj+SThOhMTzqdaKyS0P+8Bf8ZZEiU4XOoCCY1TU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uNuXudnY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uNuXudnY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC664C4CEE3;
	Fri, 20 Jun 2025 17:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750442187;
	bh=Wkc/tqdrdZQXATgu16su4gqQwzb6rMAGxAVUJLWfZDo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uNuXudnYV6BaF4jJ6bg7mCFJ3GnV2CYHEPCi4L5NxEe3+t1u+Lt0QzHBJgzs1Yz7W
	 qW+X+qKmAJhXto7bvQ2H6HS5bpFvS91QRJmU1xrEi2qnEGes3D7tBUhMJ5vSRCGbdv
	 jMH7MQOVE7UgKcH1JIUoTrPoR15UUxXGzE6S12D842CDua4miNjHmWgaPcSbMeBrPO
	 BQwL1G9hfDaTpJGaUZXDMJnAHVmUgCxtZxwdVHU4DGGSWwW7VBL8LZb3udpA+5wpZL
	 lf831z3e0mdbQIUWOwdj+DjFXAg7g+bE428IRCFNzDlgjXbxdm7HTXXsC6+U3kcS0+
	 TBEmqCSw5MU4Q==
From: SeongJae Park <sj@kernel.org>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: SeongJae Park <sj@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Nico Pache <npache@redhat.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	Jann Horn <jannh@google.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Lance Yang <ioworker0@gmail.com>,
	Suren Baghdasaryan <surenb@google.com>
Subject: Re: [PATCH v2 4/5] mm/madvise: thread all madvise state through madv_behavior
Date: Fri, 20 Jun 2025 10:56:22 -0700
Message-Id: <20250620175622.96449-1-sj@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <7b345ab82ef51e551f8bc0c4f7be25712871629d.1750433500.git.lorenzo.stoakes@oracle.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 20 Jun 2025 16:33:04 +0100 Lorenzo Stoakes <lorenzo.stoakes@oracle.com> wrote:

> Doing so means we can get rid of all the weird struct vm_area_struct **prev
> stuff, everything becomes consistent and in future if we want to make
> change to behaviour there's a single place where all relevant state is
> stored.
> 
> This also allows us to update try_vma_read_lock() to be a little more
> succinct and set up state for us, as well as cleaning up
> madvise_update_vma().
> 
> We also update the debug assertion prior to madvise_update_vma() to assert
> that this is a write operation as correctly pointed out by Barry in the
> relevant thread.
> 
> We can't reasonably update the madvise functions that live outside of
> mm/madvise.c so we leave those as-is.
> 
> Acked-by: Zi Yan <ziy@nvidia.com>
> Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

Found a very trivial nit below.  Other than that,

Reviewed-by: SeongJae Park <sj@kernel.org>

[...]
> @@ -1607,23 +1615,19 @@ int madvise_walk_vmas(struct madvise_behavior *madv_behavior)
>  	struct madvise_behavior_range *range = &madv_behavior->range;
>  	/* range is updated to span each VMA, so store end of entire range. */
>  	unsigned long last_end = range->end;
> -	struct vm_area_struct *vma;
> -	struct vm_area_struct *prev;
>  	int unmapped_error = 0;
>  	int error;
> +	struct vm_area_struct *vma;

A very trivial nit.  We could just keep old 'struct vm_area_struct *vma'
declaration.


Thanks,
SJ

[...]
