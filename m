Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 417EF157A72;
	Thu, 10 Apr 2025 06:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744266304; cv=none; b=cfJZzSxvs5t1jfGDjhlomcT3YvmzFQl8FubIwrUU5ga4RCzsqDN+8QzmmZop23smC+IuEHM9AXxjICgzIfQbk2kPsZoP23s6CKJT9rWScOKpL/sik6KmydNYPba7YyFKOdk8g5hk9peW6buvjG2YDRfwbmbnNud9WPrLnlaPlkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744266304; c=relaxed/simple;
	bh=1FwJFZZV+T9ppebZoVGwufY4OlRNNCgK3lZ0a3DeEyQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TPO7iglxEaPNroKn6ViIiOicgYrEoNjJs6aee1EdmbTjPheIxBpEOZxQX847QZSFEUKr/PEfi8U2fyu3jChOLZhUQzn2EY7OiOsrOFZCP1IIqqIjOo1vyfG3BRgD9cWnHUGDRBEam2Qpkcn9G/NjkL3CT7eRMyqBdYrM0bJSM88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FG5d59u9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FG5d59u9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05D1DC4CEDD;
	Thu, 10 Apr 2025 06:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744266303;
	bh=1FwJFZZV+T9ppebZoVGwufY4OlRNNCgK3lZ0a3DeEyQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FG5d59u9iYwAbNz4wHa7L62q91qr844yOjhRnc8CHuAnKwhUS08nqsrY4Pk4oP6Av
	 ZsxIAQSQPyLrdI2wOalgsVzeYhsXNHSjx++wVACK0OyhJbXDSR6Xs7awwogV/4xNom
	 XY258v3N/o2exZlDcWINvzT1m+BCM63kA3j+BBH8TUZcgRUxmVPkVfrcWbqBepkB9/
	 9M4Q5Z45o/fdZtee848ILveYtT1+mdUyP/VRzNVIuewkfUime7+x8oR2ZNKwNZbXOb
	 Ea3lgdHk02ToN2AWXf14ki1XSAy40OncMVHaQOYjT+8jRnuz14RQV4Ui8g8Cj4rd6V
	 AZG3kNQ7o1lNQ==
Date: Thu, 10 Apr 2025 08:25:00 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alex Elder <elder@riscstar.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	mturquette@baylibre.com, sboyd@kernel.org, p.zabel@pengutronix.de, dlan@gentoo.org, 
	heylenay@4d2.org, guodong@riscstar.com, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, spacemit@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/7] dt-bindings: soc: spacemit: define
 spacemit,k1-ccu resets
Message-ID: <20250410-radical-condor-from-hell-cbb910@shite>
References: <20250409211741.1171584-1-elder@riscstar.com>
 <20250409211741.1171584-2-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250409211741.1171584-2-elder@riscstar.com>

On Wed, Apr 09, 2025 at 04:17:34PM GMT, Alex Elder wrote:
> There are additional SpacemiT syscon CCUs whose registers control both
> clocks and resets:  RCPU, RCPU2, and APBC2. Unlike those defined
> previously, these will (initially) support only resets.  They do not
> incorporate power domain functionality.
> 
> Previously the clock properties were required for all compatible nodes.
> Make that requirement only apply to the three existing CCUs (APBC, APMU,
> and MPMU), so that the new reset-only CCUs can go without specifying them.
> 
> Define the index values for resets associated with all SpacemiT K1
> syscon nodes, including those with clocks already defined, as well as
> the new ones (without clocks).
> 
> Signed-off-by: Alex Elder <elder@riscstar.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

