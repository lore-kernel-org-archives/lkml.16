Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C389326FD9F;
	Sat, 21 Jun 2025 21:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750541040; cv=none; b=Py9HAZORu1afBNv7LcCYfigCwdRy9AJ7TiyEvmPf/HrbxQ0Huv9+Eotu9drZl/MWhXGviofQS/m9dGzaXmFxjqWVlfyA7XXOEH2AiSx0Ja7OI7eLeouO8YUvZ1qmvmU0omdXHdXP+l2YylXMN5d9q/CxNauNRGCi5ABvGczOMA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750541040; c=relaxed/simple;
	bh=zd3fXuoMbyMxNdsIZpDsy0sSLOEAB8oXLIP0Lcpc6Fc=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=W+kEoEhY/8ZedASzmiBWsmjG5EarEG8LXDFgRhMblBsRs6iwG5riCmi1LPmkCXA0GS3fVAsA7yQVpNZZdQppYeveyMzxCE7p6XHBqIag0tXUCKkvkOXdZsxoaz8vtLUxHTfyZNsJ9SuGW46XsuPFOfoCH0Vi2LZITTLhyMr13eM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AG6hx8Zt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AG6hx8Zt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44141C4CEE7;
	Sat, 21 Jun 2025 21:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750541040;
	bh=zd3fXuoMbyMxNdsIZpDsy0sSLOEAB8oXLIP0Lcpc6Fc=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=AG6hx8ZtawSHqSdTxhjYS00Q7ig6DQAbk8ur5cKXwCxisexAWvcGZNKzo/TKno/rI
	 zy7CF/wx/XnBhtbaGqAGauZxQrohXwrhSR80khthS4J8nca5jaLzSKFf9EugWlDLMY
	 q72KjtumhW9ZymsGMy/mWguJtsMC8gCeJnoba2wGnuiPqmrSJSfj0ahoK41Iz8eyPB
	 8zBPNVUqiE/4qMm3HT3cCQa+QoqrOvZh4m33unmqHjJR8i3zppUigSR0OK8RqKR+Md
	 WY/JESyDdwxZsfxUjfkeD/Fo/8Jdq666wzZzn7rCwTl2gagJVHaDj87a4uTEM4JLld
	 5sH9t0q/arG0Q==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250410030438.53232-1-bsdhenrymartin@gmail.com>
References: <20250410030438.53232-1-bsdhenrymartin@gmail.com>
Subject: Re: [PATCH v1] ASoC: imx-card: Add NULL check in ap806_syscon_common_probe()
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Henry Martin <bsdhenrymartin@gmail.com>
To: Henry Martin <bsdhenrymartin@gmail.com>, andrew@lunn.ch, gregory.clement@bootlin.com, mturquette@baylibre.com, sebastian.hesselbarth@gmail.com
Date: Sat, 21 Jun 2025 14:23:59 -0700
Message-ID: <175054103949.4372.16293868938290251169@lazor>
User-Agent: alot/0.11

Quoting Henry Martin (2025-04-09 20:04:38)
> devm_kasprintf() in ap_cp_unique_name() returns NULL when memory
> allocation fails. Currently, ap806_syscon_common_probe() does not check
> for this case, which results in a NULL pointer dereference.
>=20
> Add NULL check after ap_cp_unique_name() to prevent this issue.
>=20
> Fixes: baf4c10f8878 ("clk: mvebu: ap806: Fix clock name for the cluster")
> Fixes: 33c0259092c8 ("clk: mvebu: add helper file for Armada AP and CP cl=
ocks")
> Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
> ---
>  drivers/clk/mvebu/ap806-system-controller.c | 24 +++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>=20
> diff --git a/drivers/clk/mvebu/ap806-system-controller.c b/drivers/clk/mv=
ebu/ap806-system-controller.c
> index 948bd1e71aea..1461922752e3 100644
> --- a/drivers/clk/mvebu/ap806-system-controller.c
> +++ b/drivers/clk/mvebu/ap806-system-controller.c
> @@ -173,6 +173,10 @@ static int ap806_syscon_common_probe(struct platform=
_device *pdev,
> =20
>         /* CPU clocks depend on the Sample At Reset configuration */
>         name =3D ap_cp_unique_name(dev, syscon_node, "pll-cluster-0");
> +       if (!name) {
> +               ret =3D -ENOMEM;
> +               goto fail0;
> +       }
>         ap806_clks[0] =3D clk_register_fixed_rate(dev, name, NULL,

TL;DR: This patch is unnecessary.

If name is NULL this function will fail. See the kstrdup_const() call in
__clk_register() and how it returns -ENOMEM when the copy of the
init.name is NULL, which is what happens when you duplicate a NULL
pointer.
