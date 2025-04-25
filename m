Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66AD821CC6A;
	Fri, 25 Apr 2025 20:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745611554; cv=none; b=rWcfTgNY2osWpc6wkzO5WGeChviHxVgPZcs4NYsYmhNAfldKRXP+PyieMQVnUJh6qnz5dQRAkZeVE9yyY6+RkGA3G+CUDTPyNxR6Twad4gOBig/xJYLhT6PPxlXeu0FvZl/xSFimGO2vp7m5gl6wBX3CT9MqjSzBb9QIqMvrDqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745611554; c=relaxed/simple;
	bh=q4WQHrsOsO84fZqlOh0orVVczj8jfx2D1i2MSGyThH8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dZhSzDai5IHFslMkUHYtMcXU9s5ozWsT5fxygGxPEmzOfLHFMSzrZ4ev2lDxE1QO1wfTwnR4XM6+c96ztfIKUhm1Ax4WTW5nirfOmoOk5NagnRbWtwRu6TeqSpwFukbDphlJVz9/fD/BwjuS7EgEzoId+OAV6gLzWFASJLIP4AM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fWPjCvHs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fWPjCvHs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAB3EC4CEE9;
	Fri, 25 Apr 2025 20:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745611553;
	bh=q4WQHrsOsO84fZqlOh0orVVczj8jfx2D1i2MSGyThH8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fWPjCvHs+N0eH/BTdMMG6QyS1TZABUWrbw3oopyBWyjVRcZ6ZeDO7TagXgwuUt4oU
	 I1wAhop5RrW0I7dVwS8IyZQhOy2uAbfRT66+IS17q5g39zr1b/UAKafEjB//LLIB1J
	 2H6LQMxm3jfr3LqLdCDTgidp4yOygdlI7M/AO+TKO33X90/JpIKXIm8cP8mVJLafYQ
	 zahmxIo30/BRgpsTRUCw9eiE9lj7+d7Gy5DSbfKuqDBeh4oBUzpDL7HqSS7CsxN2Kl
	 E1DFwYegvukk1W7AImttufGNAFFxgaKHn27cqdp+g4tCCL6TVxET1zC3mvf0pONKHS
	 4pjS726c75K4A==
Date: Fri, 25 Apr 2025 15:05:52 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Pin-yen Lin <treapking@chromium.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Matthias Kaehlcke <mka@chromium.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <swboyd@chromium.org>, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v3 3/4] dt-bindings: usb: realtek,rts5411: Adapt
 usb-hub.yaml
Message-ID: <174561155143.2910372.10682316903068482147.robh@kernel.org>
References: <20250422082957.2058229-1-treapking@chromium.org>
 <20250422082957.2058229-4-treapking@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250422082957.2058229-4-treapking@chromium.org>


On Tue, 22 Apr 2025 16:28:29 +0800, Pin-yen Lin wrote:
> Inherit usb-hub.yaml and remove duplicated schemas.
> 
> Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> 
> ---
> 
> Changes in v3:
> - Remove redundant schemas
> - Update the schema for downstream ports and devices
> 
> Changes in v2:
> - New in v2
> 
>  .../bindings/usb/realtek,rts5411.yaml         | 52 +++++--------------
>  1 file changed, 13 insertions(+), 39 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

