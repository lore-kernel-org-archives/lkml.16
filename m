Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AEA31EEA4A
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 07:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746431736; cv=none; b=bmV5pFfqRo57IfoVVgm0trBU3zGWGMWjXknB38m97tmUZhn9lmef2EGKXudw1rOyocoRSKEIc597bgAYFBkXfHbL3ySSyh43jLdH1nA7qVGkvCMAxyEq/KuG7o+RaBLd7nCPLCTOo+Uw6V4af6GmDrtIlzD+j9yNqDoLAY8c9Tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746431736; c=relaxed/simple;
	bh=tSM9zjrMLPYFddFOM4frVNQIa6dWdkrsxSEuL+ovB/4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=baQmmJQtmz4gm6hlEMlUfgu0b59YhphSTaXsfBBfs0Gh1seEWr2Qu4ZKMRqfiVWx9iG37VdEmk/OCvoLm1Z4WqRwt8VRnM08d/yzLdv4Us9dCPI1qUe5EEDhuuDcLBg4SKoPU0T0mDFaS3fdoxpqGZCzeWYFy8CdnbsyvSoDOnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=C6SHk7qR; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="C6SHk7qR"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-30ddad694c1so42947221fa.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 00:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1746431732; x=1747036532; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4XtWPQQLC9H8lML055rwtAZVe2O8s89kuxM+VVVpc48=;
        b=C6SHk7qRKfgjZUxbc8LykA1dRQ/r9OwOoPtEoQdh9Gvt7/OT6S40efvLbBoe7rUrTS
         ZFiwtnpMU03W8eykNshWN5KM/66PJtj8Q8CuIYmnPnuQ6rke6CKVdpizso9IXZwUqnjm
         csq9vmpC43P9q0TAsjaq9t2qu3rbr5/S8Mnj4cVCxj2QPjNlKUWlaymK4WzbBfwceAGz
         0AEEYqpq5NQzA4hW3efDPRN4ZMtGxOl2Zgfz/5b1xV/WNGHA9UmxRt2gEiYKK+SjJKTC
         qUFSqZGAfrTv2HQUDT5DlhrQOcW9NqKZayNdfeyDPeow++6DjuYs1266A5GmmjfJFahL
         XPzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746431732; x=1747036532;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4XtWPQQLC9H8lML055rwtAZVe2O8s89kuxM+VVVpc48=;
        b=Z8xNMJtsXBW182aeDd9FwE1yIEJC5Ug+iyxkm/ZreykAGgx/sJm9a1Ny5JiJ2GCAzP
         qC7iWRfxQW6nHgJd4KTJRvbH3YoLT6oeqPR8VKEhyDbHxkuFXK8JRGoHbyHgzafzjYDG
         Ir/cg593l3gEspEsxM9GQ0Hc3UBUqBCRPlAKPbaq56Tw6rrqrTYLbdp3rL637Cuq+qjP
         V85eLDJL099149AQwPNYG6ifzv8HzmSQf0rFhIHo7i3yK1Wa1z6xk1ex0CX+1Udk69YR
         5ZMyvKzaz8DHCPjUtU9TaWy8dK6Lh9wQLTC/b8mcI2D5O6Dlek1GNX0ikGRmjtCXfQIv
         XBlg==
X-Gm-Message-State: AOJu0Yy9TPv1BygDYO7ZdxzhlAIkSB88KutkV4yNZ1jPLPEfWZoDSfWJ
	ycT6RjyFB27EZ49e7wfP+8zybXxNI5aQxX8eRHN6tlcVePwTTsfJ7uqSr9o1ydfV7WD5i2I+FIz
	BuyPBe2wZE80YgWovvSJoT6aW6TL0Yr/iPlZMsw==
X-Gm-Gg: ASbGncvo0HZ05huM5jmzrWkgtbqm8R+If0+sjQapXuED7hIqIgiuAq6KHVW/G85HJar
	/4wDqvrrdpv0gMOQ8mTsuf3Bp5MzfabSJKd7kpNZYnSgHsVLamK5eOdyaahcxZRV9KGnt0hGB4z
	Tub0Yd4vcqSmSPGHgPWUFWMmCMcG51fqBVte9qyzYxwuhlJvYaqefXoXQ=
X-Google-Smtp-Source: AGHT+IGc95i9QlJuSQdLN1UgbTtHPeUdEdZBby3Q19cdVHY/6hz24g/KqJmhGKmd3pBwiypPjCy84FjDqDzVffJechk=
X-Received: by 2002:a05:651c:1501:b0:310:8258:c0b4 with SMTP id
 38308e7fff4ca-3235210fedemr16444281fa.31.1746431732222; Mon, 05 May 2025
 00:55:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250503082834.49413-1-marco.crivellari@suse.com> <20250505065121.dlEw6_SC@linutronix.de>
In-Reply-To: <20250505065121.dlEw6_SC@linutronix.de>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Mon, 5 May 2025 09:55:20 +0200
X-Gm-Features: ATxdqUFtsQPfFkK2LoAcsnruk4pQLCcPiy7Wh5u_1A2L5n3HJ0ZgVPpXaq2oeNg
Message-ID: <CAAofZF7HTTGOz-+UyJq-BMLui6eaW7vnTATb3aFUbacTGGO2UQ@mail.gmail.com>
Subject: Re: [PATCH 0/4] Workqueue: rename system workqueue and add WQ_PERCPU
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-kernel@vger.kernel.org, Tejun Heo <tj@kernel.org>, 
	Lai Jiangshan <jiangshanlai@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Frederic Weisbecker <frederic@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

> I assume the huge patches were made with coccinelle?

Yes, the majority of P4 at least. Considering my lack of experience with
Coccinelle I made just the big parts with it, then I just "grepped" for the
rest (well, I used LazyVim and its "search and replace").

P 1-2: only with the "search and replace" of LazyVim.

Thanks!



On Mon, May 5, 2025 at 8:51=E2=80=AFAM Sebastian Andrzej Siewior
<bigeasy@linutronix.de> wrote:
>
> On 2025-05-03 10:28:30 [+0200], Marco Crivellari wrote:
> > Hi!
> Hi,
>
> > This series is the follow up of the discussion from:
> >       "workqueue: Always use wq_select_unbound_cpu() for WORK_CPU_UNBOU=
ND."
> >       https://lore.kernel.org/all/20250221112003.1dSuoGyc@linutronix.de=
/
> >
> > 1)  [P 1-2] system workqueue rename:
> >
> >       system_wq is a per-CPU workqueue, but his name is not clear.
> >       system_unbound_wq is to be used when locality is not required.
> >
> >       system_wq renamed in system_percpu_wq, while system_unbound_wq
> >       became system_dfl_wq.
> >
> > 2)  [P 3] Introduction of WQ_PERCPU.
> >
> >       This patch adds a new WQ_PERCPU flag to explicitly request the le=
gacy
> >       per-CPU behavior. WQ_UNBOUND will be removed once the migration i=
s
> >       complete.
> >
> >       Every alloc_workqueue() caller should use one among WQ_PERCPU or
> >       WQ_UNBOUND. This is actually enforced warning if both or none of =
them
> >       are present at the same time.
> >
> > 3)  [P 4] alloc_workqueue() callee should pass explicitly WQ_PERCPU.
> >
> >       This patch ensures that every caller that needs per-cpu workqueue
> >       will explicitly require it, using the WQ_PERCPU flag.
>
> Sounds like a plan.
> I assume the huge patches were made with coccinelle?
>
> Sebastian



--

Marco Crivellari

L3 Support Engineer, Technology & Product




marco.crivellari@suse.com
