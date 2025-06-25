Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE9BA1F8AC8;
	Wed, 25 Jun 2025 19:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750878647; cv=none; b=PTw079em+GmpIruJ2ezyMPFX8S/vD70MFO8z90jisz7jYHhQacnY2f/9aYhbcITfgFey5VwlIDIPWq1PP5AOOsUd1P7M6g6ssqIijK9AtZGXCLbCieAPboTj+zCfZzmNUnZo2hfVh08rzZJxaKlgn7xqrA9qrNGRdq9U7r5HmDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750878647; c=relaxed/simple;
	bh=ajoB8sB1vgRax8Ggii7vw43UBv8w9ctfsgeLnoJDteA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cY6SMB/eb6X6Opz/coaxLaXJY4OGWuf/MnohHZJSUbcH4EPno2uQGeQRAUD2rQrl0ExBTxhUCNuxcCm4v20Xw6Vt8Tmef7c8bYFMKvpOCOvu1zWH6Vtd/ahP0LXacBEbt2Obg8M3Y3V099Il5ES3OKWAqrFoX8VlJxIA3CtVsrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WkAVxRJU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WkAVxRJU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32BAFC4CEEE;
	Wed, 25 Jun 2025 19:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750878647;
	bh=ajoB8sB1vgRax8Ggii7vw43UBv8w9ctfsgeLnoJDteA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WkAVxRJUq79jfSIUaEZlH1H3beUjt9/r+DJXuE6xroxlOpYy9rcTiEhYerJZXDNPQ
	 /93UGZ6OwWEXDhzYuLdQ/pnIjzS12EuhUpcaz+6BQoISUOKQ7k7EG69LQbAgLOlN8q
	 rPpdk7wvtD8YHWYiljJMcLIk5EWs3BtwO1MV2aYbJIul2cVZSe2uWPvvxoSAWZsWq7
	 PWYYl8j9xUsA73/hJApuAR0SU1Ovpz2bepGbnkylLFVwEsg9LpBk8RlEsJAdaVFGBC
	 wjMyeqwshlFDyPn5x+DzYqR3owI/iXo+JitzCwgk80MeOUaZeswRt1mpr5d7rON9gs
	 GV8zUqcqAAJNA==
Date: Wed, 25 Jun 2025 14:10:46 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	imx@lists.linux.dev, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2 1/1] dt-bindings: clock: convert lpc1850-cgu.txt to
 yaml format
Message-ID: <175087864578.2055525.4510390315154712025.robh@kernel.org>
References: <20250606162410.1361169-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250606162410.1361169-1-Frank.Li@nxp.com>


On Fri, 06 Jun 2025 12:24:09 -0400, Frank Li wrote:
> Convert lpc1850-cgu.txt to yaml format.
> 
> Additional changes:
> - remove extra clock source nodes in example.
> - remove clock consumer in example.
> - remove clock-output-names and clock-clock-indices from required list to
>   match existed dts.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change in v2
> - fix clock-indice and clock-output-name allow 1-27 items
> - add > at top decription according to rob's suggestion
> ---
>  .../devicetree/bindings/clock/lpc1850-cgu.txt | 131 ------------------
>  .../bindings/clock/nxp,lpc1850-cgu.yaml       |  99 +++++++++++++
>  2 files changed, 99 insertions(+), 131 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/clock/lpc1850-cgu.txt
>  create mode 100644 Documentation/devicetree/bindings/clock/nxp,lpc1850-cgu.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

