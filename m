Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B73B221260
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 17:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749664751; cv=none; b=r17HMMoYfcpS36lJCgM5uzO0sarVp+DPQ8wCTcqYMZq+d1JehpIfCiFoKubUC2pj5a4tCti1eDRh8mwnh1k+AU2xjlVsuP/CsFYpJlyPocLAG7F33N7L7O4ivb0ejMetmfT81HAkn7w9pPbG6Wp5LBwXJVfbiRFM8tetpYDAJpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749664751; c=relaxed/simple;
	bh=YfKUtnN3UtlVflQXWWmtqpHbqcPJk8dujyWLgspxH14=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nyslbdePYbCMCPuoTbg+APG9JJDijIAtaVKG16Q5FSY5/Zf2BtFbXyHuC4pchma3xuXdbLO7NBwLbKVGkqIn0Uz5aeogwJLk6sXtwOMN9ZfwEme7OGhVMOwsyZbOXr6E+EQ6C+eujcTOKZdyMsKyaE+mzXWYvniaEwTvl6P1DnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hmj68evR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hmj68evR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CF00C4CEE3;
	Wed, 11 Jun 2025 17:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749664749;
	bh=YfKUtnN3UtlVflQXWWmtqpHbqcPJk8dujyWLgspxH14=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hmj68evRh3p59v9eQKJFU9r5V/Ic70b4L6ZQ0qygjLiziBjJ1y+1/TiXYp3bznMid
	 RRstbH0IbmyIsDZNkmO8vbTghvcQ2ZurkdPo18wYneK1fKeqtHGAERESCXC3imMWhT
	 2KfldYLCDH7h7jaNHQzdhUpRWVzxl/Xmj9e4J2wpFnDO13+PaS2Z9hwlewXI+e+uBQ
	 LaCep07zL2nckb6NWjZnAubhDz12FbaYpfpdOkEOuwrBly//ES+tri4PC8chFBbc4E
	 hTZhVmcafQO7DZ3H3CdfxGCs299+IEeOCAv6ZTGhZEHLsU+QaJZ6D0kUyr+gzmgW64
	 mMWj6MkBKWo/g==
From: SeongJae Park <sj@kernel.org>
To: Barry Song <21cnbao@gmail.com>
Cc: SeongJae Park <sj@kernel.org>,
	akpm@linux-foundation.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Barry Song <v-songbaohua@oppo.com>,
	David Hildenbrand <david@redhat.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Jann Horn <jannh@google.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Lokesh Gidra <lokeshgidra@google.com>,
	Mike Rapoport <rppt@kernel.org>,
	Michal Hocko <mhocko@suse.com>,
	Tangquan Zheng <zhengtangquan@oppo.com>,
	Qi Zheng <zhengqi.arch@bytedance.com>
Subject: Re: [PATCH v2] mm: madvise: use per_vma lock for MADV_FREE
Date: Wed, 11 Jun 2025 10:59:07 -0700
Message-Id: <20250611175907.197023-1-sj@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250611104745.57405-1-21cnbao@gmail.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Wed, 11 Jun 2025 22:47:45 +1200 Barry Song <21cnbao@gmail.com> wrote:

> From: Barry Song <v-songbaohua@oppo.com>
> 
> MADV_FREE is another option, besides MADV_DONTNEED, for dynamic memory
> freeing in user-space native or Java heap memory management. For example,
> jemalloc can be configured to use MADV_FREE, and recent versions of the
> Android Java heap have also increasingly adopted MADV_FREE. Supporting
> per-VMA locking for MADV_FREE thus appears increasingly necessary.
> 
> We have replaced walk_page_range() with walk_page_range_vma(). Along with
> the proposed madvise_lock_mode by Lorenzo, the necessary infrastructure is
> now in place to begin exploring per-VMA locking support for MADV_FREE and
> potentially other madvise using walk_page_range_vma().
> 
> This patch adds support for the PGWALK_VMA_RDLOCK walk_lock mode in
> walk_page_range_vma(), and leverages madvise_lock_mode from
> madv_behavior to select the appropriate walk_lock—either mmap_lock or
> per-VMA lock—based on the context.
> 
> Because we now dynamically update the walk_ops->walk_lock field, we
> must ensure this is thread-safe. The madvise_free_walk_ops is now
> defined as a stack variable instead of a global constant.
> 
> Acked-by: David Hildenbrand <david@redhat.com>
> Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
> Cc: Vlastimil Babka <vbabka@suse.cz>
> Cc: Jann Horn <jannh@google.com>
> Cc: Suren Baghdasaryan <surenb@google.com>
> Cc: Lokesh Gidra <lokeshgidra@google.com>
> Cc: Mike Rapoport <rppt@kernel.org>
> Cc: Michal Hocko <mhocko@suse.com>
> Cc: Tangquan Zheng <zhengtangquan@oppo.com>
> Cc: Qi Zheng <zhengqi.arch@bytedance.com>
> Signed-off-by: Barry Song <v-songbaohua@oppo.com>

Acked-by: SeongJae Park <sj@kernel.org>


Thanks,
SJ

[...]
