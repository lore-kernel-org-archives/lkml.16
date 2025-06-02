Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE54F21CA07
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 13:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748869791; cv=none; b=Ik+xOdmtQp+mlx6MX13TUMwG01G48AJkzR4Ue/DUgr2JZ5IE3xcwMZr5fd0UmxjJCLbZYiWCjI6y3DTPhVAkv5fgJVXJWem7w5EEMM3oblMz3qMZDAVtdiq2HJTX/Tttf5mBQrrAY6cQwuHtPS4DccVecDrD0t75t+uVL6nLQ2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748869791; c=relaxed/simple;
	bh=vzGBuCdfihg9w75hcf5Ev8vk+5pHu1WmF8As3yQt7gE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WIxIK/fAKcvQcFSNrh7uF8YbMqx/I9/8mODxRTFFhqdT2/brXO5MJ7PXfB+6oz21/EVMoKXeg0vhFs0G3k3E6eJVnFDvuPE5ERZi+Cq3VIbma9zwGHl1O/eQM0NGC4bjcQK0SYF5VboJ0CQWOYaw34wMq/Cp//Zo6pt2J34u7TU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EbNA6a/I; arc=none smtp.client-ip=209.85.161.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EbNA6a/I"
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-6060167af73so2937425eaf.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 06:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748869788; x=1749474588; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r/Jz2vE9PVNcBTZfUPANqH9BqmezRo4SDyod1ybA4Vo=;
        b=EbNA6a/IbuncncrP001PINU0TraByiDw6PPFow4W4voMlvyGOvVSvMaZ0Czp5MH8RF
         pT8dmBoASQTM5EgvPi0dxF3IJoswR3sxbZ2NDfGFM1J/OmyK7seW7IXhlJ8j5bnLhYJN
         sjgA8euCtAOg/2tWXZm0cEMYkVkIIO6XZFI6psQ1ZdkKPL9MJaGOadFG7LoMzOyafId9
         VjmNGD2QybmHtbv2hon6FFX8lPiZm6k3dQyFF29LGVPKOGt/b+JHzEanPmZZTGkWdwoL
         M4/TeO5PXqcXWHJou9WBaaCNSuhcFzGuatygFhQWjpYn3QV3jSIV9lqsVPM1xoCbGGHv
         7OSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748869788; x=1749474588;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r/Jz2vE9PVNcBTZfUPANqH9BqmezRo4SDyod1ybA4Vo=;
        b=Pl6k7FW5NQcBDZ/WJcuHGPvHaLsTwRjCSX8uEUPSErBQfnEPbRsFP77FF/1GMUVJma
         mdWoPpXpBF/d2k9WvECfsipr79GXbUAuwzjZc0sT4COvDX78dD3m9cbSxfUlkMSqSrP+
         znws32z6QqU7xxJEhyVAbEy3Srh3H/s1vr4SVJhC7juTWwSqUFDQ7Q1zA2z+cbr0BqS2
         fabSjsTjrJq2lbLd8+38OEizMpSqXZdc7MDQyndJdu3Vi9MlvpRoLpNRaZGI5TYFdXw4
         PUvTqDss6WJba75O2x+WoGLBsFqzFUqcgC7oY1lG4TDV9ZkF1xL9DX375wur2iJKPwTZ
         dWUw==
X-Gm-Message-State: AOJu0YzB/vm6w0ltaMLW6cYlCSO8pv777Za4QDktNc5IKv7WoBJjHXKE
	LBkMxi3gCulk0y+QLjQnkv3NNkzNMDzVizy6A0IcvwmwCiVeTYcd5obs73iNkFF/x2f/EYqkbJF
	gI3RyRuKm5BIEJvnh5LP2sF+tgxCFL8Hudnbr5o7szutyGW0AO/O9JDo=
X-Gm-Gg: ASbGncuLtplOZsEpU2sSReXz1qoxOkDTpa3NaU0ZOLucRnMwevxI7h74ZXUzLENiM/u
	PAK9Egx67EJLHj03v7P42ElG8PRN4GSjrC5OMeqQQXYqHhHKYBa1lEvAESbO58/hD7YCKfVn8N2
	MFRKmxj36KuKwfwm5ZKG7M9z0JKCKJpwcY25HwaqkDqIxP
X-Google-Smtp-Source: AGHT+IHTjNSdjeXDfvmEB3lwO3Jgq/sm+fHVDUnof7ctPCj/IJHQJL4Bs6nWj0e4owqqx+Bh20vn5ZIiuDseUBkWHDE=
X-Received: by 2002:a05:6820:1b13:b0:60e:d57b:ecc3 with SMTP id
 006d021491bc7-60ed57c0312mr3586678eaf.0.1748869787784; Mon, 02 Jun 2025
 06:09:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250602120452.2507084-1-jens.wiklander@linaro.org>
In-Reply-To: <20250602120452.2507084-1-jens.wiklander@linaro.org>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Mon, 2 Jun 2025 15:09:35 +0200
X-Gm-Features: AX0GCFupjJsZcZO2k5M59kOiSK2QNXg0EFsJQ9rIsXUhBmuRxKZl8Nat8RoQym0
Message-ID: <CAHUa44F3a+iWYy2+uKasc7ob-6rbUojQe1GJmmVCtfWrPMTT7Q@mail.gmail.com>
Subject: Re: [PATCH] optee: ffa: fix sleep in atomic context
To: linux-kernel@vger.kernel.org, op-tee@lists.trustedfirmware.org
Cc: Jerome Forissier <jerome.forissier@linaro.org>, Sudeep Holla <sudeep.holla@arm.com>, 
	Sumit Garg <sumit.garg@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

[CC Sumit Garg <sumit.garg@kernel.org>]

Cheers,
Jens

On Mon, Jun 2, 2025 at 2:05=E2=80=AFPM Jens Wiklander <jens.wiklander@linar=
o.org> wrote:
>
> The OP-TEE driver registers the function notif_callback() for FF-A
> notifications. However, this function is called in an atomic context
> leading to errors like this when processing asynchronous notifications:
>
>  | BUG: sleeping function called from invalid context at kernel/locking/m=
utex.c:258
>  | in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid: 9, name: kworke=
r/0:0
>  | preempt_count: 1, expected: 0
>  | RCU nest depth: 0, expected: 0
>  | CPU: 0 UID: 0 PID: 9 Comm: kworker/0:0 Not tainted 6.14.0-00019-g65753=
6ebe0aa #13
>  | Hardware name: linux,dummy-virt (DT)
>  | Workqueue: ffa_pcpu_irq_notification notif_pcpu_irq_work_fn
>  | Call trace:
>  |  show_stack+0x18/0x24 (C)
>  |  dump_stack_lvl+0x78/0x90
>  |  dump_stack+0x18/0x24
>  |  __might_resched+0x114/0x170
>  |  __might_sleep+0x48/0x98
>  |  mutex_lock+0x24/0x80
>  |  optee_get_msg_arg+0x7c/0x21c
>  |  simple_call_with_arg+0x50/0xc0
>  |  optee_do_bottom_half+0x14/0x20
>  |  notif_callback+0x3c/0x48
>  |  handle_notif_callbacks+0x9c/0xe0
>  |  notif_get_and_handle+0x40/0x88
>  |  generic_exec_single+0x80/0xc0
>  |  smp_call_function_single+0xfc/0x1a0
>  |  notif_pcpu_irq_work_fn+0x2c/0x38
>  |  process_one_work+0x14c/0x2b4
>  |  worker_thread+0x2e4/0x3e0
>  |  kthread+0x13c/0x210
>  |  ret_from_fork+0x10/0x20
>
> Fix this by adding work queue to process the notification in a
> non-atomic context.
>
> Fixes: d0476a59de06 ("optee: ffa_abi: add asynchronous notifications")
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> ---
>  drivers/tee/optee/ffa_abi.c       | 41 ++++++++++++++++++++++++-------
>  drivers/tee/optee/optee_private.h |  2 ++
>  2 files changed, 34 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/tee/optee/ffa_abi.c b/drivers/tee/optee/ffa_abi.c
> index f3af5666bb11..f9ef7d94cebd 100644
> --- a/drivers/tee/optee/ffa_abi.c
> +++ b/drivers/tee/optee/ffa_abi.c
> @@ -728,12 +728,21 @@ static bool optee_ffa_exchange_caps(struct ffa_devi=
ce *ffa_dev,
>         return true;
>  }
>
> +static void notif_work_fn(struct work_struct *work)
> +{
> +       struct optee_ffa *optee_ffa =3D container_of(work, struct optee_f=
fa,
> +                                                  notif_work);
> +       struct optee *optee =3D container_of(optee_ffa, struct optee, ffa=
);
> +
> +       optee_do_bottom_half(optee->ctx);
> +}
> +
>  static void notif_callback(int notify_id, void *cb_data)
>  {
>         struct optee *optee =3D cb_data;
>
>         if (notify_id =3D=3D optee->ffa.bottom_half_value)
> -               optee_do_bottom_half(optee->ctx);
> +               queue_work(optee->ffa.notif_wq, &optee->ffa.notif_work);
>         else
>                 optee_notif_send(optee, notify_id);
>  }
> @@ -817,9 +826,11 @@ static void optee_ffa_remove(struct ffa_device *ffa_=
dev)
>         struct optee *optee =3D ffa_dev_get_drvdata(ffa_dev);
>         u32 bottom_half_id =3D optee->ffa.bottom_half_value;
>
> -       if (bottom_half_id !=3D U32_MAX)
> +       if (bottom_half_id !=3D U32_MAX) {
>                 ffa_dev->ops->notifier_ops->notify_relinquish(ffa_dev,
>                                                               bottom_half=
_id);
> +               destroy_workqueue(optee->ffa.notif_wq);
> +       }
>         optee_remove_common(optee);
>
>         mutex_destroy(&optee->ffa.mutex);
> @@ -835,6 +846,13 @@ static int optee_ffa_async_notif_init(struct ffa_dev=
ice *ffa_dev,
>         u32 notif_id =3D 0;
>         int rc;
>
> +       INIT_WORK(&optee->ffa.notif_work, notif_work_fn);
> +       optee->ffa.notif_wq =3D create_workqueue("optee_notification");
> +       if (!optee->ffa.notif_wq) {
> +               rc =3D -EINVAL;
> +               goto err;
> +       }
> +
>         while (true) {
>                 rc =3D ffa_dev->ops->notifier_ops->notify_request(ffa_dev=
,
>                                                                 is_per_vc=
pu,
> @@ -851,19 +869,24 @@ static int optee_ffa_async_notif_init(struct ffa_de=
vice *ffa_dev,
>                  * notifications in that case.
>                  */
>                 if (rc !=3D -EACCES)
> -                       return rc;
> +                       goto err_wq;
>                 notif_id++;
>                 if (notif_id >=3D OPTEE_FFA_MAX_ASYNC_NOTIF_VALUE)
> -                       return rc;
> +                       goto err_wq;
>         }
>         optee->ffa.bottom_half_value =3D notif_id;
>
>         rc =3D enable_async_notif(optee);
> -       if (rc < 0) {
> -               ffa_dev->ops->notifier_ops->notify_relinquish(ffa_dev,
> -                                                             notif_id);
> -               optee->ffa.bottom_half_value =3D U32_MAX;
> -       }
> +       if (rc < 0)
> +               goto err_rel;
> +
> +       return 0;
> +err_rel:
> +       ffa_dev->ops->notifier_ops->notify_relinquish(ffa_dev, notif_id);
> +err_wq:
> +       destroy_workqueue(optee->ffa.notif_wq);
> +err:
> +       optee->ffa.bottom_half_value =3D U32_MAX;
>
>         return rc;
>  }
> diff --git a/drivers/tee/optee/optee_private.h b/drivers/tee/optee/optee_=
private.h
> index dc0f355ef72a..9526087f0e68 100644
> --- a/drivers/tee/optee/optee_private.h
> +++ b/drivers/tee/optee/optee_private.h
> @@ -165,6 +165,8 @@ struct optee_ffa {
>         /* Serializes access to @global_ids */
>         struct mutex mutex;
>         struct rhashtable global_ids;
> +       struct workqueue_struct *notif_wq;
> +       struct work_struct notif_work;
>  };
>
>  struct optee;
> --
> 2.43.0
>
