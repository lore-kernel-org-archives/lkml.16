Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD5F2701BA
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 00:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745368853; cv=none; b=D0SyS8ilHkGCq/E95jdV2gjAiFWKqHEeVxh3UstdvYr+yPemdZ82qiTyxA6f7WGF6t8nAsp20a2mqU74GJfKbFQwYlq7wVxlS8mc37bZfPI/5XJcTSrPAPC/CuCzmVBIpIu0yBfEMC+QTn6Xk4inr1y81hYVa28cksIazXQ8D90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745368853; c=relaxed/simple;
	bh=Syva1iN/oMJBnZoP6XVS6eM+3t78OBSIKce4uOfivKY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AOON+drqlmN2NaFLsNQwvTj9wqrqX+10kN8NOeGp7xn2of3mRF1JeRs1MnXb79t2IuN1G6wrcC20+kzTj+zFthyxzGOkPkK11QhXLCUasuBV/F4awQpycYxYl1dv4eENygBWvR0PgT8EuOHu7S4VvHa6a3VudZimDJuFhrFzBIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=AePzWVs2; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="AePzWVs2"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2264aefc3b5so7765375ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 17:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1745368851; x=1745973651; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jlaMJGQ/nAvElMgJHvPzYsN612vvvBWvX4nIclqUR4c=;
        b=AePzWVs20YBCKT7CWxBBJQhWa3ScrT0XQqxjb8xWtyUtNsooKgO5YJDy0oaMdSlrVs
         cJTcbI+RF0J8jcOXntKd4yFRWnsrebPu9DzD+DpcAmzRv30tT4rsgq4aQlKUgpkptT2k
         N7QDI87BhMPR5x5tc1g9zO5+HSn/5M8xc2MMVYf+m47gFuE8m/JHuNwYJAQlbMTkJ8qF
         wlAWvAh9hp662upz277WwCUOiXvTfF53TNXZpbXMmB+BP2TqaZiF7VBt88NrlaktPVCi
         QxXk2Xf51vGTKODuvLqeqrIAg+bwyWI836R9MQr06wRuAq1dnvwGr8U64Xv7iJX+0YVO
         ZoMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745368851; x=1745973651;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jlaMJGQ/nAvElMgJHvPzYsN612vvvBWvX4nIclqUR4c=;
        b=YtR7zp0mtol14loPBndL2HQD7kFt84q0HnDSEaU8OYmSweSCQ6KtUjyNt+6wcIv4N1
         jH1IEBfWGcYdZnHdsUnedroJD3erKHuPdTS2U8N4ylDTW9XGTMhbIsqMleDc4u5Nx4i0
         r7oPvzG2Y5RqQYXN+I8G1sh8jva2eFt58jNj7KfbqoEqvnyHAGByv0KD4iVlh1AV5Iuu
         PczKmz5drmQIeLQQmAEfh/uVN8dnlYEILdqzfP7G7esTgtEQiXmgA0b+EEM3SlQiNPfV
         Cz8QTBDQezMRzPUpjjJTYSNiLaqw+PJGUDiZLfEe//SOJfi0yrmvoWsrKCjpHCklndEx
         IgVg==
X-Forwarded-Encrypted: i=1; AJvYcCWPumYvdcZ6D1Db9PbIX6MIM/OrDyUiEGQ6Li2RnMx8YdLn2kKNcOqdqaMsHIlX+spLjo4p42uSYfaDpjU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVpGLdRZK7UcZBu3Gang0sfpFgbuDoWPB1hPTtqqGsbz/noLM/
	NdYZhZW4SzeDuP+Q9LKulApbhnFJbjcJkFDjh50KQJYnxz8eP29VmZRHxmfQzSgkNwxtBmP1K6j
	/I5v6PRND4e1Kb/mXfNB4ofpocVfZyjMzbeFtsh9BZL+U4eFt9go=
X-Gm-Gg: ASbGncuXrbXumgMFXoH8MKRcjwEu91Dy5i9pCkdRSMzlneUmo8PI68wCbgBNYgq2nQR
	YckcGxAoFjqe2WSyq/2aXFhRuqeWmoCv7E6BRRxQpCYGQP+RyPjaAMYwoD/0IIzv8fDgCCsn8gF
	PchdvdupGB+8i058UGNYCp
X-Google-Smtp-Source: AGHT+IGJSpy7epiqldES3L6c8QjtYlkI0pJaazs49izFIq2HBHFJpQh+40j+jHPXU9QQ5d4Hor2Nbp/iL+Lgxeoel38=
X-Received: by 2002:a17:902:d4c3:b0:220:e1e6:446e with SMTP id
 d9443c01a7336-22da3011aa9mr5556345ad.1.1745368850975; Tue, 22 Apr 2025
 17:40:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250416170154.3621609-1-csander@purestorage.com> <aABFAg563W1g_4QS@fedora>
In-Reply-To: <aABFAg563W1g_4QS@fedora>
From: Caleb Sander Mateos <csander@purestorage.com>
Date: Tue, 22 Apr 2025 17:40:39 -0700
X-Gm-Features: ATxdqUG4dCfLiInXhfwaydYJoA-6CGyEwQKolnRYogRcmd98YYBUl6gNWqb20Tk
Message-ID: <CADUfDZr_HCXHnDUDf5bcOGkBqcfttzq+1qqmhFSMvyCqcF4TBQ@mail.gmail.com>
Subject: Re: [PATCH] ublk: remove unnecessary ubq checks
To: Jens Axboe <axboe@kernel.dk>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ming Lei <ming.lei@redhat.com>, Uday Shankar <ushankar@purestorage.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jens,
Would you mind queueing up this small patch for 6.16? Uday and Ming
have reviewed it.

Thanks,
Caleb

On Wed, Apr 16, 2025 at 5:02=E2=80=AFPM Ming Lei <ming.lei@redhat.com> wrot=
e:
>
> On Wed, Apr 16, 2025 at 11:01:53AM -0600, Caleb Sander Mateos wrote:
> > ublk_init_queues() ensures that all nr_hw_queues queues are initialized=
,
> > with each ublk_queue's q_id set to its index. And ublk_init_queues() is
> > called before ublk_add_chdev(), which creates the cdev. Is is therefore
> > impossible for the !ubq || ub_cmd->q_id !=3D ubq->q_id condition to hit=
 in
> > __ublk_ch_uring_cmd(). Remove it to avoids some branches in the I/O pat=
h.
> >
> > Signed-off-by: Caleb Sander Mateos <csander@purestorage.com>
> > ---
> >  drivers/block/ublk_drv.c | 3 ---
> >  1 file changed, 3 deletions(-)
> >
> > diff --git a/drivers/block/ublk_drv.c b/drivers/block/ublk_drv.c
> > index cdb1543fa4a9..bc86231f5e27 100644
> > --- a/drivers/block/ublk_drv.c
> > +++ b/drivers/block/ublk_drv.c
> > @@ -1947,13 +1947,10 @@ static int __ublk_ch_uring_cmd(struct io_uring_=
cmd *cmd,
> >
> >       if (ub_cmd->q_id >=3D ub->dev_info.nr_hw_queues)
> >               goto out;
> >
> >       ubq =3D ublk_get_queue(ub, ub_cmd->q_id);
> > -     if (!ubq || ub_cmd->q_id !=3D ubq->q_id)
> > -             goto out;
> > -
>
> Looks correct, ubq->q_id is always same with the index passed to
> ublk_get_queue().
>
> Reviewed-by: Ming Lei <ming.lei@redhat.com>
>
>
> Thanks,
> Ming
>
