Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C9421624DD
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 15:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749051619; cv=none; b=jz/aA0LAqOwFc44Fvg3FiNBsC7MoNw0yRsGKdsgdzHcey6oFJbqyPxN8FVkwnaK4rpP4p1Q8Vt8XVsbe9kRlKcSW9fPsp9SMviXp5MASbgazJSH0VJhMYFVLHDniLr00JLhLtWr2m0R9l77W+qL6H0XT9maIspsyYBYNijhznRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749051619; c=relaxed/simple;
	bh=9k+IRgTSKZB80UaCJ/K2fADj600IkaunTAaY/RF0md4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tJYXZnLqb/SycGHS6lwFHX/fsXZ1fdlb0hCQEbiIhi3I76WnW71He4qOfj4sEnAgkDIAwIMgmUaleleIUQUg7zQ9IG38x9NF+DBhMvARtolofdg9UwdKXcYx1+FNtoF9ZYLkEUwee0kBJDjLfFK0YR4jn7JZXhk1BfGbOTt3ItI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=E4phkCij; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="E4phkCij"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=lY5/eHfXEHJTJnTx5q7SCMuh6jpmPnlI0ihTHUK4t+Q=; b=E4phkCija5f77m5g1x7VKmJW1O
	5gnGCw/ioBrmWwmD0OdMOb+tTEKpGrcf4iLG8lFu/bZC3eH/N3jsQHTYENMmjyRPuIGXCaxVR2dYQ
	FTsD4qtxM4D3j2FqXa7um5MDaEAbMRq9D20Vbs387E88+SlcWQCOAeq6H7HzuFxhddAeHIFGJ8P7s
	ly5VnVLYizCNI1OwS2mwk8LogiY3kbrXA40eaLa/7Sy/bu9iDBP5Z4th3pCZdvTuXEscjqkJxX1Xr
	BaCK9oR3OXCi9p8/2ICU5G4X/FG5QihFeJlgE9ZR6ZdyPVg3+ck15rrywdVU4e0iggkCyNbB3qOKH
	eSSSisqQ==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMqDo-00000003EYL-3ImA;
	Wed, 04 Jun 2025 15:40:09 +0000
Message-ID: <6736f668-474f-4ec5-a1b6-04e29c5093b4@infradead.org>
Date: Wed, 4 Jun 2025 08:40:04 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/vmstat: Fix build with MEMCG=y and VM_EVENT_COUNTERS=n
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>
Cc: lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com, hannes@cmpxchg.org,
 shakeel.butt@linux.dev, muchun.song@linux.dev, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Konstantin Khlebnikov <koct9i@gmail.com>
References: <20250604095111.533783-1-kirill.shutemov@linux.intel.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250604095111.533783-1-kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/4/25 2:51 AM, Kirill A. Shutemov wrote:
> When compiling with MEMCG enabled but VM_EVENT_COUNTERS disabled,
> BUILD_BUG_ON() is triggered in vmstat_start because the vmstat_text
> array is larger than NR_VMSTAT_ITEMS.
> 
> This issue arises because some elements of the vmstat_text array are
> present when either MEMCG or VM_EVENT_COUNTERS is enabled, but
> NR_VMSTAT_ITEMS only accounts for these elements if VM_EVENT_COUNTERS is
> enabled.
> 
> The recent change in the BUILD_BUG_ON() check made it more strict,
> disallowing extra elements in the array, which revealed the issue.
> 
> Instead of adjusting the NR_VMSTAT_ITEMS definition to account for
> MEMCG, make MEMCG select VM_EVENT_COUNTERS. VM_EVENT_COUNTERS is
> enabled in most configurations anyway.
> 
> There is no need to backport this fix to stable trees. Without the
> strict BUILD_BUG_ON(), the issue is not harmful. The elements in
> question would only be read by the memcg code, not by /proc/vmstat.
> 
> Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Fixes: ebc5d83d0443 ("mm/memcontrol: use vmstat names for printing statistics")
> Cc: Konstantin Khlebnikov <koct9i@gmail.com>

Tested-by: Randy Dunlap <rdunlap@infradead.org>
Acked-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  include/linux/vmstat.h | 4 ++--
>  init/Kconfig           | 1 +
>  mm/vmstat.c            | 4 ++--
>  3 files changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/include/linux/vmstat.h b/include/linux/vmstat.h
> index b2ccb6845595..c287998908bf 100644
> --- a/include/linux/vmstat.h
> +++ b/include/linux/vmstat.h
> @@ -507,7 +507,7 @@ static inline const char *lru_list_name(enum lru_list lru)
>  	return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
>  }
>  
> -#if defined(CONFIG_VM_EVENT_COUNTERS) || defined(CONFIG_MEMCG)
> +#if defined(CONFIG_VM_EVENT_COUNTERS)
>  static inline const char *vm_event_name(enum vm_event_item item)
>  {
>  	return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
> @@ -516,7 +516,7 @@ static inline const char *vm_event_name(enum vm_event_item item)
>  			   NR_VM_STAT_ITEMS +
>  			   item];
>  }
> -#endif /* CONFIG_VM_EVENT_COUNTERS || CONFIG_MEMCG */
> +#endif /* CONFIG_VM_EVENT_COUNTERS */
>  
>  #ifdef CONFIG_MEMCG
>  
> diff --git a/init/Kconfig b/init/Kconfig
> index ab83abe0fd9d..dd332cac6036 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -989,6 +989,7 @@ config MEMCG
>  	select PAGE_COUNTER
>  	select EVENTFD
>  	select SLAB_OBJ_EXT
> +	select VM_EVENT_COUNTERS
>  	help
>  	  Provides control over the memory footprint of tasks in a cgroup.
>  
> diff --git a/mm/vmstat.c b/mm/vmstat.c
> index 27dc37168cfd..c3114b8826e4 100644
> --- a/mm/vmstat.c
> +++ b/mm/vmstat.c
> @@ -1301,7 +1301,7 @@ const char * const vmstat_text[] = {
>  	[I(NR_MEMMAP_BOOT_PAGES)]		= "nr_memmap_boot_pages",
>  #undef I
>  
> -#if defined(CONFIG_VM_EVENT_COUNTERS) || defined(CONFIG_MEMCG)
> +#if defined(CONFIG_VM_EVENT_COUNTERS)
>  	/* enum vm_event_item counters */
>  #define I(x) (NR_VM_ZONE_STAT_ITEMS + NR_VM_NUMA_EVENT_ITEMS + \
>  	     NR_VM_NODE_STAT_ITEMS + NR_VM_STAT_ITEMS + x)
> @@ -1498,7 +1498,7 @@ const char * const vmstat_text[] = {
>  #endif
>  #endif
>  #undef I
> -#endif /* CONFIG_VM_EVENT_COUNTERS || CONFIG_MEMCG */
> +#endif /* CONFIG_VM_EVENT_COUNTERS */
>  };
>  #endif /* CONFIG_PROC_FS || CONFIG_SYSFS || CONFIG_NUMA || CONFIG_MEMCG */
>  

-- 
~Randy
