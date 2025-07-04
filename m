Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D64D62FE300
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 13:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751635836; cv=none; b=n2ZoJdtqKeBorNqtXEfC6ctuJBZhwD5dMjjXQ7KpeBN7zMGMsItHmbFOgxkC5R9IT4P1wXhzRkQFnOIR6sb+rI1IFPMC4dVyoGvV65vMxu2KNiqfk56QoGDVbKCXR6DX3DbPV941hZ2tebvEOHuhfk+sZ76DunaL2tYZOvYJYmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751635836; c=relaxed/simple;
	bh=6KJTPyg9FavyyZPcffQhZl5PmrN3fsq62PnGfmpzhmw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YTxU+AUjZInS/9wxlYvClNkBTCRacGomqMKnN7lWq6bZMsqePg+D1SUGh5CsOHy7Ks8Ufhqv3QGsrLowbhmhGwvQSwv5qS3740S87X6ngfgITbvEZWtV2CxBSFZUtZ1Yhvrgx7nM6HiohpB/+NU+1t13EcB1FSaEO9sKUyPHTlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=blKLZUgj; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="blKLZUgj"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3138e64fc73so181500a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 06:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1751635834; x=1752240634; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9OuIoHNns7sXRaM1bPO1h61cNT5JAFzjWi4tPy7COWQ=;
        b=blKLZUgjHZxmUipf3zKlYBB8cOIX8XtOLC5RPnFO7+Wul3lXsfKZUyM+ErcR6uS/fb
         p9s+XzYehnInQPLXty4abwwsu7sxGsqQtpXsIWBfiSQccWA6JsuVZY2hwr8eNK0FrItw
         +OVqskVu3KtnD/+58eTgBP4JOcVyuqJ3+sgSy4sS2Jyp/vUXN9DYBBUx9LGfcqb82KXU
         l07GNqlQifoqF8Nt6cy60l1fChUnxaq/DA2LBL+0xnxqFbR1GhBOx7+D70Wu8Wb6r2Eb
         RACIzzbkrdG/SHm9cYsJeILz1abHPwVe+rha/mn9Om44XCc3/0CDfNGUMYGI+FRC6+sZ
         sriQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751635834; x=1752240634;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9OuIoHNns7sXRaM1bPO1h61cNT5JAFzjWi4tPy7COWQ=;
        b=gJyEio3BBTjKVgp6hgU9DYaHwBQZft/rFu8pcruoBVZ3ZNhPCxbM9N8DCxGJO3VDO4
         RN84QG8jK4FcgoMbogHhjPH775TM/trY31hLSCUR1DrtgGj5WNxsg+Rv7znnStavjA7e
         HB8at4x2qKYLy2vq32/+M/x926y0yjDPG1NgkefBJpGOOUizpZlu/hEjl5Iy+5GCfZKO
         j0qq3VjQTdLuXWv6KIGY6ZI7Pd/h7yLO/qeh8KgO964ABk4ylbYm4FFRUHixkr/5oNJd
         rHC82LHNQeI5qLZ4cBjsWalos3/2kNINExkpyR0HB4Rnm3BxxK0DbkNWWrJMenf8NlGb
         sJBA==
X-Forwarded-Encrypted: i=1; AJvYcCWakm74IK5c2QNzA75D55wIhAQQOrpQF1fQnJDtyU4D+riKQZJ8cy/oXZvKyRy9lfybnE2hd3twlZUj8Cg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyypbn2L+aA7J3eZ5yBgbY9re1wwBsFTjbme//6XtNbUcXaKwJ4
	25va4RIDl1LVN65wQ3YRPysWL5Zbz9dleY+I4Nk9OucMnXxN8WN5GxvGItzunsUEsm5DgI/Z/k4
	cuzfV3nW7/lPH78ZdqwtbtIaOkkM/mvB7fUe1q+e6hw==
X-Gm-Gg: ASbGncsppRltt6KWMek1auEIZFh86cQ4UItpx4p5U0PLHVOlOP2RvM06vDxd5fDOJ1S
	YYy3v/wlWAtvVfgeENJgi2udeWwPFroms6doljX8RTly4v3uCyU0jZ2zRgVky5y6bTERUdNwJXp
	pO0o4JOJt1jDL19kv9k0abXR0FbfKHLG5yBwizQcLGuQ==
X-Google-Smtp-Source: AGHT+IHwuYt2meGxCPjsTKyKJX5r/H6iPran+P4kV/Mw56crza3jEFOkV8KGZv4EHHMsjSjVx23ud+wlMZvgN+zTSLE=
X-Received: by 2002:a17:90b:3a48:b0:311:e9a6:332e with SMTP id
 98e67ed59e1d1-31aacaeafb0mr1647930a91.0.1751635834029; Fri, 04 Jul 2025
 06:30:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250703-ublk_too_many_quiesce-v2-0-3527b5339eeb@purestorage.com> <20250703-ublk_too_many_quiesce-v2-2-3527b5339eeb@purestorage.com>
In-Reply-To: <20250703-ublk_too_many_quiesce-v2-2-3527b5339eeb@purestorage.com>
From: Caleb Sander Mateos <csander@purestorage.com>
Date: Fri, 4 Jul 2025 09:30:22 -0400
X-Gm-Features: Ac12FXwQzlE78Loda4q0DlP6iU3xmDaLeUCLiFUPl69-LZuHD0wllGiqI1RyMr4
Message-ID: <CADUfDZoQHneCUQyB_kS7Jdm_sN9+d+FrUFa83a0yqiw66=ui+Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] ublk: introduce and use ublk_set_canceling helper
To: Uday Shankar <ushankar@purestorage.com>
Cc: Ming Lei <ming.lei@redhat.com>, Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 4, 2025 at 1:41=E2=80=AFAM Uday Shankar <ushankar@purestorage.c=
om> wrote:
>
> For performance reasons (minimizing the number of cache lines accessed
> in the hot path), we store the "canceling" state redundantly - there is
> one flag in the device, which can be considered the source of truth, and
> per-queue copies of that flag. This redundancy can cause confusion, and
> opens the door to bugs where the state is set inconsistently. Try to
> guard against these bugs by introducing a ublk_set_canceling helper
> which is the sole mutator of both the per-device and per-queue canceling
> state. This helper always sets the state consistently. Use the helper in
> all places where we need to modify the canceling state.
>
> No functional changes are expected.
>
> Signed-off-by: Uday Shankar <ushankar@purestorage.com>
> ---
>  drivers/block/ublk_drv.c | 54 ++++++++++++++++++++++++++++++------------=
------
>  1 file changed, 34 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/block/ublk_drv.c b/drivers/block/ublk_drv.c
> index 870d57a853a481c2443337717c50d39355804f66..a1a700c7e67a72597e740aaa6=
0f5c3c73f0085e5 100644
> --- a/drivers/block/ublk_drv.c
> +++ b/drivers/block/ublk_drv.c
> @@ -1563,6 +1563,27 @@ static void ublk_put_disk(struct gendisk *disk)
>                 put_device(disk_to_dev(disk));
>  }
>
> +/*
> + * Use this function to ensure that ->canceling is consistently set for
> + * the device and all queues. Do not set these flags directly.
> + *
> + * Caller must ensure that:
> + * - cancel_mutex is held. This ensures that there is no concurrent
> + *   access to ub->canceling and no concurrent writes to ubq->canceling.
> + * - there are no concurrent reads of ubq->canceling from the queue_rq
> + *   path. This can be done by quiescing the queue, or through other
> + *   means.
> + */
> +static void ublk_set_canceling(struct ublk_device *ub, bool canceling)
> +       __must_hold(&ub->cancel_mutex)
> +{
> +       int i;
> +
> +       ub->canceling =3D canceling;
> +       for (i =3D 0; i < ub->dev_info.nr_hw_queues; i++)
> +               ublk_get_queue(ub, i)->canceling =3D canceling;
> +}
> +
>  static int ublk_ch_release(struct inode *inode, struct file *filp)
>  {
>         struct ublk_device *ub =3D filp->private_data;
> @@ -1591,13 +1612,11 @@ static int ublk_ch_release(struct inode *inode, s=
truct file *filp)
>          * All requests may be inflight, so ->canceling may not be set, s=
et
>          * it now.
>          */
> -       ub->canceling =3D true;
> -       for (i =3D 0; i < ub->dev_info.nr_hw_queues; i++) {
> -               struct ublk_queue *ubq =3D ublk_get_queue(ub, i);
> -
> -               ubq->canceling =3D true;
> -               ublk_abort_queue(ub, ubq);
> -       }
> +       mutex_lock(&ub->cancel_mutex);
> +       ublk_set_canceling(ub, true);
> +       for (i =3D 0; i < ub->dev_info.nr_hw_queues; i++)
> +               ublk_abort_queue(ub, ublk_get_queue(ub, i));
> +       mutex_unlock(&ub->cancel_mutex);

Pre-existing, but it doesn't look like the queue is quiesced yet here
(that happens later in this function).

Best,
Caleb

>         blk_mq_kick_requeue_list(disk->queue);
>
>         /*
> @@ -1723,7 +1742,6 @@ static void ublk_abort_queue(struct ublk_device *ub=
, struct ublk_queue *ubq)
>  static void ublk_start_cancel(struct ublk_device *ub)
>  {
>         struct gendisk *disk =3D ublk_get_disk(ub);
> -       int i;
>
>         /* Our disk has been dead */
>         if (!disk)
> @@ -1740,9 +1758,7 @@ static void ublk_start_cancel(struct ublk_device *u=
b)
>          * touch completed uring_cmd
>          */
>         blk_mq_quiesce_queue(disk->queue);
> -       ub->canceling =3D true;
> -       for (i =3D 0; i < ub->dev_info.nr_hw_queues; i++)
> -               ublk_get_queue(ub, i)->canceling =3D true;
> +       ublk_set_canceling(ub, true);
>         blk_mq_unquiesce_queue(disk->queue);
>  out:
>         mutex_unlock(&ub->cancel_mutex);
> @@ -1942,10 +1958,11 @@ static void ublk_reset_io_flags(struct ublk_devic=
e *ub)
>                 for (j =3D 0; j < ubq->q_depth; j++)
>                         ubq->ios[j].flags &=3D ~UBLK_IO_FLAG_CANCELED;
>                 spin_unlock(&ubq->cancel_lock);
> -               ubq->canceling =3D false;
>                 ubq->fail_io =3D false;
>         }
> -       ub->canceling =3D false;
> +       mutex_lock(&ub->cancel_mutex);
> +       ublk_set_canceling(ub, false);
> +       mutex_unlock(&ub->cancel_mutex);
>  }
>
>  /* device can only be started after all IOs are ready */
> @@ -3417,7 +3434,7 @@ static int ublk_ctrl_quiesce_dev(struct ublk_device=
 *ub,
>         /* zero means wait forever */
>         u64 timeout_ms =3D header->data[0];
>         struct gendisk *disk;
> -       int i, ret =3D -ENODEV;
> +       int ret =3D -ENODEV;
>
>         if (!(ub->dev_info.flags & UBLK_F_QUIESCE))
>                 return -EOPNOTSUPP;
> @@ -3435,14 +3452,11 @@ static int ublk_ctrl_quiesce_dev(struct ublk_devi=
ce *ub,
>                 goto put_disk;
>
>         /* Mark the device as canceling */
> +       mutex_lock(&ub->cancel_mutex);
>         blk_mq_quiesce_queue(disk->queue);
> -       ub->canceling =3D true;
> -       for (i =3D 0; i < ub->dev_info.nr_hw_queues; i++) {
> -               struct ublk_queue *ubq =3D ublk_get_queue(ub, i);
> -
> -               ubq->canceling =3D true;
> -       }
> +       ublk_set_canceling(ub, true);
>         blk_mq_unquiesce_queue(disk->queue);
> +       mutex_unlock(&ub->cancel_mutex);
>
>         if (!timeout_ms)
>                 timeout_ms =3D UINT_MAX;
>
> --
> 2.34.1
>
