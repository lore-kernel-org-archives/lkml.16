Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5708F2063FF
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 14:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738592271; cv=none; b=qI7N/JuzP7r4WADMXv7TKX60FZmvUl+e0Vd+7BMZ99x36bDBTqwcYa1X5hKKSHgVts9wyZuYBMDvCMTIFAadqZXHUui40ksEB6oDgcmilyIdg8Pori6MSZWn4mgRZ9NFYaIg+YjQGBVjJbfP0toFXBv/Ude2OqzryVO3JWdlvOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738592271; c=relaxed/simple;
	bh=pi7eW0lKWUQJuGGtDbxdp2mlJrPfrwS77sp0qaNAAKc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=iZy4gxulJyiaOrigciejzqgN6UrQ7NTImZrx1PMF9Mbb43YZkeSwRHDMuAvZ1jgV/O98haof2xClEHkhSFDmmgHDAHRTr9zF5c4Go6y79nmlUKnQMy+zJB6koROWLnwh5qzOrmgC0csgDF4fZPLOH4Ambuu0Ei7pcd6GpZYj6s8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Mf8dvdSf; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Mafj2AVK; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Mf8dvdSf";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Mafj2AVK"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738592268;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=J85aJuJVnCtJF5A7o6Xk9eZppKHaaO4RuNSzWv4mXis=;
	b=Mf8dvdSfuCus0IcvuuE5SN1Zl0DFclaAOSmSDUPvlBIzIb3XYgoP7bFYtytu0JuQhQ8vMc
	tAWVKC2ttVgKRJOdjfT09T/8NjB5PmdtLbZHNIObKtUDoL/fdIC+5CUgvvNJVQqq6fLmYL
	qjMq6iP4uu+mtYcHjXp64k9s95PiJ04xGIJwJi7gwr28jDZgoUmi5vxvF5FvYVbFAwFFbA
	kbknquNU4xeTXnGWhamxjUEOmLZGU1yvE36fZa4ukglnKUnZ8CjV+kKwKvhe4S5lLTJjI0
	sDW02M+ZDNzYq0gZ2XdGa8tbYZoSjqZ5cuBjJJlIn7XJoEO8Y7gZ4zS789rvMA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738592268;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=J85aJuJVnCtJF5A7o6Xk9eZppKHaaO4RuNSzWv4mXis=;
	b=Mafj2AVKQixDU9txGK8CdHh1AG0JOnfTDQPBdQG03PJFTImSaoxh+QBrJGMJCIZqlQhtLI
	spX3B9cl0wUjMNAA==
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
Subject: Re: [PATCH v2 00/11] RISC-V IMSIC driver improvements
In-Reply-To: <20241214172549.8842-1-apatel@ventanamicro.com>
References: <20241214172549.8842-1-apatel@ventanamicro.com>
Date: Mon, 03 Feb 2025 15:17:48 +0100
Message-ID: <87tt9bnmcz.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Anup!

On Sat, Dec 14 2024 at 22:55, Anup Patel wrote:
> This series is based on recent discussion on LKML:
> https://lore.kernel.org/lkml/20241114161845.502027-18-ajones@ventanamicro.com/
>
> It primarily focuses on moving to RISC-V IMSIC driver use common MSI
> lib and GENERIC_PENDING_IRQ.

Can you please respin this series on top of rc1?

Thanks,

        tglx
