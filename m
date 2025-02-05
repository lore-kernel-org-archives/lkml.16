Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 122E0229B0D;
	Wed,  5 Feb 2025 08:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738743967; cv=none; b=PqKITnYYuKLffyYz92YbzlopiKoh6mniw+qnmUjADpqDi/nY3zwy3gr7CHEV0cKYWDeiHkgYmDuIO6oK3i4b73E8RtixPxhnpxj0R1S2UVwg70T+6Q5CSKTqsMu/gD488/8prPxE49nHE2EbvyBHUp0CJKYA4qg6l6qwmr9v1u4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738743967; c=relaxed/simple;
	bh=NjfUcVbPp7VNLRuemltc9018TbIE6zRT+9wxD+QPcgY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bNEAyM2UVTZcoOXiJQZITOFZCYMCpUiwf9oKRcpZf9VBLp0mva5iEYSiTsIkNhxf0RCYBJp58CeOjIXMqdoOPnxR0UQN4Mw1OwdVUftXsKj96/NTrerijlWQ5N1lkuPpeRx+d9xLcTECISJlMKIpyfbpO34ArdPldzl4ECYlOmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ccVYXGl1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ccVYXGl1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AB9FC4CED1;
	Wed,  5 Feb 2025 08:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738743966;
	bh=NjfUcVbPp7VNLRuemltc9018TbIE6zRT+9wxD+QPcgY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ccVYXGl1fnfhmzfy5jYUxykmPuVRp1vrRMmUiy/FeNS8eiZpXwZTiHOqaM0qN0FXD
	 uhVWqI+wjW5ePYBt0HJzDNKb/HXxdRQcwC/tMclIEHxjH/TjD7bkdnJKpcd5L9e4ed
	 t0vjoj1btr/Ci2cauV6KlKF3sx8bC+GQp+1V3GHM+h0D4eQ+PkSmGBt2JELTCGdYH4
	 m3635vDlE7NdPpYTtClqRcPCX2vHBqscsriIOwvFt3KKnoZx9EnEnwiOjZQ9xYT1Uj
	 3Z6ou1ZHngdvVhK35P5Zpqyp0jY1PqbSHzO8cxa3PXo7i+z8DbUivPyFGcx1rCLg1V
	 E9VXlG8tf0S+w==
Date: Wed, 5 Feb 2025 09:26:03 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sergey Lisov <sleirsgoevy@gmail.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: gpu: arm,mali-midgard: add exynos7870-mali
 compatible
Message-ID: <20250205-spirited-mahogany-mammoth-286ddb@krzk-bin>
References: <20250204-exynos7870-gpu-v1-1-0db4c163a030@disroot.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250204-exynos7870-gpu-v1-1-0db4c163a030@disroot.org>

On Tue, Feb 04, 2025 at 02:02:55AM +0530, Kaustabh Chakraborty wrote:
> Exynos7870 SoC uses the ARM Mali T830 GPU, document its compatible
> string with the appropriate fallback. The T830 compatible is already
> defined in the panfrost driver, but was commented out as it was unused.
> 
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
> This patch series is a part of Exynos7870 upstreaming.
> ---
>  Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

