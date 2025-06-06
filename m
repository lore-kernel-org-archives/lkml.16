Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A9129A2;
	Fri,  6 Jun 2025 02:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749175701; cv=none; b=mOK7KSTv4jeQu7Za+9oYKWC8yeE5k2PI4/VyuN71/cBhueib29+av7OlvaxdtOJ/+VR07zV26Q2JuUCDxRG5Pso38WRgdoO4ohjTRIM8QYaQB/gt7QhtjAkPZHnqvydamK2DzbTivEg6LvY2u7OxSvvC17hK2ZNo64XkeMtunyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749175701; c=relaxed/simple;
	bh=YTdf3xm7wZ7lUC4dCzd5973Ix6qiOcyX9BbD6pAEsLs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CrLYJgezjd+WBz+uYejn9meadFeiGyb/aLRJYD/3LyzST4LyNbdVHPOEXj2pZn1jq0iaNEQMVFyyCvEb8gIXgNLKYfbb2hrnjPrqMMzpiEgDhq1bfJGYOppQz7dnTtibLya+8cde14SxAxsowzHlhTM2pJgu90QJiuIXM93TyAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n0qgeNSA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n0qgeNSA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30390C4CEE7;
	Fri,  6 Jun 2025 02:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749175699;
	bh=YTdf3xm7wZ7lUC4dCzd5973Ix6qiOcyX9BbD6pAEsLs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n0qgeNSAQ2lpHZ3DG2HYw6oyiOZfMZlU33z+/XIvr5hvN8XLfZnw1JeeF3RWPVPYS
	 Oin/+k2n/tJjx2XNCJPPCeiIZP7nXGGKHxqFRxmcTqdFL2fy219MQzBcXYKTson/A1
	 ri2mjCJI/nnfe8ht4RkXYys8S+3r054PzTQs6ecrJDkXIaiCjHbPwX8eXkSlp0pAqu
	 rF1AT3Rlg0VO3faQvRaKi60C7Wr+gHuMyvvtSf0FVbzV+bkrD28+H6BKSAaZ5Xb+3S
	 aaTFpX+9mPMCkXOiBhsEx73LhSrAYwv2k9c5VPqzj/HxsLBoxx48CSTwktgBVhjj4Z
	 478AOOBP5Z8Vw==
Date: Thu, 5 Jun 2025 21:08:17 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, imx@lists.linux.dev,
	Maxime Ripard <mripard@kernel.org>,
	Liviu Dudau <Liviu.Dudau@arm.com>, Simona Vetter <simona@ffwll.ch>,
	David Airlie <airlied@gmail.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Andre Przywara <andre.przywara@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/1] dt-bindings: display: allow resets  property
Message-ID: <174917569478.3779604.1149263045871881557.robh@kernel.org>
References: <20250602144906.944866-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250602144906.944866-1-Frank.Li@nxp.com>


On Mon, 02 Jun 2025 10:49:06 -0400, Frank Li wrote:
> Allow resets property to fix below CHECK_DTB warning:
>   arch/arm/boot/dts/nxp/lpc/lpc4337-ciaa.dtb: lcd-controller@40008000 (arm,pl111): 'resets' does not match any of the regexes: 'pinctrl-[0-9]+'
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  Documentation/devicetree/bindings/display/arm,pl11x.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Applied, thanks!

