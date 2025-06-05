Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4E66274FF0;
	Thu,  5 Jun 2025 23:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749167087; cv=none; b=dKAah41SnLmFVPG/j14KG1XxjBryPIeudqeCKPctegFkRKre7oAplvOQ7L7pe7o0JXFI6RVhZWomdcdsijg0g0v2jwY0zGiGKElY5je8SBA3NEgUTb/bpq8TSjC+onvA66FjSBDAgOLLFvu+sHGBtjNYbV1+CuKgB0zOt2ynyzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749167087; c=relaxed/simple;
	bh=FdPpkkiyTjrRf1k9kXD8FW3k60ZDUpf8wSRXYAtaJek=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KLjCtGpmyZ0JMEB9S5c4jvekhwlin6EiJJBZXWd1Ng5YPJgvmyPCKMzyXHJ2wBU6f5kXj7GSkv4eoUeiZnTXLx1oV6+8FHhWEVSoP++zVbTTQqz1ent/RMrItp0yzYG0G5axgcqrZyONl3kRaZKDdE56D6d3iBhgzgYHt/dW40U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nVavJEEy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nVavJEEy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB881C4CEE7;
	Thu,  5 Jun 2025 23:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749167087;
	bh=FdPpkkiyTjrRf1k9kXD8FW3k60ZDUpf8wSRXYAtaJek=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nVavJEEyPDh4SmnZlblEpJ1MOh4t/AdHhrRShrX8jso6gmGzRjllq6fx7z9Hqh44s
	 MgOWF2oF6+bGCDN5BZ9fiIOxzZd0MGhbfjDW6yI90C9+bewe38nvCUmGO7vNVbc6dp
	 cPk6vVqq5e7jgb40CEjasC3/nCJxHQdHSUNeAWqc2f4kzRo1hnQnDwcRMTYpNcSrYS
	 rsU1vjqGUzQxXEe+WxjW1CWavgmpGPlS/YuwqJFHRdelq8u5GktSozVwEDvpErrGyp
	 Xff377qHTjEgQ/x99Xo7FsrzjYqmsbxXbDSZrwhgdBSEID2Qm0Jo9cIkNknBz7G1lD
	 UnBoUXeM4j6cw==
Date: Thu, 5 Jun 2025 18:44:45 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Maxime Ripard <mripard@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, Simona Vetter <simona@ffwll.ch>,
	linux-kernel@vger.kernel.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Marek Vasut <marex@denx.de>,
	Conor Dooley <conor+dt@kernel.org>, imx@lists.linux.dev,
	Stefan Agner <stefan@agner.ch>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/1] dt-bindings: lcdif: add lcd panel related property
 for imx28
Message-ID: <174916129118.3337875.11119960463173583665.robh@kernel.org>
References: <20250529200520.798117-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250529200520.798117-1-Frank.Li@nxp.com>


On Thu, 29 May 2025 16:05:19 -0400, Frank Li wrote:
> Allow lcd panel related property for imx28 and keep the same restriction
> for other platform. It is legancy platform and set these property to
> deprecated.
> 
> Fix below CHECK_DTB warnings:
> arch/arm/boot/dts/nxp/mxs/imx28-apx4devkit.dtb: lcdif@80030000 (fsl,imx28-lcdif): 'display', 'display0' do not match any of the regexes: 'pinctrl-[0-9]+'
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../bindings/display/fsl,lcdif.yaml           | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
> 

Applied, thanks!

