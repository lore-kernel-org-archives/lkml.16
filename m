Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8DAA2D8393
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 17:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751651669; cv=none; b=a+DpuxH4WZGlcZLVTokfdUgMNyseC3N4A+ecraOfoViket1UnOaIZN0rzG3TN8Ym1dYxNXK6sssE2nIsF8mk+69tqQKtGFKQyHZt66werOKA/3Lhu+ViNYOCP9UWbOGvdkfE3TheVEcgP19UWXfTcr462GXxTb4/My70ZrTw1wA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751651669; c=relaxed/simple;
	bh=qTNc7+1p4sx/z+Ihm4/J09j0G//xpF1WUSAnIfFyOOI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ngoI/H/E8EHcSvdAS56HaUaZ3jN/0h/++TMurozW5xiy9H8sz3KfEEun1utnyh0uUGdJ1Msei+ZTCyvNm2LOf+hPa+YCdTunBLx3oc9tnCQJpZon0heTnlFruxTCFOKfody2JUe25Gu1WSbQNHTXz/TNbYbXNVf75YpXS/RDs/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=Hy5unYwn; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="Hy5unYwn"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3122a63201bso973423a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 10:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1751651667; x=1752256467; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XuxUGCJzgBIyontDTdqwJrs5j4TnI5gqZ41JcRqn9+o=;
        b=Hy5unYwnQWeHvclqGWWZmlYVO6t+KVcSFgHvukAUZ8tsgk/4vTQ9COQ5UuGMNYID4l
         HwovZvBbnI+XBTiEGO3F2ook5wLpIh0hA4P9YjCIE5Wqvv5kxlaM42548iO7exc57NNj
         YOFmgIZP4XWrTV2bntXgkakHhuQEa0C6Z2+nftrl+XR6VUuadw0zQx1bAQ82mFwE10fr
         27jxkATY2Ds0jGY4FsISrgsfw3OyvsyAQ3O8VkmEugbNeJORrSR/3Evbv6xm4WNpSoWc
         AeXRX/rMaCKJGAy90Byg3U/1lRyQtvrOa5p3RJWre+iPkYPZVt2gO7B3i3MffOltvKXe
         rRcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751651667; x=1752256467;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XuxUGCJzgBIyontDTdqwJrs5j4TnI5gqZ41JcRqn9+o=;
        b=v4meRSO0lH6NPMN4wPOUx74ClWckk8ja7vDK+gFGSaz0F8WeO5rb18ODOxt65G1389
         ba8lfqzq7qQWv9/GPOLjmOQQYtv4ubVS8kMjDLZBdxPhgGgqVHS5FZTMxZnhdl7owT3L
         WoAf+z/7i6pYmxstmVZtcIeRI3aJRtX2SWrHxDo4lApiSOlW4ae/nyU4RuwqpD2CWTTp
         y7wtLxASapS/XvX8OIX314kbZBLX/WCtBzxMcnRDBwbda7yhPRRHSiDCfue7ZWEBRoQG
         w5byGjgjF9z/OWML8wG9fG27TTQzeFFG6cSCHpHkn7oPfflnYpQTt0SMVsLz0SKZ3v4a
         wPBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUaVyisaBJEpQgqbU//7X/FeJaGdO2ODFNl2axiRgWRzbighlfO4CceLxHEfngPv2VvzMsDE2eS+VeckII=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMYa2tYNuMSrj7/Xbw5YbOnHhO7/Esoc5YxELc62wE+FdVEACE
	enemujsJ2AVg8MMXZf9fpeG6MC+xcYT/hVjSHuP241lx4VwmWHB7fNJjiscvwBuEO6M=
X-Gm-Gg: ASbGncu6+S4/NW860C9ZSUVVt3PyyvDSZOWQHDzTpVYWOxW0Cl6KW1RDA0QZFHQ1MLG
	mcM7EuMu5jUmyMvoLSNYkDbqlTgEj3KHV1K7w3H5mvchV/ZE5MHReD4fDBdoMfU3LtBLCcvqhxX
	vDo5s4JRe/2tpabkUOvkN80C+LyXooALv2/WIrH3fsUaYLzYw6eWPfQ9+4/NhqCx/lV9HXTELK0
	Bk2N8uj+aU3ugzXq1Dh+s20TaFLRd66xBpk4FK24PzZONkNCQ9qj204SsG9Bqt0gR38LhEotw1N
	dp3G9126SxS3TNOFR12dvRe1iplEj4ArXroc
X-Google-Smtp-Source: AGHT+IEh1aJoFY/nLlH7wiffnloJQKoRXxbF/IF6yLU1DedrCGkd2rfvxrkg/X7+7Uo3KEx9efT39g==
X-Received: by 2002:a17:90a:dfcc:b0:313:1e9d:404b with SMTP id 98e67ed59e1d1-31aadcf8e2bmr4389360a91.2.1751651667045;
        Fri, 04 Jul 2025 10:54:27 -0700 (PDT)
Received: from ziepe.ca ([130.41.10.202])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31aaae4095asm2682225a91.8.2025.07.04.10.54.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 10:54:26 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uXkcD-00000005zua-0liE;
	Fri, 04 Jul 2025 14:54:25 -0300
Date: Fri, 4 Jul 2025 14:54:25 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de,
	nicolas.dufresne@collabora.com, iommu@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v4 3/5] iommu: Add verisilicon IOMMU driver
Message-ID: <20250704175425.GM904431@ziepe.ca>
References: <20250623153931.158765-1-benjamin.gaignard@collabora.com>
 <20250623153931.158765-4-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250623153931.158765-4-benjamin.gaignard@collabora.com>

On Mon, Jun 23, 2025 at 05:39:27PM +0200, Benjamin Gaignard wrote:
> The Verisilicon IOMMU hardware block can be found in combination
> with Verisilicon hardware video codecs (encoders or decoders) on
> different SoCs.
> Enable it will allow us to use non contiguous memory allocators
> for Verisilicon video codecs.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
> change in version 4:
> - Kconfig dependencies
> - Fix the remarks done by Jason and Robin: locking, clocks, macros
>   probing, pm_runtime, atomic allocation.

It broadly seems OK to me

Though I did notice this:

> +static struct iommu_domain *vsi_iommu_domain_alloc_paging(struct device *dev)
> +{
> +	struct vsi_iommu *iommu = dev_iommu_priv_get(dev);
> +	struct vsi_iommu_domain *vsi_domain;
> +
> +	vsi_domain = kzalloc(sizeof(*vsi_domain), GFP_KERNEL);
> +	if (!vsi_domain)
> +		return NULL;
> +
> +	vsi_domain->iommu = iommu;

So we store the iommu in the domain? And use the iommu->lock all over
the place

> +static int vsi_iommu_attach_device(struct iommu_domain *domain,
> +				   struct device *dev)
> +{
> +	struct vsi_iommu *iommu = dev_iommu_priv_get(dev);
> +	struct vsi_iommu_domain *vsi_domain = to_vsi_domain(domain);
> +	unsigned long flags;
> +	int ret = 0;
> +
> +	ret = pm_runtime_resume_and_get(iommu->dev);
> +	if (ret < 0)
> +		return ret;
> +
> +	spin_lock_irqsave(&iommu->lock, flags);
> +	/* iommu already attached */
> +	if (iommu->domain == domain)
> +		goto unlock;

But here we don't check that the domain matches the iommu of dev.

This seems a bit weird to me, I didn't quite get why the domain uses
iommu->lock instead of just having its own per-domain lock?

But if it does use iommu->lock then this does need to prevent using
domains with the wrong iommu because the also use the wrong lock and
then this:

> +
> +	vsi_iommu_enable(iommu, domain);
> +	list_add_tail(&iommu->node, &vsi_domain->iommus);

Is not safe?

Jason
