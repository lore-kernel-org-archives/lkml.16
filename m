Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05E6942AA3
	for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 05:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745042161; cv=none; b=tItg0KMuc/DIzxXZVs/WAIa+lQFwtWPq8HpViWXzy4cbgVg1mEfghIUF5sIXlm3DenwXu4V4txJz1D6tAeWP5Z/DL8mo/xphCW1klSUdxtjRwn1fouCbyArhsnkpMXWI76djWP7ATIlAbOzOnm45qt8US25FI7eaz6AcGK1qNiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745042161; c=relaxed/simple;
	bh=Ow5OzIdQrw1DFiXgXxbjMJWQK3tqwXy5Fav+FGiBbw0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bV9PLfpeHcRftcrUG3hBBH8jQQzTCxK6oWbY6LQrcI1uiAMynF8vsUD0jJpWZWlsCab2Q4yWBusyPilnCcMX4RM9zmBjtz8uLTXzx7iKqFK7Oze/eiJcztc/FGNiz1Ak7MAGmpi5IwVFp2e1BsPAWno//BrVnsx4OpZe69dapvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=O0M2k4EM; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="O0M2k4EM"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-30bfc79ad97so37977781fa.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 22:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745042158; x=1745646958; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XdPIwZMbbH/v4IfyGs8wVOWQZOeGXcJa+MlXzZtV0wg=;
        b=O0M2k4EMdNYKsB4wsF2xOYGGIev4+1sujkeVG6+tfZKZaQFTz6BKg7QbBwhCKrW8qv
         JEN0E6jW/YDV90DpLYp5MccTWuD0+eA/SoQxNyL9MNPXiqnR41FSosKRTOiWwBgqMEVl
         DW2hBqQfOxmQuFKQg4+WbJ3lRP3hrGOvrSrbll2FTMout70QdgLC2HefLM00QQ3isfSE
         8ihm0YYoKs2dl1DJMixvBiuiQCMuu6xlu5P4qBaEhLoKgXB6C9mW2Y8VD3mFNe4eU4+Z
         8Mf3faMGCSbidIyjb8nENdlYIgWyiwz+cahiKWrZ1fP9HLkf5VjIVT4vA4EAfzBFZba+
         E6WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745042158; x=1745646958;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XdPIwZMbbH/v4IfyGs8wVOWQZOeGXcJa+MlXzZtV0wg=;
        b=E1pT/FD70kCuPs+W1e2IW+0a8+ipqSdQFpyhT8XwcwpdCKNPd9h3kMCuPJHo0XBN5n
         O3PA/K+2PmXP1e/B6XGsXwdFZiB6+Q4YftqKINbjLjeUHcM7zV8l4gQIO31hGxEvvDO/
         Ks/Nm2Ve0QtAyfmu+nL7xsoc+q4X8qzke8b2pYafjNEZlZVavXORkvA24opkRkJiexXL
         y+zSfF+ZHMfLZfB6RH591ahMEWAZNf5HKSFZUGsZxyl6rs+FIZCYn7Scy69Os6c5WGXo
         yjagxjLfe5+VYSHte5xlv0cvdAa0SfXuyRK83mB8v2XZbaNVOc5DXrGPTkjuAYNh/7J5
         so1w==
X-Forwarded-Encrypted: i=1; AJvYcCUsEmNFBNxF9jAGanrgVOJS8D+5TIVcLxJXYjYaDk8ZiVPAXj/S+Q7qSrrfBYkgC9JANGgaDTdmKxd+Bro=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz80n/UCOARKrf3LyoD1CiJONbUcsz73sItxHySkZgmjfrUxkI8
	GBsIax5JyDVRVrjHa7QWS9w2p3ZTLIpzMwPuup2A+zEEDYveE6m3VrM2V/R2OsJtrtzHENC67Kl
	LMKYLpR7SCuK5Cl8ESQ0fw4aLMs/G2Ou1b30=
X-Gm-Gg: ASbGncsEbUQRWcy6asZ/rxhE6lNHafAslJK2jJS2YeJyq+4trK1WP5bdDFjDPYkJ+C2
	Umvq0N78RjSAOzodxRWALkAo3GeSLzLkzCalYXmVCF5pnBxBS+FKxNhk61mzDd31FvCgGmAGpV/
	k2snRRLuXMh0oE9u+iLsvKGY2VVwzTPvhpttT/8fcA8G5kZqO1EV+t1mTVBGwuzg==
X-Google-Smtp-Source: AGHT+IEcHxjZqljPDfrwZ+WwyAACsxSZEdF+AnzuNtbkAxWcFAZWBScBT4hoQ7usLT55L4a5MJ5+ffD8mkHxy7acQLs=
X-Received: by 2002:a05:6512:31cf:b0:54b:117f:686f with SMTP id
 2adb3069b0e04-54d6e7f4e06mr1275061e87.28.1745042157705; Fri, 18 Apr 2025
 22:55:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250320200306.1712599-1-jstultz@google.com> <Z-KURRE_Gr72Xv_n@localhost>
 <874izezv3c.ffs@tglx> <Z-Vx8kV4M3khPknC@localhost> <Z-qsg6iDGlcIJulJ@localhost>
 <87o6xgwftc.ffs@tglx> <Z-vL3cVZuQ8XQXhG@localhost> <87iknnwxa4.ffs@tglx>
 <Z-5HlSUEh1xgCi4f@localhost> <877c41wkis.ffs@tglx> <87h632wals.ffs@tglx>
 <CANDhNCrUhZktW=_h9YTZndmyHwe9YbUMG6uVYaEuQyuKsG4AEg@mail.gmail.com>
 <87tt6mq8jz.ffs@tglx> <87r01qq7hp.ffs@tglx>
In-Reply-To: <87r01qq7hp.ffs@tglx>
From: John Stultz <jstultz@google.com>
Date: Fri, 18 Apr 2025 22:55:45 -0700
X-Gm-Features: ATxdqUHKCUss3Lu3EUOBiHOPQD5kXjTO7sufFV19DZLFsnOExQXyOVNeazDE9Mw
Message-ID: <CANDhNCr21HXQOqfhcJFM6x7pNHCevSEKdg2_jz7KbLj=g8+0Sg@mail.gmail.com>
Subject: Re: [PATCH] timekeeping: Prevent coarse clocks going backwards
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Miroslav Lichvar <mlichvar@redhat.com>, LKML <linux-kernel@vger.kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Anna-Maria Behnsen <anna-maria@linutronix.de>, 
	Frederic Weisbecker <frederic@kernel.org>, Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org, 
	kernel-team@android.com, Lei Chen <lei.chen@smartx.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 18, 2025 at 12:00=E2=80=AFAM Thomas Gleixner <tglx@linutronix.d=
e> wrote:
> On Fri, Apr 18 2025 at 08:37, Thomas Gleixner wrote:
> > On Thu, Apr 17 2025 at 17:46, John Stultz wrote:
> >> Instead it seems like we should just do:
> >>   tk->coarse_nsec =3D tk->tkr_mono.xtime_nsec >> tk->tkr_mono.shift;
> >
> > You end up with the same problem again because xtime_nsec can move
> > backwards when the multiplier is updated, no?
>
> Something like the below should work.

Hey Thomas,
  So I did test this version (I'll call it v2) of the patch and it
does avoid the problem I was seeing earlier with your first patch.

Though I also just sent my own slight rework of your patch
(https://lore.kernel.org/lkml/20250419054706.2319105-1-jstultz@google.com/)=
.
The main difference with my version is just the avoidance of mid-tick
updates to the coarse clock by adjtime calls (and the slight benefit
of avoiding the mult in the update path, but this is probably minor).

It's done ok in my testing so far, but obviously the effects of these
changes can be subtle.

I'm ok with either approach, so let me know what you'd prefer.
For your version:
  Acked-by: John Stultz <jstultz@google.com>

thanks
-john
