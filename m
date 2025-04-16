Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 144FC4683
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 12:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744807672; cv=none; b=Oqyp2qZVA26mo+G6mS1QDN0koYgqi4kTaKJbTd3bywC4dWCLws8VS44tt3FLk/RiCzkQ5Jha2X2DejbLXe9pImH/0XiCiU4ERZBx1O9gSReM+pkz1zaB1XilgUrsipNBIZLM8TKu3uHomLKcaQbfZ47d4UiWC5m99DGOKAPwOmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744807672; c=relaxed/simple;
	bh=MMKg4AQ+6qm3J8umrN0RA1ce1X9q/b3eIAEO/wkwkJw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uuCMNVWhvnqNtwewnGnDFxGWF7JQVlogFbydfQMbdbc7fTMRdBNPYomtZkuB9e1Pw+RKArZepoK92U2YwlOEmd0+dWVkPZq87CKHdk1mtXbnI0jbDh2gyG4xMxB1x46X7QYeQmgltmUX54NIXNyedZ4S2uPkihHgdjPOx9fTY/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 378CAC4CEE2;
	Wed, 16 Apr 2025 12:47:49 +0000 (UTC)
Date: Wed, 16 Apr 2025 13:47:46 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Xavier <xavier_qy@163.com>
Cc: ryan.roberts@arm.com, dev.jain@arm.com, ioworker0@gmail.com,
	21cnbao@gmail.com, akpm@linux-foundation.org, david@redhat.com,
	gshan@redhat.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, will@kernel.org, willy@infradead.org,
	ziy@nvidia.com
Subject: Re: [mm/contpte v3 0/1] mm/contpte: Optimize loop to reduce
 redundant operations
Message-ID: <Z_-m8s5EUrL4DAME@arm.com>
References: <f0e109c7-6bb2-4218-bc76-c5de39184064@arm.com>
 <20250415082205.2249918-1-xavier_qy@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415082205.2249918-1-xavier_qy@163.com>

On Tue, Apr 15, 2025 at 04:22:04PM +0800, Xavier wrote:
> Patch V3 has changed the while loop to a for loop according to the suggestions
> of Dev.

For some reason, my email (office365) rejected all these patches (not
even quarantined), I only got the replies. Anyway, I can get them from
the lore archive.

> Meanwhile, to improve efficiency, the definition of local variables has
> been removed. This macro is only used within the current function and there
> will be no additional risks. In order to verify the optimization performance of
> Patch V3, a test function has been designed. By repeatedly calling mlock in a
> loop, the kernel is made to call contpte_ptep_get extensively to test the
> optimization effect of this function.
> The function's execution time and instruction statistics have been traced using
> perf, and the following are the operation results on a certain Qualcomm mobile
> phone chip:
> 
> Instruction Statistics - Before Optimization
> #          count  event_name              # count / runtime
>       20,814,352  branch-load-misses      # 662.244 K/sec
>   41,894,986,323  branch-loads            # 1.333 G/sec
>        1,957,415  iTLB-load-misses        # 62.278 K/sec
>   49,872,282,100  iTLB-loads              # 1.587 G/sec
>      302,808,096  L1-icache-load-misses   # 9.634 M/sec
>   49,872,282,100  L1-icache-loads         # 1.587 G/sec
> 
> Total test time: 31.485237 seconds.
> 
> Instruction Statistics - After Optimization
> #          count  event_name              # count / runtime
>       19,340,524  branch-load-misses      # 688.753 K/sec
>   38,510,185,183  branch-loads            # 1.371 G/sec
>        1,812,716  iTLB-load-misses        # 64.554 K/sec
>   47,673,923,151  iTLB-loads              # 1.698 G/sec
>      675,853,661  L1-icache-load-misses   # 24.068 M/sec
>   47,673,923,151  L1-icache-loads         # 1.698 G/sec
> 
> Total test time: 28.108048 seconds.

We'd need to reproduce these numbers on other platforms as well and with
different page sizes. I hope Ryan can do some tests next week.

Purely looking at the patch, I don't like the complexity. I'd rather go
with your v1 if the numbers are fairly similar (even if slightly slower).

However, I don't trust microbenchmarks like calling mlock() in a loop.
It was hand-crafted to dirty the whole buffer (making ptes young+dirty)
before mlock() to make the best out of the rewritten contpte_ptep_get().
Are there any real world workloads that would benefit from such change?

As it stands, I think this patch needs better justification.

Thanks.

-- 
Catalin
