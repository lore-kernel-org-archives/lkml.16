Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD14E1F460B
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 23:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745537983; cv=none; b=hTeES25SHhFEbwjKcQ7RCr5gNTMSUvl1XYMAr0/q5XpdYnqbrazq/PMcfwRip9PPVql0c5pf5FIJ0HiogaRqyfdfeWK3FQ+Kc/pMTb+Dt1dENC0zJ7yYhERInsObP+UjNZkw7KsQZ0RYEr1WtFzvp3X1T16tKDMq0qoFc2Em1XI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745537983; c=relaxed/simple;
	bh=Ed4KLFH9HuHYkKJUWPeVRZ3OYFaVcVj2uHUgklVRMTc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=umGI91BMID3nJAAtM48JdoZRrzqFUPVMDjo09x5pHQoaPmpaqtV35F3H/9nJX7NZ5VIuZXQrIa7bxlNRNoqxa+CQ5XwtTtVGAC3odjWkyhtB4JPpJY6wRDahduKMd9Iir+O4ZW0oEcucd+YTDGr3/djXKeJIl41rWA3c2MHJkv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CB4D9339;
	Thu, 24 Apr 2025 16:39:33 -0700 (PDT)
Received: from minigeek.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AD4C23F59E;
	Thu, 24 Apr 2025 16:39:37 -0700 (PDT)
Date: Fri, 25 Apr 2025 00:38:36 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Chenyuan Yang <chenyuan0y@gmail.com>
Cc: wens@csie.org, jernej.skrabec@gmail.com, samuel@sholland.org,
 arnd@arndb.de, hdegoede@redhat.com, mripard@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drivers: soc: sunxi: Fix possible null pointer
 dereference
Message-ID: <20250425003836.74f068da@minigeek.lan>
In-Reply-To: <20250412165700.2298733-1-chenyuan0y@gmail.com>
References: <20250412165700.2298733-1-chenyuan0y@gmail.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 12 Apr 2025 11:57:00 -0500
Chenyuan Yang <chenyuan0y@gmail.com> wrote:

> of_get_address() may return NULL which is later dereferenced.
> Fix this bug by adding NULL check
> 
> This is similar to the commit c534b63bede6
> ("drm: vc4: Fix possible null pointer dereference").
> 
> Signed-off-by: Chenyuan Yang <chenyuan0y@gmail.com>
> Fixes: 4af34b572a85 ("drivers: soc: sunxi: Introduce SoC driver to map SRAMs")

That fix looks alright, indeed of_get_address() returns NULL if the
slightest bit in the property is not as expected, and we should check
for that.

I am just wondering if we should issue a firmware warning in this case,
instead of just silently skipping an entry.

Cheers,
Andre

> ---
>  drivers/soc/sunxi/sunxi_sram.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/soc/sunxi/sunxi_sram.c b/drivers/soc/sunxi/sunxi_sram.c
> index 2781a091a6a6..1853dcc806ea 100644
> --- a/drivers/soc/sunxi/sunxi_sram.c
> +++ b/drivers/soc/sunxi/sunxi_sram.c
> @@ -122,6 +122,8 @@ static int sunxi_sram_show(struct seq_file *s, void *data)
>  			continue;
>  
>  		sram_addr_p = of_get_address(sram_node, 0, NULL, NULL);
> +		if (!sram_addr_p)
> +			continue;
>  
>  		seq_printf(s, "sram@%08x\n",
>  			   be32_to_cpu(*sram_addr_p));
> @@ -134,6 +136,8 @@ static int sunxi_sram_show(struct seq_file *s, void *data)
>  
>  			section_addr_p = of_get_address(section_node, 0,
>  							NULL, NULL);
> +			if (!section_addr_p)
> +				continue;
>  
>  			seq_printf(s, "\tsection@%04x\t(%s)\n",
>  				   be32_to_cpu(*section_addr_p),

