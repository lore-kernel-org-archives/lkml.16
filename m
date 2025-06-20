Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B59E68F5B
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 15:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750432950; cv=none; b=hMISqxYy05R04wfnDZNx17Oy5Fj8yC2sUUrqooIBUNn0Csu2B5ssQWtL9n9ZCD3n5tWcfbFFx6qjsWctIi+TWVTK8Qk1qSn4vYUmGjwNGdi87zfkGKCD3waN5HpuW86PoDB/Sp9OYEkcUmZDyTdo8dR7BTcaHjEHZBUp23WvYHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750432950; c=relaxed/simple;
	bh=xwQ8q/lHlzPQ+gLwEWa+EUYxcCXWgCf6oxg61Iu+7D8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mjGTfFenlpbstbGFGd7g1QFaKxgW7Zvy6HbBNTfYSonHD1jy+Sz9vTrx74Ee7PX2/WRUI6g8aFeAu4eWIcPyZMMVIzE3T42QLZWxlW2Dl+fbitD6xelc6451xTPRixTDf/bV4BcusOqdpiWkQw9621bsWz2hkCmmDUp7Jb4hsYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VCloJQ0c; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VCloJQ0c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750432947;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cN1LA4ycWLYTHnDpp5XY9WIgVZkngojcPUNGmlqXWbc=;
	b=VCloJQ0cUZs7oBCUwRzMpc6T42ztIKSPlcsqnUra/LyUa0zitDI04VHW14pUDfb6SvnMUH
	HjN+MVBmGLl38UGI2K2sVSzWO0PRqBk5CAzdKWOmlDa9vKsCPBPR4Xsyj695/ti9tgQ7fS
	f7u8WS+hdm+X9noDLiGkjvkQiszdoVI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-73-bjWV2xLLMyG5EPzaWFz5kw-1; Fri, 20 Jun 2025 11:22:24 -0400
X-MC-Unique: bjWV2xLLMyG5EPzaWFz5kw-1
X-Mimecast-MFC-AGG-ID: bjWV2xLLMyG5EPzaWFz5kw_1750432943
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-451d3f03b74so9681025e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 08:22:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750432943; x=1751037743;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cN1LA4ycWLYTHnDpp5XY9WIgVZkngojcPUNGmlqXWbc=;
        b=UkV6of6C0harKY8AaiLelkoo4GzbR5c5GA4J2T3o64V22UgDtt3ZOxiXeagwIcfp9f
         nDV6ztwEEH4fm0R05qSwaU2x64RkorD5mRnUQoJP4Tzv5FZlcB2dpSvwuNBxAcaHMdol
         gfoYJp//bbNoXsrVnEo1W8E8bLk1zxsBUwyrnB/JQkT3IUfeeJgZCOmnH4UO2qlw5TtE
         yX4QS0HKBj1d+++E5l2Rn3cbv6Vclc8MDmcYpzcomvcUa14PSW4cqQ5OiCcZimTtrX2p
         targqfV1zS80p8YBo3z/K4/PmKACeMdUh9sSxK6mT/mu1Q63d9ohxcGLgMsnExzXZlLk
         jE8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUBQQDQjn0FZxrbTHtqBwS0oNYVylR5BQZ2oAY58wBWdFWEqP0sQJsYAk/x5RNfxRixPJdUsEFy6ObN+W8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxeLQYTMKbnR0vEIRSf5Lhf39tVwZvJIKhr/cGxmL/5OArpraHV
	HeqTNOjhAvcbCq9f2sp6vLx4TWFmhyyRfOdpgMXAOIB58mp+G2POw4C5ZqcYPKAq+78cqf23x1/
	LaPZ6+V6NpTopnyXWTIBrqLFugYsEoaLFqEdoNPXY9VlIwj0ghInA7lUEaqHtCYbZfg==
X-Gm-Gg: ASbGnctcfZh98pQ9g24P5UMfUARogULF0Z3I0fe0+cow8sfnh/C5+swbglgtjkUkvmp
	AWVERnidlHxiL8QFO4v2CIKqF4hj6g8QehpQS025WkdZW3ooL/uVF9MWiYp3dC8rboPNRfDiG1b
	edpI3ajPY1sfl4zPu3QBHkZbVN6VaWeSDd3uN87YrBV5WThQe6Ovo5K+H3Jp9jCgH/xypJSxWKd
	ItCQ4VwMHSpa7mPB/ODbGxodiMc8KhJTecAiZJOwmZp+38nvPNGhUjtpygN73L3683H54TyJXXZ
	MM1Mr1yB3Gn8ZhTk7DX2heNgn/c3h42Z2rlT1lm19T2no2Fs/J2n
X-Received: by 2002:a05:600c:4ec6:b0:43d:94:2d1e with SMTP id 5b1f17b1804b1-453659c5990mr33686735e9.13.1750432943263;
        Fri, 20 Jun 2025 08:22:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEZmVpv8KaX6/5zmsF8suS17BhoS4C59H1HpKJfGYz4l67tvqNN65MS3ZSI+H8wSDwwq8cC1A==
X-Received: by 2002:a05:600c:4ec6:b0:43d:94:2d1e with SMTP id 5b1f17b1804b1-453659c5990mr33686485e9.13.1750432942892;
        Fri, 20 Jun 2025 08:22:22 -0700 (PDT)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.47.238.47])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45364705748sm28034795e9.28.2025.06.20.08.22.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 08:22:21 -0700 (PDT)
Date: Fri, 20 Jun 2025 17:22:17 +0200
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
Message-ID: <aFV8qeH__bw0chWM@jlelli-thinkpadt14gen4.remote.csb>
References: <20250615131129.954975-1-kuyo.chang@mediatek.com>
 <aFAyN4rfssKmbUE5@jlelli-thinkpadt14gen4.remote.csb>
 <089882f95b1b910f7feecddd0ad9b17f38394c64.camel@mediatek.com>
 <aFQM8TdZIIvvGv8T@jlelli-thinkpadt14gen4.remote.csb>
 <6ec534be0618de3e2b4d81555e5f24155326c0b9.camel@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6ec534be0618de3e2b4d81555e5f24155326c0b9.camel@mediatek.com>

On 20/06/25 11:00, Kuyo Chang wrote:

...

> "DL replenish lagged too much" means the fair_server took much longer
> than expected to use up its running time,
> so the deadline fell way behind the clock (which is also why
> start_dl_timer() failed). 
> In this situation, just replenishing one dl_period isn’t enough to
> catch up.
>  
> A corner case is when there are too many IRQs or IPIs in the system.
> In this case, runtime gets consumed very slowly, and the fair_server
> keep running without being throttled.
> Even the runtime is exhausted finally, the fair_server would be
> restarted immediately.
> In the end, IRQs, IPIs, and fair tasks can take over the whole system,
> no chance for RT tasks to run.

Thanks for the additional explanation.

The way I understand it now is the following (of course please correct
me if I am still not getting it :)

- a dl_server is actively servicing NORMAL tasks, but suffers lot of IRQ
  load and cannot make much progress
- it does anyway make progress, but it reaches update_curr_dl_se@throttle
  only when its current deadline is past rq_clock
- dl_runtime_exceeded() branch is entered, but start_dl_timer() fails as
  the computed act is still in the past
- enqueue_dl_entity(REPLENISH) call replenish_dl_entity() which tries to
  add runtime and advance the deadline, but time moved on so far that
  deadline is still behind rq_clock() and so "DL replenish ..." is
  printed
- replenish_dl_new_period() updates runtime and deadline from current
  clock and the dl-server is put back to run (so it continues to run
  over/starve FIFO tasks)

It looks like your proposed fix might work in this particular corner
case, but I am not 100% comfortable with not trying to replenish
properly (catch up with runtime) at all. I wonder if we might then start
missing some other corner case. Maybe we could try to catch this
particular corner case before even attempting to start the dl_timer,
since we know it will fail, and do something at that point?

Thanks,
Juri

