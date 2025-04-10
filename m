Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 427F3285407
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 13:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744290011; cv=none; b=qJi1DVjZDHKnkCu10NJwKMF03dqozsHTN93ZYfeJfnruH0LGnLAv2syCwwPSTOZkEmkdGvdW5fS+d9gonn9+48c4Hrs9gIFknbeIQkiJAk+RaNGPa3hi+3MTxsL7iHiPTFNuoR03PVvK9mo8vCDXnYGgIb1I/Ux+FpHHRaYDeeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744290011; c=relaxed/simple;
	bh=m7Z0yYpRm79fgEb6YmXFOLVv+GzsYP9fjX6jcKkZ6lk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=br4/tY/wg6VDGW3HftRCd67797GatRUJiaK55ejnTOSR4unw9iGnLpoy+8OlMdD/W6BiGf7HLh8HtMoDF1hmCWgB1xsWRy6nCoP9gE1/Rszr2GQ99LD0M6ZWMw+C0zV+RalwccMzoEyqmY8dhp5I1cbcTbg0XN6vD1yoWwzAERo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=Z6VXYjeA; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="Z6VXYjeA"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6e8f254b875so6760346d6.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 06:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1744290008; x=1744894808; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Tw0sPz7v8LS0CAWMOhVgeU0Cp08HZ75p6fVMZNaNdbQ=;
        b=Z6VXYjeAxzgSeSadSbih5v9x5Yv7okOPHiRPnh0vxjZim4YQNYEqHuuBAiXgtwQgLm
         3Pe1JirbRrT7N6mC0QJ1CVhQqq2qtoe0uwWkohuKzPZa36hGfzhlURYWkRyQyDSfQBXa
         LH/+vh1Qr4rmYlZL0371R/L64IgbPiMfUfUe4j2NTDf7dowa39gjd1m3u79214+F9xSP
         A1uohnRF4A8xEuMP3CSngf63tIpN8Bv9OJ+cmcUSpJORb2c+t9wEEh8gsZrJTzLXoUVJ
         ktfleuwxZncQBto7nugis9ke+V8vsdToV4WFVVeHseJdL3EBU3a8p9rUeuMfkO5GDW0c
         N4Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744290008; x=1744894808;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tw0sPz7v8LS0CAWMOhVgeU0Cp08HZ75p6fVMZNaNdbQ=;
        b=Mtf6eTy8QEFG7+Gs2fZNdIGdTbLG/RosdxsEKAxqBoMtJ0L5gkkwD/dtWNgt9N/zQ5
         bJGQb9fY26EDcCTNvxjsCfw7K2v/aE6ixkIJf15TWyi/Xr3MISJ/N+mviHR5oOBremHX
         DDEJsD66jpbYjLLRLjflekLvBVC9AKUunc73gZuB1EekKzasUZKiRD9AE3KXFRCmNztv
         QWDY7FACQHWQ+c52XoWkL6Izm/tu4ZEKcda5lSD8g9fQWb0X4V+ydMHE8DLIdop/xf6N
         aAqSRu7e14tB/1bklUELFzkOS4CCIpUdDlxcfnadMHA7qtdR8vd2TrAXB1jrG436w0mB
         VsZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWPxJ8+jREAWReDj1qDpGGIDWVkqIIIeY3M2Q2If1qisasUKsLz+W/N2p03ITClMwgWvQzoTm1sNrymfkc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyj2D5T4rZ8xM+oqsX6wM7OagK2oZkUqzUK9R9rcUGrwXSShfoY
	AIu9v6Djv0ul6T6Do4cbdgh6uSdVxe7sQ84sECie6B+Bj17nt/g8aZjVjWa91d6iJWrZ9YRxdEm
	C
X-Gm-Gg: ASbGncs7c/kN2a6z+fAoi4mWc1l6mgOx6sGyI6VZ2KYnzPJ6V0o9SPl59k0FJayEUCT
	Imh5tuy81vN2qtL1jzbYWaFO2IgRhoVC71NTRr3xJMw9o0aITW3dBsbO5HxwmP7dD63I2KyJdcc
	xdaLqA5yCbdtIlO0YXNEKxLnQ41v5Vh7yXH7p4iYUVd8QyHbPWMj6oifmsWkF+IUr2vhezUFzKF
	A0lYwGaZbkI9urHeuLGAcAVKxgvtKVngECYDUbuPhmUyPYeQKQ4GL/uwy4prgt/XHb3UkBGEejn
	SB8PBI9IkvALjvqwezCpg3Lu9sGEhdJpNATPzjmLFWiCGPk6qw1cPk4oFXB4v0Y/YlW32Ikz+wP
	Lavp0ZxAJnCU55hk0oNUFJq+jdEie5Q==
X-Google-Smtp-Source: AGHT+IHV+4h17MmPjJdRiEYMcX/HrkQ8ur+6FJoazqwSyALLqiGaa9IaitQwXYP2okcYEgv65MC6QQ==
X-Received: by 2002:ad4:5dc8:0:b0:6ea:d49f:ddeb with SMTP id 6a1803df08f44-6f0e5c927dcmr45949516d6.31.1744290007618;
        Thu, 10 Apr 2025 06:00:07 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-219-86.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.219.86])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c7a8951764sm81874985a.40.2025.04.10.06.00.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 06:00:06 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1u2rVm-00000009a9u-1Cgs;
	Thu, 10 Apr 2025 10:00:06 -0300
Date: Thu, 10 Apr 2025 10:00:06 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Tian, Kevin" <kevin.tian@intel.com>
Cc: Robin Murphy <robin.murphy@arm.com>,
	Fedor Pchelkin <pchelkin@ispras.ru>, Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Nicolin Chen <nicolinc@nvidia.com>,
	"iommu@lists.linux.dev" <iommu@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"lvc-project@linuxtesting.org" <lvc-project@linuxtesting.org>
Subject: Re: [PATCH] iommu: fix crash in report_iommu_fault()
Message-ID: <20250410130006.GD1727154@ziepe.ca>
References: <20250408213342.285955-1-pchelkin@ispras.ru>
 <20250408213828.GC1727154@ziepe.ca>
 <74c07104-d072-4d2f-9b79-d9a1c3f2bc54@arm.com>
 <BN9PR11MB527618FFDCF2D7287C3ACA028CB72@BN9PR11MB5276.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BN9PR11MB527618FFDCF2D7287C3ACA028CB72@BN9PR11MB5276.namprd11.prod.outlook.com>

On Thu, Apr 10, 2025 at 05:29:51AM +0000, Tian, Kevin wrote:

> It sounds a general requirement to all IOMMU drivers, but in reality
> only a subset of iommu drivers call it (e.g. intel/smmuv3 don't). So
> there seems to be an implicit assumption from drivers on whether
> the underlying IOMMU provides such facility...

Yeah, it's a bit wonky. And a different intersection calls the new
fault handling API instead :\

There are only 3 things using iommu_set_fault_handler():
 - drivers/gpu/drm/msm
   Seems to actually do restartable page faulting?? Maybe it needs to
   move to the PRI API..

 - drivers/infiniband/hw/usnic
   This just prints a log, we should remove it

 - drivers/remoteproc
   This prints a log and does some crash_handler

I just quickly typed in a small series to improve on this..

Jason
