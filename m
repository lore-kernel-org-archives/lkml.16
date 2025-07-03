Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29519242D80
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 10:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751537561; cv=none; b=d6io+sB8YSOTAvZbnAhtGFhLKC2jjxagWemZtnSGOOuXIHR6jhX29VPlP31nuBAjxZMZ7E+ZxhqV3rMWZlhQoHLK5IBfAqBTmkrPrRuGL5MVCKezhyzSxbqvNVvSprMo8LyxhLmdo0bo6TMNOJ3lMOqgnTSDNQ4q3Zen4psT5k0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751537561; c=relaxed/simple;
	bh=qYy7HJ+rnW5C2fOTnpYlbi1OPTddvrialPACcgAVxjk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=m/CpemOpD7pAdzdZZ9gle23vsOig56dPH3XwUkSwCkPzrEgC8MCthlOMAb5h/y+1XB3VA8TlNWjYxZWynd41r4sRXtwdvXtfqs+n266jayvgxTHpx2L+cMSLTnoHfE3JGv3AjXRQS1P40XfLh/P98RnrNsx5kPiy4UGdEDkQc50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g8iZeQQD; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g8iZeQQD"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4537edf2c3cso78023855e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 03:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751537556; x=1752142356; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zsy3o+a5LwN2jUmSXKdFxPZ/Sf0ebBo2DlMLfM6qA2Y=;
        b=g8iZeQQDpNIv80JKOYLmC+xcjzPDPVwR39EboEmeoLqW85zjPJ8RYJ2WqV7dyKJQBw
         YuYVQO+3cghOYPx36QC0Pj6Nl5PjZOwhU6ATssd7x8qTDVR469brD0d6yURR7hUGXaC7
         5o7emONuIiiMbjL/v7IUUFiFoLquB94/evi5fVmYVb+1SpxzerAtC+ZcQlOKr04pxfv9
         gYfm2e0xwaYHZTjTBSFPtdMXXqrOGfjL/jl0IvlIyq/sMGL39NfqJAmQO/rNtNnj/fyv
         dU1/BqANFQOFUohve7YtSmbs2pvXKuB1iWU0myPs/gY46hiT1lmGi4KfH+4B01CoqD6I
         FKHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751537556; x=1752142356;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zsy3o+a5LwN2jUmSXKdFxPZ/Sf0ebBo2DlMLfM6qA2Y=;
        b=bnd5i6/ivfCl+hIhnoOldV5bP5PsIoI0CiSOzLCjHcIflXQoADGAUVxhOfmbUcN4aL
         Pwj8eYjHa0IGZRhB1zMux3T7j9vZk1iAK1p3ErpOZIFRlLCjcW5g5LYTK/k0Jf0dYxnW
         kx2oo6agXG+knxRvxOq0b4PJSoIXOEpolsrJg/jYJrZE6Kv1I7bd08CftfYUF62QJka7
         vJYCJHoV8hg3Pe1WYU1ygPaIgZrOdssv6RJLO5xkAIXulG7jfUnPz93mQ5RX+Vys14iE
         WoFbeUFjddOCKuhz844fx77FaR/8HPYK1GoxqHWg2LQmx84VUNqjXIXnywOMyO7pflCI
         xbdg==
X-Forwarded-Encrypted: i=1; AJvYcCXqRMZPXFnTs2D2MdxcukL/Hz3QUzVAllavvWKMk6sandr24eU803HU4dXV8XRHqPDr4Nbuilc3x+MLlXQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwteDX94Nbj5jC2gYxexLSa5IHbCAurq9N+o775d9py/59hZYPL
	2y9oY9i4azAB/mfc19scFHY2vGMe/PbqhRvppVUe8fkEcSDSIXi68dSlzHD9HnOdvQ8=
X-Gm-Gg: ASbGncsHDs5HOBQe/kQO4gOL/rvmwhWtjEgCHcfCoz/drI5a07jayun553vUa+tKH0O
	n6E2bZ4u0lcrfQi1Z8orTJFc2NmuAqst9EavY/zlwD9w/Tb8xyKx8fia+PGpE6OEaQwiHhdAoO9
	Xl65FuOVv4xxNZRlbYI6tkPisBDSokUfXNZY48ySb4rLWKH0mesZhgD0hTfxsE3DgGyDr1Uswfw
	9hfY2Uz/aUdkOxZW8JjcuLkXRLRizG6ylH1pqdOsPcRBRkQmKzNyik40BCSWVOVbuJZ61BhxwjT
	RLvWVcvObaAt4snHFUCs7Q+TX1jfjMMrLyZURwbzvzmjUm8d7WFElgRnhejKtak/AQ==
X-Google-Smtp-Source: AGHT+IGppM52segUxgIPv47hrycPAIwz2l2DAMekCZpVZr+AEqBxKXhYAJco74IOHWkjBbVxw0/FcQ==
X-Received: by 2002:a05:600c:3b01:b0:451:df07:f437 with SMTP id 5b1f17b1804b1-454a3732ff3mr81884355e9.30.1751537556220;
        Thu, 03 Jul 2025 03:12:36 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e591d7sm18532443f8f.67.2025.07.03.03.12.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 03:12:35 -0700 (PDT)
Message-ID: <91a9d4dbe5504c493856ef81b30d98e7da925ac0.camel@linaro.org>
Subject: Re: [PATCH v3] soc: samsung: exynos-pmu: Enable CPU Idle for gs101
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus	
 <tudor.ambarus@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: William Mcvicker <willmcvicker@google.com>, Krzysztof Kozlowski
	 <krzysztof.kozlowski@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-team@android.com
Date: Thu, 03 Jul 2025 11:12:34 +0100
In-Reply-To: <20250627-gs101-cpuidle-v3-1-0200452dfe60@linaro.org>
References: <20250627-gs101-cpuidle-v3-1-0200452dfe60@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1+build1 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thanks Pete for your patch!

On Fri, 2025-06-27 at 14:08 +0100, Peter Griffin wrote:
> Register cpu pm notifiers for gs101 which call the
> gs101_cpu_pmu_online/offline callbacks which in turn program the ACPM
> hint. This is required to actually enter the C2 idle state.
>=20
> A couple of corner cases are handled, namely when the system is rebooting
> or suspending we ignore the request. Additionally the request is ignored =
if
> the CPU is in CPU hot plug. Some common code is refactored so that it can
> be called from both the CPU hot plug callback and CPU PM notifier taking
> into account that CPU PM notifiers are called with IRQs disabled whereas
> CPU hotplug callbacks aren't.
>=20
> Note: this patch has a runtime dependency on adding 'local-timer-stop' dt
> property to the CPU nodes. This informs the time framework to switch to a
> broadcast timer as the local timer will be shutdown. Without that DT
> property specified the system hangs in early boot with this patch applied=
.
>=20
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>

With this applied, I see the following during boot:

[    1.841304][    T0] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[    1.841422][    T0] [ BUG: Invalid wait context ]
[    1.841550][    T0] 6.16.0-rc4-next-20250702+ #54 Tainted: G     U      =
    T =20
[    1.841727][    T0] -----------------------------
[    1.841844][    T0] swapper/0/0 is trying to lock:
[    1.841965][    T0] ffff000800ee84b8 (&pmu_context->cpupm_lock){....}-{3=
:3}
[    1.842001][    T0] , at: gs101_cpu_pm_notify_callback+0x48/0x100
[    1.842309][    T0] other info that might help us debug this:
[    1.842613][    T0] context-{5:5}
[    1.842987][    T0] 1 lock held by swapper/0/0:
[    1.843442][    T0]  #0:=20
[    1.843859][    T0] ffffafe9d8f1f100
[    1.844282][    T0]  (
[    1.844618][    T0] cpu_pm_notifier.lock
[    1.844980][    T0] ){....}-{2:2}, at: cpu_pm_enter+0x30/0x88
[    1.845340][    T0] stack backtrace:
[    1.845855][    T0] CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Tainted: G     =
U          T   6.16.0-rc4-next-20250702+ #54 PREEMPT=20
[    1.845878][    T0] Tainted: [U]=3DUSER, [T]=3DRANDSTRUCT
[    1.845884][    T0] Hardware name: Oriole (DT)
[    1.845897][    T0] Call trace:
[    1.845909][    T0]  show_stack+0x24/0x38 (C)
[    1.845934][    T0]  dump_stack_lvl+0x40/0xc0
[    1.845949][    T0]  dump_stack+0x18/0x24
[    1.845956][    T0]  __lock_acquire+0xc68/0xd90
[    1.845976][    T0]  lock_acquire+0x14c/0x2b8
[    1.845985][    T0]  _raw_spin_lock+0x54/0x78
[    1.846011][    T0]  gs101_cpu_pm_notify_callback+0x48/0x100
[    1.846021][    T0]  notifier_call_chain+0xb0/0x198
[    1.846046][    T0]  raw_notifier_call_chain_robust+0x50/0xb0
[    1.846053][    T0]  cpu_pm_enter+0x4c/0x88
[    1.846063][    T0]  psci_enter_idle_state+0x2c/0x70
[    1.846078][    T0]  cpuidle_enter_state+0x14c/0x4c0
[    1.846097][    T0]  cpuidle_enter+0x44/0x68
[    1.846121][    T0]  do_idle+0x1f0/0x2a8
[    1.846142][    T0]  cpu_startup_entry+0x40/0x50
[    1.846152][    T0]  rest_init+0x1c4/0x1d0
[    1.846161][    T0]  start_kernel+0x358/0x438
[    1.846181][    T0]  __primary_switched+0x88/0x98

>=20
> [...]
>=20
> @@ -444,6 +586,18 @@ static int exynos_pmu_probe(struct platform_device *=
pdev)
> =C2=A0			 */
> =C2=A0			dev_warn(&pdev->dev, "pmu-intr-gen syscon unavailable\n");
> =C2=A0		} else {
> +			pmu_context->hotplug_ing =3D
> +				devm_kmalloc_array(dev, num_possible_cpus(),
> +						=C2=A0=C2=A0 sizeof(bool), GFP_KERNEL);

I haven't done a full review, but sizeof(bool) should be rewritten as
sizeof(*pmu_context->hotplug_ing)

> [...]
> =C2=A0
> @@ -471,10 +628,32 @@ static int exynos_pmu_probe(struct platform_device =
*pdev)
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0
> +#ifdef CONFIG_PM_SLEEP
> +static int exynos_cpupm_suspend_noirq(struct device *dev)
> +{
> +	atomic_set(&pmu_context->sys_suspended, 1);
> +	return 0;
> +}
> +
> +static int exynos_cpupm_resume_noirq(struct device *dev)
> +{
> +	atomic_set(&pmu_context->sys_suspended, 0);
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops cpupm_pm_ops =3D {
> +	.suspend_noirq =3D exynos_cpupm_suspend_noirq,
> +	.resume_noirq =3D exynos_cpupm_resume_noirq,
> +};
> +#endif
> +
> =C2=A0static struct platform_driver exynos_pmu_driver =3D {
> =C2=A0	.driver=C2=A0 =3D {
> =C2=A0		.name=C2=A0=C2=A0 =3D "exynos-pmu",
> =C2=A0		.of_match_table =3D exynos_pmu_of_device_ids,
> +#ifdef CONFIG_PM_SLEEP
> +		.pm =3D &cpupm_pm_ops,
> +#endif

This can use pm_sleep_ptr() instead to avoid the ifdef.

Cheers,
Andre'
