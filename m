Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F2C25F79D
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 15:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745853187; cv=none; b=VrqCn6M2jL53Vxt2dtXbyxveFQH5xD/kz/H9FO5IfBU5DvWwq6gcQULvrea6ghvao9FVJ7FzPPS6cH5Oa2PqL6EvRC2jZddiBgMxFyYmqBAKEamewT8uQBzVIX5Lx6OEsbJ9OTEJGhtUKazclojmrJJ4sTTTlur1R3tdgPV9ICA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745853187; c=relaxed/simple;
	bh=9t97CFKV4rACJktBVSdAAFmMi8vnZOYAszVcOFq/szA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FtdxJjyNu7ObUNDoIOn1HfQS/KLBK0joLT+GV7ZtPHgAsKtc8kuCx7hUuJ6RsP+o7yup4P7mU25A9b2pJkJuDYp/Sa/5lTbyYqdZOQg2JSbpCkW3zvOuLuG3tRiaFGWFV28AjVRTHoGCD2M4yU+PHqPWAx5nUiKL2oU3zCg3w+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=aBz1iSYm; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="aBz1iSYm"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-af51b57ea41so565105a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 08:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1745853184; x=1746457984; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w6D5EgZHIMdc/gfZZ8/yCt5JK/51JYrU9cgDLfIs1bQ=;
        b=aBz1iSYm2nAinOTwvbJZNCVXpzqtyGplskWtSjvFAxRHZNVs+LySGYxcIH25zLghrI
         Vir+kD5r1MzZtTWFDI3aGFUt+nCcVFVhpAs8USme2PKZHPUy63WKUNVGY7KFQ2Dp2ZhV
         UA2y9HDR41Pv7EgjEn1WV8Pr9rQDhSUGkRKAWF3Fr49FMcpp61klDQkbOPW25RryBQw/
         0evuvuFdjG4h19lpiA+8VuJAK+2K+1GJLoVs8N9UiefYfnhRHaiULUhU90lNOubaCg/U
         aEQsOxQSJQNtLs/EChFPtdje9xnqHcUZ7XBvniT8RmWnRVpPBPt8qfmn0mSQqXcQIJ8h
         WmDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745853184; x=1746457984;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w6D5EgZHIMdc/gfZZ8/yCt5JK/51JYrU9cgDLfIs1bQ=;
        b=IfuPlGtltZV6RXHCTDCjODEdV2u2isjSVB3MPveMymuQrWGX0AzoBtxtO/ZhOUxgsI
         8D4aAxL2heZEZ0+At9AF4IhAilKYprCPfgJXEyptlYtMIPBIAgB30R+aOW0cgGTrOrt3
         2ZE7rAhMmHDC1vInCAjUHw74Bdnht6S9NC0Bbi6ssKv5YowDI6PudfEVhkAUvzZPUkb1
         0Du4sCHuH9gKAo61Re9Y86jvwQX2ioDAg0WkFTL1kNjSW1V09k6yG+KK14rd0JME2Qsh
         K90dR3rvKvS5g3TdmyNXpJZLslNeEB+wAUkioSZysHLAHKtdRn6JD2n39ajTJ9LogIIN
         hddw==
X-Forwarded-Encrypted: i=1; AJvYcCWY/Nq2cMGLaSzlEDaIN9nuYMQ5ePxbtQ9SRcN84f626v0HFIgngjSM/1jFpdrjF+fr5KprICNqoMDIdPU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxuFdmy2fd54nA4cEZPzdeDQJmFUTdWMFRP/VzZwFeV6kbZ2wKY
	zpXj6wsTNDd+Gijpt30S2sYHhSsIKxyR4VXreNH0d1FyRGhA4yeegT74y4GW29vDfpbNp7x0FXE
	vltPMba3TOAdzPU5fJE2I4v544RIoQDga0FTP6Q==
X-Gm-Gg: ASbGncsG7Xw12b13bWymilEcoAzu1v+8AlmgMlUimA9EQbbTTnK7fL7p/at5SD7HYlV
	MPMLieD+4w7ymiYdPecghbUGCP+oIkPNK70aGKrcF21RzJhwMWasLxwHk5VEf0SuZg2ML0gUn6V
	Jm2lZdOopmsM0YP5qacNsaBw==
X-Google-Smtp-Source: AGHT+IElsGgyK2Ufu+rFPEsxOiI15Po+x417riW1AfSQaCP4JKx/Jfxtjnmk66ODNW+a750tGEstk3DeBMFYUawtJ74=
X-Received: by 2002:a17:90b:1c90:b0:305:5f31:6c63 with SMTP id
 98e67ed59e1d1-309f7ec9d1fmr6407335a91.6.1745853184249; Mon, 28 Apr 2025
 08:13:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250427045803.772972-1-csander@purestorage.com>
 <20250427045803.772972-6-csander@purestorage.com> <aA4rqcpC01SzUn_g@fedora> <CADUfDZpEGVLzEZJtPiScWgf6PVroQvKKhGed1cb8AJiyUr_RYg@mail.gmail.com>
In-Reply-To: <CADUfDZpEGVLzEZJtPiScWgf6PVroQvKKhGed1cb8AJiyUr_RYg@mail.gmail.com>
From: Caleb Sander Mateos <csander@purestorage.com>
Date: Mon, 28 Apr 2025 08:12:52 -0700
X-Gm-Features: ATxdqUHWv7K013iZ72EzRXMzcUVb0J6A1Zk3mvLKz4fmZFJAp6l9ML8z8-isNS4
Message-ID: <CADUfDZqqeeBTbgvCfHa8sr7Y7BetGbPzHYA1hMoN83kz+Bi54A@mail.gmail.com>
Subject: Re: [PATCH 5/8] ublk: factor out ublk_start_io() helper
To: Ming Lei <ming.lei@redhat.com>
Cc: Jens Axboe <axboe@kernel.dk>, Uday Shankar <ushankar@purestorage.com>, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 28, 2025 at 7:28=E2=80=AFAM Caleb Sander Mateos
<csander@purestorage.com> wrote:
>
> On Sun, Apr 27, 2025 at 6:05=E2=80=AFAM Ming Lei <ming.lei@redhat.com> wr=
ote:
> >
> > On Sat, Apr 26, 2025 at 10:58:00PM -0600, Caleb Sander Mateos wrote:
> > > In preparation for calling it from outside ublk_dispatch_req(), facto=
r
> > > out the code responsible for setting up an incoming ublk I/O request.
> > >
> > > Signed-off-by: Caleb Sander Mateos <csander@purestorage.com>
> > > ---
> > >  drivers/block/ublk_drv.c | 53 ++++++++++++++++++++++----------------=
--
> > >  1 file changed, 29 insertions(+), 24 deletions(-)
> > >
> > > diff --git a/drivers/block/ublk_drv.c b/drivers/block/ublk_drv.c
> > > index 01fc92051754..90a38a82f8cc 100644
> > > --- a/drivers/block/ublk_drv.c
> > > +++ b/drivers/block/ublk_drv.c
> > > @@ -1151,17 +1151,44 @@ static inline void __ublk_abort_rq(struct ubl=
k_queue *ubq,
> > >               blk_mq_requeue_request(rq, false);
> > >       else
> > >               blk_mq_end_request(rq, BLK_STS_IOERR);
> > >  }
> > >
> > > +static void ublk_start_io(struct ublk_queue *ubq, struct request *re=
q,
> > > +                       struct ublk_io *io)
> > > +{
> > > +     unsigned mapped_bytes =3D ublk_map_io(ubq, req, io);
> > > +
> > > +     /* partially mapped, update io descriptor */
> > > +     if (unlikely(mapped_bytes !=3D blk_rq_bytes(req))) {
> > > +             /*
> > > +              * Nothing mapped, retry until we succeed.
> > > +              *
> > > +              * We may never succeed in mapping any bytes here becau=
se
> > > +              * of OOM. TODO: reserve one buffer with single page pi=
nned
> > > +              * for providing forward progress guarantee.
> > > +              */
> > > +             if (unlikely(!mapped_bytes)) {
> > > +                     blk_mq_requeue_request(req, false);
> > > +                     blk_mq_delay_kick_requeue_list(req->q,
> > > +                                     UBLK_REQUEUE_DELAY_MS);
> > > +                     return;
> > > +             }
> > > +
> > > +             ublk_get_iod(ubq, req->tag)->nr_sectors =3D
> > > +                     mapped_bytes >> 9;
> > > +     }
> > > +
> > > +     ublk_init_req_ref(ubq, req);
> > > +}
> > > +
> > >  static void ublk_dispatch_req(struct ublk_queue *ubq,
> > >                             struct request *req,
> > >                             unsigned int issue_flags)
> > >  {
> > >       int tag =3D req->tag;
> > >       struct ublk_io *io =3D &ubq->ios[tag];
> > > -     unsigned int mapped_bytes;
> > >
> > >       pr_devel("%s: complete: qid %d tag %d io_flags %x addr %llx\n",
> > >                       __func__, ubq->q_id, req->tag, io->flags,
> > >                       ublk_get_iod(ubq, req->tag)->addr);
> > >
> > > @@ -1204,33 +1231,11 @@ static void ublk_dispatch_req(struct ublk_que=
ue *ubq,
> > >               pr_devel("%s: update iod->addr: qid %d tag %d io_flags =
%x addr %llx\n",
> > >                               __func__, ubq->q_id, req->tag, io->flag=
s,
> > >                               ublk_get_iod(ubq, req->tag)->addr);
> > >       }
> > >
> > > -     mapped_bytes =3D ublk_map_io(ubq, req, io);
> > > -
> > > -     /* partially mapped, update io descriptor */
> > > -     if (unlikely(mapped_bytes !=3D blk_rq_bytes(req))) {
> > > -             /*
> > > -              * Nothing mapped, retry until we succeed.
> > > -              *
> > > -              * We may never succeed in mapping any bytes here becau=
se
> > > -              * of OOM. TODO: reserve one buffer with single page pi=
nned
> > > -              * for providing forward progress guarantee.
> > > -              */
> > > -             if (unlikely(!mapped_bytes)) {
> > > -                     blk_mq_requeue_request(req, false);
> > > -                     blk_mq_delay_kick_requeue_list(req->q,
> > > -                                     UBLK_REQUEUE_DELAY_MS);
> > > -                     return;
> > > -             }
> >
> > Here it needs to break ublk_dispatch_req() for not completing the
> > uring_cmd, however ublk_start_io() can't support it.
>
> Good catch. How about I change ublk_start_io() to return a bool
> indicating whether the I/O was successfully started?

Thinking a bit more about this, is the existing behavior of returning
early from ublk_dispatch_req() correct for UBLK_IO_NEED_GET_DATA? It
makes sense for the initial ublk_dispatch_req() because the req will
be requeued without consuming the ublk fetch request, allowing it to
be reused for a subsequent I/O. But for UBLK_IO_NEED_GET_DATA, doesn't
it mean the io_uring_cmd will never complete? I would think it would
be better to return an error code in this case.

Best,
Caleb
