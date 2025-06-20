Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 697607485;
	Fri, 20 Jun 2025 00:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750379409; cv=none; b=JR9C5CQjZaUYVIKhcTwFaJKaPx7PL2iF6XLoC91Ey4psQ0bIiZDTcwn7pg6iTfijsxjGFzgiTQGn+hY9tjdbhDZXaIYEI5Mu2l9Bvf0tfkB/6wzx+63Vq/57phbFZ1HdRSgaLjKKk0mTI2hTfXzwOPoE2nZJPc+FAhC/G5e93sY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750379409; c=relaxed/simple;
	bh=94Lp03DmKEYMZSuv0ZiVjs4rQ14XbBrJIqhyLo0+8J8=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=OET4dc3+0/bZeQ99oDlkSm5nky3WL5TONB+DUmGMQ3OmDRhdly4Z92vYMhI1IC1KkPyNeQWHQUpVGHmyWMUQpkiaJEO3COZWDeL4vi0Ghh609LE4+IPnKXAYHBhX9KgdXwsU9pZx+DilKDXAAKdxoQBsPw+1ZM5ScjfCtuUUhj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L8VLQmM8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L8VLQmM8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38F35C4CEEF;
	Fri, 20 Jun 2025 00:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750379409;
	bh=94Lp03DmKEYMZSuv0ZiVjs4rQ14XbBrJIqhyLo0+8J8=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=L8VLQmM8Uba3vvqfAPrS8yiZXctb0PiTE5txEc+xp6R3EmtXXRN0Ko7mFFS7pnp4D
	 ezVfLxBo68B/Cx1y4poNuvLeI50x7gMz8+VqwXPH+u5sILgVhy3elN6iMtWcc5aFF2
	 gcrif9pW3bErm1NsNgw1Fb7hgaP3c723b9vHIkyR70zZzt/V56v+zxkycnhZAUnLGy
	 /Re/1BW3GD8JKlsUtEwGQjkK4jAE5n7S4NSepDmkhzxSOgoxuhMMnTtZF+Zh/wJtil
	 6DJH0Z1ISidwdMyNQgXsS0Ien98f3w8PyiZMfSX2ZYCnZmp7GM51/kOLbBz54EdSfS
	 ZQMHFJdTGhjWg==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250612-clk-scmi-children-parent-fix-v3-1-7de52a27593d@pengutronix.de>
References: <20250612-clk-scmi-children-parent-fix-v3-1-7de52a27593d@pengutronix.de>
Subject: Re: [PATCH v3] clk: scmi: Handle case where child clocks are initialized before their parents
From: Stephen Boyd <sboyd@kernel.org>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>
To: Cristian Marussi <cristian.marussi@arm.com>, Michael Turquette <mturquette@baylibre.com>, Peng Fan <peng.fan@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, Sudeep Holla <sudeep.holla@arm.com>
Date: Thu, 19 Jun 2025 17:30:08 -0700
Message-ID: <175037940843.4372.15491046245744789361@lazor>
User-Agent: alot/0.11

Quoting Sascha Hauer (2025-06-12 05:56:57)
> The SCMI clock driver currently assumes that parent clocks are always
> initialized before their children. However, this assumption can fail if
> a child clock is encountered before its parent during probe.
>=20
> This leads to an issue during initialization of the parent_data array:
>=20
>     sclk->parent_data[i].hw =3D hws[sclk->info->parents[i]];
>=20
> If the parent clock's hardware structure has not been initialized yet,
> this assignment results in invalid data.
>=20
> To resolve this, allocate all struct scmi_clk instances as a contiguous
> array at the beginning of the probe and populate the hws[] array
> upfront. This ensures that any parent referenced later is already
> initialized, regardless of the order in which clocks are processed.
>=20
> Note that we can no longer free individual scmi_clk instances if
> scmi_clk_ops_init() fails which shouldn't be a problem if the SCMI
> platform has proper per-agent clock discovery.
>=20
> Fixes: 65a8a3dd3b95f ("clk: scmi: Add support for clock {set,get}_parent")
> Reviewed-by: peng.fan@nxp.com
> Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
> Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---

Applied to clk-fixes
