Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B5D1F3FC6;
	Sun,  2 Feb 2025 13:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738504458; cv=none; b=ZA+gLQQ6SjF9Hdh++e/vxkCsM7XlZ799n0W+bDOMR5hhIr0tMoK5D7A59EiK/EkzNuhUGB27CBlNE3EfLZ6pScSHMLnMbErXf/D4QfijDEFRILMH5lMU9aLKt5woAU9I/MQJHDoNvd3CQZp7PA69mFKqvC5u7UnfDkZ/kSeGni8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738504458; c=relaxed/simple;
	bh=NJbQEhdRphOevzblAXb4WZu9Pe0ok04Io7JS0PPxMrE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W+VZicb0DtazPcWPU5aAhiHD/8L74ncK5jdrqrLqteqcbvSR1aAMbvgYqV2BIjMPrlMkjZbegA/h6yeDmFUUW+XWVS6BCWcZgnGSBHZXy0hlQ6MN4Q1TF+6S5mWYO2Pno7mTuFQB9XUONUlyBD242rkQllmxNuGY06JMrFljpws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KaWYKT5g; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KaWYKT5g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3BF1C4CEE3;
	Sun,  2 Feb 2025 13:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738504457;
	bh=NJbQEhdRphOevzblAXb4WZu9Pe0ok04Io7JS0PPxMrE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KaWYKT5gxQMaF1jyfn5v7U6RcVb15LvzykdzWu7X4te/Yy66zmvzKM1+XC9SjQhxQ
	 GJaWcVPvqivyxwE9A886vlFOyEFlFA7RAcp3EWaYNlAsGQkYeCJ5bp65T6hEP/9VeN
	 zyDqNtv62Pz8S2zm2mnDA3tusFDPIUij8ofPOQB/6ax81D3QuUDgZklny1Ekr7KUvx
	 A6OaSyzY9O64ZNc3b1RjtO7vs57RIX3dh+WkY5+RDHGtwDwRmh5fgL/D/sbf1Zh5HI
	 62ArNwJyV1hOgeJU9rB4z3UJVCW4sCtyrSpvWxVhJ9ogTGAtDvCDphdHLNyKBloosS
	 oINuBc5jNPo2g==
Date: Sun, 2 Feb 2025 14:54:14 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ferass El Hafidi <funderscore@postmarketos.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
	Artur Weber <aweber.kernel@gmail.com>, Karl Chan <exxxxkc@getgoogleoff.me>, 
	Christian Hewitt <christianshewitt@gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: amlogic: add S805Y and Mi TV
 Stick
Message-ID: <20250202-wisteria-rook-of-intensity-6fecfa@krzk-bin>
References: <20250201193044.28856-1-funderscore@postmarketos.org>
 <20250201193044.28856-2-funderscore@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250201193044.28856-2-funderscore@postmarketos.org>

On Sat, Feb 01, 2025 at 07:30:43PM +0000, Ferass El Hafidi wrote:
> From: Ferass El=C2=A0Hafidi <funderscore@postmarketos.org>
>=20
> Add support for the Amlogic S805Y SoC and the Xiaomi Mi TV Stick (aka.
> xiaomi-aquaman).  The S805Y is very similar to the S805X, with just a
> few minor differences.
>=20
> Signed-off-by: Ferass El=C2=A0Hafidi <funderscore@postmarketos.org>

Please run checkpatch. You have from/SoB mismatch.


> ---
>  Documentation/devicetree/bindings/arm/amlogic.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)

Best regards,
Krzysztof

