Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com [209.85.208.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BDB217F7
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 14:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749135032; cv=none; b=nc+DQU7nlZDLPE9zgjBULiwPtfzvemo7QZCB6+SAnUejoekmU66h/RaJV7P2iElxlpg607B4YWD5B7degD3S5JwxcPenimHHCol9NEszgT9my+f5cxSw3i0x6JxGbF7QRqRK7UmwJHTeXRiGLLmC350HD7ZFbO9dpyIHMWjGJ1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749135032; c=relaxed/simple;
	bh=hbiKg3cwtN5sCM0Fy17oGioCff0rjC7Z2KQATEh9FYU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jPnW+Zgviywz37JPNMNlYumREeoj4ruiUDei4W1CiYLtAENkY9IVxcGLPHXWjBFOWkBQQF7mPo+4vuyGc7I/VvZ2PvOOQeAW5tq7ahBzbt1fNmGCxKVy3GUXzMcBi+SrAa/hqY0ijaEi6A20UBgo6h7LpENsLeGbFIoRkyeQGsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gdpHgNzd; arc=none smtp.client-ip=209.85.208.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gdpHgNzd"
Received: by mail-lj1-f195.google.com with SMTP id 38308e7fff4ca-32abd926858so10768791fa.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 07:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749135028; x=1749739828; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DXcFCnf7n2R48cc5e0NcAqnPZY/OJQiMh9kk3M3cHN0=;
        b=gdpHgNzdaTp9KzUeCDCf1Hsg2cutQoG/MMTVTmMayIrITNk1aVkykpkH7tzMIsm8AH
         h7dq1AdcLxBdxsw8RsQWMjL8zIJrpgQfeKCd+WrDGlBtDBXXA28TxiQDKM9mAE4//xrp
         pBd6xW+HjkjfL/ZK08vOemGcbGAUHcTshN11U93Ul4aO+HK8095SK8Qyl2R6YUi6mVTh
         6sR1Tuma+nux80q9PcFTmpDDYR1rem5kz/zyWTVZwq0TDOFHLQyWR53MCpHE7gu4p2UX
         bNyZ0xgJM4IkQX4UtuHnDmu76Nb20ucWtb7qYqVB19dZX5FD7DqtRFp0AcvcgxxjOCNd
         mS/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749135028; x=1749739828;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DXcFCnf7n2R48cc5e0NcAqnPZY/OJQiMh9kk3M3cHN0=;
        b=njxBEWortJ3POFKo8Tw1esP8zK+g73rDpjA1gKuo5GEKfs63MrNUBetWARyF7dZN0N
         LChv2bUCJjzpLTf1rh/q1vNT70relaezcJy10yMJzA2sYwqbZJEKQVQeZ1EzVX2I1yL7
         /y3LwsKc/2sUKqlba83mAOQnHaxCTtOkRS8bjC9Vi0de+ay15aL/Ybvj1b+fImhqb/u3
         Pvgma6/0g6/X1kGnN2j1q6PiV2rqItzvkp54NO8vWcvZIhCJrkWtFMzxuMMLw0O064LO
         JjLdOmtOicS1B3wINNKSB27Tg4xrzdfnZ2v4glbp22o9kPVUH3HcXdQLD/iweHWsmajr
         BisQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3gbT4zMeC5cnHlgKM8jMX7+X/O8lEbLN72bekc0MWS78VJYNn97DGhEAwrZF+axHP7d46ys+Pk8BtDXk=@vger.kernel.org
X-Gm-Message-State: AOJu0YySaid+1gHMUhAn301mSm5u3RkdYTn/pKY0wOUXQD6dbZO2JFC2
	NIc5Apn4yI63FkMyS50e5mbgvWszwt5zOq+v9ZSrH5K9mA2lSFyISmbo5J5u0LVC+gzhVEKSBSu
	a9lwe+ZW4eP98ooKDlRQwZjAU/nVM7Fs=
X-Gm-Gg: ASbGncsFSNOpEgzEYa6LekXZM8t4JDMR5JVfaQJnkUg93s7rfcJCCRYG9Aod8C34tlI
	syB0X8ul2Eg2zi64Jc12pki+KGyUBVLsIZDLFHGM5nDmzObX1Lm7WkERMfNEAfyglAS2drsIJyc
	2Z+e4j5c2ZmiL4BA1GJBe/kM0+Wi10IXDOZDMHygRr8kAj
X-Google-Smtp-Source: AGHT+IFvf9QA0gnc2+2ORmvD3v1fGNryYeaeV+dy6aCvahh0VFSmyo7Z8jh0xAE/KOpCxtydq1jefJ1ubPxTZWJWLL8=
X-Received: by 2002:a05:651c:220a:b0:32a:6b16:3a20 with SMTP id
 38308e7fff4ca-32ac79cc7cdmr25384841fa.29.1749135027840; Thu, 05 Jun 2025
 07:50:27 -0700 (PDT)
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
 <CADHxFxRd66FB6=wgY2-NLxqiMGZui+um+h2LUe4+hwXabdUpVg@mail.gmail.com>
 <CANDhNCq+xE4dpecHio2x6TJXMXxhQjrDk1oCon=NR2b+k0Y9yQ@mail.gmail.com> <CADHxFxSVdt_oG=J=aJDfkOcYEBScUxKV=NZNUvgtkAj6sbWvGA@mail.gmail.com>
In-Reply-To: <CADHxFxSVdt_oG=J=aJDfkOcYEBScUxKV=NZNUvgtkAj6sbWvGA@mail.gmail.com>
From: hupu <hupu.gm@gmail.com>
Date: Thu, 5 Jun 2025 22:50:15 +0800
X-Gm-Features: AX0GCFu9nm1NIqg552EuFlyiPOw5YIpTsIbaNJOs85v11Tv_9fUnuo81P7TTcuw
Message-ID: <CADHxFxQ8GqndiKGT2z2aUFU5qQQSU1QxQR1CrHsaa8ShrJ6D+Q@mail.gmail.com>
Subject: Re: [RFC 1/1] sched: Skip redundant operations for proxy tasks
 needing return migration
To: John Stultz <jstultz@google.com>
Cc: peterz@infradead.org, linux-kernel@vger.kernel.org, juri.lelli@redhat.com, 
	vschneid@redhat.com, mingo@redhat.com, vincent.guittot@linaro.org, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, hupu@transsion.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi John

>
> > However, there is a potential issue. Whether it is the original code
> > logic or the v2.0 patch mentioned above, directly removing a task from
> > the runqueue in proxy_needs_return undermines the fairness enforced by
> > EEVDF. In fact, clearing the task's `p->se.sched_delayed` variable
> > first (via enqueue_task(ENQUEUE_DELAYED) -> enqueue_task_fair ->
> > requeue_delayed_entity) and then removing task from the runqueue in
> > proxy_needs_return is essentially no different from directly removing
> > the task while retaining its lag. This is because the non-zero lag
> > will eventually be discarded. Therefore, regardless of the method
> > used, the fairness maintained by EEVDF will be compromised.
>
> Hrm. Can you walk me through the specific case you're thinking about here=
?
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

There may have been an issue with my earlier analysis, and I apologize
for my oversight.

During previous debugging, I noticed that when handling the
sched_delayed logic in the ttwu_runnable function, there were
instances where the donor's vlag was reset to zero. This raised
concerns for me, as I worried that directly resetting the vlag might
compromise the fairness ensured by EEVDF.

However, upon closer inspection of the code, I realized that this is
actually a normal adjustment of the vlag. The purpose of this process
is to check whether the sched_delayed task has repaid its past "debt"
and determine whether its position in the red-black tree needs to be
updated. The corresponding call stack is as follows:

ttwu_runnable
  |-- if (p->se.sched_delayed) enqueue_task(flags=3DENQUEUE_DELAYED)
      |-- enqueue_task_fair(flags=3DENQUEUE_DELAYED)
          |-- requeue_delayed_entity(se)
              |-- update_entity_lag()
                  |-- se->vlag =3D entity_lag(avg_vruntime(cfs_rq), se);

Therefore, the logic in ttwu_runnable does not compromise the fairness of E=
EVDF.


However, the above call stack gives me another idea: Executing the
sched_delayed logic seems redundant if a donor task needs to return
back. This is because the two main works in the sched_delayed logic =E2=80=
=94
"updating the vlag" and "adjusting the task's position in the
red-black tree" =E2=80=94 can be deferred to later stages, as shown in the
call stack below:

a) STEP#1: Update the donor's vlag.
b) STEP#2: Update the donor's vruntime and deadline.
c) STEP#3: Update the donor's position in the red-black tree.

try_to_wake_up
  |-- ttwu_runnable
  |   |-- proxy_needs_return
  |       |-- deactivate_task
  |           |-- dequeue_task
  |               |-- dequeue_task_fair
  |                   |-- dequeue_entities
  |                       |-- dequeue_entity
  |                           |-- update_entity_lag         (STEP #1)
  |                               |-- se->vlag =3D entity_lag()
  |
  |-- new_cpu =3D select_task_rq  //Re-select a new CPU for the donor task
  |-- ttwu_queue(p, new_cpu)
      |-- ttwu_do_activate
          |-- activate_task(flags=3DENQUEUE_WAKEUP)
              |-- __activate_task(flags=3DENQUEUE_WAKEUP)
                  |-- enqueue_task(flags=3DENQUEUE_WAKEUP)
                      |-- enqueue_task_fair(flags=3DENQUEUE_WAKEUP)
                          |-- enqueue_entity(flags=3DENQUEUE_WAKEUP)
                              |-- place_entity              (STEP #2)
                              |-- __enqueue_entity          (STEP #3)


In other words, if the donor task needs to be migrated back, the
sched_delayed logic can be skipped entirely. Therefore, the final
PATCH should be as follows.
In this PATCH, proxy_needs_return is moved ahead of the sched_delayed
logic, and the p->se.sched_delayed variable is forcefully set to 0.

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
old mode 100644
new mode 100755
index 06e9924d3f77..f585e28b19eb
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -4160,6 +4160,18 @@ static int ttwu_runnable(struct task_struct *p,
int wake_flags)
        rq =3D __task_rq_lock(p, &rf);
        if (task_on_rq_queued(p)) {
                update_rq_clock(rq);
+               if (proxy_needs_return(rq, p)) {
+                       /*
+                        * Force clear, as the work of updating the donor's=
 vlag
+                        * and its position in the red-black tree can
be deferred
+                        * to later stages.
+                        */
+                       p->se.sched_delayed =3D 0;
+
+                       _trace_sched_pe_return_migration(p);
+                       goto out;
+               }
+
                if (p->se.sched_delayed) {
                        proxy_remove_from_sleeping_owner(p);
                        enqueue_task(rq, p, ENQUEUE_NOCLOCK | ENQUEUE_DELAY=
ED);
@@ -4171,10 +4183,6 @@ static int ttwu_runnable(struct task_struct *p,
int wake_flags)
                         */
                        wakeup_preempt(rq, p, wake_flags);
                }
-               if (proxy_needs_return(rq, p)) {
-                       _trace_sched_pe_return_migration(p);
-                       goto out;
-               }
                ttwu_do_wakeup(p);
                ret =3D 1;
        }


This PATCH can boot up successfully. Furthermore, I triggered the
mutex-related test cases by executing the following command, and it
has been running for approximately 20 hours without any issues.
# while true; do echo 1 > /sys/kernel/test_ww_mutex/run_tests; sleep 10; do=
ne


Looking forward to your reply. Thanks.
hupu
