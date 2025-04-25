Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F05D224882;
	Fri, 25 Apr 2025 19:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745609764; cv=none; b=cOTRFQapJ8r7bBbQmJPHFEAEAJzNlMhoDYPCGIMrGcWTld1AC90yttYSTiHKwUT/2g7X6EZKhDZkvRnezd4HlVPepy9PCWQqWwjqUPbt7iDrBdYGkv99+tBtsIe2KxUPISPojAB+NRbpUAsnhnyV7PcU3ZNKUhcUBIV6X7Lvy5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745609764; c=relaxed/simple;
	bh=GMKQHRQsZMaW/x2X5GFzFoiYvbdCI9YX8hUQDYTxlO4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j8NsgppRJq023kLkvIJlzT3zNf5iGg5NiC7H175Jiu81sHBhRS+SrIzm0Zq7dugDBlyBRk4a6OWVYZGcurkyuciIFy4VdLyhQLAPeFVJNzEy6WRD7q/ObggWJlwmGYLbTUoLHpOFCyJlNcSD5vw4s8GSGKmVC30uDbd6k4rIw+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GtlD/6Ju; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GtlD/6Ju"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C59AC4CEE4;
	Fri, 25 Apr 2025 19:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745609763;
	bh=GMKQHRQsZMaW/x2X5GFzFoiYvbdCI9YX8hUQDYTxlO4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GtlD/6Ju5P6YQPrb+MTpihTNuhnbgXni2oofRGIHrFloLKLC/8/OVz5hY6giij2/W
	 E8BWpwFHg+ZvzhO+lOqgCXBOqfx/3iqo6dE78CeZTzcpm7jybv7XFSRkYnUa6lPS2G
	 7Y3Q2Y2SFF1uUURsiDK5DV5dTAyW/3xr9G8uJd0tyYAjGaDP1qCkao5lLi8ZVWKJxV
	 8nKneNzLxvyszz0GSZtbPwNnlaSUbI1VfJDsnnMopaah7jchedKDwpjBmzh+R6KWU3
	 sFzz59K6/cAkRN0a7vjonwaUtACF3B3Impe0wAlIVrbvVs8+cmPWv63vAm8RGYpnN7
	 Tme7TAv3wBeHA==
Date: Fri, 25 Apr 2025 14:36:01 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Andrew Davis <afd@ti.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Tero Kristo <kristo@kernel.org>, Nishanth Menon <nm@ti.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: mfd: ti,j721e-system-controller: Add
 compatible string for AM654
Message-ID: <174560975726.2869977.1530781618642734702.robh@kernel.org>
References: <20250421214620.3770172-1-afd@ti.com>
 <20250421214620.3770172-2-afd@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250421214620.3770172-2-afd@ti.com>


On Mon, 21 Apr 2025 16:46:18 -0500, Andrew Davis wrote:
> Add the child nodes that can be found under this node. Then as done for
> other similar devices (J7200 and J721s2) add support for the AM654 system
> controller to this binding.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>  .../bindings/soc/ti/ti,j721e-system-controller.yaml | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

