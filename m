Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC9E289355;
	Mon, 16 Jun 2025 18:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750097769; cv=none; b=IsUDxGcUnRAOccY2Gv07isV9DT+Xk46JFpYyUhKzZFXvo8j22+dLTtBBDQ+pJ0n+2pnm+C4gDLtUlA9S4eashv27ikUevGwVRGQDRdr9/lQL7RG5q57LUd4VK9PU7uJXenbM0fl28GkV6h729dH8IzZdZVGfYRhn+klTuYntk4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750097769; c=relaxed/simple;
	bh=/pZm9yfXNPLct3xNQ9rK2CmHW5wGaXEtYHqQSb38IW0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gjta7YaPC6/nzIIsj4CQEcdmUcYBbA+71yoSnSCJQynwLYOdaIdQXz7mK3AueJuWW4QBTn4gLVCldt2jQWlr6J6UybvfiolgNyhe7jAejr9nv2s2iH3y/37NEF9svyKzndjtFkfzQ/y6SlVX6P74tdbiNCJmxPmsftPROl+gORo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AjlRW9dC; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AjlRW9dC"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6face367320so47159686d6.3;
        Mon, 16 Jun 2025 11:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750097766; x=1750702566; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sT3ko79tVyEi08Of4cxMVWn5wZT+D9NrIn/UbzDrO5o=;
        b=AjlRW9dCqI4b4Gj1Fe8G/sFRZb5Tmc/jnbXGG58qea10M1AyHrJR58RFCisjM72lnA
         g1p7wqI9FgKgYMAwg7gAsKExT/M3R7eiMNwPcDpJaP2YBJDaJnZoXRDt3b1lrAEKSJw0
         pgrU0a9d3t/WaMrDi5PtZpemdfrDUMLmS/9MukF+d+KjsKS9bd29hdhWxu2mnZ9ZKWb5
         XtMKBUwx+kGirqzVi8lBaZaplfZlTuEFv5/rcZlRGXab0BK1TWTsYttuV6LQ7mAzZvJt
         swhmOOg0UkOE9lameIC5vxw5hna0g2f4PyjiSjyIFYCg2RmgdddyNNR8DBKNPUsA9VRv
         sv8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750097766; x=1750702566;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sT3ko79tVyEi08Of4cxMVWn5wZT+D9NrIn/UbzDrO5o=;
        b=f5VLaGHZo/NakgkIQK2b1zOi1rmUBtX7/n/m/xU93K3AKOZ+Xa1d/4eI5XpTWweJuu
         JoKWp8cl9Nirc4iYqZmbPbdMDk8EIStMcS984pCI8e2OFu5fboIgCMSWP/MTDTkL+7Ke
         IAzmVPiWtfDP6D4CdHezmBIp0qpA/8pk4ugApP8CJ7zbjrLZNA7dY6PdkxycMgCZtbuk
         UgOupziW2pYjwqp2uRKIZEeIk0Pcr3aSH7B8ttUpHip+eJPLAZDIdBRu4hGYBUvqc2TI
         tXlEdMB/72Ycd7lwYVJ7G4hiXE8P7+Xgo9LkNoqWlK0oSyGKQzfQvPdXVZELCQr2kZ3F
         XSxg==
X-Forwarded-Encrypted: i=1; AJvYcCWLdS8VIOViI/4TUaI/B6Thmw7/5I1Pi37ofbSgehNect/n2/oZR23CRgG5QzeZXe6SkMPdleBue6FLIV1jjRs=@vger.kernel.org, AJvYcCWqO/ykN+zIiBGlqE4ixiO7iNkbca7U0DBIPnqUBpfFc5QiyqBnvgdZS+qGwvIq3L9Qqh6R4pHCiwv+Aek=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyzj+Uzt9+l0ZZSv1wk4D6uqi8UZJwV/uMItrJpHTAZbDzDl+Yg
	kgT6z8MbC4dbCisScTDzY6rQIKnikWfi6aQWPBHIndUUEnnY41UQzs3T
X-Gm-Gg: ASbGnctfpJoSQSkl3BuLVa+z3b0SumBctfRBWiFUDd68041fP2YcicfyUwtAtWQAavO
	H3UkoBL7dRTHnYXqaSPyQKPCiEkF835VKbXemJE1Ujff9N2H/D/OuGkdh6V2A5SaEhLIMP2bIr2
	kgj0ba4UCeSiNTo6eIWSrObnVbSrTORWylf0ZY3vChM9hsEW3YwO4GrzHCPQldsccJ3QzyKB3+5
	5GT6nxrf2NjOp0r0VA9soXKuQiG2I5u7IvpYxevjtwq0ImaD328K1Jua+U2yNaRtH6SI3SSu1Wr
	E3Rw3CS9tt57OXUTtuqJ5DIJqFGQuvGdvYtDAVOlI65K2PII8btZdzf+OdefYZ8skHPKMPMSu8G
	KkFm1I7dEzYAzpSRG+pWNS3FPgHu4HgggHzgyLAwdppYthXpSL90m
X-Google-Smtp-Source: AGHT+IHIlF9oCh/F8BcpSQ0sJwsx29M4Ym7xtFrEUkK8zwOvDnlfJmU8NN4VBR8GfYYpAHSQNQDPOg==
X-Received: by 2002:a05:6214:2343:b0:6fb:23:4812 with SMTP id 6a1803df08f44-6fb47778242mr133563396d6.26.1750097766478;
        Mon, 16 Jun 2025 11:16:06 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fb366eb588sm52326626d6.58.2025.06.16.11.16.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 11:16:06 -0700 (PDT)
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id 29BA11200043;
	Mon, 16 Jun 2025 14:16:05 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Mon, 16 Jun 2025 14:16:05 -0400
X-ME-Sender: <xms:ZV9QaDl6IpuBIH45PyzKUY5Jcm3xJg80TkjyndApBVSs9SMPVOo0IQ>
    <xme:ZV9QaG1c_2kz1ir_xWKeb9BVPz5UGA6jMM8TrQQ5vJFAZ_86wd5ak2baQw1oGCruM
    B5ZJdOQ5gpWd-PlSQ>
X-ME-Received: <xmr:ZV9QaJqgoEDqoeTpFvuUzPp0vpMTDw8SLMbiS04nnH6RnGjZabgkxYG3Hw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddvjedvjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddv
    necuhfhrohhmpeeuohhquhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilh
    drtghomheqnecuggftrfgrthhtvghrnhephedugfduffffteeutddvheeuveelvdfhleel
    ieevtdeguefhgeeuveeiudffiedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghl
    ihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepgh
    hmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthhopeefgedpmhho
    uggvpehsmhhtphhouhhtpdhrtghpthhtohepjhhovghlrghgnhgvlhhfsehnvhhiughirg
    drtghomhdprhgtphhtthhopehlhihuuggvsehrvgguhhgrthdrtghomhdprhgtphhtthho
    pehruhhsthdqfhhorhdqlhhinhhugiesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtph
    htthhopehtghhlgieslhhinhhuthhrohhnihigrdguvgdprhgtphhtthhopehlihhnuhig
    qdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopegurghnih
    gvlhdrrghlmhgvihgurgestgholhhlrggsohhrrgdrtghomhdprhgtphhtthhopehmihhn
    ghhosehrvgguhhgrthdrtghomhdprhgtphhtthhopehpvghtvghriiesihhnfhhrrgguvg
    grugdrohhrghdprhgtphhtthhopehjuhhrihdrlhgvlhhlihesrhgvughhrghtrdgtohhm
X-ME-Proxy: <xmx:ZV9QaLkpirMaSOrQGVHKKxianjRQNLZR7HUniNx5JPqIIe2ssghm_A>
    <xmx:ZV9QaB2-H7SPat92pIUpmlbNgUStmx9ThWhcJOG9HIuIBU5_MaPgkw>
    <xmx:ZV9QaKuc9B-rvU-kUj2byXFqtxEhJYjMtCfXb_To8LWepW_k9IW-5Q>
    <xmx:ZV9QaFXoKYry37R2jIad48JLWMv34SCG2VPlQ4AHgUVFJiOMcv999g>
    <xmx:ZV9QaA0XoWcVGY28-ZkKPq21tPO4v6-skSc9ZOy_XIz2aPwUlVcjg-g_>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 16 Jun 2025 14:16:04 -0400 (EDT)
Date: Mon, 16 Jun 2025 11:16:03 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: Lyude Paul <lyude@redhat.com>, rust-for-linux@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Ingo Molnar <mingo@redhat.com>,	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,	Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>,	Valentin Schneider <vschneid@redhat.com>,
	Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>,
	Miguel Ojeda <ojeda@kernel.org>,	Alex Gaynor <alex.gaynor@gmail.com>,
 Gary Guo <gary@garyguo.net>,
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
Message-ID: <aFBfY1oyme5PkmqS@Mac.home>
References: <20250527222254.565881-1-lyude@redhat.com>
 <20250527222254.565881-4-lyude@redhat.com>
 <20250616181001.GA905960@joelnvbox>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250616181001.GA905960@joelnvbox>

On Mon, Jun 16, 2025 at 02:10:01PM -0400, Joel Fernandes wrote:
> On Tue, May 27, 2025 at 06:21:44PM -0400, Lyude Paul wrote:
> > From: Boqun Feng <boqun.feng@gmail.com>
> > 
> > Currently the nested interrupt disabling and enabling is present by
> > _irqsave() and _irqrestore() APIs, which are relatively unsafe, for
> > example:
> [...]
> > diff --git a/include/linux/irqflags_types.h b/include/linux/irqflags_types.h
> > index c13f0d915097a..277433f7f53eb 100644
> > --- a/include/linux/irqflags_types.h
> > +++ b/include/linux/irqflags_types.h
> > @@ -19,4 +19,10 @@ struct irqtrace_events {
> >  
> >  #endif
> >  
> > +/* Per-cpu interrupt disabling state for local_interrupt_{disable,enable}() */
> > +struct interrupt_disable_state {
> > +	unsigned long flags;
> > +	long count;
> 
> Is count unused? I found it in earlier series but not this one. Now count

You're right, the original proposal is to use a separate count, but it
turned out we can use preempt count.

> should be in the preempt counter, not in this new per-cpu var?
> 
> Sorry if I missed it from some other patch in this series.  thanks,
> 

Nope, it's merely some code we forgot to clean up from the previous
version.

Regards,
Boqun

>  - Joel
[...]
