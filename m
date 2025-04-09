Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B2B21ABA0
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 23:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744241739; cv=none; b=nd0xz0BLdlozDt18IXHmZKsXb5+UAhLYF/KVHM4U70d6jt59z+9+TzaxZfgoUvIVcbhNbhxQ9tnzVmg/MRh4eH2DOOEBWYyCJ5msbdQa4fhc6Zg3xfNyqvsPKAFd5A8IDnT4Jwz3gyFcFQpTlo+GvHYklMfR+KCUiHxmE8m3o/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744241739; c=relaxed/simple;
	bh=WdYuCOeD4SMA1IL4hLLCZE7Ua1W39J9lLIdtEDxryJY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bSrPc8o8qgVe0y+TPMVJg8evDo1wDMgCJuItUJNMzDTE9TGIcipxL2LJVhp6w1U+8v2q4XvWLEjWxhKI3gTbArHGyeEa1GaEVbOfCYjNX3ZSOx13NoZTZ0juGF6k3Pz++ZTviUEJWYJdayhlJvWhn1xvOmLBSwHRUBfiZVaRjfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wnPBW3Vj; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wnPBW3Vj"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-30db1bc464dso2027511fa.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 16:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744241735; x=1744846535; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j+bh+lqxAi15Sw7UB9yBtSHuH8GSNWA87/qr/kod/AE=;
        b=wnPBW3VjrwGKrwb/Aa/Nm6yh2fskydtUWT4cDBdYzU4dE072khgW1lD7PbGuXVPJTn
         Ju7MZX+MUApHvLKJUR9ekUC4v9Pt7YudxB65/d/gQWZgNEbMDt2IeOzh/tyMdOvKUkth
         I2OlX9URDQg5BbtI7DtccHkaHdAS/+OAzP6Ot5yT70WNHoXsFe0aZOSQNGn8CuU+zknz
         W8QHjcV8MhV93UI9q3LsEzW1SmXVlhj+mJID6v/GCKl57mub68xgKCX67j0fIEtxb6EB
         oldnezy3Kkg26xGxE8xlNUEckGLzB9W1EwzH5NIx1fx1rC1CFXN2FIQEIzpJi6shAqpx
         oWRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744241735; x=1744846535;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j+bh+lqxAi15Sw7UB9yBtSHuH8GSNWA87/qr/kod/AE=;
        b=cm9nCm1wGRDgkPDCDvT7VGBv5WOlnYljD3LtGzrhAv392JGh5EeaMaN2dKDgy6YyRZ
         FzrXA7PQFRDfhlv2oizHoDka8wIfAVbNvl3W23VQrn3OVFo3bPQwi/oMYBQhKBSOz9Uk
         fx60Pu9rsdzWDi7WsFOet1zY0bswAZB2tH83MU3hJsrYRZeTV11IXHrSaR5/7sqNSwMs
         ehH+8c8SGHOwXn3AwycTnGarTh5dIbmbwKLIFYBugFlJlJ9VZOnGURzE0OLvUT1edruL
         qlhf4gk1URv6EutIdzjeEEUDwq3jE/v1FM9kivvW7abpQCJpaJaFLuz0xz1tMdNe/6Sn
         pYkw==
X-Gm-Message-State: AOJu0YwB8ixUH5PHxkBlBxYAGWju+yy72+rHNMA3zoB6H6yJMkZmRBzT
	aH79kWnwFl6Kkvkbj6MKglSsr0HNGV3UmOPCmsoRH7/HUoElyMAXJBbFSNQLCZQUkP9iRZwu1i2
	U6UpI7y/LAEs1+LpRi2oyU7A+kfUOVgKUrtU=
X-Gm-Gg: ASbGncvFgEeGBLvzuMJ1q9FNtZp57NMP6G/hbMtQGJQ3CMeioH5OlybzIwYkLIIyMM4
	ARM2CFNGCPwLhtCn6posxYJh7bWhnDskZTsieLgzo1EYnOG0AcOWRej9z0Ydfz+/2HWJGDxvdFr
	XwOaovirdsRflRyIpe2MCxDlet/dLdWCHEYWTCN8L2Z599z0kEWIa26y2JOGEn
X-Google-Smtp-Source: AGHT+IG3WlX1BIfrnMPIBrTgMc4sHiDnxlaGvNmZFR4kutLMAbqujyeGclcUUANjmUNxkmMYWoqgWH7Iiad+qwqjEEc=
X-Received: by 2002:a05:651c:199f:b0:30b:c3ce:ea1f with SMTP id
 38308e7fff4ca-30facc05426mr2255251fa.15.1744241735334; Wed, 09 Apr 2025
 16:35:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407134654.92841-1-hupu.gm@gmail.com>
In-Reply-To: <20250407134654.92841-1-hupu.gm@gmail.com>
From: John Stultz <jstultz@google.com>
Date: Wed, 9 Apr 2025 16:35:22 -0700
X-Gm-Features: ATxdqUHf5yRKw1nIO9jt9y2jXjKEwmnGnG60rBKF-UXJxDX-IbFHG900Wh8_fU4
Message-ID: <CANDhNCptjorLthhgMBLLCCYsk5MJT73Daj+usFPWNenpgYTF4A@mail.gmail.com>
Subject: Re: [RFC 1/1] sched: Remove unreliable wake_cpu check in proxy_needs_return
To: hupu <hupu.gm@gmail.com>
Cc: linux-kernel@vger.kernel.org, juri.lelli@redhat.com, peterz@infradead.org, 
	vschneid@redhat.com, mingo@redhat.com, vincent.guittot@linaro.org, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, hupu@transsion.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hey hupu!
  Thanks so much for taking the time to review the full proxy patch
series and to submit this change!

On Mon, Apr 7, 2025 at 6:47=E2=80=AFAM hupu <hupu.gm@gmail.com> wrote:
>
> The (p->wake_cpu !=3D cpu_of(rq)) check in proxy_needs_return() is unsafe
> during early wakeup phase. When called via ttwu_runnable() path:
>
> |-- try_to_wake_up
>     |-- ttwu_runnable
>         |-- proxy_needs_return    //we are here
>     |-- select_task_rq
>     |-- set_task_cpu              //set p->wake_cpu here
>     |-- ttwu_queue
>
> The p->wake_cpu at this point reflects the CPU where donor last ran befor=
e
> blocking, not the target migration CPU. During blocking period:
> 1. CPU affinity may have been changed by other threads
> 2. Proxy migrations might have altered the effective wake_cpu
> 3. set_task_cpu() hasn't updated wake_cpu yet in this code path

A few nits here:
1) We do reassign wake_cpu __set_cpus_allowed_ptr_locked() if necessary.
2) Proxy migrations use proxy_set_task_cpu() which preserve the wake_cpu

And I'm not sure I quite understand the concern of #3 above. Could you
clarify further?

> This makes the wake_cpu vs current CPU comparison meaningless and potenti=
ally
> dangerous. Rely on find_proxy_task()'s later migration logic to handle CP=
U
> placement based on up-to-date affinity and scheduler state.

The task_cpu serialization rules are a bit more subtle then I'd like,
so I'll grant there likely could be bugs lurking there, but I'm not
totally sure I understand the case you're thinking of here.

As you noted, in proxy_needs_return() we use the wake_cpu to tell us
if the task is still on the rq where it was blocked,  with the hope
that we can short-cut the deactiave&wakeup logic and instead just mark
it BO_RUNNABLE and return from ttwu.

I'm not sure how the "find_proxy_task()'s later migration logic" gets
involved here. Instead, it seems your change would just force it so we
always do the deactivate&wakeup (still using the task->wake_cpu as the
guide for select_task_rq()).

This would be a more conservative approach, since select_task_rq would
handle finding an appropriate rq if wake_cpu was not correct, so I
don't disagree with your suggestion. In fact, in getting the v16
series ready, I've reworked the find_proxy_tasks()'s "need_return:"
logic to do the deactivate/wakeup step because otherwise I was hitting
cases where we would try to do the manual return-migration off to a
offline cpu during cpu-hotplug testing.  So a similar approach might
be helpful here to avoid wakeups on offlined cpus (though I need to
look a bit more at the cpu hotplug code to understand how we'd hit the
task->on_rq case and have task_cpu() return an offlined rq).

But I'm a little hesitant to drop the optimization, so if you have a
more specific case that would be problematic, I'd appreciate you
sharing.

thanks
-john
