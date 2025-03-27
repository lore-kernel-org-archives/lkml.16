Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 807BF2054F5
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 08:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743063983; cv=none; b=EqHMr/nFGVaYzbXrWsaWQoPMEPwduyWJt4svgQGm6fxWueT5o0gXO+EqvA2OZ/bT4V5CP7jnTeaQzMJQzqtak1MNJ41Fg8YLtFHexlIOnzVWRWwlOhkbB6mfsymvK4nkT7jSrgSjZ0kmxCy53UdfHDvADHJSOedaStfu+u2SJFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743063983; c=relaxed/simple;
	bh=oYoU6rrUgf5SUZ0R7XLmkS8IgbsCFKVKcKoSfyYUCv0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a6iCABjnoZashX9oKebE6zvGYld43gd3m8bO4Fha3EBcsacVbpO4D60R1ac1E6HFTMPMD9IObmNxxyExVHZqjthRcY61COcOOqzyxd71YpsikBfHqokPjjkw71gR4D6Wy5IFHElndYq1F2HYxoHTT+NIci+VrSca1hZtMNk+U7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cfwJoSyH; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cfwJoSyH"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4769b16d4fbso4330691cf.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 01:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743063980; x=1743668780; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KmalLC5Na4GTkMmPNIYaOK7rSnGDkHzJa5etUB00I2A=;
        b=cfwJoSyH/oFVlYPnJ9E6uRxzToHjU/Mg/+5++rUtISHcSuNPZ7T6YnNmS5oDNxPNgn
         buxwq2n5iQWLGT1KkM2nX+Ur8HwP0neIqNkjpKKygtyIHOmz61/WymHtRTFsHX91LRU3
         ai9RhF13G/ISvRwIWicVUctMpFSp6CCXx0bGJW4siPDetR8788zuLOhKIHP5yrTy5goB
         Wpb0pLCZaWNLEerYl/MqZ+elaf/E37cA3Ih8M5FjUVl5RWEf3QmhSTXyFFKHgYhWk+SB
         r5FJVZB9X57s1mCMS+L/g4mlKP6/ZlWCR9agBGuwn8a7FX2YNWLFfvDiKs6nnKgSilbo
         ABpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743063980; x=1743668780;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KmalLC5Na4GTkMmPNIYaOK7rSnGDkHzJa5etUB00I2A=;
        b=VTXMUbxpgKgYZndU4LpSQQ2UWptaRYHBMA68VGEiYqZYplDDJjJqe9oRx2fGuRiEXb
         Sj+PAo79bnlTU1Hwh3Ow0ocwg4bm8w4mxRyaDJQNSutVf5JX12v0cxkkCmQEEuOMSXlr
         P1dLqykk4C+x7xrI+7dxmSqVRVDyMFcYhHP19T0wGs1MnJ7vxLpeVVyQnimQzEvEQsJV
         o59J0FSARRO9Val8qvjDjHy0VT2JNQDZcFVrPqdwb76lflrA5DybVf+F05EQK9/ZlWe/
         5+MhiSNO60gUHu6L9gZw4KFe0FGV8bGI+WkP/bkALYAbrHBPuofrECgFGBGJYYYU8kvW
         mTig==
X-Forwarded-Encrypted: i=1; AJvYcCUEFXIkSnF9gKHdVPbietxvXBdkAPrG5ybHvwUnb5c2l4Zhf3/kuQrcmxjzGFfQ8Tvca1SaWI7t46pXlK0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFO3SvfwCo1Qee5KoahvNyActd3DAyUaA3MKCEtYtxrVlyIeeq
	JwOL+acbv39OD1vIC4JCA9mF01cGVV4S1XwFXePl3FX6rfkAyYNYqT9jLNSt2kK/Ymgql/FKtnR
	Xi5CaU0NZECmFvWot7+qqMB6E3re1cA2JMALr
X-Gm-Gg: ASbGnctIwY1C35voR5oDlSBfG0H0kvYtnT/KcAj+IaepUPtp59asSyEX8GW6tQS5XQI
	ysWCl8XF3M1wgvsJ3aFkBIYf/I6MCv3Lm8PZ2crJr+NDLliujVIHCT4LymALZwPgRTvFaxVhytE
	0cjIkahPxkZvirFGiEHNzkpt1J6eQ=
X-Google-Smtp-Source: AGHT+IGl6mZ0a7+3v7Ggn/OxSS/fAlKeakvrk8pfOEeBh/kXVj+anvy9K06ATqhG+V8GQZVxV7pACMkSJajK+KBGarc=
X-Received: by 2002:ac8:4758:0:b0:477:7007:7055 with SMTP id
 d75a77b69052e-47770077176mr24126621cf.12.1743063980031; Thu, 27 Mar 2025
 01:26:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <202503241406.5c9cb80a-lkp@intel.com> <87pli4z02w.ffs@tglx>
 <6sn76aya225pqikijue5uv5h3lyqk262hc6ru3vemn7xofdftd@sw7gith52xh7>
 <CANn89iKjCgmxtiLeVAiXODHbbR7=gYYi5cfAS1hS5qn+z=-o1Q@mail.gmail.com> <877c4azyez.ffs@tglx>
In-Reply-To: <877c4azyez.ffs@tglx>
From: Eric Dumazet <edumazet@google.com>
Date: Thu, 27 Mar 2025 09:26:09 +0100
X-Gm-Features: AQ5f1JqrJlEHraIvtxnqqzfUm-aKvXZVfgCjo84W0r3w8se_wp2vuP4inJWs2UI
Message-ID: <CANn89iKAkio9wm73RNi9+KngNaS+Au2oaf0Tz9xOd+QEhFSkyw@mail.gmail.com>
Subject: Re: [tip:timers/core] [posix] 1535cb8028: stress-ng.epoll.ops_per_sec
 36.2% regression
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Mateusz Guzik <mjguzik@gmail.com>, kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev, 
	lkp@intel.com, linux-kernel@vger.kernel.org, x86@kernel.org, 
	Benjamin Segall <bsegall@google.com>, Frederic Weisbecker <frederic@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 27, 2025 at 9:10=E2=80=AFAM Thomas Gleixner <tglx@linutronix.de=
> wrote:
>
> On Thu, Mar 27 2025 at 07:21, Eric Dumazet wrote:
> > On Wed, Mar 26, 2025 at 10:11=E2=80=AFPM Mateusz Guzik <mjguzik@gmail.c=
om> wrote:
> >> On Wed, Mar 26, 2025 at 09:07:51AM +0100, Thomas Gleixner wrote:
> >> > Unfortunately I can't reproduce any of it. I checked the epoll test
> >> > source and it uses a posix timer, but that commit makes the hash les=
s
> >> > contended so there is zero explanation.
> >> >
> >>
> >> The short summary is:
> >> 1. your change is fine
> >
> > Let me rephrase this.
> >
> > Absolutely wonderful series, thanks a lot Thomas for doing it.
>
> Thank you!
>
> > Next bottlenecks are now these ones, but showing up in synthetic
> > benchmarks only.
>
> Right. I saw them too when working on this.
>
> >     33.36%  timer_storm      [kernel.kallsyms]           [k]
> > inc_rlimit_get_ucounts
> >
> >     32.85%  timer_storm      [kernel.kallsyms]           [k]
> > dec_rlimit_put_ucounts
>
> These two are not really posix-timer specific. They are also the
> standouts for any signal micro benchmark.
>
> I stared at the implementation a bit, but there is not much we can do
> about that I fear.

We could place all these atomic fields in separate cache lines,
to keep read-only fields shared as much as possible.

diff --git a/include/linux/user_namespace.h b/include/linux/user_namespace.=
h
index 7183e5aca282..6ddf667022d9 100644
--- a/include/linux/user_namespace.h
+++ b/include/linux/user_namespace.h
@@ -118,7 +118,10 @@ struct ucounts {
        struct hlist_node node;
        struct user_namespace *ns;
        kuid_t uid;
-       atomic_t count;
+       atomic_t count ____cacheline_aligned_in_smp;
+       /* Note : should probably put all the following atomic_long_t
+        * in separate cache lines (one atomic_long_t per cache line).
+        */
        atomic_long_t ucount[UCOUNT_COUNTS];
        atomic_long_t rlimit[UCOUNT_RLIMIT_COUNTS];
 };
