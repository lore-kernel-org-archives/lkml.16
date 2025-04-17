Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54EE1185935
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 02:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744858572; cv=none; b=afSCgXI1NpmNOrtdSts+8ifkrUIlU8tiuMjZAKpzizxlhLyedf2ddTXgVYKAnc4vMTWQpH2dVVGw9clyzX8fv57XuyGTdYgrVXpbNW5A7OeSLiofixqioI02i5PdUgfm9Bk888MFtDkJRDKcLL6X7S3RGWIhcnzTyWWLrVhgcoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744858572; c=relaxed/simple;
	bh=qsfwsVIHH+F/NGmT4ago54kC7hpzRNsfBaKhYEwIaEM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OR5axbuUOFSjzUkkd8HLrDDLp4icTIf4lWfLszXwsdeawiKtLsJ93QGyxQbpqwi3gRewwXhs1pXP96d7+FucOA4z9WD2c7V+w2/UW3/RB+/BpluldYiVBhJZUPe/V6LqcqwrTEzlmQ51ikN4/fg3w6EwXFsuhsAmcP7Hyzc1boY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=l9knKAqP; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="l9knKAqP"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-54d3ee30af1so329799e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 19:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744858568; x=1745463368; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qsfwsVIHH+F/NGmT4ago54kC7hpzRNsfBaKhYEwIaEM=;
        b=l9knKAqP6dvAwAiF+Q56y3R81G6VY2QmqxKnvngZdPlpgK16y2ELrIrIE8synSPyjH
         N9DnsN7rSRbzc05ctTekW/UX3gMGBHaeo4pUjfWzrol+IMR8KM3mbjToIMzTEvwNCzgw
         zwC+YevD4Z6mVHG78U6FWSC0TAtyaiCK91a8QE+1OxnfgPFSOm35OmCK1hHOOPeDK3yj
         hcRMWaL8pepUflth1431VArRxkIqgf1C8UxTmChR6x4Gy4dGScBcHurZWg3RFsPfW72a
         mW80B6w/1hJMF0oTJBVgbC70SM2qJNpDP5hUOhGcPlNoDbnJV+dLoztj80TINvrMXkpd
         U0Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744858568; x=1745463368;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qsfwsVIHH+F/NGmT4ago54kC7hpzRNsfBaKhYEwIaEM=;
        b=V0RIEgS8djdMBWN+dleOUUwch+d81UIs1/a4s/4dE2Uxgww0p+3VuV3z4Jw1F5O73b
         uuYm8a8eZ0N273isW197RWFwyew/uQ8b7N4Vkp6aQllQWR693+IK7nK+SQ93ztGwhxjA
         ABQWb4VkwAwtGj6xuu6KM57EdvLuVRMphd3ZgrMf7J2oSst3ptuJ0Mk2qRvD8XPY4Cje
         MHb0NOVGleS+crT3QmHmBuB/0jjU7HRQc/Ve7ca2avukFgjTSM75Wda89nRJRc3EcGpp
         RewOrimT4MOEKgshFovNVjnyGOO1W6UfCzPS0Gh3rmmspxBtrp1cPPjIedPUtW/AvmfJ
         Y1iw==
X-Forwarded-Encrypted: i=1; AJvYcCX3CCFYwZXRk7C60ZbMtyXWTlMkhNW28RRdZSZXpyLMP4A7ahmAUDFAelJwpyv6qfemwSDnw9o8QpbRcdQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyw1A6kGihevUba9ukh9BUyP0hS/8sMobVPQO+G2E+B8ZwLoXGQ
	Q3LesVnEDRAa4j65ufX2Y8rK6z9hmvc3BLwXJH89nip9cEOc6cZqHfXN0HLdvm+mK8zXAc7jf8D
	8SpJHepe7937xC61MTPRKvjUheKTu3sFrdGM=
X-Gm-Gg: ASbGnctUT69QB8orzVCQADKwPvlh/AlyHpjv3kJp5dVGgS0Fo0M8AlRL88hbB9WnY6u
	zRFl41Y15pa0RcTj/hW/hbSYuilMFwzCVno94cxNJ2v3P7DIeWEEE36n2AWpoNEhKt+vglH06PN
	Eb6OmmfrFwYrvG7RecFw88na1J/51uNA0sDFk5z4WafSrjIlDt+bM=
X-Google-Smtp-Source: AGHT+IHiWQzzu5QN+eSXGm1qO1fUfiULKdHlZ+2ubPrubYzVuGFxp5+JbQwKV+eqtRJEj0mEa1LtliBkhLvslM9mW0s=
X-Received: by 2002:a05:6512:224f:b0:549:8ed4:fb5c with SMTP id
 2adb3069b0e04-54d64aab393mr1230755e87.31.1744858568113; Wed, 16 Apr 2025
 19:56:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250320200306.1712599-1-jstultz@google.com> <Z-KURRE_Gr72Xv_n@localhost>
 <874izezv3c.ffs@tglx> <Z-Vx8kV4M3khPknC@localhost> <87bjtmxtuc.ffs@tglx> <Z-pKEYr01vEaQDIw@localhost>
In-Reply-To: <Z-pKEYr01vEaQDIw@localhost>
From: John Stultz <jstultz@google.com>
Date: Wed, 16 Apr 2025 19:55:55 -0700
X-Gm-Features: ATxdqUEmknpvxJqRKfqcEecjSX7QDiHSNKV9CQcfs7eRe5qwPAW4T7DARPoZVlU
Message-ID: <CANDhNCo82jKs4Tq8uiqmJvT5JyPw8VQPFg526POooK0O+15-uQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] time/timekeeping: Fix possible inconsistencies in
 _COARSE clockids
To: Miroslav Lichvar <mlichvar@redhat.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Anna-Maria Behnsen <anna-maria@linutronix.de>, 
	Frederic Weisbecker <frederic@kernel.org>, Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org, 
	kernel-team@android.com, Lei Chen <lei.chen@smartx.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 31, 2025 at 12:54=E2=80=AFAM Miroslav Lichvar <mlichvar@redhat.=
com> wrote:
> On Thu, Mar 27, 2025 at 06:32:27PM +0100, Thomas Gleixner wrote:
> > On Thu, Mar 27 2025 at 16:42, Miroslav Lichvar wrote:
> > > On Thu, Mar 27, 2025 at 10:22:31AM +0100, Thomas Gleixner wrote:
> > > To clearly see the difference with the new code, I made an attempt
> > > to update the old linux-tktest simulation that was used back when the
> > > multiplier adjustment was reworked, but there are too many missing
> > > things now and I gave up.
> >
> > Can you point me to that code?
>
> It's this thing: https://github.com/mlichvar/linux-tktest
>
> > It would be probably useful to create a test mechanism which allows to
> > exercise all of this in a simulated way so we actually don't have to
> > wonder every time we change a bit what the consequences are.
>
> Yes, that would be very nice if we could run the timekeeping code in a
> deterministic simulated environment with a configurable clocksource,
> timing of kernel updates, timing and values of injected adjtimex()
> calls, etc. The question is how to isolate it.

Miroslav, Have you looked at KUNIT?
https://docs.kernel.org/dev-tools/kunit/index.html

I've not yet done much with it, but it seems like it might be a good
match for moving some of this simulation logic (which has always
impressed me) into the kernel tree.

thanks
-john
