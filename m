Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C7E321ADC7;
	Tue, 20 May 2025 07:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747725631; cv=none; b=EHdp+7H3X8dVmhyEpnou9fFQb0/jkt0KiiuzviM24sZ+Kyn32nxJutJSoFwqav8+HLET2sZWV3Bch0bhCB8owPuQqIajHeX92hlhyrfc11AT3M6JGtwprBlihmfR7384dmDXanrZQwMai/qQDchff1SLt/MQybX9jmzuNcaV9es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747725631; c=relaxed/simple;
	bh=5pfW76gzsZFj7G6lA9ya03YxgKxR658S/A6U1aae8yA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qqI3WbFxyz+AyJ4pGNNM7XjprhV1oYFKMT2jRTJ1NSUqCUv38sRmROMXJ5/qSAKqVCo0708P3O+k/IrmdKFFxyF2SBW7qPFmCQzVWo+c1cpbMGgzyiRAXzIBPyqFDgt+KkQ3hpiZ8yAlIUbYVtgnvSYy1kty+lKYptR7brCXaa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CzksAmSc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CzksAmSc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B04AC4CEE9;
	Tue, 20 May 2025 07:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747725630;
	bh=5pfW76gzsZFj7G6lA9ya03YxgKxR658S/A6U1aae8yA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CzksAmSc4WrKjvyZ2M3isCeiTFwYp9AjNBsOsXciiiYrDr5mAYU3pADnvkXIGFOMP
	 UGu7XfQnUuq64tXk4O/SnlGIceW8W3yH1ZG5RgTjDnoKdAZPDhIDM7u4zqY86Dh0qt
	 ZlTnuOH9Dai3iAuxh5Ht0Og3A9BnR1yObnJxFhzLB85L7gNO7JOfvPlFQFe18p8jZ0
	 HdVJwmu9Xw0dkBROtUyJ6WgLY9GOnCs7MOQtdLGj2nTgQn2ay096Jfz/FFnkdm2c7n
	 fX08CvBEjofIgSUjRArIWCBZVT0GlAMrAVNncPc+lImXwb+j3xtLmvSETiTuDzSGtH
	 p7zDyuGgG6Hew==
Date: Tue, 20 May 2025 09:20:28 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Chaoyi Chen <kernel@airkyi.com>
Cc: Sandy Huang <hjc@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chaoyi Chen <chaoyi.chen@rock-chips.com>, Dragan Simic <dsimic@manjaro.org>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/2] dt-bindings: display: rockchip: Convert
 cdn-dp-rockchip.txt to yaml
Message-ID: <20250520-sexy-pronghorn-of-tact-f9cddf@kuoka>
References: <20250520024718.142-1-kernel@airkyi.com>
 <20250520024718.142-3-kernel@airkyi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250520024718.142-3-kernel@airkyi.com>

On Tue, May 20, 2025 at 10:47:18AM GMT, Chaoyi Chen wrote:
> +  interrupts:
> +    maxItems: 1
> +
> +  phys:
> +    minItems: 1
> +    items:
> +      - description: DP output to the DP PHY device 0
> +      - description: DP output to the DP PHY deivce 1

Typo here.

> +    description: |
> +      List of phandle to the PHY device for DP output.
> +      RK3399 have two DP-USB PHY, specifying one PHY which want to use,
> +      or specify two PHYs here to let the driver determine which PHY to use.

Best regards,
Krzysztof

