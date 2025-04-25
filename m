Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF4821D3DB;
	Fri, 25 Apr 2025 10:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745576357; cv=none; b=HFgGemQr387Hlszt8+q0+oqreJw7T6SOs7oYoL1ucrGY3hFP0efT1FXhx5BLn8Dt3bSLK1rWHrhp9ucuudFFiQdx0wwZBC2RCQJ2vadl4CDEAGeQQTHTb+UWb3+xyQWJDOq6Rp1fYI9vvVcc74lofHERR5Ptv9GVluyLOzm/OyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745576357; c=relaxed/simple;
	bh=8hdBrASEox056qzws93ce/KXrePY3rfEbDz0T95lkl4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PHDzwWpmMbAj6rAXk6nY34dvCFruuPHZ4ttq0Q9wPsjrklT3QT5935sy2QNRizfOR60bXYDczz6eFNuFlGChaIbdAcFnYl6jCA4T5oQHpty9UDRYhpcsA2D/tKu3cm16KN7hkYs9IRuYT6XRUogRxBRV1RznXW2xjdjod006Wmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XEAmy/BS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XEAmy/BS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7DF9C4CEE4;
	Fri, 25 Apr 2025 10:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745576356;
	bh=8hdBrASEox056qzws93ce/KXrePY3rfEbDz0T95lkl4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XEAmy/BSDYyR+NH/5tniQVVLXaO44MfQIGSLZuty8bEPYJEO4+48Bpg+jqJJwPU55
	 MjiHbscPCKiL5orQpKws711FhnyFnZt6qVPsgrxhHDeRcIR1H9WcyLwqnt5wmmwzTT
	 U00brDEJIubTJBY5IlCWZXH4lsmm9N6ml9y/MjQBe0Jx6qNT3khEcvM3SFdJfRvvqa
	 NwFEkkuJfav2PDXfi6eA8VN74pWmsoebsi/lkQRrAtwM0sR8qE7eLtfgrQ7iSUigWg
	 +gUiRkFqE8kNEOpZT203FogCE1irHXylMtynHtL2D5WPnQeXcYlTwrqspQvUCM1Fsk
	 UOG+pJ9+nOhbg==
Date: Fri, 25 Apr 2025 12:19:13 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexey Charkov <alchark@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: arm: vt8500: Add VIA APC Rock/Paper
 boards
Message-ID: <20250425-polar-tamarin-of-reward-c57e01@kuoka>
References: <20250418-apc_paper_binding-v2-1-17c9023b7c9b@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250418-apc_paper_binding-v2-1-17c9023b7c9b@gmail.com>

On Fri, Apr 18, 2025 at 07:24:25PM GMT, Alexey Charkov wrote:
> APC Rock is a development board based on WonderMedia WM8950 SoC
> released around 2013. Paper is the same as Rock but lacking a
> VGA port and shipped with a recycled cardboard case.
> 
> While at that, put myself as the maintainer, given that Tony is
> unavailable as of lately.
> 
> Signed-off-by: Alexey Charkov <alchark@gmail.com>
> ---
> Split the series from v1 into separate bindings patches so as not to

Hm? That's odd.

> spam all the subsystems with unrelated changes, per Rob's suggestion
> 
> Changes in v2:
> - kept single-valued compatibles in a single enum (thanks Rob)
> - dropped the empty overall description node

...

> +
> +      - description: VIA APC Rock and Paper boards
> +        items:
> +          - const: via,apc-rock

Where is any user of this? Bindings always come with the user. Board
compatible comes with its user - board - both to SoC subsystem (in this
case me).

See also SoC maintainer profile describing this or my guides how to
properly target SoC subsystems:
https://lore.kernel.org/linux-samsung-soc/CADrjBPq_0nUYRABKpskRF_dhHu+4K=duPVZX==0pr+cjSL_caQ@mail.gmail.com/T/#m2d9130a1342ab201ab49670fa6c858ee3724c83c

and great example:
https://lore.kernel.org/all/20231121-topic-sm8650-upstream-dt-v3-0-db9d0507ffd3@linaro.org/


Best regards,
Krzysztof

