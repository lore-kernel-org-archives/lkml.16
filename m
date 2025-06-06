Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A7C29A2;
	Fri,  6 Jun 2025 02:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749175993; cv=none; b=lTsLbn9Zmv3SWLA6bCcaDGI2qDtw3zv8Voh+zChIGXiGotaNJ7Bktb02Pjf7x+Ur3w54iC4K/xbOh9Vl7zqiRgcusNvPudLQG+uq6wf1U8BW1Jrd1SDB3Yzwvk8yW2kMVuWGuqXU0Zg5qkMrknno6tQ134QTlzCk5WPi0XCJSZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749175993; c=relaxed/simple;
	bh=cz6HkeP+ZJjaXp3JzlgxllT3hjtl/nBcoCl/9v5xo28=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ki0wjcERTBh0H7yRoI/ubDi6U6U6qNgwhRJG6nh+cmzBrzoNHTpH4Shcwo5yc8/j4KbMxt3E+XYxdxRshcBr1997W3IbRLc8Su26QLeJCz7FrqYslx+VGQQFD2osBZ44/BO4QNelBWng4KvqhWpKNJTewhvSzYzngsKCh9x5gyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mgI7oD4a; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mgI7oD4a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E5EAC4CEE7;
	Fri,  6 Jun 2025 02:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749175993;
	bh=cz6HkeP+ZJjaXp3JzlgxllT3hjtl/nBcoCl/9v5xo28=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mgI7oD4aBRedU0n12OSdUhdomkHZKYynmTdrj/fI5Rnp6Y+B7zRNvqOln6yuCDnyr
	 uD4YXO2Kf3YfHrlRefYVjz2Ld0KMUklSIAs+RWVRIAEFFH6TG5FTQBLRHBEa05Ef3b
	 x+y6xTJsGtAMX9E4GpzWGeUWtx5EFdR68Pcv0nnzQC+3NvxOWi9E71vaIIKcNH3BL3
	 3fJ7POIMgoqQlVTDPi4dFNOeUuyHoKkVNGzmH6ynNUOHVZ0a5M0dUlbdY4GbJz3cKH
	 WXYdBwaBdZsIf/KPg8Petd83jggcuBq1iub7u7QU6mdXMF+mgkE9C8ztAI90fHKMss
	 bPDrUuWR0sGGQ==
Date: Thu, 5 Jun 2025 21:13:11 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org, Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
	wahrenst@gmx.net, devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v2 1/1] dt-bindings: display: convert himax,hx8357d.txt
 to yaml format
Message-ID: <174917598948.3786836.9401848731451916203.robh@kernel.org>
References: <20250602152814.949671-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250602152814.949671-1-Frank.Li@nxp.com>


On Mon, 02 Jun 2025 11:28:13 -0400, Frank Li wrote:
> Convert himax,hx8357d.txt to yaml format.
> 
> Additional changes:
> - add spi parent node in examples.
> - ref to spi-peripheral-props.yaml.
> - change himax,hx8357a to himax,hx8357 to align driver and existed dts.
> - add himax,hx8369a and fallback to himax,hx8369.
> - allow spi-cpha and spi-cpol to align existed dts.
> - add im-gpios for interface selections.
> - add reset-gpios.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change in v2
> - update MAINTANERS files
> - replace gpios-reset with reset-gpios, kernel have quirk for it.
> ---
>  .../bindings/display/himax,hx8357.yaml        | 78 +++++++++++++++++++
>  .../bindings/display/himax,hx8357d.txt        | 26 -------
>  MAINTAINERS                                   |  2 +-
>  3 files changed, 79 insertions(+), 27 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/himax,hx8357.yaml
>  delete mode 100644 Documentation/devicetree/bindings/display/himax,hx8357d.txt
> 

Applied, thanks!

