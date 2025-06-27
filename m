Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECC6425E452;
	Fri, 27 Jun 2025 21:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751059151; cv=none; b=o4/Qym9AVJOrdCI6KkfoGfsvtRCjuJFDZuATeQ9ZEYseWmdeDplma4bgbd+r1yCvhk7KeaI2GMBrbbsXFAGUhsRvVPQh8rN1Ak+d+BSrxgsYWcHaQj9mZ04FA8hoXF1GgCa4zRMn1xHpo0/Vuhv/hV8dRPdD9Q0HizjYzT5Khfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751059151; c=relaxed/simple;
	bh=DJo/Xw/Bqco4vBD6Mqkh+C8Ix5OPOEQ1fzty/x4dnyk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tNM/ob9thseS/aOl+kOfQd7x132CdAq8ZMoKcq5WA3aMFM19f/UFDd7SLKlQJD4ImDArSoYMvk4wuQKiTZ2q+6Keeoyx7NaD6numWcDMV+Dla7FBg1tYt+PQnY+YCE15/YFOAcz7XVuM0h7dooOohhchRIFJxJbVvPliTbt13/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gQD4SIMF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gQD4SIMF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58D82C4CEE3;
	Fri, 27 Jun 2025 21:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751059150;
	bh=DJo/Xw/Bqco4vBD6Mqkh+C8Ix5OPOEQ1fzty/x4dnyk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gQD4SIMFHjE7kHEjfbyq8Bv9jRE3HgswR1vZshITIExP2INHjVXbvpQjvn/cMhU2k
	 yTVaVahdRv/vWLPArfKV1XPJiIWWwt+HMY/k05nw4CuTX3XKYL5kepGomHutsXuOSF
	 elS3CPQ9zaP+SnJZrxHBFwvojxvhvz1y4eZw9bthfI5YTUl0ib81mTB6fGG+1yfR2h
	 6LSlcDATwYmPn5eJZItgVH3aUPfUqOSr9XCjhT2Z2QKNoE6gwEpcGSDm1cbKVpq5Aj
	 +KWf5WXxSOW/Q5iPVmQU+dzLty/ZZGeXxaLryvfb9alyGhPZLGbeU69ho8KIbpozyc
	 xsRljQdH2oBWg==
Date: Fri, 27 Jun 2025 16:19:09 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Vladimir Zapolskiy <vz@mleia.com>
Subject: Re: [PATCH v2 1/1] dt-bindings: usb: convert lpc32xx-udc.txt to yaml
 format
Message-ID: <175105914924.160757.6319015774337763114.robh@kernel.org>
References: <20250625214357.2620682-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625214357.2620682-1-Frank.Li@nxp.com>


On Wed, 25 Jun 2025 17:43:53 -0400, Frank Li wrote:
> Convert lpc32xx-udc.txt to yaml format.
> 
> Additional changes:
> - add clocks and put it into required list to match existed lp32xx.dtsi.
> - remove usb-transceiver@2c at examples.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> changes in v2
> - update commit message by add "additional changes"
> - add clocks to required list
> ---
>  .../devicetree/bindings/usb/lpc32xx-udc.txt   | 28 ----------
>  .../bindings/usb/nxp,lpc3220-udc.yaml         | 54 +++++++++++++++++++
>  2 files changed, 54 insertions(+), 28 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/usb/lpc32xx-udc.txt
>  create mode 100644 Documentation/devicetree/bindings/usb/nxp,lpc3220-udc.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

