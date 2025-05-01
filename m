Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com [209.85.219.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A456B1CA84
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 14:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746108154; cv=none; b=d6goYXKiXLEMNTBmtfCIVUHKlulRQgxNEox2JdDQ2/sVpwv8v3RPeDLWXj+ZOT5sJjheL3QRIopChVYNseDECxOdVHfkERRqmz1/yNS4mO5JJ/gZ+lpwtBT+tYqcxqw5nikOyWKpcISQ9pF4EaIaiGAFYllJnoKiJ0zXIML+3ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746108154; c=relaxed/simple;
	bh=yLfkEC+HJVrswyhnBDKP/tNM/Op3VG40khYCfWbYgsY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nHetA6aGiMMuwpwSaPUma8UvrDDgW1OX8PuyXuWx7IYZa9DNThpWHuRBIdbUnvILS3mK+gjU2zjPiQ6wfd6jCCVvft4xYRmMcoNTb8hYmAEhvAoxSY6tdxUJC8BXBO/55hMBkYwXkRn6z7U6Q4654BqQN9L6/sYuFb5R3L6VX6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b=y68lxEsk; arc=none smtp.client-ip=209.85.219.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="y68lxEsk"
Received: by mail-qv1-f66.google.com with SMTP id 6a1803df08f44-6ecfbf8fa76so14985846d6.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 07:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1746108151; x=1746712951; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wsPTvIUlonTz6aoFURvjc48QUmCzpcROb/H1/P6AxH4=;
        b=y68lxEskeUCv88H11H2TsfKsn/FNz2xVaOtwJwM6rpIlP7ofBr/JrATzTpKvANlvEq
         A5Kou4Ju1HFI4dv0CYOeVlpxX1AUlgQ5NEsSEC5lMSwpGPaan/G9eHjMi46SApZk/oIy
         poyHkt95fNqk4j5Y4Dkla7xgaqLHC2HqoRm2RArDj9taa7/BBNeDA7iBDMMgJx90+d+t
         4iEKlMifZTSVXU/fCoGsf+0zEwFCowfxBpTr6HzTUe1HKNYxpR4T0BVrCcHdR3GLqsjh
         L9nMV72g9dsnq8anyA/MgrtBvbglWpCNUuSKDVrbVsEd0WBlfJuQQvXQR0M6v/U/K/L7
         ddPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746108151; x=1746712951;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wsPTvIUlonTz6aoFURvjc48QUmCzpcROb/H1/P6AxH4=;
        b=aNMlzC5Z8cZqdYT6ivBJqCKRRVjUYcRoZ8D7HXZvBT7fZ/0I/CvicYeCKb4JZBX2QZ
         zNjs5QXB4Z1X7ec0n4pTdFTCTq3x+C8ZihY4pGK3e8H3CwCEZkvKO5CCPJygHUJae6rY
         jzRAtl+ABqFwwWqkI3Fhr2TbRyZjrA12AJq9eoLbuTCC0R+pQmJ3tby5kmgT8ZDa+4gF
         SmF/u17/Pu7GpJ837K2Rbzwr88/Kw14vC6O7Odw3ZJir4V5RV04rGERXxzpft3/O9EJe
         zAOCj/kvjlMUERxD4tIhLHgPtlSoEvpFtUNrN4Ajz6AL2VspdYqqDje4RumZVBxqIgbi
         dHFw==
X-Forwarded-Encrypted: i=1; AJvYcCUD0clRC1lTHUxrqlzrxL+WzPoRYsHprhYSxYWaa/UncWEOhJ9KXlnR+3TPA59dK13/1HpJiQRZFdIN8+Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMW024Esvy0qAI7UmJKMBqDDXzfuxkB501UPtsmn/wNBr7uelG
	VPutsEab9oe5/sTPgjhhB4L8ZC8pNIAbs1PDvGu/WHgJmej98/tvPy61TbV2NT4=
X-Gm-Gg: ASbGnctz9tSJtuc5mWQ3zQUB00pRwWUpF3V5OFXjaJJmqXRnGChg/6cN/X3W77C7lw1
	mGjjKt/qniIv/La2EcAIMZKemv4I7oZJ9xTZ1IlsmE9EkNDgoXy4K+5B8mY71o/edsT6IKVxogx
	c+yW9lRQfWcbMKclCublR8WYbhGROGzZO97AjI/hB6EBMyv9nMgcy5+aG3Aq6bBwbs/wFl8As2h
	PMjzGbDWc49Xf8e0NPjJFdLucPzKC4d/3NmmSa3Pn7IG7qg+aLOaqNz9ikreggURV5F3CNhIzsz
	SiTrZPt9R2ywe2+Sqm6ZfhfMUYLF/1R6nwx5IGYQH+4NJdWnxw==
X-Google-Smtp-Source: AGHT+IHMMzdAha+mSe5FENeDnuJbBSEZwl1rV0kTSW+UDo/woOhAYywdrFjkvAnvanulduGVihb2gQ==
X-Received: by 2002:a05:6214:1306:b0:6e4:3eb1:2bdb with SMTP id 6a1803df08f44-6f4fe1357c5mr100135346d6.43.1746108151086;
        Thu, 01 May 2025 07:02:31 -0700 (PDT)
Received: from localhost ([2603:7000:c01:2716:365a:60ff:fe62:ff29])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6f50f3b058dsm4858996d6.4.2025.05.01.07.02.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 07:02:30 -0700 (PDT)
Date: Thu, 1 May 2025 10:02:26 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Qun-Wei Lin <qun-wei.lin@mediatek.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Nhat Pham <nphamcs@gmail.com>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Minchan Kim <minchan@kernel.org>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Casper Li <casper.li@mediatek.com>,
	Chinwen Chang <chinwen.chang@mediatek.com>,
	Andrew Yang <andrew.yang@mediatek.com>,
	James Hsu <james.hsu@mediatek.com>, Barry Song <21cnbao@gmail.com>
Subject: Re: [PATCH] mm: Add Kcompressd for accelerated memory compression
Message-ID: <20250501140226.GE2020@cmpxchg.org>
References: <20250430082651.3152444-1-qun-wei.lin@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430082651.3152444-1-qun-wei.lin@mediatek.com>

On Wed, Apr 30, 2025 at 04:26:41PM +0800, Qun-Wei Lin wrote:
> This patch series introduces a new mechanism called kcompressd to
> improve the efficiency of memory reclaiming in the operating system.
> 
> Problem:
>   In the current system, the kswapd thread is responsible for both scanning
>   the LRU pages and handling memory compression tasks (such as those
>   involving ZSWAP/ZRAM, if enabled). This combined responsibility can lead
>   to significant performance bottlenecks, especially under high memory
>   pressure. The kswapd thread becomes a single point of contention, causing
>   delays in memory reclaiming and overall system performance degradation.
> 
> Solution:
>   Introduced kcompressd to handle asynchronous compression during memory
>   reclaim, improving efficiency by offloading compression tasks from
>   kswapd. This allows kswapd to focus on its primary task of page reclaim
>   without being burdened by the additional overhead of compression.
> 
> In our handheld devices, we found that applying this mechanism under high
> memory pressure scenarios can increase the rate of pgsteal_anon per second
> by over 260% compared to the situation with only kswapd. Additionally, we
> observed a reduction of over 50% in page allocation stall occurrences,
> further demonstrating the effectiveness of kcompressd in alleviating memory
> pressure and improving system responsiveness.

Yes, I think parallelizing this work makes a lot of sense.

> Co-developed-by: Barry Song <21cnbao@gmail.com>
> Signed-off-by: Barry Song <21cnbao@gmail.com>
> Signed-off-by: Qun-Wei Lin <qun-wei.lin@mediatek.com>
> Reference: Re: [PATCH 0/2] Improve Zram by separating compression context from kswapd - Barry Song
>            https://lore.kernel.org/lkml/20250313093005.13998-1-21cnbao@gmail.com/
> ---
>  include/linux/mmzone.h |  6 ++++
>  mm/mm_init.c           |  1 +
>  mm/page_io.c           | 71 ++++++++++++++++++++++++++++++++++++++++++
>  mm/swap.h              |  6 ++++
>  mm/vmscan.c            | 25 +++++++++++++++
>  5 files changed, 109 insertions(+)
> 
> diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
> index 6ccec1bf2896..93c9195a54ae 100644
> --- a/include/linux/mmzone.h
> +++ b/include/linux/mmzone.h
> @@ -23,6 +23,7 @@
>  #include <linux/page-flags.h>
>  #include <linux/local_lock.h>
>  #include <linux/zswap.h>
> +#include <linux/kfifo.h>
>  #include <asm/page.h>
>  
>  /* Free memory management - zoned buddy allocator.  */
> @@ -1398,6 +1399,11 @@ typedef struct pglist_data {
>  
>  	int kswapd_failures;		/* Number of 'reclaimed == 0' runs */
>  
> +#define KCOMPRESS_FIFO_SIZE 256
> +	wait_queue_head_t kcompressd_wait;
> +	struct task_struct *kcompressd;
> +	struct kfifo kcompress_fifo;

The way you implemented this adds time-and-space overhead even on
systems that don't have any sort of swap compression enabled.

That seems unnecessary. There is an existing method for asynchronous
writeback, and pageout() is naturally fully set up to handle this.

IMO the better way to do this is to make zswap_store() (and
zram_bio_write()?) asynchronous. Make those functions queue the work
and wake the compression daemon, and then have the daemon call
folio_end_writeback() / bio_endio() when it's done with it.
