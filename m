Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A222423E222
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 15:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739201942; cv=none; b=knVgOg6+HIn6ptkgErS+DU40QGB1VEneXIxN1VwTDV0aBD7uEj8i4cPQtc5CJLMMj9iV0ch9y1wF0svX7K0ohO3KipXWBvCYHiTWHbKwdpY2iey6fTWJTqjwnBGI5vxiM2tVC8ClDrIUMBAVgjFOfBNDMReiv4NZFoTiZJovows=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739201942; c=relaxed/simple;
	bh=+ZO1rTDnY2L4DK8ir1ncT8Jdms8oqofICMxDveJrpVs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bueg7Z6lyXhgQuCMZR73C2Qul6yz+NgpMv3/ZtYHGmuUA/uVTcHtplw3WWvFmUoGSviIoHqErOOjUBM0jZOUBPXemP6GqhfxB/tzfHZv4NdSZNhm24GF9BN6R1n9ksNnULtwPsmRABeDDDz+V5TlE8cqreZKUTZQ7bSLzHvAkhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=BXGkIxo0; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="BXGkIxo0"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ab7483b9bf7so669955266b.3
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 07:39:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739201939; x=1739806739; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gn5jBDSuUTKZUT+LyUeeWJnri0H/pvMZv3ujQ1+ZSQ4=;
        b=BXGkIxo0rM3GbUtB/sfmckxDanCPt/+HRgRw/7z2B0/ehnKdJXeK0RPiU5evZAxYMl
         HRHugo3f3hcKkO8PFT6r8hYwwdLmo8RRbeJUvXEiKb6f9UiUhTbH93IWl4C2J8wHCABW
         7g8UbDnluvkRMjH/QTtadqTB6WTxq1mWTjgEXX3yX0Lo7szddUMRdLktLIbdNlTnqqG1
         GXdVdFZBVx2HiuWKizuE3ZwhitUtexGZh4Lcwnmy6vho9megLQqwjUGiBXcsZi4qajZe
         5xzpPv5U5Zfjsu63PuvTvkeWMmhYkXq8F92gWgs2d6BWnELXVXDVF9dnjwAEA/ATmVwo
         r5AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739201939; x=1739806739;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gn5jBDSuUTKZUT+LyUeeWJnri0H/pvMZv3ujQ1+ZSQ4=;
        b=SEFaZa5aBj6zoRDwKaCL7BLC/7DAoIemcyPV8nAavIZP2jBrH+MbzoT+8yQzQhi9UC
         GQv5xpQHCTCjGRIr/wJe2X7dLTuEBuV1vIxZUmUFYZlDC65layBpPjDZT+oBQFkv7n3m
         v7N5XT6D9m3JZi3PJ+U0sVBev/HxDunC1mSmmFuF31Lz+XjIHWqQtMbGub+V5s76OQ2s
         uU0eeeb9tMkPZz71lgC8SlifFFQWTDz8e2qcue9Lsp9QWPHYHyzVjvKQbMK/1j4qUZkC
         o1+LLR6YrkK57yl91SfAoVcyJLIWbvu7yIqzOlVJqNvlQFs69alIJhHMRAMZWFaBAWoU
         L3FA==
X-Forwarded-Encrypted: i=1; AJvYcCW1hLsgfx/pArcGZiFQLppVS3K8xc00xuBOEK9Yjj+ytT1hv2f/FaELhLh+Q/ztiRhwf9barwESEdjx2zQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBdIZOsjUyyHTqE+xMvz0FlAGy2RzZq3o/AA6HZ6qHs/8vaHiB
	kJ/FhlI32LwYuTc+BbPylVYcL5jZB44Fr3exr1tkq1Zi0i9KIf2XWV9bKb18ByY=
X-Gm-Gg: ASbGncv1VaQ7PxC+9WQZLZ3c872CjJ6txl0nZ8xRsOYK6npubDi+I8pV4GtwjeBYCKe
	Ndn4AtFwcYQdZ3zk0SJVec3TFhQ1zKnFaIWP3FawbVuAj3dotkAuq09M1KDIO6aiXQ9IWnrOTRK
	RxdtY215wR4JwgzGoGVGEA9vA6ftOtede0w3c2cImMq3DmfJ9Q6YeTkCrtbKB5X8D0uMoaA8SHt
	Uvn3ZTdIYW4trqNjjyIamA9TjXw0UUiAL31xtytonSNW+PBMAPvP9atja4dsfVDGcuiQKH/beL9
	NA/pHMxTTlLBLJ4n1Q==
X-Google-Smtp-Source: AGHT+IEkhOZI/bjOnubCCDmribYUDcUAGpriYeg1lXWJzTqKc4+MCipChQCFc1nZQcDkz7yfY286uQ==
X-Received: by 2002:a17:907:9627:b0:ab7:5c95:3a82 with SMTP id a640c23a62f3a-ab789a6b63bmr1317004266b.1.1739201938875;
        Mon, 10 Feb 2025 07:38:58 -0800 (PST)
Received: from blackdock.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7bb9cc86fsm294087066b.140.2025.02.10.07.38.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 07:38:58 -0800 (PST)
Date: Mon, 10 Feb 2025 16:38:56 +0100
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Abel Wu <wuyun.abel@bytedance.com>
Cc: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Jonathan Corbet <corbet@lwn.net>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Yury Norov <yury.norov@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Bitao Hu <yaoma@linux.alibaba.com>, Chen Ridong <chenridong@huawei.com>, 
	"open list:CONTROL GROUP (CGROUP)" <cgroups@vger.kernel.org>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, 
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 3/3] cgroup/rstat: Add run_delay accounting for cgroups
Message-ID: <qt3qdbvmrqtbceeogo32bw2b7v5otc3q6gfh7vgsk4vrydcgix@33hepjadeyjb>
References: <20250125052521.19487-1-wuyun.abel@bytedance.com>
 <20250125052521.19487-4-wuyun.abel@bytedance.com>
 <3wqaz6jb74i2cdtvkv4isvhapiiqukyicuol76s66xwixlaz3c@qr6bva3wbxkx>
 <9515c474-366d-4692-91a7-a4c1a5fc18db@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9515c474-366d-4692-91a7-a4c1a5fc18db@bytedance.com>

Hello Abel (sorry for my delay).

On Wed, Jan 29, 2025 at 12:48:09PM +0800, Abel Wu <wuyun.abel@bytedance.com> wrote:
> PSI tracks stall times for each cpu, and
> 
> 	tSOME[cpu] = time(nr_delayed_tasks[cpu] != 0)
> 
> which turns nr_delayed_tasks[cpu] into boolean value, hence loses
> insight into how severely this task group is stalled on this cpu.

Thanks for example. So the lost information is kind of a group load.
What meaning it has when there is no group throttling?

Honestly, I can't reason neither about PSI.some nor Σ run_delay wrt
feedback for resource control. What it is slightly bugging me is
introduction of another stats field before first one was explored :-)

But if there's information loss with PSI -- could cpu.pressure:some be
removed in favor of Σ run_delay? (The former could be calculated from
latter if you're right :-p)

(I didn't like the before/after shuffling with enum cpu_usage_stat
NR_STATS but I saw v4 where you tackled that.)

Michal


More context form previous message, the difference is between a) and c),
or better equal lanes:

a')
   t1 |----|
   t2 |xx--|
   t3 |----|

c)
   t1 |----|
   t2 |xx--|
   t3 |xx--|

      <-Δt->

run_delay can be calculated indepently of cpu.pressure:some
because there is still difference between a') and c) in terms of total
cpu usage.

	Δrun_delay = nr * Δt - Δusage

The challenge is with nr (assuming they're all runnable during Δt), that
would need to be sampled from /sys/kernel/debug/sched/debug. But then
you can get whatever load for individual cfs_rqs from there. Hm, does it
even make sense to add up run_delays from different CPUs?
