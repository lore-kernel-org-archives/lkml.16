Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66D022741AF;
	Sat, 21 Jun 2025 21:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750542772; cv=none; b=SewOFKajAleZ1VjnLtYTulSh7MezOKiZc57d4L4kPOZTEwH7NaAYubpnoNiR03oubki8zVStciF3xENEXJK3JcTV6q3F4bdty/V6CdIVHuYXf3De50BdgIZ5m9SXiyonafw3+brP5JB9IY5srTF+ROJBCKudx1OWJp3AopFARRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750542772; c=relaxed/simple;
	bh=dUdUWZGtBD23U+ihPBC5BGmCbIJ5i9RGd9rC/GvA320=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=hatztd6BKlLsw+PzpQyhtpUZvE2rA6IkyOht8UXKj7A0J5PeBioaf3oV2yNXH8sql6Qmr7J6IEAnm8fH1mBMKpv+hsysl3brgghJidcGIR3k13zBtR0ztv331K28JfOu7bLOfHXg9P4WWbLLSSJxdwLt8Ktgk1emai6E9YM6xDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CNkGpGC1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CNkGpGC1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAC21C4CEE7;
	Sat, 21 Jun 2025 21:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750542771;
	bh=dUdUWZGtBD23U+ihPBC5BGmCbIJ5i9RGd9rC/GvA320=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=CNkGpGC1QTuntxEszxeykAPy/b2wWKWygsbZloOzpvurxkxwr0K4N4cIqMAWmJr3k
	 Ob3RYhCmhgIdjq5LAAi+djlhZYWPemXpSmVSVI9LzHjSFDDMV4Lij91/f7/Nyfg4Zq
	 w5NHBgQL0w8GicxKTvq94M6+Djmf6W5hmlIn2GbN16HmeftrEFhD0GHXPQYpZUBz06
	 /6n8nBSMjElyOuHP/mVPWEzXO8d1FfwofdDVH/G8lZZROjeMTudGKzPazU0QR/jQ0U
	 GSfNBcPvtMmdti5FevTucwwO0fAlszNzjEzHgYZ2P/+AjK4A6HrEGbnlon747jlgfj
	 0A2PZ86imlWGQ==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250210113614.4149050-3-rohit.visavalia@amd.com>
References: <20250210113614.4149050-1-rohit.visavalia@amd.com> <20250210113614.4149050-3-rohit.visavalia@amd.com>
Subject: Re: [PATCH v3 2/2] clk: xilinx: vcu: Update vcu init/reset sequence
From: Stephen Boyd <sboyd@kernel.org>
Cc: javier.carrasco.cruz@gmail.com, geert+renesas@glider.be, u.kleine-koenig@baylibre.com, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Rohit Visavalia <rohit.visavalia@amd.com>
To: Rohit Visavalia <rohit.visavalia@amd.com>, michal.simek@amd.com, mturquette@baylibre.com, vishal.sagar@amd.com
Date: Sat, 21 Jun 2025 14:52:51 -0700
Message-ID: <175054277123.4372.1455513715429068984@lazor>
User-Agent: alot/0.11

Quoting Rohit Visavalia (2025-02-10 03:36:14)
> Updated vcu init/reset sequence as per design changes.
> If VCU reset GPIO is available then do assert and de-assert it before
> enabling/disabling gasket isolation.
> This GPIO is added because gasket isolation will be removed during startup
> that requires access to SLCR register space. Post startup, the ownership =
of
> the register interface lies with logiCORE IP.
>=20
> Signed-off-by: Rohit Visavalia <rohit.visavalia@amd.com>
> ---

Applied to clk-next
