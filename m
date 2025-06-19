Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B55161A3166;
	Thu, 19 Jun 2025 01:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750296910; cv=none; b=a4nWJUBdNs0hvhoGC58PcHFOeeMGBselV0KnxzRu1lwOAuQ4S4PCMZxJnxGew2pgR9DF9Mj1Yx7+J/z4xY7A9H1FMrut6zm5cCwQR4Oi74XRuVY1GVWi16ihw1IAcJ3vevxERCD/DSAcqqwD8YQU1fP7P4ANfs0PqskEM5YCktA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750296910; c=relaxed/simple;
	bh=+sDVqDMenAwbAsWVa400MQFxHzOuXudXiz9iqyTox20=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=etolVbM+gGIBp43MPfoMHnrMpfbD3nkHfcJ1kGaEBDbUldvTqkO+HzLSW4RHAJi0NiKplEmUAnd3An8g/hN7Yffd9KumGGw0+HqjGwsxpo+LfnJGGUpaIz7kowtQpPvZI96ZvqkYj4g+qGypOoVILOodZYRvbGvwIfaLS/Q7RRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hJb3T+86; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hJb3T+86"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35F49C4CEF3;
	Thu, 19 Jun 2025 01:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750296910;
	bh=+sDVqDMenAwbAsWVa400MQFxHzOuXudXiz9iqyTox20=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=hJb3T+86ZiHnmQWG1Ow3poSH7eZr3haWQx+2K5s79V8HPqUTbGWNYl30vu/8eBl1o
	 7ioaSXGxP4oKZLDNxTYYO1+or5oHZ8A85+O0/30pGZrhygi5PSFsfOPysdtFj+RZtb
	 uVEdyMnPQlFsmgHFYAHkUxamKSdW+JAAQcvnzwRG7Sa61iYiyG4XweTyEok3sJeLAY
	 RIiyLmCXXDHuXvqiiUW2CcLyaracfofJ1a90W4T8fL397Tdfe0tqynp9dRffNEH+Q2
	 2Pz2ndWHe2ZGnLtz7uKL2jKTfX3T2ckXENqiPpfMwOPgRfp/jVwhcY+ECegvEOGF78
	 hVbgu0psRbnbA==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250521004647.1792464-1-robh@kernel.org>
References: <20250521004647.1792464-1-robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: clock: Convert axis,artpec6-clkctrl to DT schema
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To: Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Lars Persson <lars.persson@axis.com>, Michael Turquette <mturquette@baylibre.com>, Rob Herring (Arm) <robh@kernel.org>
Date: Wed, 18 Jun 2025 18:35:09 -0700
Message-ID: <175029690904.4372.14329901814552097861@lazor>
User-Agent: alot/0.11

Quoting Rob Herring (Arm) (2025-05-20 17:46:46)
> Convert the Axis ARTPEC-6 clock controller to DT schema format. It's a
> straight forward conversion.
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---

Applied to clk-next
