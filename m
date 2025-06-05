Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BAA221CC59;
	Thu,  5 Jun 2025 18:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749149760; cv=none; b=ZsROkm5Iv3CmmkKrtXaMZMR+v0JjSBhVrtrd+Adsnd5RBGPna6Sa2ZrGqPXmVhyuQVeRASM+Y1frX0H2eTEsdPWSmwZuCY2OB6Cfx+FvFd3jvP3FQLeqb1SQycwwl5N5E0G8q01XVVHw5NvLVER6an1/BoLPWOMsZCwYW/dk0B4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749149760; c=relaxed/simple;
	bh=S57JYWqRIlYzccIFianGDz0QZjyJ43EZOMsNSS6TWvI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pQPTjjTN2zWhDwXpf8PshR52dL9H3+/jzRbFRJAZxyafqpM2xf65tuIW446WjV718BH1W7531zn27zRIApiHIPL6za/6hGxa/WtMFwRwa9C6QwvXrBQbndmhVs3TjCCCaQoXj4zIpHGYn4U9dHIoXmoJO3hLa54sJKepDemN2VE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nQfnnKYc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nQfnnKYc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85B42C4CEE7;
	Thu,  5 Jun 2025 18:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749149759;
	bh=S57JYWqRIlYzccIFianGDz0QZjyJ43EZOMsNSS6TWvI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nQfnnKYci8teOCyjgjTnHjSquyEVxq+bVamGc0l1VLWCqcrr7P69etpEuHAllln2i
	 moIVoBMdmlZS+Ajx2Oye6jxQR1t40Aian7uTt0gAEeFC2ye3CUuMQy+lIqUI9/JdvX
	 JZYKYsdSfh6xVMPJKrNdviIrnRcy1lJwMSqWhwOkZ3Sq4JjdaC9jPxREHUFfVyxKSA
	 Q+ClJQv3lD388fR7+kzL/S8w1Wq3DU5CdVika52EFYiJvllcy0Wn6qSnow3y14ISvp
	 Ji0QMXnyi/h3iiaOxRSFSPy4a3eGfvPtBd8/YApweSXv+Xedc0mjwC6GOzGDHgLYJB
	 8bBizA6GT198g==
Date: Thu, 5 Jun 2025 13:55:57 -0500
From: Rob Herring <robh@kernel.org>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: linux-kernel@vger.kernel.org, justin.chen@broadcom.com,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 2/2] memory: brcmstb_memc: Simplify compatible matching
Message-ID: <20250605185557.GA3023589-robh@kernel.org>
References: <20250523184354.1249577-1-florian.fainelli@broadcom.com>
 <20250523184354.1249577-3-florian.fainelli@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250523184354.1249577-3-florian.fainelli@broadcom.com>

On Fri, May 23, 2025 at 11:43:54AM -0700, Florian Fainelli wrote:
> Now that a "brcm,brcmstb-memc-ddr-rev-b.2.x" fallback compatible string
> has been defined, we can greatly simplify the matching within the driver
> to only look for that compatible string and nothing else.
> 
> The fallback "brcm,brcmstb-memc-ddr" is also updated to assume the V21
> register layout since that is the most common nowadays.
> 
> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
> ---
>  drivers/memory/brcmstb_memc.c | 58 ++---------------------------------
>  1 file changed, 3 insertions(+), 55 deletions(-)
> 
> diff --git a/drivers/memory/brcmstb_memc.c b/drivers/memory/brcmstb_memc.c
> index c87b37e2c1f0..ec4c198ddc49 100644
> --- a/drivers/memory/brcmstb_memc.c
> +++ b/drivers/memory/brcmstb_memc.c
> @@ -181,65 +181,13 @@ static const struct of_device_id brcmstb_memc_of_match[] = {
>  		.data = &brcmstb_memc_versions[BRCMSTB_MEMC_V20]
>  	},
>  	{
> -		.compatible = "brcm,brcmstb-memc-ddr-rev-b.2.1",
> +		.compatible = "brcm,brcmstb-memc-ddr-rev-b.2.x",
>  		.data = &brcmstb_memc_versions[BRCMSTB_MEMC_V21]

This entry is pointless because the default will get V21.

In fact, I don't think you need the new compatible string at all. It 
doesn't work to add fallbacks after the fact.

Rob
