Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7601B270571;
	Sat, 21 Jun 2025 21:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750539604; cv=none; b=HQPAOgLoXofioX/UesUTm/+FGSFrtrc8Ux/PzL0gGuZljrpAEQv+GTjQd78HgQ2YfFjPN3ja9frh0DOqUYXDwXwY4loM7H9k+MT59HF0TxcRatQUTKIlYedUzi0GxXkdGH6SQDKHkkFY8J+459QgSHGHcIspJaKRkOsqYnG4yAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750539604; c=relaxed/simple;
	bh=4WspGBe2UN50/5ro6MGwqXsBIUukFUCub7kmgEVQA78=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=GIJuuGhLbwenVsnwQm8DabMb/ZsNzE9Lgw/SdU+w3NKTbFiKIwE9hoBQhMXRGcx5zcH2gXT96zR8g0rYaUU+rwE5azN7OmGFVBtnOOMWlkiLOR1OXFGB1weJu7/UV91SdSTzSeUQ3ohZHqWSRS7VFxkpVJoCKYH61o/l2PUhQHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kzKH9cjU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kzKH9cjU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D98C7C4CEE7;
	Sat, 21 Jun 2025 21:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750539604;
	bh=4WspGBe2UN50/5ro6MGwqXsBIUukFUCub7kmgEVQA78=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=kzKH9cjUVbv/vD4lGTHuyDtsXhZ7h5gC/DKWkygspQV525izF/qE3DAW1qs/mNFgV
	 bavgFL7egmSp/ijtoaunub+wItuoAxwWhDB3ljvMFCGA3O7duAaKmgynBePGASOJyT
	 t7WVmcL8xbQvffSRXO1SgQicc9ldhtf20N9oaGW3A5pL7bGY2tBn3rNRYOmzWjlnUJ
	 L3758RxIG+1IvCZf6p3hwa+5m2o90RBfGLfbvPCnm85HtDfDJAsupw0i/6048XoHwy
	 r70ylXPVOOU7ZOhTbKJGwEg/xLCdkIhx29/oMe3VTuNDY43RiGpF+DfkZeQy9AHF+r
	 2koi4Jw35TUyA==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250618121358.503781-8-apatel@ventanamicro.com>
References: <20250618121358.503781-1-apatel@ventanamicro.com> <20250618121358.503781-8-apatel@ventanamicro.com>
Subject: Re: [PATCH v6 07/23] dt-bindings: clock: Add RPMI clock service message proxy bindings
From: Stephen Boyd <sboyd@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Len Brown <lenb@kernel.org>, Sunil V L <sunilvl@ventanamicro.com>, Rahul Pathak <rpathak@ventanamicro.com>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Atish Patra <atish.patra@linux.dev>, Andrew Jones <ajones@ventanamicro.com>, Samuel Holland <samuel.holland@sifive.com>, Anup Patel <anup@brainfault.org>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Anup Patel <apatel@ventanamicro.com>, Conor Dooley <conor.dooley@microchip.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Anup Patel <apatel@ventanamicro.com>, Bartosz Golaszewski <brgl@bgdev.pl>, Conor Dooley <conor+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Rafael J . Wysocki <rafael@kernel.org>, Rob Herring <robh@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Uwe =?utf-8?q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Date: Sat, 21 Jun 2025 14:00:03 -0700
Message-ID: <175053960304.4372.5933123695583752824@lazor>
User-Agent: alot/0.11

Quoting Anup Patel (2025-06-18 05:13:42)
> diff --git a/Documentation/devicetree/bindings/clock/riscv,rpmi-mpxy-cloc=
k.yaml b/Documentation/devicetree/bindings/clock/riscv,rpmi-mpxy-clock.yaml
> new file mode 100644
> index 000000000000..70ffc88d0110
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/riscv,rpmi-mpxy-clock.yaml
> @@ -0,0 +1,64 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/riscv,rpmi-mpxy-clock.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
[...]
> +
> +examples:
> +  - |
> +    clock-controller {
> +        compatible =3D "riscv,rpmi-mpxy-clock";
> +        mboxes =3D <&rpmi_shmem_mbox 0x8>;
> +        riscv,sbi-mpxy-channel-id =3D <0x1000>;

Why aren't there any #clock-cells in this clock controller node?
