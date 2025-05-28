Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B9E828BA86;
	Wed, 28 May 2025 14:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748443637; cv=none; b=E/xax24XxvyMK7rwi4JSz2UmwIu+66VCdnzi5pS84xYjk7nridcXCDGwyqmG2zWyHlbI2o+MvIbZx8gFTW0scxBLMauR0Hy+6xO8q/21qL4ga+11aR4EH8mdU5K8O0IhE6a1Y620yNtn/ontM78iSKfGcYI5W7orNsI5E15VU5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748443637; c=relaxed/simple;
	bh=m+MaMGjgOQIJ9Pg5U4JmFhaKVJyB3n1SsDypWk9VzOg=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mLlfHlX0xR7EtMiLftnqQmAmaWniQ0+jU8FXW7b3eFBNW4uhpkZXvgYsUkKQi1mJxYMhfJPaakWLN3YmlOJOjZePOL1tANBiR+IbSzv/rJR2BjBZ/Z9h1qdgDklrA9P9h1dl7yhtVSLi+jRg9jlDCczCdwga/qoD+qlPEua1GQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ddxrQcIy; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ddxrQcIy"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7c560c55bc1so441422085a.1;
        Wed, 28 May 2025 07:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748443634; x=1749048434; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:feedback-id:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GeCEdtOf7WNBgSJClbP1+l5L+CozBjsJNA4pYrE2hbM=;
        b=ddxrQcIyDuExMoiWqpltwpZPdM7/clMKHxLKYsgysQzLbYKo0qQLEPwcnqvgwNKXIW
         F9o3DsRUcZrvp5/yzr2gEi+FmBKrL7yotmbCYnHpln+8JL4Xqpq3jYpseQ7S1Ht924yz
         Dnq3stZvM6M7qqz2spR8Bjf1SX6tTuOIxZx3HDUzEkqRil+5XCxJ9RtRzihvyNE7K/7b
         K/S29HRwMyd0SiNLujFfqiehI/T+/PBEtLJm5wR9zdxYCrVWRPwVcNDWoQUdFbltPzTA
         t/QlclCO6QDL0cCEMaM4SH+tuYCj/sXYd8irpJj8YgQuQJGj9C2JrPd/BwjuLC2sjUEO
         76kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748443634; x=1749048434;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:feedback-id:message-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GeCEdtOf7WNBgSJClbP1+l5L+CozBjsJNA4pYrE2hbM=;
        b=jyf8B4GPw1rwoDITHSie1UKdxAuVomir7WkVSXnb5iXwKfFyYvx+BDjiJvB/kYkrSj
         VYUevRHQTFwQNmqZOYx9AhB5A0l97+GVOu52VbMcAYZnsYlUjuGunuNyHy4wv5ZVSXJw
         1wp1JD6MoCVIMoE78foyHOch81hbnxYQ39/zXLxpkgLbvMLWfv3Hm6fdKq8l/P/kwF1P
         sjZ6Ou1FcXr0kP5mNOdo+/jbVlYUHrfycaS3WJsLqN1OF0QXufromq4cWr6iK78O2zTe
         SulaXV35OwplX8kguLRrMPs+PuqcNz3ZfM+UJYgcQOKvuMlwLTWNf5oeF0ZC0sIKo2TJ
         G4DQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9R4mG0ROgZENIDKFFc2NcVqr9WOVv18UzbSX0AbuZ6+OCct5KcR1GcoV5ZpfpXcgI/6GfFrT++oKgqpvDMnM=@vger.kernel.org, AJvYcCUSZRRdrHqt7Jzn7R5k1FFF9s9TMVrzyc3aAITjMQpFCiMQKP0QJZc2H8bM7lgyB4OvshVz9U+UYlmdz1c=@vger.kernel.org
X-Gm-Message-State: AOJu0YxF4JUOEBMIhAHtn0weF4nyXQ6ooCwVMgwiAv1tHda4LUk211u4
	cTDuK8Nx4X+Yif0LJR5HhDWLoyW7yqDkplnPv9CHkJnZaEjQDFzwnvuM
X-Gm-Gg: ASbGncuZXxaQKzwlNUkUFbZgXjdpy2g7+OXB9oSwWMNMX8i4UYc1TH6awvbK+CscGW/
	wYwFrV0lNhVudYw6AoeoACuuaOILZGgwTALVDEQGI34XW+NkgOAmLpoeqAgbjm1JhJxhVHicCPF
	dBByvFehYLzLg5JkPJW8WznIf94yvKlyKHSff2S0j+s1tIbyfBEVKLwL6K+xQ5vWxZFU5BInlZY
	uCaH9S4Uw+5MX4yJGm5f/d7KgbATRRFPzeobAJ9ZEoIX+O7R1z3ZKeJEKJSEiUCdRt34pb3DyMW
	SVvyhJnYuU6SiljsWazPnOJfWq4ZZyB+mxEyojDy3+benqKgJzn6dKeqvYsYuLr78BQCnE08L4t
	Wz5l9HN+U97Lv+9ghI2twO35suzgZNs1TP34rk5ZYyg==
X-Google-Smtp-Source: AGHT+IFPXQGaw1O1c9U5xXJZVucDUV3AN03vR3z9CahJul5Aavx1etvqSZyGVwO9KoEQIhM2j8MZdg==
X-Received: by 2002:a05:620a:4046:b0:7c5:3cf6:7838 with SMTP id af79cd13be357-7cfcac2a902mr377293585a.49.1748443634006;
        Wed, 28 May 2025 07:47:14 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cfc5d3a3c6sm78141685a.71.2025.05.28.07.47.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 07:47:13 -0700 (PDT)
Message-ID: <683721f1.050a0220.80421.29ff@mx.google.com>
X-Google-Original-Message-ID: <aDch7ZOD6jjGXJdE@winterfell.>
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfauth.phl.internal (Postfix) with ESMTP id ABE6B1200043;
	Wed, 28 May 2025 10:47:12 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Wed, 28 May 2025 10:47:12 -0400
X-ME-Sender: <xms:8CE3aP0TA48N3AZsWa2ACT3TYM888jb-hDQVijyVQYV0L3eH47Frmw>
    <xme:8CE3aOHsdsOZUgpjv_U6t9wcWRyrqEHYNIhEIx5ij_XKSP0f_vf0cEnph7-6ifyN5
    xT8EMgQ4Izu1PBO3A>
X-ME-Received: <xmr:8CE3aP5ZQYe14_NIekJBEMAzDe6qai93IpzDAd5w9qWIxwPnZ0RucDFBI-Gij_Fglrpq0-teK2A->
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddvfeehfeculddtuddrgeefvddrtd
    dtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggft
    fghnshhusghstghrihgsvgdpuffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftd
    dtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhf
    gggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhquhhnucfhvghnghcuoegsohhquh
    hnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvghrnhephedugfduffff
    teeutddvheeuveelvdfhleelieevtdeguefhgeeuveeiudffiedvnecuvehluhhsthgvrh
    fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhp
    rghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqddujeejkeehheehvddqsg
    hoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggp
    rhgtphhtthhopeeffedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepphgvthgvrh
    iisehinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhihuhguvgesrhgvughhrght
    rdgtohhmpdhrtghpthhtoheprhhushhtqdhfohhrqdhlihhnuhigsehvghgvrhdrkhgvrh
    hnvghlrdhorhhgpdhrtghpthhtohepthhglhigsehlihhnuhhtrhhonhhigidruggvpdhr
    tghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpd
    hrtghpthhtohepuggrnhhivghlrdgrlhhmvghiuggrsegtohhllhgrsghorhgrrdgtohhm
    pdhrtghpthhtohepmhhinhhgohesrhgvughhrghtrdgtohhmpdhrtghpthhtohepjhhurh
    hirdhlvghllhhisehrvgguhhgrthdrtghomhdprhgtphhtthhopehvihhntggvnhhtrdhg
    uhhithhtohhtsehlihhnrghrohdrohhrgh
X-ME-Proxy: <xmx:8CE3aE3xuMxJzwINYgvwwxtX5FFkJxZUUqr1wdz-dljBa-9RybqZ-A>
    <xmx:8CE3aCGwycgRSDP5pzGYQX0bheqFQqfkkhv_KXSSDw9xnD5s20V_kw>
    <xmx:8CE3aF9AcC9kTcYyNrG1BtoeXW-QfRlqPO0aKRo6gbFFCvhcoz-sAA>
    <xmx:8CE3aPlT0jjET3CjFdiHGaYTZTsZrSSULvAWTX64aLxViYKuI1fTXQ>
    <xmx:8CE3aOFDPIloTPLi5MWNuMI6ghUzAEhdAJRR-jrjx_lUcz5H5g_lO26e>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 28 May 2025 10:47:11 -0400 (EDT)
Date: Wed, 28 May 2025 07:47:09 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Lyude Paul <lyude@redhat.com>, rust-for-linux@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
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
References: <20250527222254.565881-1-lyude@redhat.com>
 <20250527222254.565881-4-lyude@redhat.com>
 <20250528091023.GY39944@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250528091023.GY39944@noisy.programming.kicks-ass.net>

On Wed, May 28, 2025 at 11:10:23AM +0200, Peter Zijlstra wrote:
> On Tue, May 27, 2025 at 06:21:44PM -0400, Lyude Paul wrote:
> > From: Boqun Feng <boqun.feng@gmail.com>
> > 
> > Currently the nested interrupt disabling and enabling is present by
> > _irqsave() and _irqrestore() APIs, which are relatively unsafe, for
> > example:
> > 
> > 	<interrupts are enabled as beginning>
> > 	spin_lock_irqsave(l1, flag1);
> > 	spin_lock_irqsave(l2, flag2);
> > 	spin_unlock_irqrestore(l1, flags1);
> > 	<l2 is still held but interrupts are enabled>
> > 	// accesses to interrupt-disable protect data will cause races.
> > 
> > This is even easier to triggered with guard facilities:
> > 
> > 	unsigned long flag2;
> > 
> > 	scoped_guard(spin_lock_irqsave, l1) {
> > 		spin_lock_irqsave(l2, flag2);
> > 	}
> > 	// l2 locked but interrupts are enabled.
> > 	spin_unlock_irqrestore(l2, flag2);
> > 
> > (Hand-to-hand locking critical sections are not uncommon for a
> > fine-grained lock design)
> > 
> > And because this unsafety, Rust cannot easily wrap the
> > interrupt-disabling locks in a safe API, which complicates the design.
> > 
> > To resolve this, introduce a new set of interrupt disabling APIs:
> > 
> > *	local_interrupt_disable();
> > *	local_interrupt_enable();
> > 
> > They work like local_irq_save() and local_irq_restore() except that 1)
> > the outermost local_interrupt_disable() call save the interrupt state
> > into a percpu variable, so that the outermost local_interrupt_enable()
> > can restore the state, and 2) a percpu counter is added to record the
> > nest level of these calls, so that interrupts are not accidentally
> > enabled inside the outermost critical section.
> > 
> > Also add the corresponding spin_lock primitives: spin_lock_irq_disable()
> > and spin_unlock_irq_enable(), as a result, code as follow:
> > 
> > 	spin_lock_irq_disable(l1);
> > 	spin_lock_irq_disable(l2);
> > 	spin_unlock_irq_enable(l1);
> > 	// Interrupts are still disabled.
> > 	spin_unlock_irq_enable(l2);
> > 
> > doesn't have the issue that interrupts are accidentally enabled.
> > 
> > This also makes the wrapper of interrupt-disabling locks on Rust easier
> > to design.
> > 
> > Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
> > 
> > ---
> > V10:
> > * Add missing __raw_spin_lock_irq_disable() definition in spinlock.c
> > 
> > Signed-off-by: Lyude Paul <lyude@redhat.com>
> 
> Your SOB is placed wrong, should be below Boqun's. This way it gets
> lost.
> 
> Also, is there effort planned to fully remove the save/restore variant?
> As before, my main objection is adding variants with overlapping
> functionality while not cleaning up the pre-existing code.
> 

My plan is to map local_irq_disable() to local_interrupt_disable() and
keep local_irq_save() as it is. That is, local_irq_disable() is the
auto-pilot version and local_irq_save/restore() is the manual version.
The reason is that I can see more "creative" (i.e. unpaired) usage of
local_irq_save/restore(), and maybe someone would like to keep them.
Thoughts?

Regards,
Boqun

> 
