Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A4832E401;
	Wed, 30 Apr 2025 22:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746051341; cv=none; b=PB+UkDUiW9y1uoswi4xO2XpTX9vOr/I6CPDHzKq9dtvBt5wzEa/TWURPQjajKLbkwf0WYRaiY8Y+WhnJlIQV1Ycvz4YBICKnAsDZJVQ+OJ2FfSFHgLmd8DtPUTB1fhEBI1c4281kWIR/deXBhiQiUESnR3p22z0M1ppcKibpsCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746051341; c=relaxed/simple;
	bh=aIbmssw0385CGx5GhIR2R+vsPi0bJ2we8C8Kd4Sw5CI=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=W7YzRbTR2xnyHV6a1E84AgMydAG442uT9kzo4Fu91VzlzfmE071vCshMnqHXlvXCJgliLIUlTRRFF7UoUR39JZ/wYvOR1l21QHhBz83LAP2zJ8PIXpj6gc+zhWbeagZwJxgjlzMCSjaSCp6jRp6Lt8wL4sH4pyGksuuCREJ97WA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XAH9YqRc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XAH9YqRc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E957AC4CEE7;
	Wed, 30 Apr 2025 22:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746051341;
	bh=aIbmssw0385CGx5GhIR2R+vsPi0bJ2we8C8Kd4Sw5CI=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=XAH9YqRcw/tW78dB534Ne6D7YpedE8wyfVkqbCd3WdD1Zg87kdihfeBaQE7jOHHc3
	 u5WeQx4n7FeyAZh+7H4HVbML1U9c9gXfVIpnafL2Fte6CoLKR7mvL70B6ga9OBhchw
	 sSuE8v7wWKXqieMNXB6R1162zdqIYhs2WrNK/hSE1NPvEtyGrAjMDujZuaDEsKc7Pn
	 lXI0JvkqTcuFYclDgufQ8tI6wEc//xn4Cf9eH3sEbpw7G270RH+6gRjeJD3n92/pmB
	 12xrQrpgz4dIDe+lTkXChKwd9+h4VbH3R+8js+2osFxfJzedJS0tKJkXdttaXeVa3z
	 pN5Vmct4KVD9A==
Message-ID: <40bf9ffc7ae98f6601122cd8850418f5@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250430-clk-cdce6214-v4-1-9f15e7126ac6@pengutronix.de>
References: <20250430-clk-cdce6214-v4-0-9f15e7126ac6@pengutronix.de> <20250430-clk-cdce6214-v4-1-9f15e7126ac6@pengutronix.de>
Subject: Re: [PATCH v4 1/3] clk: make determine_rate optional for non reparenting clocks
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, kernel@pengutronix.de, Alvin =?utf-8?q?=C5=A0ipraga?= <alsi@bang-olufsen.dk>, Sascha Hauer <s.hauer@pengutronix.de>
To: Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>
Date: Wed, 30 Apr 2025 15:15:38 -0700
User-Agent: alot/0.12.dev8+g17a99a841c4b

Quoting Sascha Hauer (2025-04-30 02:01:34)
> With commit 326cc42f9fdc ("clk: Forbid to register a mux without
> determine_rate") it became mandatory to provide a determine_rate hook
> once a set_parent hook is provided. The determine_rate hook is only
> needed though when the clock reparents to set its rate. Clocks which do
> not reparent during set_rate do not need a determine_rate hook, so make
> the hook optional for clocks with the CLK_SET_RATE_NO_REPARENT flag.

Do you have a set_parent clk_op that you want use? But you set the flag
so that rate changes don't try to change the parent? Do you implement
a round_rate clk_op? I'm guessing round_rate isn't implemented.

We want to get rid of round_rate and move drivers to use determine_rate
everywhere because it passes a struct that we can extend in the future
to do coordinated rate changes, per-clk locking, etc.

We could change this to be something like:

 if (core->ops->round_rate && core->ops->determine_rate)
   return -EINVAL and pr_err("Pick one, not both");
 if (core->ops->set_parent && core->ops->round_rate)
   return -EINVAL and pr_err("must implement .set_parent & .determine_rate")

so that if you have a set_parent clk_op you better implement
determine_rate if you support changing the rate, regardless of the clk
flags. I worry that we have some driver that implements both round_rate
and determine_rate though. Indeed, the clk_divider_ops does that to
support being copied by other clk drivers so we'll need to make the
logic this:

 if (core->ops->set_parent && clk_core_can_round(core) && !core->ops->deter=
mine_rate)
   return -EINVAL and pr_err("must implement .set_parent & .determine_rate")

> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 0565c87656cf5..07ae3652df6c1 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -3937,7 +3937,8 @@ static int __clk_core_init(struct clk_core *core)
>                 goto out;
>         }
> =20
> -       if (core->ops->set_parent && !core->ops->determine_rate) {
> +       if (!(core->flags & CLK_SET_RATE_NO_REPARENT) &&
> +           core->ops->set_parent && !core->ops->determine_rate) {
>                 pr_err("%s: %s must implement .set_parent & .determine_ra=
te\n",
>                         __func__, core->name);
>                 ret =3D -EINVAL;
