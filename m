Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ACBB72627;
	Tue,  1 Jul 2025 07:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751355280; cv=none; b=QpWKl8HYudSePBOXLy1KcF5V5hfjikIcEyTpB+6oGVou2qH64fpGCSEzsdUjZF/qlbUsk9vxBxtCOshsbK13wO28YJRpVP1iHYeeSoYQAOsCopoA/O2PD4i01oIOBxKi2ql9IUOmTXCteFMjA+oY4xrNGo3pfrC4n8C9joIEK1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751355280; c=relaxed/simple;
	bh=dS1a8X8mecDd8BkSyMpP3EvQWIdgfqU7mZdTt5g+WV4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=tl09jGE83Wg16lPkPW0u6aWa851+A1QK2zXrv581Nh1Pj9bco8laZEkuV5oBV7tmDSrbz5fTZNwCE4WPxcU+H8KIfHrCxUAbl/4noEgx1WNRYtsWwdgnlrCGxckLpWiw83jMkr6sV2QB92XVFNIsnduidg0z3ItWnU/YZmlUwPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=SLeZn/oI; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=kq9kpmEI; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="SLeZn/oI";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="kq9kpmEI"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1751355270;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q3pTxglj7rUaxTbf+kwFx+KhAmOnfuP/vGPEozKgxCs=;
	b=SLeZn/oISCskojCC5wqqgkJTMqAEjmNuH4xDYrPBA0i6op+Z97AmYXCL+HlD+S5KcDZp8J
	nQY5EOq6Z3HVLD9yg7HySrFYQjHt1VW6/WiQbtknVAac7IwUQ1V3+SsO0gFDs1aLg4nfiY
	lpFfnmVp8ycxnL3nOZvpIxLIRypW6+ud0sLtDt7IBn/xtRfyqqdXf0wRO4HKzk7CFI2LJW
	CiUdtztRAczzn/EMp9Kxo4Kib0whDuR5R1Aq/NIJNCipHuGjHd+sbA6FbVnrlJURW+WK7D
	wWRLWcRmmCB27pSSSoohceSFres5pESoTLkbb1SvFWGUYzAmKhInlpkN51f10A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1751355270;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q3pTxglj7rUaxTbf+kwFx+KhAmOnfuP/vGPEozKgxCs=;
	b=kq9kpmEIKmCa77n3xHqg9PI3O5HFmJRcwwTQpSTIlSYRrEyYHYsWXuF8zWLoho7nDnwtFh
	OlNhQPLGg8OnahDQ==
To: Anup Patel <apatel@ventanamicro.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Anup Patel <anup@brainfault.org>,
 Atish Patra <atish.patra@linux.dev>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Alexandre Ghiti <alex@ghiti.fr>,
 Andrew Jones <ajones@ventanamicro.com>, linux-doc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] irqchip: riscv-imsic: Add kernel parameter to disable IPIs
In-Reply-To: <CAK9=C2Ue36iF8X17n-D70BkMk69bGKb+8dSmro6SEo5i2d+OSg@mail.gmail.com>
References: <20250625161715.1003948-1-apatel@ventanamicro.com>
 <87wm8tmcsr.ffs@tglx>
 <CAK9=C2Ue36iF8X17n-D70BkMk69bGKb+8dSmro6SEo5i2d+OSg@mail.gmail.com>
Date: Tue, 01 Jul 2025 09:34:29 +0200
Message-ID: <87ikkcmkje.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 01 2025 at 12:00, Anup Patel wrote:
> On Mon, Jun 30, 2025 at 9:39=E2=80=AFPM Thomas Gleixner <tglx@linutronix.=
de> wrote:
>> > When injecting IPIs to a set of harts, the IMSIC IPI support will
>> > do a separate MMIO write to SETIPNUM_LE register of each target
>> > hart. This means on a platform where IMSIC is trap-n-emulated,
>> > there will be N MMIO traps when injecting IPI to N target harts
>> > hence IPIs based on IMSIC software injected MSI is slow compared
>> > to the SBI IPI extension.
>> >
>> > Add a kernel parameter to disable IPIs in IMSIC driver for platforms
>> > with trap-n-emulated IMSIC.
>>
>> Why do you need a kernel parameter for that. If the platform uses trap-n
>> emulation, then disable the IPI muck automatically, no?
>>
> Unfortunately, we don't have DT, ACPI, or any other way of discovering
> whether underlying IMSIC is trap-n-emulated. In fact, the DT or ACPI
> passed to a KVM Guest is the same irrespective of whether underlying
> IMSIC is trap-n-emulated or backed by hardware IMSIC VS-file.

Sigh.

> Using software injected MSIs as IPIs is purely a software choice in the
> IMSIC driver so this new kernel parameter allows users to override it.

Please add that information to the change log.

Thanks,

        tglx
