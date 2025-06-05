Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E34CE23741;
	Thu,  5 Jun 2025 22:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749160878; cv=none; b=YoAzvkVSIznH7Ar0xSQlz9vWRNH4encDO1otFe711pe5N5Zzw9vvvChE2a3I0/4GWpsiqvHVpbQMGb8hAmBxDsut+QTCLrhbpXubQF/8fp5CB8GP0ak82kbt9KLxXlpg1rjYkUWnW4LyNvjDfx2LU5cvhdWTMv2WP9UI6zosSRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749160878; c=relaxed/simple;
	bh=LSWvhFvn4bSvUg9aMhGnvwKlF1PbeLBvfGTYfwBBF+E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JIDjKaVT7dVFVoa/yvs1cTDLx0SHCjPdnk6LR8adQXOQBK6rendu8TznHcnesiJ7MBjYokCIE0nJEOADj6c5fRRGQm8TDRwTcRKSOGI1vVG+cntpUd/tEdtQa6yb291vyJe1XNxGmGUlQ0eCl+szMqqggMqjPFbaeucl9rWW2c4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VTxpUdJ5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VTxpUdJ5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 409A4C4CEE7;
	Thu,  5 Jun 2025 22:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749160877;
	bh=LSWvhFvn4bSvUg9aMhGnvwKlF1PbeLBvfGTYfwBBF+E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VTxpUdJ5OHKZjXAi+PQNclXJB8RI+uPvU8mIL52gQ6MxUBUPmyd3TpdB59NsjoCFs
	 w1NnTzk7G+bIZ8C4mX0sRObH7XokmO/WOvDtjspEm99M+NHf6iVMu0oaQuMsHjhXVj
	 kZMXPqb8oz46aCYwtnCQGKlauDA3NYjq4TFtEjIqbnOLSVjIERmQuJ+3YRc4qkiATs
	 Ww587r/V4MBABbHZuLb6tdLAnNDIfc/3K+ox4K1udF2AkdokpUpjyAPMIspQV2hknt
	 Q88ELbggQTWNM5eEjwUKo7bVLfC52GP6oAefKl6ZnPwL+vyyA+12yBSASZk1d+JFaT
	 z2l/J3O+VVymQ==
Date: Thu, 5 Jun 2025 17:01:15 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Andrej Picej <andrej.picej@norik.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Marek Vasut <marex@denx.de>, Robert Foss <rfoss@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Maxime Ripard <mripard@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, Simona Vetter <simona@ffwll.ch>,
	Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, David Airlie <airlied@gmail.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH] dt-bindings: drm/bridge: ti-sn65dsi83: drop $ref to fix
 lvds-vod* warnings
Message-ID: <174916086474.3326887.3182401787143665659.robh@kernel.org>
References: <20250529053654.1754926-1-andrej.picej@norik.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250529053654.1754926-1-andrej.picej@norik.com>


On Thu, 29 May 2025 07:36:53 +0200, Andrej Picej wrote:
> The kernel test robot reported a warning related to the use of "$ref"
> type definitions for custom endpoint properties
> - "ti,lvds-vod-swing-clock-microvolt" and
> - "ti,lvds-vod-swing-data-microvolt".
> 
> Using "$ref" with "uint32-array" is not correctly handled in this
> context. Removing "$ref" and relying solely on "maxItems: 2" enforces
> the intended requirement of specifying exactly two values, without
> triggering a schema validation warning.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202505021937.efnQPPqx-lkp@intel.com/
> Signed-off-by: Andrej Picej <andrej.picej@norik.com>
> ---
>  .../devicetree/bindings/display/bridge/ti,sn65dsi83.yaml      | 4 ----
>  1 file changed, 4 deletions(-)
> 

Applied, thanks!

