Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31EF119E97C;
	Thu, 19 Jun 2025 01:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750297208; cv=none; b=IlMozrhFaz6LvVO8zC6GQb4ju5PVhAZDnil/BqCQZDF8QTCOX2+3oCS18xXDSK7a77GLHQLDv/M1V4Z/dAO3tMMcOscH0vivVW3qI+1wzW0faGwrvScSN9G9Jo8zf7BbpVdKyLfL1pDbO86VwPQ8KaKUDCKXH8Jz8Xt3thk0s3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750297208; c=relaxed/simple;
	bh=BI1rPWjqo0CMS2+BWwz1Kaa5irlfOX37M3QgoSG8Yvg=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=h2SgtyFBIwsSxtxf8kURV6c8PqI339aiKDQtCbN7tMLRbZg8NIQIXwmIyTxODkShZ9bBg2LWNuW9MpasQS0hJfDvdo7n5jgd9TVXCzA1B42JH0tJ3OuWgDvO1ND7m2nq3mvK/nnxeKF3wnfyG1KDXDlt59lakoZZaI4EDJe5LQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KIF50PYq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KIF50PYq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3710C4CEE7;
	Thu, 19 Jun 2025 01:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750297208;
	bh=BI1rPWjqo0CMS2+BWwz1Kaa5irlfOX37M3QgoSG8Yvg=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=KIF50PYquC8+cUAsYcXpe3Z2410paarneYWIz6IiziF7Ob+Jgff61D3PxIB2u0+cg
	 ojta4wQODH3nOnWzyuUL4/cjYkcwZ7tC5HCXPquLhYdQxS3y95aVO5wK+WiNgwrzOH
	 jDb8gCPrc3fvT6jw4Dal5j+DLOdbAS62qJlSbBDDtb5BePm4S11Q21YcLiEzw7FuN0
	 maQfAsW3W5BuLsORfzVJiq/21RYV+jWRX7Tf8A0nlrb7knbUOW/9co7L2RVoyTCduL
	 QlhhJU4FhHId6to+NunOoWU3+/pAGkhh5L5+xji8odIPz0bjWapgUXp/ZOmSzRwsvQ
	 L/7W43xa+MIsg==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250521210750.60759-1-robh@kernel.org>
References: <20250521210750.60759-1-robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: clock: Convert TI-NSPIRE clocks to DT schema
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To: Conor Dooley <conor+dt@kernel.org>, Daniel Tang <dt.tangr@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring (Arm) <robh@kernel.org>
Date: Wed, 18 Jun 2025 18:40:07 -0700
Message-ID: <175029720728.4372.5246046150953389252@lazor>
User-Agent: alot/0.11

Quoting Rob Herring (Arm) (2025-05-21 14:07:49)
> Convert the TI-NSPIRE clock bindings to DT schema format. It's a
> straight forward conversion.
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---

Applied to clk-next
