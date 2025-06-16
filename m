Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7835E2BEFE1;
	Mon, 16 Jun 2025 18:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750096979; cv=none; b=DwmC/H7JQa5DBRJ8KqykEYiQsZRtbZkzsE5pWQYLbiwHYK88uDtjRU4PK3KvruA53NxS3bCExFlwva0U61dLiOUTabLH0uSA+hbw7S6stUCuXHaX9w8Jba9ufqnXWEPk2tYMQDA7GEaiWIHPvoMtR/JOr9XNkc5nlzJP3p/tUt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750096979; c=relaxed/simple;
	bh=6yUTkefeTXoNZBMekMGpt/PwWgtvlHjAzWKqXD+3A/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UYOuovrq0/mVXFH4AtyT9ZAfMVeOGibXzFtLA/0fCBBSk8QMrkW/vSIgXSN+VsIgZSnqTGro0zIXutDppdNSnqXSMP+21h7yLUEMujstDCWX710hyFo1yo6anXDOKRP3EXt8OhuAoPmW5QklUfIiQb5ydfJpyFlRuZwQm+afz5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bk8iZJVp; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bk8iZJVp"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7d09ab17244so460028385a.0;
        Mon, 16 Jun 2025 11:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750096976; x=1750701776; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ybMxdbRrl/ibpCOC1Rvao0WN9rIAFVzyfz1M+Vl9BXg=;
        b=Bk8iZJVpGSkSlqPl3XCPzzUMXvz+ObUhmpVyP+OW9FtQHFpOhrzH+gJmc6xqND27F0
         k9yZ4PEHLUReSDA28M5LZmj135+w6vzlvM5uCF/guieqbO2i9ae0qIfXHp4cHPqgr1L4
         aXVir1U2quMJXkpff4VgQGHSG3V/LB+gad3Iwanv+szDyFI+NAf9Q1tDJyhe0fAdBcpX
         xVaK07lDPuoBUkI/V0T4SZXhLUKpea2pY1uyA2ZOO3KtsBBDotehEaHYSqf304ZZcibF
         Mt5AJJp09ZPvpx1CHicOXMJqYiHykLPAm52OdwS7XZGmItvA6oxtua+y0uZhFk+S7dEC
         8nRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750096976; x=1750701776;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ybMxdbRrl/ibpCOC1Rvao0WN9rIAFVzyfz1M+Vl9BXg=;
        b=LjSFFsohh16rTFcWW88MlsV1c3KmpW4nqCHBKD3S0nrRHXFdtkhMpxZS8K5tYuqqyi
         NB9HutKWC4ANIb/gWW0Xdj+JBYJDHnaUiDhzoe/EyngXSyC6Yn4x6p8e3b6BH/Y1loGI
         SloFlnH6RPFXuZ0j0L1iE6IVYtoZdnqi/p/mEKNPYlm6KGK70eZfnfLhBRYkd4kBoqlM
         WTqKJ83ZtpUGUp7hXX61m9qhyaB4aEJqrBgyl4LdD2s2Tx7dkkPWIzYUSXn4c7WN4HxW
         Dki1BpXsVnkUg0N7e2BGJl9D54aRFR42Zsj6QfbcjD0d7w6/XM6fXjRGbk9pgk0JYy0p
         HKoA==
X-Forwarded-Encrypted: i=1; AJvYcCVEUs6mBlZHCMALZuIB3cMFkv7djr9NmS3MoiXIgEmj4pRYzAHJ+NsxB+qgO68vlr4I2u1vVzVqrgZnQVg2gqQ=@vger.kernel.org, AJvYcCWtv+tvx62ll8z0XbX7H/ojQ2RvcyOGZew6SYSf+a8tbt7+90XIkB4tDzGWN9iXKwqpI/vXCMVdWKnr/gA=@vger.kernel.org
X-Gm-Message-State: AOJu0YziFesrtlT3PDw9W7/JtdEbNEZCnNZYJmc7u+/6mEKyKfm9JosN
	TYHAk5YK7WZbNUDjSGxmnSUhXCOz2C7QBiEEpWafp4je4BgmOsx42Zsy
X-Gm-Gg: ASbGncuztnjmyg0vFoPMNn3T6l/g/hqE3Go7TqKAxYw2iGJzjPbPyUkEd279SE1AmJG
	37w7qFmxRpxBDU8z5tO5zyxUeaY9OkJ9l0DOudbVuMjH7tMQ+5QOMb/yV/s+HAgZg94tdwz/YZX
	101wLT/Z9n2mxEEPy9t6KhRcAjPs90pz+TxKvnMhzRyZVvxvZWDfdRkMFq7kR1D/pKABR8fm/0J
	2M4QA2WuWik8Qi9cQvQ14vdK4UjVuWWc2sgRY+Kfsoecs0dmeUfb34/ErAz2z4V4WREqd8xA784
	9LAWMyJv27TMYltIKfSI2Bd0E6+C17cprXQitE+wXt1doND8z0Y61xEBvCoHnmIAMG+6fKs3FtC
	2bB5PFQC/hoSyZl41g7FlIUmtJ4SASIWNmJWFzSLpqfg9mHGS1GHy
X-Google-Smtp-Source: AGHT+IEEmzfHT2BF+rrwv+RVnuvxCBqsm0JHqvIqlQATlmYcugX2ub+fihFoixaIv/1qGP+tWRN4Uw==
X-Received: by 2002:a05:620a:3725:b0:7d0:a1c9:65a7 with SMTP id af79cd13be357-7d3c6c0d336mr1636279985a.6.1750096976265;
        Mon, 16 Jun 2025 11:02:56 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3b8eacbbcsm555097585a.53.2025.06.16.11.02.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 11:02:55 -0700 (PDT)
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 277D31200043;
	Mon, 16 Jun 2025 14:02:55 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Mon, 16 Jun 2025 14:02:55 -0400
X-ME-Sender: <xms:T1xQaABgcyl2RZEAwhimtj1iBJ8KTIGF5fM6GWdn5nZKHIxhUP_BGw>
    <xme:T1xQaCj8VRaWgyLzaV0VGDUIihyQOvbeCnSbbtj8uueVpRx5Q7MjjOaUbCFZgKTdG
    gyz_C7nMYDFcCYbjQ>
X-ME-Received: <xmr:T1xQaDmlaN86M1W-pi7-N8UA0fVliMn3PqX5vQdYCBJgWtEzgIEX80n9kg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddvjedvhecutefuodetggdotefrod
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
    drtghomhdprhgtphhtthhopehpvghtvghriiesihhnfhhrrgguvggrugdrohhrghdprhgt
    phhtthhopehlhihuuggvsehrvgguhhgrthdrtghomhdprhgtphhtthhopehruhhsthdqfh
    horhdqlhhinhhugiesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehtghhl
    gieslhhinhhuthhrohhnihigrdguvgdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlh
    esvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopegurghnihgvlhdrrghlmhgv
    ihgurgestgholhhlrggsohhrrgdrtghomhdprhgtphhtthhopehmihhnghhosehrvgguhh
    grthdrtghomhdprhgtphhtthhopehjuhhrihdrlhgvlhhlihesrhgvughhrghtrdgtohhm
X-ME-Proxy: <xmx:T1xQaGz7bie_oC7XErID_YPsf7Ly5PP8XS5hjj4kV8TwtX_k1zfXuQ>
    <xmx:T1xQaFTZ9ytc_FsLSM0QRzP_N72Clmo9betLUSIaF4DTRDdC1TrYEQ>
    <xmx:T1xQaBadHxiYtUGp9SGn4FSDbVlnF5KL7lz14cwdSNl8MJ6QEScMVA>
    <xmx:T1xQaOQ3fQMAyyK8AGG379E_v4cZuWNTwbNu769-kJP_gnUCbrAC9A>
    <xmx:T1xQaPBwaEMMeRKKkpRtIt5PwatO4sXeXqqVa_DJqIFaXrhw4zuKb3-c>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 16 Jun 2025 14:02:54 -0400 (EDT)
Date: Mon, 16 Jun 2025 11:02:53 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Lyude Paul <lyude@redhat.com>,
	rust-for-linux@vger.kernel.org,	Thomas Gleixner <tglx@linutronix.de>,
 linux-kernel@vger.kernel.org,
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
Message-ID: <aFBcTePC-iXqRuXq@Mac.home>
References: <20250527222254.565881-1-lyude@redhat.com>
 <20250527222254.565881-4-lyude@redhat.com>
 <20250528091023.GY39944@noisy.programming.kicks-ass.net>
 <683721f1.050a0220.80421.29ff@mx.google.com>
 <20250616175447.GA900755@joelnvbox>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250616175447.GA900755@joelnvbox>

On Mon, Jun 16, 2025 at 01:54:47PM -0400, Joel Fernandes wrote:
[..]
> > > 
> > > Your SOB is placed wrong, should be below Boqun's. This way it gets
> > > lost.
> > > 
> > > Also, is there effort planned to fully remove the save/restore variant?
> > > As before, my main objection is adding variants with overlapping
> > > functionality while not cleaning up the pre-existing code.
> > > 
> > 
> > My plan is to map local_irq_disable() to local_interrupt_disable() and
> > keep local_irq_save() as it is. That is, local_irq_disable() is the
> > auto-pilot version and local_irq_save/restore() is the manual version.
> > The reason is that I can see more "creative" (i.e. unpaired) usage of
> > local_irq_save/restore(), and maybe someone would like to keep them.
> > Thoughts?
> 
> My thought is it is better to keep them separate at first, let
> local_interrupt_disable() stabilize with a few users, then convert the
> callers (possibly with deprecation warnings with checkpatch), and then remove
> the old API.
> 

No objection to doing it slowly ;-) My point was more about the plan is
to replace local_irq_disable() with local_interrupt_disable() other than
replacing local_irq_save() with local_interrupt_disable().
local_irq_save() will still be available for "power users" if they care
about precise control of irq disabling. But it's not necessary to be
done at the moment.

> That appears lowest risk and easier transition.
> 

Agreed. Thanks for looking into this.

Regards,
Boqun

> thanks,
> 
>  - Joel
> 
