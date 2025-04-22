Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5409827EC9D;
	Tue, 22 Apr 2025 12:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745326526; cv=none; b=NZ4Lh58BgLEQNKgG6cRDqzrivOxdS0xwgCVGdRvTa7Y4qL54cLRbrOsDG050VyEXgtjsEdj3+gaqHZvjo3zV8qPbZ/KCDgkpNzA+kGlOzIML6E9VwDMSH79aeEg17xmfvhG2CyjPQbnajCjrysRplt4waDIurt+9jBan7U+C8A8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745326526; c=relaxed/simple;
	bh=5J5vS+tSTeC2z4T6bEh4qSkSbF4o4ICwzhXYHWtnIoc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S5/OmzFpSENIAeKsjViupHP4l8IdmbMfcbN9YRDSgDqrbGMpKvkVHrc0ikZArMD+fwNcIlVsD1yH6cQiUXeEU5Z34q7opnOAMaRWyZrZWg7a4B0zuVOE0/yMoTegBY1rZkstemloVjh92PswVPQzS/DXQHO5fpNMVIwIqOGDYo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c0MKeG0i; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c0MKeG0i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DF79C4CEE9;
	Tue, 22 Apr 2025 12:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745326525;
	bh=5J5vS+tSTeC2z4T6bEh4qSkSbF4o4ICwzhXYHWtnIoc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c0MKeG0i9UB1rJMZhVnH1wFUcNcgQXUdMCCFUNcuFJzt85/QZH+ittf0htZg4cFSF
	 zp8erxnPGi2pOrvKMLF5aBDtOGxqWr6/7ZsWv7igYe4rFDTJvoDfxvk8ixAMs4Auk7
	 aCWet/lbt2351cFk8n1dg5LUfOO9ez7Mu/jsVCvRCGl7CgukrhN5EXWfVQYP7PipCA
	 N/y53TKsuY11paq2Lz5R8KweS+rdnG+vSqmNwqw550FL8dG0vYTeGRZxRdMxexyPeC
	 FonJtKBeOh2yKCTOU/DhfQhIB0fA9IvUuewD0tzPo1Gmmu4sxPEh6XeAxZlshg5RUu
	 03dak/v+xBmeA==
Date: Tue, 22 Apr 2025 07:55:23 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	David Airlie <airlied@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, imx@lists.linux.dev,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
	Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	Shawn Guo <shawnguo@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Simona Vetter <simona@ffwll.ch>, Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v2 1/1] dt-bindings: display: imx: convert ldb.txt to
 yaml format
Message-ID: <174532652176.960722.2664945532929851168.robh@kernel.org>
References: <20250417145742.3568572-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417145742.3568572-1-Frank.Li@nxp.com>


On Thu, 17 Apr 2025 10:57:41 -0400, Frank Li wrote:
> Convert ldb.txt to yaml format.
> 
> Additional changes
> - fix clock-names order to match existed dts file.
> - remove lvds-panel and iomuxc-gpr node in examples.
> - fsl,imx6q-ldb fail back to fsl,imx53-ldb.
> - add fsl,panel property to match existed dts.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change from v1 to v2
> - use oneof in clock-names. imx6dl use imx6q-ldb comaptible string, but
> the clock-names is the same as imx53. To reduce dts impact, use oneof to
> allow two group clock-names list
> - fix typo pannel
> ---
>  .../bindings/display/imx/fsl,imx6q-ldb.yaml   | 194 ++++++++++++++++++
>  .../devicetree/bindings/display/imx/ldb.txt   | 146 -------------
>  2 files changed, 194 insertions(+), 146 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx6q-ldb.yaml
>  delete mode 100644 Documentation/devicetree/bindings/display/imx/ldb.txt
> 

Applied, thanks!

