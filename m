Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E2F288CAC
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 08:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750147205; cv=none; b=uhawo3ffgL/oRgSBTn0fxh8cHSfJyKqnIg3uL3ye+oq/4SKBGR7taDAB5zpgIHLXqHZQlvZpbL1SBOKBCCkntkwTsXdJbINXrngUn72y4847D6DbI3fLN8utGo8b2TpUm9cGvPJzwpTA7B8T57KNT6hcQjON95S1JShayJbSfdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750147205; c=relaxed/simple;
	bh=UbMrgrxGSnG5QmILlu9vBgJIYjFRInQ4JmymSgsLo2M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IyqOeKIYSYRC5LvVD2lluVDXHtaaTFT+4lfTo9fG8Ui0ABLh+f9s000CdSyQq0z72JJUlf7p0IQcx23rs7bdW6HEscu2PKs+it1S347/RaZMaEg6jguQMLFPzDcYym7NiSrvSKjLODw6sU367MRFH4A99OQOzIm8+qI5x8mHL44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WclTdQBf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WclTdQBf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1530C4CEE3;
	Tue, 17 Jun 2025 08:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750147205;
	bh=UbMrgrxGSnG5QmILlu9vBgJIYjFRInQ4JmymSgsLo2M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WclTdQBfOSaaufAvyHlWwcjStHDYL4M9cpu5/5VMtFa+5cTFiTiqa4KjssJXInsOt
	 otcWW9J1+eWGaFlxjuLtmPzEprLNAX2vGyg584/eMoHpwxWp4ipxZ/p2WQKOrMngz/
	 NOy5Ow1vOAKi7zk4cYSJQd3Sz7izNLe/SHmsAOO65OgsMvUUYFvvF9aeY1or9msxhO
	 QMItb3spCa4PhopjX94f0Qkts6xygeBweWT/Mvyfc5WcgbbaMEANcMr92rUzX0FkW6
	 SR1Xnyea2W0tkBRJ+/bdSKfXhl+284HQFYJ6DJgPSzjhiYUyKurjad5/9n8QHBeR/Q
	 bAthUrajeXs8w==
Date: Tue, 17 Jun 2025 10:00:01 +0200
From: Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: linux-kernel@vger.kernel.org, tglx@linutronix.de, 
	Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>
Subject: Re: [PATCH] bus: moxtet: Use dev_fwnode()
Message-ID: <32qyokqqrdauwzjph45cga2ypqwn4i6aa3yiusasq6syxwhxlr@e2n7zb6rip2d>
References: <20250611104348.192092-1-jirislaby@kernel.org>
 <20250611104348.192092-3-jirislaby@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250611104348.192092-3-jirislaby@kernel.org>

Reviewed-by: Marek Behún <kabel@kernel.org>

On Wed, Jun 11, 2025 at 12:43:31PM +0200, Jiri Slaby (SUSE) wrote:
> irq_domain_create_simple() takes fwnode as the first argument. It can be
> extracted from the struct device using dev_fwnode() helper instead of
> using of_node with of_fwnode_handle().
> 
> So use the dev_fwnode() helper.
> 
> Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
> Cc: "Marek Behún" <kabel@kernel.org>
> ---
>  drivers/bus/moxtet.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/bus/moxtet.c b/drivers/bus/moxtet.c
> index 6c3e5c5dae10..7ce61d629a87 100644
> --- a/drivers/bus/moxtet.c
> +++ b/drivers/bus/moxtet.c
> @@ -737,8 +737,7 @@ static int moxtet_irq_setup(struct moxtet *moxtet)
>  {
>  	int i, ret;
>  
> -	moxtet->irq.domain = irq_domain_create_simple(of_fwnode_handle(moxtet->dev->of_node),
> -						      MOXTET_NIRQS, 0,
> +	moxtet->irq.domain = irq_domain_create_simple(dev_fwnode(moxtet->dev), MOXTET_NIRQS, 0,
>  						      &moxtet_irq_domain, moxtet);
>  	if (moxtet->irq.domain == NULL) {
>  		dev_err(moxtet->dev, "Could not add IRQ domain\n");
> -- 
> 2.49.0
> 
