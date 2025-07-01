Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 777CE1FDD
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 08:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751358706; cv=none; b=qMseY+MauQXe3e+nyYU1tEF3dHfnTLjHkcwYELBFb76Qjpjee7S5f5Tn2hct4bPW2shh85LIJrQ6Bn+sTCl/Pdu0byyz6RMCzYatzC3KM19x4jDLjwP8YbXTuNONeA8v7Z2cZXVwZVc0tPVeb56QsYGe+oqut+v1M3hHquX1eJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751358706; c=relaxed/simple;
	bh=u8XA6AE7KTxwnr8Ewx80kHJpLEp02NYTFAdLlNNTw+A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jdLXN1RVJgyqyOjmv+OWcsjifcah6fHdm4+YvzBQmzPVmv+iU1+tVhV9UH0Z20RcGZmfFIhHum78Hw2imNTLFpW4QAUDGRni1VUhrf28sJhXwsaZV1DmgsCSd03t87VgfxiBXzXJIzwT81wib7jYGLoETGniZDwnz08tN+u/VMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=Y1JTlhDJ; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="Y1JTlhDJ"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2363497cc4dso44250345ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 01:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1751358703; x=1751963503; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sY42LzJonUKxLm9VW+tYbEyOinj15vZJhx0LrFV84OI=;
        b=Y1JTlhDJ+APHRru+KiAqTOVb1rFOszCCteC7N2kBALPcaTlrfn2YOdSU7jx2h+5UHW
         /XMwx4TxorBRKm2NXxJPhvES71SbWzNtjaBBfPTs6ViA8fkiGv1iL52dCXlTd871SXsy
         e1IF9pm60Hn9aaFtNfWLVuHHSjN2t45ZhJ2dr5+fy+IPz0DmisgzOMkO0ibF+uuI8wvt
         86imz5Cpa/dHRqnHMMmgWuXTjEy4aLgJ09SQ+f43MSN/RWP3hugBNk6gyPrDqh39hGQv
         56HrFvCBTb7kHKW06gWSBT9Cbz+b4Qjqd0Ixj8kdzTs5bC5am6o9TbofcHPIynNzjyCN
         e1Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751358703; x=1751963503;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sY42LzJonUKxLm9VW+tYbEyOinj15vZJhx0LrFV84OI=;
        b=Jj0NuX3TE6RZsXNlf0+HERkgHeJVHwV3f3s0a9+qLOzmPGxRITS9QQMFEANEL2gRDH
         /yFHEhryXCLdvsF/DJWIBQNWpiWhwwI6ilfGcvwYfVpuOb0eCKTJM2d4QOPpZAXKa1WH
         tE1HQHvBJlSyvs/Jh36GTYgjXeMG1XHtYz+4ZZUcd5GeDhqRXLrSXY9zIqzl/BbHHiy9
         Zbi54f+Yj07SGjN1IPMJLN7HZ2/h+RUJXdbp4ldZ27/PasMwVAQOtkk9qFMKl+oxSjek
         LYeqW4LSvUA07gPQiH5qHdQKLoSIfmUPG9z+CGOlhAU3lCrGQLh9Dwr79dJPkWvSXscR
         +9UA==
X-Gm-Message-State: AOJu0YxzgS4ma2bk5LIQukf6T9ej9LOI+ZN/jpFl1IJbNB8Z9NwL2MJY
	7BSX1MrUyzvykeXJrwEH6FEOyCh/nraX3cPEXSXDD0AcQILZbFfYLJXwJJ4edRkhug==
X-Gm-Gg: ASbGncvcFzKdUXlcfe4pprI1aT+a5lqNcsl1eJTBaK0pqrDuNL904clcnyW/cIVBqZV
	ykACHJyZlQp6G6Qf6wq58iHlYpX85kYwJCYkkyS0zxmOlJmDmj0Mn9uQ+pcSEuH21KhimAa3hAZ
	Ia06L/S5Qa3r0xmVSfBIYgaYBLbzNqko2rAgBmbJN03mtw6LPbeC51o5lPKxdmVUOB+xYsEvQJN
	VFQ4/pW41/V2vJi53wSf09W468Ooo+x0PCM+yolFFvVPL8U5y25Od/t8T/jPjRO1FHZHcjv2FJf
	GZQd9Z8DHg9bEGE3duOotRf54ffVjetAVWmdrAIcLa7mfgCSpWPLjZgFIVvjYA==
X-Google-Smtp-Source: AGHT+IFKSTgGkOEc6KLoruV6y+vjwrM0NqSufM8br/G/lkFUrP8O4K44p5mLgn2lVgCCIa+ztBNHFg==
X-Received: by 2002:a17:902:c946:b0:235:dd54:bce1 with SMTP id d9443c01a7336-23ac3afd183mr249288375ad.15.1751358703563;
        Tue, 01 Jul 2025 01:31:43 -0700 (PDT)
Received: from bytedance ([115.190.40.10])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb3c4b23sm100019885ad.214.2025.07.01.01.31.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 01:31:42 -0700 (PDT)
Date: Tue, 1 Jul 2025 16:31:23 +0800
From: Aaron Lu <ziqianlu@bytedance.com>
To: Valentin Schneider <vschneid@redhat.com>,
	Ben Segall <bsegall@google.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Josh Don <joshdon@google.com>, Ingo Molnar <mingo@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Xi Wang <xii@google.com>
Cc: linux-kernel@vger.kernel.org, Juri Lelli <juri.lelli@redhat.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>, Mel Gorman <mgorman@suse.de>,
	Chuyi Zhou <zhouchuyi@bytedance.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Florian Bezdeka <florian.bezdeka@siemens.com>
Subject: Re: [PATCH v2 0/5] Defer throttle when task exits to user
Message-ID: <20250701083123.GA2784928@bytedance>
References: <20250618081940.621-1-ziqianlu@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250618081940.621-1-ziqianlu@bytedance.com>

Hello,

On Wed, Jun 18, 2025 at 04:19:35PM +0800, Aaron Lu wrote:
> v2:
> - Re-org the patchset to use a single patch to implement throttle
>   related changes, suggested by Chengming;
> - Use check_cfs_rq_runtime()'s return value in pick_task_fair() to
>   decide if throttle task work is needed instead of checking
>   throttled_hierarchy(), suggested by Peter;
> - Simplify throttle_count check in tg_throtthe_down() and
>   tg_unthrottle_up(), suggested by Peter;
> - Add enqueue_throttled_task() to speed up enqueuing a throttled task to
>   a throttled cfs_rq, suggested by Peter;
> - Address the missing of detach_task_cfs_rq() for throttled tasks that
>   get migrated to a new rq, pointed out by Chengming;
> - Remove cond_resched_tasks_rcu_qs() in throttle_cfs_rq_work() as
>   cond_resched*() is going away, pointed out by Peter.
> I hope I didn't miss any comments and suggestions for v1 and if I do,
> please kindly let me know, thanks!
> 
> Base: tip/sched/core commit dabe1be4e84c("sched/smp: Use the SMP version
> of double_rq_clock_clear_update()")

I wonder is there any more comments about this series?
Is it going in the right direction?

Thanks.
