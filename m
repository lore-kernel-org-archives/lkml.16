Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B09119924E
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 16:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745598134; cv=none; b=q/AZ5QXsDR6q9lLzdZA9cj6gPuKySKCPKKr8vrblRm9UiPd+5XLB4EDL7E4d8yBBL4QmXbMoa5nDbMMk1ZgJAEsMBhemh3/4/a1Lal9CWsSrKRA4rMhoNzrQWTYHNL+KrqgohgUwtuzBkY1cmpHdUcnTa3t4kfE8Z5Tu+iM9sJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745598134; c=relaxed/simple;
	bh=1ObMrZiDe3zEDrXNDN74s0lsh5e4V+lpJdUAg8w6iBw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kqAmOORxxRtH+oZr6lPKReO2kipZmGA7r5EJJdbCvBV/OJnr3BRCnd8H/zAdM/sxaN+oP/xIHkJBaxDBf58D7HbPlBxM3cDK1cy1ZJQqxDm4OhGKmMbUxtLlrQc7vgKe97qEEvai2HSDqePVzkNTb6+BqU2wSWJYT6mWwz6p600=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dXkqt4zc; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dXkqt4zc"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-477282401b3so30171901cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 09:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745598132; x=1746202932; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k6W/KvW/2TTSoEkfJQ1yfAk2KpkWQxv63StEJEdITvM=;
        b=dXkqt4zc+gDFr3uJdgSTrPt7x2jW38tXM4noo691XdpaIeeGtaNRDT5iJAOCqcGslB
         8IPqoO2TyaJ30jAdgmDv+tncOmC7gH1btDluwr2m465RejDVVJ+NVKntVuKd3AFJU5wJ
         O6JIj/AVmPuuR1KVb9cpq7TNA1oLcTQa17Fku1r0gDKwXkVm6GL5/sinPVk6vLKxUMq9
         Gl9oAGaAfsgf5NHmmhU/AdeoDKPouPUXQc8ykMNTVYEDsXjCSBa1aZR356my7O2LgRm/
         OjTlxtEUARFkok06wP1cFclD11pvyQaZ2d1Ez5e/avN7mOs7UitU9TAdSIzN0iHQHdvO
         0ziA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745598132; x=1746202932;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k6W/KvW/2TTSoEkfJQ1yfAk2KpkWQxv63StEJEdITvM=;
        b=shK80NfPd9lKg3nWAxVN+i51bs1SwHQtyqMElgKd0oD5zREM4mb4AUSKC89+cd+Qez
         A8wkQLvGa2/rGrIpeQpJMrteohUvTLFfr0uIyAZbQBJXJKYE4lNCz47CeZUEmlDUAOIU
         pMITN+E/2mfltVg9rM/YXnXDWEdykm+a++TTXE5jjAwPgK8RZBEK5YoAaCeIRSZZU6yQ
         D4vKwOLoxmA2/8/RI8d7xIQX7i/zI6Tu5xLZ2cQize+IBzZoLAuYdRIQ9YR1mUWpcuwL
         ZJkD1IyexLhK7Nx8ZH69yov2xeLOnub0pRW7u3sSUM0PRzpyFwl8k+E4GI7L6aBxxAnm
         dqwQ==
X-Forwarded-Encrypted: i=1; AJvYcCVnYFvfbhyOX8NNis0fwL+XsPUGafkJ1IK9Z4DLrIUiykIBKB82kZdc4UYBOB0/piSfzur3dUwSjrTrppA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZ0L/W5Hh8lv+VXlec+LJioqM1MOi9at84A1Lt7kAHA4ev45Lh
	LLji2NtrINNDGuIXiuPSQSRijdrbhxar7jEOgz2OSYoq2K9fkfJhHbIQLOOyO59rSEThEB7IRVV
	U6agnOIlVvgkkjw2ZuVNvOvpiU0ts3/zteo+LyFfPr1s0MDhWrw==
X-Gm-Gg: ASbGncvDeLaA6CKCAxj+inpllI2ZWBScLeiWHwQwkqWZeEckOiLOBH2ziM99E0kUz7K
	G5Vq4RDicc2OBfvmfZP6fHr/Aro/3FgUmgskNPvyVawGkLEvKhlY9J1yRnuTwJtphhIlL5R0Scu
	aqwsXQ1jUZMRo4hqcouu0BWbwonJrCXn33m5D+GI1LKDFQD1JV8h+OcMeMoCcPoGNubg==
X-Google-Smtp-Source: AGHT+IGmtOaSGCmohhWDZJizmpkCtXy69Dm3bYdxy7WgTIKOWbBeZOLSwrzW87d+890D3/gFETSTDzSp+gq7RWoy7Do=
X-Received: by 2002:ac8:5f82:0:b0:47a:e803:d7f with SMTP id
 d75a77b69052e-4801c2c155bmr50318881cf.4.1745598131526; Fri, 25 Apr 2025
 09:22:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250423174634.3009657-1-edumazet@google.com> <CALOAHbDT=z4xYQq0WXqGzAQycNhaBdCfZDs5mB5Rvyx9iK4JbQ@mail.gmail.com>
 <CANn89iLuGSZFrhfQGMRo579CCv4Cie9Vq3SNkcvYM9XPjmzccA@mail.gmail.com> <CALOAHbDhPhuGK-Hd1SCN=5fx1ZEFXQnoubncvjwHw=+MHOBDPA@mail.gmail.com>
In-Reply-To: <CALOAHbDhPhuGK-Hd1SCN=5fx1ZEFXQnoubncvjwHw=+MHOBDPA@mail.gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Fri, 25 Apr 2025 09:22:00 -0700
X-Gm-Features: ATxdqUHxdFiEOR7-eyfGQ5JW12e8releTC-EpTD6ZsohRgjP1eT8HECx1Ufm0T8
Message-ID: <CANn89iL1nEjveUUBz5Kyr4rPaUhy+WO4FViAa_5fv0LvvKFjmg@mail.gmail.com>
Subject: Re: [PATCH] sched/fair: reduce false sharing on sched_balance_running
To: Yafang Shao <laoar.shao@gmail.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, linux-kernel <linux-kernel@vger.kernel.org>, 
	Eric Dumazet <eric.dumazet@gmail.com>, Sean Christopherson <seanjc@google.com>, 
	Josh Don <joshdon@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 24, 2025 at 7:29=E2=80=AFPM Yafang Shao <laoar.shao@gmail.com> =
wrote:
>
> On Thu, Apr 24, 2025 at 11:50=E2=80=AFPM Eric Dumazet <edumazet@google.co=
m> wrote:
> >
> > On Thu, Apr 24, 2025 at 7:46=E2=80=AFAM Yafang Shao <laoar.shao@gmail.c=
om> wrote:
> > >
> > > On Thu, Apr 24, 2025 at 1:46=E2=80=AFAM Eric Dumazet <edumazet@google=
.com> wrote:
> > > >
> > > > rebalance_domains() can attempt to change sched_balance_running
> > > > more than 350,000 times per second on our servers.
> > > >
> > > > If sched_clock_irqtime and sched_balance_running share the
> > > > same cache line, we see a very high cost on hosts with 480 threads
> > > > dealing with many interrupts.
> > >
> > > CONFIG_IRQ_TIME_ACCOUNTING is enabled on your systems, right?
> > > Have you observed any impact on task CPU utilization measurements due
> > > to this configuration? [0]
> > >
> > > If cache misses on sched_clock_irqtime are indeed the bottleneck,  wh=
y
> > > not align it to improve performance?
> >
> > "Align it" meaning what exactly ?
>
> Such as :
>
> static __cacheline_aligned_in_smp int sched_clock_irqtime;

Please look at __read_mostly attribute instead.

Thanks.


>
> > Once sched_clock_irqtime is in a
> > read-mostly location everything is fine.
> >
> > The main bottleneck is the false sharing on these Intel 6980P cpus...
> >
> > On a dual socket system, this false sharing is using something like 4%
> > of the total memory bandwidth,
> > and causes apparent high costs on other parts of the kernel.
> >
> > >
> > > [0]. https://lore.kernel.org/all/20250103022409.2544-1-laoar.shao@gma=
il.com/
> >
> > What part should I look at, and how is this related to my patch ?
>
> Unrelated to your patch. Please ignore it if you haven't seen this issue.
>
> --
> Regards
> Yafang
