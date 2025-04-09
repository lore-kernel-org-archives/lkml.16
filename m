Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com [209.85.208.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 204788BEA
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 06:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744181799; cv=none; b=iE98LL0GQN9NRhzyMSlMyQHHBZHN+EPAG1dewkl2tdZwuBsEN3xmzrdKux8t6KSRaXFIcAV6HETJSVydJPdd22j3PObv65J56escKeFOIuY00uxedrQ3cvqiCOn/+Z5vqb4JxwNQHOiHERBBWW+jz9rUCTPhB0EahNFzdEmAvUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744181799; c=relaxed/simple;
	bh=BjM74d3qOj4WFq/rv1u4BQwYRQzFj7HlZdsedrXiHww=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CQTleQqNhgMy76X96xaYV2+oxSdJsdn7w48woTOB/GqK6wzjl9W3XvzYBq0Gf0oRML4pWOGio3I7RIyPdy/1ADiF09M/BnjS5ehsRVx7PqoSwjAN1foDodWD80hcFomxWoNcYlJJtqX4d5NjFIQrcKc3WG6vRZ6fmnt1g6kSFyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wpo34Jty; arc=none smtp.client-ip=209.85.208.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wpo34Jty"
Received: by mail-lj1-f195.google.com with SMTP id 38308e7fff4ca-30613802a04so68642821fa.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 23:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744181796; x=1744786596; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jjIvxdAuy2MeeVy7LEAPdLmUJzVDv11s/zyfAAdCQNo=;
        b=Wpo34JtyWGMcplWmXwwVKcc/wLYBFzvXSsQ5DDwNmBEIW7dfRB4VLCkb+ssSmzQGY/
         3mGppUssr6v5ZqY0Dcpb583J12KfK4Ta17bkp675s2E9BQFzkNE1h4+65J58NqYWSqUd
         Jh6iCAi5QUxKAs0ZbL+QTbhaHQkFxuQWnMqTSSxzmw/wmzXDxhuBAyi1E+tRg1oZdARM
         o8/IJSEwJga6nnEp3Z1Uy1lOUqmBVVkNtIxfZw4ZtVcjA/A3oUKGNVcKSdQYXAiDA/o7
         xfhBiGIqBKaItANYE2Kzooz8TPXl/OIjSxDg4ap1FgAwDqmnc0zSQKC10OSFn8p2PwD3
         y5CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744181796; x=1744786596;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jjIvxdAuy2MeeVy7LEAPdLmUJzVDv11s/zyfAAdCQNo=;
        b=VTDHZ9/hRnJYnZQH5yUHgC4l2PLGgUhFfUAYsxZDPyrJuk2steyv0xK5X6qh76VbxE
         q6oViks+XgcIkl/6VF84U2qHuRE8ps7qlTJoPgnOU8AoWixIN/uhxKkVwm6JscnAiDR4
         kzoHKEYzzpyMkEAd5QhFo0hUGjI2+CZg7HyN02LtE++5tzZeQ4tXLRb5jjdiLONAc5Ur
         KysRgdIgQOB1S/nPRuwJWUYW8QSAhkQ9JnY5bYqfp7JXerTq6KYWjAm7D2PFIXmf8mH0
         EJtHjSKzldwFV1Mni6I7/sxa/W8IcInLhwSgPIPVQ44mgH6OZ+clTLFrKjnymG8YjT2y
         9x+g==
X-Forwarded-Encrypted: i=1; AJvYcCVe8JqjVyaCcxbkZO4BbUK4lXSJRtK/45La8db6hRgxdKBRuSe+/klxzxMtANqgKEh+6KXGI5sr5U9BD2U=@vger.kernel.org
X-Gm-Message-State: AOJu0YyB6qvNv0EfKl1f8CMH0WYl2wMOQFr2W5VD924ngoPGgxu7guhl
	c1tGw55jIqqrYAZeUqKh9LwxmVpxFO0pKYchuCecRFhtYVrKAo7qKk/hxVqJOiboi5o32kueKjJ
	uABReGWfACoqcpMIqJBttVV10w6A=
X-Gm-Gg: ASbGncsLLh2MhoNbFUbvdhEVOst9Nudh0ecWu9zR1NeLVQoSrqU6Puwm6clOTcEcbTx
	G/nA14+qU8K1Iti6RJBcdxmwhVVbv/gd8OQntPSX3RIBPtJagGCw8z2ENt2a0Ps7dhcR4GfgzzJ
	NpQFZgJjDer+eUTZHzmy7nlN4=
X-Google-Smtp-Source: AGHT+IH4cs0L7iaEN3ryz46jwGlpgHLEgomNPUkcsrj6VC0T34zbeunfaB5HdRA5i0a+2B7oUBa5S/o8D2ZbF+37Kz0=
X-Received: by 2002:a05:6512:1325:b0:549:8d07:ff0d with SMTP id
 2adb3069b0e04-54c437c1043mr468732e87.45.1744181795984; Tue, 08 Apr 2025
 23:56:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407134654.92841-1-hupu.gm@gmail.com> <e52847fc-8aae-4fd7-90e4-494be02e214b@linux.ibm.com>
In-Reply-To: <e52847fc-8aae-4fd7-90e4-494be02e214b@linux.ibm.com>
From: hupu <hupu.gm@gmail.com>
Date: Wed, 9 Apr 2025 14:56:23 +0800
X-Gm-Features: ATxdqUF9iCPIkMFh7UWkrGRUQMbd83I4vq-X5ZN6H_hfgRHpgIIDH3IP6GHoZqQ
Message-ID: <CADHxFxR=7nESr7_XxXKb22h7LHfX2XNxeqw86+YnOLsK1KP2BQ@mail.gmail.com>
Subject: Re: [RFC 1/1] sched: Remove unreliable wake_cpu check in proxy_needs_return
To: 20250407134654.92841-1-hupu.gm@gmail.com
Cc: jstultz@google.com, linux-kernel@vger.kernel.org, juri.lelli@redhat.com, 
	peterz@infradead.org, vschneid@redhat.com, mingo@redhat.com, 
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com, rostedt@goodmis.org, 
	bsegall@google.com, mgorman@suse.de, hupu@transsion.com, 
	Madadi Vineeth Reddy <vineethr@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Madadi Vineeth Reddy,
Thank you for your prompt review, and my sincere apologies for not
providing the repository and branch details clearly in my initial
submission. This was an oversight on my part.

The patch is based on the following repository:
https://github.com/johnstultz-work/linux-dev.git

Specifically, the changes are present in these Proxy Execution
development branches:
a) proxy-exec-WIP
b) proxy-exec-v15-WIP

The proxy_needs_return function resides in these branches as part of
the ongoing Proxy Execution feature work.
Please let me know if you need additional information or further
clarifications. Thank you again for your time and guidance.

Best regards,
hupu


Madadi Vineeth Reddy <vineethr@linux.ibm.com> =E4=BA=8E2025=E5=B9=B44=E6=9C=
=889=E6=97=A5=E5=91=A8=E4=B8=89 14:01=E5=86=99=E9=81=93=EF=BC=9A
>
> On 07/04/25 19:16, hupu wrote:
> > The (p->wake_cpu !=3D cpu_of(rq)) check in proxy_needs_return() is unsa=
fe
> > during early wakeup phase. When called via ttwu_runnable() path:
> >
> > |-- try_to_wake_up
> >     |-- ttwu_runnable
> >         |-- proxy_needs_return    //we are here
> >     |-- select_task_rq
> >     |-- set_task_cpu              //set p->wake_cpu here
> >     |-- ttwu_queue
> >
> > The p->wake_cpu at this point reflects the CPU where donor last ran bef=
ore
> > blocking, not the target migration CPU. During blocking period:
> > 1. CPU affinity may have been changed by other threads
> > 2. Proxy migrations might have altered the effective wake_cpu
> > 3. set_task_cpu() hasn't updated wake_cpu yet in this code path
> >
> > This makes the wake_cpu vs current CPU comparison meaningless and poten=
tially
> > dangerous. Rely on find_proxy_task()'s later migration logic to handle =
CPU
> > placement based on up-to-date affinity and scheduler state.
> >
> > Signed-off-by: hupu <hupu.gm@gmail.com>
> > ---
> >  kernel/sched/core.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> > index 3c4ef4c71cfd..ca4ca739eb85 100644
> > --- a/kernel/sched/core.c
> > +++ b/kernel/sched/core.c
> > @@ -4047,7 +4047,7 @@ static inline bool proxy_needs_return(struct rq *=
rq, struct task_struct *p)
> >
> >       raw_spin_lock(&p->blocked_lock);
> >       if (__get_task_blocked_on(p) && p->blocked_on_state & BO_NEEDS_RE=
TURN) {
> > -             if (!task_current(rq, p) && (p->wake_cpu !=3D cpu_of(rq))=
) {
> > +             if (!task_current(rq, p)) {
> >                       if (task_current_donor(rq, p)) {
> >                               put_prev_task(rq, p);
> >                               rq_set_donor(rq, rq->idle);
>
> Which tree is this change based on? I don't see `proxy_needs_return` in t=
ip/sched/core.
>
> Thanks,
> Madadi Vineeth Reddy
>
