Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA2915ECD7
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 14:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744208678; cv=none; b=DUaq0DgYWg7hb/wcI7nmpakyaWS3vs9pEG9tf8NLPqCC2Jk5wp5DmDlFfY8YrilAh1CPUuQrRzqT6TAJ2EvXxhuA0a5YP/QLm/xq4wb3EOOzORDE+kUvWyB4/ZDmg/5S0Vhm9rH2N30brlKoEoH2J9SYAxo4BuGQ6wKU4yTvfQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744208678; c=relaxed/simple;
	bh=6/u5m1jBcdHSJva39xbCZKrMFZjzeW8DF1B14oSOKlc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hdY0W9A14FPWZci5oIrnIkT6IkJCavGomAQIN3r1xbqi3HsguyysL4P/BPVwzJMMWi+sCZH5ThEmsDkzdJ+tGlMsipKLV27UMiTtFNkgze6c0nau/0bnwIOrKsFJ66RGjY7EprpjtVvnJLtE+wNniLU6sKVS77cxR5mS89L2wgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=FGCSBHhW; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="FGCSBHhW"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-22438c356c8so67150765ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 07:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1744208675; x=1744813475; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=w/247GU5kAXrWlzdAEKnKFSLcJSyBRJQxmFUsRk34ps=;
        b=FGCSBHhWQSEJ/2IFpnZ7N0HnYWPBCeIPOAgD6sKPNYlgTJDXFczAxj0YcW5YwLyfQZ
         Or8unqhYZaSEr6oi+s5fP8s3rv/C98Dx6/fGun3ASyWznSi4aTdMvKcz5QubZ2rPalc0
         j7KI4gLnPBYHTXnQZCnemmVpojQXuhCL9gKshAALK6vz6IiHHoWJEWwFcN9kFQtEDJQB
         ORuPx9BkAx3XBwn/5ao7gGUxZnyc+z7R1dsD71FAZtR3s7Sa8MmBU7p1E8ZtvQNM8Kxf
         B2S92AoIN0i1+DoFy69oZfrZb0n29BD8alKmGvXB2GWo8ADF9N/Ryv2Pk+ZsLifqiK9y
         ckFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744208675; x=1744813475;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w/247GU5kAXrWlzdAEKnKFSLcJSyBRJQxmFUsRk34ps=;
        b=CdPVyo2915ydacbWNCu+rhRNk/YrdH/WS8meiI2AETWU7L+giJBRpTS82IQXa5cF71
         MMji/36QxhkIg3zAmGgjdlGkzFMO+5EJMOnntQJjxBFFDQV0e8Rg0AFZ6h1T+sNf+JE5
         dJSJVHQAu+HGbWybXuq0SDnzjVehBv+utp/4bxjKxDxOvAk5t0f9CarowHjfyEFtXF2c
         WyoxzrdkuZcn34FHgJnmmfDYkctWtqdZikpVDJv4AYcoq/IDBdHETs+jNaoNet5WZXnM
         7ZJGpA6opJ0jl6sGmuqWqOruZy8YzcXGwtiwX1z0UpLnSjW8FToYIivSyhiPX5tpBMPt
         sc6w==
X-Gm-Message-State: AOJu0YxRBdOA7bjeXPcobDmHUW/fBWgTJNIgV5ki1w1zkN3MsyhsAxGQ
	1OQArD3sdqZhDMtXuZ3LoVRoczAlYAarlyYrW9UHCxOYeyZbvsISpHDyIQEATg==
X-Gm-Gg: ASbGncu2+4/Shk89zT2NzTLwFVjlnuOQ0rAnQkXrj7CKmYYzVhYEY4SXWztRDO8/sk+
	nlEfCBAdPcn7e4mgawCPEG4jEit69f4jckMUYUU3B51zDaKEsHcWHPsmLhyD3idLwWIZJ7ON9QK
	FHwzm+P/OUWFWhE0RqKZbma0h9QfI1CP+LUwfIaE+4vfeLwq2BY+3xVq4XBDXpd4m68PkRDg79V
	kL4R8CbZPFE4q8r3D/xiG+WfB5ay1BVqRckj6f0B8ninKEGZP3ItinLfyPIy4Eo0c8ZbNQIAeKr
	+QX6fSS7vgb0umFuyyiaXh/g6Kgdwk0iR95vl216
X-Google-Smtp-Source: AGHT+IHkq9PrBRh5bEbrMFd4TtWNwe5eTqKHX2qUyRTr1z8/K6J7F81wNhoRQ1kBbvB5ATIMBjxgfQ==
X-Received: by 2002:a17:903:94e:b0:223:fbc7:25f4 with SMTP id d9443c01a7336-22ac29a9929mr45469925ad.14.1744208675041;
        Wed, 09 Apr 2025 07:24:35 -0700 (PDT)
Received: from bytedance ([115.190.40.10])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b6288asm12440185ad.9.2025.04.09.07.24.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 07:24:34 -0700 (PDT)
Date: Wed, 9 Apr 2025 22:24:14 +0800
From: Aaron Lu <ziqianlu@bytedance.com>
To: Valentin Schneider <vschneid@redhat.com>,
	Ben Segall <bsegall@google.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Don <joshdon@google.com>, Ingo Molnar <mingo@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Xi Wang <xii@google.com>
Cc: linux-kernel@vger.kernel.org, Juri Lelli <juri.lelli@redhat.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>, Mel Gorman <mgorman@suse.de>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Chuyi Zhou <zhouchuyi@bytedance.com>,
	Jan Kiszka <jan.kiszka@siemens.com>
Subject: Re: [RFC PATCH v2 7/7] sched/fair: alternative way of accounting
 throttle time
Message-ID: <20250409142414.GA687147@bytedance>
References: <20250409120746.635476-1-ziqianlu@bytedance.com>
 <20250409120746.635476-8-ziqianlu@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409120746.635476-8-ziqianlu@bytedance.com>

On Wed, Apr 09, 2025 at 08:07:46PM +0800, Aaron Lu wrote:
> Implement an alternative way of accounting cfs_rq throttle time which:
> - starts accounting when a throttled cfs_rq has no tasks enqueued and its
>   throttled list is not empty;
> - stops accounting when this cfs_rq gets unthrottled or a task gets
>   enqueued.
> 
> This way, the accounted throttle time is when the cfs_rq has absolutely
> no tasks enqueued and has tasks throttled.
> 
> Signed-off-by: Aaron Lu <ziqianlu@bytedance.com>
> ---
>  kernel/sched/fair.c  | 112 ++++++++++++++++++++++++++++++++-----------
>  kernel/sched/sched.h |   4 ++
>  2 files changed, 89 insertions(+), 27 deletions(-)
> 
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 20471a3aa35e6..70f7de82d1d9d 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -5300,6 +5300,7 @@ place_entity(struct cfs_rq *cfs_rq, struct sched_entity *se, int flags)
>  
>  static void check_enqueue_throttle(struct cfs_rq *cfs_rq);
>  static inline int cfs_rq_throttled(struct cfs_rq *cfs_rq);
> +static void account_cfs_rq_throttle_self(struct cfs_rq *cfs_rq);
>  
>  static void
>  requeue_delayed_entity(struct sched_entity *se);
> @@ -5362,10 +5363,14 @@ enqueue_entity(struct cfs_rq *cfs_rq, struct sched_entity *se, int flags)
>  		if (throttled_hierarchy(cfs_rq)) {
>  			struct rq *rq = rq_of(cfs_rq);
>  
> -			if (cfs_rq_throttled(cfs_rq) && !cfs_rq->throttled_clock)
> -				cfs_rq->throttled_clock = rq_clock(rq);
> -			if (!cfs_rq->throttled_clock_self)
> -				cfs_rq->throttled_clock_self = rq_clock(rq);
> +			if (cfs_rq->throttled_clock) {
> +				cfs_rq->throttled_time +=
> +					rq_clock(rq) - cfs_rq->throttled_clock;
> +				cfs_rq->throttled_clock = 0;
> +			}

This probably needs more explanation.

We can also take cfs_b->lock and directly accounts the time into
cfs_b->throttled_time, but considering enqueue can be frequent so to
avoid possible lock contention, I chose to account this time to the cpu
local cfs_rq and on unthrottle, add the local accounted time to
cfs_b->throttled_time.

This has a side effect though: when reading cpu.stat and cpu.stat.local
for a task group with quota setting, the throttled_usec in cpu.stat can
be slightly smaller than throttled_usec in cpu.stat.local since some
throttled time is not accounted to cfs_b yet...

> +
> +			if (cfs_rq->throttled_clock_self)
> +				account_cfs_rq_throttle_self(cfs_rq);
>  		}
>  #endif
>  	}
