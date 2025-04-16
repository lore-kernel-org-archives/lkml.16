Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C87EB2253E1
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 19:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744831579; cv=none; b=LpbPPxP2lB5umAvgB+4VUT40G2secPhRpdy6cZhYyfyu7b5Hfk33DhJ0JJN5IVKjamJjYzjhQ1oi2gE6zWFq9UH/IlUXLny/g7KdeNt6emB+pqC+8tl8NvP8ZJD8icGItnXlnoP/mhxQP5pklJFWapQTjDrEWEQkEZ8XZxf+TJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744831579; c=relaxed/simple;
	bh=X7et3RrZILIPjEpiaMiFJbrNQbSEXNJ22QaebrjkSRE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ednRTEFcSdX5P5LGKdZyEVUiJ8eZbHHc5YA3+glzRNv2OjoE+KuoTZsxxiKeZtRTjTHFSQPJEYvOEHQkWfNMI+1sZrNQmh4eMTaQAW3aFJX2qtEy/vJ6PgJZfJ7qe+DkQHfGb0F45gSOpC6/+Sspnpqe3F5bnPuobMYqSLONWS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=NLt0eJjx; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="NLt0eJjx"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2ff6b9a7f91so1134595a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 12:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1744831575; x=1745436375; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v136KPBUfeWctX821wpDfpEMmAQPlOwcQGqNHm98l1U=;
        b=NLt0eJjxnUDJGIAHToE/KqKi/UNcr4HEYUSSERKIJ9gYz4COiWidjnslmR/yPqeLlu
         17ilwaZH1KMfJqEbUKSD1TPDIz5WE0X7gAn8rxpFLESTOlc8M8WsZ90iItTBgbVxeEYh
         W7Q+pPGnMinY4u+0qjCQWlPjAg8bqbfYHXQBkS9VUhEqt5FhjH3w/LJijMRntvB7McrJ
         XIUE+H6YikwgdP/oHqsz87DlMsP5jy6wXWBfoU8Eq3KP+y1K6yaLwrVCL8BG/Hs88YOu
         YEvOQnSH9kashEu4tGrxpMx6KqBNSuBq3g8//4hgNx4+d5GD9Qcmuo7zkNsLdu4dDtz9
         dZlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744831575; x=1745436375;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v136KPBUfeWctX821wpDfpEMmAQPlOwcQGqNHm98l1U=;
        b=n23+fes084IsZKBCAiHrRreysECVwFs3HSVAD+pJ9YheGXhXzxKRjnPSs20AHI73/I
         RgkfpXgfzL5k8986r9nyb8BDMK9C4AM3a1/1P5bc+BgKjTMLwRxXi0hpMZ6DyjiIQGUT
         EXUx7fj7tbkTC8kV8yOOizXhMgVPKrjDRW+52dFslMhgXPh/x4GVuly28kvdJHSDZxVA
         rDPPUwNU6gO3cw9q+dpAB1nUicAdddLOf5klBKK1M77OQ9gX6PMwAvXpxvPNsjP2zSry
         behrjUjNqni/VMt7vxyfPDVW8D+Y8BfkX69XpgDhxrDQjZCRGjOmeA+M3Z+x6BUx1KO4
         inQQ==
X-Forwarded-Encrypted: i=1; AJvYcCWdFgSlCZimZd315uYQvBhhNsolYZ8hkgDyL8azOwn4dABPtF2oevWo+91r/L38HC0MgmXEhO4vDS0pvd4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXFkNzurxCdhgrsFPlSIMvdWmO7gxz6cWkjc/i6UK7BueXmO6l
	GSnVMaRdnCFcTdPT1wlw1vROb5sK9fzHL4mhHyyT//AmBgCwGQoVvESlx66RuI0DF/3+p1p2Ksf
	SzcP1ofnuKOXnqWaFDEUY616+DXq8tLQwiAhehg==
X-Gm-Gg: ASbGncvYrbM6x4/372Bf5xRw4d35hgKOiRN6AwKujeiNB8u231xQPkQ/zwHxmXlX8Yj
	RrHP+7aK3nscWqshQ+jHkOGfFv9upJZMv5+9xUcnVuLITYv0jlmhIezY55uqkDFDrWTvBDv1HWJ
	RRoSTV8gFbeISRrRaxfllABfUH
X-Google-Smtp-Source: AGHT+IEWpOFikRcikSR7TvWbWA+aPXr313JDMQhrjxeK3Zc0LZNWEVrrWyvYR0BbI4Yf4OlY/YcAnvQcEYvrUMh+74w=
X-Received: by 2002:a17:90b:4f8e:b0:2fe:b2ea:30f0 with SMTP id
 98e67ed59e1d1-3086efc52a8mr160501a91.4.1744831574096; Wed, 16 Apr 2025
 12:26:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250415-ublk_task_per_io-v4-0-54210b91a46f@purestorage.com> <20250415-ublk_task_per_io-v4-4-54210b91a46f@purestorage.com>
In-Reply-To: <20250415-ublk_task_per_io-v4-4-54210b91a46f@purestorage.com>
From: Caleb Sander Mateos <csander@purestorage.com>
Date: Wed, 16 Apr 2025 12:26:02 -0700
X-Gm-Features: ATxdqUGIS_mLDbTNW2Vz3yO-3QvcHH9ZRF-p-XiKlf_8vMq6XRTjMbGkMql01ds
Message-ID: <CADUfDZosV8M3YOeJ90WK3R8o5OdMN1QKJyi1J-70hh3Vj+JiTA@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] ublk: mark ublk_queue as const for ublk_handle_need_get_data
To: Uday Shankar <ushankar@purestorage.com>
Cc: Ming Lei <ming.lei@redhat.com>, Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 15, 2025 at 6:00=E2=80=AFPM Uday Shankar <ushankar@purestorage.=
com> wrote:
>
> We now allow multiple tasks to operate on I/Os belonging to the same
> queue concurrently. This means that any writes to ublk_queue in the I/O
> path are potential sources of data races. Try to prevent these by
> marking ublk_queue pointers as const in ublk_handle_need_get_data. Also
> move a bit more of the NEED_GET_DATA-specific logic into
> ublk_handle_need_get_data, to make the pattern in __ublk_ch_uring_cmd
> more uniform.
>
> Suggested-by: Ming Lei <ming.lei@redhat.com>
> Signed-off-by: Uday Shankar <ushankar@purestorage.com>
> ---
>  drivers/block/ublk_drv.c | 33 ++++++++++++++++++++-------------
>  1 file changed, 20 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/block/ublk_drv.c b/drivers/block/ublk_drv.c
> index e2cb54895481aebaa91ab23ba05cf26a950a642f..c8ce9349ca280b8b16040a124=
2a62b895ee01b5d 100644
> --- a/drivers/block/ublk_drv.c
> +++ b/drivers/block/ublk_drv.c
> @@ -1291,7 +1291,7 @@ static void ublk_cmd_tw_cb(struct io_uring_cmd *cmd=
,
>         ublk_dispatch_req(ubq, pdu->req, issue_flags);
>  }
>
> -static void ublk_queue_cmd(struct ublk_queue *ubq, struct request *rq)
> +static void ublk_queue_cmd(const struct ublk_queue *ubq, struct request =
*rq)
>  {
>         struct io_uring_cmd *cmd =3D ubq->ios[rq->tag].cmd;
>         struct ublk_uring_cmd_pdu *pdu =3D ublk_get_uring_cmd_pdu(cmd);
> @@ -1813,15 +1813,6 @@ static void ublk_mark_io_ready(struct ublk_device =
*ub, struct ublk_queue *ubq)
>         mutex_unlock(&ub->mutex);
>  }
>
> -static void ublk_handle_need_get_data(struct ublk_device *ub, int q_id,
> -               int tag)
> -{
> -       struct ublk_queue *ubq =3D ublk_get_queue(ub, q_id);
> -       struct request *req =3D blk_mq_tag_to_rq(ub->tag_set.tags[q_id], =
tag);
> -
> -       ublk_queue_cmd(ubq, req);
> -}
> -
>  static inline int ublk_check_cmd_op(u32 cmd_op)
>  {
>         u32 ioc_type =3D _IOC_TYPE(cmd_op);
> @@ -1933,6 +1924,21 @@ static int ublk_commit_and_fetch(const struct ublk=
_queue *ubq,
>         return -EIOCBQUEUED;
>  }
>
> +static int ublk_handle_need_get_data(const struct ublk_queue *ubq,
> +                                    struct ublk_io *io,
> +                                    struct io_uring_cmd *cmd,
> +                                    const struct ublksrv_io_cmd *ub_cmd,
> +                                    struct request *req)

nit: I see this is matching the name of the opcode (I am not sure why
it has "need" in its name) and there is already a function named
"ublk_need_get_data". But maybe naming this function "ublk_get_data"
would be clearer?

> +{
> +       if (!(io->flags & UBLK_IO_FLAG_OWNED_BY_SRV))
> +               return -EINVAL;
> +
> +       ublk_fill_io_cmd(io, cmd, ub_cmd->addr);
> +       ublk_queue_cmd(ubq, req);
> +
> +       return -EIOCBQUEUED;

Here too, I think a return value of 0 would be clearer.

Best,
Caleb
