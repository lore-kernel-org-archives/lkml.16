Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D27571F4CAE;
	Tue, 17 Jun 2025 14:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750170855; cv=none; b=THenKxwq4cEOfRuUlTLQzMRUfG+tcpt/69xL8PCJJ0OGb4JAHDdsJEtcZnz0xOJA7rELivr5l5r98JknjmB1dBFn6yMh2+oVTOPfs9zLCZmLwyqQbrS5yHDz9CUSAMzAb+oGYyoBhyXMR3tCCg1SPizLzQTmx9bsaqH1DmDVT+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750170855; c=relaxed/simple;
	bh=vkyVZ89rEugsgiK7V1jYcH+faW7cMWHmpzby7nKLUrc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XcXrZS5Ot76VE1IRwvXM4Y/VP+mfP7n+bHhfKDRlp2+hdGu0rZy2D7YEjWM4T3kIFXPU0vVo2T+DdGRVdFJQo4QvbNp2JPNWRmgBQt06EXrRja7am2TYlwOfC2lrqS5ZLYKxHJYmlr9nWmcNyMfOyy+w8qabgtlNZt4SoSYpzxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=abKF208p; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="abKF208p"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6fac1c60e19so70879506d6.1;
        Tue, 17 Jun 2025 07:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750170853; x=1750775653; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qtu+Y/oXIqQeAyDIwMqtulQfjbzEg3VKimiWJlihB/M=;
        b=abKF208pppdMxHRG+7FU+MaoRpjjZ0G0BjKbWE537t2Bmze9F9jpZDdGwdqvsMSqh4
         zsctmYSo/bxfDggO6MthlopqeORZXjzcGM5gJrWRkRRB/HORRz/nnIPWS/d6QazwZkrY
         4UV4nTPmhXKQuBGrNxSqYThCLMj7syokS2gG/omjLypyTosMU1qw66O/Kq9PkSjVwDGr
         aDLVNlX9S438X7/pcozHb/fzKRTOJHZq8w2s//ZihIl/eJmTSRiZ1Hlnd52l9dj3Rqlz
         Xi/S0+CxRkEN+Mb6mL/2IgG8LDoGp1PsocK4iiZvTVRMyfUR6mq0q/K12H5AdTLGYsCk
         BhYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750170853; x=1750775653;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qtu+Y/oXIqQeAyDIwMqtulQfjbzEg3VKimiWJlihB/M=;
        b=ghadpEixAgRw2XfvEXfIsQYSN1+Y40bjzUzNCtaUgdXTH712AC9XrwvEGeulQ15Hsj
         BU2N2TWRSWafCA0/SY7AHaBzKyBUZpSJbhQURA/SJ+HHJsY9VtE7tFFR8PDH10eYTDar
         H4qVPZbnRM6Rd71arygjQk/XOyluvp02Mxja8U6xFbssI7P+yLeEg8doRp6roZCSjTSz
         OC0Qz0ovBysaT1xIon38hYdTYzizE74u0JvAHRB1ErK8CDwG0TtitJ4lBqPS+JZowA3n
         sBhTap5zkAw3vtxPe5gobtrmOYEHeHDsYFwoz+E4IqWqSDl1+FUrGPbRsKB3ADDWnNgD
         agCw==
X-Forwarded-Encrypted: i=1; AJvYcCVe3ai2ZahB20S5oDlp1JbvKwWjB1Y/NTZdGbFgeyJr2lnQhtkXIkWxFLhE6EIRf8DaA5MO5+rhfwrTMv8FaVc=@vger.kernel.org, AJvYcCVwOvzWzLegyYP7IrhZI77/zNmk+YQNhJWKpxcX+S/LSX4JLNXLyJDIfoyxEMSdWj+VCVJTkCIkU4b1iPE=@vger.kernel.org
X-Gm-Message-State: AOJu0YytNNtB1Cz407kIy1w9Li5LoKc2AYRDGhxxDZkS6MD3AuNzLr2P
	IqeGyRFjrpS44uJ4aXWde6lF/bATEpSV+c0XmYR5vTeT/e4DtkoG8xdC
X-Gm-Gg: ASbGncuBTMf1SVyhPqLULdjZXiPmU/kp14LrTfq+bslxBrSqK09YhNX542oyTRN7o0h
	D5W+Wk/OT0OIbxHSlrUIJE9d2k83ArvwKDuE5jRjKVVE1BTEHNLEr+aelmbViotzcnoilTE+hKa
	3rEJP6PPhmqMoZGnmqj13J1vxAsAdmNro1Ln2nGnD9yb2HvOizTaRr0iVz432ux964GEJFj3OaW
	tXTRiJQ40OXZIHTHqNmUFBEegmWIgBjU8t2VLWAJ297dpLj+il2hgbF+v2gTf7TTWt0S+Xrb6j9
	LL7hnQ94P9rReSeq9kN1dMO0aqXQC3Rsk+jlZ4yXi2RuEIboLbUKFEUJPqHETlps/coAw/xuDaM
	CMmzYlqq41Vq7CnRXpBg+UexZ2I0k05QwoU8NpGGN2Nd9Jw4xyIwG
X-Google-Smtp-Source: AGHT+IH1zyNMnttx1Bi0Q+pP4QqmSyitxELiw9qLRz7y2keLnFHL0zn6RxkzodMMHqSrKS5aXYWEAg==
X-Received: by 2002:a05:6214:5504:b0:6f5:1192:ccdf with SMTP id 6a1803df08f44-6fb46d61b3emr195981916d6.6.1750170852700;
        Tue, 17 Jun 2025 07:34:12 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fb35b20eefsm63198126d6.4.2025.06.17.07.34.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 07:34:12 -0700 (PDT)
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfauth.phl.internal (Postfix) with ESMTP id 83D201200068;
	Tue, 17 Jun 2025 10:34:11 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Tue, 17 Jun 2025 10:34:11 -0400
X-ME-Sender: <xms:43xRaL2JHcN5_oivyoB-pxbMitx5ACVpQwJxEc3GYm2560DNze-Paw>
    <xme:43xRaKGPhcV8cEsFdrFKUeSpnFUObWWule7wHtxxSCOAAgMzNSMOZsAwnZnZ8u9EC
    WtFGhuHyePt4uc5_A>
X-ME-Received: <xmr:43xRaL4ltRbwuilpXsU1frFBqL2rMRhRsVKok-_fLBC477qD1qQQ-PiWbA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdegfecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecu
    hfhrohhmpeeuohhquhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtg
    homheqnecuggftrfgrthhtvghrnhephedugfduffffteeutddvheeuveelvdfhleelieev
    tdeguefhgeeuveeiudffiedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihht
    hidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrg
    hilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthhopeeffedpmhhouggv
    pehsmhhtphhouhhtpdhrtghpthhtoheprhhoshhtvgguthesghhoohgumhhishdrohhrgh
    dprhgtphhtthhopehlhihuuggvsehrvgguhhgrthdrtghomhdprhgtphhtthhopehruhhs
    thdqfhhorhdqlhhinhhugiesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhope
    htghhlgieslhhinhhuthhrohhnihigrdguvgdprhgtphhtthhopehlihhnuhigqdhkvghr
    nhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopegurghnihgvlhdrrg
    hlmhgvihgurgestgholhhlrggsohhrrgdrtghomhdprhgtphhtthhopehmihhnghhosehr
    vgguhhgrthdrtghomhdprhgtphhtthhopehpvghtvghriiesihhnfhhrrgguvggrugdroh
    hrghdprhgtphhtthhopehjuhhrihdrlhgvlhhlihesrhgvughhrghtrdgtohhm
X-ME-Proxy: <xmx:43xRaA0yFT_7sm1CQYMP4L3UdFGEEGV2vpKgBdbYwa-R9cdPcy2lQA>
    <xmx:43xRaOHBPY0BUou9PuOpOEy7KlnF-3PkYHlKLUyzYTJINSvD8myiVQ>
    <xmx:43xRaB9Pzvmx3hXM-WHvAfzQIjm1YRy-RAmg1wPFWCL8VZYcaf0igg>
    <xmx:43xRaLkbH_13RJSmVWA8OfZ8KnSeYh4KiVJnztUk2pkhnOhkL_ePPQ>
    <xmx:43xRaKHQY74Y8NYolLJFyUeOU1-_eegapcHJkpJJEzRjmhTJW5RN-FH8>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 17 Jun 2025 10:34:10 -0400 (EDT)
Date: Tue, 17 Jun 2025 07:34:10 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Lyude Paul <lyude@redhat.com>, rust-for-linux@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Ingo Molnar <mingo@redhat.com>,	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,	Will Deacon <will@kernel.org>,
 Waiman Long <longman@redhat.com>,	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,	David Woodhouse <dwmw@amazon.co.uk>,
 Jens Axboe <axboe@kernel.dk>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	NeilBrown <neilb@suse.de>,	Caleb Sander Mateos <csander@purestorage.com>,
	Ryo Takakura <ryotkkr98@gmail.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>
Subject: Re: [RFC RESEND v10 03/14] irq & spin_lock: Add counted interrupt
 disabling/enabling
Message-ID: <aFF84rW5fNXrnwC8@Mac.home>
References: <20250527222254.565881-1-lyude@redhat.com>
 <20250527222254.565881-4-lyude@redhat.com>
 <20250617101120.7c946656@gandalf.local.home>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250617101120.7c946656@gandalf.local.home>

On Tue, Jun 17, 2025 at 10:11:20AM -0400, Steven Rostedt wrote:
> On Tue, 27 May 2025 18:21:44 -0400
> Lyude Paul <lyude@redhat.com> wrote:
> 
> > +static inline void local_interrupt_enable(void)
> > +{
> > +	int new_count;
> > +
> > +	new_count = hardirq_disable_exit();
> > +
> > +	if ((new_count & HARDIRQ_DISABLE_MASK) == 0) {
> > +		unsigned long flags;
> > +
> > +		flags = raw_cpu_read(local_interrupt_disable_state.flags);
> > +		local_irq_restore(flags);
> > +		/*
> > +		 * TODO: re-read preempt count can be avoided, but it needs
> > +		 * should_resched() taking another parameter as the current
> > +		 * preempt count
> > +		 */
> > +#ifdef PREEMPTION
> > +		if (should_resched(0))
> > +			__preempt_schedule();
> > +#endif
> > +	}
> > +}
> 
> I'm confused to why the should_resched() is needed? We are handling
> interrupts right? The hardirq_disable_exit() will set preempt_count to zero
> before we enable interrupts. When the local_irq_restore() enables interrupts
> again, if there's an interrupt pending it will trigger then. If the
> interrupt sets NEED_RESCHED, when it returns from the interrupt handler, it
> will see preempt_count as zero, right?
> 

Because the new local_interrupt_{disable, enable}() participate the
preempt count game as well, for example, __raw_spin_lock_irq_disable()
doesn't call an additional preempt_disable() and
__raw_spin_unlock_irq_enable() doesn't call preempt_enable(). And the
following can happen:

	spin_lock(a);
	// preemption is disabled.
	<interrupted and set need_resched>

	spin_lock_irq_disable(b);

	spin_unlock(a);
	spin_unlock_irq_enable(b):
	  local_interrupt_enable():
	  // need to check should_resched, otherwise preemption won't
	  // happen.

Regards,
Boqun

> If it does, then it will call schedule before it gets back to this code.
> 
> -- Steve
