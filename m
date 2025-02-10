Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72DAB16EB7C
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 16:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739206481; cv=none; b=StYb69WcQ1D6PYGQGUexr02SeRetQkwsKMARzOqGblGWJM8HSAsLLYiC7BOuvpxyNUUpYvp7wlVc88C/ig3ZVt1aYSuyseP55e5BEQRLF15UgKJM5zqKh7OvWtHaus4TuP0P+rEoHokpZD2mMwnzLYd6t05aQjqqGPWmc9gxy4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739206481; c=relaxed/simple;
	bh=YIXZngt6mHLs3oKbQq/htvRHCzXLTdi8jrxcnO9xG7c=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TPedmOIIGpaQ4cl0KMqCNGBSn+jBFq5Dr3zs3uY28dZqlRjKUtTiHspoCEtir/XE07cJ8HCEp17UWlO+8DgOE+iR1naNhDjysSlrXaDo7BO8qu8lGyXcU2N3JLWlAqrJxJsAx9CeoQz9MKRe3A+U/4AZNmuqrrJ6e+/Y7w+UyHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bFp5oUSm; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bFp5oUSm"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-38ddc36b81dso990046f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 08:54:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739206477; x=1739811277; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q2yZZUveCTr1MkL6I3E+3IakMbk/5xOji14C9WCtv7E=;
        b=bFp5oUSm+8hY1YRb5p3oVA9z36PVsp4nk0NzYADxQchKLfOsxtQnBNUq3Y94qu0JqR
         iar/wePN/2FsG/PGUXoaFe1L0irvZ2tizeuKO+3a+xMhJgbZl8NxcRjZCeTXrwA5QIS5
         0cSmFUIW6IpGMlwx6yANhSA+ID6Uo/HyYESKdPBtP1QHTrY2uUxr8doJrqMwBCRb/4XG
         Ih+PrvVfG6USQJ/ARMztY99mSJiVnUgbNd7eQXi5cwfOERtnqZLcgUZ8IeVKXvkqCuUd
         nlonybL8UQIHwGTD2NV/b/SQ8I2z+ekR1e0Hm9a12c0XWEqyErb5zG5s9bg/X9ZPXqRa
         wc5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739206477; x=1739811277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q2yZZUveCTr1MkL6I3E+3IakMbk/5xOji14C9WCtv7E=;
        b=mAFj2xFhUN5UxnfzU+WiNIvJCc67r8tHm7SB8nUtcFY/kgYxKqf2uL4hqV980s42ZD
         Rd7dZYL12AAE7NjTLBEDNc9uaMuTDSI4jdoQdPtgHpxBVkrfx/O/efbO7gfneCfxW49l
         t0+JPdy8HPIQSlxEPtdSRNSDz1C6PuK1DOrEl5JSkBseb9+l2xUgnIQeWBgCI2hm8TKT
         EEhyoBMDD8gHJLMxiXqQFrevvpI7ifW0xvcRklwrOejn9b8S3AwqeR5IML1a3JR7i7zZ
         IuLF9B+4s51/FhROlZiiMhEaUsk2+GIfIJs7IgTCow2rbH20gaFJxkEl1bFZfsx/1Q4v
         2NOA==
X-Forwarded-Encrypted: i=1; AJvYcCVTvQghg8A8hMXfX2Wl74ocWSrlBWswuc1UGWyvXn03H29EIEdkF2Ej4BNa8KhLdDgryi/YHbbp2iXHXVY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxm95YMPZYvOPCn50BECPlDK6vU9q22RqYq57JJE3MkoLdfuiXM
	xy/pkOL3gsS1DKWkAxyrhliZU6lgMVxp9m+CtuNwDNsT4KmABtEJ
X-Gm-Gg: ASbGncv2GdGCMe7bo4wIrHDRqA2P9S/EQAUC92BzF7ESFfhaay1lrcmPhiYFARUw/a7
	ypjS4dbXiPVU74McVsJRF1yJR49RTl3aa0mFuVLWuLs/7+/wWD2m9cPK0628kQ4P/F8lAmtvumJ
	Ut3MW16DKhpFq7s5Db5dD66aRgKNaRS4L+MjIi31OmVTVpYPXXKD+vjdQ4jN2dnGcSHpiucrDmJ
	KfGHG474LhnUWdecmaP5itpQetK5lsFDwKq58kzIwwgi2085ATpbIKZ1sqFU71xMWouNQ9lRngO
	wWCyPqKQFNRMmpTFcFXea0vDkfGhozgfYxEruvumpatPShWf+sXnfg==
X-Google-Smtp-Source: AGHT+IFiuQCj/bBrTu3yKMluw9A3dIFe+8x1BPy5NxFGwZG210FPeuN9yOd+gqM7YMlpuQt0ofY9jQ==
X-Received: by 2002:a05:6000:1a8e:b0:38d:dffc:c14f with SMTP id ffacd0b85a97d-38de438e616mr33176f8f.1.1739206477336;
        Mon, 10 Feb 2025 08:54:37 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43948698d56sm20939415e9.7.2025.02.10.08.54.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 08:54:36 -0800 (PST)
Date: Mon, 10 Feb 2025 16:54:34 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: John Stultz <jstultz@google.com>, LKML <linux-kernel@vger.kernel.org>,
 Anna-Maria Behnsen <anna-maria@linutronix.de>, Frederic Weisbecker
 <frederic@kernel.org>, Ingo Molnar <mingo@kernel.org>, Peter Zijlstra
 <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot
 <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel
 Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, Stephen
 Boyd <sboyd@kernel.org>, Yury Norov <yury.norov@gmail.com>, Bitao Hu
 <yaoma@linux.alibaba.com>, Andrew Morton <akpm@linux-foundation.org>,
 kernel-team@android.com, Saravana Kannan <saravanak@google.com>, Samuel Wu
 <wusamuel@google.com>, Qais Yousef <qyousef@google.com>
Subject: Re: [RFC][PATCH 0/3] DynamicHZ: Configuring the timer tick rate at
 boot time
Message-ID: <20250210165434.0d594c87@pumpkin>
In-Reply-To: <87a5ba6nz5.ffs@tglx>
References: <20250128063301.3879317-1-jstultz@google.com>
	<87cyg67up9.ffs@tglx>
	<CANDhNCon7mFR5b6hjFNH36ARJ+LLoNkw-=hF_ovsy83UUbRqXw@mail.gmail.com>
	<87a5ba6nz5.ffs@tglx>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 29 Jan 2025 09:09:02 +0100
Thomas Gleixner <tglx@linutronix.de> wrote:

> On Tue, Jan 28 2025 at 22:10, John Stultz wrote:
> > On Tue, Jan 28, 2025 at 8:46=E2=80=AFAM Thomas Gleixner <tglx@linutroni=
x.de> wrote: =20
> >>   1) Jiffies and related timer wheel interfaces
> >>
> >>      jiffies should just go away completely and be replaced by a simple
> >>      millisecond counter, which is accessible in the same way as
> >>      jiffies today.
> >>
> >>      That removes the bulk of HZ usage all over the place and makes the
> >>      usage sites simpler as the interfaces just use SI units and the
> >>      gazillions (~4500 to jiffies and ~1000 from jiffies) back and
> >>      forth conversions just go away. =20
> >
> > Yeah, this was basically where I was hoping this would allow us to go.
> > I was imagining once dyn_hz was possible, we could basically fix HZ to
> > 1000 internally, leaving jiffies as that 1ms counter, and let the
> > actual interrupt rate be set via the dynhz default config value.  Then
> > iterating through all the code switching HZ usage to MSEC_PER_SEC, etc
> > would be possible. =20
>=20
> I strongly suggest to start with exactly this because it significantly
> reduces the problem space and has a valuable benefit in general.

I doubt anyone will notice if a 250Hz timer interrupt always adds 4 to 'jif=
fies'.

One problem with increasing the frequency of the interrupt is the sheer amo=
unt
of code that runs every timer tick.
I suspect most of it is in the scheduler!

Do I recall that the timer wheels no longer move long timers onto the high
resolution wheels?
So longer timers are a much increased granularity.
That is going to be made worse for anyone currently using a 250Hz 'tick'.

Making 'jiffies' milliseconds does stop you having a faster timer tick.
I know one architecture kernel (might not have been Linux) defaulted to 102=
4Hz.
But I'm not sure that is a problem.

32bit systems must be able to handle wrap - we all know (to our cost) that
a 1ms counter wraps in 48 days. So even a 4ms one wraps quite often.
Although having a 64bit (long) counter in 64bit mode really just hides bugs.

	David



