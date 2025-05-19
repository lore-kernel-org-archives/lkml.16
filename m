Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2AFC1F192B
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 11:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747653188; cv=none; b=nKO4zl65V1KsGytU/e71hiQXcNwMxnPccAGJxFh04IaPOfEWoXyLiB8+7mCv/gJr7QShLS4oEnHAkZGVREURWCSm1dNn92FqpLVO5szhbChGKJAymsmNE89lOIopKtKjYm/8kgW4e7hHt51qFYXiMmpaK7qNTkK0rCewYxcSGKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747653188; c=relaxed/simple;
	bh=DCKF63iu0pGudmkdG40qCgwziuKIwizm7AxjHXa0NVE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dPgp4RWVYb//Wj4nE9rcos7zy9AGng2LT/tZf+7P8e8GPkl7zoIV+AnQhHY1c6BBaa10Y0iLczoB/GAk3dCswvU17mGevidw2D5rDT0qdV+bMDxyw5Z7pkksaIKGT5roam3ywsV4qchEdfi5pEaV6kkeDJGyAsVNEzXfRwJFM6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=da/l4ii3; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="da/l4ii3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747653185;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=DCKF63iu0pGudmkdG40qCgwziuKIwizm7AxjHXa0NVE=;
	b=da/l4ii3RPSr9pQ3uGx8vYt/JR9HINdX9OZB9cscafMXgdqtaR+IMCR0YYC4AhvDBS8Pke
	GnK59NPkvgOZ03JXS4oI5VsxbsINCFltrUpUfbXlYqlrjzkWgeNaLCxGD7lEvpOx8FwWUC
	kQSJa3i5jInOD9zpgOyH3rBLW/BpHjc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-538-4oOYmW3aP6CF4_ic4R-AFw-1; Mon, 19 May 2025 07:13:04 -0400
X-MC-Unique: 4oOYmW3aP6CF4_ic4R-AFw-1
X-Mimecast-MFC-AGG-ID: 4oOYmW3aP6CF4_ic4R-AFw_1747653183
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a370309e5cso529905f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 04:13:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747653183; x=1748257983;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DCKF63iu0pGudmkdG40qCgwziuKIwizm7AxjHXa0NVE=;
        b=u4WCCRXUbXEri/gozVGeX4FdE583wHGdV5+c5WihUzwbM3WsSHhUL++2mzSv+X/dsh
         Rqzl4xWxAIwSvWMYcW41Ted1hoMs25MjiBMvkH4QTh2RNH9T0LmBk9DLwralPIDvIS29
         zGYP0mEtAydYEuG3PzRXphGTPEQY1n4bmedRmedpHUIfmNo96SPV83eVSdVThk3M1oD6
         PwauAljrhWODMX7ChxX0hlGGXHGdo1UlqOTGGaZMcv8wcyAu00THxso/65TXGOwEFQdf
         QfoFgwT/5ym6Oiupu3iYNcP9/urM0zN+PKk1RlQOvVRn8tSGd7WbPotS+N7xsP+eTV0H
         bc1A==
X-Gm-Message-State: AOJu0Yz2YRCMwYgmedSuAegKoTDBZUqbLGcgfU3Jwgg0hrkux4jj3KI9
	I89lPt8zhaWoNXISX3jb9pSVbMXAnn96dTqCMDGlw/7VPuPS741yvW/1enGQXJcRryK/MmrvgOD
	8cHrAhToHmbJSIKOjoPE9lxaWBquiy10Pffq20M/g2gTTLoEbxa82cGrCVu344L19C9Kas2Rwma
	P6
X-Gm-Gg: ASbGncuPmnKhIxz7g4lKlf7aF41ScGo3hvv6R1j0UWd5Ze1NMZNMUSLHT418+y53H09
	BRv557BbgH3nZgvqN6IG3Usem1XD7/R1jHbsmM9HKz8OaePWwPF2WasNT6ej0zm6CeaQ77qSJpP
	L3s0mLZfXsK/AlaKfZuoTvkK/o1NHXtqbD0lVL9w7jILfk5YrqgrQZiQsnpGSPBMJ3Ey+L1Sqjx
	afzM+a1OzYxomyoF0ZogBBAK3UE9ZQZVeYid6TTo8W9v6hUX4JFqgTQa5aM8OZpmxPvz7fLETyY
	ebwUXinXOWW6DaRhK8mDTZhAf+ZwsI8TiTEYBg==
X-Received: by 2002:a05:6000:2903:b0:3a3:6e62:d8d5 with SMTP id ffacd0b85a97d-3a36e62d9afmr2332052f8f.58.1747653183456;
        Mon, 19 May 2025 04:13:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE9Iuo8kXD+gvDqxqBtm1OeVaC0L/hH9pdiyf5/pkWIDfxmGlLCkMONmsKceQDlarbpH5rRoA==
X-Received: by 2002:a05:6000:2903:b0:3a3:6e62:d8d5 with SMTP id ffacd0b85a97d-3a36e62d9afmr2332030f8f.58.1747653183114;
        Mon, 19 May 2025 04:13:03 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([185.107.56.42])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f33804d9sm206932425e9.12.2025.05.19.04.13.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 04:13:02 -0700 (PDT)
Message-ID: <cdcab46480cbfe2c3320e060ea9603adbd04956c.camel@redhat.com>
Subject: Re: [RFC PATCH v2 10/12] rv: Retry when da monitor detects race
 conditions
From: Gabriele Monaco <gmonaco@redhat.com>
To: Nam Cao <namcao@linutronix.de>
Cc: linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>, 
	linux-trace-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, Peter
 Zijlstra <peterz@infradead.org>, Tomas Glozar <tglozar@redhat.com>, Juri
 Lelli <jlelli@redhat.com>
Date: Mon, 19 May 2025 13:13:01 +0200
In-Reply-To: <20250519103809.nuEUQbVl@linutronix.de>
References: <20250514084314.57976-1-gmonaco@redhat.com>
	 <20250514084314.57976-11-gmonaco@redhat.com>
	 <20250519090626.zjiYgUGW@linutronix.de>
	 <5f1365f2cd84597fd3547544fcceab5c79682624.camel@redhat.com>
	 <20250519103809.nuEUQbVl@linutronix.de>
Autocrypt: addr=gmonaco@redhat.com; prefer-encrypt=mutual;
 keydata=mDMEZuK5YxYJKwYBBAHaRw8BAQdAmJ3dM9Sz6/Hodu33Qrf8QH2bNeNbOikqYtxWFLVm0
 1a0JEdhYnJpZWxlIE1vbmFjbyA8Z21vbmFjb0ByZWRoYXQuY29tPoiZBBMWCgBBFiEEysoR+AuB3R
 Zwp6j270psSVh4TfIFAmbiuWMCGwMFCQWjmoAFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgk
 Q70psSVh4TfJzZgD/TXjnqCyqaZH/Y2w+YVbvm93WX2eqBqiVZ6VEjTuGNs8A/iPrKbzdWC7AicnK
 xyhmqeUWOzFx5P43S1E1dhsrLWgP
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 (3.56.1-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0



On Mon, 2025-05-19 at 12:38 +0200, Nam Cao wrote:
> On Mon, May 19, 2025 at 12:28:12PM +0200, Gabriele Monaco wrote:
> > Mmh, although definitely unlikely, I'm thinking of a case in which
> > the
> > event starts on one CPU and at the same time we see events in IRQ
> > and=20
> > on another CPU, let's say continuously. Nothing forbids that
> > between
> > any two consecutive try_cmpxchg another CPU/context changes the
> > next
> > state (making the local try_cmpxchg fail).
> > In practice I've never seen it going on the second iteration, as
> > the
> > critical section is really tiny, but I'm not sure we can guarantee
> > this
> > never happens.
> > Or am I missing something?
>=20
> I have a feeling that you missed my point. I agree that the retrying
> is
> needed, because we may race with another.
>=20
> What I am proposing is that we drop the MAX_DA_RETRY_RACING_EVENTS,
> and
> just keep retrying until we succeed.
>=20
> And that's safe to do, because the maximum number of retries is the
> number
> of tasks contending with us to set the monitor's state. So we know we
> won't
> be retrying for long.

I get this point, what I mean is: can we really guarantee the number of
contending tasks (or contexts) is finite?
In other words, the try_cmpxchg guarantees 1 and only 1 actor wins
every time, but cannot guarantee all actors will eventually win, an
actor /could/ be hanging there forever.

This handler is running for each event in the monitor and tracepoint
handlers can be interrupted as well as run in interrupt context (where
of course they cannot be interrupted). I don't think the number of
actors is bounded by the number of CPUs.
I see this situation is extremely unlikely, but in an exotic scenario
where a CPU is sufficiently slower than others (e.g. in a VM) I believe
we can see this critical section large enough for this to potentially
happen.

I'm not quite afraid of infinite loops, but rather RV introducing
unbounded latency very hard to track and without any reporting.
Chances are, since tracepoints and actual traced events are not atomic,
that by the time this delayed context /wins/ the RV event is no longer
current, so we may see an error already.

Does it make sense to you or am I making it more complex than it should
be?

Thanks,
Gabriele

