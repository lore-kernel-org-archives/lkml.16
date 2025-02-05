Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7318918C332
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 15:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738770324; cv=none; b=NKo9hZmi2rL1mSyYPBwx7iT5yi9QGe4fH6WkKjInr3AXq4Jr4ef2KqBZlzKQYo0plyzgT5SaASol8fmtrKOPk7gnqovfiEHl8YAx18uV0P2dQvXohv+Sr+Qz08vB+WV3g6akWwWlsppuq6G/qRPGkoGuvW4oLBwrW+/FPY8YR/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738770324; c=relaxed/simple;
	bh=HNCjg1MALIv4dy4CTWpeCXU2reB6NDFlV/eyT9XFuQI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TPBnelnzLacCf4yntW7smIzWcuQkw8rqdNBR06h7OXUhF470g6gkiIQVp64eT8bJ9h2eT6y/uoHQwrvE6yfi2pWM4pTRpZ1QnBbwejdR/9jCvdNKopWnnxxA0jqIrCyTpxUsm0E2Gs/phlWlJGOYXLqBtea0AQaZ8HnsZbisfQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joelfernandes.org; spf=pass smtp.mailfrom=joelfernandes.org; dkim=pass (1024-bit key) header.d=joelfernandes.org header.i=@joelfernandes.org header.b=M2AAeYaP; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joelfernandes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=joelfernandes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=joelfernandes.org header.i=@joelfernandes.org header.b="M2AAeYaP"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-436281c8a38so49334765e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 07:45:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google; t=1738770320; x=1739375120; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TJYBW46PAYvv66CBHwB9PW5vmy4S1x3UTfTgfNBIgjU=;
        b=M2AAeYaPycf1dDLxhlCxdGmc3KPZk0RgcJCi6n7TD/PkKXXPLX3LsCWO8uvW7udoeU
         Mk6yqLYt524fgqCvvl6ivt0IS1F5bdCCnE5SJE+Ht9S31cCk5o2rK6WGpdEPziljZxRh
         nNIWRlxotHi3kEemsyJI6ag2jio6qC2VhIa/o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738770320; x=1739375120;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TJYBW46PAYvv66CBHwB9PW5vmy4S1x3UTfTgfNBIgjU=;
        b=pxnqPInhaDY7Zq1hjDs8nJHJ0pAuwxj/80CZPJdMmOxgY6dfwYbAUCb6JDiG+QMLkP
         UcmGd1Ex5ZdEjQcjE1xn1P8zV0mmRHABhuIUGACuLpbF8BtBr9yXqaer81llwcR4uU62
         vZzvM2X8oAYB28YVIZSDCNaw7TJSPxRHGPufGGjLPfv3guJ4mhAg9M5assXRky9zvdIh
         Fvc+sX1WuJfuzumcIVyWslaD+YJnqSfLB+cSyZEUbqaNaT/TYbfvPwbSzTk+Y1cT1wnx
         nuTHchX/AGS/Dh7F9p+LBg+MfmCDwCreqfw9/THH4lmpj4m+TRbGuRBlZm3roUVTva+b
         sxgw==
X-Gm-Message-State: AOJu0YwqK2CRLC5Lef323MP+lpp10fKt7AfAXONQgzitqdM385BelQCB
	wxU8sgRWK6vEV3ew8nzouiSzrjMpQ7YfgNRvwcCoQ6bIJZGqeJ10/9TBCvBQf2lIkZ+459chA+t
	NYEjwMdGxmSsHFRjvrLjGv/M72VPoAPKwRewYH8UWYnbAi8AC
X-Gm-Gg: ASbGncvaaqFEgkR3JcrcgTiw1IiHYndPyoN1008mLwTXAYYTbHJv2o9LM4iuCbQjrvA
	WktbS8ZYZn3L8Tqch7K7+ShvdHiUomGaoRAysSO6BtP4kMCC7cR8xZMXgkY010QZVuBcZZxJr/t
	w=
X-Google-Smtp-Source: AGHT+IFiWJe9oBaxhN7WtB+19rR96m0imK6K9QNDqqC3QbSZlewaL6NN7SxBu/0j0ubnYkf8xQpBeX/NKVU9Ja8xhhY=
X-Received: by 2002:a5d:4c90:0:b0:385:fb59:8358 with SMTP id
 ffacd0b85a97d-38db491e83fmr2095111f8f.53.1738770320226; Wed, 05 Feb 2025
 07:45:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ecce7241-4238-4d86-8e4c-5080937129ce@paulmck-laptop>
 <15D1150A-9B7B-4EB7-91C6-2D881D6F48DA@joelfernandes.org> <861f1dc3-bfc0-4a81-9b78-c8e9995db4cd@paulmck-laptop>
 <CAEXW_YQ4W=upWV_x1woSgq-DJPFXmBjH2pVmUnBVb_n_UKrw7A@mail.gmail.com>
 <ec293223-2a33-4d2f-b3ca-c011c3d987f3@paulmck-laptop> <CAEXW_YQXgZANSjo835VfHMqY=z8gaSWQ2bgaWtVd4-3KX0hX8w@mail.gmail.com>
 <999751de-b891-424d-a7b5-80bfa98793ff@paulmck-laptop> <CAEXW_YT6bD=sAD77yg+BXC+Q0NW0RHCg6fEYZ_jsBeXkAd_1tg@mail.gmail.com>
 <e23ab8d2-1a64-458b-a83d-eabcf92a2382@paulmck-laptop>
In-Reply-To: <e23ab8d2-1a64-458b-a83d-eabcf92a2382@paulmck-laptop>
From: Joel Fernandes <joel@joelfernandes.org>
Date: Wed, 5 Feb 2025 10:45:08 -0500
X-Gm-Features: AWEUYZlrWfrEphEmAQIbQS6cIDVkH0svWmBXbyCipIfWl2_nszrvzajHjXVoCrw
Message-ID: <CAEXW_YSFtF=Vx2P73m0tdfAYgSui-KSzGnyqiTY1rwOfWfFycA@mail.gmail.com>
Subject: Re: [PATCH] rcu: Merge rcu_seq_done_exact() logic into rcu_seq_done()
To: paulmck@kernel.org
Cc: linux-kernel@vger.kernel.org, Frederic Weisbecker <frederic@kernel.org>, 
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, Josh Triplett <josh@joshtriplett.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Uladzislau Rezki <urezki@gmail.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Lai Jiangshan <jiangshanlai@gmail.com>, Zqiang <qiang.zhang1211@gmail.com>, rcu@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 5, 2025 at 5:28=E2=80=AFAM Paul E. McKenney <paulmck@kernel.org=
> wrote:
>
> On Tue, Feb 04, 2025 at 08:28:29PM -0500, Joel Fernandes wrote:
> > On Tue, Feb 4, 2025 at 3:22=E2=80=AFPM Paul E. McKenney <paulmck@kernel=
.org> wrote:
> > >
> > > On Tue, Feb 04, 2025 at 10:44:45AM -0500, Joel Fernandes wrote:
> > > > On Thu, Jan 30, 2025 at 12:56=E2=80=AFAM Paul E. McKenney <paulmck@=
kernel.org> wrote:
> > > > > By "where we were initially", one might reasonably guess that you=
 meant
> > > > > that the initial value and the target are one and the same.  But =
I suspect
> > > > > that you are thinking of a third value, the value of the underlyi=
ng
> > > > > grace-period sequence number at the time of the call to rcu_seq_s=
nap().
> > > > > But you might be thinking of something else entirely.
> > > > >
> > > > > > Now we move rcu_seq_done_exact. It has the exact same behavior =
except
> > > > > > that instead of ULONG_MAX/2, the above situations are shrunk to=
 about
> > > > > > 10 counts from the target. So if target is 28, then the initial
> > > > > > sequence should have been at least 18 to avoid false-positive, =
but
> > > > > > again it is possible and I certain see in the code that it cann=
ot be
> > > > > > used this way.. (at least so far).. So all we are left with is =
the
> > > > > > false-negative band of ~2.5 GPs..
> > > > >
> > > > > Here, I have the same questions.  As you no doubt guessed.
> > > > >
> > > > > > About "what are the consequences of failing to get this right".=
  I
> > > > > > believe false-positive is unacceptable unless it is maybe debug=
 code -
> > > > > > that can break functionality in code, too short GPs and all tha=
t.
> > > > > > However false-negative is OK as long as the usecase can retry l=
ater
> > > > > > and can afford to wait. Did I get that much correct?
> > > > >
> > > > > Maybe?
> > > > >
> > > > > Please look at this on a per-use-case basis.
> > > >
> > > > Sure. FWIW, I started a world-editable document here. I am planning=
 to
> > > > work on this a bit more before our meeting this week. If others
> > > > knowledgeable like Frederic and others could make edits/comments,
> > > > that'd be welcomed. But I basically summarized this whole thread he=
re:
> > > > https://docs.google.com/document/d/1sFNuGH4U6DFCE8sunbdWMjFhJhb1aG4=
goOJAnS6c6gQ/edit?usp=3Dsharing
> > > >
> > > > My thought is (AFAICS), this patch is still valid and
> > > > rcu_seq_done_exact is a potentially better replacement to
> > > > rcu_seq_done. But famous last words...
> > >
> > > Let's start with the use case where the sequence number is being used
> > > by rcu_barrier().  What happens?
> >
> > The rcu_state.barrier_sequence is used to keep track of barrier in
> > progress, as there can be concurrent rcu_barrier() calls happening so
> > we optimize by batching multiples of these calls.
> >
> > It also handles the case where the entrain IPI came through but no
> > rcu_barrier() is currently in-flight (which would be weird but maybe
> > it happens somehow).
> >
> > It is also used to make sure we don't need to entrain on a CPU again
> > if we already did an entraining for a certain rcu_barrier() invocation
> > already. This is tracked by rdp->barrier_seq_snap which copies the
> > value of rcu_state.barrier_sequence after the entraining. Al though I
> > am currently unable to envision why the IPI handler would be called
> > unnecessarily (hardware bug?) since we hold the rcu_barrier mutex
> > throughout the rcu_barrier() function, including while waiting on
> > CPUs.
> >
> > Going back to my first point, for the rcu_seq_done() in rcu_barrier(),
> > we are checking if someone else did our work:
> >     mutex_lock(&rcu_state.barrier_mutex);
> >     /* Did someone else do our work for us? */
> >     if (rcu_seq_done(&rcu_state.barrier_sequence, s))
> >
> > Here I think rcu_seq_done_exact() is better, because if too many
> > rcu_barrier() calls concurrently made at the same time, the mutex may
> > be contended. If enough time passes and we have a wrap around, we
> > might end up in false-negative land which is much larger with
> > rcu_seq_done() than ..done_exact(). However, that does seem to be a
> > bug to begin with if the mutex contended for that long. OTOH, doing an
> > rcu_barrier() again when we didn't need to doesn't seem like the end
> > of the world especially if we contended on the mutex for that long.
> > But at least it shows that rcu_seq_done_exact() cannot seem to hurt
> > here.
> >
> > Hmmm,
>
> So...  Do we really care about the difference between rcu_seq_done()
> and rcu_seq_done_exact() in the rcu_barrier() case?

In so far as to get rid of rcu_seq_done() API in favor of using
rcu_seq_done_exact() but should not cause any functional or robustness
changes to rcu_barrier() at least, AFAICS.

thanks,

 - Joel
