Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E6729B227
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 11:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747308506; cv=none; b=ccufyn/YCMlxFNJbaVlq5lqJ9bUjubMJDsA5FLLbk2quKlfup5sPe/Za7y193jV4tNG1zzK+xGSvd8/A0GaExg/n8xfHhxdNzJvTHp3QraN6sjzjVBAf/0PgKzYicD9NS5JwcwCbc1XCyLGFY7UcGyl2Y9xcwdAdqSWDAnz/TmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747308506; c=relaxed/simple;
	bh=pejymE+5J/JOUZp5QCro2lHDDLB60GHjyo2G/ySAD84=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VLIwoGPm9OTOdn5vc/4PzOMUwPs+szR8dDmc2Mbm5fF4Mpk9citrCJ9a8wMz3mGpdJWRCMRStLY83pBBRgPT4v+Wr/Dsnj1DTHI/n6CaPm4VVIfT7bACRlx5yVe0lVpeOK9nWHVvKe6F3fkaIE+LC2TBusAc11/iRCGSruH5tYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gQOoAfcT; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gQOoAfcT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747308503;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xbhS3Ju7G0RU72yLnv7dx3n2u6YB6c2WXxN8h+PvWbc=;
	b=gQOoAfcT+LJwOySXiV8dleERc83+ec0ZU9tv34fbM4YqRzglYBLzWJ9usf1ySaqOhXyskf
	6weid57k3Xn4onNr0YsDHZmMRMwqC29rlKmYswXpT9+Crb9k5tq/6dWZZRQ00xI4xr70IP
	dcMnlCpewbnXqd7aOEQDvxxiLUsKh4Q=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-338-5_zfOiLkOLiFXVgO5hckMA-1; Thu, 15 May 2025 07:28:22 -0400
X-MC-Unique: 5_zfOiLkOLiFXVgO5hckMA-1
X-Mimecast-MFC-AGG-ID: 5_zfOiLkOLiFXVgO5hckMA_1747308501
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a2046b5e75so382853f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 04:28:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747308501; x=1747913301;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xbhS3Ju7G0RU72yLnv7dx3n2u6YB6c2WXxN8h+PvWbc=;
        b=o2EAHZsYKmlXrJwkrjloRMrw13eZsyQxk6wIi9VURwCkx5VzOsPeD8caOlQ+cAtSPF
         zUJJxz0JebdWUDQ1uhmg+Kt9L/oByovK01RLSUqqZVSr5aKPKeomPsEvXaztm9RXwwTM
         zB0IzxFsTaY2qP1DRMcLG6wOF0M47zba1wQLH3xu5T4qlut35d6gonmRP27W8jVfoCIu
         2z0NxtP5GbZE5cZFfo/9gL+1IF6kwIjURAzeZmUdUNA1PLmbcqCNDDRkdgMf0hnvPEMy
         dYMGxBNT/rrvd3mf39lDNi5fISUX8Id3M0VcVefTdjGPExSwxte1j67n6xT2pSxoq5q5
         Q/Kg==
X-Forwarded-Encrypted: i=1; AJvYcCVSsutK6s+mM6mKUvtvWcQszGM4rf2ZlcZ45t3TAfczklAC9dU2LQD2QDWLqbx2jx4p/ifH8w3IDfW4xZo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxO5fJ9f5tIOCJhEePU+ieYxSJ/CN9KuVjc5UNNqsjStFIGIkI2
	bAkssb+DxB4G4DOuQJC7jkSMQguSqDPkbV7m4/WFDrKvX4Gg6ttPyKtLB3hLCoNv9Zd/01M9G11
	aru66J6uaxmb7J0F+zdXJdsbckQqd3EcpKWWlxJVIbViux3dUSYPE68NesfuNQQ==
X-Gm-Gg: ASbGncvg7ave3ANVpcILOubrnAZ4R3m0cKfIwqZ023j3ta3mKQCZRRPL13oIifG8AM8
	rv2XnWHbpxj1sK/XlnVfaM1GtT1GvwufNtfCnfYKH7gxgSAj2F84YvnEKZ2meWdHtjnbPXdvK14
	i8Dz+mVat3Vu4yGbqH+1V8Dfm4J+OQBscMOn9HmsQ5upWDPR4zHiDJDVtK3cFOdlxu6apozWRx7
	jusp3JQdRJykVvDlEhi/pi7UMRCc59AKPJrmAMSwYNXrCiK4hmQzug3aqJgvJWPeouul3BCo+XK
	9C2Yjw==
X-Received: by 2002:a5d:584c:0:b0:3a3:2aa5:11bc with SMTP id ffacd0b85a97d-3a3537b4adcmr1827398f8f.54.1747308500773;
        Thu, 15 May 2025 04:28:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEyuhNAhTeV4lZLHtOAJbLtrrq5ZwPIS8k0LNXoYdTkHuAU/c8m5k5qzWyEnDIz37vXRY5wsg==
X-Received: by 2002:a5d:584c:0:b0:3a3:2aa5:11bc with SMTP id ffacd0b85a97d-3a3537b4adcmr1827376f8f.54.1747308500344;
        Thu, 15 May 2025 04:28:20 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a4c7a5sm22723419f8f.98.2025.05.15.04.28.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 04:28:19 -0700 (PDT)
Date: Thu, 15 May 2025 07:28:16 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: phasta@kernel.org
Cc: schalla@marvell.com, vattunuru@marvell.com,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Shijith Thotton <sthotton@marvell.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Satha Rao <skoteshwar@marvell.com>, virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] vdpa/octeon_ep: Control PCI dev enabling manually
Message-ID: <20250515072724-mutt-send-email-mst@kernel.org>
References: <20250508085134.24084-2-phasta@kernel.org>
 <f6e5e4c0f32f8ecb3be71181042082d2d8a9533b.camel@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f6e5e4c0f32f8ecb3be71181042082d2d8a9533b.camel@mailbox.org>

On Thu, May 15, 2025 at 09:14:22AM +0200, Philipp Stanner wrote:
> On Thu, 2025-05-08 at 10:51 +0200, Philipp Stanner wrote:
> > PCI region request functions such as pci_request_region() currently
> > have
> > the problem of becoming sometimes managed functions, if
> > pcim_enable_device() instead of pci_enable_device() was called. The
> > PCI
> > subsystem wants to remove this deprecated behavior from its
> > interfaces.
> > 
> > octeopn_ep enables its device with pcim_enable_device() (for VF. PF
> > uses
> > manual management), but does so only to get automatic disablement.
> > The
> > driver wants to manage its PCI resources for VF manually, without
> > devres.
> > 
> > The easiest way not to use automatic resource management at all is by
> > also handling device enable- and disablement manually.
> > 
> > Replace pcim_enable_device() with pci_enable_device(). Add the
> > necessary
> > calls to pci_disable_device().
> > 
> > Signed-off-by: Philipp Stanner <phasta@kernel.org>
> > Acked-by: Vamsi Attunuru <vattunuru@marvell.com>
> 
> Hi again,
> 
> this is the last of 12 drivers blocking me from removing a few hundred
> lines of broken code from PCI. Would be great if it could be sent to
> Linus next merge window.
> 
> Can someone take this patch in?
> 
> Thx
> P.

I intend to, working on packing things up for -next as we speak.

> > ---
> > Changes in v4:
> >   - s/AF/PF
> >   - Add Vamsi's AB
> > 
> > Changes in v3:
> >   - Only call pci_disable_device() for the PF version. For AF it
> > would
> >     cause a WARN_ON because pcim_enable_device()'s callback will also
> >     try to disable.
> > ---
> >  drivers/vdpa/octeon_ep/octep_vdpa_main.c | 17 ++++++++++++-----
> >  1 file changed, 12 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/vdpa/octeon_ep/octep_vdpa_main.c
> > b/drivers/vdpa/octeon_ep/octep_vdpa_main.c
> > index f3d4dda4e04c..9b49efd24391 100644
> > --- a/drivers/vdpa/octeon_ep/octep_vdpa_main.c
> > +++ b/drivers/vdpa/octeon_ep/octep_vdpa_main.c
> > @@ -454,6 +454,9 @@ static void octep_vdpa_remove_pf(struct pci_dev
> > *pdev)
> >  		octep_iounmap_region(pdev, octpf->base,
> > OCTEP_HW_MBOX_BAR);
> >  
> >  	octep_vdpa_pf_bar_expand(octpf);
> > +
> > +	/* The pf version does not use managed PCI. */
> > +	pci_disable_device(pdev);
> >  }
> >  
> >  static void octep_vdpa_vf_bar_shrink(struct pci_dev *pdev)
> > @@ -825,7 +828,7 @@ static int octep_vdpa_probe_pf(struct pci_dev
> > *pdev)
> >  	struct octep_pf *octpf;
> >  	int ret;
> >  
> > -	ret = pcim_enable_device(pdev);
> > +	ret = pci_enable_device(pdev);
> >  	if (ret) {
> >  		dev_err(dev, "Failed to enable device\n");
> >  		return ret;
> > @@ -834,15 +837,17 @@ static int octep_vdpa_probe_pf(struct pci_dev
> > *pdev)
> >  	ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(64));
> >  	if (ret) {
> >  		dev_err(dev, "No usable DMA configuration\n");
> > -		return ret;
> > +		goto disable_pci;
> >  	}
> >  	octpf = devm_kzalloc(dev, sizeof(*octpf), GFP_KERNEL);
> > -	if (!octpf)
> > -		return -ENOMEM;
> > +	if (!octpf) {
> > +		ret = -ENOMEM;
> > +		goto disable_pci;
> > +	}
> >  
> >  	ret = octep_iomap_region(pdev, octpf->base,
> > OCTEP_HW_MBOX_BAR);
> >  	if (ret)
> > -		return ret;
> > +		goto disable_pci;
> >  
> >  	pci_set_master(pdev);
> >  	pci_set_drvdata(pdev, octpf);
> > @@ -856,6 +861,8 @@ static int octep_vdpa_probe_pf(struct pci_dev
> > *pdev)
> >  
> >  unmap_region:
> >  	octep_iounmap_region(pdev, octpf->base, OCTEP_HW_MBOX_BAR);
> > +disable_pci:
> > +	pci_disable_device(pdev);
> >  	return ret;
> >  }
> >  

