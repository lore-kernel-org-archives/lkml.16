Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B86199FA2;
	Fri, 23 May 2025 22:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748039227; cv=none; b=oC4e24rk7/pTH+YUxAqTCHcd18zK634Jwf3iLDr6d/GEBl74QDtoiW73QsH6AkrNaXhJVca9ppkQhTahRYEyYVegPKP3ZLbTRDbnCOnMgl5OVYcChmYgDftTQS3kneF7C4BQi+vS7zeZLmBRfIsStufIJ/CYNPqO2zn3zNWPRAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748039227; c=relaxed/simple;
	bh=JrmjUcUuCdLrFyFZQZQSWsHwlooK3iF/M77Hw8oBD4M=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=cJMuclTghSr6TjF3LoRSy7nYAtrJ4t9pWRlGGr/oufMP8me6SSMgvVuvx45YuTTnPkHWLUecrLkIEWGB3wGrPeqil+tSQYLX6HhNdTY87tLRaA2kUw9cKYLH6ruZvtovOvGxvwHHkBAgxTV1f3/fVteXQe2B+fzTrYWjfFD3ojk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=MAUxf4uN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="MAUxf4uN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A37D7C4CEE9;
	Fri, 23 May 2025 22:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1748039225;
	bh=JrmjUcUuCdLrFyFZQZQSWsHwlooK3iF/M77Hw8oBD4M=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=MAUxf4uN9muK+1RNCrui7Voj6noNO5+7v6fvwjsEVHyC7IHeZTMJXQqYkB4ZTxW7t
	 rnrLj/H1ds7sl8o36C6RcGUOkVsxcecPnZxQAf+t6TTQoEt5z+CnCieabJYVyh1vFO
	 Yw2uH9qwxW7uD+RpHuXhK/NJd3rZooMbIWmkyMqA=
Date: Fri, 23 May 2025 15:27:05 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, Yu Zhao <yuzhao@google.com>, lkp@intel.com,
 oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, Linux Memory
 Management List <linux-mm@kvack.org>
Subject: Re: mm/vmscan.c:3504 walk_pte_range() error: uninitialized symbol
 'dirty'.
Message-Id: <20250523152705.2ecae09e834c66e1327d6748@linux-foundation.org>
In-Reply-To: <202505152339.fBOfDPsi-lkp@intel.com>
References: <202505152339.fBOfDPsi-lkp@intel.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 23 May 2025 13:47:54 +0300 Dan Carpenter <dan.carpenter@linaro.org> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   088d13246a4672bc03aec664675138e3f5bff68c
> commit: a52dcec56c5b96250f15efbd7de3d3ea6ce863d9 mm/mglru: fix PTE-mapped large folios
> config: sparc-randconfig-r073-20250515 (https://download.01.org/0day-ci/archive/20250515/202505152339.fBOfDPsi-lkp@intel.com/config)
> compiler: sparc64-linux-gcc (GCC) 8.5.0
> 
> smatch warnings:
> mm/vmscan.c:3504 walk_pte_range() error: uninitialized symbol 'dirty'.
> mm/vmscan.c:3595 walk_pmd_range_locked() error: uninitialized symbol 'dirty'.
> mm/vmscan.c:4215 lru_gen_look_around() error: uninitialized symbol 'dirty'.
> 
> ...
>
> bd74fdaea14602 Yu Zhao        2022-09-18  3484  	for (i = pte_index(start), addr = start; addr != end; i++, addr += PAGE_SIZE) {
> bd74fdaea14602 Yu Zhao        2022-09-18  3485  		unsigned long pfn;
> bd74fdaea14602 Yu Zhao        2022-09-18  3486  		struct folio *folio;
> c33c794828f212 Ryan Roberts   2023-06-12  3487  		pte_t ptent = ptep_get(pte + i);
> bd74fdaea14602 Yu Zhao        2022-09-18  3488  
> bd74fdaea14602 Yu Zhao        2022-09-18  3489  		total++;
> bd74fdaea14602 Yu Zhao        2022-09-18  3490  		walk->mm_stats[MM_LEAF_TOTAL]++;
> bd74fdaea14602 Yu Zhao        2022-09-18  3491  
> 1d4832becdc2cd Yu Zhao        2024-10-19  3492  		pfn = get_pte_pfn(ptent, args->vma, addr, pgdat);
> bd74fdaea14602 Yu Zhao        2022-09-18  3493  		if (pfn == -1)
> bd74fdaea14602 Yu Zhao        2022-09-18  3494  			continue;
> bd74fdaea14602 Yu Zhao        2022-09-18  3495  
> 798c0330c2ca07 Yu Zhao        2024-12-30  3496  		folio = get_pfn_folio(pfn, memcg, pgdat);
> bd74fdaea14602 Yu Zhao        2022-09-18  3497  		if (!folio)
> bd74fdaea14602 Yu Zhao        2022-09-18  3498  			continue;
> bd74fdaea14602 Yu Zhao        2022-09-18  3499  
> 1d4832becdc2cd Yu Zhao        2024-10-19  3500  		if (!ptep_clear_young_notify(args->vma, addr, pte + i))
> 1d4832becdc2cd Yu Zhao        2024-10-19  3501  			continue;
> bd74fdaea14602 Yu Zhao        2022-09-18  3502  
> a52dcec56c5b96 Yu Zhao        2024-12-30  3503  		if (last != folio) {
> a52dcec56c5b96 Yu Zhao        2024-12-30 @3504  			walk_update_folio(walk, last, gen, dirty);

Seems to be notabug because last==NULL on the first loop and in this
case walk_update_folio() will immediately return without touching
`dirty'.   But gee, I can't blame smatch from getting fooled by this.

(oh look, mm/ has two walk_pte_range()s)
