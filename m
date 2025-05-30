Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 795FB1C683;
	Fri, 30 May 2025 14:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748613769; cv=none; b=AsboitqvEVAf5S4o5aOiArZKGGfF9IDCLBmc75jBQEqnOPIFWZpQpGpjRAMYxBhZKOXJ0fNMu2uBn0VqISrLtJODLXlBoob8J0pYZje0PRALjPLb7OopWMPoHKfqkDe3pXO44dClNfYuUo27/+kDKdVPthq/tVjOUt6rzdtGCvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748613769; c=relaxed/simple;
	bh=alC+n25lh6Y0CfqOg41XwQuLN4LpTiNcPxMk5nDhSe0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m07iMF4xbFRkqp5RWeduJx5rTNkX3Dc+E3/ABmJTsp46RSgvoQsLVPhpZDnRGA07ocy5dZYzntIRh4rfO9yJlAX/CqRTxZ9vzaqxa3TEIS8MbED3KZ8aMa1ytyfPYeVtn0N5WJo5ZHfKHn0B7+1NWdzANWXN/vCdSK/pa5h7IXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mei7aynL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mei7aynL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA955C4CEEF;
	Fri, 30 May 2025 14:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748613767;
	bh=alC+n25lh6Y0CfqOg41XwQuLN4LpTiNcPxMk5nDhSe0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mei7aynL6r2D5G7tNEqAWX743lADuFAffmrGpdtuv9Jf9I7dUa0rJWfvLwT8vNQlD
	 1P8fs1+2P9HqsRQqOcmX4HVTAlTCVmLZ3WmTmvzzK7dzxBsXXvynUXMLclR9WdpeI3
	 6vVbmf4XnkyMfe+7M0HcWmBOrmaT00Sqd9a1moBCxK1D7UyV7gzwTzlnkx//2gvv+f
	 Ce6JNFW9lyZgeNOqzBwN9BYdsx4AgMMj8A1D+F6slgbWVjlguz5KiHBBN3gGarCTbQ
	 Ph6XxVDwH3ygUTK0FNf+0GGpavFNQygvfq2QwQP1OFNxozB5WJVnBIBOlf8EdS+C+1
	 jfPJ0hU9jbaiQ==
Date: Fri, 30 May 2025 09:02:45 -0500
From: Rob Herring <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
	dri-devel@lists.freedesktop.org, Simona Vetter <simona@ffwll.ch>,
	David Airlie <airlied@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH 1/1] dt-bindings: display: convert himax,hx8357d.txt to
 yaml format
Message-ID: <20250530140245.GA1608370-robh@kernel.org>
References: <20250529164822.777908-1-Frank.Li@nxp.com>
 <174854325819.3595451.10273154567966477690.robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <174854325819.3595451.10273154567966477690.robh@kernel.org>

On Thu, May 29, 2025 at 01:27:38PM -0500, Rob Herring (Arm) wrote:
> 
> On Thu, 29 May 2025 12:48:21 -0400, Frank Li wrote:
> > Convert himax,hx8357d.txt to yaml format.
> > 
> > Additional changes:
> > - add spi parent node in examples.
> > - ref to spi-peripheral-props.yaml.
> > - change himax,hx8357a to himax,hx8357 to align driver and existed dts.
> > - add himax,hx8369a and fallback to himax,hx8369.
> > - allow gpios-reset, spi-cpha and spi-cpol to align existed dts.

Fix the .dts files and drop gpios-reset. The kernel has a work-around 
and I would assume it's been in place long enough to support 
reset-gpios.

Rob
