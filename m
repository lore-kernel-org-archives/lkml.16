Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 865151F2BA4
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 15:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749829273; cv=none; b=vEVpwQtqB7nFn1GsEablO42bbXsu6oRtEu9X4i2jeTGCFF4yHUAjKn0rRtMdG+me6ZgpR3qPanHO2UNx1JjH3e4sERUv77dl0oUw5X1VnEgikb/VHQD098h848oTK4yMkqyKjBjCs1H7EurEVFLbz74BMxjNT70zNv01WEbTsr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749829273; c=relaxed/simple;
	bh=OPfJpnDGumZnpV/1l9h+JR944TW/OVW3YtAbRaqg0LA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=RzJbvOQiwylzu4vUR1EDGAb+pTQMcXdrXb/z/PD2UNQQjsOy1gIBXDhTGJknowNkdKRlgFBVToQhGjqLuqlgI4UFpXdS+paxI3IHwVftRcU6NGOABygh0mHmxebdA/szSfjlylZJflih/svQS8hZG7tSD0VTXG1rSaVVk/aTw6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qF/KPrHb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qF/KPrHb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCBF5C4CEE3;
	Fri, 13 Jun 2025 15:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749829273;
	bh=OPfJpnDGumZnpV/1l9h+JR944TW/OVW3YtAbRaqg0LA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=qF/KPrHbTdaPwRRZt8b3pqL7nWsNm/Bd33bG7fWZOEseOeWWPtJ8Tl7djOCRHf6t+
	 gzL+7uQa0dt+q+Anxjfgnm2YAilrjtXzZ8eBJ9DFESBQAdETx3rPjaH65qHsvpeWN4
	 ng0JgYtLm5Wt1G7trL0OpdxkvpsHebbzW4W16JTPgRSn2st166sQox1X2M1qiOD/ZQ
	 WAZL/7o/zN7Z51xdSgTD9azgsK4Kiw95xaYTxqZcZ82VVTiiarL/thDqzSjFrb/NzG
	 g4IB2+tC4dQUZt8rgpOXOVnzqVvrTrtrGey8YARQLZxIId2+APYDKUffR7zZTp1gtH
	 5zmTnLJK7snuw==
Date: Fri, 13 Jun 2025 10:41:11 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: linux-kernel@vger.kernel.org, tglx@linutronix.de,
	Arnd Bergmann <arnd@arndb.de>,
	Manivannan Sadhasivam <mani@kernel.org>
Subject: Re: [PATCH] pci: altera: remove unused 'node' variable
Message-ID: <20250613154111.GA961350@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250611104348.192092-2-jirislaby@kernel.org>

On Wed, Jun 11, 2025 at 12:43:30PM +0200, Jiri Slaby (SUSE) wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> This variable is only used when CONFIG_OF is enabled:
> 
> drivers/pci/controller/pcie-altera.c: In function 'altera_pcie_init_irq_domain':
> drivers/pci/controller/pcie-altera.c:855:29: error: unused variable 'node' [-Werror=unused-variable]
>   855 |         struct device_node *node = dev->of_node;
> 
> Use dev_fwnode() in place of of_node_to_fwnode() to avoid this.
> 
> ----
> I checked the other PCI host bridge drivers as well, this is the
> only one with that problem.
> 
> Fixes: bbc94e6f72f2 ("PCI: Switch to irq_domain_create_linear()")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> Reviewed-by: Jiri Slaby <jirislaby@kernel.org>
> Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>

Applied by Mani to pci/controller/altera.  I amended the subject to
match history.

> ---
>  drivers/pci/controller/pcie-altera.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/pci/controller/pcie-altera.c b/drivers/pci/controller/pcie-altera.c
> index 0fc77176a52e..3dbb7adc421c 100644
> --- a/drivers/pci/controller/pcie-altera.c
> +++ b/drivers/pci/controller/pcie-altera.c
> @@ -852,10 +852,9 @@ static void aglx_isr(struct irq_desc *desc)
>  static int altera_pcie_init_irq_domain(struct altera_pcie *pcie)
>  {
>  	struct device *dev = &pcie->pdev->dev;
> -	struct device_node *node = dev->of_node;
>  
>  	/* Setup INTx */
> -	pcie->irq_domain = irq_domain_create_linear(of_fwnode_handle(node), PCI_NUM_INTX,
> +	pcie->irq_domain = irq_domain_create_linear(dev_fwnode(dev), PCI_NUM_INTX,
>  					&intx_domain_ops, pcie);
>  	if (!pcie->irq_domain) {
>  		dev_err(dev, "Failed to get a INTx IRQ domain\n");
> -- 
> 2.49.0
> 
