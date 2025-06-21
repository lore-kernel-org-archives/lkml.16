Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0412273814;
	Sat, 21 Jun 2025 21:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750539943; cv=none; b=STjUOFYlDRZOFloN6orOslejIW3PQVWzawz8yJbKEJC6u8UKrZsclqL4/pFyc5CSkaAjBJUQ3+GUbknFtydrOOEY4G8VmxNU3/U4Dg+O7iCc8Q6JeYoVLuNv//VJS1UGWaVi2r2zPtUpM7XZ5o4GlF14kRIgN8UlMtne3zm+A7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750539943; c=relaxed/simple;
	bh=TMo8k+8IJdqt4u8TLI55e7D9ohk0QRKTGTcOWP4yYe4=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=Id2zPW41s4MhknwR59guRsaqtq4z4z7baRoIUco6ZbS3vvrO6uykDx7w4ogk77360E/qiGqt7Ic6KfMKGtCE8wwggdcVfTXpuaDdVh4mK6s3ZpgjcA6c9SXYHdTCKHbXua+JAnrCCEri5lvkeIiLiWspEFfyyqFdBo78JAefx5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nYibt3vi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nYibt3vi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AD07C4CEF0;
	Sat, 21 Jun 2025 21:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750539942;
	bh=TMo8k+8IJdqt4u8TLI55e7D9ohk0QRKTGTcOWP4yYe4=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=nYibt3vibwJeT5u6Oe+0xRB5fmBCmGjuk13rlfTPO7vuG6LGnXpW72u0F5dIAg07+
	 8eybcWPxdm01jpzQ3i05cPKJdlId2nKTWg7Nc+0TGsrKKJMxZQ3obgJvcXb/56UJZY
	 jGCUIEImWNugMJS8lOXUxCfEp+fIsL+tKEW4gpLVprWB4f/Y3TYPEMnf2n6lUGZM46
	 55fAWOma3eXK9Np49/PUA6wEba8vWYkhiP7+qcfT96fuCe1e1dvlHahsUzIgPgp8vn
	 3g+B7h2Ml3DNi/RYemaApVbIRbEkVkvEqGng/EMac9hwexaRdhVfr2oLCsam5VT5op
	 oVQz6TeqtcHHg==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250618121358.503781-9-apatel@ventanamicro.com>
References: <20250618121358.503781-1-apatel@ventanamicro.com> <20250618121358.503781-9-apatel@ventanamicro.com>
Subject: Re: [PATCH v6 08/23] dt-bindings: clock: Add RPMI clock service controller bindings
From: Stephen Boyd <sboyd@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Len Brown <lenb@kernel.org>, Sunil V L <sunilvl@ventanamicro.com>, Rahul Pathak <rpathak@ventanamicro.com>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Atish Patra <atish.patra@linux.dev>, Andrew Jones <ajones@ventanamicro.com>, Samuel Holland <samuel.holland@sifive.com>, Anup Patel <anup@brainfault.org>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Anup Patel <apatel@ventanamicro.com>, Conor Dooley <conor.dooley@microchip.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Anup Patel <apatel@ventanamicro.com>, Bartosz Golaszewski <brgl@bgdev.pl>, Conor Dooley <conor+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Rafael J . Wysocki <rafael@kernel.org>, Rob Herring <robh@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Uwe =?utf-8?q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Date: Sat, 21 Jun 2025 14:05:41 -0700
Message-ID: <175053994174.4372.16441022738031138174@lazor>
User-Agent: alot/0.11

Quoting Anup Patel (2025-06-18 05:13:43)
> Add device tree bindings for the RPMI clock service group based
> controller for the supervisor software.
>=20
> The RPMI clock service group is defined by the RISC-V platform
> management interface (RPMI) specification.
>=20
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
