Received: from mail-io1-f98.google.com (mail-io1-f98.google.com [209.85.166.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8309224250
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 19:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744831572; cv=none; b=KN/DDh0C1L9V8sy0t7f67aeZ55YmgPrTz8I/OTTO6FhWzkA5mA0A/QsTXy4cULtAorLrRiitko/2PcQSP4aF7olP8CIIPqyL9fNWBGC5k26dBkXx4sPPm6xo/mzX/1AthYfuZsE9cuFMYEWMdv4RBEm9itaF0oDoYh1vAUKtb+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744831572; c=relaxed/simple;
	bh=ZlW7/Hwz68Ay2/tTvNYYRRkRnPt3zgMs2f2vYm7Uy4U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hD5FJkCSLj7KWJpa/g8WgDeCGLemuQJDM5xkNe5g3TEsZhFP71I+AZUywUP2HrxBk34a1rnU1FkXesrfTL64GOCOWf8/t7ERXL3/dc+L2PUlWaQ3GW9gSsXWu8RpD1T1g5+4sCcqQal0rf8QyUbaOSjNkGPUxy+rH5NE/WWgQJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=eKGBpmpl; arc=none smtp.client-ip=209.85.166.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="eKGBpmpl"
Received: by mail-io1-f98.google.com with SMTP id ca18e2360f4ac-861b1f04b99so1639f.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 12:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1744831569; x=1745436369; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=J2DtzzV6zkuODmWsPD3oKHQFrqSelzUOvjsGWTH2l7w=;
        b=eKGBpmplkfxl7PumIop/Zn38sMpHm2cBaJx2e2g7KRrOD2apCzNulyd5JvtZdGid16
         gamM3L2sEVgt5u6HZ7RdP2i5Bw7q75Ti6C3aQhOIYDOwTq8gVi/gxeMbohTBAipQvTTB
         l97VfF7Dno8+W9kPjEfjHTSBlgYB80LxmsIMbn+1mRiE4M8Id+Q1P0HB6to1Hrm52bIt
         y8cg90F2CL7J0TN/aEikWC3GCwGUTOF84tB4dHOdHP6uDcMetY6xRK0ak+f+3h1DELHc
         Sb39LvliETRw+X82x1GSbUH6/jBewN9T75A8ZLH+Sf5/UxRkcu0Aw2oG8TMoazdmXOg/
         9mfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744831569; x=1745436369;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J2DtzzV6zkuODmWsPD3oKHQFrqSelzUOvjsGWTH2l7w=;
        b=GV4e8mt+LcjePw6k7yEa2VLeqiSZ7Koh6NUbuV96ne6npsC8phn5c6OTlEN2H7EDVU
         jjvlzu8mp7i+kWUzWpks2aksi3EqDyWdI/vQFjPKwnrhI9rPqFoLaSfWA2/qjvSqIz+a
         xCq+M4Y8i5zo9kDjofSWxKmnwNV2j/5Atfud1NAZzC0hlwJuFhZCfu1S0icDlAqnUSr5
         TKbzmnY3Wh674yXUY4rqj1f2H/4AbBRJKNwTJ71mPM0jz+3NDYcwMm1gbtkSpPy8R8nk
         22WZJ/LQVw2XtZ9TBIcER4d7OdSGbVfmDxAJlt1o7RyXFPlJ9QsMcONR7y+Z19wdDxDV
         z1bA==
X-Forwarded-Encrypted: i=1; AJvYcCWxl5Ko/9MxV4wfauX7yPALvudYXaTHXGogIMZbaYWpwxIco0bcaOdvz/qMxSq1fadBnyi/enGLaUGaaG0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yykc5+iPZFdmBI6gg4Qi9pvYXNEQ/ma1gKwibSK7R1sfh4J1CG9
	CDA/m/+5+rdKzfSuRQzoG5QD7WDMuOVcvgpJ+0DdMUeAakwMYmrPyxU5/MnUKKbWstXC+n9i9RD
	FDjT9u8YWKncyzUJOuCv5MgJiB/6Isx3R1Xfswf7r2Fit84kE
X-Gm-Gg: ASbGncsf7R7anoRdSmZQAB/c/h4C7w9A/EpGHltkkBV+8CwjLkr5yWaa0avQG5eMGcK
	u5KOdl+wDBhqe5s4QRspGQrBffWi2fUSmcVdTGumPydYqOivTzb29/fRljy2/eWJKqmScGEfm68
	Ul9DvkggY1ixg/KrH42BdXYvsedYdQC3Oli75ZrRqc6P46/u2W24AMxl1+tvE8l3SgScYbGqVB7
	B6BnKZVWLlK/MTkg+iGou84pVDVoNqmzYxH5/ZTdElKRH6eOIeNiMnUY1ArKYajfnn7wYn6Y9Fn
	nAF1uEGXBgVXL+k9XsSIrEPAT05PR6k=
X-Google-Smtp-Source: AGHT+IGfetfEEsJY4iygOtTOVLBZexx/Kqod0n6T/FPxJF+hm71yYSPzZYncW7uyzPY4ZiRBBoJnDpNwgNEk
X-Received: by 2002:a05:6602:3e90:b0:85b:601d:dfb3 with SMTP id ca18e2360f4ac-861c5092c8bmr370434739f.5.1744831568783;
        Wed, 16 Apr 2025 12:26:08 -0700 (PDT)
Received: from c7-smtp-2023.dev.purestorage.com ([2620:125:9017:12:36:3:5:0])
        by smtp-relay.gmail.com with ESMTPS id ca18e2360f4ac-8616543bbbdsm57149739f.16.2025.04.16.12.26.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 12:26:08 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-ushankar.dev.purestorage.com (dev-ushankar.dev.purestorage.com [IPv6:2620:125:9007:640:7:70:36:0])
	by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id DB35E34035E;
	Wed, 16 Apr 2025 13:26:07 -0600 (MDT)
Received: by dev-ushankar.dev.purestorage.com (Postfix, from userid 1557716368)
	id D212EE40318; Wed, 16 Apr 2025 13:26:07 -0600 (MDT)
Date: Wed, 16 Apr 2025 13:26:07 -0600
From: Uday Shankar <ushankar@purestorage.com>
To: Caleb Sander Mateos <csander@purestorage.com>
Cc: Ming Lei <ming.lei@redhat.com>, Jens Axboe <axboe@kernel.dk>,
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/4] ublk: require unique task per io instead of
 unique task per hctx
Message-ID: <aAAET5OyD76Qdx7B@dev-ushankar.dev.purestorage.com>
References: <20250415-ublk_task_per_io-v4-0-54210b91a46f@purestorage.com>
 <20250415-ublk_task_per_io-v4-1-54210b91a46f@purestorage.com>
 <CADUfDZq+0H6nZ1vtw-URN_FbbU-Vkp8sXK_HKZpoXegAsT9_Pg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADUfDZq+0H6nZ1vtw-URN_FbbU-Vkp8sXK_HKZpoXegAsT9_Pg@mail.gmail.com>

On Wed, Apr 16, 2025 at 11:48:45AM -0700, Caleb Sander Mateos wrote:
> On Tue, Apr 15, 2025 at 6:00 PM Uday Shankar <ushankar@purestorage.com> wrote:
> >
> > Currently, ublk_drv associates to each hardware queue (hctx) a unique
> > task (called the queue's ubq_daemon) which is allowed to issue
> > COMMIT_AND_FETCH commands against the hctx. If any other task attempts
> > to do so, the command fails immediately with EINVAL. When considered
> > together with the block layer architecture, the result is that for each
> > CPU C on the system, there is a unique ublk server thread which is
> > allowed to handle I/O submitted on CPU C. This can lead to suboptimal
> > performance under imbalanced load generation. For an extreme example,
> > suppose all the load is generated on CPUs mapping to a single ublk
> > server thread. Then that thread may be fully utilized and become the
> > bottleneck in the system, while other ublk server threads are totally
> > idle.
> >
> > This issue can also be addressed directly in the ublk server without
> > kernel support by having threads dequeue I/Os and pass them around to
> > ensure even load. But this solution requires inter-thread communication
> > at least twice for each I/O (submission and completion), which is
> > generally a bad pattern for performance. The problem gets even worse
> > with zero copy, as more inter-thread communication would be required to
> > have the buffer register/unregister calls to come from the correct
> > thread.
> >
> > Therefore, address this issue in ublk_drv by requiring a unique task per
> > I/O instead of per queue/hctx. Imbalanced load can then be balanced
> > across all ublk server threads by having threads issue FETCH_REQs in a
> > round-robin manner. As a small toy example, consider a system with a
> > single ublk device having 2 queues, each of queue depth 4. A ublk server
> > having 4 threads could issue its FETCH_REQs against this device as
> > follows (where each entry is the qid,tag pair that the FETCH_REQ
> > targets):
> >
> > poller thread:  T0      T1      T2      T3
> >                 0,0     0,1     0,2     0,3
> >                 1,3     1,0     1,1     1,2
> >
> > Since tags appear to be allocated in sequential chunks, this setup
> > provides a rough approximation to distributing I/Os round-robin across
> > all ublk server threads, while letting I/Os stay fully thread-local.
> >
> > Signed-off-by: Uday Shankar <ushankar@purestorage.com>
> > Reviewed-by: Caleb Sander Mateos <csander@purestorage.com>
> > ---
> >  drivers/block/ublk_drv.c | 75 ++++++++++++++++++++++--------------------------
> >  1 file changed, 34 insertions(+), 41 deletions(-)
> >
> > diff --git a/drivers/block/ublk_drv.c b/drivers/block/ublk_drv.c
> > index cdb1543fa4a9817aa2ca2fca66720f589cf222be..9a0d2547512fc8119460739230599d48d2c2a306 100644
> > --- a/drivers/block/ublk_drv.c
> > +++ b/drivers/block/ublk_drv.c
> > @@ -150,6 +150,7 @@ struct ublk_io {
> >         int res;
> >
> >         struct io_uring_cmd *cmd;
> > +       struct task_struct *task;
> >  };
> >
> >  struct ublk_queue {
> > @@ -157,11 +158,9 @@ struct ublk_queue {
> >         int q_depth;
> >
> >         unsigned long flags;
> > -       struct task_struct      *ubq_daemon;
> >         struct ublksrv_io_desc *io_cmd_buf;
> >
> >         bool force_abort;
> > -       bool timeout;
> >         bool canceling;
> >         bool fail_io; /* copy of dev->state == UBLK_S_DEV_FAIL_IO */
> >         unsigned short nr_io_ready;     /* how many ios setup */
> > @@ -1072,11 +1071,6 @@ static inline struct ublk_uring_cmd_pdu *ublk_get_uring_cmd_pdu(
> >         return io_uring_cmd_to_pdu(ioucmd, struct ublk_uring_cmd_pdu);
> >  }
> >
> > -static inline bool ubq_daemon_is_dying(struct ublk_queue *ubq)
> > -{
> > -       return ubq->ubq_daemon->flags & PF_EXITING;
> > -}
> > -
> >  /* todo: handle partial completion */
> >  static inline void __ublk_complete_rq(struct request *req)
> >  {
> > @@ -1224,13 +1218,13 @@ static void ublk_dispatch_req(struct ublk_queue *ubq,
> >         /*
> >          * Task is exiting if either:
> >          *
> > -        * (1) current != ubq_daemon.
> > +        * (1) current != io->task.
> >          * io_uring_cmd_complete_in_task() tries to run task_work
> > -        * in a workqueue if ubq_daemon(cmd's task) is PF_EXITING.
> > +        * in a workqueue if cmd's task is PF_EXITING.
> >          *
> >          * (2) current->flags & PF_EXITING.
> >          */
> > -       if (unlikely(current != ubq->ubq_daemon || current->flags & PF_EXITING)) {
> > +       if (unlikely(current != io->task || current->flags & PF_EXITING)) {
> >                 __ublk_abort_rq(ubq, req);
> >                 return;
> >         }
> > @@ -1336,23 +1330,20 @@ static void ublk_queue_cmd_list(struct ublk_queue *ubq, struct rq_list *l)
> >  static enum blk_eh_timer_return ublk_timeout(struct request *rq)
> >  {
> >         struct ublk_queue *ubq = rq->mq_hctx->driver_data;
> > +       struct ublk_io *io = &ubq->ios[rq->tag];
> >         unsigned int nr_inflight = 0;
> >         int i;
> >
> >         if (ubq->flags & UBLK_F_UNPRIVILEGED_DEV) {
> > -               if (!ubq->timeout) {
> > -                       send_sig(SIGKILL, ubq->ubq_daemon, 0);
> > -                       ubq->timeout = true;
> > -               }
> > -
> > +               send_sig(SIGKILL, io->task, 0);
> >                 return BLK_EH_DONE;
> >         }
> >
> > -       if (!ubq_daemon_is_dying(ubq))
> > +       if (!(io->task->flags & PF_EXITING))
> >                 return BLK_EH_RESET_TIMER;
> >
> >         for (i = 0; i < ubq->q_depth; i++) {
> > -               struct ublk_io *io = &ubq->ios[i];
> > +               io = &ubq->ios[i];
> >
> >                 if (!(io->flags & UBLK_IO_FLAG_ACTIVE))
> >                         nr_inflight++;
> > @@ -1552,8 +1543,8 @@ static void ublk_commit_completion(struct ublk_device *ub,
> >  }
> >
> >  /*
> > - * Called from ubq_daemon context via cancel fn, meantime quiesce ublk
> > - * blk-mq queue, so we are called exclusively with blk-mq and ubq_daemon
> > + * Called from io task context via cancel fn, meantime quiesce ublk
> > + * blk-mq queue, so we are called exclusively with blk-mq and io task
> >   * context, so everything is serialized.
> >   */
> >  static void ublk_abort_queue(struct ublk_device *ub, struct ublk_queue *ubq)
> > @@ -1669,13 +1660,13 @@ static void ublk_uring_cmd_cancel_fn(struct io_uring_cmd *cmd,
> >                 return;
> >
> >         task = io_uring_cmd_get_task(cmd);
> > -       if (WARN_ON_ONCE(task && task != ubq->ubq_daemon))
> > +       io = &ubq->ios[pdu->tag];
> > +       if (WARN_ON_ONCE(task && task != io->task))
> >                 return;
> >
> >         ub = ubq->dev;
> >         need_schedule = ublk_abort_requests(ub, ubq);
> >
> > -       io = &ubq->ios[pdu->tag];
> >         WARN_ON_ONCE(io->cmd != cmd);
> >         ublk_cancel_cmd(ubq, io, issue_flags);
> >
> > @@ -1836,8 +1827,6 @@ static void ublk_mark_io_ready(struct ublk_device *ub, struct ublk_queue *ubq)
> >         mutex_lock(&ub->mutex);
> >         ubq->nr_io_ready++;
> >         if (ublk_queue_ready(ubq)) {
> > -               ubq->ubq_daemon = current;
> > -               get_task_struct(ubq->ubq_daemon);
> >                 ub->nr_queues_ready++;
> >
> >                 if (capable(CAP_SYS_ADMIN))
> > @@ -1952,14 +1941,14 @@ static int __ublk_ch_uring_cmd(struct io_uring_cmd *cmd,
> >         if (!ubq || ub_cmd->q_id != ubq->q_id)
> >                 goto out;
> >
> > -       if (ubq->ubq_daemon && ubq->ubq_daemon != current)
> > -               goto out;
> > -
> >         if (tag >= ubq->q_depth)
> >                 goto out;
> >
> >         io = &ubq->ios[tag];
> >
> > +       if (io->task && io->task != current)
> > +               goto out;
> > +
> >         /* there is pending io cmd, something must be wrong */
> >         if (io->flags & UBLK_IO_FLAG_ACTIVE) {
> >                 ret = -EBUSY;
> > @@ -2012,6 +2001,7 @@ static int __ublk_ch_uring_cmd(struct io_uring_cmd *cmd,
> >
> >                 ublk_fill_io_cmd(io, cmd, ub_cmd->addr);
> >                 ublk_mark_io_ready(ub, ubq);
> > +               io->task = get_task_struct(current);
> 
> Should io->task be set before ublk_mark_io_ready()? I worry that once
> the ublk device is marked ready, it may be assumed that io->task is
> constant.

Not sure if we're dependent on that assumption anywhere, but it does
make sense. I'll move it.

I also think we might need to set atomically here, and read atomically
at the top of __ublk_ch_uring_cmd, as I can't see anything preventing
those accesses from being concurrent.

