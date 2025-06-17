Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DC5E2EF640;
	Tue, 17 Jun 2025 14:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750170330; cv=none; b=ahepcRLTaHJPj2Zo7+GK8wA8hF4t+yxfoXQL1rhShzlQ64o2ruVDiSSY+Ptx8eoz/OoEc+Mld1H97YjJjl6L4Gawb2MC5x397IsGrPLGGbrCcj8P8sYY4Dpwh7xHqKR28DuXmVVayBJO2SGRyXBtMgX4rnnfadK91y5L3MjE0Vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750170330; c=relaxed/simple;
	bh=YrCobhfWEwxTugp1Z6t2tNOsm9fDJIp6XvQzv0nATBI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ATYcuhgEvJbQYMHU4+p1rmJouGAmFKMSk1GQbNwGpBVGDKQY3vap8cFzNUm9QatGWUnses6yc5O2PpGt7FKoSaGMRI9puJepRzjF947sc9k0iDWp7HGkdn5wLdWLUeqOH+LGNBIi/5+Th98KtkPKdajr62rcQSVyEo9KMFh+Gs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mqxMQNpz; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mqxMQNpz"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6f0ad744811so33838966d6.1;
        Tue, 17 Jun 2025 07:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750170328; x=1750775128; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TIK1/Jho4VU8r+GZS11/BGVJDtUIz97uC3Jdi3VyPLM=;
        b=mqxMQNpzEbwaccazNF5jDpQ8FK8OvUBvDeMqaNp2KTBqgWS9ZNIG814nPF5Nqtlmna
         6EI0W8s2UAMVvGByuNikEwgoeQA/fEO/FlYvTLgNnqP1M7oQOkAuYvC1qjUg0w594M5R
         oAueFiZXoJ1prZibQGTXXfDy/o5nma7x+9iQIGj8qq9KxQzT8PWTjFsw5Xh9lozJ1o2K
         6DSwO+dlEROzrHCEyZ4LooIojHRa554dMFJtqHzT9YzKYVLm/1cDol76Tl1U3qB4AkWA
         4794k6BWHYfcJS7Jgnzz88vpelXxqSoJ5XRehKIFs7Wbm8gJ6jkl0rFqNwhqZ6mo0XHQ
         CVpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750170328; x=1750775128;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TIK1/Jho4VU8r+GZS11/BGVJDtUIz97uC3Jdi3VyPLM=;
        b=bHKnD0Y+5NO7CoNz+q1xtaJRu2aYbKFez1lHgtqDKjP04zkGgjv3a9CDvJjlCYwCm/
         LNUIG4Ymq0sbgUD61VBh9w2T8+v4haPKJ0rfW5jKLdA/5LhtQozwsJsj7JFsekLBYEH/
         ZujLlS7a2tEAECGaVeSPVl1qUDRiwbkuNCB4i6mLDgAtystkOloi+Uatead06iWvpnAa
         K5IzJGMgvXKBZsaGl+E/TQgTIB2/Yv2uVoghKV8VpSc0apGU9ay9yUnJuSPkNexaJbJI
         Fa3O89yBTOrwBmMKk2KF6msiuNQp+F0GqZu5/rKe7DmE/yovdM6piaWVKEZi9vprqxtg
         AfIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWsmED1Uo1vxJdf6S6pTKnWyDjVStkexC61irt01JPlb9wod7c6V8IX/SYwLPu00sfSDDqgQ81mie6WSUI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw90Ql6sTpz161auJVTl942t1o0wqj4SnCcG8o5Yo1JWu0PkrVi
	lLUmj+UGq2fYUD9z082nbIG8xy2QdEeV0uptV+WsS/r9XwNsFe7EOu/A
X-Gm-Gg: ASbGncvOYLobhP3AvDyr0mjC6LT+IoWfKLHYcE2zZSMupxcq3WCRMyLpflzvgQANY6R
	iHQneU70zVsQKOi5h6Z98oQo+cUCKCxlikiJaQBcuM8r06DgRvr+wuRvjNrJf1EYB9jEiMfaR91
	ZR7C8U0JNwBsKV/nAH/lBmigfjKF0ghCs7Rh+EcNJgTLvU+LQzI5Pr0J16ACuYuE85BMXXdNDxC
	oKJNMEXFiTTGQtLtAWbRRQNb2wuSnwMFfvxMjcbDMLfdvkIUZpe1OoEQFy6Iw1oc8rWNbsx12cl
	PvSDwoU1mtKLsHMQT48f7wkGtdnKSkoXtwZuKjSJT4e3bmM7mDzBfNj9hp+UDSdhiaQa4PIR5gu
	a92M/57fQ2l3AB/+laoZdi4rLuTk+pjCs9JxuTtSw54vHJBH4Z+bI
X-Google-Smtp-Source: AGHT+IGoJ1lNoJ3sa61aaSTN455dngBqSaRb+mH8XrBxFigzHZGtkcKexxZ4vkBp+AfMNyRKycGB5Q==
X-Received: by 2002:a05:6214:2023:b0:6fa:c81a:6204 with SMTP id 6a1803df08f44-6fb47631614mr200121796d6.10.1750170328144;
        Tue, 17 Jun 2025 07:25:28 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fb366eb588sm61278086d6.58.2025.06.17.07.25.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 07:25:27 -0700 (PDT)
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfauth.phl.internal (Postfix) with ESMTP id 1698F1200068;
	Tue, 17 Jun 2025 10:25:27 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Tue, 17 Jun 2025 10:25:27 -0400
X-ME-Sender: <xms:1npRaKGUZj62FsnSx-AR80KDm7O76xlpRf6MlAHGSRTJQAqaGVZ34g>
    <xme:1npRaLUKmKXc9jBApKjLEz5kdYnsKsdET-2xrg_JDUYlzA7N7q34QUHw11bgoDNcp
    ycM-UrmgLxv3QzWEg>
X-ME-Received: <xmr:1npRaEKFl-fd--GPo1arOVzlnxKUgBDAL8RyHcJfmBCE_a7CMnjGyd7yaQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdegudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecu
    hfhrohhmpeeuohhquhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtg
    homheqnecuggftrfgrthhtvghrnhephedugfduffffteeutddvheeuveelvdfhleelieev
    tdeguefhgeeuveeiudffiedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihht
    hidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrg
    hilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthhopeeffedpmhhouggv
    pehsmhhtphhouhhtpdhrtghpthhtoheplhihuhguvgesrhgvughhrghtrdgtohhmpdhrtg
    hpthhtoheprhhushhtqdhfohhrqdhlihhnuhigsehvghgvrhdrkhgvrhhnvghlrdhorhhg
    pdhrtghpthhtohepthhglhigsehlihhnuhhtrhhonhhigidruggvpdhrtghpthhtoheplh
    hinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohep
    uggrnhhivghlrdgrlhhmvghiuggrsegtohhllhgrsghorhgrrdgtohhmpdhrtghpthhtoh
    epmhhinhhgohesrhgvughhrghtrdgtohhmpdhrtghpthhtohepphgvthgvrhiisehinhhf
    rhgruggvrggurdhorhhgpdhrtghpthhtohepjhhurhhirdhlvghllhhisehrvgguhhgrth
    drtghomhdprhgtphhtthhopehvihhntggvnhhtrdhguhhithhtohhtsehlihhnrghrohdr
    ohhrgh
X-ME-Proxy: <xmx:13pRaEF1-BasTguYKW9j5j_cP1v6yY6DDHxlmGjpdbFyHECHDQc5Gg>
    <xmx:13pRaAUXUrNKn_nQ9IKTTBcta4OqXFEcpRy8dn_JK_9y-TcJi22BpQ>
    <xmx:13pRaHPnJCqYVd5XuuH0pyQk6lKWj9HF44yQUmrbgsDv8zP43kgO_A>
    <xmx:13pRaH1vSaTBRUyfWxmgOS2ryLw6T9joGpZs7yeU_0Cc4nyby-T5WQ>
    <xmx:13pRaBWTWyMULMAnc3o1jg67DSr06vdOH6wpujZ7sF_cfaf5GReDps5y>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 17 Jun 2025 10:25:26 -0400 (EDT)
Date: Tue, 17 Jun 2025 07:25:25 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Lyude Paul <lyude@redhat.com>
Cc: rust-for-linux@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org,
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
Message-ID: <aFF61eXT-UyjRQYV@Mac.home>
References: <20250527222254.565881-1-lyude@redhat.com>
 <20250527222254.565881-4-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250527222254.565881-4-lyude@redhat.com>

On Tue, May 27, 2025 at 06:21:44PM -0400, Lyude Paul wrote:
[...]
> +/* No rwlock_t variants for now, so just build this function by hand */
> +static void __lockfunc __raw_spin_lock_irq_disable(raw_spinlock_t *lock)
> +{
> +	for (;;) {
> +		preempt_disable();

Lyude, You can remove the preempt_disable() and the following
preempt_enable(), since local_interrupt_disable() participates the
preempt count game as well.

Regards,
Boqun

> +		local_interrupt_disable();
> +		if (likely(do_raw_spin_trylock(lock)))
> +			break;
> +		local_interrupt_enable();
> +		preempt_enable();
> +
> +		arch_spin_relax(&lock->raw_lock);
> +	}
> +}
> +
[...]
