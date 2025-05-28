Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 907D12750E8
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 15:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748446495; cv=none; b=hbzdXpq1y/Ew+r6UIz8AyhP5Qi4lAdYElnP/o5+BwTdVXm4wAzFHLRkPT336AtpCzRHD1snyD4Goj8CDyx6XrLfzqqSGGPGRR5/CgS8GyPxsQsFHA4XIJjuQ8CQOhfB88o3/NhQ2a0ohwmTZywBjZf98nL+WOuDMhCQQdscLAD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748446495; c=relaxed/simple;
	bh=mikzw4toSN1swSWNdXFzo0SE3gTGHLICqxogeMp6Kyk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P5N62xdiBi1YwHjA06Vhz7KCwZBmtxEGlUu91qkMm8GYGJqWiu1KHJu4pcO4HRLOZsPiPnWMa2wjCpiW/Lx/zpxWv7kaj7NTISBEYl2dtpsRywLX9DoB2eIQhbQSwaezu3VIXus8+KTgTZaNzY1S2JCt5QNL/XUmHHrUIgqKVls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nwl+nMdJ; arc=none smtp.client-ip=209.85.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nwl+nMdJ"
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-60658e1fedfso1869521eaf.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 08:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748446492; x=1749051292; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q37W/QCIajIBqdwlX8JxBJ+RS4ZcUOJmjX4FthbBh28=;
        b=nwl+nMdJXYoYtwlqqtaEfDTrcTwg5/4P/QTn4fWq8DAHMaZJHomLYtYLQNrjwGoalY
         wURizpiIulyKOs+sL/D1/HW9hfu93cIafAK5NjmmcUK6Srv9LRkpqS6JLmj/gD4NSRjm
         sf6OQCc0HmHgR6kFLyvcE9mtr9OKlFNv4A1wudd3HhFN1r17lmHQJyTxpY1U8k/pitB7
         UzgXoVkMSWU3F+um4ODddCjAcCLUsKZhJLFvLQaElj+FSQZBkZWnVmC332pX1HNYinfD
         5LLvi4+2AdGihGvuK8KA0zEHq7qu56muFtkS7vObPGm2q8V2htpi5VlhZ6dMMxLCobfK
         25zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748446492; x=1749051292;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q37W/QCIajIBqdwlX8JxBJ+RS4ZcUOJmjX4FthbBh28=;
        b=jGhSBdgmEngx3mixHfbV6bPZj6W1NeMdItOqjzg10NSKuWC4UZovOug3RiLHJw9DLG
         Y/XNp2FgGlRFnMC4zKBUKY9T/lIySUnTG6cHVt6vMTqqKazaXVWISTCRihi+Awj66uoi
         erViL/tLOTzKq0LlzCAAcarE/mtCd+xiVLTmVM7UjBR5U5sYf0XJaQS/QJIEBClJt64x
         9PEwcufBrzxFJl+9CIwUL2W+sfXfG5yefB6cwNGnIYqxc/NIdlsCkZGdbiJEzHIUxMVy
         Z6diTGMgVJrRZeV7Nii6g3jEKdBHUGjaHh47Gnbe+mpz1WZ1HJq9nGjAnzqjNpR5n+Qs
         ecjg==
X-Forwarded-Encrypted: i=1; AJvYcCX+EcsDq4wcrwXrEQeWCQee7EnQdPmvkvLW7LgCqz/LHUdpFCcAGr7cBadic2qVzY4I7eTi4oh9u6lLWAs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxg20D/sKmrG46VAsivbSUIPetQqVER8jXqLg4OZ9ES4HIuM2Fq
	nx1JrumfsAlhJToFFeSj3NVQOiZ59WauoKbpwjvNE6kYhoI0Y3Vlzy6MyppB8DIsZhdNU74eGS1
	P+5m2/sS4Wi9c3UAMqvrlbx0vo5SYaKgMTu2yZtWNyQ==
X-Gm-Gg: ASbGncsOmJjPb/JzS1Z9XSN5vnleAqD15m2v/TXeN/2hkLEq2e6DKeWkgIpLrNPQaVZ
	ldyDNEAkGgiqtilqhNIjRSPD9tFfcILn+vY/GnnxMtCYcQjfnOgKGtIGED1c9fNFGVYsiHNXqLK
	mg8EK4VaNVzzu5GMXRK4oLbt2fyCAWLY6GdA==
X-Google-Smtp-Source: AGHT+IFUSKRJvzUK9Z26xs3uZ3t0I6t2CrJeTGXb8XUjdm5/FKiOx1YWjR4XQGbv++oHvpCQjLQB6sfRAHvl2IeOCSU=
X-Received: by 2002:a05:6820:4c8a:b0:60b:cd81:9079 with SMTP id
 006d021491bc7-60bd9b5db35mr1257707eaf.5.1748446492453; Wed, 28 May 2025
 08:34:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250528-ffa_notif_fix-v1-0-5ed7bc7f8437@arm.com> <20250528-ffa_notif_fix-v1-3-5ed7bc7f8437@arm.com>
In-Reply-To: <20250528-ffa_notif_fix-v1-3-5ed7bc7f8437@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Wed, 28 May 2025 17:34:40 +0200
X-Gm-Features: AX0GCFs-yLHQEJ9iEAsL75ibAAqIeyrWnzKLxzwLIDc74kts0liswYeErWZvhTY
Message-ID: <CAHUa44HRsYUV8U-jBYvhsPoLNizXamxYK+Th+O4ZJ2VpRQ9A7A@mail.gmail.com>
Subject: Re: [PATCH 3/3] firmware: arm_ffa: Replace mutex with rwlock to avoid
 sleep in atomic context
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	=?UTF-8?B?SsOpcsO0bWUgRm9yaXNzaWVy?= <jerome.forissier@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 28, 2025 at 10:50=E2=80=AFAM Sudeep Holla <sudeep.holla@arm.com=
> wrote:
>
> The current use of a mutex to protect the notifier hashtable accesses
> can lead to issues in the atomic context. It results in the below
> kernel warnings:
>
>   |  BUG: sleeping function called from invalid context at kernel/locking=
/mutex.c:258
>   |  in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid: 9, name: kwor=
ker/0:0
>   |  preempt_count: 1, expected: 0
>   |  RCU nest depth: 0, expected: 0
>   |  CPU: 0 UID: 0 PID: 9 Comm: kworker/0:0 Not tainted 6.14.0 #4
>   |  Workqueue: ffa_pcpu_irq_notification notif_pcpu_irq_work_fn
>   |  Call trace:
>   |   show_stack+0x18/0x24 (C)
>   |   dump_stack_lvl+0x78/0x90
>   |   dump_stack+0x18/0x24
>   |   __might_resched+0x114/0x170
>   |   __might_sleep+0x48/0x98
>   |   mutex_lock+0x24/0x80
>   |   handle_notif_callbacks+0x54/0xe0
>   |   notif_get_and_handle+0x40/0x88
>   |   generic_exec_single+0x80/0xc0
>   |   smp_call_function_single+0xfc/0x1a0
>   |   notif_pcpu_irq_work_fn+0x2c/0x38
>   |   process_one_work+0x14c/0x2b4
>   |   worker_thread+0x2e4/0x3e0
>   |   kthread+0x13c/0x210
>   |   ret_from_fork+0x10/0x20
>
> To address this, replace the mutex with an rwlock to protect the notifier
> hashtable accesses. This ensures that read-side locking does not sleep an=
d
> multiple readers can acquire the lock concurrently, avoiding unnecessary
> contention and potential deadlocks. Writer access remains exclusive,
> preserving correctness.
>
> This change resolves warnings from lockdep about potential sleep in
> atomic context.
>
> Cc: Jens Wiklander <jens.wiklander@linaro.org>
> Reported-by: J=C3=A9r=C3=B4me Forissier <jerome.forissier@linaro.org>
> Closes: https://github.com/OP-TEE/optee_os/issues/7394
> Fixes: e0573444edbf ("firmware: arm_ffa: Add interfaces to request notifi=
cation callbacks")
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> ---
>  drivers/firmware/arm_ffa/driver.c | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)

Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>
Tested-by: Jens Wiklander <jens.wiklander@linaro.org>

Cheers,
Jens

>
> diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa=
/driver.c
> index 44eecb786e67b205161e2d48602e1f1b53533360..37eb2e6c2f9f4d30831b7bf6c=
e5142a39a19f50c 100644
> --- a/drivers/firmware/arm_ffa/driver.c
> +++ b/drivers/firmware/arm_ffa/driver.c
> @@ -110,7 +110,7 @@ struct ffa_drv_info {
>         struct work_struct sched_recv_irq_work;
>         struct xarray partition_info;
>         DECLARE_HASHTABLE(notifier_hash, ilog2(FFA_MAX_NOTIFICATIONS));
> -       struct mutex notify_lock; /* lock to protect notifier hashtable  =
*/
> +       rwlock_t notify_lock; /* lock to protect notifier hashtable  */
>  };
>
>  static struct ffa_drv_info *drv_info;
> @@ -1289,19 +1289,19 @@ static int __ffa_notify_relinquish(struct ffa_dev=
ice *dev, int notify_id,
>         if (notify_id >=3D FFA_MAX_NOTIFICATIONS)
>                 return -EINVAL;
>
> -       mutex_lock(&drv_info->notify_lock);
> +       write_lock(&drv_info->notify_lock);
>
>         rc =3D update_notifier_cb(dev, notify_id, NULL, is_framework);
>         if (rc) {
>                 pr_err("Could not unregister notification callback\n");
> -               mutex_unlock(&drv_info->notify_lock);
> +               write_unlock(&drv_info->notify_lock);
>                 return rc;
>         }
>
>         if (!is_framework)
>                 rc =3D ffa_notification_unbind(dev->vm_id, BIT(notify_id)=
);
>
> -       mutex_unlock(&drv_info->notify_lock);
> +       write_unlock(&drv_info->notify_lock);
>
>         return rc;
>  }
> @@ -1341,7 +1341,7 @@ static int __ffa_notify_request(struct ffa_device *=
dev, bool is_per_vcpu,
>         else
>                 cb_info->cb =3D cb;
>
> -       mutex_lock(&drv_info->notify_lock);
> +       write_lock(&drv_info->notify_lock);
>
>         if (!is_framework) {
>                 if (is_per_vcpu)
> @@ -1361,7 +1361,7 @@ static int __ffa_notify_request(struct ffa_device *=
dev, bool is_per_vcpu,
>         }
>
>  out_unlock_free:
> -       mutex_unlock(&drv_info->notify_lock);
> +       write_unlock(&drv_info->notify_lock);
>         if (rc)
>                 kfree(cb_info);
>
> @@ -1407,9 +1407,9 @@ static void handle_notif_callbacks(u64 bitmap, enum=
 notify_type type)
>                 if (!(bitmap & 1))
>                         continue;
>
> -               mutex_lock(&drv_info->notify_lock);
> +               read_lock(&drv_info->notify_lock);
>                 cb_info =3D notifier_hnode_get_by_type(notify_id, type);
> -               mutex_unlock(&drv_info->notify_lock);
> +               read_unlock(&drv_info->notify_lock);
>
>                 if (cb_info && cb_info->cb)
>                         cb_info->cb(notify_id, cb_info->cb_data);
> @@ -1447,9 +1447,9 @@ static void handle_fwk_notif_callbacks(u32 bitmap)
>
>         ffa_rx_release();
>
> -       mutex_lock(&drv_info->notify_lock);
> +       read_lock(&drv_info->notify_lock);
>         cb_info =3D notifier_hnode_get_by_vmid_uuid(notify_id, target, &u=
uid);
> -       mutex_unlock(&drv_info->notify_lock);
> +       read_unlock(&drv_info->notify_lock);
>
>         if (cb_info && cb_info->fwk_cb)
>                 cb_info->fwk_cb(notify_id, cb_info->cb_data, buf);
> @@ -1974,7 +1974,7 @@ static void ffa_notifications_setup(void)
>                 goto cleanup;
>
>         hash_init(drv_info->notifier_hash);
> -       mutex_init(&drv_info->notify_lock);
> +       rwlock_init(&drv_info->notify_lock);
>
>         drv_info->notif_enabled =3D true;
>         return;
>
> --
> 2.34.1
>
