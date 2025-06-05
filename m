Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA29C4400;
	Thu,  5 Jun 2025 18:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749146469; cv=none; b=UeOJ7dDE2bgEr9thAe2N1PfEan+OMOwY89RdmeNzSVnTKRYiDYh8+PTBUrE+mS11LHIVTX9GP5LCEk9Cf6Zxqm03Jo7h/bLytj1KbBnRKfm0hTooNhvG76y/qio/PBbPs6/rargoRfPD7uUsa5e6+scsPCHfTtVKomSfV2tTzT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749146469; c=relaxed/simple;
	bh=FFaPKo3Niu9RqMBqouhyjsr5pkbat3ko58gh0kIaygI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=epYzqvRHvQgJlgq1ZzIRbDwywo1sOEydK+HKlJoNIm52boT6PUahZz46IqZmYoLRZUif/oOsXDM27JV+m9NoCPmlfBF9lK+oFZBVxBvXUOP+be8IsY9oO64RO4SMmpIUytB7BDLiNYkmzBnysjFnNbeQcYwz+8hw+bOd6KYo4FQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qsISSBDm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qsISSBDm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B252C4CEE7;
	Thu,  5 Jun 2025 18:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749146468;
	bh=FFaPKo3Niu9RqMBqouhyjsr5pkbat3ko58gh0kIaygI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qsISSBDmLN/LacoCwnMZjX5AwlQ7v2Rd24XpsPDo7CB7dKlFPq3TSnSLcJbXoqe9z
	 BLONc5ERjnWhh8IkPkc+EPWwo4OpF5rIWXslyj63jMMkTqwkCpbUw3S2cqFDsOYtvY
	 2CM2Vv4P8LwAtN6HwUx/HHYiTM7BuFqyBrfWCjMjSDa/cVnkD/IK+0wx+z/ECTAwMI
	 EIUgu+D3+HqTv1joPgZO+gYKRffxar6Eqttl6hOQyhmyt4RO1BDynBzoKtjduYwwQR
	 nwop7WMcExp/55hMMt/dejvUObz0mERk4Cx4e/8N8VQLRrG1gOPuuMQwcIwZXCwVGP
	 elx6AsZdDtHew==
Date: Thu, 5 Jun 2025 13:01:05 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
Cc: conor+dt@kernel.org, linux-kernel@vger.kernel.org,
	claudiu.beznea@tuxon.dev, nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com, vigneshr@ti.com,
	linux-arm-kernel@lists.infradead.org,
	krzysztof.kozlowski+dt@linaro.org, linux-mtd@lists.infradead.org,
	miquel.raynal@bootlin.com, devicetree@vger.kernel.org,
	krzk+dt@kernel.org, richard@nod.at
Subject: Re: [PATCH v3 2/4] dt-bindings: mtd: microchip-nand: add atmel pmecc
Message-ID: <174914646334.2943943.16175676311352783500.robh@kernel.org>
References: <20250602053507.25864-1-balamanikandan.gunasundar@microchip.com>
 <20250602053507.25864-3-balamanikandan.gunasundar@microchip.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250602053507.25864-3-balamanikandan.gunasundar@microchip.com>


On Mon, 02 Jun 2025 11:05:05 +0530, Balamanikandan Gunasundar wrote:
> Add bindings for programmable multibit error correction code controller
> (PMECC).
> 
> Signed-off-by: Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
> ---
>  .../devicetree/bindings/mtd/atmel-nand.txt    | 61 ------------------
>  .../bindings/mtd/microchip,pmecc.yaml         | 62 +++++++++++++++++++
>  2 files changed, 62 insertions(+), 61 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mtd/microchip,pmecc.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

