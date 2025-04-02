Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EFD41DE3CA;
	Wed,  2 Apr 2025 08:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743582672; cv=none; b=pjA1+sRqLtny5ozkOAvmAVYvdDEp/YabHkmMeZMcvqy4SKQIokdmYKWmoWSO8HfUOjdJqZcH6HZuxSYpbAnKSlvty+6DFAYT2Fj1MT5T3hLeG5L+/EerPA2FcjXi3ZB5dmhXy490duX16vlYMO68eNQBEJwgAqluV3LWiqlcsJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743582672; c=relaxed/simple;
	bh=WtN1ePb3sX9SLuUOAsD8pQQuJnpHBzCx07/dog7oMHk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ryBEJQ74m0dNyzEkon6UQ6GHEARf5Dw+bQWIhLNMmflI/Q8WbQqUlkheHr1Cnc1bv+IGGhxN3voHtFSi8U95WpK7jGT/GtP0ZHzpukBIju2+mPG8VAZK5m7Rs0aGoKKOtE8prw2Y7qyvjvwVKBFBp34SQxFqK45RAunJIIhTvjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cMwynApd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cMwynApd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CFB1C4CEDD;
	Wed,  2 Apr 2025 08:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743582671;
	bh=WtN1ePb3sX9SLuUOAsD8pQQuJnpHBzCx07/dog7oMHk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cMwynApdsxEVN+idw76YwLCcrJZtIl2Q40qRdGeVkK8TlnxEqcGX6MkA2tdxZw2/c
	 ULzVHUihH3PAehBiCwojrPYmfqmMVz8YoJFy6DVFFjhP08+e89Wtb1rkhIbCcfU6H0
	 5is/lizNUc/BmbBcLm3AHadp6Lqd/imRoqIVYPqsFdK4ZUYVF0bOOvZ/lDCOC1w/pU
	 b6I7LOVoNV0CLNpMwcdP0whTAx6PIce0JS6LQYtQLNjjcunbuSrMx5c9AO8a7CpQrz
	 hOE6pLvQ6k/OsiA6eJHDGyhR7COuuKZ06kEDyGSOaikqnIJvE+F19uHfAo3keJYIYp
	 x78/ijVCCDrRA==
Date: Wed, 2 Apr 2025 10:31:07 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] drm/st7571-i2c: add support for Sitronix ST7571 LCD
 controller
Message-ID: <20250402-artichoke-turkey-of-aurora-ad12cf@krzk-bin>
References: <20250402-st7571-v1-0-351d6b9eeb4a@gmail.com>
 <20250402-st7571-v1-2-351d6b9eeb4a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250402-st7571-v1-2-351d6b9eeb4a@gmail.com>

On Wed, Apr 02, 2025 at 08:12:11AM +0200, Marcus Folkesson wrote:
> +
> +static void st7571_reset(struct st7571_device *st7571)
> +{
> +	gpiod_set_value_cansleep(st7571->reset, 0);
> +	mdelay(20);
> +	gpiod_set_value_cansleep(st7571->reset, 1);

huh? Why do you keep reset ACTIVE after performing reset? This makes no
sense, unless you just put wrong flags into your DTS. Your binding
already suggest that - you claim this is N signal, but use high flag.

> +}
> +
> +static int st7571_initialize(struct st7571_device *st7571)
> +{
> +	/*
> +	 * Most of the initialization sequence is taken directly from the
> +	 * referential initial code in the ST7571 datasheet.

Best regards,
Krzysztof

