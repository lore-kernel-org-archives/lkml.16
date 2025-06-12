Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E118C3C47B;
	Thu, 12 Jun 2025 13:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749733438; cv=none; b=irV/FSy+6WcJ7EgnCX8dpO9KGaVsX+2ZlPTPFxIFbi/e3cZxot5sQWd57jtVXT7yzLgXTUazoDdoQnFQjTaBArUMxMRvfZtExSsBNDk+lr1GYf+zyY0ptSSUu5MV0rE+Wd+fdsI0D2ofH86vgx7E/RcfCgYJUFIc8g+1l9TLyzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749733438; c=relaxed/simple;
	bh=Z0grezPSoGr5pXzkUAsQ8shemjlZEwpuaPFyJwa6sWE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=lPBB3HbgmccX8KHhidmelngIyqhX7wiAbVClrB2Ke5TZF8MtBrV3K6IDipQAVqZqPwUgniH+Y3e1hxdnpQvB6R1MlGdNGUj5fKvSvV5MF+pTPl78kB3zGgFO5obymUzOCmKAH09ST6T6NUVgwxABrTD1ARWhHjbl1ZyZUYFdeQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=HKzm1HBR; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=GlCjmsnp; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="HKzm1HBR";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="GlCjmsnp"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749733434;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HZNcAOEiL3XjwzVrB/UHurIxwW0UwH/mpeP/ua8JcaY=;
	b=HKzm1HBRKnHelVN43bRcu96NW1WHIrHMsq5hv097N9N7jLbjaiJsGWojti9nurVuuBL4r0
	PKwl74gj+VIH8KePn4AdEb7sddKufpCu+eIzuG1LPQPZG5P0ARKx7XltTvhMoSCxsPe3fU
	Z27WWPqiRZBFfBCMhyXDrC0/qgWjy68oI1ixDs4Wn205lSKZU+pAEWQPjgDeb0/KjWtQl/
	CQ8P9/X44uNsYJY1wPjrkYR0Eg4ZrnY20CAmi33MRlBH277vdBirDlI5tGGYRtMOZOmS/T
	ezvYYf6pZR8oeiX5aKiAbCI+71TCZ/yc5lR/NBRt9XkTgJUfxGHXrjJ9MlQ5+Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749733434;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HZNcAOEiL3XjwzVrB/UHurIxwW0UwH/mpeP/ua8JcaY=;
	b=GlCjmsnpmUVkNWwToYaFt5t5n4hO8nGY3LbhYhRMlVodb9+ZoBG/85IAyOn+C1HOieKWFX
	mUOQXYPfmZDmdEAg==
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre
 Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, Chen Wang
 <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, Sunil V L
 <sunilvl@ventanamicro.com>, "Rafael J . Wysocki"
 <rafael.j.wysocki@intel.com>, Ryo Takakura <takakura@valinux.co.jp>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, sophgo@lists.linux.dev, Vladimir
 Kondratiev <vladimir.kondratiev@mobileye.com>
Subject: Re: [PATCH v2 4/7] irqchip: MIPS P800 variant of aclint-sswi
In-Reply-To: <20250610100540.2834044-5-vladimir.kondratiev@mobileye.com>
References: <20250609134749.1453835-1-vladimir.kondratiev@mobileye.com>
 <20250610100540.2834044-1-vladimir.kondratiev@mobileye.com>
 <20250610100540.2834044-5-vladimir.kondratiev@mobileye.com>
Date: Thu, 12 Jun 2025 15:03:54 +0200
Message-ID: <87ecvpru11.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Jun 10 2025 at 13:05, Vladimir Kondratiev wrote:
> +config ACLINT_SSWI
> +	bool
> +
> +config MIPS_P8700_ACLINT_SSWI
> +	bool "MIPS P8700 ACLINT S-mode IPI Interrupt Controller"
> +	depends on RISCV
> +	depends on SMP
> +	select IRQ_DOMAIN_HIERARCHY
> +	select GENERIC_IRQ_IPI_MUX
> +	select ACLINT_SSWI
> +	help
> +	  This enables support for MIPS P8700 specific ACLINT SSWI device
> +
> +	  If you don't know what to do here, say Y.
> +
>  config THEAD_C900_ACLINT_SSWI
>  	bool "THEAD C9XX ACLINT S-mode IPI Interrupt Controller"
>  	depends on RISCV
>  	depends on SMP
>  	select IRQ_DOMAIN_HIERARCHY
>  	select GENERIC_IRQ_IPI_MUX
> +	select ACLINT_SSWI
>  	help
>  	  This enables support for T-HEAD specific ACLINT SSWI device
>  	  support.

That's just exactly the same thing twice for no value. Just rename it to
ACLINT_SSWI and have a list of supported chips in the help text.

The only issue with the rename is, that oldconfig will drop the then
non-existing THEAD_C900_ACLINT_SSWI entry in the previous config. That's
not the end of the world and if really desired this can be solved by
having:

config ACLINT_SSWI
	bool "RISCV ACLINT ...."
	depends on RISCV
	depends on SMP
	select IRQ_DOMAIN_HIERARCHY
	select GENERIC_IRQ_IPI_MUX
	select ACLINT_SSWI
	help
	  This enables support for ACLINT SSWI device on THEAD C9XX and
	  MIPS P8700 devices.

# Backwards compatibility so oldconfig does not drop it.
config THEAD_C900_ACLINT_SSWI
	select ACLINT_SSWI

Or something like that.

Thanks,

        tglx
