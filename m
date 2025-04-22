Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAEA41A5B86
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 19:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745348440; cv=none; b=XRpWiqIXpUDMUkVBc5IyrpXZia09cKapeNBOY/KuuPf3Ass+297NoZSrNQ5CEsIrEZSKF61rJ8f89dbevYekBrqSo98IQg+TmZmBwtvuXJuNC04wy2NJB2biZwexEE0q08MOQ0IN/slCEhQ0a1mYGr5o3Nc8dnVpTzqPyVfSZE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745348440; c=relaxed/simple;
	bh=4QLSLmrkPbs1yBBussuVmcH9d86k1ZJ8t0dZp5NXcyc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oorc+cMnhwa3luzoU3l6YdXK0JvUDJ+eFMJmp7lnL436oW/c4sD9sx3cC9aU/IW2OJnpixK8dgXpIAP8SeiZawjGnZre8OEdIFe7uZ29KjHV2UZY/zNxjNIX4Y1x/lq3fpHQP3Q7gVtPOqezBHbIqWBwPwaTo5YLcMVG1pj89/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=JY8owS40; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="JY8owS40"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6e8fce04655so51895486d6.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 12:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1745348437; x=1745953237; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TMh0izLSzqmAU5ORZxGehcX6J35ZOvbIe3zUy9tlNbQ=;
        b=JY8owS40K0jtYFjGrIcxtLhyDsimWfnz3h5yTgIVzRuElVJmlJtejUKPgbU/d59FzH
         MSC5YMdutpF5U5TrzKTZ4tEEAnoX31AJvZJi9BcoxUsjNBlsZwT/XLGs3PQdnqSRtbSf
         Tz9+BEKtRg033DJQzjJWU6M0t+3S6Csle0omxMsJXQxtBB9Nl+cJ0kA9OPbLljaBYiO6
         1BEiewxh8X5Cad7DJj/PMq7mXBGxiWqpmD+Yktr5aKLE94WyqP9nRUuvDv7TL8h5L8Bg
         b68MuACOKY5ZBE28Tnzo6CdslZSUTJKarqMcGjp55aEhLW6I6THokC/tX36ovO0y4Wif
         8w5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745348437; x=1745953237;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TMh0izLSzqmAU5ORZxGehcX6J35ZOvbIe3zUy9tlNbQ=;
        b=iWYIlWyi7HDre0QdvikPPkTfGkcviV7yGNnU+1p5AZcjTNCdqLRP2pz7hJcTihxLbm
         29DbNtjQXJx34X4AGxyGRAq7AvtXvE+iDbYY6riQ7DFoLrKqIeQ3N09jKkI4s+57koWi
         NuD3zKPCMOW5zTazBv7oit7t+MIgKsKP7cI7Ypa4jmPIAaH+mAdztDcg9wQd+W20Gair
         iXrwQnDDSUgQNearecEqwjUdmUXvQEi+lwPE9SvboYWyykZW3O+A7HdorE3T+F33hHlL
         ibsvBh3rcrKAjLWKqc8i8vjfYMpkZOGuupMxt/Vl4LgNDKx0frihOGSzAva1PHwAWbtx
         5VJA==
X-Forwarded-Encrypted: i=1; AJvYcCWon6k/q038goCqeA2aqWzxXHHM+ji3nXZmNXDDwpt5f/kEdjYmCTDWMEZM5RjimfrWYq/phnp9JzAbfhs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTpPGLPPPqhY7EJpBG9HMrnucgKo+HF1PlMe4mbrPAUHjH1PFG
	ztnVTbUOOrmc50AXFDs/f+eQxy3bcJX4bGTrWX4KLP0joUKqT6YwV9YJtEO5dXA=
X-Gm-Gg: ASbGncsAebmhiT30f5L+5ISiRTl6hx35FxpYC2aKslK4KPGWekEz/hrSGKS4ufg31o6
	ZkoCLjbVeQLqyAjZuLX0A1aPjVzB4j74LAhJdJJCV/nvGCcfT4badLi2kJi3JE5NBW6HcNTYij5
	rT6DmrPkInRpzFVgtgj38Zq7ZXSDFqItRiev+MPCm2Q2RWfUAE99xrIXhW/OcoAv8XGHfIjUMIL
	h5uby2U4F9O8cAsQ5eK1fx1JX/L6HrSqvidUitJ10AxMroV2aWU1HESanbyka7Mf3n3XZXsyRFV
	hhC6kZkCKbp1kEfhMss5zapMTf8sO5s1WI7t63BZ6MWlqdjeGFnBEBPRj3mYlvPiapz6qNyApZ8
	AOyEzefP7SsqpHq5KSA8=
X-Google-Smtp-Source: AGHT+IHbq+pHzTQuxxdUufVp0+5UWeEWnmEdvfzQVGDaZiAVyxBLUWwXVLbiir8zvtHTZQ/owxmlMQ==
X-Received: by 2002:a05:6214:3008:b0:6ea:d361:a4ca with SMTP id 6a1803df08f44-6f2c46557e7mr318335806d6.32.1745348437625;
        Tue, 22 Apr 2025 12:00:37 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-219-86.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.219.86])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f2c2c21da6sm60863536d6.98.2025.04.22.12.00.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 12:00:36 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1u7IrE-00000006vVF-1Cvg;
	Tue, 22 Apr 2025 16:00:36 -0300
Date: Tue, 22 Apr 2025 16:00:36 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: William McVicker <willmcvicker@google.com>
Cc: Robin Murphy <robin.murphy@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Russell King <linux@armlinux.org.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Stuart Yoder <stuyoder@gmail.com>,
	Laurentiu Tudor <laurentiu.tudor@nxp.com>,
	Nipun Gupta <nipun.gupta@amd.com>,
	Nikhil Agarwal <nikhil.agarwal@amd.com>,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Bjorn Helgaas <bhelgaas@google.com>, linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org,
	Charan Teja Kalla <quic_charante@quicinc.com>
Subject: Re: [PATCH v2 4/4] iommu: Get DT/ACPI parsing into the proper probe
 path
Message-ID: <20250422190036.GA1213339@ziepe.ca>
References: <cover.1740753261.git.robin.murphy@arm.com>
 <e3b191e6fd6ca9a1e84c5e5e40044faf97abb874.1740753261.git.robin.murphy@arm.com>
 <aAa2Zx86yUfayPSG@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aAa2Zx86yUfayPSG@google.com>

On Mon, Apr 21, 2025 at 02:19:35PM -0700, William McVicker wrote:
> diff --git a/drivers/base/platform.c b/drivers/base/platform.c
> index 1813cfd0c4bd..6d124447545c 100644
> --- a/drivers/base/platform.c
> +++ b/drivers/base/platform.c
> @@ -1440,8 +1440,8 @@ static void platform_shutdown(struct device *_dev)
>  
>  static int platform_dma_configure(struct device *dev)
>  {
> -       struct platform_driver *drv = to_platform_driver(dev->driver);
>         struct fwnode_handle *fwnode = dev_fwnode(dev);
> +       struct platform_driver *drv;
>         enum dev_dma_attr attr;
>         int ret = 0;
>  
> @@ -1451,8 +1451,12 @@ static int platform_dma_configure(struct device *dev)
>                 attr = acpi_get_dma_attr(to_acpi_device_node(fwnode));
>                 ret = acpi_dma_configure(dev, attr);
>         }
> -       /* @drv may not be valid when we're called from the IOMMU layer */
> -       if (ret || !dev->driver || drv->driver_managed_dma)
> +       /* @dev->driver may not be valid when we're called from the IOMMU layer */
> +       if (ret || !dev->driver)
> +               return ret;
> +
> +       drv = to_platform_driver(dev->driver);
> +       if (drv->driver_managed_dma)
>                 return ret;
>  
>         ret = iommu_device_use_default_domain(dev);

The diagnosis looks right to me, but pedantically I think it should
have a READ_ONCE():

struct driver *drv = READ_ONCE(dev->driver);

And then never touch dev->driver again in the function.

Send a proper patch?

Jason
