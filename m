Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB82207644
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 08:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738659367; cv=none; b=QwA7kfNxU2aGUvMgTRvYC95v3X5vrT9AY4AcJ5XAH/pPxz9I/nI/nzq9DLmriruYCXvMNN/jEJJk5WimnZjA1Ymzt/asVgqZVLQ9/ChZcI87dpi8SqzXty0iWA0eBhSGEgKjW3mIm3LGBDwjI1MBt3SHXml0vg4WVp0k3Fuyoug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738659367; c=relaxed/simple;
	bh=bUUUaQN5QUZLJm8PvVi1ettkEXGs+/n1vlbO2MJsNW4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=eKmqeb9EO1QSNdTGu/34OYG4aD0ipsteyGtiZIFEzktzKcnn02ixdegwDTrxEgQEirFrF2gT/czo5aUGr7+oA1Hb+RmzLAvoYm29S1CXWXFPnZgW7i+UBxwaxW/3C0EDhCSECaZOcKUqIHeQweoAhWjRlZ1HBi7+ndLtI/nAxYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=mKD5KRkl; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=D3oWoJ8C; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="mKD5KRkl";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="D3oWoJ8C"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738659363;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LSqgMFS4aDbQD1Za39QBUfMLlRyO1p8mWDLUklEpzZI=;
	b=mKD5KRklKrqXuveUDqTQ1L1HpTnd13HHNJ3z6qOmdFhn77mOErYPVsTtVodroOBX6waOm2
	yCjHaCcNEfo8cp4ZQxslB6hkHbqNgQJd02o17NfDTekgRph/VHEx6J/8kqeKsC5h/NplWh
	wLS6nIsOleHi16tu0WRI2yjtYig3qPX/PMkrBNZBVtooF3VUAL0eZbH7zPb8rEj5mSoJ7a
	o3if5Xzv2sVE/85ympiNuUyJWB3uDkl8ZH3mDXhVnJKdT1NuKR74r1iJzFxHsWzYPhGD24
	7V6G/clKUKMw6CLs5OaqYfw9w6CXHLGg1tFbeZ0NcmiLoYIiH+h2i9ztBuzTrg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738659363;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LSqgMFS4aDbQD1Za39QBUfMLlRyO1p8mWDLUklEpzZI=;
	b=D3oWoJ8CAX418qVeH86CLIWCx4KbgcDAbTmVaPpd13BHVb64PoVUaGz3iQha4kI8/XnyAn
	JjZ3XY/2fYFaxkAw==
To: Anup Patel <apatel@ventanamicro.com>
Cc: Marc Zyngier <maz@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement
 <gregory.clement@bootlin.com>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Atish Patra
 <atishp@atishpatra.org>, Andrew Jones <ajones@ventanamicro.com>, Sunil V L
 <sunilvl@ventanamicro.com>, Anup Patel <anup@brainfault.org>,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, Anup Patel
 <apatel@ventanamicro.com>
Subject: Re: [PATCH v3 10/10] irqchip/riscv-imsic: Use IRQCHIP_MOVE_DEFERRED
 flag for PCI devices
In-Reply-To: <20250204075405.824721-11-apatel@ventanamicro.com>
References: <20250204075405.824721-1-apatel@ventanamicro.com>
 <20250204075405.824721-11-apatel@ventanamicro.com>
Date: Tue, 04 Feb 2025 09:56:03 +0100
Message-ID: <87o6zinl5o.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Feb 04 2025 at 13:24, Anup Patel wrote:
> Devices (such as PCI) which have non-atomic MSI update should
> migrate irq in the interrupt-context so use IRQCHIP_MOVE_DEFERRED
> flag for corresponding irqchips.
>
> The use of IRQCHIP_MOVE_DEFERRED further simplifies IMSIC vector
> movement as follows:
>
> 1) No need to handle the intermediate state seen by devices with
>    non-atomic MSI update because imsic_irq_set_affinity() is called
>    in the interrupt-context with interrupt masked.
> 2) No need to check temporary vector when completing vector movement
>    on the old CPU in __imsic_local_sync().
> 3) No need to call imsic_local_sync_all() from imsic_handle_irq()

I have no idea how you came to that delusion.

IRQCHIP_MOVE_DEFERRED is part of the mechanism to handle this insanity
correctly. It does not prevent the device from observing and actually
using the intermediate state. All it does is to ensure that the kernel
can observe this case and act on it.

The fact that the kernel executes the interrupt handler on the original
target CPU does not prevent the device from firing another interrupt.
PCI/MSI interrupts are strictly edge. i.e. fire and forget.

IRQCHIP_MOVE_DEFERRED solely ensures that the racy affinity update in
the PCI device happens in the context of the original target CPU, which
is required to handle all possible cases correctly.

Let's assume the interrupt is affine to CPU0, vector A and a move to
CPU1, vector B is pending. So we have three possible scenarios:

CPU0                            Device                                
interrupt
                                1) Raises interrupt on CPU0, vector A
  ...

    write_msg()
        write_address(CPU1)
                                2) Raises interrupt on CPU1, vector A
        write_data(vector B)
                                3) Raises interrupt on CPU1, vector B

#1 is handled correctly because the interrupt is retriggered on CPU0,
   vector A, which still has the interrupt associated (it's cleaned up
   _after_ the first interrupt arrives on CPU1, vector B).

#2 cannot be handled because CPU1, vector A is either not in use or
   associated to a completely unrelated interrupt, which means if that
   happens the interrupt is lost and the device might become stale.

#3 is handled correctly for obvious reasons.

The only way to handle #2 properly is to do the intermediate update to
CPU0, vector B and checking for a pending interrupt on that. The
important role IRQCHIP_MOVE_DEFERRED plays here is that it guarantees
that the update happens on CPU0 (original target). Which in turn is
required to observe that CPU0, vector B has been raised.

The same could be achieved by executing that intermediate transition on
CPU0 with interrupts disabled by affining the calling context (thread)
to CPU0 or by issuing an IPI on CPU0 and doing it in that context. I
looked into that, but that has it's own pile of issues. So at the end
moving it in the context of the interrupt on the original CPU/vector
turned out to be the simplest way to achieve it.

Thanks,

        tglx
