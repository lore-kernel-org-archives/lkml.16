Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E82230BC1
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 09:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747215898; cv=none; b=dThN1SPbYmrBiA2ZBQuE4ZZjEpagGTEvnLU0aMLSUtbL09t4p/Q1YjUc2dptFkIi+24KmYlfMQHjY2mirgkbl+WeA/7ModtdjX9ExXUJ0wudPS188x802MQYAunRHJ27IncTqXlem4+jAXj0/WB21a3mc8ZQDwcV/K0eYMJ5M+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747215898; c=relaxed/simple;
	bh=Zn4zpe0vq/Cog1u5FSWrBKwbijYy0b4wPlo2LEAa4BA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YxVO1KzdjXZP5zOvQ6wVw3gqFkIpFNgHf3eIrrdAhaLn9nbpsH1kPDIt5bW9cGB9k5lh6hzWIpZ+s4lL7Z2j5NnvQvPl98Gi66yc3RLbAD6XSDoNDsuYXvXhUYSBUBKhJnhRM52r4t3+ntTNUZ804Co8aBnrg9YwclFXborot/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=QmlzMFpi; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="QmlzMFpi"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5f7ec0e4978so4666810a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 02:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747215893; x=1747820693; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2q9R53V/fDMcpMH8guJFLg3icpz0ciPeizfC22LHQ0I=;
        b=QmlzMFpijvPGx32siDe6hsh8cNyMuvXMDukDf/FPV5ZwkCgPYy4hGgCJTII9BZ1JLk
         Rpj5MD23jFDZwb+3W9yuYkmhpr2rbr5AKo6wnkAatNjhz9DqHCMQGtSrHg4WR+Z8EJRz
         GI2cKZm4TbIms/DdBfunPzVLG8umBhKZ2WVorxMklrFyngb/WO8HrQ3dOf51CV+21425
         WaBZQ207R/Ne5/hmArbo71cywNPAe3kLrDZXuEqK2L9VKo+QXZhXJuhOtr4LuRrH/C8Q
         6tQUnW0XahIeqSagZH0uk4P1OXnYeC2Ag/73iAPAE5MgoAhF0/DbAISAi+8+2vwkW2Tv
         OOPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747215893; x=1747820693;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2q9R53V/fDMcpMH8guJFLg3icpz0ciPeizfC22LHQ0I=;
        b=nCMDOwtMEZtwrH2+VwckRqxyHthD2QTFuTSSsGT9kytjtooqqmJ0X6ZhbpZurNIvyx
         3G5U5Sj+KSVmLmVefsN+WLha84zpKL0xQa1pulxskzgzFbnkBLod34IBpYyBqJ5nL+7N
         L9OY1lc1K/myXNOJPuxli9DsNgLUHrT1nOCIWN+TEXS9wWdv9D1VIIFom93ya8yfBz3X
         MNdOncUrcXOh3aAYdi5MO32eAO89M4gi/YbbtXa7g/Wfu210xWU3RU3oqAz/hSpwi0Sy
         /rVUoJXm6Uvvv1+UbO4z+3Sn6JkCFp8hgIq7p9dP9H1WGG++B6hoNcXhIw+wFlOTqa9J
         whGA==
X-Forwarded-Encrypted: i=1; AJvYcCU7BvVjaqpTJzpy0yixH2qnVJIUbLMUuIrm2WXU85maMkixDKaT3YJuI5EVnrv8Srmdf4JFfVoYGfKDd/4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWwTOtOIUHXsx3AL415mrjL0fFU6gY6wc/gNARG+yCF81Y7rhB
	e4WKg4yqAvb58gFQL0QuYs3NSrVcuJNXqu6PRGA5iyxvx/S/loaEnsSyK/N23I8=
X-Gm-Gg: ASbGncvTX8Km1CbLLch8v0br4Q6FGL02vJMD6sc+prSMNrybPdkDjj9fwulFyTm+Cmv
	7VceYcCpdVIGuOGnGpGLzc3UMzMepNH14QWBMrurRU0ebTtLKJV2BhLs0F1e+eJmc53fDbUdyDe
	GonREMVMLpkGA8w73OlUO9hkgsNBzdIwhY1Qcs04b6ESaTOiDZnVKGHqKS8Ro29ev4jRB2esgsk
	tOQkDW8KBk/qrL40/+RcCV3IgpdFg7G/lM1CeFVV2ndy16Ax/9eCKWp9iy3MT2KUEzLu+DnJSca
	9SJGrPoTRlBoUeIfahaFsuQ2EVWJKo70t26Ly55cqCaJ/IUWPxpZjA==
X-Google-Smtp-Source: AGHT+IE96oxIRsIzDau62o1mwFDV6pP1y6bpVXTUnqkiWb6obYj5PC8SIj6KP+Uab5KGwnBB/dtV+Q==
X-Received: by 2002:a05:6402:268f:b0:5f8:5672:69cb with SMTP id 4fb4d7f45d1cf-5ff986a37b1mr1905243a12.5.1747215892878;
        Wed, 14 May 2025 02:44:52 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ff9ab7e329sm822698a12.37.2025.05.14.02.44.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 02:44:52 -0700 (PDT)
Date: Wed, 14 May 2025 11:44:49 +0200
From: Petr Mladek <pmladek@suse.com>
To: Miroslav Benes <mbenes@suse.cz>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	linux-kernel@vger.kernel.org, live-patching@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@redhat.com>, mingo@kernel.com,
	juri.lelli@redhat.com, vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	mgorman@suse.de, vschneid@redhat.com, jpoimboe@kernel.org,
	jikos@kernel.org, joe.lawrence@redhat.com,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v2] sched,livepatch: Untangle cond_resched() and
 live-patching
Message-ID: <aCRl9h_p3Yu8Gxci@pathway.suse.cz>
References: <20250509113659.wkP_HJ5z@linutronix.de>
 <alpine.LSU.2.21.2505131529080.19621@pobox.suse.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.LSU.2.21.2505131529080.19621@pobox.suse.cz>

On Tue 2025-05-13 15:34:50, Miroslav Benes wrote:
> On Fri, 9 May 2025, Sebastian Andrzej Siewior wrote:
> 
> > From: Peter Zijlstra <peterz@infradead.org>
> > 
> > With the goal of deprecating / removing VOLUNTARY preempt, live-patch
> > needs to stop relying on cond_resched() to make forward progress.
> > 
> > Instead, rely on schedule() with TASK_FREEZABLE set. Just like
> > live-patching, the freezer needs to be able to stop tasks in a safe /
> > known state.
> > 
> > @@ -365,27 +356,20 @@ static bool klp_try_switch_task(struct task_struct *task)
> >  
> >  void __klp_sched_try_switch(void)
> >  {
> > +	/*
> > +	 * This function is called from __schedule() while a context switch is
> > +	 * about to happen. Preemption is already disabled and klp_mutex
> > +	 * can't be acquired.
> > +	 * Disabled preemption is used to prevent racing with other callers of
> > +	 * klp_try_switch_task(). Thanks to task_call_func() they won't be
> > +	 * able to switch to this task while it's running.
> > +	 */
> > +	lockdep_assert_preemption_disabled();
> > +
> > +	/* Make sure current didn't get patched */
> >       if (likely(!klp_patch_pending(current)))
> >                return;
> 
> This last comment is not precise. If !klp_patch_pending(), there is 
> nothing to do. Fast way out. So if it was up to me, I would remove the 
> line all together.

I think that this is not just a speedup. Right below is a read memory
barrier. It says that we need to read TIF_PATCH_PENDING here to
make sure that klp_target_state is correct after the barrier.

Anyway, I agree that the comment is confusing and might be removed.
The comment above the memory barrier might/should be enough.

Best Regards,
Petr
