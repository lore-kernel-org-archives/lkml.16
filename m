Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC3F1209686
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 15:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738597093; cv=none; b=mnAFgrX6FiUBHeSFfxB9dnA5xVkfDBDs2Tg4InIeBFCUaeqlrdMeJPvXyPxBUvbluecy7Uo/3WsYQ0pBvRDXmrTiTGd4WEaUSqZBDtnj0qiPNUatuml++JrsWQ9OLcFihH6Tn3Vqm+26uxi17oaFxzfpIYEfQLfZP63d6jClMHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738597093; c=relaxed/simple;
	bh=BTtjScOywshiwKWC0uOPF20eG3SQe1uCmleAuSjsoeI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l202Dj8YSA9M4Q0pcQzzaoBPEWOHuGucphawdtq6fQ/s69omLcOIcPl/kTO+OZai2DNWS9dxXQPlvdI0Zd9CcsNLC4ROvQfmuDP0IwTSQXP1oM3hITVIRqE8Bi3mGcSwiP1tz01IknXpGaeQzBcbuaXPzoaGSMd9IKAWj2XKrlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=GG2SN5Jc; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="GG2SN5Jc"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7b7041273ddso398375185a.3
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 07:38:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1738597090; x=1739201890; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+QutC4Bp0kBOkNqLV2m+TxVs5qOyu/Uk1tkI4OgwW1k=;
        b=GG2SN5JcJLCI7pDfO9fiV4FDdl/M6peoFmq6zrh79XjHLkGqe0AmLGzDfq2yJQReyr
         oMDA75/wsOU+aymP64dnkfl2u45A6OLrKWGQFGsbulp4353Cq0XX8YCdFNVtGH/g29fP
         kpPTkH3EQGc/UcSU7WkcyuskfYJFW2sebZKqG8BKD3XKImUIMNFNHTRa9gNqj72v42+W
         3ubbeszNZ958jw1U5g2lBoYytlAkB/74mTn5xMpKTVV9UHOIdZlxn14WUNSnMmqkeeol
         lFD0pDU5etLqBaf8JUW+MM2EGoqC9W0Zmmb/YPKIs0M4iTUwEYW+figWB5WxiHyrZDdT
         TbIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738597090; x=1739201890;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+QutC4Bp0kBOkNqLV2m+TxVs5qOyu/Uk1tkI4OgwW1k=;
        b=WGdoHeHy8/ZdgAVW0v9LV/Bii1KxXjAeOGQwbF+PqrDOVWPxF7z3bAhGIw1QDND/Ya
         7FUPJgT+BofBYfh7qOzW5FBFYTHoFaTOw0+YQRO233tPkGqZ+4aifv17aIqGaZlqoFre
         uDfl8ma34mcL9y4CCldlbsu/83yuDF3nN78qVqHcfdwFUcZrjOht6mIzFNH6S/7zKTSO
         bqInQQRNRYVjp//lzkuhxKttw5TdcTve0C2H3LXj/O9RHtD+265mqQNEJCF/42z3ibNk
         WWVwNPhbTxL/QN9098ze14KkALJzMk2+kwLd+ZIWRcKp+6ZUKxFoqn8yUcllf0MTDYQk
         0W0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUFkuRQwqAf4vS5hE+m1eAEslxvpt9XFwTvkyGDwUshrX6HlFW2E/Z6DRN2f2j3MFyPaOIFAU7rELCgVsc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYyl1AHUK5PLjEvTXznLlYoJDAWTdGoDzHGaw2Cwv1X0Vcf6le
	/N6GitdSEA1Hsi6HHv9uWlx/CXTjQIV/eHIbfW3fbPUfQvaEournryfh81c4ClE=
X-Gm-Gg: ASbGnctduSGJSEkHH8LeEJDOOkQEqf4S6X1ZCySmEVGpTZbsZs8vYmzuYWCTyAHY6dF
	tt4h0rui8mlnnP8kVNuMjmIVs4i4tggU8LnlGKVI+ke+AoMri1QSDhu1HmepB+YGTeql7jGAfZI
	i6s46MCAnk2dTMmCmacU6JE9ickbw+cH0fZRD5u7hF1g7iptX6+k6x/d2tPj7UuxfUc+I9XTeER
	o91U1RX8soY1LYgz9x+HV6xDAYxf+kTiQBBvZ1frl9Um69r8CMh604Q/0H+0CL2pQEKxruqlfUZ
	HMUCqSSzmogD/1MNO42Hu6IChEVaEfyIhdN6tHiMn9pnH7I8mEd17CA6nh1G80wNx+Q4uHZ8Mw=
	=
X-Google-Smtp-Source: AGHT+IGxWDdk+Y4hr1K+s/2L7RjMtvZ20ECCW0rUX0INQ/Bh4CjR5iJqI4t7BrTH3xZyekIHEtevZg==
X-Received: by 2002:a05:620a:2588:b0:7b6:deaa:3191 with SMTP id af79cd13be357-7bffcd9c454mr3554895485a.55.1738597090459;
        Mon, 03 Feb 2025 07:38:10 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-56-208.washdc.fios.verizon.net. [173.79.56.208])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c00a8d0573sm538247685a.37.2025.02.03.07.38.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 07:38:10 -0800 (PST)
Date: Mon, 3 Feb 2025 10:38:06 -0500
From: Gregory Price <gourry@gourry.net>
To: Honggyu Kim <honggyu.kim@sk.com>
Cc: Joshua Hahn <joshua.hahnjy@gmail.com>, kernel_team@skhynix.com,
	ying.huang@linux.alibaba.com, rafael@kernel.org, lenb@kernel.org,
	gregkh@linuxfoundation.org, akpm@linux-foundation.org,
	rakie.kim@sk.com, dan.j.williams@intel.com,
	Jonathan.Cameron@huawei.com, dave.jiang@intel.com,
	horen.chuang@linux.dev, hannes@cmpxchg.org,
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-mm@kvack.org, kernel-team@meta.com, 42.hyeyoo@gmail.com,
	Honggyu Kim <honggyu.km@gmail.com>
Subject: Re: [PATCH v4] Weighted Interleave Auto-tuning
Message-ID: <Z6Di3oLQg64W0hAM@gourry-fedora-PF4VCD3F>
References: <20250202141247.2219681-1-joshua.hahnjy@gmail.com>
 <a2b428ed-212a-4e39-bcf7-5ab67249132d@sk.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a2b428ed-212a-4e39-bcf7-5ab67249132d@sk.com>

On Mon, Feb 03, 2025 at 09:44:29PM +0900, Honggyu Kim wrote:
> Hi Joshua,
> 
> > A node offlining (or even onlining with no new bandwidth information)
> > will just mean that the node inherits whatever value is stored in
> > iw_table at that moment, whether that contains the default values
> > created on init or the last values that it had taken.
> 
> It looks the call sequence is as follows.
> 
>   cxl_region_perf_attrs_callback()
>   -> cxl_region_update_coordinates()
>   -> node_set_perf_attrs()
>   -> mempolicy_set_node_perf()
>   -> reduce_interleave_weights()
> 
> I haven't searched all the paths of cxl_region_perf_attrs_callback() via
> cxlr->memory_notifier.notifier_call callback pointer, but maybe this
> function is not called when a node is offlined, then I get node
> offlining doesn't trigger re-weight calculation.

This function is called any time a memory block status changes.

static int cxl_region_perf_attrs_callback(struct notifier_block *nb,
                                          unsigned long action, void *arg)
{
...
        if (nid == NUMA_NO_NODE || action != MEM_ONLINE)
                return NOTIFY_DONE;
...
}

But it doesn't do anything if it's not a call to online a memory block,
so the cached performance data in mempolicy won't change when blocks
are taken offline.

So the time the scenario you are proposing can arrise is when the device
does not provide performance information (missing CDAT).


If a user sets manual mode - they're on the hook to manage everything.

This is system-wide setting - not a per-task setting.  We've yet to see
any strong use-case for individual task weights. If there is a use case
for a task not being subject to system-wide weight changes then it's a
use case for task-local weights.

~Gregory
