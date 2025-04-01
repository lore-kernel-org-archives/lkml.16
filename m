Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBF6C1E5B93
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 21:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743542233; cv=none; b=SD7whJBDORaFntJxdixxVCfpjLg6019Un9F8Z9wEwG2B1LUjo73EQ5otyTOQofy4eTyIfY4ytnktXmzRIREVJMx5xG02LBx/9zATpM3vCVQ43RY9puci/1+LP2DOjlHl3sCtvLDhnlqPLB6cCjrN+rwlgKmRDxctTAun556b2Ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743542233; c=relaxed/simple;
	bh=sX0uf6dTSoK1pXLNS3g6kVfp/ORevvzcF4TTEuOeOP8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TK4OzwO/UGPVN3tj34zn/UPsn0qqwnpkHxYErawjpF/DYklK1oFK/PiUbOWDddP640PtuY+F8Dlb0RsZw/vD5eNWk+N5oiw713rIpC0Sxlbpje6TzEQE5vhLmQNnUaxje8hUcfwV8WUp9uXVQWyWkKXHq2jAtqd3A9w59Gi48LY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WBlYRQgh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WBlYRQgh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FC6CC4CEE4;
	Tue,  1 Apr 2025 21:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743542232;
	bh=sX0uf6dTSoK1pXLNS3g6kVfp/ORevvzcF4TTEuOeOP8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WBlYRQghV9GjjY04Fhkn0tx30g4uvZuAYJXcnswFOaWa7BGv4WKD+IK9bYbKG0feG
	 ss19aS4ZGnSuCk5zVlvBZDT9AJ6El6xld0tUBqrpCqjEdWSY0+pkes+ObOlujcCKOB
	 dQb6TIgHuE3v88eueeh/X4CcCK2Q6Q9ifaPohOxddHLvucjwxrxgwD0zi7QbNpr5Bq
	 JNTsJXAdNA0KkZrSazU9IxcpU3hnubl6AXoSZtZ/ImncLnDeOw3Dq4+3BCdMNJlpiT
	 OZo8DP1CDFr3ceM8AijdHPYZ9kvT+kYznrFVn1Xtly413Me/AUvNc/BirYJq1T2CX7
	 /UJ55ZNVjxCCQ==
From: SeongJae Park <sj@kernel.org>
To: SeongJae Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <howlett@gmail.com>,
	David Hildenbrand <david@redhat.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Vlastimil Babka <vbabka@suse.cz>,
	kernel-team@meta.com,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH 8/9] mm/madvise: batch tlb flushes for [process_]madvise(MADV_{DONTNEED[_LOCKED],FREE})
Date: Tue,  1 Apr 2025 14:17:09 -0700
Message-Id: <20250401211709.81552-1-sj@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250310172318.653630-9-sj@kernel.org>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 10 Mar 2025 10:23:17 -0700 SeongJae Park <sj@kernel.org> wrote:

> MADV_DONTNEED[_LOCKED] and MADV_FREE internal logics for
> [process_]madvise() can be invoked with batched tlb flushes.  Update
> vector_madvise() and do_madvise(), which are called for the two system
> calls  respectively, to use those in the efficient way.  Initialize an
> mmu_gather object before starting the internal works, and flush the
> gathered tlb entries at once after all the internal works are done.
> 
> Signed-off-by: SeongJae Park <sj@kernel.org>
> ---
>  mm/madvise.c | 51 +++++++++++++++++++++++++++++++++++++++++++++++----
>  1 file changed, 47 insertions(+), 4 deletions(-)
> 
> diff --git a/mm/madvise.c b/mm/madvise.c
> index d7ea71c6422c..d5f4ce3041a4 100644
> --- a/mm/madvise.c
> +++ b/mm/madvise.c
[...]
> @@ -1639,6 +1642,32 @@ static void madvise_unlock(struct mm_struct *mm, int behavior)
>  		mmap_read_unlock(mm);
>  }
>  
> +static bool madvise_batch_tlb_flush(int behavior)
> +{
> +	switch (behavior) {
> +	case MADV_DONTNEED:
> +	case MADV_DONTNEED_LOCKED:
> +		return true;
> +	default:
> +		return false;
> +	}
> +}

The above function should return true for MADV_FREE, too.  I will make so in the
next spin.


Thanks,
SJ

[...]
