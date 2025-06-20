Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC0A2E7181
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 16:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750437379; cv=none; b=jsmYMPzhtJXvxs2OhsJfrSNF9BvwqbMo/P5YJjD5Z0VR6k4aloY7i7gv1v4XboLf5jR+1RLOR/z13xhmpKuPPFj7HjiJMuYKEYltrxNDONL8XoHpZK+4TNs9RtpcIC7+XjHVDCQEuQYwp/IwYl3iI1yGEEohsXY7gzmdBRiMTyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750437379; c=relaxed/simple;
	bh=GB2QSxOXPLCCKsHcC8diOJcoWq3MI5uEslI8P9rodFw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EdZBO9/++KvB/L6Rk2OpVIueNlA4iYyrROSGmFkXbWC984+069mxR7wZ16Y1h9i7i52kbmpHi7zv/ht6KCtuCOaD9RIZ+vvVNaAzLgIXQjmcMNibzh4DIi4RKZb7y1FIaRaEuQcEvZlCztKuh+6QdWOxX4Siw0hHO+BP2WG3Mmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=oiJ8q5Zx; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="oiJ8q5Zx"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6fac7147cb8so37242336d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 09:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1750437376; x=1751042176; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uJYXWxLY4HLgWwCr48sF3PGs/sRochGTLyGIU3biNNU=;
        b=oiJ8q5ZxlJxp+suKVtHETfd+oplSmO/PROqPOYkLX4hSxvBrrRDknEV1ZCM1co0Ek6
         zvFaMXSQEjYPJtEBbgUaKkDwBFzhLV85ueDNUpbMRcl+J2UL1JFTitZU5v6n+3QjvpQs
         dvvnHjDwuwoC9TYYyLeF47AGe9wqpHZgw8fC+ueuVmb7qcLelKFAnAYFXsrskrhik6zp
         er7iHb8XgtBiGZgghOqi1nkMCLeaY5N37DknTF3N9HbBASpmwAhRF4B9WuJEDk1MXgCd
         DG8RQonK26ylknlq+WTEnBUx9RaJyHz0bOHkQIcjccj3dxzqJB6EJsWT8RU0Vvtyevd8
         SX6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750437376; x=1751042176;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uJYXWxLY4HLgWwCr48sF3PGs/sRochGTLyGIU3biNNU=;
        b=DQzCn+y3eLCtOXSQl2MjW48zqf/gGwhlC4u534xP2dadWH5ZcJxLbzUGuCx1lSQ4jk
         sWK8uOr3EPZVsLDlVSaIk/TC8EM7lJj7h3arbF/pBOZOVcyqpwJCOX7u+ltOnKgrTPfF
         +wWSLH3ZhWIzGXuYw/6sGun87cGGldNqma+ILl+C6yenVXbq+kbg9shHHETfCrxSdjS/
         OtLtmb/2eyHtXlb6d73XuMXiFt9Kc40GV0lHzyWP2YQdc/zf0e8z63SYCCN7CsSyb4G8
         vjzUf9tDHMbH+fChEYTwXss8aVjt1fQlKjZHIjzGtUlNT76wa50cWx8sKRdGCj0wC7ae
         YDrg==
X-Forwarded-Encrypted: i=1; AJvYcCX0gerNWvGW4bV5DFkPSpEZfHHaCKblCLhPhDshjUd6zRlYPJIfCbRzE/RIVMc8FoviaaYs/ule7OO90vQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyiOhQz9Rv0EwHGzQyNT5o7bfeosaPeSIJPFQh/U6AGoBvegICC
	zW4O9fAH6/J9MkJOeW5PK4OfIY5JLRpPmQMBQiLwdaQBYABY+p6Na153Rdac6/xrIKk=
X-Gm-Gg: ASbGnctg+p/V4500VFn95EXhPmNgE1uLmDegkuDiMn418UX8/FNXT4GCn0mkSeex1MG
	uD32yt95Bi4KbaEhYBtsQpKsiHh4q110Dmudzgv21sJ+mKNgZAb/RC4Z+vRlpg6FdNhHtQkVoe9
	xqSFkuDP2l5y+2N+2EPKJaLBWthBpGpv4CmCquTliaafL1FCmoAD2Ak1/dDd6TwPw8Hsx5no+IG
	c/xM0b4A28ZtHiRVWV7e8k09xjuxh5rcp/Bmjd0fHnoHIe9z2b4x2qZp+wk3dV53K40StBBbwOy
	gQaVgM2VTH4oYl1CHANVfpq2OjwAcV7XLmDVXKCcsbuR+0SHIVDsgz7E5D14PtXYWkwvFmeCOdM
	cGZ95C4HrK5FtztPwpvson1esSz1krahbrudDwg==
X-Google-Smtp-Source: AGHT+IHyontIEkY5vAgGgYhS+U+r5SqIyyHQ9UkviOZGeU6jrV3bzO+5OOnHkugt3y3GJ2IEIkVU5A==
X-Received: by 2002:ad4:5de4:0:b0:6fa:ccb6:602a with SMTP id 6a1803df08f44-6fd0a51b3d7mr63974736d6.20.1750437376130;
        Fri, 20 Jun 2025 09:36:16 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd09596e6bsm13876946d6.100.2025.06.20.09.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 09:36:15 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uSeit-00000000EsP-10Pb;
	Fri, 20 Jun 2025 13:36:15 -0300
Date: Fri, 20 Jun 2025 13:36:15 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de,
	nicolas.dufresne@collabora.com, iommu@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v3 3/5] iommu: Add verisilicon IOMMU driver
Message-ID: <20250620163615.GC39770@ziepe.ca>
References: <20250619131232.69208-1-benjamin.gaignard@collabora.com>
 <20250619131232.69208-4-benjamin.gaignard@collabora.com>
 <20250619134752.GB1643390@ziepe.ca>
 <073ffe14-d631-4a4f-8668-ddeb7d611448@collabora.com>
 <20250619165928.GA10257@ziepe.ca>
 <e034a111-93eb-42e8-a533-46553b4f5588@collabora.com>
 <20250620120509.GA39770@ziepe.ca>
 <d9a1b9ab-b6ab-4364-a1b7-df4debc21bc1@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d9a1b9ab-b6ab-4364-a1b7-df4debc21bc1@collabora.com>

On Fri, Jun 20, 2025 at 03:52:46PM +0200, Benjamin Gaignard wrote:
> > > vsi_iommu_suspend() and vsi_iommu_resume() will also have to take the lock
> > > before calling vsi_iommu_disable() and vsi_iommu_enable().
> > Yes, if they use iommu->domain that seems good
> > 
> > If the above locking is a problem then I'd use the group mutex instead
> > during resume/suspend. The attach functions are already called with
> > the group mutex held.
> 
> Does group mutex is also called when using vsi_iommu_map or vsi_iommu_unmap ?

No

Jason
