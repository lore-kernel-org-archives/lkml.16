Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 333FC2900BA;
	Mon, 30 Jun 2025 16:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751299771; cv=none; b=dUXHqZDERnmDYkqeTohjkkQRNJ3hZVFcfcPvjwKI/srvzES1lbMAt5QahGAMQQZpc24xI5imMsJBm0OI+atx4IzfLUNL0aF1jgrwBOjVw2UodEGNeDggXdrlGIb98Yl/GN2cnSnGiblNGvigicVJnA9FFzElYhPU3PO02R7Qywk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751299771; c=relaxed/simple;
	bh=czUj7eslaiDDdPu29Ldfi9GGS3647qPUTpuIfGYFLI8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=DvuIhhYWMBDdAxBZ0R2BkUFBscAi8+0a4MP37gigcAxIOHgs/knUpFjzUNF7A0R8Z0KsEfFrEK8rvOdsYrqFRPDBv7VU+IEcwBkK6IzvidNo5s4T0/H3HL96HdX0MkQa/PkDPcr/SA61RMIMvoCVYlu8aP9OJ/6BLFIY7XSExsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=xtNSb8RZ; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=sKQ4Gl+e; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="xtNSb8RZ";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="sKQ4Gl+e"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1751299765;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SgWh+8E8RTKxGksXA+o1xJJWmZfJpISlf1Dk4CiA5hE=;
	b=xtNSb8RZjSqBKP2IQVrjWflgw36UNeIc/EC8mgGnMVlLfJ9AboALwO9eLLY+9yXdAQL+zN
	A+i248Iq+y2lDr0mh41n89FnRCCDNg4nCyTCYmi/dKmrA7cQ+ZI1C/fR8WNc9gzs1oW3Sp
	ar4wfDYcn3hnJB9UAErmDYC8qmQy7dcCJDr1VTWlQKc0ORk8U2cIipeUtZO+SGg9cY31yS
	WrnSTBtAa3xpY0n41r4vaVeM7lrigKi4LVenOXBcaTyNiK0wy+VNn0HPBCgJcKtXJY/ptp
	Cxcyz0ow1RhXddhkD+LJJh2sELo5yzunCZEdD2uz8KrBInBgyBdRB72XH00Izw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1751299765;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SgWh+8E8RTKxGksXA+o1xJJWmZfJpISlf1Dk4CiA5hE=;
	b=sKQ4Gl+exyR09gQZxZEr/USGywhLUVyLmQZQeftmQheSbi5pkBj82V0GdH6Ntn1vhQY0hq
	WrpD8CbBhR5SMhDQ==
To: Anup Patel <apatel@ventanamicro.com>, Jonathan Corbet <corbet@lwn.net>
Cc: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Alexandre Ghiti <alex@ghiti.fr>, Andrew Jones
 <ajones@ventanamicro.com>, linux-doc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Anup Patel
 <apatel@ventanamicro.com>
Subject: Re: [PATCH] irqchip: riscv-imsic: Add kernel parameter to disable IPIs
In-Reply-To: <20250625161715.1003948-1-apatel@ventanamicro.com>
References: <20250625161715.1003948-1-apatel@ventanamicro.com>
Date: Mon, 30 Jun 2025 18:09:24 +0200
Message-ID: <87wm8tmcsr.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Jun 25 2025 at 21:47, Anup Patel wrote:

$Subject...

https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#patch-subject

Is it that hard?

> When injecting IPIs to a set of harts, the IMSIC IPI support will
> do a separate MMIO write to SETIPNUM_LE register of each target
> hart. This means on a platform where IMSIC is trap-n-emulated,
> there will be N MMIO traps when injecting IPI to N target harts
> hence IPIs based on IMSIC software injected MSI is slow compared
> to the SBI IPI extension.
>
> Add a kernel parameter to disable IPIs in IMSIC driver for platforms
> with trap-n-emulated IMSIC.

Why do you need a kernel parameter for that. If the platform uses trap-n
emulation, then disable the IPI muck automatically, no?

Thanks,

        tglx
