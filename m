Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93610757F3;
	Mon, 28 Apr 2025 06:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745823566; cv=none; b=LgF/NvQBnY1AgTuImqaTB9AQm52r2G8T9gVmE7cxyHXp2XcJGwXpjFXadc2pi/yOsE5V68ZzG7JteXBHaYZprVeqyfUZg8iWmpOINxYp3juteprV83/x2RJbAdOX/OeE+DCEKSKLNqqEWwlRjBY8TisyXIH/RzowY4LNv51AnUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745823566; c=relaxed/simple;
	bh=NjZjaesi/xJEEaiOj1GfSTanxXQS8uoOntzAyCFJJpk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TX9Qh0iwDJznnezhBgPWo2BOXAzJX8JHlhgBg7jTYx3DtcaWKgAAiTTZ3thRR/hkOL1NstP7NIHdCA1XZLSBFhN7FcgwK/5k0VUrNKTixWUQwVlltliCAzFZtWgiIt6JSbjn7njDATgg8LOaC9+Kp6HWNEAP3riEGaY1220ohEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C4Q/lsqA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C4Q/lsqA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F6DCC4CEE4;
	Mon, 28 Apr 2025 06:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745823566;
	bh=NjZjaesi/xJEEaiOj1GfSTanxXQS8uoOntzAyCFJJpk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C4Q/lsqAp6xsE+SQgVLcmNfCP3Xc/pgT3AMTa2iDfOrBQDv8ytR8Ka0ZlaYKinZBa
	 YdIem+llaGJSuy0rmgm4e1j6+uIXHBb3KuxTubQdV1FOHWci55IYEVwShN+nGFgk5R
	 HzPhpv1YtQYFX+4VkMgvqaeBiCSMn2XpvQ4Dum9FvYjLY/mRLhdVoXUDJaWSEadt5I
	 KjZLBT6rQliZStdsv0071JTXcmHDLVIw41W/EnsQT7UlbQXN70yP2/TTs6TX8L9yBT
	 Ah8IdlFnHjw0tgisn4Y589fJ/Q5giLkraa6WKVIwUwAZ54O5ioUja5ly/iF8vVAYNg
	 ZROxyxm3zG+1g==
Date: Mon, 28 Apr 2025 08:59:23 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: carlos.song@nxp.com
Cc: miquel.raynal@bootlin.com, Frank.Li@nxp.com, 
	alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, conor.culhane@silvaco.com, linux-i3c@lists.infradead.org, 
	imx@lists.linux.dev, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH V4 1/3] dt-bindings: i3c: silvaco,i3c-master: add i.MX94
 and i.MX95 I3C
Message-ID: <20250428-topaz-mamba-of-pride-cead0a@kuoka>
References: <20250427083230.3325700-1-carlos.song@nxp.com>
 <20250427083230.3325700-2-carlos.song@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250427083230.3325700-2-carlos.song@nxp.com>

On Sun, Apr 27, 2025 at 04:32:28PM GMT, carlos.song@nxp.com wrote:
> From: Carlos Song <carlos.song@nxp.com>
> 
> Add compatible string "nxp,imx94-i3c" and "nxp,imx95-i3c" for the i.MX94
> chip and i.MX95 chip. Backward is compatible with "silvaco,i3c-master-v1".
> 
> Also i.MX94 and i.MX95 I3C only need two clocks and Legacy I3C needs
> three clocks. So add restrictions for clock and clock-names properties
> for different Socs.
> 
> Signed-off-by: Carlos Song <carlos.song@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

