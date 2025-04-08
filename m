Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B98C81DF749
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 15:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744124438; cv=none; b=DDxx2/lQFX5I0mrmhB9UOETrM4i40g2NKq9dffYfQFqyYXQIq1FKcT0hu/UNv5o3My6Viz6IWk1XJ11a674P73jS1M7BN2ggxGhDuC/f+VBb5ObRl+coI+vIy4/ZFKpD4UgE8PMGdOb7K/Wj8jtmOHKsDxTtbvNtSMfoEo+Mxk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744124438; c=relaxed/simple;
	bh=p/PzL0lY97r0zZWWojJbCACzIyLA8XnwuAilw+dmSfg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UBZY5uE3nVE3kg0COp2x6UzmBDKvdE3gv/F1BXC1KZyUx4NcuyVsRkugVuDkrZHGSiURrC6S4MkxXikILPi1iSs4a308ZX8inW6lzGv6m5Fjr8D6xr2f3PkESFvwd7C/McMtRc16zb9MhZnqltpk/vmLlF+AiwD2pdfhXrjhvHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b=JLcedITb; arc=none smtp.client-ip=209.85.166.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="JLcedITb"
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-861525e9b0aso82826139f.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 08:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1744124436; x=1744729236; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oQd2HuYVMB2uA19lAP4G3r1tUf16qS+73yi0Zu+QUgU=;
        b=JLcedITbMrH2BMWGg9RWNNL2Txu38Md3g9r5e3Nhf74zXz69BuRBuM568KFiL9SHgY
         iiv59TxDYOd4YKYUJ7QP5t1KphGeTlPmmJPr8B9aY4QDhBGAiORdO4/71txHHgorDO8A
         MEfAbiZnaW2y4CTgjix8Y/D/5lzpLNEiPM/YjVNieuOLSdWaAVoJareWDS4FrgKEW4SG
         LWiJcifnzDaOtCW5AG+9hrbvYyVMQinwkk9QczDH8eUq8CMSr1W+AHMv4EV/YIpf6rEe
         kHu6ck3sHpKqd8Qc7EOR3lModWDBK7wE5R0D5wCgoKL32ahMBw0T2e7umaSTmPWov3el
         m0gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744124436; x=1744729236;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oQd2HuYVMB2uA19lAP4G3r1tUf16qS+73yi0Zu+QUgU=;
        b=tpROFGanhVJjkIZq+9O5mkIj1v/A1GPM5iDrb++fvbUVU1VN96ivSzzQCbj3tq4PGN
         yXI/aJUH5W4BJtslpwBgJbr019RqjJHb88Nbo1Bakipa7q16r4JHyw/PmG50R6jL49uy
         7zaxumZN6BlfDYsr8qxKRdIoMSnYGlXtNWFnxjhIXZ5yAj4Lg8BWV9S17GjIp+25kbgE
         VNc7k3wEyHMixrc42mS84f4uB8xHytITUUTOReD7ZDRnPnIKvSCEulleb5r3Mo1ltpUJ
         MN0aBfsVtMCaUu+0N9g5rNlQgJC9uBJgtKiZsInKSt30hP712jw+sBFJsIrHdDHrrJri
         2Ymw==
X-Forwarded-Encrypted: i=1; AJvYcCVA2JWCgP8lLiwLyc4GAXpPje7Pjo//tneNzfhOtVCLUq8evf+/7alUFZi9KSw5abd53EBtJAJZs0sdvv4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUMH4RHqclWDlFRcrC5iuHiH8Ls58+yazB0CNZqUKTJCvI+Pp9
	QS+1nJS8m25C/GuQzULw66BweJdxcrW42igSZFANWY0p8XFsFeB6B3f1UxpXYfg1t3NO1BmQtwZ
	K
X-Gm-Gg: ASbGncsVeFrJwQq5orV6V69WrTKEtdee49qIw7mD7DXgsyGBocerRZ1oQj63WnL53mI
	52puzMJavX7KCBFWD2PqDOE0+S3ed1TPyOstUaMWPMV3gmEOSWACR61ijbl7+/bXYcF0W1b9OxT
	fEhSDFEMDF9LMhCc6uWuaGkP787c6zrHfnrlXNsHMOK1oF+uPgGwgKpkwBN3kgNzdGnz8Y8+mT/
	kpDFLiYwWUsOqcXR+oyZ0J5x3QPPA5EOLpA2SQqWTWcSBk65qs+u8FvRMivyAVhS/ATNbPrzsmC
	trt+mBCDcvaYB+4LX7DBmEQc7wpBz2KZunzAp5ebsDw=
X-Google-Smtp-Source: AGHT+IHoaiiimay/jkn42/i4mLcJ/qG34wLV5JJdRiDmu8nloHtzgfEmtFoYsMdVM1i1HbahBBGarQ==
X-Received: by 2002:a05:620a:d8c:b0:7c5:5d9b:b617 with SMTP id af79cd13be357-7c774d531e4mr2153900785a.23.1744124424489;
        Tue, 08 Apr 2025 08:00:24 -0700 (PDT)
Received: from localhost ([2603:7000:c01:2716:365a:60ff:fe62:ff29])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c76e7354a3sm770574985a.10.2025.04.08.08.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 08:00:23 -0700 (PDT)
Date: Tue, 8 Apr 2025 11:00:19 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Nhat Pham <nphamcs@gmail.com>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, hughd@google.com,
	yosry.ahmed@linux.dev, mhocko@kernel.org, roman.gushchin@linux.dev,
	shakeel.butt@linux.dev, muchun.song@linux.dev, len.brown@intel.com,
	chengming.zhou@linux.dev, kasong@tencent.com, chrisl@kernel.org,
	huang.ying.caritas@gmail.com, ryan.roberts@arm.com,
	viro@zeniv.linux.org.uk, baohua@kernel.org, osalvador@suse.de,
	lorenzo.stoakes@oracle.com, christophe.leroy@csgroup.eu,
	pavel@kernel.org, kernel-team@meta.com,
	linux-kernel@vger.kernel.org, cgroups@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: Re: [RFC PATCH 04/14] mm: swap: swap cache support for virtualized
 swap
Message-ID: <20250408150019.GB816@cmpxchg.org>
References: <20250407234223.1059191-1-nphamcs@gmail.com>
 <20250407234223.1059191-5-nphamcs@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407234223.1059191-5-nphamcs@gmail.com>

On Mon, Apr 07, 2025 at 04:42:05PM -0700, Nhat Pham wrote:
> Currently, the swap cache code assumes that the swap space is of a fixed
> size. The virtual swap space is dynamically sized, so the existing
> partitioning code cannot be easily reused.  A dynamic partitioning is
> planned, but for now keep the design simple and just use a flat
> swapcache for vswap.
> 
> Since the vswap's implementation has begun to diverge from the old
> implementation, we also introduce a new build config
> (CONFIG_VIRTUAL_SWAP). Users who do not select this config will get the
> old implementation, with no behavioral change.
> 
> Signed-off-by: Nhat Pham <nphamcs@gmail.com>
> ---
>  mm/Kconfig      | 13 ++++++++++
>  mm/swap.h       | 22 ++++++++++------
>  mm/swap_state.c | 68 +++++++++++++++++++++++++++++++++++++++++--------
>  3 files changed, 85 insertions(+), 18 deletions(-)
> 
> diff --git a/mm/Kconfig b/mm/Kconfig
> index 1b501db06417..1a6acdb64333 100644
> --- a/mm/Kconfig
> +++ b/mm/Kconfig
> @@ -22,6 +22,19 @@ menuconfig SWAP
>  	  used to provide more virtual memory than the actual RAM present
>  	  in your computer.  If unsure say Y.
>  
> +config VIRTUAL_SWAP
> +	bool "Swap space virtualization"
> +	depends on SWAP
> +	default n
> +	help
> +		When this is selected, the kernel is built with the new swap
> +		design. This will allow us to decouple the swap backends
> +		(zswap, on-disk swapfile, etc.), and save disk space when we
> +		use zswap (or the zero-filled swap page optimization).
> +
> +		There might be more lock contentions with heavy swap use, since
> +		the swap cache is no longer range partitioned.
> +
>  config ZSWAP
>  	bool "Compressed cache for swap pages"
>  	depends on SWAP
> diff --git a/mm/swap.h b/mm/swap.h
> index d5f8effa8015..06e20b1d79c4 100644
> --- a/mm/swap.h
> +++ b/mm/swap.h
> @@ -22,22 +22,27 @@ void swap_write_unplug(struct swap_iocb *sio);
>  int swap_writepage(struct page *page, struct writeback_control *wbc);
>  void __swap_writepage(struct folio *folio, struct writeback_control *wbc);
>  
> -/* linux/mm/swap_state.c */
> -/* One swap address space for each 64M swap space */
> +/* Return the swap device position of the swap slot. */
> +static inline loff_t swap_slot_pos(swp_slot_t slot)
> +{
> +	return ((loff_t)swp_slot_offset(slot)) << PAGE_SHIFT;
> +}

In the same vein as the previous email, please avoid mixing moves,
renames and new code as much as possible. This makes it quite hard to
follow what's going on.

I think it would be better if you structure the series as follows:

1. Prep patches. Separate patches for moves, renames, new code.

3. mm: vswap
   - config VIRTUAL_SWAP
   - mm/vswap.c with skeleton data structures, init/exit, Makefile hookup

4. (temporarily) flatten existing address spaces

   IMO you can do the swapcache and zswap in one patch

5+. conversion patches

    Grow mm/vswap.c as you add discrete components like the descriptor
    allocator, swapoff locking, the swap_cgroup tracker etc.

    You're mostly doing this part already. But try to order them by
    complexity and on a "core to periphery" gradient. I.e. swapoff
    locking should probably come before cgroup stuff.

Insert move and rename patches at points where they make the most
sense. I.e. if they can be understood in the current upstream code
already, put them with step 1 prep patches. If you find a move or a
rename can only be understood in the context of one of the components,
put them in a prep patch right before that one.

> @@ -260,6 +269,28 @@ void delete_from_swap_cache(struct folio *folio)
>  	folio_ref_sub(folio, folio_nr_pages(folio));
>  }
>  
> +#ifdef CONFIG_VIRTUAL_SWAP
> +void clear_shadow_from_swap_cache(int type, unsigned long begin,
> +				unsigned long end)
> +{
> +	swp_slot_t slot = swp_slot(type, begin);
> +	swp_entry_t entry = swp_slot_to_swp_entry(slot);
> +	unsigned long index = swap_cache_index(entry);
> +	struct address_space *address_space = swap_address_space(entry);
> +	void *old;
> +	XA_STATE(xas, &address_space->i_pages, index);
> +
> +	xas_set_update(&xas, workingset_update_node);
> +
> +	xa_lock_irq(&address_space->i_pages);
> +	xas_for_each(&xas, old, entry.val + end - begin) {
> +		if (!xa_is_value(old))
> +			continue;
> +		xas_store(&xas, NULL);
> +	}
> +	xa_unlock_irq(&address_space->i_pages);

I don't think you need separate functions for this, init, exit etc. if
you tweak the macros to resolve to one tree. The current code already
works if swapfiles are smaller than SWAP_ADDRESS_SPACE_PAGES and there
is only one tree, after all.

This would save a lot of duplication and keep ifdefs more confined.
