Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CD19265CC5
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 17:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745429483; cv=none; b=qlvakCVKsxy/Iu8Ha1dx4VVE6FVqIq2ZD/ogwh1/pYB+ScszA1O0AFCr0y01YDwxOiaHEojzewWhlEe4vV7iZoA0eKDruKoCoMvSUuFbttOGnRERvwRtLUKOZGsBKeuEBVnGRKuk5DkRWJ36UbaeZZBhYlAP6VFloyOH/G5p1Ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745429483; c=relaxed/simple;
	bh=kgi4ELr8mCdAm9+XhEH6VRz6G3+ojfBNAMxT3w5HoSg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F+DecuQ8JwGYjhcXeArkgjH7XfPfyL6L3++GsgawYKQuA3z1fcQGUDKQTEnQtfUtoFXbfRx/MoGDA5yfdwYZ0UCp0xURBpVe80kDzyhV3yoPT+FPig2nHjdP1zYfAovgH7VAbjk9/HJVy3XsV7dzUcU8Fs2NOZ7FPraWa6ALaiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hKnQ54A5; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hKnQ54A5"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-225df540edcso14055475ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 10:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745429481; x=1746034281; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GkDmVE1oQubncGA13yoyJE0TwJhGavatFFU357EXcEc=;
        b=hKnQ54A54OH01v/NWH8UIDkJ38bvfjB2A/mwBI3uytCUu9Gxp2I7TdQ11SLHYWMJQG
         zTl18GT6Bm3tRyxmQawp0/e4oohop1JRXMvTvJlj/962IgPlx8VzfY0xDonBwQp+Kb1z
         +U7Q3Y87ys1QZ8+DPo7ORe7h7ccWuRHHRaijrl9IRKRiuX3Ok/l2j2caDetVylCL+t1A
         yoieaOiQLdJg5qS0u2O5kqXmsHFXZnxRIsfNcdQsw4vtG5Pao/Xz5o/lD4AvE9we7lhi
         D2wW8e7SUPwXbRzUmSpqNJ1sGNXPlb8dnIP6Z1rGQ+3YMINN/ZkXY6SROA5MF9jrMOfR
         aBDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745429481; x=1746034281;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GkDmVE1oQubncGA13yoyJE0TwJhGavatFFU357EXcEc=;
        b=SxKWdMinbEU5X9N1TW/14BVIvoWHPyKEs3SCan6ppfcA3udpktUuGfZY2GnoZTAB8q
         OWfpgoUV9vBouiRDsX0QnYQF+wJl7TIPrCJJTvRwpERtRG+ekeaQexuc47MRtgx1ZWiT
         1X9ioIIIVuhtDvwmTAKA42uuz92GsASTGHH0VNt7btcTR+4BRo8R7igv/Tw1UIy7oFpz
         MLAE8oCubt/LbPc8R2Oxn0G+llRWt6Dvb6NJN+6mIAHUlfjEetLQ2w0lfbpOgSU+AGNk
         qcKqQ3mZVkbDXapAoLz4bfjCXein+y0ETQ6UoOu1wHsn1pfXgY1uaclXyZ2iiq9NduXj
         3nQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOEBeqClWFjjygXU8Tqz+TCNnfrkG+lE2bkX2ZCkWLJWeDNrdZqa+Y1KO6lfh4hFIvtRcAZH0JSJWwRlM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxuLlucm/4DFcgGpSZCGPRkzYu7OZeLvARcfCr/KqVxpexmaQkJ
	5tiaqd+ra94DfIyI3f8BFUP2aI8MVu2U7AKJ2R9du80Yih8bMKNuCCajIkd44A==
X-Gm-Gg: ASbGncuKQXQoXbs8kXis6W0IxG75G0za9D6nDBX4ki7SXTBHkCmxjfmhWs+cP+/AQND
	E/aRPj+VyWjiu+xNMFjZJdlipnzNdoZ7b55Kccsl6MFz82UH8nqolmaoUixx93s0fAD+bmkcPMX
	zRXD0JynvY4CN8jSBsb7yN7szZgbeMjsAa9NOHuqAK/Gigv1TRhugIagU+WDzZKrhUVRo5V+hpR
	I/cM4WR8ECtHRJ+RJBAKEzAPXYygtYwYhgEAAMxp7Z+fCJuZhk9klr/lNcStMpL48oxR3wpufj+
	l/GZ7JLoosw6zMJptH2IWHrQ2iN2rHsO9pcVsdv0H1s8cIt/HM8Itha+Q1aw9IZ6X5S2OzK5dNt
	2Es5nBw==
X-Google-Smtp-Source: AGHT+IHJNQTbOTf5T97irPUNv+QmXLRPjJqv5JLklJLGHSWfRRkbgYAKpGomh75s0qhLStfcG3G05g==
X-Received: by 2002:a17:903:3bce:b0:223:3394:3a2e with SMTP id d9443c01a7336-22db2189d23mr394125ad.18.1745429480637;
        Wed, 23 Apr 2025 10:31:20 -0700 (PDT)
Received: from google.com (7.104.168.34.bc.googleusercontent.com. [34.168.104.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50eb4292sm107648765ad.150.2025.04.23.10.31.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 10:31:20 -0700 (PDT)
Date: Wed, 23 Apr 2025 10:31:16 -0700
From: William McVicker <willmcvicker@google.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
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
Message-ID: <aAkj5P1I-e9lylIU@google.com>
References: <cover.1740753261.git.robin.murphy@arm.com>
 <e3b191e6fd6ca9a1e84c5e5e40044faf97abb874.1740753261.git.robin.murphy@arm.com>
 <aAa2Zx86yUfayPSG@google.com>
 <20250422190036.GA1213339@ziepe.ca>
 <aAgQUMbsf0ADRRNc@google.com>
 <20250422234153.GD1213339@ziepe.ca>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250422234153.GD1213339@ziepe.ca>

On 04/22/2025, Jason Gunthorpe wrote:
> On Tue, Apr 22, 2025 at 02:55:28PM -0700, William McVicker wrote:
> 
> > On this note, I was looking through `of_dma_configure_id()` and am also
> > wondering if we may hit other race conditions if the device is still being
> > probed and the dma properties (like the coherent dma mask) haven't been fully
> > populated? Just checking if the driver is bound, doesn't seem like enough to
> > start configuring the DMA when async probing can happen.
> 
> I think the reasoning at work here is that the plugin path for a
> struct device should synchronously setup the iommu.
> 
> There is enough locking there that the iommu code won't allow the
> device plugin to continue until the iommu is fully setup under the
> global lock.
> 
> The trick of using dev->driver is only a way to tell if this function
> is being called from the driver plugin path just before starting the
> driver, or from the iommu code just before configuring the iommu.
> 
> Given that explanation can you see issues with of_dma_configure_id() ?
> 
> Jason

I think the only concern is when a driver calls dma_set_mask_and_coherent() in
it's probe function. If we can handle that case in an asynchrounous manner,
then I think we are good.

Thanks,
Will
