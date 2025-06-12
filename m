Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93B7E22DF95
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 09:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749722339; cv=none; b=VQT/EXxXgCe+dOQ5H7I13i+6scoSjl6RDB1namD8EFYM3g4a1kA6uAXnKgYbU2H6XbBsU2wU7xNthnCxNaIF2XxosB1Jcql5VPEDdmH7ggdzS5PTQvgujRQFjCTn0CqUzvYjPZHpJoMx1Wi7s/RHlf9fthFGJSwmvzj4oNlYlB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749722339; c=relaxed/simple;
	bh=HQIfkWpCf8PhPT8B7YeXxaNmX7Nn3rcvGJERbBOGe1Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q/Cp6Yg73aLlALH5uJ//sMWlMsI0tGG+eZcVHkapf2lCubDiuyu5/InXAFpls4Vdh89rWL07Y0nVoly41RnoFZpMx7vpliVxOcZDs2J3T168fWRwSVRUU5zkJpgLDzfY7GVPjLs6iTmva/FiBaIwAolRQ+LangelG0qIl8ccQEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oV85hq4P; arc=none smtp.client-ip=209.85.160.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oV85hq4P"
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-2ea65f5a0easo452902fac.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 02:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749722335; x=1750327135; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Po4IEoRQLPY5l28IDQlv6VRr1krpMVzYLaWwpJlY3yA=;
        b=oV85hq4PaZ+FwlzijonxlrolauyhtpZ9tSkBvZmi63Gj0czqOuz5sFoyBR1h3g4XRP
         2zfrhALYuesiR7EyMZjLC8GY9+cs9qXtUFBxYOcuvopvyVqx6H38w6VPpWKv9fmuYwEg
         h1luXn08MvLFuydPaeXOFBXeyJtsh6XQ/N/SbIiaxwr8skye6IoPwUH9i3xK6HuibPNC
         W68Nk8SgS4j6K2FJYmefzK8fpnUwHzzYPL8Ityfy1XF/EgTRZT7OiQedSUWKC70LqwL3
         SxrwHCmmtTysoLmtVQN0uhaC9NzKSbXCQpgehNBR3bZuTreW3Vn8/zk5iswwJLAF3IP6
         U/Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749722335; x=1750327135;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Po4IEoRQLPY5l28IDQlv6VRr1krpMVzYLaWwpJlY3yA=;
        b=jHt/uWadjHfOSZVWlmBVwdelxO6Sgc3Nvqoc7+V/ApoH46hq7MjrRAUh/a5W7hiSVw
         Z7rD7F6sT6wR+JskmS6Bk8wr7RytnsCI9dVFtYZgRhATfKNRma2heyqIFVNLA6pEMx32
         TVxJUdUCJw91zFAILdYXH8l2EybWvd2/viJje+SfT3WY3HPMePnmk7H8sS4gD5OXtM6L
         6p2/kx15YXV2cVtJvQ7hG6pWuRlyCKR3bwwRocEDW7G8zT7KQERLyJPgsItjTSCDV14R
         wU+L5vC0GBDIHILRpAJQGU4GRdoeJACxd4nHg+Zh1Y5cyY5xosQ9/5spLrE917ukRaEl
         +9TA==
X-Forwarded-Encrypted: i=1; AJvYcCWZkhcLq5hPoIjEhYQSv7nzwsI8+7+DCrKUP5KcpRK1+xntbLwlGvYwFzqY57YUwcBLdWZ/dWVF6sELCvA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDAGUcPYoHg7zUhSZ3+JBgpRZDaLWRWlYpaj8dQP4PisSbh2dk
	ZfJHby2l2ZTKuYX3jV52DwUaHfrUvrS/OcNWpswLduCOtp68OZ6A2vt7Gps0IAafmaKltfERP/D
	RsiE9KfcLe+NNnsr/MVAqTpp/MIGGMy+fc8UXjso0qg==
X-Gm-Gg: ASbGncs8Zb+xSasXz+xWAvtm94JvqqCMEfB3DX0UAscP0gvt7aZrka/q5UU6lxMo+M7
	QbPuNeOQ/HRfeNDF8cWwa26jckLJGvHdXn7uciKSgB2bPIQsqUSv3zatZvKDZD/t+I5YD5jHgrH
	i4YpiadMjtrF0KjtOn05YDrS7uDTNQS3dzD+d/+VLI2aYC21AlKhvfrzo=
X-Google-Smtp-Source: AGHT+IHPbTfaTOnczpg0ZwUWnHd1ERjdedmAN7MWpJ2f9rXZoce1pOJvnqgECVv1SJ7P8usCkFvRVf0PqHAc3v2YtBA=
X-Received: by 2002:a05:6870:9689:b0:2e4:c5c8:707b with SMTP id
 586e51a60fabf-2eab404c0efmr1591234fac.6.1749722335408; Thu, 12 Jun 2025
 02:58:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250602120452.2507084-1-jens.wiklander@linaro.org>
 <aEl4kWxWexuskLGe@sumit-X1> <20250611-kickass-tasteful-markhor-c6c7ff@sudeepholla>
In-Reply-To: <20250611-kickass-tasteful-markhor-c6c7ff@sudeepholla>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Thu, 12 Jun 2025 11:58:43 +0200
X-Gm-Features: AX0GCFszVanXSrhQjN2aA7WJFvOnpLcTZ6RuvbO4nWsjnpX6MpHRI2Ht2d_1WBI
Message-ID: <CAHUa44E3d0p9r2a3qzJ7Kx7pA07tTJfxur_pKg_5SerCkegfFg@mail.gmail.com>
Subject: Re: [PATCH] optee: ffa: fix sleep in atomic context
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Sumit Garg <sumit.garg@kernel.org>, linux-kernel@vger.kernel.org, 
	op-tee@lists.trustedfirmware.org, 
	Jerome Forissier <jerome.forissier@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 11, 2025 at 2:45=E2=80=AFPM Sudeep Holla <sudeep.holla@arm.com>=
 wrote:
>
> On Wed, Jun 11, 2025 at 06:07:37PM +0530, Sumit Garg wrote:
> > On Mon, Jun 02, 2025 at 02:04:35PM +0200, Jens Wiklander wrote:
> > > The OP-TEE driver registers the function notif_callback() for FF-A
> > > notifications. However, this function is called in an atomic context
> > > leading to errors like this when processing asynchronous notification=
s:
> > >
> > >  | BUG: sleeping function called from invalid context at kernel/locki=
ng/mutex.c:258
> > >  | in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid: 9, name: kw=
orker/0:0
> > >  | preempt_count: 1, expected: 0
> > >  | RCU nest depth: 0, expected: 0
> > >  | CPU: 0 UID: 0 PID: 9 Comm: kworker/0:0 Not tainted 6.14.0-00019-g6=
57536ebe0aa #13
> > >  | Hardware name: linux,dummy-virt (DT)
> > >  | Workqueue: ffa_pcpu_irq_notification notif_pcpu_irq_work_fn
> > >  | Call trace:
> > >  |  show_stack+0x18/0x24 (C)
> > >  |  dump_stack_lvl+0x78/0x90
> > >  |  dump_stack+0x18/0x24
> > >  |  __might_resched+0x114/0x170
> > >  |  __might_sleep+0x48/0x98
> > >  |  mutex_lock+0x24/0x80
> > >  |  optee_get_msg_arg+0x7c/0x21c
> > >  |  simple_call_with_arg+0x50/0xc0
> > >  |  optee_do_bottom_half+0x14/0x20
> > >  |  notif_callback+0x3c/0x48
> > >  |  handle_notif_callbacks+0x9c/0xe0
> > >  |  notif_get_and_handle+0x40/0x88
> > >  |  generic_exec_single+0x80/0xc0
> > >  |  smp_call_function_single+0xfc/0x1a0
> > >  |  notif_pcpu_irq_work_fn+0x2c/0x38
> > >  |  process_one_work+0x14c/0x2b4
> > >  |  worker_thread+0x2e4/0x3e0
> > >  |  kthread+0x13c/0x210
> > >  |  ret_from_fork+0x10/0x20
> > >
> > > Fix this by adding work queue to process the notification in a
> > > non-atomic context.
> > >
> > > Fixes: d0476a59de06 ("optee: ffa_abi: add asynchronous notifications"=
)
> > > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> >
> > Forgot to mention, let's explicitly CC for stable kernel backport here.
>
> Makes sense.

Sure, I'll fix up the commit message before sending the PR.

>
> Jens,
>
> Just FYI:
>
> Here is the FF-A fix PR to Arnd if you need any reference:
> https://lore.kernel.org/all/20250609105207.1185570-1-sudeep.holla@arm.com

Good

Thanks,
Jens

>
> I haven't tagged it for stable assuming Fixes: tag ones get selected and
> also it is not trivial to apply. I do have the backports also ready to
> send once merged upstream.
>
> --
> Regards,
> Sudeep
