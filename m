Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 441AA1A83F4
	for <linux-kernel@vger.kernel.org>; Sun,  4 May 2025 18:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746384886; cv=none; b=tQNaqdJnZtnuKeftY3JgLlFyJeJ2fNVedjkO8Rgi8CPzmDFZTu+QgZz+NmMsD39JgGJ68MwtjMgpHAnrF7JcIS9/TeDgd61aCaPqRTRGnu2EkhlUdkcovaIA/bqfn/ZRPQ6HoNcVq1CMIV42/KbxV/Rfcua+BlmULsQ/bygxjQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746384886; c=relaxed/simple;
	bh=JEMaVjkx1LoMBN5m7YsK+6mQnob63u4EFgV3UGdIQdE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=hp+ZRac5QsIpuhln9PIu/DU2TDDMmu2K1wbsYlzqJGD6ePJycV39EypLhhN09O81LoTaC3lRnKiEcBvB72VIYkK4esOumiLBsAl87hTlkiZDiJtwooTaueEJ6ZU1BZF5vWNeCFB08TyHkWu57Osm8V8SU9CLoeWEJlGu9aSX+AA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=yhV8hH+7; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="yhV8hH+7"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ace333d5f7bso696809566b.3
        for <linux-kernel@vger.kernel.org>; Sun, 04 May 2025 11:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746384880; x=1746989680; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3zyO3GAeHWNpUR/NK9tQ8bLVW/TIJbHJ26iQW6eAXwM=;
        b=yhV8hH+74SwkT4AJLvU8PadwtAl3gwPy35g19nn4WwMN3B5VboTM6RkhJvMB5X0dPt
         Nf1HeVuZckVCs0LPvmXeht00YxydTgQCl99J2a7ZcTkWze3iS+0eVtGx8P8OggOMzLYQ
         oQa4Pb12+a5TUl361APqbKEviHbsSzXuOcIjlR6jdUCfmcgJT3IL6oM7aQ2S1z3Ibkwy
         fjO5eyTjflMX2+Zysq2S933yKaijsbLXP23eymcLDMd1Inq+1kx68lDzJWvCn+l7bl59
         UlsUktLtN/b1E4Lhn2O5YcPbYQX6PJMKXSIf38k69JdBeHrdLxPjVZWeLW84l/raMzaU
         UjeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746384880; x=1746989680;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3zyO3GAeHWNpUR/NK9tQ8bLVW/TIJbHJ26iQW6eAXwM=;
        b=snKhGJZU8uSXfmRvt60vHL+pwnZpHszEp53itq33TCKZrHFiDyq8zRIaEpG2fuOPwK
         cO7ZyVmw6J9EnT0qDX7WzD2WyF0bYeUhVHEUIEg1tQzgp09tp5zEyvAxFjVW2GQlkHR6
         cZvcGkt5x6ykvh89d6q6GK0aW7D8TNvPZbwORnud6rs9GxQKdMaxOO6o31QoZV0D2/dD
         B+1INFokpsiafE09wmjvjG67/h+XwXo5sgaBfUHvG33B9VcSKUwCsS18VFHpRCzCbWYY
         LlpQfVhK9EvIyG1wVI0tyFkGpsXC0bgNW+mPqrzI326exDc2BrzVzVJmVslrdtMH4r7A
         Je6w==
X-Forwarded-Encrypted: i=1; AJvYcCU9OxGaE1yWhgjLJO9W+hweXXEkf5oGaeRclqoW4gFOEGGVxUYTaGP337dNNONDgZ5/qHe1gKWlATXoRBc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxD4wa+oPgFkpXXXBwdLVk7vj4jNP6zEWxzEjOY4yIvNC3DrlP
	s3XV3Km3A+souq69hmUrKGEbD2OiEwwpswhRoOILUnNvjxAJba0jIiUQm8D47wY=
X-Gm-Gg: ASbGncsVROTHSudBMPhXUcpqAW6Vm/Gyeu7fPv8J6krkpGKlso9enYlmLb2mJf0ERam
	yScSzGff3elvfAL1PfDylsDPOUMqWQF++oW83XjG7qxnhxQO4pI5TaHBXoyreX6zlMsEWixIas1
	kern7X6k9Xexxxpiwm34TVXApfdr5G2j3laep7jabU1GD86R1bfVgbNeYdo8MU2y0HIvVX8D18A
	IJX6dhHHDUXPKz4r3aNS59loMbf8Q3nOH+qOznGjHURfwESNsV1AAWa3LSo7rWb/bGNq6hHcXgX
	xnqCZlmUkyVgEHz1GWOYUebfmrGVB/mFxptEZRkrpFck6Q==
X-Google-Smtp-Source: AGHT+IHrsNrppdqktQJ9HgmKg1AXRw1BSUbjPhnEPEnyxp85lpy5ahaJizVjarul/hB8wXh8acHITw==
X-Received: by 2002:a17:906:6a19:b0:abf:19ac:771 with SMTP id a640c23a62f3a-ad1a48bc392mr453075266b.2.1746384879785;
        Sun, 04 May 2025 11:54:39 -0700 (PDT)
Received: from localhost ([2001:4090:a244:802a:8179:d45a:7862:147])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ad1891f508asm359164166b.85.2025.05.04.11.54.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 11:54:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=a2be36fb501c3dfa35a1012a0204bfd7cc7ee65d88753afd76602dbef972;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Sun, 04 May 2025 20:54:27 +0200
Message-Id: <D9NLROGMM21Q.1IV5PFM7ATZU2@baylibre.com>
Cc: <mkl@pengutronix.de>, <mailhol.vincent@wanadoo.fr>,
 <linux-can@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <lukas@mwa.re>, <jan@mwa.re>
Subject: Re: [PATCH v3] can: m_can: initialize spin lock on device probe
From: "Markus Schneider-Pargmann" <msp@baylibre.com>
To: "Antonios Salios" <antonios@mwa.re>, <rcsekar@samsung.com>
X-Mailer: aerc 0.20.1
References: <20250425111744.37604-2-antonios@mwa.re>
In-Reply-To: <20250425111744.37604-2-antonios@mwa.re>

--a2be36fb501c3dfa35a1012a0204bfd7cc7ee65d88753afd76602dbef972
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Fri Apr 25, 2025 at 1:17 PM CEST, Antonios Salios wrote:
> The spin lock tx_handling_spinlock in struct m_can_classdev is not being
> initialized. This leads the following spinlock bad magic complaint from t=
he
> kernel, eg. when trying to send CAN frames with cansend from can-utils:
>
> [   10.631450] BUG: spinlock bad magic on CPU#0, cansend/95
> [   10.631462]  lock: 0xff60000002ec1010, .magic: 00000000, .owner: <none=
>/-1, .owner_cpu: 0
> [   10.631479] CPU: 0 UID: 0 PID: 95 Comm: cansend Not tainted 6.15.0-rc3=
-00032-ga79be02bba5c #5 NONE
> [   10.631487] Hardware name: MachineWare SIM-V (DT)
> [   10.631490] Call Trace:
> [   10.631493] [<ffffffff800133e0>] dump_backtrace+0x1c/0x24
> [   10.631503] [<ffffffff800022f2>] show_stack+0x28/0x34
> [   10.631510] [<ffffffff8000de3e>] dump_stack_lvl+0x4a/0x68
> [   10.631518] [<ffffffff8000de70>] dump_stack+0x14/0x1c
> [   10.631526] [<ffffffff80003134>] spin_dump+0x62/0x6e
> [   10.631534] [<ffffffff800883ba>] do_raw_spin_lock+0xd0/0x142
> [   10.631542] [<ffffffff807a6fcc>] _raw_spin_lock_irqsave+0x20/0x2c
> [   10.631554] [<ffffffff80536dba>] m_can_start_xmit+0x90/0x34a
> [   10.631567] [<ffffffff806148b0>] dev_hard_start_xmit+0xa6/0xee
> [   10.631577] [<ffffffff8065b730>] sch_direct_xmit+0x114/0x292
> [   10.631586] [<ffffffff80614e2a>] __dev_queue_xmit+0x3b0/0xaa8
> [   10.631596] [<ffffffff8073b8fa>] can_send+0xc6/0x242
> [   10.631604] [<ffffffff8073d1c0>] raw_sendmsg+0x1a8/0x36c
> [   10.631612] [<ffffffff805ebf06>] sock_write_iter+0x9a/0xee
> [   10.631623] [<ffffffff801d06ea>] vfs_write+0x184/0x3a6
> [   10.631633] [<ffffffff801d0a88>] ksys_write+0xa0/0xc0
> [   10.631643] [<ffffffff801d0abc>] __riscv_sys_write+0x14/0x1c
> [   10.631654] [<ffffffff8079ebf8>] do_trap_ecall_u+0x168/0x212
> [   10.631662] [<ffffffff807a830a>] handle_exception+0x146/0x152
>
> Initializing the spin lock in m_can_class_allocate_dev solves that
> problem.
>
> Fixes: 1fa80e23c150 ("can: m_can: Introduce a tx_fifo_in_flight counter")
>
> Signed-off-by: Antonios Salios <antonios@mwa.re>
> Reviewed-by: Vincent Mailhol <mailhol.vincent@wanadoo.fr>

Thanks for finding and fixing this.

Reviewed-by: Markus Schneider-Pargmann <msp@baylibre.com>

Best
Markus

> ---
> Changes since v2:
>  * Clarify bug in commit message
>
> Changes since v1:
>  * Move spin_lock_init from device probe functions to classdev alloc func=
tion
>  * Add a fixes tag
> ---
>  drivers/net/can/m_can/m_can.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/net/can/m_can/m_can.c b/drivers/net/can/m_can/m_can.=
c
> index 884a6352c..12e313998 100644
> --- a/drivers/net/can/m_can/m_can.c
> +++ b/drivers/net/can/m_can/m_can.c
> @@ -2379,6 +2379,8 @@ struct m_can_classdev *m_can_class_allocate_dev(str=
uct device *dev,
>  	SET_NETDEV_DEV(net_dev, dev);
> =20
>  	m_can_of_parse_mram(class_dev, mram_config_vals);
> +
> +	spin_lock_init(&class_dev->tx_handling_spinlock);
>  out:
>  	return class_dev;
>  }


--a2be36fb501c3dfa35a1012a0204bfd7cc7ee65d88753afd76602dbef972
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSJYVVm/x+5xmOiprOFwVZpkBVKUwUCaBe34xEcbXNwQGJheWxp
YnJlLmNvbQAKCRCFwVZpkBVKU89GAQDr3jtUGj6D1oEty/ukeBy81LKZK/2B/h9L
59c4zdDlggD9G78Y8FCOVpLAFNjVySknxhREhi53v9mLu3NI3DYzBgs=
=TsUr
-----END PGP SIGNATURE-----

--a2be36fb501c3dfa35a1012a0204bfd7cc7ee65d88753afd76602dbef972--
