Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9139D1C8632;
	Wed, 11 Jun 2025 16:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749658931; cv=none; b=IP/NmqxjoQdvLqvQkAcrRhtO4AnFeemZx1OtSkQhVr0ToaDtDOEeZ7XYQ9KQd10nri43I2QOZYnNEB795ZHeGjMqAv5U5IA+r6PP1VdP5cW2HGsyepZ04+Lr1QVBba+Grq6nKU8oEA6O46yWnf/1QP10aeWnEXdEjGDFGqYID+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749658931; c=relaxed/simple;
	bh=0801sXffM1mBjZXsDkxCSzP9CdmAxiZshvLJq8fAQsk=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=lNR3PbLikStkQ0cdiIV2hRDYJP5Uds+3y4FfKOy0oO+nC86vI4GW8ySbSMF+WaLSxbi5XMC9B3fv/wXwvS0DXjaJp44rSS2f6uRThl4cBDRtL3I3JQNx03EeYz6DL2d0RPJr1IOeB7j6ylqV03WJF+oDf07vj1NKpND/TzC5lLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KswFlXHm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KswFlXHm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21028C4CEE3;
	Wed, 11 Jun 2025 16:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749658931;
	bh=0801sXffM1mBjZXsDkxCSzP9CdmAxiZshvLJq8fAQsk=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=KswFlXHmaEAgPOMNT1WzEM5TyuYRc6oWtxLFxQJCbs0COVyuDc950yEcQsappHq6y
	 FGmV53w7FhEwc+K2PAQt+SmtT/EeT+M4hRQ9fxo+3F7r55zLHITKKullU9wcgh0Zoa
	 894mjKSmOLZJYS0VTisZKtyKy9X1XLAoMvb8xpyRPSwmm4+tM62tI4euyLrdq5tvWq
	 AHzqeFPquwWPjUpDcmaZ9UWXnVfHW2Q5OboeHt9SIg03s+rR+clfH+QBpu3188CUqM
	 jU7tjbVguMXb1SAvEJfJxvnuOMsE+IcN935jRdzBIblcq6LdQwWf9Xhc66/BdAMHOz
	 GLI02KesU+NbA==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250521004610.1791426-1-robh@kernel.org>
References: <20250521004610.1791426-1-robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: clock: Convert brcm,bcm63xx-clocks to DT schema
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To: Conor Dooley <conor+dt@kernel.org>, =?utf-8?q?Fern=C3=A1ndez?= Rojas <noltari@gmail.com>, Jonas Gorski <jonas.gorski@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring (Arm) <robh@kernel.org>
Date: Wed, 11 Jun 2025 11:22:09 -0500
Message-ID: <174965892930.7717.18353656808772245872@lazor>
User-Agent: alot/0.11

Quoting Rob Herring (Arm) (2025-05-20 19:46:08)
> Convert the Broadcom BCM63xx clock bindings to DT schema format. It's
> a straight forward conversion.
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---

Applied to clk-next
