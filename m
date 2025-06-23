Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C2572C190;
	Mon, 23 Jun 2025 20:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750711509; cv=none; b=Ig9AOYMd/ecqvtpcIjb8nbLyB+eexMYnyeRiv0aNOBAIBzBop5hXHPRTM3e+cbfCLXBEq7QEs//e5pjSpLYTIOIx9VYrZHVnzJnVF8dNA+FpGPFWoWCgvNFvSnkKrO4hXOJwD1ozNcFwD7+ETmlhEB/MmF1QZZoMA5r67gnGwQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750711509; c=relaxed/simple;
	bh=HM4nBtCjEW5T07SL73JE0DTffRz1i7oNCqAFbh8q1po=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OTAsRcU3Byqwt0X5EQiJ30wkBAXJW7PWpw8yydNEvueP8O68bMRb/brkmwmw4sNlUq7XaBk96Lh8rFrBTL2vZMuU00uDQfVQRGZ/psFAyW2UtAzvMZya9p/3rJkRULDtq2wp0LYgYIVdL4hwdaK53WF+IFrLvGNZBF450/lPs2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=hr/K2fV3; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="hr/K2fV3"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=SLZPXS/IE26y8M+Ci2YtALk0z/tBpuKi2GgJJhoHEx8=; b=hr/K2fV3U72Dh/p6RdDxoT/ehE
	AVGJLxzaRAF70VpRyq4i5gcBNiyHkvlYMANjLBpgwttFZdWAylmGgZC7Cm+Ul0oB9eGjfMvXTD5Ve
	K/lb5kN3yL8xyOHQwZpDb4NFQogQSMDSHx5B5csdfxZO2J2aGIHAU7ydiLV7lyxftiklLyXIzgDVv
	wmEpaUBb1JwRd+nXHiobv8RY3IlXMBfZHJnWXJr2GpX6lBu6vEN1HedZFk/Hyo+d10hNZMFpkPCqa
	oo5uHIVofuXLXhWv03KOEBB81U6ouFON2qr4njQu1rfU/BeCbdaCavDVMWVh5jl3CJNCv7O5X/yXI
	8u/qI1Hw==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTo2H-00000004YoT-2Vek;
	Mon, 23 Jun 2025 20:45:01 +0000
Message-ID: <9bcc6786-772f-4298-928f-34f3c6dc64d6@infradead.org>
Date: Mon, 23 Jun 2025 13:44:58 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] nvme: Fix incorrect variable in io cqes error message
To: Alok Tiwari <alok.a.tiwari@oracle.com>, linux-nvme@lists.infradead.org,
 kbusch@kernel.org, axboe@kernel.dk, hch@lst.de, sagi@grimberg.me,
 kch@nvidia.com, nilay@linux.ibm.com, corbet@lwn.net
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250623064036.4187788-2-alok.a.tiwari@oracle.com>
 <20250623064036.4187788-3-alok.a.tiwari@oracle.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250623064036.4187788-3-alok.a.tiwari@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/22/25 11:40 PM, Alok Tiwari wrote:
> Corrected the error log to print ctrl->io_cqes instead of
> incorrectly using ctrl->io_sqes for the io cqes size check.
> 
> Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  drivers/nvme/target/pci-epf.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/nvme/target/pci-epf.c b/drivers/nvme/target/pci-epf.c
> index a4295a5b8d280..44288d8f5aa11 100644
> --- a/drivers/nvme/target/pci-epf.c
> +++ b/drivers/nvme/target/pci-epf.c
> @@ -1860,7 +1860,7 @@ static int nvmet_pci_epf_enable_ctrl(struct nvmet_pci_epf_ctrl *ctrl)
>  	ctrl->io_cqes = 1UL << nvmet_cc_iocqes(ctrl->cc);
>  	if (ctrl->io_cqes < sizeof(struct nvme_completion)) {
>  		dev_err(ctrl->dev, "Unsupported I/O CQES %zu (need %zu)\n",
> -			ctrl->io_sqes, sizeof(struct nvme_completion));
> +			ctrl->io_cqes, sizeof(struct nvme_completion));
>  		goto err;
>  	}
>  

-- 
~Randy
