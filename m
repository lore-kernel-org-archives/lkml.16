Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4111F63F9
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 09:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745918225; cv=none; b=NYtwBhxOlw5/ez7bsXZLGy7CRL7BdoQrhDztz3EDz5lCF6Vy6IIff9p262oaEIbyXicuOxTf5/8AXLpc3yS89idLZ48w27L529oJr0gmKbiTgwU5sFYEQOexjZqBmXxJTKYh8tQixdXt/Zh2nUqmbkPiXW8+NbJuig4OY33f4Yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745918225; c=relaxed/simple;
	bh=Bua77BvsTEBdg+emUBeiyV5uk8g2cvqgvwkYb0dH8FE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OrS9GTc1MmgMaxXGV+64MEHwZBrV4e+Rw85oVEeyiWqUo/u7TwvaqZDGcTLfGZdu0xA4VtTnMsZBP/LX1Sg4/vzlx0w5hSkns1wZ5KVB8PVapDXo1Cdfqju+fEQ+xx/6fRcwZaKuxyIUSQB+e4700pC1DBsZHBJfEZbqiKNqr+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LvKsds4v; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LvKsds4v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745918222;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YY5Jr/Na5YqqLYtEzdUkegEumclz+M+ioIZVRw2o2wo=;
	b=LvKsds4vWZHfo0gjbxylD7ypxpU0vXrMhXUk4iGglwsk7xYMvxcVKgL07tJ4NxP/Z4toqz
	Vu3kIHSNwZJiQf6JVf/J4QgdE1V8QNIIlTEm60zpLB4IgjTov8GkG3507YY46r8Dsc21Fr
	R2QBI1QugGBjTUO0I8CepdhINHHCi3A=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-224-ZqKaye6MOeepJjAveO6uxQ-1; Tue, 29 Apr 2025 05:17:00 -0400
X-MC-Unique: ZqKaye6MOeepJjAveO6uxQ-1
X-Mimecast-MFC-AGG-ID: ZqKaye6MOeepJjAveO6uxQ_1745918219
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43cfda30a3cso28879805e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 02:16:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745918219; x=1746523019;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YY5Jr/Na5YqqLYtEzdUkegEumclz+M+ioIZVRw2o2wo=;
        b=SesXgucmRTFvXwMMGiiDKE2O+v48ITx0C10ZBOZ9R2k8UtGSA1mTV2KsVQe6xXhvbW
         HclNvXPPmfTNH2HeSnKFWAReZQXdNum74FHbZNWfi/auOFPkH4GpvrC+qu2DJzSGxg/I
         pqqI1+kaoGJqqbu1TWppCAojOCg761Y1mGUwH6g3jZz5RaYEbQjf9nTcqmE8DAT9FuLP
         yzXwj0luIgRXpO95T87H2Xs1nUDURxTXL9rfDOLFkpg/0v7vLZMqGOsN4hhdviojdUox
         HTpq3ho+kPMOBgafoD5LvUF5ZEQhfXjPm5KEUAIAHGOTdWBadfJIrr4b4yanGARtPI81
         XB9w==
X-Gm-Message-State: AOJu0YwBN8r/KgE0++6xsRi23RsvyChgTuKM6C+LiQDGUCxcvbArQgr0
	tzhRTccSqMK9gw/6l31zgddYdqaQqsjGvzS06AbwXjhzYDtH35uiRjiyAL/9Jqw5nB6ET0yKuzY
	ChgW0wtnP6FC4myQeLImrMZ/a2fvm7TM03c57PESg3bwzJ0eQFUDMwc0vl1xjUA==
X-Gm-Gg: ASbGncv9PVa+rQE0sHQj8I+izs6/BjKU1UIY1DacGEuDQ3XIPQYFBtEP035YHHe8BXQ
	Fqtpue6Ps3/gkV+k98oncMhxRfC0j/s6sPyOSZ7kiwHue+6HkkLjs/fdA7afnmUiHuf+QR6jy3k
	jU67XufTSsmocH3ygKYpb/9GaOazvHAtXZm6xupk0riy6BU61CkiPglCok0S80KHrZ1XKC9uHbQ
	fnro82W1IypBcVN6pFzwBFGDzW/xOvpCkN9h01sUFFS/9y1flMQ/EgNq07I/hQ+syX1AYNhqT1t
	++BdqZOiB8N5tu/A0n4a6aYOVmhhz8XGlbpazh6E/w==
X-Received: by 2002:adf:f541:0:b0:390:fbba:e64b with SMTP id ffacd0b85a97d-3a07aa6c9bemr8707899f8f.31.1745918218743;
        Tue, 29 Apr 2025 02:16:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFmbLTpXZLDwuBcI3xnSMHiSn+GCeiZONRY81IhCV46TNMEn3ymYSpvmM5+T8o3gxCrTsDRcQ==
X-Received: by 2002:adf:f541:0:b0:390:fbba:e64b with SMTP id ffacd0b85a97d-3a07aa6c9bemr8707873f8f.31.1745918218337;
        Tue, 29 Apr 2025 02:16:58 -0700 (PDT)
Received: from jlelli-thinkpadt14gen4.remote.csb ([176.206.10.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e46976sm13484399f8f.63.2025.04.29.02.16.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 02:16:56 -0700 (PDT)
Date: Tue, 29 Apr 2025 11:16:54 +0200
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
Subject: Re: [PATCH v16 1/7] sched: Add CONFIG_SCHED_PROXY_EXEC & boot
 argument to enable/disable
Message-ID: <aBCZBhw4De6bv47_@jlelli-thinkpadt14gen4.remote.csb>
References: <20250412060258.3844594-1-jstultz@google.com>
 <20250412060258.3844594-2-jstultz@google.com>
 <Z_zMWkvtACZxahu-@jlelli-thinkpadt14gen4.remote.csb>
 <CANDhNCocQLnYxzYYv17prsm7iJSE5032o_00XR0t8d1=gB4CVw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANDhNCocQLnYxzYYv17prsm7iJSE5032o_00XR0t8d1=gB4CVw@mail.gmail.com>

On 16/04/25 14:24, John Stultz wrote:
> On Mon, Apr 14, 2025 at 1:50 AM Juri Lelli <juri.lelli@redhat.com> wrote:
> > On 11/04/25 23:02, John Stultz wrote:
> > > Add a CONFIG_SCHED_PROXY_EXEC option, along with a boot argument
> > > sched_proxy_exec= that can be used to disable the feature at boot
> > > time if CONFIG_SCHED_PROXY_EXEC was enabled.
> > >
> > > Cc: Joel Fernandes <joelagnelf@nvidia.com>
> > > Cc: Qais Yousef <qyousef@layalina.io>
> > > Cc: Ingo Molnar <mingo@redhat.com>
> > > Cc: Peter Zijlstra <peterz@infradead.org>
> > > Cc: Juri Lelli <juri.lelli@redhat.com>
> > > Cc: Vincent Guittot <vincent.guittot@linaro.org>
> > > Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>
> > > Cc: Valentin Schneider <vschneid@redhat.com>
> > > Cc: Steven Rostedt <rostedt@goodmis.org>
> > > Cc: Ben Segall <bsegall@google.com>
> > > Cc: Zimuzo Ezeozue <zezeozue@google.com>
> > > Cc: Mel Gorman <mgorman@suse.de>
> > > Cc: Will Deacon <will@kernel.org>
> > > Cc: Waiman Long <longman@redhat.com>
> > > Cc: Boqun Feng <boqun.feng@gmail.com>
> > > Cc: "Paul E. McKenney" <paulmck@kernel.org>
> > > Cc: Metin Kaya <Metin.Kaya@arm.com>
> > > Cc: Xuewen Yan <xuewen.yan94@gmail.com>
> > > Cc: K Prateek Nayak <kprateek.nayak@amd.com>
> > > Cc: Thomas Gleixner <tglx@linutronix.de>
> > > Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
> > > Cc: Suleiman Souhlal <suleiman@google.com>
> > > Cc: kernel-team@android.com
> > > Tested-by: K Prateek Nayak <kprateek.nayak@amd.com>
> > > Signed-off-by: John Stultz <jstultz@google.com>
> > > ---
> >
> > ...
> >
> > > diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
> > > index 47972f34ea701..154f0aa0c6322 100644
> > > --- a/kernel/sched/sched.h
> > > +++ b/kernel/sched/sched.h
> > > @@ -1149,10 +1149,15 @@ struct rq {
> > >        */
> > >       unsigned int            nr_uninterruptible;
> > >
> > > +#ifdef CONFIG_SCHED_PROXY_EXEC
> > > +     struct task_struct __rcu        *donor;  /* Scheduling context */
> > > +     struct task_struct __rcu        *curr;   /* Execution context */
> > > +#else
> > >       union {
> > >               struct task_struct __rcu *donor; /* Scheduler context */
> > >               struct task_struct __rcu *curr;  /* Execution context */
> > >       };
> > > +#endif
> > >       struct sched_dl_entity  *dl_server;
> > >       struct task_struct      *idle;
> > >       struct task_struct      *stop;
> > > @@ -1347,10 +1352,17 @@ DECLARE_PER_CPU_SHARED_ALIGNED(struct rq, runqueues);
> > >  #define cpu_curr(cpu)                (cpu_rq(cpu)->curr)
> > >  #define raw_rq()             raw_cpu_ptr(&runqueues)
> > >
> > > +#ifdef CONFIG_SCHED_PROXY_EXEC
> > > +static inline void rq_set_donor(struct rq *rq, struct task_struct *t)
> > > +{
> > > +     rcu_assign_pointer(rq->donor, t);
> > > +}
> > > +#else
> > >  static inline void rq_set_donor(struct rq *rq, struct task_struct *t)
> > >  {
> > >       /* Do nothing */
> > >  }
> > > +#endif
> >
> > Does this chunk belong here?
> 
> Uhm. It's there intentionally (as with the config option we actually
> have the potential for the two contexts to be different), but I'm open
> to move it elsewhere if you think it sticks out oddly here and would
> fit better in a later change.
> 
> Maybe, would adding a note in the commit message to clarify that this
> patch also adds the ability for the donor and curr contexts to be
> different, help?

Guess it might, yes. But, it's a nitpick anyway, so feel free to ignore.
:)

Thanks!
Juri

