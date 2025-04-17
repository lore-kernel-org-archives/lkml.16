Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77BEB70810
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 00:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744849407; cv=none; b=HjOrwGmPlQRJjkwgXTYvcg2S/sMNCkVqUG4ZPC69c+6GesJgU89wPknsjOMOlN8llAdIJgkO/5RjMdAA8HE19ql+xTm2jhZmc2q2crXS/SmATSqFWFJcaC8DH9Nj8lZtQG3xA4J4opNOcWf+K5UIEEFOLhotDAsBm9/YkrZOhLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744849407; c=relaxed/simple;
	bh=RFw3r8mwXohhjwTXS5G4Ivu1qOCvgxQWdyVMEicVfv8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EmYnCTnl4uWhoM9pJy8qAhDUyixVf+hRigXZy1o2V9PGxiE3krtQbobWZ7v87gsqg2Ug1yblspqrbdo/oo8xm+a2z+Q6zTD33xGjkpmk/HnbHo7QsIKVzbMEwlwlJCAgS+6/KGytcBMHpGS0dWmT9QbTZ9gnCun4/iyoZOgagLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=y17hmUSl; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="y17hmUSl"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-54ac9b3ddf6so223915e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 17:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744849403; x=1745454203; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LWRZ50NAbDJYROamq3YVOmHHfJwGKSe7HwWXpsjaaTY=;
        b=y17hmUSlIQCm/kdJbnCKjT9WB3kaoQ1fJ3lp4Rj9xwyeDtt4eRw8cSRurcWYILxN2L
         DpikbDkkikrGhLrHFo8XOrJRx+c0P9DRFuMdkSAaowHXPDOb5mCTSCp1YbnDFdCCAUrL
         WwX0Tyw06mSrB0Qae4zrmUuTZdEKob4V44JVGg8Mp/AX6/Utp05wfSmm1g1LH3XmXzop
         hIyXTQlVF2XfV4IpR9ZZw41op3S+fKGDddQ92GRIgZ2qddFeITXwmKhnBcWyxKkjOHC2
         UIp/RxiSQtDYyUx3TTA34yTT1HCn4osCZOfhM/ccaPuIcfv3C+ruIAG5+P4ohhiM5K29
         DIyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744849403; x=1745454203;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LWRZ50NAbDJYROamq3YVOmHHfJwGKSe7HwWXpsjaaTY=;
        b=vulcAbwwpIF6LHbZhE78kibAzocoOASaIIdvDwTmOa54WjCUINEaM58m6riUmEY9X+
         HHXM7BkhpA8ztMpY3y7fLkbkhRRxlN4kCVMxgdyB2PQBC6QqbS1+5qtmNiCaj6lWPCTZ
         R2Y5xDYa+j7mGbsDF02alHm81MobwYTUmxkQNsis+LxDfs+hhC0xm7+NXEW/V3CCJlEz
         /3Jup4QlH15H61gR8e5fvforhBzdM+cZaxGIt9VLdPuPVytgC9DJ6HlI1gFbecqXRZfx
         tUrsm4Nrc1G5UVNyxzQGjv7Jpsm8exhZeZ5E3DEKGGQcGOvV3Jj/8R/7r+tbJ/uyBvmH
         wTlg==
X-Gm-Message-State: AOJu0YyGU8fTYVWdhe7g7UkJADICVrudTcMhqnKDG9yyaHhFAUfROssl
	lTCPDCogNXbQkYxQuEQ9SmG9iQpHHPWkOrYCCOCy4n+rbQ8h3QC3tg0kmrQHH+mAsOh7KH7TjtN
	/8BkpRszjFFgbzAI+qYsvBzLtKDgb19tM6kU=
X-Gm-Gg: ASbGncsGR+QS3k3RnnDaIsTA1P6FvxAOw3Q2ZkPalDvBuAhDFW7YyccTXOZMEuBnzl/
	wouOWSg8Bi9F7/l8mR0UsKMvAdRBHPafg/3wOd5wSzmy33aXZHzfaLRoelff6c+sY1GLVjOj6AJ
	5RtxFq4vWflhiKYi8RUhYwqU0mZZqdyZxsY1yC7ZPK4ma+SlRUnYw=
X-Google-Smtp-Source: AGHT+IGMajKeF7wEkfv/eQVib2KWOLVh4Kxg8oPsAvOivT2DxHBxewHF41Y9ExEmSyiStSs4yPaIo0Yw8ua1wYbbavw=
X-Received: by 2002:a05:6512:308f:b0:549:7d6d:3db5 with SMTP id
 2adb3069b0e04-54d64aa90f8mr1140466e87.25.1744849403243; Wed, 16 Apr 2025
 17:23:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407134712.93062-1-hupu.gm@gmail.com> <CANDhNCosvML9XKH8HV1QBXKzxt3zMWxzsPSUfYxoyPCORf6Krw@mail.gmail.com>
 <CADHxFxS+qpmD8r1uxru+VWLj=K616=jLKbBgUR3Ed7ZBY1gidg@mail.gmail.com>
In-Reply-To: <CADHxFxS+qpmD8r1uxru+VWLj=K616=jLKbBgUR3Ed7ZBY1gidg@mail.gmail.com>
From: John Stultz <jstultz@google.com>
Date: Wed, 16 Apr 2025 17:23:11 -0700
X-Gm-Features: ATxdqUGZxyUfQeZeVLiSIUA_4JipUuDqB6m1doZPDOqUPV4DaNnDEfEZt5qx4Fo
Message-ID: <CANDhNCqgCGtWubkuMpn=GdfLwP6d5kMEvbhoQL4oef5yf_74ug@mail.gmail.com>
Subject: Re: [RFC 1/1] sched: Skip redundant operations for proxy tasks
 needing return migration
To: hupu <hupu.gm@gmail.com>
Cc: linux-kernel@vger.kernel.org, juri.lelli@redhat.com, peterz@infradead.org, 
	vschneid@redhat.com, mingo@redhat.com, vincent.guittot@linaro.org, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, hupu@transsion.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 10, 2025 at 2:51=E2=80=AFAM hupu <hupu.gm@gmail.com> wrote:
>
> Hi John:
> Thank you for your feedback.
>
> On Thu, Apr 10, 2025 at 10:41=E2=80=AFAM John Stultz <jstultz@google.com>=
 wrote:
> >
> > Unfortunately this patch crashes pretty quickly in my testing. The
> > first issue was proxy_needs_return() calls deactivate_task() w/
> > DEQUEUE_NOCLOCK, which causes warnings when the update_rq_clock()
> > hasn't been called. Preserving the update_rq_clock() line before
> > checking proxy_needs_return() avoided that issue, but then I saw hangs
> > during bootup, which I suspect is due to us shortcutting over the
> > sched_delayed case.
...
> This patch worked correctly on my QEMU-based test platform, it seems
> our testing methods might differ. Could you please share the details
> of your testing environment and methodology? I=E2=80=99ll try to replicat=
e the
> issue using the same approach.

Usually I boot qemu with 64 cores, and have found stress testing
running the following separate programs frequently uncovers issues:

#cyclictest from the rt-test suite to add some rt load
cyclictest -t -p90

# rerunning the test_ww_mtuex logic (enabled by a patch in my full
proxy-exec series)
while true; do echo 1 > /sys/kernel/test_ww_mutex/run_tests ; sleep 5; done

# Along with my prio-inversion-demo (which ensures we do the proxying paths=
)
#   https://github.com/johnstultz-work/priority-inversion-demo
while true; do ./run.sh; sleep 10 ; done

# Sometimes I also throw in the ltp sched_football test:
# https://github.com/linux-test-project/ltp/tree/master/testcases/realtime/=
func/sched_football
while true; do ./sched_football -m | grep Result ; sleep 1; done

But I'm always looking for other scheduling loads to trip up bugs, so
open to suggestions.

thanks
-john
