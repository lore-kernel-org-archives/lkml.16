Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A1A44A11
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 10:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745664222; cv=none; b=KhyY6HfGuylNOI6DoZFt6Zqq+7Bjq9DUrtEE5hNKnT1XlrzWdKVQ8vhdpxjO3phiMtzIbN17yEPWpzUe01JsplDgffx+6xf2aD6huoZLvkeTKWnMCBFs4TvxfuyEjjXtFpV2EXf7aw08eUws1dS6rLIIkK6sUk300W8ziBZ5dSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745664222; c=relaxed/simple;
	bh=cNp/R100/igNuZzRN0vHwbTm2peZdaiXvgP6GfO+beA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=txKKCE8mVOsT2muLC0VdQJzxDHSwNch6gKs7K1YIGNilp4wopNwwvspFm0BUWGrkmgHz96nkyNY45JiHsbOufm8w7skEaVNA3NxsU5x/Or/MW36YYsn8t3SncBZfErnIuRqkQieYN5CCt5aPqrR03vHzQPEp3R4ub/Mcrz12LQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hGgssctE; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hGgssctE"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6ecf0e07954so47149066d6.1
        for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 03:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745664220; x=1746269020; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rER2AkRSqzRpgOhS0mZhLy/hzHRuIm8mQBDcnN8tjmo=;
        b=hGgssctEgzyah6cFp95B9W4qv6O+5KnZHgo3rzBiNU+XucX4e9I4oU3KaFYu/FgA7R
         Xf6FQ/TElO3NP7FaxilTIma5AHBfRuz87NaKXMn5cZfk74uGtyQElWJoaessOUfrcoQB
         /0ZdUBrl5psqtVR/MfgW6kvkaMq99weNHs9gXj6CsBquFBTukRumIQ2O/TqghxEIS/S5
         SgRv/7gsonHnkuDCPqbzEYfNatomZCdq4EJRr18ay3BpKUroljKg8RSD9oFHiMqqxEyL
         jZ1VtNJEahIWHsqxv1aFQtzhWrb0Tho9HeZ39RgRpL5WswwocIhnzVVldtb6CbUMj0Xs
         8u4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745664220; x=1746269020;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rER2AkRSqzRpgOhS0mZhLy/hzHRuIm8mQBDcnN8tjmo=;
        b=udYlsZTLp4noGWZVB5Io7Xi1vnjk9t4rIzcCBdK2iIPmnilh+8gM+Ozp8BcpmSNM9C
         QxHepAxIUaQ1ZNH9T9pooY3XfAVGprLtgZ03nffTCawIAKTqnqMCc6J98G376yerHMCh
         d7HQ0VbaNrRfbwnVzK6HwB0bDYB7oA0tsEDkRg8NHKbKtXI5VMeDa8fXbTaEabU2mDeb
         aXzinYJxXnke7gGtYvCcCJV/1V6D8QmhfUbdURVbb0PR5vDsfbIpHcxTaU1ztW13lyA1
         yNF9pWXJgfOG2vjM7r2O8OWpR5nEc1vztr3kcDkvfq3Rk7H5BCmdy0BFul5gyePdTNuA
         aW7A==
X-Forwarded-Encrypted: i=1; AJvYcCXp9gnHVNDBh+2qLz7gxc2MF8008BMFuHdCSe8QZYPCsEdPly1WQ4ufykRGaXiP3/P76QSdui7nEslCwig=@vger.kernel.org
X-Gm-Message-State: AOJu0YysOrhbdY/zFAZC1KaEvU3RC1poi99qCGCA0rTUUFAiHG4ULKhm
	Uacx/qH1Eu91qS1K6sAO4iFkmvBWdirfnSiCfMQbgu5N5NHqRS9U8cOlhfU9vuYJsSYsSPExGeM
	bj9QVws0auVLDeH8ERxJGzSgyf9s=
X-Gm-Gg: ASbGncvbtlo1nHq0JQS7PReHOlZKtAaCTIpfD8o9KSt0dRBLyjq7SlZGiccAAVkDB4N
	Z8dhTOzsP5Aj1Utk16qYNW0a+2fcUkzAAZ2rROgzqOW0Q/nVWbgVkfWRkb84WDHwc4aAic6sdHp
	AmlhFiDr/0jz+hcdUcPKT0YE8=
X-Google-Smtp-Source: AGHT+IF+QblcyHVzgvIj5gWWrf0vhYNdR2oPFdlQYBNBBnhMCsw4gwA8YR82/t2UEITuo62/vPsPZFas8LKLtzv6Y5c=
X-Received: by 2002:a05:6214:f0f:b0:6e8:ff2a:a658 with SMTP id
 6a1803df08f44-6f4d1eee27amr39162516d6.5.1745664219993; Sat, 26 Apr 2025
 03:43:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250423174634.3009657-1-edumazet@google.com> <CALOAHbDT=z4xYQq0WXqGzAQycNhaBdCfZDs5mB5Rvyx9iK4JbQ@mail.gmail.com>
 <CANn89iLuGSZFrhfQGMRo579CCv4Cie9Vq3SNkcvYM9XPjmzccA@mail.gmail.com>
 <CALOAHbDhPhuGK-Hd1SCN=5fx1ZEFXQnoubncvjwHw=+MHOBDPA@mail.gmail.com> <CANn89iL1nEjveUUBz5Kyr4rPaUhy+WO4FViAa_5fv0LvvKFjmg@mail.gmail.com>
In-Reply-To: <CANn89iL1nEjveUUBz5Kyr4rPaUhy+WO4FViAa_5fv0LvvKFjmg@mail.gmail.com>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Sat, 26 Apr 2025 18:43:03 +0800
X-Gm-Features: ATxdqUE1zPf0Ncr8M2szYQDCoc1MMam9l9omEozT91sKR1DzmTJAz9EHmceQF_w
Message-ID: <CALOAHbDV9p0nbyjwKQWrNyDbGt2xnYVcn6RA7TNFcp-TBz9gAw@mail.gmail.com>
Subject: Re: [PATCH] sched/fair: reduce false sharing on sched_balance_running
To: Eric Dumazet <edumazet@google.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, linux-kernel <linux-kernel@vger.kernel.org>, 
	Eric Dumazet <eric.dumazet@gmail.com>, Sean Christopherson <seanjc@google.com>, 
	Josh Don <joshdon@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 26, 2025 at 12:22=E2=80=AFAM Eric Dumazet <edumazet@google.com>=
 wrote:
>
> On Thu, Apr 24, 2025 at 7:29=E2=80=AFPM Yafang Shao <laoar.shao@gmail.com=
> wrote:
> >
> > On Thu, Apr 24, 2025 at 11:50=E2=80=AFPM Eric Dumazet <edumazet@google.=
com> wrote:
> > >
> > > On Thu, Apr 24, 2025 at 7:46=E2=80=AFAM Yafang Shao <laoar.shao@gmail=
.com> wrote:
> > > >
> > > > On Thu, Apr 24, 2025 at 1:46=E2=80=AFAM Eric Dumazet <edumazet@goog=
le.com> wrote:
> > > > >
> > > > > rebalance_domains() can attempt to change sched_balance_running
> > > > > more than 350,000 times per second on our servers.
> > > > >
> > > > > If sched_clock_irqtime and sched_balance_running share the
> > > > > same cache line, we see a very high cost on hosts with 480 thread=
s
> > > > > dealing with many interrupts.
> > > >
> > > > CONFIG_IRQ_TIME_ACCOUNTING is enabled on your systems, right?
> > > > Have you observed any impact on task CPU utilization measurements d=
ue
> > > > to this configuration? [0]
> > > >
> > > > If cache misses on sched_clock_irqtime are indeed the bottleneck,  =
why
> > > > not align it to improve performance?
> > >
> > > "Align it" meaning what exactly ?
> >
> > Such as :
> >
> > static __cacheline_aligned_in_smp int sched_clock_irqtime;
>
> Please look at __read_mostly attribute instead.

Right, sched_clock_irqtime is only modified when the TSC becomes
unstable, so it makes sense to annotate it as __read_mostly. So why
not do it?

--=20
Regards
Yafang
