Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE0C20F09C;
	Mon,  9 Jun 2025 09:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749459979; cv=none; b=lptigoo3MfNSixUg3Nj+ZJpcdf449Wj9LaYgbQnBTbhQvl4JIxZbeXe1BdW29Ps1zJ4hmuAa1Bp742SLcpk5vX0AY+6uSJL9qeXZs/aveN9B19MwB+VZrvclvEGMQgvU3lRUlo+cNbHRXyj36PGH9TEuY0WPQOZ05rndl+qHGSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749459979; c=relaxed/simple;
	bh=joBlEjrgr9muiP0UDjGGGTEJ6Vs1HF+Fy4q2Nr/4iJc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EMrPA3JsYVcpGohc5HqAekvusx38Zlxmu1QFVYRaTtAerUoIoR1mquNny2qox3d0GlIwmEMRgjEgfkvGVAihhI7bDRVu1ssVTY9EwGHvOndnlmrPGehDW5LhjXjg0y2GN/BwuGSLsjyg1wZiZ+6soTeWotJAzpcc9RZTvBrsk3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=d2TvmF6n; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="d2TvmF6n"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=joBlEjrgr9muiP0UDjGGGTEJ6Vs1HF+Fy4q2Nr/4iJc=; b=d2TvmF6njbZP0r8VPzRz1pdgRw
	D0cGitUZxFqVoVAdpgEyLxt/bO6IhuzyPF1TWutbiciAOvR1zlTJB5b59Df0npsAiZseMTfbPsG5j
	f3hBHLG5LFVosHfH9fARI9OzCu93O3Wb7VnQow+eoxZa7MFsP3qwy+FQnzg5NI2faW/ibEjapB3ro
	6qJsxwqPcvAdy6AKnabOX1lRjHyO8/x+gUoWzT+vp3vz7COQwC2tRYN/dCQTxxwWpORh3+JVWfkls
	K5V0iUGo1JOOPeX3rP9NnQTrEJ7Lmw9cqSQZ0VCKrsprZzag7Rd+nGhz1GqPwYDZXFTvWrzZkWnqg
	ZbQJZ44A==;
Received: from i53875b1c.versanet.de ([83.135.91.28] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uOYSI-0005iM-T1; Mon, 09 Jun 2025 11:06:10 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: i@chainsx.cn, Hsun Lai <i@chainsx.cn>
Cc: andrew@lunn.ch, conor+dt@kernel.org, devicetree@vger.kernel.org,
 inindev@gmail.com, jonas@kwiboo.se, krzk+dt@kernel.org,
 krzysztof.kozlowski@linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 quentin.schulz@cherry.de, robh@kernel.org, sfr@canb.auug.org.au
Subject: Re: [v5,0/2] Add support for Firefly Station-M3/ROC-RK3588S-PC
Date: Mon, 09 Jun 2025 11:06:10 +0200
Message-ID: <2607600.Icojqenx9y@phil>
In-Reply-To: <20250602153500.1831349-1-i@chainsx.cn>
References:
 <20250530031046.166202-1-i@chainsx.cn>
 <20250602153500.1831349-1-i@chainsx.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Montag, 2. Juni 2025, 17:35:00 Mitteleurop=C3=A4ische Sommerzeit schrieb=
 Hsun Lai:
> > I tried to replicate on top of master=20
> > (24de2b9da3e28df323c1e096538ae1e035751adf) but couldn't, so I guess we=
=20
> > can simply ignore this warning?
>=20
> Yes, the same situation occurs here,
> and it has already been answered by Heiko St=C3=BCbner(#2):
> https://patchwork.kernel.org/project/linux-rockchip/cover/20250516012402.=
580468-1-i@chainsx.cn/

Now with 6.16-rc1 out, this should disappear.

But I'd assume that bot check might have moved the binding out of the
review queue of the dt-maintainers, so I guess you might try resending
the series on top of that, because we're missing an Review/Ack on the
binding.


Heiko


