Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44B642FE36F
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 17:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750268542; cv=none; b=ucgRYIDF785YL3qiEAo2Lg/4gHUiuGPvt12lxQYE/19Z5TZitixR4pWpOnDQKYmEQpB4+erLEQcQ3wAq4fvC/wOD/WIHK/97UgLT/imhht7PRF7dna6D651/T83kg7vyorg0vdTk3pTk53+87/0Jc7zSLFhA6stdeFRCep9BGBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750268542; c=relaxed/simple;
	bh=k+WSJqnoiVN0IJh+lIlYBCAtA1ykxdGAezbG8ofc+08=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MTMeutjO53krYPLR39wkhmMoC0IJDcL73kjADveBXx99xsyzF0ZvI3VhDbuArphTQ38k8kosXijqL4OjQ9Q861MXi5c4HYPWZUqAkrdRGRIB0WxB6+1se4tMeNU8lUAPJ8yR7TbqEwA/i8jONRE/Ogf9MyPP9/DLyi3JM7C7hRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nlOo1gf8; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nlOo1gf8"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-72c47631b4cso4732191a34.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 10:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750268539; x=1750873339; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ALQlJ1RqfpncfV715L7OdUSgYhmYfcG/SeD8Mhl1jzk=;
        b=nlOo1gf8gzOCT8EBmXywfNjHWEOumPw+FTo/SXjddItealEeMHWtGV2E6vEwLM4qEi
         7YxZtzV7dZI8VekRi9KhZ4PLbM987a5v6H6CNrnxKL5f1MNtKqmCxM4noclmjkDqAKn/
         b9XZrGIri4heYCMP42egmKzMyyJqvWEgTh00HAHqiNm8yQqGaLZkiYiX+HWQSeMlpSpH
         Ez40aq5VVfO/gKyjt3qsHzoE7Bo3VAJEmmBgdOxUVv8S7hCNLiXiudvAV9tARcs434wp
         aqNLt4ITY2TIZWG6MkC7rDdd/LWb9L+27ObLKsTnvwF0q6BJNNb+AcvbkCx5tIP2Acx1
         jOCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750268539; x=1750873339;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ALQlJ1RqfpncfV715L7OdUSgYhmYfcG/SeD8Mhl1jzk=;
        b=GQai3EwbY7RQai/FCSM9qjobXN4HcIHvt4vwRYKEwUyFeIP2vPLpiYwkYdRxD3VdsN
         f10YpBHklTvXu01akg7nwDz0aalYOUgy5UFY/PyuJzNT7YYhmgkutu4W6q6nDQvB0Ull
         uIOBtL2d+P38h6R+chr4hw6yavNmTbTQMv0GqANAyF99U9AbSt8mQ+g5nPf5av1o1qIg
         lcIwjfTu1ycWBA74HPDyGXhloQ6dUfL3hTsNE08crm0ZafStHHhR0duBpAEsEhL1MSDd
         30N94VnWpWePx/givm2dzzdTKNgWaW8mokgZzYcOCi1aoylWx/hR+4p0ErCeKtPk20xK
         fo5w==
X-Forwarded-Encrypted: i=1; AJvYcCUl0sNmWuz94BFaMvTKHh07cGszSzIwNS9JBU1tCnXY8ta5DVcXjwnFCc5L4YLHpnTxJUz36J7dSvpjZLw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIcN5DASuCZw/LEQvpjdYP/hFScqXLUHvVa2iNGQ/+PUl3u4MA
	XVUwoow656AhARChUcqkE0svy0V0sZqXSuI3ipTiQtaG2tqWjNhBzFuuDCI7ludLFcE=
X-Gm-Gg: ASbGncvEUQOesgotOC9lFKvyTGFNXDGiJS8zSiunIs4bFeliovNbx1c9Ty8dovDB/1l
	vuFIWhE2zrHFh4ye/F/CZ4ZHOFX94LAXi/cWhiUZJfExBwWAOTFU4zwHl3+GTxFe5DjPUrQ95KX
	DdxYpcxrzWhhTEbgpQ5qkvbHZHVJEq7TPLwXFHUg2tAtfppymXAjB46EsOxw4kjJzb4SFbqvMZY
	/mrfmeUsLZAniWvjD6wHFtWU8hLOSaLYG2bkgRhysAzS5LGQlRNdh2QB5VLN2DeU4N4bUfttir4
	Z7lI5A3eGYJsEXV5AqoZbMG7vKyTMtpzp4RweD1Yxa9BY5XAaRRolpF/64KAu8ITodVWBA==
X-Google-Smtp-Source: AGHT+IFFFmB4u98R4eAo2rUrAWhzhlCaoI+JO8SWCcz50Wh9AA3SCYViXrulit3sJ5S4KHyxDHKWTw==
X-Received: by 2002:a05:6830:8218:b0:72c:10d5:783e with SMTP id 46e09a7af769-73a3627941cmr9790083a34.10.1750268539221;
        Wed, 18 Jun 2025 10:42:19 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:1b3b:c162:aefa:da1b])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73a284febb6sm2055391a34.37.2025.06.18.10.42.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 10:42:18 -0700 (PDT)
Date: Wed, 18 Jun 2025 20:42:17 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Zi Yan <ziy@nvidia.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>
Subject: mm/shmem.c:2223 shmem_split_large_entry() error: uninitialized
 symbol 'entry_order'.
Message-ID: <428fa0fe-8960-4566-9054-5bfd967c18c8@suswa.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4774cfe3543abb8ee98089f535e28ebfd45b975a
commit: d53c78fffe7ad364397c693522ceb4d152c2aacd mm/shmem: use xas_try_split() in shmem_split_large_entry()
config: x86_64-randconfig-161-20250614 (https://download.01.org/0day-ci/archive/20250614/202506141535.tjdnCMqW-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202506141535.tjdnCMqW-lkp@intel.com/

smatch warnings:
mm/shmem.c:2223 shmem_split_large_entry() error: uninitialized symbol 'entry_order'.

vim +/entry_order +2223 mm/shmem.c

12885cbe88ddf6 Baolin Wang 2024-08-12  2151  static int shmem_split_large_entry(struct inode *inode, pgoff_t index,
12885cbe88ddf6 Baolin Wang 2024-08-12  2152  				   swp_entry_t swap, gfp_t gfp)
12885cbe88ddf6 Baolin Wang 2024-08-12  2153  {
12885cbe88ddf6 Baolin Wang 2024-08-12  2154  	struct address_space *mapping = inode->i_mapping;
12885cbe88ddf6 Baolin Wang 2024-08-12  2155  	XA_STATE_ORDER(xas, &mapping->i_pages, index, 0);
d53c78fffe7ad3 Zi Yan      2025-03-14  2156  	int split_order = 0, entry_order;
d53c78fffe7ad3 Zi Yan      2025-03-14  2157  	int i;
12885cbe88ddf6 Baolin Wang 2024-08-12  2158  
12885cbe88ddf6 Baolin Wang 2024-08-12  2159  	/* Convert user data gfp flags to xarray node gfp flags */
12885cbe88ddf6 Baolin Wang 2024-08-12  2160  	gfp &= GFP_RECLAIM_MASK;
12885cbe88ddf6 Baolin Wang 2024-08-12  2161  
12885cbe88ddf6 Baolin Wang 2024-08-12  2162  	for (;;) {
12885cbe88ddf6 Baolin Wang 2024-08-12  2163  		void *old = NULL;
d53c78fffe7ad3 Zi Yan      2025-03-14  2164  		int cur_order;
d53c78fffe7ad3 Zi Yan      2025-03-14  2165  		pgoff_t swap_index;
12885cbe88ddf6 Baolin Wang 2024-08-12  2166  
12885cbe88ddf6 Baolin Wang 2024-08-12  2167  		xas_lock_irq(&xas);
12885cbe88ddf6 Baolin Wang 2024-08-12  2168  		old = xas_load(&xas);
12885cbe88ddf6 Baolin Wang 2024-08-12  2169  		if (!xa_is_value(old) || swp_to_radix_entry(swap) != old) {
12885cbe88ddf6 Baolin Wang 2024-08-12  2170  			xas_set_err(&xas, -EEXIST);
12885cbe88ddf6 Baolin Wang 2024-08-12  2171  			goto unlock;

Imagine we hit this goto on the first iteration

12885cbe88ddf6 Baolin Wang 2024-08-12  2172  		}
12885cbe88ddf6 Baolin Wang 2024-08-12  2173  
d53c78fffe7ad3 Zi Yan      2025-03-14  2174  		entry_order = xas_get_order(&xas);
12885cbe88ddf6 Baolin Wang 2024-08-12  2175  
d53c78fffe7ad3 Zi Yan      2025-03-14  2176  		if (!entry_order)
d53c78fffe7ad3 Zi Yan      2025-03-14  2177  			goto unlock;
12885cbe88ddf6 Baolin Wang 2024-08-12  2178  
12885cbe88ddf6 Baolin Wang 2024-08-12  2179  		/* Try to split large swap entry in pagecache */
d53c78fffe7ad3 Zi Yan      2025-03-14  2180  		cur_order = entry_order;
d53c78fffe7ad3 Zi Yan      2025-03-14  2181  		swap_index = round_down(index, 1 << entry_order);
d53c78fffe7ad3 Zi Yan      2025-03-14  2182  
d53c78fffe7ad3 Zi Yan      2025-03-14  2183  		split_order = xas_try_split_min_order(cur_order);
d53c78fffe7ad3 Zi Yan      2025-03-14  2184  
d53c78fffe7ad3 Zi Yan      2025-03-14  2185  		while (cur_order > 0) {
d53c78fffe7ad3 Zi Yan      2025-03-14  2186  			pgoff_t aligned_index =
d53c78fffe7ad3 Zi Yan      2025-03-14  2187  				round_down(index, 1 << cur_order);
d53c78fffe7ad3 Zi Yan      2025-03-14  2188  			pgoff_t swap_offset = aligned_index - swap_index;
d53c78fffe7ad3 Zi Yan      2025-03-14  2189  
d53c78fffe7ad3 Zi Yan      2025-03-14  2190  			xas_set_order(&xas, index, split_order);
d53c78fffe7ad3 Zi Yan      2025-03-14  2191  			xas_try_split(&xas, old, cur_order);
d53c78fffe7ad3 Zi Yan      2025-03-14  2192  			if (xas_error(&xas))
12885cbe88ddf6 Baolin Wang 2024-08-12  2193  				goto unlock;
12885cbe88ddf6 Baolin Wang 2024-08-12  2194  
12885cbe88ddf6 Baolin Wang 2024-08-12  2195  			/*
12885cbe88ddf6 Baolin Wang 2024-08-12  2196  			 * Re-set the swap entry after splitting, and the swap
12885cbe88ddf6 Baolin Wang 2024-08-12  2197  			 * offset of the original large entry must be continuous.
12885cbe88ddf6 Baolin Wang 2024-08-12  2198  			 */
d53c78fffe7ad3 Zi Yan      2025-03-14  2199  			for (i = 0; i < 1 << cur_order;
d53c78fffe7ad3 Zi Yan      2025-03-14  2200  			     i += (1 << split_order)) {
12885cbe88ddf6 Baolin Wang 2024-08-12  2201  				swp_entry_t tmp;
12885cbe88ddf6 Baolin Wang 2024-08-12  2202  
d53c78fffe7ad3 Zi Yan      2025-03-14  2203  				tmp = swp_entry(swp_type(swap),
d53c78fffe7ad3 Zi Yan      2025-03-14  2204  						swp_offset(swap) + swap_offset +
d53c78fffe7ad3 Zi Yan      2025-03-14  2205  							i);
12885cbe88ddf6 Baolin Wang 2024-08-12  2206  				__xa_store(&mapping->i_pages, aligned_index + i,
12885cbe88ddf6 Baolin Wang 2024-08-12  2207  					   swp_to_radix_entry(tmp), 0);
12885cbe88ddf6 Baolin Wang 2024-08-12  2208  			}
d53c78fffe7ad3 Zi Yan      2025-03-14  2209  			cur_order = split_order;
d53c78fffe7ad3 Zi Yan      2025-03-14  2210  			split_order = xas_try_split_min_order(split_order);
12885cbe88ddf6 Baolin Wang 2024-08-12  2211  		}
12885cbe88ddf6 Baolin Wang 2024-08-12  2212  
12885cbe88ddf6 Baolin Wang 2024-08-12  2213  unlock:
12885cbe88ddf6 Baolin Wang 2024-08-12  2214  		xas_unlock_irq(&xas);
12885cbe88ddf6 Baolin Wang 2024-08-12  2215  
12885cbe88ddf6 Baolin Wang 2024-08-12  2216  		if (!xas_nomem(&xas, gfp))
12885cbe88ddf6 Baolin Wang 2024-08-12  2217  			break;

And we hit this break.

12885cbe88ddf6 Baolin Wang 2024-08-12  2218  	}
12885cbe88ddf6 Baolin Wang 2024-08-12  2219  
12885cbe88ddf6 Baolin Wang 2024-08-12  2220  	if (xas_error(&xas))
12885cbe88ddf6 Baolin Wang 2024-08-12  2221  		return xas_error(&xas);
12885cbe88ddf6 Baolin Wang 2024-08-12  2222  
d53c78fffe7ad3 Zi Yan      2025-03-14 @2223  	return entry_order;
6cec2b95dadf77 Miaohe Lin  2022-05-19  2224  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

