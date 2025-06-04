Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com [209.85.167.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F4002882B7
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 08:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749024830; cv=none; b=hnDj0SaD9pFy11X/dHNuUjg0MVJnUKBLhWP9/KaCmbhYtuXh13nT5SFC2AN0FOczCOkrkWvkASPiacJzTzExQ6Vuqnao65/oGKsAu99FpSOBw9Xi53tLyWmoYY/8OtJqAnDoj4EkyLWsrH2fF9Zr902hsHOSQp5rYVJfEJXZduE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749024830; c=relaxed/simple;
	bh=9EuaxNn4F/P0VCc8ElrEiPrOC/ZsczRwYp+EpxBMY/g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gXdoWckVCfnFZeoxFEka/IhtVzg/7OJphZ5wH0t0co8TEBYSQ9ksWhMkYKouXHJqOAu7OzvuZ/HkBUX3SG4KfS0hSUj3l91SO5pJIZaNeZwiMXFx8U2fb5PIkhuHaP7uN3EmjWXDGWBvN0rWmh+r5FmAIHF56Ts7hwn3zHCeMm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PiHdZMQO; arc=none smtp.client-ip=209.85.167.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PiHdZMQO"
Received: by mail-lf1-f66.google.com with SMTP id 2adb3069b0e04-55220699ba8so8248398e87.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 01:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749024827; x=1749629627; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=s5jKqaMBmZ5K9NxEtrcLo8cB7aHjlOI5ttRZ4HzQ6Uw=;
        b=PiHdZMQOMxgzLOpLCSRwbuNsMg+1AtAfwiWeO5fjxqPKntnvUDHNrST4bcmcuew2sl
         2kg7qKvDbe+3Yt187MrjA7LNZczm4daTOEJdMCSpHIwM43gdzDMB/zXW92b1AgMaxgBv
         oJE9XHoke0LmUXfWGfEbK4FVGhyfJr5ZxK9r5BuuJgDwsvkKBKq041TAKkEjb0Q1GHo+
         nwuBYaaQEFFoaSmhcvnp2y4PVTnPFmdOFVmsCf8KGSm2Tpm5dSldPp2f2C9AxX1z1rRv
         bfHlE8fP8zKaHpGCkKVc6BJ08256RrkAcPWgHplucIW/IzTvHWhHX/gDIeRNSLKiLK/6
         RWgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749024827; x=1749629627;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s5jKqaMBmZ5K9NxEtrcLo8cB7aHjlOI5ttRZ4HzQ6Uw=;
        b=GsQzm2i9nAKscjm2fHSA42aA7a4KhIBfXHAjzwxu8NjozyueiRjBUm5Fe5wQbzfir/
         D5LLfzVsgV0bjSqwwncm2EuBmPhgeAGYH4+s3A5dguGtt55eBPeePb5bkTfixMmUAmuM
         pLrYeZVvommf3vZ0xNVHNR+GNyngX3AALivfdmMZO0aaRKGBh49ZHn+SFLx1AofMPnwX
         1azMqe/2QfMvgjI9J0gCdNZ3+Qlrcz5jeELuS1B+DUMtu04hQ2arOU/1KXfThofgWAKn
         AU2SFVXlUNMILvvfsNF+QnL/iwHhkAEqo1ErrejYBAWhe6BLAwptj5ANT1NmZL8HAaLk
         vL/A==
X-Forwarded-Encrypted: i=1; AJvYcCWI4EtRk6cLrGOEVgIJOjONgBJAyESjtfme71YKEM8PpLfJwImT9aAiGWnMk45QgTCOpAN5WWw8n/LOUN8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrRfAaBJuwJpzgkoOEwjGk2jgIinIhI+GIMPXS3E6/AUVoj53P
	uEOvsOZxGZu96gsbkSGhGly/2eJl8D9vNAsrTzJJsqKT8S6/I8yXPOui7VcenxJwZm3MXgwTR3D
	xjcW12/KlAScrcAiGxk44B0ifubSpJXc=
X-Gm-Gg: ASbGncv2j+hwCeu/JDaLOmVGcQBFSsnJdgNzHWpVuWZYY+vugNF3MmlCZgbYPeh+6M+
	xj2zueDUbYFAtvTAdapnX0+CaHI1UpeiorUJdPH3AuY3xw4ESUoNoMkmRKKhwrWINu41fNr0E5k
	J4pZrHufvmacRH7erx1YFvc9IpaA9Ke9pKhA==
X-Google-Smtp-Source: AGHT+IFglZOqYp/USUtZBKC/m1jE/LC+xzuUZ56Jpfv0ouaSKqPaU052xnDq6lrSVQxYpDLR/sMeX8rfkgODMroG7T8=
X-Received: by 2002:a05:6512:b1b:b0:553:2c65:f1d1 with SMTP id
 2adb3069b0e04-55356aef588mr579203e87.13.1749024826741; Wed, 04 Jun 2025
 01:13:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407134712.93062-1-hupu.gm@gmail.com> <CANDhNCosvML9XKH8HV1QBXKzxt3zMWxzsPSUfYxoyPCORf6Krw@mail.gmail.com>
 <CADHxFxS+qpmD8r1uxru+VWLj=K616=jLKbBgUR3Ed7ZBY1gidg@mail.gmail.com>
 <CANDhNCqgCGtWubkuMpn=GdfLwP6d5kMEvbhoQL4oef5yf_74ug@mail.gmail.com>
 <CANDhNCqv0iFMJanxj4uTyOHGUGxfCqb18Ku+w5y9JFKRm0M=Rg@mail.gmail.com>
 <CADHxFxQoNOBCOMDsh0iNrdD=ke=YweVZgZrTWbBQRA8SYy9McA@mail.gmail.com>
 <CADHxFxRd66FB6=wgY2-NLxqiMGZui+um+h2LUe4+hwXabdUpVg@mail.gmail.com> <CANDhNCq+xE4dpecHio2x6TJXMXxhQjrDk1oCon=NR2b+k0Y9yQ@mail.gmail.com>
In-Reply-To: <CANDhNCq+xE4dpecHio2x6TJXMXxhQjrDk1oCon=NR2b+k0Y9yQ@mail.gmail.com>
From: hupu <hupu.gm@gmail.com>
Date: Wed, 4 Jun 2025 16:13:34 +0800
X-Gm-Features: AX0GCFsKvQFOkmlaLmK2ASadm4LLnW5OqOEaE67BQ2CBM6cUt7yapygCKvtPTy8
Message-ID: <CADHxFxSVdt_oG=J=aJDfkOcYEBScUxKV=NZNUvgtkAj6sbWvGA@mail.gmail.com>
Subject: Re: [RFC 1/1] sched: Skip redundant operations for proxy tasks
 needing return migration
To: John Stultz <jstultz@google.com>
Cc: peterz@infradead.org, linux-kernel@vger.kernel.org, juri.lelli@redhat.com, 
	vschneid@redhat.com, mingo@redhat.com, vincent.guittot@linaro.org, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, hupu@transsion.com
Content-Type: text/plain; charset="UTF-8"

Hi John
Thank you for your response.

>
> This looks identical to the version above, or am I missing something?
>

I sincerely apologize for the confusion caused by my unclear
explanation. The complete patch for version 2.0 is as follows. In this
patch, I relocated the `proxy_needs_return()` check to execute after
`sched_delayed` processing but before the `wakeup_preempt()` judgment.
This optimization allows skipping redundant `wakeup_preempt()`
operations when a donor task must migrate back to its original CPU, as
it becomes unnecessary in such cases.



Subject: [RFC] sched: Skip redundant operations when donor needs return.

Move the proxy_needs_return() check earlier in ttwu_runnable()
to minimize unnecessary operations, particularly in cases
where a donor task needs to migrate back to its original CPU.

Signed-off-by: hupu <hupu.gm@gmail.com>
---
 kernel/sched/core.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 mode change 100644 => 100755 kernel/sched/core.c

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
old mode 100644
new mode 100755
index 06e9924d3f77..2c863ad53173
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -4164,6 +4164,10 @@ static int ttwu_runnable(struct task_struct *p,
int wake_flags)
  proxy_remove_from_sleeping_owner(p);
  enqueue_task(rq, p, ENQUEUE_NOCLOCK | ENQUEUE_DELAYED);
  }
+ if (proxy_needs_return(rq, p)) {
+ _trace_sched_pe_return_migration(p);
+ goto out;
+ }
  if (!task_on_cpu(rq, p)) {
  /*
  * When on_rq && !on_cpu the task is preempted, see if
@@ -4171,10 +4175,6 @@ static int ttwu_runnable(struct task_struct *p,
int wake_flags)
  */
  wakeup_preempt(rq, p, wake_flags);
  }
- if (proxy_needs_return(rq, p)) {
- _trace_sched_pe_return_migration(p);
- goto out;
- }
  ttwu_do_wakeup(p);
  ret = 1;
  }
--
2.17.1



> Hrm. Can you walk me through the specific case you're thinking about here?
>
> Is the idea something like:  a mutex blocked task (not sched_delayed)
> gets migrated to a rq, where it acts as a donor so that a lock holder
> can be run.
> If the lock holder sleeps, it might be set as sched_delayed, but the
> donor will be dequeued from the rq and enqueued onto the sched_delayed
> sleeping owner.
>
> And the concern is that in doing this, the donor's lag from the rq it
> was migrated to won't be preserved (since it isn't set as
> sched_delayed)?
>
> I'll need to think on this a bit, as I don't quite have my head around
> how mutex blocked tasks might also end up sched_delayed.
>

I need to add some debugging logs to further investigate this issue.
This may take a bit of time, and I will get back to you shortly.

Thanks.
hupu
