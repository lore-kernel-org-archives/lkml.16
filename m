Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 974581401C;
	Thu, 19 Jun 2025 01:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750297074; cv=none; b=Bm1cc1PWFg1OqHmU7P96Knv784ckcfmIFEuGKZbE3iAkW+ZvlZs6HmD1t84SkTaS+BfPi/SO6kMiDYlq86o5Xnv6bddU1Fe8Ei5nAiELKyV4oIzsFKNlX4LyWnCVaJatIvKC/eDpZTpXYtySIBIXxygg0Axq7dR21xSHia5OFWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750297074; c=relaxed/simple;
	bh=ecJCHyXQWtvYtWnqPa5n/BlodDAEwF7Ss3bcPwxT4oc=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=RrjLo9VH73vDTP5bAEttM4S0haPmkZJYlAL7BQFS9Qj1cKYupp7lVDZah4fN/Yafa1x9UIdDkFQueS5tlrYcILH818dwW5GpLLyauFcpDfkTZFYZRPEdAcGec9zqec7rwZw+IfERACMcykNcKFPcXhRzU/6QK8BYO0GQo1rwfrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=THYebIHU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="THYebIHU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE7B5C4CEE7;
	Thu, 19 Jun 2025 01:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750297074;
	bh=ecJCHyXQWtvYtWnqPa5n/BlodDAEwF7Ss3bcPwxT4oc=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=THYebIHUEplET6ir/Wr6WdVuvILyv57hFEKH5hqn7/8jjeEDrnKD6eFKT+YUKlDC2
	 ySKksmohmjqmAE3ce4ijj9204IHshJH/JpadZ5KLa31Utj4GIX298Y08s2WmojlWfV
	 GgI0k8+mA264ka6nppGywQBMMH0oKnJmYk9imhirlvgJj0NdLRLICT2xx0SRpinQ/g
	 LblsauHMp9mnq69uyJjb/eYxJguSmx7bvQ1OPBmPycAu+kQPWM/OaaeJoGqiopqmvY
	 84QaANBEJ4avD3So1fVyQHUU8h6J9MQutWyaf0ocMx6oNaU+Nt8D7wfihXsl4lqrMs
	 Alsc4oSHue4/g==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250521004625.1791913-1-robh@kernel.org>
References: <20250521004625.1791913-1-robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: clock: Convert brcm,bcm2835-cprman to DT schema
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
To: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Conor Dooley <conor+dt@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Ray Jui <rjui@broadcom.com>, Rob Herring (Arm) <robh@kernel.org>, Scott Branden <sbranden@broadcom.com>, Stefan Wahren <wahrenst@gmx.net>
Date: Wed, 18 Jun 2025 18:37:52 -0700
Message-ID: <175029707294.4372.5366260558187845088@lazor>
User-Agent: alot/0.11

Quoting Rob Herring (Arm) (2025-05-20 17:46:24)
> Convert the Broadcom BCM2835 CPRMAN clock binding to DT schema format.
> It's a straight forward conversion.
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---

Applied to clk-next
