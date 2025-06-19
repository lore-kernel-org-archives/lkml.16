Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 418AC2512FF
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 13:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750338812; cv=none; b=HwkPqHitsMGRv+q0nuLLtPv/sQJ7Deu+uMsXXuviyzXDkOnYpbQ2ZECfopXnFt7fgDzwVx4ogQZXWXFBv3MvxdmAElhKu29NqwKwUDiJ2xM39GvwgxiBR/Yclx4A5A6CVYqEFPF+WvMpDkAgy1vAwZPEvAQBaMBGJAzgr6Q7WSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750338812; c=relaxed/simple;
	bh=rml3iTKOF2Tzumhd3nX6q/FjWjEnnbnCensCbQfiEPc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pnZz5qjYOv+sbQI7PtKz+k7hLB7prUoluQE9ea9p961QCB/ZPpcheX1ocU0v8y3cMuALi4f3wSaAUuoZW/PcJ3ZK67DmhAEuotNbih8JSxmNmPXYQ8kjCE9iw3TlfUW7njkz6nQnwcikjODtB/qKq4gcx0kyM4D6+5MESvvU08I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZiwUK6U9; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZiwUK6U9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750338810;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=j6QZTbgBsBIWN9k4dZ6Hk3/RHB+MOYXXgpk4gPxs+OQ=;
	b=ZiwUK6U9Dh8BXbjJ9Iir0vOTGt0Kq78Reuuwyfgect2pjqlGCdwb3RdVeRfJb+SgtkWWRX
	SvFZ6ykq4ifbe8p45U0SfRh7xFA54ZYhdAf3U0tIrfzyoDRyZAp8xB0MBjzjtHGxXBmS8s
	FRmlJOmdWo4FYU98y82OBpf+ewT7r1M=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-295-2FFnc4ABOKuUAJxkpsWecw-1; Thu, 19 Jun 2025 09:13:28 -0400
X-MC-Unique: 2FFnc4ABOKuUAJxkpsWecw-1
X-Mimecast-MFC-AGG-ID: 2FFnc4ABOKuUAJxkpsWecw_1750338807
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-450787c8626so6573295e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 06:13:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750338807; x=1750943607;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j6QZTbgBsBIWN9k4dZ6Hk3/RHB+MOYXXgpk4gPxs+OQ=;
        b=E/3YuvlJlx3Srym+eNs7bBQ9hXNrbvCCiyA9hWsbRTm4TnmVC1sLkGCgmIG8rBIQ/i
         UX7xdQvkJT2QLT8KwKYM6S8hHeq8jYlJOzQ20jmNZsiEAcT7dscn5SLSiA//w8bAtG/e
         f6XTCnuhwe6kUDey9kJXdGIedEufX5bJ8bNj52qyKIBTqtYZoro/2YXrooz3JvDi4gIX
         0NQTsWMICuH/ggMNhr1aJ+de/EZbGYUDmlczi/+cgInq69AV0asEZ2/+rFRCaxJCzSQK
         WUcLO/KYjrNpiwX1ib0FLDYOkFoH1AgB5NPhySXMUdQe3xaawhF7qa6tZomgcA2jpxWR
         SfRA==
X-Forwarded-Encrypted: i=1; AJvYcCXcv3WkTJz11klRKlWC+ZNCiApgE2lBtlMcmk1git428QQuzs+fzWtU1xYPKveCBnP51bl+HgQX04XyXuw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfZkUYxhkIKfzAeQQcaB0PV+MncOHtEvPVTvrZbUbU8AtmLmrb
	Ci1ntyCADyRI85i4tWBBq8pzigsfCw/XYLdYphWz5fwxbo7HJPbEx46cQlx2/y21GLIds/ZvrUM
	5FclLXspurVQw1VFyHP/1WBZTjpnuZtZ0+vwvKrV56z9OEnC/uuXqYKQuoI0E2B54Eg==
X-Gm-Gg: ASbGncvz5sjpGDmaIvx0NRS2GlgSnUSizCqzfgZYQVi+/Gzm4nF1PGeK1ulk1ZFYxAh
	gLqnkYrjKudduajDSC3S+VcToi6B/JfieDh6r11fzxKjYLjIgNHJkS0uqO7qB1Xj2ds4/wvsBc1
	wZS8yt1VEhy9c5fk7v9hz6gsdCusZB1u1QaffRO4iVBZ37RwIZ+dGKFjFWBleDAG/2jZl4BECsx
	K8C5fjw2kvbXaYlt4MY/1rMY7oji+QIb8n9R+KgGp6UYShai8OojpXCIV9uzpLIHpmaDBkkIhsB
	9pi8QE7gUyiKg22p5d35mGaIAAx1Zu6p6V1vfATDuKHSjJwPvi1+vQ==
X-Received: by 2002:a05:600c:1c12:b0:44b:1f5b:8c85 with SMTP id 5b1f17b1804b1-4533caf5e9fmr223551275e9.13.1750338807294;
        Thu, 19 Jun 2025 06:13:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMD/1y+DW1U7YZaLtAM718HwgsMR2hyVtSoS0D2IF1BJD9ZA4K+FKXjkc1zCzOuZWEA10NWA==
X-Received: by 2002:a05:600c:1c12:b0:44b:1f5b:8c85 with SMTP id 5b1f17b1804b1-4533caf5e9fmr223550895e9.13.1750338806871;
        Thu, 19 Jun 2025 06:13:26 -0700 (PDT)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.47.246.160])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4536087c247sm16215935e9.9.2025.06.19.06.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 06:13:25 -0700 (PDT)
Date: Thu, 19 Jun 2025 15:13:21 +0200
From: Juri Lelli <juri.lelli@redhat.com>
To: Kuyo Chang <kuyo.chang@mediatek.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	jstultz <jstultz@google.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [RFC PATCH 1/1] sched/deadline: Fix RT task potential starvation
 when expiry time passed
Message-ID: <aFQM8TdZIIvvGv8T@jlelli-thinkpadt14gen4.remote.csb>
References: <20250615131129.954975-1-kuyo.chang@mediatek.com>
 <aFAyN4rfssKmbUE5@jlelli-thinkpadt14gen4.remote.csb>
 <089882f95b1b910f7feecddd0ad9b17f38394c64.camel@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <089882f95b1b910f7feecddd0ad9b17f38394c64.camel@mediatek.com>

On 18/06/25 22:20, Kuyo Chang wrote:

...

> When dl_defer_running = 1 and the running time has been exhausted, 
> it means that the dl_server should stop at this point.
> However, if start_dl_timer() returns a failure, it indicates that the
> actual time spent consuming the running time was unexpectedly long. 
>  
> At this point, there are two options:
> [as-is] 1. re-enqueuing the dl entity with ENQUEUE_REPLENISH will clear
> the throttled flag 
> and re-enqueue the dl entity to keep the fair_server running. 
> enqueue_dl_entity(dl_se, ENQUEUE_REPLENISH);
> => replenish_dl_entity
>   => replenish_dl_new_period(dl_se, rq);
>   => dl_se->dl_yielded = 0;
>   => dl_se->dl_throttled = 0;
> => __enqueue_dl_entity(dl_se);
> 
> [to-be] 2. To avoid RT latency, the fair_server should remain throttled
> while replenishing the dl_se. 
> Once replenishing is complete, we can ensure that a timer is
> successfully started. 
> When the timer is triggered, the throttled state will be cleared,
> ensuring that RT tasks can execute during this interval.
>  
> It is a policy decision for dealing with the case of failure in
> start_dl_timer().
> The second approach is better for real-time (RT) latency in my opinion,
> as RT tasks must be prioritized.

OK, I think I see your points, but I am still not sure I fully
understand the link with the issue you describe in the changelog - the
relation with "DL replenish lagged too much", that is.

Could you please expand on the details of the situation that is opening
up for the issue your patch is addressing? Do you know why we hit the
corner case that causes the warning in the first place?

I would like to understand exactly what we are trying to fix before
deciding how to fix it, sorry if I am being dense. :-)

Thanks,
Juri

