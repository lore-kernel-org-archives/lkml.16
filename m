Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC7D01D5ACE;
	Sat, 21 Jun 2025 21:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750539890; cv=none; b=e+C7rGXvujqRTNcP7e6fvKxSHVAu01/b54nTcfD3FU487NLqsemJg2szcIENnH5EaAciLrbA1LSn4sYc14tQG6/phtFvoY3A1B5kB8O+mO6Vco3nOBsSFIfZ8uYHZYGSxv/P0TSU45TcKal9gPiydlfoq0o8mamjKwrjFfmvfOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750539890; c=relaxed/simple;
	bh=I+H/ACdKPJZiazgKrac5bRP/4sQkTk9nIYPRUqznQ7M=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=TlDv+W7zK5KuI7oPp2ccwd11qz3K5ZNy86Rhcf7hQkPXFCxt62gj8YuJ4a0Jirgoc/KaWcU36wkqGpYefNEwli/K7Lhl1O/RYZCagN91hiJGUU6IgQi8UDyRQF5f+IvpVjVIcd+n5cJK4NFXYs4Ei0l6gzbo4f4zvbPy8wns/oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SHvMKmZC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SHvMKmZC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2130FC4CEE7;
	Sat, 21 Jun 2025 21:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750539890;
	bh=I+H/ACdKPJZiazgKrac5bRP/4sQkTk9nIYPRUqznQ7M=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=SHvMKmZCkSpZ7VJko/5vLNJI7f1Mc4vSlEVWHE8hQMbJxG9mO4BAaNuayQVytTDzf
	 NUCx+Z2ansv6KkVCwFAbpl6qVnO8hQLoI/VCnTP0G9nIXtUrcCRbyXBmpfFMYLncAp
	 L0YMxSU/CYTST4o4L3Bi37qQe7msF4Xkh7yt+QtTOt4RgYbdkOiqGwDwhyz8mIJRdi
	 BuS/rcy+m/8UkHKdmTmyjRy8P58uZhyf5oS673ayorBKLni5bW1YktdA9DBvYjDP4T
	 IdqNT6zo/H/ja4zuWBKSStVNdWqdjUH4bBNWPAFfboJ7tmd4Nd8Om10AEWdksfhsyO
	 OfvvunTqLdwhA==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250618121358.503781-10-apatel@ventanamicro.com>
References: <20250618121358.503781-1-apatel@ventanamicro.com> <20250618121358.503781-10-apatel@ventanamicro.com>
Subject: Re: [PATCH v6 09/23] clk: Add clock driver for the RISC-V RPMI clock service group
From: Stephen Boyd <sboyd@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Len Brown <lenb@kernel.org>, Sunil V L <sunilvl@ventanamicro.com>, Rahul Pathak <rpathak@ventanamicro.com>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Atish Patra <atish.patra@linux.dev>, Andrew Jones <ajones@ventanamicro.com>, Samuel Holland <samuel.holland@sifive.com>, Anup Patel <anup@brainfault.org>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Anup Patel <apatel@ventanamicro.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Anup Patel <apatel@ventanamicro.com>, Bartosz Golaszewski <brgl@bgdev.pl>, Conor Dooley <conor+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Rafael J . Wysocki <rafael@kernel.org>, Rob Herring <robh@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Uwe =?utf-8?q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Date: Sat, 21 Jun 2025 14:04:49 -0700
Message-ID: <175053988941.4372.15869767607401919839@lazor>
User-Agent: alot/0.11

Quoting Anup Patel (2025-06-18 05:13:44)
> From: Rahul Pathak <rpathak@ventanamicro.com>
>=20
> The RPMI specification defines a clock service group which can be
> accessed via SBI MPXY extension or dedicated S-mode RPMI transport.
>=20
> Add mailbox client based clock driver for the RISC-V RPMI clock
> service group.
>=20
> Co-developed-by: Anup Patel <apatel@ventanamicro.com>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> Signed-off-by: Rahul Pathak <rpathak@ventanamicro.com>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
