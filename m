Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8ADD1A0BC5;
	Sat, 21 Jun 2025 21:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750542766; cv=none; b=BINCXtLiZTjXjQ3P+/S4mbkzj8v1AaIsJExn8rTb++nYZC/zN/qdrBDaLzzOMWuWWLcmf+mKQVeKfGkHZ+pcmFElZiyFU+AZ9rVOC6cGxiLSkeEfIxVdIsNSsDUzusPdyXZQ1cuJflXdAosBuxneXhToONtyjChIGbDmwEIJU/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750542766; c=relaxed/simple;
	bh=nQHCSruCNHH1sf9Mwvwst8ohiEy2euUE/z0M6MAEptM=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=oJ6BMr7773UmCCTO1ALZsgq6RpL/xQR+w1P89OmGyb6skFkgtOOINpbnq492EueWf6nMTxXoZ0dQiI9KyO3lp1+32IrY5id6+beHmTxTfBFLk20AOtwmM8j3YN8TATh/uBKd1R6BDQcxxAE1S2wKRKnDogEMRHmO8vYXg2jhvJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bbIPaVk5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bbIPaVk5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A5BEC4CEE7;
	Sat, 21 Jun 2025 21:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750542765;
	bh=nQHCSruCNHH1sf9Mwvwst8ohiEy2euUE/z0M6MAEptM=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=bbIPaVk5U53Akc6BpwPIR+4FSOa4vTGZu1n/jHXTus5cLfXBFg5P+CHGhPl6UqlcJ
	 KFMCPlU4RrVpJ9hNiJ0nifcVwiMz5C9+VzxkmGynfw+mTau1hRUHPUJ6Z2gvKWIXZI
	 Pm9pzbSrTbi/M+IFz0nTx1r9Fw2GGghuypX+fDl7n5Xqq+7bXGjVX9APSI+sgxFR6X
	 Ty9KD6MqQv36qxAWvFstRSChAw/P9q7tm5IBxX0htoGNLqk2eQnxgw/KfCMeezFxpq
	 kHyfQt+YrQkBNsLTgbQcYFtssL9FzfbkaclcNz+i+8eYO+Xbt3o4IWSdaJgqHy0uOx
	 K8ggb3tE6MF+A==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250210113614.4149050-2-rohit.visavalia@amd.com>
References: <20250210113614.4149050-1-rohit.visavalia@amd.com> <20250210113614.4149050-2-rohit.visavalia@amd.com>
Subject: Re: [PATCH v3 1/2] clk: xilinx: vcu: unregister pll_post only if registered correctly
From: Stephen Boyd <sboyd@kernel.org>
Cc: javier.carrasco.cruz@gmail.com, geert+renesas@glider.be, u.kleine-koenig@baylibre.com, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Rohit Visavalia <rohit.visavalia@amd.com>
To: Rohit Visavalia <rohit.visavalia@amd.com>, michal.simek@amd.com, mturquette@baylibre.com, vishal.sagar@amd.com
Date: Sat, 21 Jun 2025 14:52:44 -0700
Message-ID: <175054276458.4372.13734001282575754373@lazor>
User-Agent: alot/0.11

Quoting Rohit Visavalia (2025-02-10 03:36:13)
> If registration of pll_post is failed, it will be set to NULL or ERR,
> unregistering same will fail with following call trace:
>=20
> Unable to handle kernel NULL pointer dereference at virtual address 008
> pc : clk_hw_unregister+0xc/0x20
> lr : clk_hw_unregister_fixed_factor+0x18/0x30
> sp : ffff800011923850
> ...
> Call trace:
>  clk_hw_unregister+0xc/0x20
>  clk_hw_unregister_fixed_factor+0x18/0x30
>  xvcu_unregister_clock_provider+0xcc/0xf4 [xlnx_vcu]
>  xvcu_probe+0x2bc/0x53c [xlnx_vcu]
>=20
> Fixes: 4472e1849db7 ("soc: xilinx: vcu: make pll post divider explicit")
> Signed-off-by: Rohit Visavalia <rohit.visavalia@amd.com>
> ---

Applied to clk-next
