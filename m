Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F6C7273D93
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 13:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751375122; cv=none; b=th0svjKcDu4mlpbtFMo5pPf/myLEsNeg9DU7edlkSxe3o0EUX7CvJljX+zA4ArMfa4xRNDJTfaN7Q9lLrjAsz13IbjJUYNZc5Hbw7TRmPC8SIP5Hwa5gekOP9KejyS6bwlEztswAfEH55OFVRAq3YELf3mLtYmJot7wq+Q689ZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751375122; c=relaxed/simple;
	bh=jFvD1ZrKqKPn4xo4zK1Zi3MX9OLA3KyQqmOz21pWQTk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cZ0BssAPuWrlWM793EMsz/hlBMys9WShtpHmJ3TRL3064Q19tLul9skN80655rwwWPo6lnX7oJD+EIDniol4U0zQ5StTP5kxsABS+ZP7SIyL5tNXNcEWNO/9tUxSjMm0ute20MfKQWRbczplzgfP6AmaKlm9L3K+NNB+/GoV0xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PmeHa8dx; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PmeHa8dx"
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-2c6ed7efb1dso2415289fac.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 06:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751375119; x=1751979919; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1TWX8rTsCZMwR7J7QVpBk+kp2Qgls/iNpOzUF5Kdzek=;
        b=PmeHa8dx9QxTIB8157wvVlAFB+n3gyQwq61dHzacWyo8czqdvviUGXGqGVOCBjiIis
         lECQPB5MUL+PdZ+ArTpkqYtylFp/qMgtDo65Lsnh9CG+4MziVenXsQW2kIQ1Dtmc4QWC
         vQ/MJPuKhjXb4JUm5oqFa5IxIZ+z6I1H2RAPvbAtJCew/RjLI2aBA6+YKpmT/DfmjC1d
         UKqM+Q5k7XcbQ3FeyDVy3N/+DCp6WyYVl7UaFdsUnZQKvFt/tXk24nqRO41ApGRuNt1I
         etg+j0B5hf1DywAjShxEoK/u1LDpca7/gAj4rsSul4+ZekeHNJAEIUkOwSV0u5oFJgt2
         YlUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751375119; x=1751979919;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1TWX8rTsCZMwR7J7QVpBk+kp2Qgls/iNpOzUF5Kdzek=;
        b=b6Wq+xcIeiFyihTFgmWQ9cUqnRuBNYZF1XwQpFhZQ3bvR4iXPFC033O+IpJhCVdkzq
         1iKDHtsM4IwlzfoeMu8HLOU3yzYHvJ/t3FSIfWXYn8Q8DY1DPLfnm+eOmJAVxlxGNafp
         7//GzZk9OYgqYdhpDrugdCeT0OGH6YJa6x8tz16MxbBDOb9j9ijzbHzSLc9N6SCZssiL
         uCRSTS+i2KuDqFe/HzsQryw3aIJd/s1ExeURyHqJwTCGinIgIGPht2q/ZaPLzAeV3fqe
         7p/+XJBD1khSmgHI4ZWo/PbzpiGOc0kkkfPRhgCJGJbjDvWGAiGabIQ93HzdWhklXrlk
         +0Yw==
X-Forwarded-Encrypted: i=1; AJvYcCU9Vrfd0Xb/Gj0wdgHdPL+pQHCPujEDgSXZVOdHGgR59H4K87PIPcZme/MoZ9jvsD1jlRGbyYwCyd6AAwA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx13EWR55KoEp7+QeCApELg/LOFJm/aLcQo0oWIrw+uaR5BfpMZ
	m10+zrS9qu8XF1IzWlex2KYyM08iySfx9ivMpWxGMKtxPKajIaPL6GvDI2M4b0CCg6qVVgGTLje
	tqRItrpm2XAanxLoqPTdQcspU2+dyECyN5d+7Avcy
X-Gm-Gg: ASbGncuOmMGQR3Cn5+2xYYqAMIwosY4a2BMSl6y0R7Xp8wjA8ZMgDNd50mI7QLVynch
	V7qdyGlmpqE4R/bEd82UEo2DWe1lQyN3XN8jU9u0GOfTXviPA0vqCNW3n1PBKMSw6eCOgPosACW
	YwJI8f5GNOssiZx5A8YRGzYeo5HnWbJMEiGDLd1uM8
X-Google-Smtp-Source: AGHT+IGFPwC9D7ECA270DEQ7V6Lz7pqeKr+PsMPIMsAOBbe6/HXkq3nYn8ORiGwcf/0z2ZOafHpxuFP09EI+CVKrlh8=
X-Received: by 2002:a05:6871:6c07:b0:2c2:174b:c829 with SMTP id
 586e51a60fabf-2efed4ff09cmr12077120fac.15.1751375117445; Tue, 01 Jul 2025
 06:05:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAL0q8a6pOBZbWYdwKzC1U-PuH4rgf2miv0jcF=fWVZt_dUZHmw@mail.gmail.com>
 <20250630133343.GA26040@lst.de> <aGLyswGYD6Zai_sI@kbusch-mbp>
In-Reply-To: <aGLyswGYD6Zai_sI@kbusch-mbp>
From: Ben Copeland <ben.copeland@linaro.org>
Date: Tue, 1 Jul 2025 14:05:04 +0100
X-Gm-Features: Ac12FXxPwbXsIZXwCl1ZRik9WUZfYk8dZINVCxusvm1y0dN6VUD7U0a8B3GvEuQ
Message-ID: <CAL0q8a7acv-9N1XUmJ9LAojdhm947eiira6Kx0tew-VVVCY6kg@mail.gmail.com>
Subject: Re: next-20250627: IOMMU DMA warning during NVMe I/O completion after 06cae0e3f61c
To: Keith Busch <kbusch@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, linux-kernel@vger.kernel.org, lkft-triage@lists.linaro.org, 
	regressions@lists.linux.dev, linux-nvme@lists.infradead.org, 
	Dan Carpenter <dan.carpenter@linaro.org>, axboe@kernel.dk, sagi@grimberg.me, 
	iommu@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, 30 Jun 2025 at 21:25, Keith Busch <kbusch@kernel.org> wrote:
>
> On Mon, Jun 30, 2025 at 03:33:43PM +0200, Christoph Hellwig wrote:
> > Hi Ben,
> >
> > > [   32.857521] iommu_dma_unmap_page+0xc4/0xe8 (P)
> >
> > Can you resolve this to a source location for me. i.e.
> >
> > gdb vmlinux
> >
> > l *(iommu_dma_unmap_page+0xc4)
> >
> > Also what IOMMU driver is this device using?  It looks like it
> > might not support a 4k IOMMU page size.
>
> I think the PRP handling is broken. At the very least, handling the last
> element is wrong if it appears at the end of the list, so I think we
> need something like this:
>
> ---
> --- a/drivers/nvme/host/pci.c
> +++ b/drivers/nvme/host/pci.c
> @@ -701,7 +701,7 @@ static void nvme_free_prps(struct request *req)
>         prp_list = iod->descriptors[desc];
>         do {
>                 dma_unmap_page(dma_dev, dma_addr, dma_len, dir);
> -               if (i == NVME_CTRL_PAGE_SIZE >> 3) {
> +               if (i == NVME_CTRL_PAGE_SIZE >> 3 && length > NVME_CTRL_PAGE_SIZE) {
>                         prp_list = iod->descriptors[++desc];
>                         i = 0;
>                 }
> --
>
> But even that, the PRP setup doesn't match the teardown. We're calling
> dma_map_page() on each PRP even if consecutive PRP's came from the same
> dma mapping segment. So even if it had been coalesced, but if the device
> doesn't support SGLs, then it would use the prp unmap path.

Even though SGLs are not supported, I gave you the patch a spin and
saw the same stack traces.

>
> Ben, can you check if your device supports sgl?
>
>   # nvme id-ctrl /dev/nvme0 | grep sgl

sgl is not supported by the drive.. Here was my output:

---
sgls      : 0




Ben
