Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F5607FD;
	Fri,  6 Jun 2025 00:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749168228; cv=none; b=spvCwLHyG/H8r8uqFQrHwwIZKKrmjoVwZna+quQ/16ITHuBGbrDp1ZAWzdgm5scUiZqRJt70hQmGqSicBEqUIuMz91xulYLCgosWlyfg0+DrobeNgFDWhH+LIwqbxYNAOroZbp2q5HktW5s0K3AA1mi/3p0z8zT9NZzwZJb5f9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749168228; c=relaxed/simple;
	bh=2qZMMiFf7K4xfAYvwTGOLOc43Kcp/dm/Gr/nmIu6Xd0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tz9MnfOtc2O17AQKOuYlg+TBFrjrdGre9hFenG9pE/eee5Vw0yaS0iQgoTxbYzkq/zlj4laQRZQAOxwkna4abHKoLEenY9u44IxckU1Lddl6nhNOAel8NYQK4QwqYObdpZ2GBKEo4aFXTW3O0JHM7tu5JAksFzMpgAwhmlGc3pY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H71qVmG9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H71qVmG9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 525E0C4CEE7;
	Fri,  6 Jun 2025 00:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749168227;
	bh=2qZMMiFf7K4xfAYvwTGOLOc43Kcp/dm/Gr/nmIu6Xd0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H71qVmG9ry/kkta1Y+tIyI34e1s2DgTXHVCOUsI6KS1khfFYP7IPt7ph4kLvIrr7o
	 jvSyg3wQkw7gxErwDehufw7rJtUY155V530oQq6Zcvh3MnPhiDiJhcCsdpFpY04dso
	 cuOPN5TJSH90yfUXYd58+BE2CBYqiPxZZCzZ4CeyF/TVwolISzeOgwY0vUS2toXqT9
	 H7HCxYhdZgBXln7SLMW1aGHiDj0WThwD2QcvoZAj6AQqRa6q70GdPNWMBn8Vrv2ct7
	 97qk0TpZojx+Ydv+3+sGiSeQKmW6rdJu+XUgaPtjyoF3Mkey15RTLlR/mI3yWrxUUK
	 7zZcuGuIogaiA==
Date: Thu, 5 Jun 2025 19:03:45 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, imx@lists.linux.dev,
	linux-mtd@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH 1/1] dt-bindings: mtd: convert nxp-spifi.txt to yaml
 format
Message-ID: <174916822312.3511589.589270741515200366.robh@kernel.org>
References: <20250602140946.941159-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250602140946.941159-1-Frank.Li@nxp.com>


On Mon, 02 Jun 2025 10:09:45 -0400, Frank Li wrote:
> Convert nxp-spifi.txt to yaml format.
> 
> Additional changes:
> - ref /schemas/spi/spi-controller.yaml.
> - remove label in example.
> - change node name to spi in example.
> - remove child node in example.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../bindings/mtd/nxp,lpc1773-spifi.yaml       | 74 +++++++++++++++++++
>  .../devicetree/bindings/mtd/nxp-spifi.txt     | 58 ---------------
>  2 files changed, 74 insertions(+), 58 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mtd/nxp,lpc1773-spifi.yaml
>  delete mode 100644 Documentation/devicetree/bindings/mtd/nxp-spifi.txt
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

