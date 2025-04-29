Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA243279356
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 09:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745918682; cv=none; b=qHBftWE+KY62W+ZxwaBkE/gxxxOiaPjA5tBIXYKh7fti0VzqQqngVgYvX6Ml2UAes6FfSk8kBffInRcEc7gs99/LVVekFpbx5MIlqfP4zfnV3N9ibIm0CJrodSs81kfM32GOnlF7UiOfxj+FvIDNUBkZEKg7GGJhTKyLsWREM8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745918682; c=relaxed/simple;
	bh=zLHwehuD0mmw4GsfL9VmQ60TLTqVqEnvOQvtJxzKq40=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZV3GYz9pevdaNmpYNtvt6xJJ+2bcsyAV8kfziVEofWUu6iSNd7fhw5G4lmROu+PpgYilmXJK4d6lUXtQsdeXS2a3VSpJNnZD4lfOK6Qrk6t5tfzmGHPcnXkLhNKJ3kMPX1IOjqdbQn7PxEr5oWYXgRDuKtXoh5MPaB6/41At+cE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MwF6du9/; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MwF6du9/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745918679;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8f8/JTNUvAATS4a0cTgJSetpgv+ZA4Ct8iWSSFOFVKg=;
	b=MwF6du9/dZySChpz2T+RHF97ANef+YnOwyjNcpWUMGiSp7ZlTln/FTiIrwAScgTgoFWigZ
	uDXMAZRWheM+8pR9psXGqsPxCSggOXMaEs7GAQkmEOeZMUXQpD5gOKS3Vyq4QdE+1PSwSC
	DzgjqeJL7UpuWxM1/eva91AkvJ9ucXc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-31-h9cWAc0bNnGJqeGt5xLSSg-1; Tue, 29 Apr 2025 05:24:38 -0400
X-MC-Unique: h9cWAc0bNnGJqeGt5xLSSg-1
X-Mimecast-MFC-AGG-ID: h9cWAc0bNnGJqeGt5xLSSg_1745918677
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43ce8f82e66so29923535e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 02:24:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745918677; x=1746523477;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8f8/JTNUvAATS4a0cTgJSetpgv+ZA4Ct8iWSSFOFVKg=;
        b=JeaBwNcXt0XmHY/sWeQ5yBuBjzteZtYoELWB/4FGOLwaR2FH7dgkVyeF1+eoKDZUF1
         PscV/cgbrqmv4T1Ev6VnYuD6YQ/8RieFjp8zei3Nm4SITFb0W/kA+zfQ7CwM9FmSDODy
         R6UBC5rKfBlp03w6I88/Z4uIeh3X+ELRf1cKcJRTaGbhQQuL6Dxokzq7tRHsts8g9+8H
         T6lC+qAT+qULVEhCLa3+ZSlSVpC7OlJ8Tovm2FhRD3dyi9McRs28rBoMDG7C76mFjwBZ
         MtFC4rRqZEC+BdqULrm7xbL7Sz65Dn2MD74eo+42/hnT6tBMpBIYz63hrz9lp1feqtSd
         ZvLw==
X-Gm-Message-State: AOJu0Yz5H13rEFLVAkL3PMd9RASUpmBgtyio7iLWOTLIItY28uGM0x60
	lmoKEEDgv0LMIv3FPJKGUBQIhKbhmNO/ATF4rx19ZF315m4pVItZEOci8qc3IvGSLPq/XsP5plD
	ap2WR9FHY5KmOktCBdqwS6o2XZHKODPSFtiYMaFETSyR37sBDgwijAv9j+bqH9A==
X-Gm-Gg: ASbGnctTkxm69Xl8DRnn3lIvIlxKJAUSythRgY/uecH3qUVsTtzldc/vruGcOylAa3N
	xUdVl6k1zMqQzqJnQGQ4Kw1F9SdJ9piEDeoWwf1j4HetvKuBWTKfqlhZFDUwdLTi9f96HtKZwyD
	leShLRfWLX7pIJgwNOv5B/uGUv7Oe0VtWKLHDGT7Jc/jtwrzpMKX3+65wcG8Celxk9kkM6cSvSD
	oVH5qV8xiRvCJIz1bvN+nXJOcPRCN4b/z6Xcx4HU6xQ6in2QnhraFqOV6JIrGIvqtR24tRJjrFQ
	hl4KWl7nK2nJm/njLgiwC/jnhLsXvXlCKYcpra55Hg==
X-Received: by 2002:a05:6000:430c:b0:3a0:8492:e493 with SMTP id ffacd0b85a97d-3a0890a5862mr2543859f8f.6.1745918676878;
        Tue, 29 Apr 2025 02:24:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFlRGyoMuaoQU22X/g4xtU8aMmRSAwEOjcfpAQ1mIxF6t5wpgtAZW/V+biJWIOEGcMcIVTFzg==
X-Received: by 2002:a05:6000:430c:b0:3a0:8492:e493 with SMTP id ffacd0b85a97d-3a0890a5862mr2543833f8f.6.1745918676431;
        Tue, 29 Apr 2025 02:24:36 -0700 (PDT)
Received: from jlelli-thinkpadt14gen4.remote.csb ([176.206.10.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e5c68esm13285648f8f.82.2025.04.29.02.24.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 02:24:27 -0700 (PDT)
Date: Tue, 29 Apr 2025 11:24:25 +0200
From: Juri Lelli <juri.lelli@redhat.com>
To: John Stultz <jstultz@google.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Qais Yousef <qyousef@layalina.io>, Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Valentin Schneider <vschneid@redhat.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Zimuzo Ezeozue <zezeozue@google.com>, Mel Gorman <mgorman@suse.de>,
	Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Metin Kaya <Metin.Kaya@arm.com>,
	Xuewen Yan <xuewen.yan94@gmail.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Suleiman Souhlal <suleiman@google.com>, kernel-team@android.com
Subject: Re: [PATCH v16 4/7] sched: Fix runtime accounting w/ split exec &
 sched contexts
Message-ID: <aBCayS_XuQX0EZxk@jlelli-thinkpadt14gen4.remote.csb>
References: <20250412060258.3844594-1-jstultz@google.com>
 <20250412060258.3844594-5-jstultz@google.com>
 <Z_zVULdTgt9J4rqf@jlelli-thinkpadt14gen4.remote.csb>
 <CANDhNCq1X9dcLCwb9Uod=C-i7giwqWkTso+a6S8n+wXCghq+MQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANDhNCq1X9dcLCwb9Uod=C-i7giwqWkTso+a6S8n+wXCghq+MQ@mail.gmail.com>

On 16/04/25 16:30, John Stultz wrote:
> On Mon, Apr 14, 2025 at 2:28 AM Juri Lelli <juri.lelli@redhat.com> wrote:
> > On 11/04/25 23:02, John Stultz wrote:
> > > +static s64 update_se_times(struct rq *rq, struct sched_entity *se)
> > >  {
> > >       u64 now = rq_clock_task(rq);
> > >       s64 delta_exec;
> > >
> > > -     delta_exec = now - curr->exec_start;
> > > +     delta_exec = now - se->exec_start;
> > >       if (unlikely(delta_exec <= 0))
> > >               return delta_exec;
> > >
> > > -     curr->exec_start = now;
> > > -     curr->sum_exec_runtime += delta_exec;
> > > +     se->exec_start = now;
> > > +     if (entity_is_task(se)) {
> > > +             struct task_struct *running = rq->curr;
> > > +             /*
> > > +              * If se is a task, we account the time against the running
> > > +              * task, as w/ proxy-exec they may not be the same.
> > > +              */
> > > +             running->se.exec_start = now;
> > > +             running->se.sum_exec_runtime += delta_exec;
> > > +     } else {
> > > +             /* If not task, account the time against se */
> > > +             se->sum_exec_runtime += delta_exec;
> > > +     }
> >
> > ...
> >
> > > @@ -1213,7 +1224,7 @@ s64 update_curr_common(struct rq *rq)
> > >       struct task_struct *donor = rq->donor;
> > >       s64 delta_exec;
> > >
> > > -     delta_exec = update_curr_se(rq, &donor->se);
> > > +     delta_exec = update_se_times(rq, &donor->se);
> > >       if (likely(delta_exec > 0))
> > >               update_curr_task(donor, delta_exec);
> >
> > Considering that we calculate delta_exec in updated_se_times using
> > exec_start of the sched_entity passed as argument, is it correct to use
> > donor in the above?
> 
> Sorry, I'm not sure I quite understand your concern here.  Why are you
> thinking using donor might be problematic here?  We're passing the
> donor->se in to calculate the delta_exec.
> 
> I'll grant that "update_curr_common" maybe isn't the best name for the
> calling function anymore, as we're really only working on the donor
> here. Is that what your concern stems from?

Ah, I think I was just confused similarly to Peter. A comment explaining
this point might help (I believe you were going to add that based on
the discussion with Peter).

Thanks,
Juri

