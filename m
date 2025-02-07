Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE93B1A5B9D
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 19:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738957272; cv=none; b=V5ev9nU+gh6LLzUwDt9+783rca/dm+8cePvmgW71u9fEa3THXo6MOm/lM4mdKrxHInKQNMLkHoUHBw0XGxHCSuBf8Wmprq+S7YDo9nKLHIEjNOL3gsrMOmEIHoKeM/mVfeIi7U8oU0it+uT+2+WlZWYkvMc2wX5EAUCI5diJB1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738957272; c=relaxed/simple;
	bh=hY6Zloh4mg7ZCNsjbeJ0HY1B9qv651w6ooNCAsuy9XI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g8PfjQQ/jzxtdq74aItnMAebcHXnG5/ERG9reBmSLOFt0pj49fejEdXy4a8YwZdtZ1Oq+AP9U8kBumaLKmeoeNuULl74FcblwdiqsZVcNnRgdf4AiRquHHiWisv0HIBdD5PTiuvxQMBR8+0tpQnqHKQoKKXvYeixEn1BOGNAvA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=SumRsikh; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="SumRsikh"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6e44af3dacbso9806046d6.2
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 11:41:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1738957269; x=1739562069; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=a4oAel342nYv5nBJe0AwxOmOsZherwYKX7ofeLtPQ0c=;
        b=SumRsikhI0AhtJmT+/ynpcaDr4MxquUujj0Z58+BysgwZy5/gQTy/yQJrLmc89hkl8
         JU2mO/402QKY8zBx1YzOZs/I/TA0CiNR0FPrXn4FcobOuhGrTCs2b1qMU9jbt8P5L2y3
         14qKVGQnt65GDvm153a2DctQGRQ1uTls4UGmSfrmah1ET2S2d7MaJcVYF19J+Olhhlnd
         6KGjrNhbp30urdjBEJKZ0bTZx2+2yy6Re+u7tIrNZ5PUJLGOPRSy1NbMTOuTS6fGiwYx
         q330Nw6QkuxEGd6Wm3IcXlHVDpUKzZk+kFHzT7SfAVvei9UJPaBOKp+v9CNSuJNpHhOD
         kPLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738957269; x=1739562069;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a4oAel342nYv5nBJe0AwxOmOsZherwYKX7ofeLtPQ0c=;
        b=CjEfGjezBvkHwnK9b06d2KtZVJWwyS6/G9a9nQB0QbMSajcMIZB/SoFrPaRtgRfakx
         vx70Wwuf1eZWLDyTM+8xxywBBI4cTD9I9NTnwjpK3MO3VpCQIAGaGmRHb8oLZvA5TjlA
         qkLkx3YtswYhU/mzw8QHi6YYaiNvKEudl+L6FLPjuwuI5I2BR+D4Hwb0E76au86jIcNh
         qrR3TITSkpqNw0WP1DQBrhzXFEGURYYFzTZ2bRdOk//AcRtgwC66Li4HmV8EdX1RPIbl
         nNdkFCzCAdMEcplHLRKb1h5aH0/aUbR3+kN3sAYd7UxqYp6s1tcP3JH+iPslMVHt0KXi
         f41A==
X-Forwarded-Encrypted: i=1; AJvYcCVOwNQnSZqg+JG6zW8xdggCoBVVWBKMCX8MGv0oQLYA+RjTyrUD3ygyCXUgRsuiwofjOTQBt7hXKWtvU40=@vger.kernel.org
X-Gm-Message-State: AOJu0YzkfbULxKPWxmhNYMKSMh1ZgGAZa9jAg2YI3YP3tHjq/iLct8UP
	EJQWDvDfKvD9ADUKbP7+tMmKcQq1pZkZ4ypZSJVS7+6Orb3Pme2b4PQZQLjgOhA=
X-Gm-Gg: ASbGncta5XXXU7Ks2/RH8pRLE0oSnZWvfh9m6GDoS+PXgCxM5TAqIkRTLhIgvanxhgj
	r50nUwg/2S5dHrVxjngRucevY/bnoZdUkDMbpUglK1CJefBfhnJuo3Pk2e/41oO8qJK5LOeoL52
	439q1Afh2k853OurzS2RSdSaBdBk3NIbfLdDkVAgIIIo8pbzcx7NzvAg1h68mimKCO1RiA0SDhR
	Eui29/Vn5kUwIfMxQ1ZgGnzsMaE9LGEJ+mrORLMLOAXac/WZYswQJslVdf5hALb4vxeC8+TTYWJ
	RBnLpS8Fz9d9MuDCfqZOEANZBRPkkDKpW7RaOF15paXPIIbiLzZVlmJj2opEhi9R3TmQKREf0Q=
	=
X-Google-Smtp-Source: AGHT+IHaxpZee3sCSGfBDBfxwHempye2pj5zZfAfTlfZq36QNyZhbhDUkJdEyf8Z1mLKSaGiyhRixA==
X-Received: by 2002:ad4:576b:0:b0:6d4:3593:2def with SMTP id 6a1803df08f44-6e4455c246fmr61051826d6.5.1738957268471;
        Fri, 07 Feb 2025 11:41:08 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-56-208.washdc.fios.verizon.net. [173.79.56.208])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e445621334sm12230366d6.64.2025.02.07.11.41.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 11:41:07 -0800 (PST)
Date: Fri, 7 Feb 2025 14:41:05 -0500
From: Gregory Price <gourry@gourry.net>
To: "Bowman, Terry" <terry.bowman@amd.com>
Cc: linux-cxl@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, nifan.cxl@gmail.com, dave@stgolabs.net,
	jonathan.cameron@huawei.com, dave.jiang@intel.com,
	alison.schofield@intel.com, vishal.l.verma@intel.com,
	dan.j.williams@intel.com, bhelgaas@google.com, mahesh@linux.ibm.com,
	ira.weiny@intel.com, oohall@gmail.com, Benjamin.Cheatham@amd.com,
	rrichter@amd.com, nathan.fontenot@amd.com,
	Smita.KoralahalliChannabasappa@amd.com, lukas@wunner.de,
	ming.li@zohomail.com, PradeepVineshReddy.Kodamati@amd.com,
	alucerop@amd.com
Subject: Re: [PATCH v5 13/16] cxl/pci: Add error handler for CXL PCIe Port
 RAS errors
Message-ID: <Z6Zh0faJrwxsVBLD@gourry-fedora-PF4VCD3F>
References: <20250107143852.3692571-1-terry.bowman@amd.com>
 <20250107143852.3692571-14-terry.bowman@amd.com>
 <Z6W92JUQQt4Lf6Ip@gourry-fedora-PF4VCD3F>
 <5df5c06a-b1fe-4b79-a313-2b4c5b088f83@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5df5c06a-b1fe-4b79-a313-2b4c5b088f83@amd.com>

On Fri, Feb 07, 2025 at 01:23:06PM -0600, Bowman, Terry wrote:
> 
> 
> On 2/7/2025 2:01 AM, Gregory Price wrote:
> > On Tue, Jan 07, 2025 at 08:38:49AM -0600, Terry Bowman wrote:
> >> +static void __iomem *cxl_pci_port_ras(struct pci_dev *pdev)
> >> +{
> >> +	struct cxl_port *port;
> >> +
> >> +	if (!pdev)
> >> +		return NULL;
> >> +
> >> +	if ((pci_pcie_type(pdev) == PCI_EXP_TYPE_ROOT_PORT) ||
> >> +	    (pci_pcie_type(pdev) == PCI_EXP_TYPE_DOWNSTREAM)) {
> >> +		struct cxl_dport *dport;
> >> +		void __iomem *ras_base;
> >> +
> >> +		port = find_cxl_port(&pdev->dev, &dport);
> >> +		ras_base = dport ? dport->regs.ras : NULL;
> > I'm fairly certain dport can come back here uninitialized, you
> > probably want to put this inside the `if (port)` block and 
> > pre-initialize dport to NULL.
> Right, it can. NULL dport check here covers this, no?:
> 
> 		ras_base = dport ? dport->regs.ras : NULL;

dport can be garbage (whatever is on the stack) at this check because
nothing ever intializes it to NULL.

> 
> Terry
> 
> >> +		if (port)
> >> +			put_device(&port->dev);
> >> +		return ras_base;
> > You can probably even simplify this down to something like
> >
> > 		struct_cxl_dport *dport = NULL;
> >
> > 		port = find_cxl_port(&pdev->dev, &dport);
> > 		if (port)
> > 			put_device(&port->dev);
> >
> > 		return dport ? dport->regs.ras : NULL;
> >
> >
> > ~Gregory
> 
