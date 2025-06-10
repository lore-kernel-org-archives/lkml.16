Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE8727AC45;
	Tue, 10 Jun 2025 07:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749539343; cv=none; b=HhbSgl8myHyzpWYrOI+2bmiJ9vWJSNC4blnjGmEle2486t5+D+ml4ty1t/zeK1c9i7r4mDQgU2UI8MTupkzbV/qje4JAc5MQ7/e6sVbXZxkndArcVYkDl6WEomTtAp6RspNwZFxNY6hmjsi4Z6Z570ztCERxBig8uSFhWvwfwyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749539343; c=relaxed/simple;
	bh=0hrlPg9RGZCoOBqsD37kKZfuBUR6TyOBeuE8tY1ffLg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gDOZSzRIlegwQ60XH8oasIEvH+oagvhLZ03ilGChV9XXDRENpTHSbNWvgrJMtGZL2HvDYrxDnHrcXvHfakqlcBDmsy65MTRlybKaAKxOYZlDMbnW1q19IiHIkG3eV+m1TVqRu36Yc+zVRgmPoyVeZO2tgqxLAAx3rrdE5hjJDW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sgs3Y2gx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sgs3Y2gx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63DD8C4CEEF;
	Tue, 10 Jun 2025 07:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749539343;
	bh=0hrlPg9RGZCoOBqsD37kKZfuBUR6TyOBeuE8tY1ffLg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sgs3Y2gxxVxjase5MKEcCuoJxMLn3NrjTXg8Beng2580u0ay2ZWkQ6duDl+33T2Z1
	 JryeUWEZkVkn4o44BxZsGB+S8dLDBLNz1jBYBFgmzBrTYW0676MID7PUjxKcwy5KEG
	 o0m45vrvNjhUstmXwbaTh45egzeRls0UO4nOn1lvI/E9FWM1ilKuwbfHIglr/YshWW
	 5wL+GTE2T7Z70I8Fi8hjUr/A7RxQ9oYcQqMQ5irsB1EtPPh8nyKyWUR9pLmQW+cmVL
	 JZMeYXaGjiMZc4y0hPnlbsAQP8B7YmVnDBdlDDsLvWckjquqTYNqYhKADcVOUpWdHN
	 atFHx2cS34lzw==
Date: Tue, 10 Jun 2025 09:09:00 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	arnd@arndb.de, gregkh@linuxfoundation.org, W_Armin@gmx.de, 
	luoyifan@cmss.chinamobile.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v4 1/3] dt-bindings: eeprom: Add ST M24LR support
Message-ID: <20250610-spectral-passionate-chameleon-bc0b4b@kuoka>
References: <20250608182714.3359441-1-abd.masalkhi@gmail.com>
 <20250608182714.3359441-2-abd.masalkhi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250608182714.3359441-2-abd.masalkhi@gmail.com>

On Sun, Jun 08, 2025 at 06:27:12PM GMT, Abd-Alrhman Masalkhi wrote:
> Add support for STMicroelectronics M24LR RFID/NFC EEPROM chips.
> These devices use two I2C addresses: the primary address provides
> access to control and system parameter registers, while the
> secondary address is used for EEPROM access.
> 
> Signed-off-by: Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
> ---
> Changes in v4:
>  - Moved the binding file to the eeprom/ directory
>  - Updated reg property to use items: with per-address descriptions
>    instead of minItems/maxItems

And the rest of the changelog? Where is v2, v3?


> ---
>  .../devicetree/bindings/eeprom/st,m24lr.yaml  | 52 +++++++++++++++++++
>  1 file changed, 52 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/eeprom/st,m24lr.yaml

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

