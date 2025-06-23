Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69FEF1EB1AA;
	Mon, 23 Jun 2025 06:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750661485; cv=none; b=XO5zzz509HDbSxQ17dfOxH32Sj9ztjfPrfdWrEZIj7W2kft6VCzEgD34zWFBqs4Xh9QZhYMWUa6q6v8pwETthSivvxKiENozqRKkT81jD8rzj57ulQ5PSkv9k3iu4QrfACnRAFV7wjGSxh6TWBy7wvEBAhA9bIZU9n06Yf0N0DE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750661485; c=relaxed/simple;
	bh=3rEMRYah93mGUefKqSUQRKBAf5nYYuCEhyzSDEkvYBg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n4xcj83JB6CrY2as4H6JzkGdg1J42/NosDj1hFJuCsR/Wh7hjc9frIEhqcgplVojiYnfmWIHmLt3aE7YRFGD+w2mG7GuD+KsS8w70espQvVU9hcgfq6fd67Z/Nt7mTGcVHsq12wkeBFQU+it+kbcW41a2kLGEmz528F251eZ2rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vHyvQ1Y7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vHyvQ1Y7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24F2AC4CEED;
	Mon, 23 Jun 2025 06:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750661484;
	bh=3rEMRYah93mGUefKqSUQRKBAf5nYYuCEhyzSDEkvYBg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vHyvQ1Y7KMyEOE2C/oVSj0RiDPxiLweJnqnJNLW4V1I9dYpHhG2EnK6Ot180aHplb
	 yaGDnVOnYnkWlCl2j60Zd4rWLsUP9r/zZcTkushy8qODpa2OxpzbwT0eer5TKD10Sb
	 IVNF63pSQrBcBcCT1+hIO5kgnsOzRXr9o+mi2iV0MSHqoaRaLbs1nKUC/qLrwZKx9g
	 swseds+OAHAeFojuqglBPLa/4DbXatWSw6c52BqJCxUS/TNDyza0BLfUiFUMoRMUfP
	 cbcf/AYUFqhuhHc2VJEqdF+ISDjnx48c5zpyDYzY2D4iXJT92jLiBz9wb66IZErq7Z
	 Au3IL0u8YewYw==
Date: Mon, 23 Jun 2025 08:51:22 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Goran =?utf-8?B?UmHEkWVub3ZpxIc=?= <goran.radni@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] dt-bindings: arm: imx8mp: Add Ultratronik
 Ultra-MACH SBC
Message-ID: <nsbpnxfbypj3nmivzj25wfuq774jf3sd2o3iekf3jwlojnhde7@2v2wkqmdmyee>
References: <20250620122353.150700-1-goran.radni@gmail.com>
 <20250620122353.150700-3-goran.radni@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250620122353.150700-3-goran.radni@gmail.com>

On Fri, Jun 20, 2025 at 02:23:50PM +0200, Goran Ra=C4=91enovi=C4=87 wrote:
> Document the Ultratronik Ultra-MACH SBC, based on the NXP i.MX8MP SoC.
>=20
> This board is manufactured by Ultratronik GmbH and uses the compatible
> string "ux,imx8mp-ultra-mach-sbc".
>=20
> Signed-off-by: Goran Ra=C4=91enovi=C4=87 <goran.radni@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

