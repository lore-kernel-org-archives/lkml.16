Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C491F3B97
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 22:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745446355; cv=none; b=GON4N2f8628KMM/uznwLhPS1XEZILh3YoC5O2HIWDLFNN+OM6uhoE2Wwnav/j55C0wPg+0AxsBObaVi1Pwi+iU+A17TsaRkhXFRqn3bfJ5BmXoMshktXolpCtQCIUe4wcOmEpUfUeFZYFnNiyUY2wE+44iD1gPfZHkNq/xkKOXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745446355; c=relaxed/simple;
	bh=pxCRpPeP5/ZuKvy/5RkvJwDJBdNzzC8Jwte8C1sV994=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MEm92lkBQKwTfiMdj6/cyVofq3udv1GWGAtiL3xwC93cVGBrxO+3ZF7XxMj7x7vpcGFRsw0VYRsUhszfqQeFqyUvjVWhT+pYj1uo581sSVHTJzWHCWqOeJ7BMdxPXkAWVIFVxGkeFDgOe9p2QB5bDa+S2nZ40SD0hsBTgCS5ZAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=sliEkyfU; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="sliEkyfU"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4774ce422easo4039861cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 15:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1745446353; x=1746051153; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GGSu2/ndlUdb1fs1CGKQUBgSMxzZ0kzGZd1szVYFmbc=;
        b=sliEkyfURIL6k21GLQLmGysmvfrfKcErG9dxM3G7B2oN0/VNqOgj0MKM0/DTtmCIkj
         cg6tphrPjaQyS/g9914g57Jqy3coG2LWQzmytidCse9DYT6udGo9ld4Mf3hEVnSpbC2L
         1rAl9ItsZEjE6+1D+5c3U+Ly+a6idncMk1GuSPBGLFluzcgCB88kDmE7pr3Oam47xAWS
         ZdC33heqDDXF7h9OZFsJM++k0siOTeAZkCEeZWqVzb6RxGoCnXz60QpkUVSVL58L75C1
         R7PTyr2+VyHlVOLUF6xXAtKl/2zY59pdE7/I0vUpN+pHCYG5tbqIlp5tnvW++CBbLs4C
         qYdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745446353; x=1746051153;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GGSu2/ndlUdb1fs1CGKQUBgSMxzZ0kzGZd1szVYFmbc=;
        b=pBQLdkqEWfQ9LYiNSOKh+cjA4bt5VWzanFKKA7LwFDrMYE2apJCXtK9cVvJbOs/NxH
         4prlISjNW04oxpfoI1ZM8cl3QB84dS4Tcf/OzWQpypKm7ghd22e38sxNkYYyPxtvyw9k
         cR5tEByMbBD+gO5KsNlepiSs/8g+Oi+C70YYevsj7yWxlzq1BOPbBVMG7qRK35H4HOEJ
         50OXWvAUP42cLxS+uScSaBIL8DeSD2Kw/6VePAJB86oqABdK+gFL53kJWOWlJcN3Pu7h
         X1e9EAZzf4C2AYihjlka17SoLMjnn3OkMnnSBhJqCXQXuQNOuHgLc+g/evtACaPZcI7Q
         cwPg==
X-Forwarded-Encrypted: i=1; AJvYcCXrYXmKISvKrVDvT6OdaUTg2rpmyne7B5WgouP2QMRzfYcIJw1ThH6OsK3w2+bWF0QXD/K51GhXcOvCe0c=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEOG4o2ZaciK6DgmOeSpqIAei6AXi3XFREWjAWIAySgYDw2D2O
	IQUJZU6j1adwEpcyc4mcp7hE6Z/B5tgcNeV2ZaflAW4H/cCZHkPjpkdHeiR1j64=
X-Gm-Gg: ASbGncshepXQqpkNvmc4pEo4aGFwfJ1n9H9ZNHK83C4uq4zwFz6p3qqJ2TfN6VIJygA
	AC8EOgdUoulDh+IxriHSyMivZnVMNdzGJfa42F4skxcmD/DuhRBZFKLu8vb4KqrUdjfkxNQzSRi
	PgNe7ikm3FruwKEKYCLR5A7U+aeAWGg//ozhV7x1pTlT5EnTAyALG1gyVpRneUER8HbAim0ozW7
	6FCG/3KB1zoU8LtNSznfr8+PGLGVZiEr8IN5+T1siHYYjIKAhg9wAUZ9fnaMz4zm0ln0FINHqd4
	vX7+L47KQhijd1LjOkjgAEifsivpZdAwJUUuNf5KrjTrHzeZB/rjUB1Poq4z0YbbGEgsg03KKgX
	9fecM98a24sGwIZQWv24GFcU=
X-Google-Smtp-Source: AGHT+IEJWvDnsGY3vjry1HMHq7KBzCnRVUDLDsSKkcGTXxw03nK1OpLwZUuU/+EBwGnc/8OlsEG6Og==
X-Received: by 2002:ac8:5f90:0:b0:479:1a11:2f95 with SMTP id d75a77b69052e-47eb248cc30mr3193401cf.4.1745446352954;
        Wed, 23 Apr 2025 15:12:32 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-56-208.washdc.fios.verizon.net. [173.79.56.208])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47e9ebea2absm1710081cf.2.2025.04.23.15.12.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 15:12:32 -0700 (PDT)
Date: Wed, 23 Apr 2025 18:12:30 -0400
From: Gregory Price <gourry@gourry.net>
To: Terry Bowman <terry.bowman@amd.com>
Cc: linux-cxl@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, nifan.cxl@gmail.com, dave@stgolabs.net,
	jonathan.cameron@huawei.com, dave.jiang@intel.com,
	alison.schofield@intel.com, vishal.l.verma@intel.com,
	dan.j.williams@intel.com, bhelgaas@google.com, mahesh@linux.ibm.com,
	ira.weiny@intel.com, oohall@gmail.com, Benjamin.Cheatham@amd.com,
	rrichter@amd.com, nathan.fontenot@amd.com,
	Smita.KoralahalliChannabasappa@amd.com, lukas@wunner.de,
	ming.li@zohomail.com, PradeepVineshReddy.Kodamati@amd.com
Subject: Re: [PATCH v8 03/16] CXL/AER: Introduce Kfifo for forwarding CXL
 errors
Message-ID: <aAllzsbEOotodnMJ@gourry-fedora-PF4VCD3F>
References: <20250327014717.2988633-1-terry.bowman@amd.com>
 <20250327014717.2988633-4-terry.bowman@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250327014717.2988633-4-terry.bowman@amd.com>

On Wed, Mar 26, 2025 at 08:47:04PM -0500, Terry Bowman wrote:
> index 485a831695c7..ecb60a5962de 100644
> --- a/drivers/cxl/core/ras.c
> +++ b/drivers/cxl/core/ras.c
... snip ...
> +
> +struct work_struct cxl_prot_err_work;

This changes in patch 5, but this commit fails to build when the drivers
are built-in.  This should be static.

~Gregory
