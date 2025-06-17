Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA4EE2DE1F8
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 12:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750163603; cv=none; b=TLDcqQSDKHkDmjohrkS8OxEIOCc7bQnbE204XvoKGTpXIaMRl6+CtTkGRO4h66SxeSsWwtx4iCFZYw8UcSgGBaZhedQiJaAGh4m4sbHExl374ppG6ZvIcgBpgcKd2dS1Qy5OhFH/CnyAKTX/Nv+4Iw5q4aravw+BuTv9m2rV7qQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750163603; c=relaxed/simple;
	bh=sPFBmhG+FilWNWMvERcuZElkUxKozXjvySYc5Fmw31I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JupFkd0yyoD0wTWVGbPvagQm91eo9nmOJgFyccPGAaIsNmDKLAYL03Vv1Q2wu3bHwMED9nD80f4cyr02hiIxImOi2bni4HL/jJKYlqQmr5y/y/Df7jkwvBplPLdHNERmO10ghZf1xUExASVdQV+9QX08LT+D/88ZX9vabj4RoJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=To6cH+5z; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="To6cH+5z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750163600;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Jo+IXIxSNIYAuiTCVjY+MjOblSENU+5Bkagj0uUgN34=;
	b=To6cH+5zCpk6LHe/gVtGZRxrjs28yhL5+JxAI0VsHzKmMhry4nRwe8ZlUGoY/y2kJ17G3s
	vi2V6YAOz6EE8EH4v8YX1ZsC9IHbGTwNdkNQ/9JcIWuVLb8w5mbgS2TzVFsd+HUqP+amgd
	vdkEEYOxPEQSzAg6KeJgVWyn3AKWtFg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-489-v3aBvzc-M22WyaSN5YuaHg-1; Tue, 17 Jun 2025 08:33:19 -0400
X-MC-Unique: v3aBvzc-M22WyaSN5YuaHg-1
X-Mimecast-MFC-AGG-ID: v3aBvzc-M22WyaSN5YuaHg_1750163599
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-45311704d22so37308595e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 05:33:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750163598; x=1750768398;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jo+IXIxSNIYAuiTCVjY+MjOblSENU+5Bkagj0uUgN34=;
        b=eH0ET4I8akTyHQ39TINhaAAtA67zhCio4A58add0VI8A1CCzxNu3Q78OKnMUdzJpto
         5RRHtCDKRucaNDpgcAp5zfb9oA1DfN3lddtJmE6cGF6CwbC+1iwwRicoEtKAz9HhrbSx
         xRVeLr25eLqhNg7PabMP+0ynLW+XP7QGZ/7os08G13iDY2KE2QIKoEtJnrmj1wBEZ4YE
         S5BwtGPVvbnJe4AvlRq8Wkdt6VtZ45AztjI9u83mrr4471PonzCSztMuq6T7r4+ZigUK
         41q1591adMpO/WuWguXSjkHCAJPlKfSGeBJzB7hNwB0oeJS8+vIjYUk6865P3znsgB2d
         VUeg==
X-Forwarded-Encrypted: i=1; AJvYcCX+y1jvQoJVSjYolVKZSBII4tPgR0xn3MXXY0ML6jorVI99aNaQ1zO2WcYfN1VsC0I7Zk+fk6c5hpr9UEA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyF8/bvCtDMPDT7wDnkdn2UzZlnUZVfndRvKZ4z80tYG/cJm1Qx
	K85a6dzmIK0ZA3YZd1KxoeWB2sP07QjitMrUo2oSwfLhbTriWMOdmO8dj74JSIcmOLibZHFrLth
	auSR09kUxNIG6SE55tmAR6vFYz2OXBUW3+ZyeWXi1flpsOf8p86FQiMkptQXpHHkBxw==
X-Gm-Gg: ASbGncsJla22NwKwmclDSUev1Q2gQuiCI4dsT2V8hJddyuzqEVOMd6H5fZ9BqTkGahs
	/a2sv63ZnRHOOxbDDarWItIamI86Lf73fopVgcyFn1kYUIdQqPguInE5XaqYHyNE9V9Mky+84JP
	o2Zf+wMbvBPZOlpKExXdRpOf57BmBlPCnkaAncka62RFKVigJy/ADtVfhMl3QA7IZ/wuzkyjAcK
	7QqaGzwDtCxQadXozHlc1bMLMri4TsHH33Cc0QMM+uA89D8/1ZF3umk90tyfjE5Pfx7U2r52nD7
	RomklPY+AjNu29B6NzxmCguw0cZ+rPnUHpRP3BamRG0vX1+bdx3CmQ==
X-Received: by 2002:a05:600c:3587:b0:43c:f70a:2af0 with SMTP id 5b1f17b1804b1-4533cb48951mr120533895e9.16.1750163598489;
        Tue, 17 Jun 2025 05:33:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEk1xWsef/FxGyotWPmKQtLjGTobu8UAwOJhzqxxuFF2cZ9pfD3uHBQHPFjkme52CF+GzKbfg==
X-Received: by 2002:a05:600c:3587:b0:43c:f70a:2af0 with SMTP id 5b1f17b1804b1-4533cb48951mr120533385e9.16.1750163598021;
        Tue, 17 Jun 2025 05:33:18 -0700 (PDT)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.151.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532dea1cc5sm179772325e9.16.2025.06.17.05.33.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 05:33:17 -0700 (PDT)
Date: Tue, 17 Jun 2025 14:33:15 +0200
From: Juri Lelli <juri.lelli@redhat.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Kuyo Chang <kuyo.chang@mediatek.com>, Ingo Molnar <mingo@redhat.com>,
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
Subject: Re: [PATCH 1/1] sched/deadline: Fix fair_server runtime calculation
 formula
Message-ID: <aFFgi_9yxLN-auBE@jlelli-thinkpadt14gen4.remote.csb>
References: <20250614020524.631521-1-kuyo.chang@mediatek.com>
 <20250617085558.GN1613376@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250617085558.GN1613376@noisy.programming.kicks-ass.net>

On 17/06/25 10:55, Peter Zijlstra wrote:
> On Sat, Jun 14, 2025 at 10:04:55AM +0800, Kuyo Chang wrote:
> > From: kuyo chang <kuyo.chang@mediatek.com>
> > 
> > [Symptom]
> > The calculation formula for fair_server runtime is based on
> > Frequency/CPU scale-invariance.
> > This will cause excessive RT latency (expect absolute time).
> > 
> > [Analysis]
> > Consider the following case under a Big.LITTLE architecture:
> > 
> > Assume the runtime is : 50,000,000 ns, and FIE/CIE as below
> > FIE: 100
> > CIE:50
> > First by FIE, the runtime is scaled to 50,000,000 * 100 >> 10 = 4,882,812
> > Then by CIE, it is further scaled to 4,882,812 * 50 >> 10 = 238,418.
> 
> What's this FIE/CIE stuff? Is that some ARM lingo?
> 
> 
> > diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
> > index ad45a8fea245..8bfa846cf0dc 100644
> > --- a/kernel/sched/deadline.c
> > +++ b/kernel/sched/deadline.c
> > @@ -1504,7 +1504,10 @@ static void update_curr_dl_se(struct rq *rq, struct sched_dl_entity *dl_se, s64
> >  	if (dl_entity_is_special(dl_se))
> >  		return;
> >  
> > -	scaled_delta_exec = dl_scaled_delta_exec(rq, dl_se, delta_exec);
> > +	if (dl_se == &rq->fair_server)
> > +		scaled_delta_exec = delta_exec;
> > +	else
> > +		scaled_delta_exec = dl_scaled_delta_exec(rq, dl_se, delta_exec);
> 
> Juri, the point it a bit moot atm, but is this something specific to the
> fair_server in particular, or all servers?

I believe for other servers (i.e., rt-server work from Yuri and Luca) it
might be useful to have it configurable somehow. I actually had a recent
discussion about this concerning single task entities (traditional
deadline servers) for which as well there might be cases where one might
want not to scale considering frequency and capacity.

> Because if this is something all servers require then the above is
> ofcourse wrong.

To me it looks like we want this (no scaling) for fair_server (and
possibly scx_server?) as for them we are only looking into a 'fixed
time' type of isolation. Full fledged servers (hierarchical scheduling)
maybe have it configurable, or enabled by default as a start (as we have
it today).

Best,
Juri

