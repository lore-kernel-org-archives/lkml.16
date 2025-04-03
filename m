Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 105782512F2
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 16:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743698306; cv=none; b=JAyLtqMoQgYUo8rN2Vo3IJB6ZeQFvHo5yZY5ggCzMzYayhlGhDy9Vj3IhbXlxn7o4Km1izRXbpCo/7VcFGFllbGq/PS0M9dUU6tkzmrThYkDk1jVsawfjnpGzF5XT5UVxEokXHgWPM8XI9YMAxOQGV1u9dzqwNRyU/LdblNnOZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743698306; c=relaxed/simple;
	bh=5SabYIMEMRNPM3VOvrmN0vXXi9GCRbx+x5GirPmB6wY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D2Hh0C3M+/OpcYdnR2EmXsIFVXJvnjv7xN85kcH/toyQmwffovUhhrvr/1i+1/nuL7/rIJmM+kqhJjuq45YfVQ4xY/DJU1iOV+FS3zPir2ZQKSCwbHuHx/PsrnWbK14sfQEB4ZUkWALsCAsO2ZZIPllvU4wswI4Rl0/3NT+N03g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b=iBIRRhN7; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="iBIRRhN7"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7c5ba363f1aso139271885a.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 09:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1743698302; x=1744303102; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8kHE37hxmRaBTotqSR2RNNVMRoKL4Qo16Blmg/ywGtk=;
        b=iBIRRhN7jeiUupb4562vIHcLU1nSp6n0E9U/inRMF23a+BRqfQ1H6WRIr6/wLEICrf
         hTC/kasHzv66wrl9W0KcjJ13Tx0GmlywkQalHy/fgUQIRzIauea1DrVLrxMoOp7bhLvM
         0yfjHpRmAGTpLDaHZcz7inWWX/IgtJ+R/ARCudeE6fdBlBUGnR/dmiRXN/fYlat756NQ
         Rq483Qxq5LYuEF7oT65wuIYKNG75xcdX5L8it5DPNU86GneqhBgdoisobL0rwmwN4zqS
         zm0BHrC4zYkqDEl+sRRgNjCAwjZPgnmlv9VpRmM6952vFNLURk5OwqsnqIzdDn1FB/vc
         wwtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743698302; x=1744303102;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8kHE37hxmRaBTotqSR2RNNVMRoKL4Qo16Blmg/ywGtk=;
        b=oBWHZtM+Ad0Ekobs5Rr+wS91FriH91V9RhHXm+9a2ZhT9Pj5LzIC8xBig2aIer7Buc
         qQO5HCZjZs3inB1IrPRTRy1PHvZQImrRukaiCp+l4EXp1iSs1iBoVE3kxpMhDgZ9qiUI
         4scEn406HwSPPDJKU9e4MoCu/M2wD4VELL/GCaYsJecY0xRTezeoeV8nyMw9Qc0ahF2a
         t6wx0VaRgaRo+mYrAEDwQ/OI0tYjOUHeeHQWukJ8Cs9u9XFjmtaGjN/CARkP1SZRIZ/o
         Tet9wPNsrgAIF0+s3je64SQjlUJuxo9wJwOmJ2PI4NwMZrnPoOdxJlP3BoGT80nPgXBJ
         /WVQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+96hJJ+IZlqC412Xmzy+xVdqtlYr/578DbJQp5hQFWPCpJSLPAzIkdxlfN82wHTUAFrGI2Saqrfm7vEI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyO88cWM5X9/1BQMaQeCjWksDe11e5KcpZW6xHkypTNexiIPpE6
	CjRSrkp0Ec7VeUPX2grivhm6gXKaYOSihgLDGbSDJVaFRP/aNtt0rNGu/SihFKI=
X-Gm-Gg: ASbGnct0pRsDx2Bwlz5fcB0KMKXGT+JGWHMWo92nXXeVocnXapJIRqcbYcn+7ywNrV5
	Ro/+Gd+3da/hpqnob0f2p2rSpw3tDuCUzQDXwHGSM4aW05Ygb36mzaN/NY1Kg06zXd8f5YX6bs0
	ruvBFuevbjUOBHT8FZ16S7cezFMfZgODlzy0EABO4zFHu+LHNGRbvQgRyaRUp/ozMhqFI56yvR9
	5kfWnTHF8GBES2fOF0j/saVE263KTgt03cmM5EqndkLr1wBkEK84yxIwVklrhV4Lj6j4PqMLYw/
	7mepKh16MHZojTUzkmWCMC31c1u/w/kyM9nq7tn3L1s=
X-Google-Smtp-Source: AGHT+IEEsdFf1LaMB2GezCtiKDLY6ywrkzjcE11zVM3JMzDGnvIDIL//sh7UXZqYvqqen1XIm32Nsw==
X-Received: by 2002:a05:620a:2617:b0:7c3:c3bb:2538 with SMTP id af79cd13be357-7c76df6874bmr420292985a.14.1743698301747;
        Thu, 03 Apr 2025 09:38:21 -0700 (PDT)
Received: from localhost ([2603:7000:c01:2716:da5e:d3ff:fee7:26e7])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c76ea9691asm95683085a.111.2025.04.03.09.38.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 09:38:21 -0700 (PDT)
Date: Thu, 3 Apr 2025 12:38:19 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Nhat Pham <nphamcs@gmail.com>
Cc: akpm@linux-foundation.org, yosry.ahmed@linux.dev,
	chengming.zhou@linux.dev, sj@kernel.org, linux-mm@kvack.org,
	kernel-team@meta.com, linux-kernel@vger.kernel.org,
	gourry@gourry.net, ying.huang@linux.alibaba.com,
	jonathan.cameron@huawei.com, dan.j.williams@intel.com,
	linux-cxl@vger.kernel.org, minchan@kernel.org,
	senozhatsky@chromium.org
Subject: Re: [PATCH v2] zsmalloc: prefer the the original page's node for
 compressed data
Message-ID: <20250403163819.GA368504@cmpxchg.org>
References: <20250402204416.3435994-1-nphamcs@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250402204416.3435994-1-nphamcs@gmail.com>

On Wed, Apr 02, 2025 at 01:44:16PM -0700, Nhat Pham wrote:
> Currently, zsmalloc, zswap's and zram's backend memory allocator, does
> not enforce any policy for the allocation of memory for the compressed
> data, instead just adopting the memory policy of the task entering
> reclaim, or the default policy (prefer local node) if no such policy is
> specified. This can lead to several pathological behaviors in
> multi-node NUMA systems:
> 
> 1. Systems with CXL-based memory tiering can encounter the following
>    inversion with zswap/zram: the coldest pages demoted to the CXL tier
>    can return to the high tier when they are reclaimed to compressed
>    swap, creating memory pressure on the high tier.
> 
> 2. Consider a direct reclaimer scanning nodes in order of allocation
>    preference. If it ventures into remote nodes, the memory it
>    compresses there should stay there. Trying to shift those contents
>    over to the reclaiming thread's preferred node further *increases*
>    its local pressure, and provoking more spills. The remote node is
>    also the most likely to refault this data again. This undesirable
>    behavior was pointed out by Johannes Weiner in [1].
> 
> 3. For zswap writeback, the zswap entries are organized in
>    node-specific LRUs, based on the node placement of the original
>    pages, allowing for targeted zswap writeback for specific nodes.
> 
>    However, the compressed data of a zswap entry can be placed on a
>    different node from the LRU it is placed on. This means that reclaim
>    targeted at one node might not free up memory used for zswap entries
>    in that node, but instead reclaiming memory in a different node.
> 
> All of these issues will be resolved if the compressed data go to the
> same node as the original page. This patch encourages this behavior by
> having zswap and zram pass the node of the original page to zsmalloc,
> and have zsmalloc prefer the specified node if we need to allocate new
> (zs)pages for the compressed data.
> 
> Note that we are not strictly binding the allocation to the preferred
> node. We still allow the allocation to fall back to other nodes when
> the preferred node is full, or if we have zspages with slots available
> on a different node. This is OK, and still a strict improvement over
> the status quo:
> 
> 1. On a system with demotion enabled, we will generally prefer
>    demotions over compressed swapping, and only swap when pages have
>    already gone to the lowest tier. This patch should achieve the
>    desired effect for the most part.
> 
> 2. If the preferred node is out of memory, letting the compressed data
>    going to other nodes can be better than the alternative (OOMs,
>    keeping cold memory unreclaimed, disk swapping, etc.).
> 
> 3. If the allocation go to a separate node because we have a zspage
>    with slots available, at least we're not creating extra immediate
>    memory pressure (since the space is already allocated).
> 
> 3. While there can be mixings, we generally reclaim pages in
>    same-node batches, which encourage zspage grouping that is more
>    likely to go to the right node.
> 
> 4. A strict binding would require partitioning zsmalloc by node, which
>    is more complicated, and more prone to regression, since it reduces
>    the storage density of zsmalloc. We need to evaluate the tradeoff
>    and benchmark carefully before adopting such an involved solution.
> 
> [1]: https://lore.kernel.org/linux-mm/20250331165306.GC2110528@cmpxchg.org/
> 
> Suggested-by: Gregory Price <gourry@gourry.net>
> Signed-off-by: Nhat Pham <nphamcs@gmail.com>

Acked-by: Johannes Weiner <hannes@cmpxchg.org>
