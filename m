Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFCE25661
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 15:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747410599; cv=none; b=rMXsI/QCTtR6kSGCP8qocxigogYLkf4MZW77g3AW3mPFRGo+pyK0/kXnswlzCGS4brfIicA9huD4wTggsYNoAv5Xpo6Ahd//W5KGLGFkJdSIcYCSFllKhUi2+y2VTpgJoQRkEUZiGk8tL2hL3eYX4AvWTiE/knUJk9zMzTlElfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747410599; c=relaxed/simple;
	bh=JpkaASypHV31ANZvoYuzM/VCYCe14HE5EBiA8Qn/Lo8=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=bQvPvTyGtWvT+SMH2fahsZp+w5t9VKzpFeRb2oBZiSNgbRoonU7ISa9zkoiJFFWR4aZsJc+QD6FosOafffoiyb67BrCZqK2A+PRH6q42nIuvNz0ts+UQdbaSS19AAQcFifKF+OnsHLU4G3YGOgAMq4aeISdH7c7kKcUcGzhYC9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=LAAOmoTq; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="LAAOmoTq"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-30dfd9e7fa8so2864854a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 08:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1747410597; x=1748015397; darn=vger.kernel.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=DQq08iC5AMkz4yvNE7oCYDyYJ6HwaFXKyHL4aPlfToY=;
        b=LAAOmoTqSHAE2KFBaqgclN3q308u/BE/ccr2gdRpjBW8pTHkUux7Jh+xa4uSktQ8V+
         xFS2GA7VcEwsBqRRynbYuplqCVLuR+a2pWGCexFNjuDdhiGGNfgLumq0TBXAUulCqwtg
         XhFb8IP3r1Jdqey5X8U7Fi91YEz5fzd8pDpHD+tPNE0ue9+EQSKfdluIiEUAZ4pf4yId
         qHDref5BVFjQEAVs6DJBfGSsZyMEq4QUGduaDNZVcrmfH7kFCml7P7MwuC7jmyHalkA7
         HknPFP0ANC2E2YfjnWo7rUAb7U2YfL/BlfDX7gSTtRnh7fD8Jwx/O2V0n0sP/GG8w9wA
         bgUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747410597; x=1748015397;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DQq08iC5AMkz4yvNE7oCYDyYJ6HwaFXKyHL4aPlfToY=;
        b=Zo5aUQIwFaMkgcao7c9Diyg3QAznds80jZGjdsz9B0YW+SEY78H1TY1shgMDXNWo/9
         diCguXUcdyR6icXPw1f1SYyfAwNnIAeFebA6VkEMiuMwS7Tz5YZYqd9iOKtbXsjeZZ8z
         8N4leQAFupXm0cHkNNIWBCz+UmjCUX0+78bigHeDwWuit5XpdHXu+uLt53z8F2WnIJ+I
         mODMPPmppMNIr2Z7bFFTtoWSD8uneq0E1AzASMKOiWjcS+gOac+kxZg6fd2JgfrvDq4Z
         H2QX3QDyvPCSKeQK4F1MrPR6ZpwmVbuwXRec69dTFl2TVZVAedMIYOeEjZJ4cKbdwNG5
         m0xA==
X-Forwarded-Encrypted: i=1; AJvYcCWCjPEvWxucGxsNa8Q5R9ELjcmA0KYkdkg86J6iV+xlMbrlkduBL+gIRKgQJFm5m2cJS1Hll6rlvg6wu8k=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzLnmJb2WlbYgQ1zeSjLQqhTP42HYAXnZ+O89DfUNl9BMIV2tB
	fzy4oIFDbebu/OWs+HZL3EZqdFsUplHApbd5+aNNnHbDl1A2KzlwE4yyHtMoKjKxbgpCY55nmsB
	mM6hK
X-Gm-Gg: ASbGnctNNHxhjpdV9KcJ+TDcoMV4M+uNQY/pi+NbKd9Yro56mXrKo/tyZ1Dn03yHYR4
	G2VsI1bkcoOvA0krJwAKg8NX3y7bYrXAa+T5r21YyXkNayh5LrJunBRGYV9gG3t4ZiPWF5U1VyW
	GrXFfZKhO3CpOgoRx3n/bzt5mcdtlR3xyw5pV0slzFuUlnF4O1pL4VaKwY7tCAy6lJXhz3TP45u
	oi269QAlrsRUH9y43tkZ7vgIU8nBRaNYVM0c8ujZKVjtBnLlG/Aur4aoc2+nzJZriOoWHClSe9b
	RFnCpZ8Lrz7n6mOZjgG38xvJD7+8BzquzsjiWDkLxCMjzRNr7p2c934nE/b5f4hy+KMiozG9jju
	NtptfJBJjXwjpEw==
X-Google-Smtp-Source: AGHT+IFh4shsoB9AdIyllbddv/+L1vYFXbpx0M94kDy+ICVHvdPChMsSzgRCcPPWhpWg4OGO2PuxuQ==
X-Received: by 2002:a05:6214:27ef:b0:6e8:fcc9:a291 with SMTP id 6a1803df08f44-6f8b2c95ca5mr45535716d6.23.1747410586709;
        Fri, 16 May 2025 08:49:46 -0700 (PDT)
Received: from xanadu (modemcable179.17-162-184.mc.videotron.ca. [184.162.17.179])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f8b08aed47sm13526396d6.50.2025.05.16.08.49.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 08:49:46 -0700 (PDT)
Date: Fri, 16 May 2025 11:49:44 -0400 (EDT)
From: Nicolas Pitre <npitre@baylibre.com>
To: David Laight <david.laight.linux@gmail.com>
cc: =?ISO-8859-15?Q?Uwe_Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>, 
    Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, 
    Oleg Nesterov <oleg@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
    Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH next 0/3] lib: Implement mul_u64_u64_div_u64_roundup()
In-Reply-To: <20250516131758.2a304d1b@pumpkin>
Message-ID: <028q4r18-q026-0qoo-sr92-752s68rpp6n4@onlyvoer.pbz>
References: <20250405204530.186242-1-david.laight.linux@gmail.com> <5e7mp3nreaadppjhxhpffyff2d2ccwcjf2suonxe43eofngddu@qfufr2wiw7yn> <20250516131758.2a304d1b@pumpkin>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="-1463781375-633285779-1747410586=:4117"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463781375-633285779-1747410586=:4117
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 16 May 2025, David Laight wrote:

> On Fri, 16 May 2025 11:47:58 +0200
> Uwe Kleine-König <u.kleine-koenig@baylibre.com> wrote:
> 
> > Hello David,
> > 
> > On Sat, Apr 05, 2025 at 09:45:27PM +0100, David Laight wrote:
> > > The pwm-stm32.c code wants a 'rounding up' version of mul_u64_u64_div_u64().
> > > This can be done simply by adding 'divisor - 1' to the 128bit product.
> > > Implement mul_u64_add_u64_div_u64(a, b, c, d) = (a * b + c)/d based on the
> > > existing code.
> > > Define mul_u64_u64_div_u64(a, b, d) as mul_u64_add_u64_div_u64(a, b, 0, d) and
> > > mul_u64_u64_div_u64_roundup(a, b, d) as mul_u64_add_u64_div_u64(a, b, d-1, d).
> > > 
> > > Only x86-64 has an optimsed (asm) version of the function.
> > > That is optimised to avoid the 'add c' when c is known to be zero.
> > > In all other cases the extra code will be noise compared to the software
> > > divide code.
> > > 
> > > I've updated the test module to test mul_u64_u64_div_u64_roundup() and
> > > also enhanced it to verify the C division code on x86-64.
> > > 
> > > Note that the code generated by gcc (eg for 32bit x86) just for the multiply
> > > is rather more horrid than one would expect (clang does better).
> > > I dread to think how long the divide loop takes.
> > > And I'm not at all sure the call in kernel/sched/cputime.c isn't in a
> > > relatively common path (rather than just hardware initialisation).
> > > 
> > > David Laight (3):
> > >   lib: Add mul_u64_add_u64_div_u64() and mul_u64_u64_div_u64_roundup()
> > >   lib: Add tests for mul_u64_u64_div_u64_roundup()
> > >   lib: Update the muldiv64 tests to verify the C on x86-64  
> > 
> > I wonder what happend to this series. I'd like to make use of
> > mul_u64_u64_div_u64_roundup() so I'd be interested to get this into the
> > mainline.
> 
> I've a WIP rewrite of the divide code, speeds it up considerably for
> 'not amd-64'.

May I suggest you simply submit the new API now (addressing my latest 
comments if possible) and submit the divide optimization later?


Nicolas
---1463781375-633285779-1747410586=:4117--
