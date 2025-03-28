Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A0A584E1C
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 23:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743202871; cv=none; b=ZiSU8E1Hyn8io8WHfAkpdDN0EnWuc9ujtjWsAZUKisZcBB4Q5WcTC2l+Z1qnJBQzzpD+43ZbI1Y7PADuXVbZZR6m5iwadRcGnf1u80ASdv0EvZ3nT/EmCrT9w1bR+duNS9HDOjmhT0CgBbR7s2orbqRIuSNuQqf35EQ4Azc7NOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743202871; c=relaxed/simple;
	bh=04dgAK0A3bn8jeB685qjEb+d3VvxJzC73Mz7EO4TC/I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P+nDuhE8LQ/WVDr+QVYo+gPSHYxZNGYl5/c2zG8XTbUfNHkyUIX2abtDuGVpVBm4lFfs+b/IHcRjzjDGOClDlW/YeE0FgfJ9nfdsExv/kfcRt4UKozCnEpe0wYzpdZ8B0Lq2GcfVKVKWy+K/lcwhCe9PVloYavqvOnApGTLsvK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e1d7Empg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e1d7Empg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46438C4CEE4;
	Fri, 28 Mar 2025 23:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743202871;
	bh=04dgAK0A3bn8jeB685qjEb+d3VvxJzC73Mz7EO4TC/I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e1d7EmpgQSHXGQmHmSDrot7Vb/ffiOAIwZMCsqyNcdju7ydyJMuy1Avjp5RFetZLm
	 fgBpjVgh0P5MOTFPp2txuLP8YVPEdG3oJ+j3zlfxwWkAwTpNatv60jHBrz09RV7/b1
	 GVhnQ1FkS9qzSkNkP9aDDU1/lpxk0uphCYWny1DQWXNeQRBQP41kNYAdTYoNipi2C4
	 1A7ZnAdCR0qhtkw7sdzUYbAJUnKR/0UTp+qzqEuZW9Rrfgk/SFFwNdy9Np4D6/qJ0n
	 9j1R/tKF6BG7HdlNlJoJA5H7ZVAFcrADnfM04S7wfqnDf0Gv66n/7tLMTHCJG+hTQx
	 1YidgbnHqLs4g==
Date: Sat, 29 Mar 2025 02:01:05 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Ye Liu <ye.liu@linux.dev>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, Ye Liu <liuye@kylinos.cn>
Subject: Re: [PATCH] mm/show_mem: Optimize si_meminfo_node by reducing
 redundant code
Message-ID: <Z-cqMYag8kzS0MEt@kernel.org>
References: <20250325073803.852594-1-ye.liu@linux.dev>
 <Z-RVhrZuybsQj7l0@kernel.org>
 <9d48bfef-11b1-469f-bbf6-7693cb4a2c0a@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9d48bfef-11b1-469f-bbf6-7693cb4a2c0a@linux.dev>

Please don't send html emails to the Linux kernel mailing lists.

On Thu, Mar 27, 2025 at 05:32:14PM +0800, Ye Liu wrote:
> 
> 在 2025/3/27 03:29, Mike Rapoport 写道:
> 
>     On Tue, Mar 25, 2025 at 03:38:03PM +0800, Ye Liu wrote:
> 
>         From: Ye Liu <liuye@kylinos.cn>
> 
>         Refactors the si_meminfo_node() function by reducing redundant code and
>         improving readability.
> 
>         Moved the calculation of managed_pages inside the existing loop that
>         processes pgdat->node_zones, eliminating the need for a separate loop.
> 
>         Simplified the logic by removing unnecessary preprocessor conditionals.
> 
>         Ensured that both totalram, totalhigh, and other memory statistics are
>         consistently set without duplication.
> 
>         This change results in cleaner and more efficient code without altering
>         functionality.
> 
>         Signed-off-by: Ye Liu <liuye@kylinos.cn>
>         ---
>          mm/show_mem.c | 16 +++++-----------
>          1 file changed, 5 insertions(+), 11 deletions(-)
> 
>         diff --git a/mm/show_mem.c b/mm/show_mem.c
>         index 6af13bcd2ab3..ad373b4b6e39 100644
>         --- a/mm/show_mem.c
>         +++ b/mm/show_mem.c
>         @@ -94,26 +94,20 @@ void si_meminfo_node(struct sysinfo *val, int nid)
>                 unsigned long free_highpages = 0;
>                 pg_data_t *pgdat = NODE_DATA(nid);
> 
>         -       for (zone_type = 0; zone_type < MAX_NR_ZONES; zone_type++)
>         -               managed_pages += zone_managed_pages(&pgdat->node_zones[zone_type]);
>         -       val->totalram = managed_pages;
>         -       val->sharedram = node_page_state(pgdat, NR_SHMEM);
>         -       val->freeram = sum_zone_node_page_state(nid, NR_FREE_PAGES);
>         -#ifdef CONFIG_HIGHMEM
>                 for (zone_type = 0; zone_type < MAX_NR_ZONES; zone_type++) {
>                         struct zone *zone = &pgdat->node_zones[zone_type];
>         -
>         +               managed_pages += zone_managed_pages(zone);
> 
>     nit: don't remove the empty line after the declaration
> 
> Agree.
> 
>                         if (is_highmem(zone)) {
>                                 managed_highpages += zone_managed_pages(zone);
> 
>     Looks like highmem pages get counted twice, no?
> 
> twice? The original logic has not been changed.
> 
> managed_highpages is just high memory, managed_pages is all.

You are right, I misread the patch. 

Feel free to add

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
 
> Thanks,
> 
> Ye Liu
> 
> 
> 
>                                 free_highpages += zone_page_state(zone, NR_FREE_PAGES);
>                         }
>                 }
>         +
>         +       val->totalram = managed_pages;
>         +       val->sharedram = node_page_state(pgdat, NR_SHMEM);
>         +       val->freeram = sum_zone_node_page_state(nid, NR_FREE_PAGES);
>                 val->totalhigh = managed_highpages;
>                 val->freehigh = free_highpages;
>         -#else
>         -       val->totalhigh = managed_highpages;
>         -       val->freehigh = free_highpages;
>         -#endif
>                 val->mem_unit = PAGE_SIZE;
>          }
>          #endif
>         --
>         2.25.1
> 
> 
> 

-- 
Sincerely yours,
Mike.
