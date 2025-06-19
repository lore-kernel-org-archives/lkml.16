Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5386A12B71
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 13:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750340724; cv=none; b=m/fB5Z4wYMqfNxxxqyOBnXCQxRDKRG3ZkHFZapMFU8pWzQG5skNEqxyNW9Pfh5TQaHvOLLKAAU148uXFDhVcjCT6taBaB1ZueuxtJGpWCWvrCSUr84M6pQx3IvteMkXnfPOZlkYGjBBqmRJRxUi9EtgFSii0SmGfc3eryUrfuYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750340724; c=relaxed/simple;
	bh=BCS8XSCc7BdmjjroO8wva12VT8ErmM88Yu4Sgr1hYt0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HZP+zvXq9Y19vFRLwPpeuN1EVaZPrngUtQhCTx4KRCFnNJiyNTep8elWCfKGVG+KocImuyXIVaYF9NFPE6j30HmGMzDtAsjhU1JYJV2dnmeDxVa0cDiUW85wS5t+DvI+hG//CzJVdu6wLb+f5x246m0g3J0xmSC3m0Jf69lEBbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fSSdJKaX; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fSSdJKaX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750340720;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BwTrJw1aIKWLWhPL7hkRrv+k7V3BORW1xhuRqepCnuE=;
	b=fSSdJKaXSelG6mdkjdxYJvyV19kSvEA8j+wU+LPIxFtHrN3DJFAeyTGNICtcCMaf38cqj2
	0FdxMplY0Ih8hSxMpn8gvrpeJU11+X81dTtowSBpCIQinHc5d5kivEWzyi3QGe1ebCOnd/
	HT9pn3lPjuyNzn6g9eosAudPyu2/CVo=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-400-eAJ4OD7BPwaWMsJlK0p7Zg-1; Thu, 19 Jun 2025 09:45:16 -0400
X-MC-Unique: eAJ4OD7BPwaWMsJlK0p7Zg-1
X-Mimecast-MFC-AGG-ID: eAJ4OD7BPwaWMsJlK0p7Zg_1750340716
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-87ed30e2375so602243241.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 06:45:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750340716; x=1750945516;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BwTrJw1aIKWLWhPL7hkRrv+k7V3BORW1xhuRqepCnuE=;
        b=Vn9NRQ39VDrpzj8UAtjO0tW7rT0a+YgBEf9D2C0J4u5V4kJKvsfx/NOTbr1lVhEM7w
         P9A1R1y2/FAWZqaFHO2OlDQVxnO78Pi2MODbJnHU6FsDSrcH1AAXzYHuxXYwOi9rOnxV
         ObW3DooIQW6TgPOrmQ6Yf/UFNNo473v6bdMiD9ypGCx6UxHZPRgSs+vk/4/MI6sCGHT2
         sGIgxw7VjydgTouCPCpmjl1xifE+xxuFyvKM9+rjX6ioINDM5ExQjlhgeXhA48fcWL7O
         LeYuNSlUcsZfhdAIW8LNzUW1HcqYrR3bZlMQz6LIwFG2nh3Ikbg+ijGk8UFGMeXxMBl0
         9nKA==
X-Forwarded-Encrypted: i=1; AJvYcCVcGq2x6cZGP0V9SHHEQ6Nx7Y0u5qCA6fpejz/UvErgybBCqLxwwm4ZYUrzEef5i2lQQjCS8sStyZHQTcU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2GbELIasrX1G5kiGDN/mOTB0LOMe2jYIn35b3irkSOPm4JQFe
	cjtkJn/zWZcxam7LxAkwzuUGptWy20lss5ekTzdpRGTmIZGwAViVl7N1yAfgLlC+To3Qb5IhdY4
	8uzN5Yfz0bIc9CRVh3h9vbyosai+nLa0e1yaQs8WNuwiJMXTiIfojyrKdBuBmLFzlA0lkCdeHzj
	rH1opYnGapGscesUMDMzD+Ych58cwLKa6C3TLsnjGK
X-Gm-Gg: ASbGncv2fzkpQywyUI/vdxAzBgJhtbjjzb2lAtpwyX4qZwb2m9jnPIJI5v7IDkvE6jV
	8WW8OBJ20UEtNmXLNpWlkrhD4i4Qh9q7mGEnYTRxcCvOPL4uUGxCwdgATjCm1x+UhN+Q28YG7nb
	JU9GYb
X-Received: by 2002:a05:6102:6e8e:b0:4e9:a2bd:b455 with SMTP id ada2fe7eead31-4e9a2bdbeb0mr2666478137.14.1750340715919;
        Thu, 19 Jun 2025 06:45:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEhBhDEmG8kgdedUyWcBo/afrnkPcHMX3xV98VYGKv01zNwJBXjRnQ23jwDWA/8nMPj2ssed3gKKtx9K+N4puU=
X-Received: by 2002:a05:6102:6e8e:b0:4e9:a2bd:b455 with SMTP id
 ada2fe7eead31-4e9a2bdbeb0mr2666460137.14.1750340715581; Thu, 19 Jun 2025
 06:45:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250619132655.3318883-1-yukuai1@huaweicloud.com>
In-Reply-To: <20250619132655.3318883-1-yukuai1@huaweicloud.com>
From: Ming Lei <ming.lei@redhat.com>
Date: Thu, 19 Jun 2025 21:45:04 +0800
X-Gm-Features: Ac12FXyEcJkNVX0Embyg5cUBG6nnv5IfKErG0aKFhUHG982cYS7HYlRWJdwW6sE
Message-ID: <CAFj5m9JBoY1ZPQ5oYh2RwMN9o_HEOofCge1LLPF1_Oh8AdP=Aw@mail.gmail.com>
Subject: Re: [PATCH v2] lib/group_cpus: fix NULL pointer dereference from group_cpus_evenly()
To: Yu Kuai <yukuai1@huaweicloud.com>
Cc: tglx@linutronix.de, akpm@linux-foundation.org, john.g.garry@oracle.com, 
	axboe@kernel.dk, linux-kernel@vger.kernel.org, yukuai3@huawei.com, 
	yi.zhang@huawei.com, yangerkun@huawei.com, johnny.chenyi@huawei.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 19, 2025 at 9:33=E2=80=AFPM Yu Kuai <yukuai1@huaweicloud.com> w=
rote:
>
> From: Yu Kuai <yukuai3@huawei.com>
>
> While testing null_blk with configfs, echo 0 > poll_queues will trigger
> following panic:
>
> BUG: kernel NULL pointer dereference, address: 0000000000000010
> Oops: Oops: 0000 [#1] SMP NOPTI
> CPU: 27 UID: 0 PID: 920 Comm: bash Not tainted 6.15.0-02023-gadbdb95c8696=
-dirty #1238 PREEMPT(undef)
> Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.1-2.fc37=
 04/01/2014
> RIP: 0010:__bitmap_or+0x48/0x70
> Call Trace:
>  <TASK>
>  __group_cpus_evenly+0x822/0x8c0
>  group_cpus_evenly+0x2d9/0x490
>  blk_mq_map_queues+0x1e/0x110
>  null_map_queues+0xc9/0x170 [null_blk]
>  blk_mq_update_queue_map+0xdb/0x160
>  blk_mq_update_nr_hw_queues+0x22b/0x560
>  nullb_update_nr_hw_queues+0x71/0xf0 [null_blk]
>  nullb_device_poll_queues_store+0xa4/0x130 [null_blk]
>  configfs_write_iter+0x109/0x1d0
>  vfs_write+0x26e/0x6f0
>  ksys_write+0x79/0x180
>  __x64_sys_write+0x1d/0x30
>  x64_sys_call+0x45c4/0x45f0
>  do_syscall_64+0xa5/0x240
>  entry_SYSCALL_64_after_hwframe+0x76/0x7e
>
> Root cause is that numgrps is set to 0, and ZERO_SIZE_PTR is returned
> from kcalloc(), then __group_cpus_evenly() will deference the
> ZERO_SIZE_PTR.
>
> Fix the problem by checking numgrps first in group_cpus_evenly(), and
> return NULL directly if numgrps is zero.
>
> Fixes: 6a6dcae8f486 ("blk-mq: Build default queue map via group_cpus_even=
ly()")
> Signed-off-by: Yu Kuai <yukuai3@huawei.com>
> ---
> Changes in v2:
>  - check numgrps directly.
>
>  lib/group_cpus.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/lib/group_cpus.c b/lib/group_cpus.c
> index ee272c4cefcc..d68407e3601e 100644
> --- a/lib/group_cpus.c
> +++ b/lib/group_cpus.c
> @@ -352,6 +352,9 @@ struct cpumask *group_cpus_evenly(unsigned int numgrp=
s)
>         int ret =3D -ENOMEM;
>         struct cpumask *masks =3D NULL;
>
> +       if (numgrps =3D=3D 0)
> +               return NULL;
> +

Reviewed-by: Ming Lei <ming.lei@redhat.com>

Thanks,

