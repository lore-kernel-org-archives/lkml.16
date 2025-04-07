Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0951922B597;
	Mon,  7 Apr 2025 23:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744069695; cv=none; b=IJSQxx3d450TmlmDgmc6HKi3bfbbv+ws30Ql3ZUCgXAP+oQDOIfYHgU0nBQTHiYLuBz3neOAcvUkKdxd3tBU7GPNFceH8O5g6KInB1Pxog4I8P+dpZWhr6HCxAyf+e6fxBVjUgUhpysz/qGvRNehrnLf5wKmwynQGJbcNE4SJmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744069695; c=relaxed/simple;
	bh=61FySSGCFmYcaDfbgWfsvj/rq0z+27TihchOLygJZyk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o0szJ4Pv1iFlUOrR6ycD0ugm6bHWP1VwAB4veF+VpX40SH+z53xJEcSrGjPGZovet2XxVx3xfRYumixSirI3PT0sPE4mX4nsrCAj7CLGIArYrFXFvUrqaVKPgXZ2E6Swbw2TbRXXUpWTE/ov7l/KekPGlvEEuyFnzMaQboPk0kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r8Z86gJo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r8Z86gJo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A2EAC4CEDD;
	Mon,  7 Apr 2025 23:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744069694;
	bh=61FySSGCFmYcaDfbgWfsvj/rq0z+27TihchOLygJZyk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r8Z86gJojkJUri5K0AWxvKlU4zjP2gmuFhQCGbJJmxFyihKwvvFO2IAaHOb/0bNdE
	 kfHzhAJ1AWCxi/DIZyppPOBls8mrv/D68nZDU041XdNOBYZnH4wmyMQ7jLJY1vyA37
	 iamK6ikTJoTmU1a5w7jxK60NIJIgKZzT4rvKqRGyRUoEKkQLLSEG5k8rF/SYG2P04Q
	 VnooibXuzPc7+YQhHahs+2glJGfTyZyaPiah8itex2xNcm7DkaBdT4sQJxv4SMf1L7
	 FyQNSiSz/m0l31nbQaAstYp5b1G02XyZmcYcsa9b7uJU/RHjVyYV+BcO/dJVdlxcEn
	 6p1n/baAFJIaA==
Date: Mon, 7 Apr 2025 18:48:13 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: jernej.skrabec@gmail.com, krzk@kernel.org, agx@sigxcpu.org,
	linux-kernel@vger.kernel.org, robert.chiras@nxp.com,
	simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de, devicetree@vger.kernel.org, mripard@kernel.org,
	andrzej.hajda@intel.com, jonas@kwiboo.se,
	Laurent.pinchart@ideasonboard.com, neil.armstrong@linaro.org,
	rfoss@kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org,
	dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
	airlied@gmail.com
Subject: Re: [PATCH RESEND V2 1/1] dt-bindings: display: nwl-dsi: Allow
 'data-lanes' property for port@1
Message-ID: <174406969099.171841.8161329634639318848.robh@kernel.org>
References: <20250407150442.2778299-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407150442.2778299-1-Frank.Li@nxp.com>


On Mon, 07 Apr 2025 11:04:42 -0400, Frank Li wrote:
> This controller support scalable data lanes from 1 to 4. Add the
> 'data-lanes' property to configure the number of MIPI display panel lanes
> selected for boards.
> 
> Change $ref of port@1 from 'port' to 'port-base' and add 'endpoint'
> property referencing video-interfaces.yaml. Allow 'data-lanes' values
> 1, 2, 3, and 4 for port@1.
> 
> Fix below CHECK_DTB warnings:
> arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx-lvds-tm070jvhg33.dtb:
>  dsi@30a00000: ports:port@1:endpoint: Unevaluated properties are not allowed ('data-lanes' was unexpected)
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Missed v6.15 merge windows.
> 
> This one elimiate last two lines warning under arm64: dts/freescale
> ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> 
> Resend V2: include Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> tags.
> 
> Original v2 thread:
> https://lore.kernel.org/imx/c5y6mocsd77wj5lah6n47vtteqc5ekcrbdod6z5vtcnxhleudw@kfhpyoiylqqp/
> 
> Change from v1 to v2
> - Add the reason why need 'data-lanes' property in commit message.
> ---
>  .../bindings/display/bridge/nwl-dsi.yaml       | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
> 

Applied, thanks!

