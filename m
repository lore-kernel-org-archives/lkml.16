Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1DD221FF5B
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 21:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750888122; cv=none; b=Otg7ZdQhJ0w6XphW0bLt8UDnMrrAlQzE3EVAuhKQT8Yl/JGTgnjaiSQQIDECsk1Ev8fakFfxsbAtRCctQjjiD63hv7PjX1i2kgumCwsB0Nli7qKlhI6GaHLKJK8g/xdEc3eob9F1/qhuz3QOzy983jxUOOxNsR9fOuM1KkDhK+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750888122; c=relaxed/simple;
	bh=2Al1Xo1j+YCP/7/wS0Hh4MVF7Bsv2KTjyejkLKFeTL4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AMjxPKKKFT5SQMAcdstLNxV8rQgxYKnubAfyX9bFuDKlcFgGkeDNs+0Reruk4k1ksIRc6qNyA0sR22Op/0ZaKozD5sR3DXLGKrhZGa02ApzYDHFT6tz0TmnYo8FcoGRLPCJeMxy2PBVTNWR6pk9mdJ3pTRPs62s7mpCMit+XxVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RQL9DnYl; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RQL9DnYl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750888119;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yf7LN45AXmV/wr0eUVyPBaPat33AzTTVr9f1fotPlKU=;
	b=RQL9DnYlrrtzBaMLSDDHcjRUG84cJEhH/R3Hq7pJZLQkgR7uu3v/G44T8yuTJG7BbXj/vw
	y4Mkpj8FQuRijNzjM2UASjXSX111cYO4S6zglkfCLYiLkknpDWfTuqHVLMZ7iP2ro6fg04
	A4QDq2AUXj/1vet07fr02/MOo+9B3a0=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-57-gIuSUAMgPYG7Rcd82GkVFQ-1; Wed, 25 Jun 2025 17:48:38 -0400
X-MC-Unique: gIuSUAMgPYG7Rcd82GkVFQ-1
X-Mimecast-MFC-AGG-ID: gIuSUAMgPYG7Rcd82GkVFQ_1750888118
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d400a4d4f2so55407985a.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 14:48:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750888118; x=1751492918;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yf7LN45AXmV/wr0eUVyPBaPat33AzTTVr9f1fotPlKU=;
        b=FcRkzPrIZFNjTTcAwDiPGQ68/398ryMnK/Ae6O4Nm5YeKBzQYmNgOwWSoza86NTIZN
         ICj5M2N0XCQ7Frp4lbS6y/CO+p6ZBYsEXPwUHewP12kE6Zvg9IaoXJnkZZFVc+v2P4JI
         QU02FnXlKXkiOjDqzkX8SXflCJ93wAF16Cw86bnBfjfhPcb0Ylj6in4MXYdr0MJs8id+
         1j/Tw2pTfgoP+zAVj0ZYibyKQf+ayWkhL8u05gpid8eNkgpWgX/4FVyeIZDbEkdmvMZi
         L9My4W8F24sk/6VKGGWdLK7nM0IPYQzJv75GA9S6HVczXZv8lxt6v2jZNFHoqYIZdbXC
         Zzag==
X-Forwarded-Encrypted: i=1; AJvYcCU5SnaLa+yprM/dj9T5+UZbYTMgNMdPWqfdjPNQYv52bmXtRb9FMffd6PJWgpQZOWhgm4ls7K2fR26J118=@vger.kernel.org
X-Gm-Message-State: AOJu0YxK+5VLeoPAY6l8MLCzPIfw1XOaOUuHUOgV2isiZ2SNUISAvZqa
	XfmywTYceS/nSm4W7jkQi5n066qck4YzRB+SLsXkpz6Fhr0xhJNxNV0+0UXcd/pxEs5K7UUPkGY
	+P32HWEkUQVz+56SyiHW+RlzFh3MqWkI1FxUUqVXcLsvW7+1Z2T3QHWfrFShl8Khu+w==
X-Gm-Gg: ASbGncuNfGFB2XrpB5NsPLzEIqGfwfjIJcR9oPRJzuiK50yWVjLB6P2X5Zd6Q8KvehW
	PRJT5hGUGOqBtfBowIoNMq4hWJE/q4j8cyx01s3AScI7wZnysU+9Hah5K/JRI1D58qyYHPiJwDT
	RZArp37mzUeIP5xGy0Qhex5k1OHHnh5OrN9T9AjMUY+H9voD6/qWceCLaNGoaU12FkiOnafvyb5
	nRNjVZ66nZtjS6XaHt/m4lx4Zg1pZYDNoKri3YYDTziYJA0AACpok0aEvvajXIYd7iHTIkotJsj
	Jgm0yisN2ELKFUZnSDQw2wWPbyKwA2zPP51IXZO1ZXxemkatr7I9Hw==
X-Received: by 2002:a05:620a:2721:b0:7d3:abb5:b57d with SMTP id af79cd13be357-7d429738d95mr576421785a.28.1750888117616;
        Wed, 25 Jun 2025 14:48:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEsLCB6jZfeylnPbGC4ONnPG6FgPUPsCN7asxvidsIyT3qk0W5gzp71Re109/DyqgsCAMiPPA==
X-Received: by 2002:a05:620a:2721:b0:7d3:abb5:b57d with SMTP id af79cd13be357-7d429738d95mr576418985a.28.1750888117188;
        Wed, 25 Jun 2025 14:48:37 -0700 (PDT)
Received: from crwood-thinkpadp16vgen1.minnmso.csb ([2601:447:c680:2b50:ee6f:85c2:7e3e:ee98])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd772fcabdsm162736d6.85.2025.06.25.14.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 14:48:36 -0700 (PDT)
Message-ID: <d2e98b4d7f76534c68c1a0cc30fdd61b109cbd3c.camel@redhat.com>
Subject: Re: [PATCH v5] sched: do not call __put_task_struct() on rt if
 pi_blocked_on is set
From: Crystal Wood <crwood@redhat.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, "Luis Claudio R.
 Goncalves" <lgoncalv@redhat.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Clark Williams
 <clrkwllms@kernel.org>,  Steven Rostedt <rostedt@goodmis.org>, Tejun Heo
 <tj@kernel.org>, David Vernet <dvernet@meta.com>, Barret Rhoden	
 <brho@google.com>, Josh Don <joshdon@google.com>,
 linux-kernel@vger.kernel.org, 	linux-rt-devel@lists.linux.dev, Juri Lelli
 <juri.lelli@redhat.com>, Ben Segall	 <bsegall@google.com>, Dietmar Eggemann
 <dietmar.eggemann@arm.com>, Ingo Molnar	 <mingo@redhat.com>, Mel Gorman
 <mgorman@suse.de>, Valentin Schneider	 <vschneid@redhat.com>, Vincent
 Guittot <vincent.guittot@linaro.org>, Thomas Gleixner <tglx@linutronix.de>,
 Wander Lairson Costa <wander@redhat.com>
Date: Wed, 25 Jun 2025 16:48:35 -0500
In-Reply-To: <20250618070350.19JbjFnG@linutronix.de>
References: <aFF1BKtdQCnuYMaS@uudg.org>
	 <20250618070350.19JbjFnG@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 (3.56.1-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2025-06-18 at 09:03 +0200, Sebastian Andrzej Siewior wrote:
> On 2025-06-17 11:00:36 [-0300], Luis Claudio R. Goncalves wrote:
> > With PREEMPT_RT enabled, some of the calls to put_task_struct() coming
> > from rt_mutex_adjust_prio_chain() could happen in preemptible context a=
nd
> > with a mutex enqueued. That could lead to this sequence:
> >=20
> >         rt_mutex_adjust_prio_chain()
> >           put_task_struct()
> >             __put_task_struct()
> >               sched_ext_free()
> >                 spin_lock_irqsave()
> >                   rtlock_lock() --->  TRIGGERS
> >                                       lockdep_assert(!current->pi_block=
ed_on);
>=20
> Maybe with the addition of
>=20
> > The first case was observed with sched_ext_free().=20
> > Crystal Wood was able to reproduce the problem to __put_task_struct()
> > being called during rt_mutex_adjust_prio_chain().
>=20
> The first sentence will imply a Fixes: with the introduction of
> sched_ext. The second implies that the original fix was not complete and
> nobody managed to trigger it until now.

sched_ext_free() just happens to be the first cleanup function called,
so that's where the blowup happens.  I think the "nobody managed to
trigger it" was because we didn't have the pi_blocked_on assert until
recently -- and my "other cases with a similar cause" was probably older
kernels with the assert backported, but not sched_ext, so the backtrace
was different.

-Crystal

