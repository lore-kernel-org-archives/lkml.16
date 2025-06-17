Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C891C28C00E
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 19:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750190244; cv=none; b=uf99yzIQyMhe0L+9zkLnMH6ycnPiWNDDGGlgb9BFvBz7bQBgWBQL4A3w2IKI+5/2T3+DtXO87v3E9I4o9FrkuGyQTUVrxuHoBGu0L0zl/YOkH5yFx7j6gJ9PCTt0aXy7LT3xsLlAZ/1qGWKtGTxXFnyyBZ99kLomNiB8c1OZlD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750190244; c=relaxed/simple;
	bh=g1hqr9LAd5tlBlXHUe2Abbj5LysvcxE3l71FgP8GPCs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IcsKYsaAUB9U1+rgJIuLARTUQWyv0FuRoYlSMDM5WBM3ex3Fak5tR8cIykft2lxjV/sO0oyjUHHZHRER1tUyGn2Mm4I4OJjjnVKCzgRVfbX1xIXGzwMdZ9qyfx8n/QA+pm6tb2zUL7o6oaO5TDtLqUzCYuW4Znmr220VdnoTg6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=ett0jDLE; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="ett0jDLE"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7d09a032914so547600785a.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 12:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1750190242; x=1750795042; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GSljJoj4v6CeDXJDozVd8y37KP8tPNu+Cmnc8/7K2EU=;
        b=ett0jDLEoebh+JyaQv+RJbvAuXymydoDvslAFmcZ6Z4dfurrqwxY3JeC1uQ3i1SOPt
         ph8UXl6D771R+SfQfflI+6p3EoDL8zJq1hfV/tn/e7AD0FzGVuyWE4f72YJt+YKMDQQj
         hsXyhtTxcd99QA2PUBp4kv+CHzGKeNhCdIHRpPqFydEQbsnW/BpP4yHrMLKTODHfGoYW
         8+Bc+Rf4948wdV/0bi221GMSuJKpKMLGTUB4rzPeJMJaHs5aXJXBmihiPn1q9o8MeSXh
         z21/ZZdKkfS2mpDdBS53ts3GuAn+zCodwtfNBvXnwpGeyg7BqwWckZyWeJr+H/nJreHp
         8Orw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750190242; x=1750795042;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GSljJoj4v6CeDXJDozVd8y37KP8tPNu+Cmnc8/7K2EU=;
        b=rPHxc+wyAz7hbTZtixL2TplWTg46ic5FE8FxZb9qwDHJp6cDnUI95DVRq+Eq2x1TYi
         7mZlQXaoy7qCR5wG3CQq9RXixWQYnqnIVmUzPuJNSq3ABRIbANybiT5wEh/HETnRFHbX
         JuV38WAZ82fXe/kyOgV3JPjStZzGcLlCx/vEiMwCkMQjq1i/sdtpuTWEhpY8p0CaIy+v
         LCwIWiHRu9TXpgZ7YhJY9vQEzZF+mvevyD8A1KB5ZnbaG2R1hbnUz6k/ws69ruOd6PQN
         DLQavrY+/zxjdHZ+NDSQvHeOG/kwc5qSJ93+Uqmd4HsYyyuwgmZ42B2RA7Kdv2RzhJ2Q
         Dhlw==
X-Forwarded-Encrypted: i=1; AJvYcCWi4BpY7pT06+mLLythgGb34vH38eFH9r6l3HSo5yUEJcI+lONiHQDwCX+I3te1oULBQcSTENMuoHpJh10=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIWUS1VXI2OQxIr/Al9aQHfPspz7RYYZZGGAlBnM9ukp4JYIuY
	HTWz1DyXLw8k7IzXK0LGuooJykO6oz0B3goJ5VWf0kfwjw+6/645tttgrVCO5absDIk=
X-Gm-Gg: ASbGncufkUrEbyKk2x/t++ngtQCSctQmq79E7NpfbXoKDgp5elFbwqMHuN/lr7R/Kd+
	lMPXDmx4nYSOjv8GIMOS3ZEOmUYEd+H4q7x6XxgsvP5+4Yqc8Z3EKcb8jOgZ40KefVLmvx5+/Tg
	CHTeOI6Gc3DgBCfqS6LoewBNChtKvhIlqS2HQoatmEG8csdf5aKZGAm/w+yw81+qvauwnxgiTHF
	dLUmTWsNY9W+zEkZnGtkWViQ+/BHEgVwJnU90JcvGCZtXNRCVjM/Xr1MQhE4fQS4HNZzCKMjYdo
	oI8I3Yp5YxdEgl3NMpPc1ttP9yIBxXGt/RlHxaZbESrLidLQTcb5HAZomPsTIuTdwK7XPjnq4es
	tVwEB+7zlMY+BCw1YP1D/eF5AwmKFfVI+cyszRg==
X-Google-Smtp-Source: AGHT+IHoE/CIYPSeBo9AkwYX6P5QyNezX929DkvT7AQbxP5vAuyPsD+eSrDU1SNqwDaclH2cAsl91Q==
X-Received: by 2002:ac8:5746:0:b0:494:f1e7:65ef with SMTP id d75a77b69052e-4a73c627abcmr231747311cf.44.1750190241701;
        Tue, 17 Jun 2025 12:57:21 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a72a4b0e93sm65849681cf.42.2025.06.17.12.57.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 12:57:21 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uRcQq-00000006ckX-2tam;
	Tue, 17 Jun 2025 16:57:20 -0300
Date: Tue, 17 Jun 2025 16:57:20 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Demi Marie Obenour <demiobenour@gmail.com>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Alyssa Ross <hi@alyssa.is>, virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
	iommu@lists.linux.dev, x86@kernel.org,
	Spectrum OS Development <devel@spectrum-os.org>
Subject: Re: Virtio-IOMMU interrupt remapping design
Message-ID: <20250617195720.GI1376515@ziepe.ca>
References: <>
 <a65d955c-192b-4e79-ab11-8e2af78b62af@gmail.com>
 <20250616132031.GB1354058@ziepe.ca>
 <20250617154331-mutt-send-email-mst@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250617154331-mutt-send-email-mst@kernel.org>

On Tue, Jun 17, 2025 at 03:44:20PM -0400, Michael S. Tsirkin wrote:
> On Mon, Jun 16, 2025 at 10:20:31AM -0300, Jason Gunthorpe wrote:
> > On Sun, Jun 15, 2025 at 02:47:15PM -0400, Demi Marie Obenour wrote:
> > 
> > > Is a paravirtualized IOMMU with interrupt remapping something that makes
> > > sense?
> > 
> > IMHO linking interrupt remapping to the iommu is a poor design,
> > interrupt routing belongs in the irq subsystem, not in the iommu.
> > 
> > The fact AMD and Intel both coupled their interrupt routing to their
> > iommu hardware is just a weird design decision. ARM didn't do this,
> > for instance.
> 
> why does it matter in which device it resides?

It would cleanup the boot process if the IRQ components were available
at the same time as the IRQ drivers instead of much later when the
iommu gets plugged in.

> Way I see it, there is little reason to remap interrupts without
> also using an iommu, so why not a single device.  what did I miss?

Remapping interrupts can be understood to be virtualizing the MSI
addr/data pair space so that the CPU controls where the interrupt goes
though its internal tables not the device through the addr/data.

On x86 you also need to use remapping to exceed the max CPU count that
can be encoded in the MSI, no iommu required to need this.

There is also some stuff related to IMS that could get improved here.

You don't need an iommu to enjoy those benefits.

Jason
