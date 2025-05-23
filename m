Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B60A1226D04
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 10:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747997282; cv=none; b=YEDIikSpRX6PsP+2QGtn+0ZoMb/cTAnfbX8WUNt7Y0sQ1T5SS08iPx8ZMrN4D3/XD/Zj47x4v6yigDKfe8IsFgyhW8dATCY5tDJkuOKELDIY7NHlkGiVjz/JYfPqx9CheltspnXptFO+3lCMobkN20SJDh5CdDBVLYqf0s+7zws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747997282; c=relaxed/simple;
	bh=h9gl8jiSjNNaS24VpYZLQX139ohlcrSda5kPPfCth4I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=W/psOp5JrOHF9pugvBtefhrhjF81el+iVUt5psnYWLf5zfO6TUTpqxbWIg59PVjEWoktyyBozd5tXJNJ+cM617359YsNcphIF3l4EV5ixaCrTD6o+trOUMvnb9hZ/APXXYDsDVqYrMa+n+/a7Cri8oBbga/BdjCM8FKB4p9UYko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vSpaBLkk; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vSpaBLkk"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43edecbfb46so72686895e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 03:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747997278; x=1748602078; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pvat0/1rMENqBKZhuyO4HhGyQmI630c9sCJbM3sx/VQ=;
        b=vSpaBLkknxVYWqro/g8fE7oXfV7Vv0lQm3hftYfH0r7Tf5PWavbh0VfaXJrpz5vCAU
         /Zox9UgrT5CK/2u7fvuzUTxbp2tQDZRYdmhHur9Yw/Tq9zZuGsBzneUaslkknstWyhOy
         1tzm5wKnCkUZunyDXJJLIFHFkMO2gXcTSL7ZOVMm3OZoRoNopIv56UtVN+JZdddgKgXF
         OxTik1p8YYlDvRNFUoth0NT4uq1v2DDw14wd6zZE+nTibyScTtydR5gablS/S8ANL8Hu
         l6xykuvxTVygPrEHeR62QzrN5lQ+hqxwdm2C4LRHT/8zG9SaUVhGX6N2pV8XdnESt/FI
         fGfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747997278; x=1748602078;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pvat0/1rMENqBKZhuyO4HhGyQmI630c9sCJbM3sx/VQ=;
        b=KoEy6YtFXnoFkG7RVxriXN7DpdfCoIcrmvOVgrBoFlHfOtRr0VE3FM4ppawVaKyMA/
         lyqH8pU6xzW2QgjPZa+zDNeMAmQPV6c3pUjzUu/gwTVkiuY+TMAyFZzHDX39e0CYulBc
         fgyFVEGFlKmf+mmBgroL9sjoPPDcLqMFh0SswtqprfltoDkM+gcgbl2sSxZV+fdjVdV9
         X8kWfiAS56Q+dczX8EIdmIYehKqFyW6ivA5CsHnTXQRT0I4smFMnhyQitjiwsb8oz5Jc
         Vf/wDCsvdglPYL7YmRUFyXHJ1gW4oKr7C1gO9/BFlnDR/AcgTxbfjOpvZwetW328YtSA
         w+nA==
X-Forwarded-Encrypted: i=1; AJvYcCUr2/Qp/OpxlWRRukjUwjbCes+IfuW4k4NWD6OUw0945AgzecjC5/oHsL6w4/8iVyk1ZwLUlQWQJ4IEIsE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwI+592iIc5UKn4eF7EnOykfSQxVw/E3ArHgGiOQZrHyVRjVQPf
	PaKMlEBxFLZ63XzJs+OHW9vpwGClsqhL8dAP7ekHWkOujv2Vxxs34RWGn8XkYTXESog=
X-Gm-Gg: ASbGncukKwD0pwNufnlsf2wy+3Bvch+cug2pWIBC7Ri9aRexLnP/IWOt1cvDoCYmn2K
	dRqVLN5sPCD/yM651YZYj7JZuP+IoBh8MvYjcK7jUdb/p1CtNfV/fQkwEyv+AunHRMQdza8fyWi
	VRwxVwufaqcZt6c083w7kO8cFG/hHV0CUjuEOkpaW+AxNbeC1xLPKbtSUO7BgnmeCZLl9c/zojG
	eOcWRpuVdivtpKNMVGCjsiGXUNMDzRZA8dTf8cKgWJfU1Yi4GNXlg1KaxBqRhJ3UZjdKjHuo0X7
	ACBr/erLV6HZ/r2Nf9pydzBnAEOJjQqKDYn1agBhOnBHGSKUReX5ScAF
X-Google-Smtp-Source: AGHT+IFt9e8O2T7pLeZoZEYVwBiQD0nzYrr6EHcZTpNuvFH8+n2yYk2wVuh+KM2hl9eYxKNkUFfMSw==
X-Received: by 2002:a05:600c:8185:b0:43d:26e3:f2f6 with SMTP id 5b1f17b1804b1-442fefdab96mr249759215e9.5.1747997277841;
        Fri, 23 May 2025 03:47:57 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a35ca4d2d1sm26891438f8f.19.2025.05.23.03.47.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 03:47:57 -0700 (PDT)
Date: Fri, 23 May 2025 13:47:54 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Yu Zhao <yuzhao@google.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: mm/vmscan.c:3504 walk_pte_range() error: uninitialized symbol
 'dirty'.
Message-ID: <202505152339.fBOfDPsi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   088d13246a4672bc03aec664675138e3f5bff68c
commit: a52dcec56c5b96250f15efbd7de3d3ea6ce863d9 mm/mglru: fix PTE-mapped large folios
config: sparc-randconfig-r073-20250515 (https://download.01.org/0day-ci/archive/20250515/202505152339.fBOfDPsi-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202505152339.fBOfDPsi-lkp@intel.com/

smatch warnings:
mm/vmscan.c:3504 walk_pte_range() error: uninitialized symbol 'dirty'.
mm/vmscan.c:3595 walk_pmd_range_locked() error: uninitialized symbol 'dirty'.
mm/vmscan.c:4215 lru_gen_look_around() error: uninitialized symbol 'dirty'.

vim +/dirty +3504 mm/vmscan.c

bd74fdaea14602 Yu Zhao        2022-09-18  3450  static bool walk_pte_range(pmd_t *pmd, unsigned long start, unsigned long end,
bd74fdaea14602 Yu Zhao        2022-09-18  3451  			   struct mm_walk *args)
bd74fdaea14602 Yu Zhao        2022-09-18  3452  {
bd74fdaea14602 Yu Zhao        2022-09-18  3453  	int i;
a52dcec56c5b96 Yu Zhao        2024-12-30  3454  	bool dirty;
bd74fdaea14602 Yu Zhao        2022-09-18  3455  	pte_t *pte;
bd74fdaea14602 Yu Zhao        2022-09-18  3456  	spinlock_t *ptl;
bd74fdaea14602 Yu Zhao        2022-09-18  3457  	unsigned long addr;
bd74fdaea14602 Yu Zhao        2022-09-18  3458  	int total = 0;
bd74fdaea14602 Yu Zhao        2022-09-18  3459  	int young = 0;
a52dcec56c5b96 Yu Zhao        2024-12-30  3460  	struct folio *last = NULL;
bd74fdaea14602 Yu Zhao        2022-09-18  3461  	struct lru_gen_mm_walk *walk = args->private;
bd74fdaea14602 Yu Zhao        2022-09-18  3462  	struct mem_cgroup *memcg = lruvec_memcg(walk->lruvec);
bd74fdaea14602 Yu Zhao        2022-09-18  3463  	struct pglist_data *pgdat = lruvec_pgdat(walk->lruvec);
cc25bbe10a86a7 Kinsey Ho      2024-02-14  3464  	DEFINE_MAX_SEQ(walk->lruvec);
a52dcec56c5b96 Yu Zhao        2024-12-30  3465  	int gen = lru_gen_from_seq(max_seq);
2441774f2d2890 Qi Zheng       2024-09-26  3466  	pmd_t pmdval;
bd74fdaea14602 Yu Zhao        2022-09-18  3467  
a52dcec56c5b96 Yu Zhao        2024-12-30  3468  	pte = pte_offset_map_rw_nolock(args->mm, pmd, start & PMD_MASK, &pmdval, &ptl);
52fc048320adf1 Hugh Dickins   2023-06-08  3469  	if (!pte)
52fc048320adf1 Hugh Dickins   2023-06-08  3470  		return false;
a52dcec56c5b96 Yu Zhao        2024-12-30  3471  
52fc048320adf1 Hugh Dickins   2023-06-08  3472  	if (!spin_trylock(ptl)) {
52fc048320adf1 Hugh Dickins   2023-06-08  3473  		pte_unmap(pte);
a52dcec56c5b96 Yu Zhao        2024-12-30  3474  		return true;
52fc048320adf1 Hugh Dickins   2023-06-08  3475  	}
bd74fdaea14602 Yu Zhao        2022-09-18  3476  
2441774f2d2890 Qi Zheng       2024-09-26  3477  	if (unlikely(!pmd_same(pmdval, pmdp_get_lockless(pmd)))) {
2441774f2d2890 Qi Zheng       2024-09-26  3478  		pte_unmap_unlock(pte, ptl);
2441774f2d2890 Qi Zheng       2024-09-26  3479  		return false;
2441774f2d2890 Qi Zheng       2024-09-26  3480  	}
2441774f2d2890 Qi Zheng       2024-09-26  3481  
bd74fdaea14602 Yu Zhao        2022-09-18  3482  	arch_enter_lazy_mmu_mode();
bd74fdaea14602 Yu Zhao        2022-09-18  3483  restart:
bd74fdaea14602 Yu Zhao        2022-09-18  3484  	for (i = pte_index(start), addr = start; addr != end; i++, addr += PAGE_SIZE) {
bd74fdaea14602 Yu Zhao        2022-09-18  3485  		unsigned long pfn;
bd74fdaea14602 Yu Zhao        2022-09-18  3486  		struct folio *folio;
c33c794828f212 Ryan Roberts   2023-06-12  3487  		pte_t ptent = ptep_get(pte + i);
bd74fdaea14602 Yu Zhao        2022-09-18  3488  
bd74fdaea14602 Yu Zhao        2022-09-18  3489  		total++;
bd74fdaea14602 Yu Zhao        2022-09-18  3490  		walk->mm_stats[MM_LEAF_TOTAL]++;
bd74fdaea14602 Yu Zhao        2022-09-18  3491  
1d4832becdc2cd Yu Zhao        2024-10-19  3492  		pfn = get_pte_pfn(ptent, args->vma, addr, pgdat);
bd74fdaea14602 Yu Zhao        2022-09-18  3493  		if (pfn == -1)
bd74fdaea14602 Yu Zhao        2022-09-18  3494  			continue;
bd74fdaea14602 Yu Zhao        2022-09-18  3495  
798c0330c2ca07 Yu Zhao        2024-12-30  3496  		folio = get_pfn_folio(pfn, memcg, pgdat);
bd74fdaea14602 Yu Zhao        2022-09-18  3497  		if (!folio)
bd74fdaea14602 Yu Zhao        2022-09-18  3498  			continue;
bd74fdaea14602 Yu Zhao        2022-09-18  3499  
1d4832becdc2cd Yu Zhao        2024-10-19  3500  		if (!ptep_clear_young_notify(args->vma, addr, pte + i))
1d4832becdc2cd Yu Zhao        2024-10-19  3501  			continue;
bd74fdaea14602 Yu Zhao        2022-09-18  3502  
a52dcec56c5b96 Yu Zhao        2024-12-30  3503  		if (last != folio) {
a52dcec56c5b96 Yu Zhao        2024-12-30 @3504  			walk_update_folio(walk, last, gen, dirty);
                                                                                                           ^^^^^
Potentially uninitialized.

It's weird that I didn't report this in Jan because it seems like a
reasonable warning.  Sorry for that.

bd74fdaea14602 Yu Zhao        2022-09-18  3505  
a52dcec56c5b96 Yu Zhao        2024-12-30  3506  			last = folio;
a52dcec56c5b96 Yu Zhao        2024-12-30  3507  			dirty = false;
a52dcec56c5b96 Yu Zhao        2024-12-30  3508  		}
bd74fdaea14602 Yu Zhao        2022-09-18  3509  
a52dcec56c5b96 Yu Zhao        2024-12-30  3510  		if (pte_dirty(ptent))
a52dcec56c5b96 Yu Zhao        2024-12-30  3511  			dirty = true;
a52dcec56c5b96 Yu Zhao        2024-12-30  3512  
a52dcec56c5b96 Yu Zhao        2024-12-30  3513  		young++;
a52dcec56c5b96 Yu Zhao        2024-12-30  3514  		walk->mm_stats[MM_LEAF_YOUNG]++;
bd74fdaea14602 Yu Zhao        2022-09-18  3515  	}
bd74fdaea14602 Yu Zhao        2022-09-18  3516  
a52dcec56c5b96 Yu Zhao        2024-12-30  3517  	walk_update_folio(walk, last, gen, dirty);
a52dcec56c5b96 Yu Zhao        2024-12-30  3518  	last = NULL;
a52dcec56c5b96 Yu Zhao        2024-12-30  3519  
bd74fdaea14602 Yu Zhao        2022-09-18  3520  	if (i < PTRS_PER_PTE && get_next_vma(PMD_MASK, PAGE_SIZE, args, &start, &end))
bd74fdaea14602 Yu Zhao        2022-09-18  3521  		goto restart;
bd74fdaea14602 Yu Zhao        2022-09-18  3522  
bd74fdaea14602 Yu Zhao        2022-09-18  3523  	arch_leave_lazy_mmu_mode();
52fc048320adf1 Hugh Dickins   2023-06-08  3524  	pte_unmap_unlock(pte, ptl);
bd74fdaea14602 Yu Zhao        2022-09-18  3525  
bd74fdaea14602 Yu Zhao        2022-09-18  3526  	return suitable_to_scan(total, young);
bd74fdaea14602 Yu Zhao        2022-09-18  3527  }
bd74fdaea14602 Yu Zhao        2022-09-18  3528  
b5ff4133617d0e T.J. Alumbaugh 2023-01-18  3529  static void walk_pmd_range_locked(pud_t *pud, unsigned long addr, struct vm_area_struct *vma,
b5ff4133617d0e T.J. Alumbaugh 2023-01-18  3530  				  struct mm_walk *args, unsigned long *bitmap, unsigned long *first)
bd74fdaea14602 Yu Zhao        2022-09-18  3531  {
bd74fdaea14602 Yu Zhao        2022-09-18  3532  	int i;
a52dcec56c5b96 Yu Zhao        2024-12-30  3533  	bool dirty;
bd74fdaea14602 Yu Zhao        2022-09-18  3534  	pmd_t *pmd;
bd74fdaea14602 Yu Zhao        2022-09-18  3535  	spinlock_t *ptl;
a52dcec56c5b96 Yu Zhao        2024-12-30  3536  	struct folio *last = NULL;
bd74fdaea14602 Yu Zhao        2022-09-18  3537  	struct lru_gen_mm_walk *walk = args->private;
bd74fdaea14602 Yu Zhao        2022-09-18  3538  	struct mem_cgroup *memcg = lruvec_memcg(walk->lruvec);
bd74fdaea14602 Yu Zhao        2022-09-18  3539  	struct pglist_data *pgdat = lruvec_pgdat(walk->lruvec);
cc25bbe10a86a7 Kinsey Ho      2024-02-14  3540  	DEFINE_MAX_SEQ(walk->lruvec);
a52dcec56c5b96 Yu Zhao        2024-12-30  3541  	int gen = lru_gen_from_seq(max_seq);
bd74fdaea14602 Yu Zhao        2022-09-18  3542  
bd74fdaea14602 Yu Zhao        2022-09-18  3543  	VM_WARN_ON_ONCE(pud_leaf(*pud));
bd74fdaea14602 Yu Zhao        2022-09-18  3544  
bd74fdaea14602 Yu Zhao        2022-09-18  3545  	/* try to batch at most 1+MIN_LRU_BATCH+1 entries */
b5ff4133617d0e T.J. Alumbaugh 2023-01-18  3546  	if (*first == -1) {
b5ff4133617d0e T.J. Alumbaugh 2023-01-18  3547  		*first = addr;
b5ff4133617d0e T.J. Alumbaugh 2023-01-18  3548  		bitmap_zero(bitmap, MIN_LRU_BATCH);
bd74fdaea14602 Yu Zhao        2022-09-18  3549  		return;
bd74fdaea14602 Yu Zhao        2022-09-18  3550  	}
bd74fdaea14602 Yu Zhao        2022-09-18  3551  
b5ff4133617d0e T.J. Alumbaugh 2023-01-18  3552  	i = addr == -1 ? 0 : pmd_index(addr) - pmd_index(*first);
bd74fdaea14602 Yu Zhao        2022-09-18  3553  	if (i && i <= MIN_LRU_BATCH) {
bd74fdaea14602 Yu Zhao        2022-09-18  3554  		__set_bit(i - 1, bitmap);
bd74fdaea14602 Yu Zhao        2022-09-18  3555  		return;
bd74fdaea14602 Yu Zhao        2022-09-18  3556  	}
bd74fdaea14602 Yu Zhao        2022-09-18  3557  
b5ff4133617d0e T.J. Alumbaugh 2023-01-18  3558  	pmd = pmd_offset(pud, *first);
bd74fdaea14602 Yu Zhao        2022-09-18  3559  
bd74fdaea14602 Yu Zhao        2022-09-18  3560  	ptl = pmd_lockptr(args->mm, pmd);
bd74fdaea14602 Yu Zhao        2022-09-18  3561  	if (!spin_trylock(ptl))
bd74fdaea14602 Yu Zhao        2022-09-18  3562  		goto done;
bd74fdaea14602 Yu Zhao        2022-09-18  3563  
bd74fdaea14602 Yu Zhao        2022-09-18  3564  	arch_enter_lazy_mmu_mode();
bd74fdaea14602 Yu Zhao        2022-09-18  3565  
bd74fdaea14602 Yu Zhao        2022-09-18  3566  	do {
bd74fdaea14602 Yu Zhao        2022-09-18  3567  		unsigned long pfn;
bd74fdaea14602 Yu Zhao        2022-09-18  3568  		struct folio *folio;
b5ff4133617d0e T.J. Alumbaugh 2023-01-18  3569  
b5ff4133617d0e T.J. Alumbaugh 2023-01-18  3570  		/* don't round down the first address */
b5ff4133617d0e T.J. Alumbaugh 2023-01-18  3571  		addr = i ? (*first & PMD_MASK) + i * PMD_SIZE : *first;
bd74fdaea14602 Yu Zhao        2022-09-18  3572  
1d4832becdc2cd Yu Zhao        2024-10-19  3573  		if (!pmd_present(pmd[i]))
bd74fdaea14602 Yu Zhao        2022-09-18  3574  			goto next;
bd74fdaea14602 Yu Zhao        2022-09-18  3575  
bd74fdaea14602 Yu Zhao        2022-09-18  3576  		if (!pmd_trans_huge(pmd[i])) {
1d4832becdc2cd Yu Zhao        2024-10-19  3577  			if (!walk->force_scan && should_clear_pmd_young() &&
1d4832becdc2cd Yu Zhao        2024-10-19  3578  			    !mm_has_notifiers(args->mm))
bd74fdaea14602 Yu Zhao        2022-09-18  3579  				pmdp_test_and_clear_young(vma, addr, pmd + i);
bd74fdaea14602 Yu Zhao        2022-09-18  3580  			goto next;
bd74fdaea14602 Yu Zhao        2022-09-18  3581  		}
bd74fdaea14602 Yu Zhao        2022-09-18  3582  
1d4832becdc2cd Yu Zhao        2024-10-19  3583  		pfn = get_pmd_pfn(pmd[i], vma, addr, pgdat);
1d4832becdc2cd Yu Zhao        2024-10-19  3584  		if (pfn == -1)
1d4832becdc2cd Yu Zhao        2024-10-19  3585  			goto next;
1d4832becdc2cd Yu Zhao        2024-10-19  3586  
798c0330c2ca07 Yu Zhao        2024-12-30  3587  		folio = get_pfn_folio(pfn, memcg, pgdat);
bd74fdaea14602 Yu Zhao        2022-09-18  3588  		if (!folio)
bd74fdaea14602 Yu Zhao        2022-09-18  3589  			goto next;
bd74fdaea14602 Yu Zhao        2022-09-18  3590  
1d4832becdc2cd Yu Zhao        2024-10-19  3591  		if (!pmdp_clear_young_notify(vma, addr, pmd + i))
bd74fdaea14602 Yu Zhao        2022-09-18  3592  			goto next;
bd74fdaea14602 Yu Zhao        2022-09-18  3593  
a52dcec56c5b96 Yu Zhao        2024-12-30  3594  		if (last != folio) {
a52dcec56c5b96 Yu Zhao        2024-12-30 @3595  			walk_update_folio(walk, last, gen, dirty);

Same.

bd74fdaea14602 Yu Zhao        2022-09-18  3596  
a52dcec56c5b96 Yu Zhao        2024-12-30  3597  			last = folio;
a52dcec56c5b96 Yu Zhao        2024-12-30  3598  			dirty = false;
a52dcec56c5b96 Yu Zhao        2024-12-30  3599  		}
bd74fdaea14602 Yu Zhao        2022-09-18  3600  
a52dcec56c5b96 Yu Zhao        2024-12-30  3601  		if (pmd_dirty(pmd[i]))
a52dcec56c5b96 Yu Zhao        2024-12-30  3602  			dirty = true;
a52dcec56c5b96 Yu Zhao        2024-12-30  3603  
a52dcec56c5b96 Yu Zhao        2024-12-30  3604  		walk->mm_stats[MM_LEAF_YOUNG]++;
bd74fdaea14602 Yu Zhao        2022-09-18  3605  next:
bd74fdaea14602 Yu Zhao        2022-09-18  3606  		i = i > MIN_LRU_BATCH ? 0 : find_next_bit(bitmap, MIN_LRU_BATCH, i) + 1;
bd74fdaea14602 Yu Zhao        2022-09-18  3607  	} while (i <= MIN_LRU_BATCH);
bd74fdaea14602 Yu Zhao        2022-09-18  3608  
a52dcec56c5b96 Yu Zhao        2024-12-30  3609  	walk_update_folio(walk, last, gen, dirty);
a52dcec56c5b96 Yu Zhao        2024-12-30  3610  
bd74fdaea14602 Yu Zhao        2022-09-18  3611  	arch_leave_lazy_mmu_mode();
bd74fdaea14602 Yu Zhao        2022-09-18  3612  	spin_unlock(ptl);
bd74fdaea14602 Yu Zhao        2022-09-18  3613  done:
b5ff4133617d0e T.J. Alumbaugh 2023-01-18  3614  	*first = -1;
bd74fdaea14602 Yu Zhao        2022-09-18  3615  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

