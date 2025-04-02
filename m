Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C76B13D53B;
	Wed,  2 Apr 2025 08:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743582503; cv=none; b=n1uHSlHdv3toxlBlTLg+udPVUumzJ/ZAwQ1hgMVbGOS0jfb2Brl0r9+6SHGthamoC/i0OqUkPsENrkmagMwavBjgWQVpMXlZ8VyDzbC1oYndfkJa2h0GqDg7ezt3GtnomHyJIDBKk5R2/z7HZF2nQ1q4EVa3j0eLd+709XFvo/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743582503; c=relaxed/simple;
	bh=AxDNNMZJCuIzgSEb/lxlToXjKumuqj6WXPlR2NT09I4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AYi52ytC1m0Vrr+ZzL3SzPt62VSdLeRyxEAbT+mO1EKavhM4xCSeO6/vPQJL9D9hReKfSSHyrjBsdDZRK3Lf0jKDinYRcOZAskts/az5oi/tZXSSWohSyLkzT1fCDisrKPH1yUbh6iTe87uOn3FIL/djKsYee52zaixxTgcLXlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j+rKbt4f; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j+rKbt4f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A2AEC4CEE5;
	Wed,  2 Apr 2025 08:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743582503;
	bh=AxDNNMZJCuIzgSEb/lxlToXjKumuqj6WXPlR2NT09I4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j+rKbt4fDfq0taKoNa1fnbEnb6Fwlh8WKOxXrfE30NjnAbH4N86gQLXQ5Io81xblV
	 ASKGdfE32usra1zAPoVRDPM37ui3XHQlhm8xpEJEyTuWGZokvc9cig4I0Cy24TKrs6
	 nIHwd5hEh+MiJ+k4aNZ68mizpuA5xf+/P6WDfD4bVaf+6Rg3Hwowf+eSm0inVwC0OC
	 Towx3EnNi4NFX7rLIpQo6eTKO+AibF9OwUocdOjjGj3BSu0H/vTP581se3qWbLm2i4
	 xJ3xOMutes+wxGY0yMOZa9XyIKyoCvgZhzXr6EbFTZwFcorrsQBmJsx/4NmPjkivwv
	 Wo5wdJ5pizIIw==
Date: Wed, 2 Apr 2025 10:28:19 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] MAINTAINERS: add antry for Sitronix ST7571 LCD
 controller
Message-ID: <20250402-gabby-orthodox-numbat-ebf605@krzk-bin>
References: <20250402-st7571-v1-0-351d6b9eeb4a@gmail.com>
 <20250402-st7571-v1-3-351d6b9eeb4a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250402-st7571-v1-3-351d6b9eeb4a@gmail.com>

On Wed, Apr 02, 2025 at 08:12:12AM +0200, Marcus Folkesson wrote:
> Add MAINTAINERS entry for the Sitronix ST7571 dot matrix LCD
> controller.
> 
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---
>  MAINTAINERS | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 889bd4a59551c9bc125f94944a6e1c7e3ef2de83..00d19d45679f6d18a7e9c9e619b7642176b7ef95 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7572,6 +7572,13 @@ T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
>  F:	Documentation/devicetree/bindings/display/sitronix,st7586.txt
>  F:	drivers/gpu/drm/tiny/st7586.c
>  
> +DRM DRIVER FOR SITRONIX ST7571 PANELS
> +M:	Marcus Folkesson <marcus.folkesson@gmail.com>
> +S:	Maintained
> +T:	git git://anongit.freedesktop.org/drm/drm-misc

Are you one of the maintainers and do you actually push there? If not,
drop.

Best regards,
Krzysztof

