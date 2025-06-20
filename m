Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A3B9253F16
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 16:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750437314; cv=none; b=CTOgzhF6h5gv3zswgBs3pyPAYqIcpd2DYLHdvTUGWHWMUxc7cUFIsaONPMuK9vwAZQ+bF02PR9m7a50GbHXm7fQcFwCqG19IS33N+4+noyEMqFhcdikgA1xLVXv+fycPQGR1B/pmZjouaOVFJ88Tiv78HSOFUZDAUzWTWnbmYwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750437314; c=relaxed/simple;
	bh=NfmPX0yVFBBCDiBkKX9NhyYVI/32o1GQomiZQ8lwj04=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fqqew/IFfUbiaL/DUc472BF3F6tel7oWxaWj6YjMCXrvSJAMg1AzCu9lZ92AzTtcElwrl8ph/4/ckUWR1QiVvEIT5W/lk4JbameEEOhnjQwrFQr4spscGLS6GUv13cxwlpv4tU5oePIPgmOcBd9XrrkqIgaXeS8p2QEU5dz8JlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=AFtBDGY4; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="AFtBDGY4"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4a442a3a2bfso30978841cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 09:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1750437311; x=1751042111; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hFurqnYI+L7RUrkwAcAgkoscsXJUHEF+OS7OBiZvdjs=;
        b=AFtBDGY4u//+OcRGgsNP2nNIl3GkBu06cDTBoTr3GbiDOsqI32jTwaU1J+XH9lwAvY
         hWaQh/mJv0874X3toBckXmF6Ik6GcU2KxrGTumygmVBWqGFj7NHeafpVOTHWKmdlRENh
         n2+pcbtl98j62d7pnsl+OI9JndziiQK4dy2pJgt23PDx0YcfufkGQmzooiCFr6RuglOl
         cF+pVDRa0xj+bG76O1evGjZt4D5wi4KYclCUHuuHbnnbokf+t1EfIwY+zSTJ3ujMBOnE
         /eW1Hkn/8Ihp8Rbn6mmN6W2AIg87vLWzMAVELW3JLKTO9ff8QvQpR1R8xFzqh/+0TWJd
         1mKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750437311; x=1751042111;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hFurqnYI+L7RUrkwAcAgkoscsXJUHEF+OS7OBiZvdjs=;
        b=T6bCCXnWNyOczZlMIjD82WL7OiblHf0YIdRVrO1w2Z10+VzmuqSCjPFdHa4bWyIKnN
         Yti/3UvB9dJWyIIHCoLAY2CrIBVy8hQiju4aAfsb0AWsVCqwASRz+QOG30+yfn7RWtO6
         jcpjR0CBpyXSHrYSJR/W0OW0kSgUFGVyhNqICyCldLgowgymiEGTa00iQJQofGA7GcCZ
         3p4EZQQNYOZvFw9GvuiCKhTxGzflaf3p2twBkODM49cgM0/YZX22tEaHuRWzmpHWyPXh
         fSold8P6kmWMnufYt5FBmiaftV9XxqCZ6GL7Sg5iPJgMuYWf9yy0/wT0840SnQ5f6OKG
         AOEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfg2VduXf3q29slUBB2769hR+DnFqchDZpTNp7wrXYkH2rQrJexF/4D3AMO+gSAZvLVVQ1XCiHKyoB488=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFtkxoAYz4lqIpjFsVLkyTO040Zg+GA9eR7UDO2PERmduJM+3n
	vR5JNxo5jOOEVYjWQ44o71Gn0f7Wnm623oAV4LkctIOW3UELLRr/rLF9Y3yppDRgCfs=
X-Gm-Gg: ASbGncsdliUWL540l4wW5EIWA/XWYCH+TDP6XUWnYjTHieIOG2ZvFQr3aMM7hjgc2fZ
	BYMNtSZ07JfPhq02DQ/OT1nY6QbT8e+CLp1drCO+lKczCH3PxWTy2WJZJ7qzrZ9/mbr+po6yS3C
	SgOR0NokMLpsPN34nGngu+7rZBxhHoRvgrHOUeWVvrBnggqI4FOGhP+1xRVl3PMrcsGw90w4AAA
	Z2HaUfmtOk/h8+e2QemPnOg12M5QNAwCUgkCZ8r/wE19uY1MMo5YhKj7AOu0VJy3jcv68tVO+Pm
	QqbuMWaR+9wDDzVAO76l/iIMnKMJ4gIlxiaP4LBCtpOlmoz8xGuQfrNiH/De2/JoTMJSzZapu63
	C+Pr/i+wqU0zWVaUcALd+m91uhoxjSDq6ut+Q0g==
X-Google-Smtp-Source: AGHT+IFA6k631lKxrYTYm+6L/JASXk2MoP+urHg89b8SmimDGgONLFl8B84S2EQnZ661ul3HBMs1NQ==
X-Received: by 2002:a05:622a:1307:b0:4a7:2357:dc81 with SMTP id d75a77b69052e-4a77a23abbfmr54566761cf.3.1750437311156;
        Fri, 20 Jun 2025 09:35:11 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a779d9dbfesm10698501cf.36.2025.06.20.09.35.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 09:35:10 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uSehp-00000000Es0-48hW;
	Fri, 20 Jun 2025 13:35:09 -0300
Date: Fri, 20 Jun 2025 13:35:09 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de,
	nicolas.dufresne@collabora.com, iommu@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v3 3/5] iommu: Add verisilicon IOMMU driver
Message-ID: <20250620163509.GB39770@ziepe.ca>
References: <20250619131232.69208-1-benjamin.gaignard@collabora.com>
 <20250619131232.69208-4-benjamin.gaignard@collabora.com>
 <20250619134752.GB1643390@ziepe.ca>
 <073ffe14-d631-4a4f-8668-ddeb7d611448@collabora.com>
 <20250619165928.GA10257@ziepe.ca>
 <e034a111-93eb-42e8-a533-46553b4f5588@collabora.com>
 <20250620120509.GA39770@ziepe.ca>
 <d9a1b9ab-b6ab-4364-a1b7-df4debc21bc1@collabora.com>
 <3337df6c-f800-4610-8689-fbd4b4a5d07a@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3337df6c-f800-4610-8689-fbd4b4a5d07a@collabora.com>

On Fri, Jun 20, 2025 at 04:42:02PM +0200, Benjamin Gaignard wrote:
> 
> Le 20/06/2025 à 15:52, Benjamin Gaignard a écrit :
> > 
> > Le 20/06/2025 à 14:05, Jason Gunthorpe a écrit :
> > > On Fri, Jun 20, 2025 at 10:57:49AM +0200, Benjamin Gaignard wrote:
> > > > Le 19/06/2025 à 18:59, Jason Gunthorpe a écrit :
> > > > > On Thu, Jun 19, 2025 at 06:27:52PM +0200, Benjamin Gaignard wrote:
> > > > > > Le 19/06/2025 à 15:47, Jason Gunthorpe a écrit :
> > > > > > > Ugh. This ignores the gfp flags that are passed into map because you
> > > > > > > have to force atomic due to the spinlock that shouldn't be there :(
> > > > > > > This means it does not set GFP_KERNEL_ACCOUNT when
> > > > > > > required. It would
> > > > > > > be better to continue to use the passed in GFP flags
> > > > > > > but override them
> > > > > > > to atomic mode.
> > > > > > I will add a gfp_t parameter and use it like that:
> > > > > > page_table = iommu_alloc_pages_sz(gfp | GFP_ATOMIC |
> > > > > > GFP_DMA32, SPAGE_SIZE);
> > > > > This will or together GFP_ATOMIC and GFP_KERNEL, I don't think that
> > > > > works..
> > > > I have test it, I don't see conflicts or errors. What worries you ?
> > > Just looking at the bitmaps I'm not sure? Did you run with lockdep?
> > 
> > Yes and it complains about that.
> > I see that sun50i driver have more less the same struct than my driver
> > but doesn't use lock. I will try see if I can remove the lock.
> 
> I have replace the two spinlock by a mutex in vsi_iommu structure.
> It seems it works well and lockdep doesn't complain anymore.

You cannot use a sleeping lock within the map/unmap
functions. Removing the lock is hard for your case because you have
the cache flushing problem.

Maybe mask GFP_KERNEL off and then or back in GFP_ATOMIC.

Jason
