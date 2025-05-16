Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C732615747D
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 14:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747407335; cv=none; b=MSnoDGyLpdDPNXmYOyby3qaaECQ9IC/aH+hZUxtZRhBwjV8b3HwVekYMwfvIpae39AYDwTbZq7a++RkqDTO7gVhBd5irjWQdhwxRyFyFCfHL96kNciEt7p0+AbF+qtXiM/cRNho4vMU9qJtIB0t+2HpUAhJzrqR2CoJel770r+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747407335; c=relaxed/simple;
	bh=g3GmjB2vnMjLb0vAOdgXRlLN/cSrVNrh70Eka0zXYMg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=L/eptyJLflIe+s4vNmJYbW7sebZ9qvyTvjTs78gi1V0h9wUKvhexRRmu1qbs334pVUC3SNOPVP3TckDW3ikB6VXPihr9DIDar9pO9qn87wqpWXSJ3MHmLRzkI31TJEg6GIZ3VXRKmskY5bH5nyN9gx7nNM6S6YJ6NLYeAnP1tZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Smf/UHrg; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Smf/UHrg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747407332;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RCpEW9dWij2GPvehpQ+X4jy2d+EX1S58wCrFKFNBOw4=;
	b=Smf/UHrgQN26/IoAaE8FkuqlhfITth532WhUT7dcdkRg8b35hoKVRnGiVh3/O1346LAgQc
	Qc6EYwq/8nCHGAZHloVRvNpYFiKWz5fgKV2oF7KUBefdjQ4/mOzL66MdcJZH4hLlTSuL/e
	m83WxzK763Aem0ZazQ+sQiz/5IvgmH8=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-215-Pfsw13i8PwGPVMTOg7VscA-1; Fri, 16 May 2025 10:55:25 -0400
X-MC-Unique: Pfsw13i8PwGPVMTOg7VscA-1
X-Mimecast-MFC-AGG-ID: Pfsw13i8PwGPVMTOg7VscA_1747407324
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-85b5c68c390so38703939f.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 07:55:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747407323; x=1748012123;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RCpEW9dWij2GPvehpQ+X4jy2d+EX1S58wCrFKFNBOw4=;
        b=QJC3SIpyEL0Zhyz4hENdkeZwkqn+6P0PgTbqthA1ZT1f4mKjy/pq62wGLPAdADEyVc
         FrtR6gIsDcfhKxpEHzbt6bmG/WPfnuQGR4IL3Ua2ZG9gfuY3EjySV+nsVrFwYBEp8Scs
         R0t9IE0qmQdP/s1M0ZYvKBMdRkOmo1bVoVIfYTYGdob7r1cxca1Cq1VpaVtTvzYQ55uU
         gcdulg3UjtDRkU9bhklcSeg9U+5WyOolislnt/2nxQiGSdV9kik8de9b33gsasxBuN8i
         JpaC60Y5Phu31WGf0kAr1ae31W3NS35iHTCBQHcC8+knmMbyB/cmysZoXn/fuJoxUEdB
         dydA==
X-Forwarded-Encrypted: i=1; AJvYcCVk9d1tVfGaJhFQRFYpt2hHLALbRbBTwh8HsBzt+uiOeQQuzYo+kVh0t491oI/WXpa0wd37ypEzJeCKOxw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDERa5UotK2UZzDUD35imP4wyW99rUkTAl9QX/bWwkGWJRZmZG
	QIhVm0WEzzIfYwcLC9wxzRQIVcgwK6jM1alijDpZuIz/ya2wPcfzzYfVeQ1H+h4alxdUlsvQqaf
	FV1ouBm3ZaLsajMz2lC7HrAzl9hZ4nEZms4Lw3szL8zhz5VNd5u+bgHHD2sG8/5moQCHEnPuNkQ
	==
X-Gm-Gg: ASbGncunZwEajiZ/nEALoJN4+qZKn7R2MPjhjfUwHHdxyLldtSPqQyQuLkwVCnpLfOQ
	OBIjnAADOF1wiqs1wvRaAe0ELaWyqDvG4E8yhXiqUmgLm/QrDV0e0rz3YfVV0fOL7kGftWBvDut
	15eBHTA3YvLazsAFTijDBoIFALvzgdFWZnEmr1CAW+GXi7Do59HHdWI87Y6k1y7VP4gre48h4iV
	hKcQ5I+GgiBLme+yEuJS1+dNYOjTsBsJsy3/NXVHx2hRYmn+g7TnrH56a7kwyQ2OoomoQas0VDz
	2b0FwjVBNH4n/nM=
X-Received: by 2002:a05:6e02:2197:b0:3d4:712e:29ed with SMTP id e9e14a558f8ab-3db8437e424mr12109995ab.7.1747407323450;
        Fri, 16 May 2025 07:55:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFQbpd9KQH/jJZUZUDSw0rCGlc5WOQdQeyDRQO/nVepccE4W5LuVworj0XnDyBRYAbwKOlM1w==
X-Received: by 2002:a05:6e02:2197:b0:3d4:712e:29ed with SMTP id e9e14a558f8ab-3db8437e424mr12109895ab.7.1747407323014;
        Fri, 16 May 2025 07:55:23 -0700 (PDT)
Received: from redhat.com ([38.15.36.11])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4fbcc38a289sm422759173.6.2025.05.16.07.55.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 07:55:22 -0700 (PDT)
Date: Fri, 16 May 2025 08:55:20 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: lizhe.67@bytedance.com, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, muchun.song@linux.dev, Peter Xu
 <peterx@redhat.com>
Subject: Re: [PATCH] vfio/type1: optimize vfio_pin_pages_remote() for
 hugetlbfs folio
Message-ID: <20250516085520.4f9477ea.alex.williamson@redhat.com>
In-Reply-To: <20250516141816.GB530183@ziepe.ca>
References: <20250513035730.96387-1-lizhe.67@bytedance.com>
	<20250515151946.1e6edf8b.alex.williamson@redhat.com>
	<20250516141816.GB530183@ziepe.ca>
Organization: Red Hat
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 16 May 2025 11:18:16 -0300
Jason Gunthorpe <jgg@ziepe.ca> wrote:

> On Thu, May 15, 2025 at 03:19:46PM -0600, Alex Williamson wrote:
> > On Tue, 13 May 2025 11:57:30 +0800
> > lizhe.67@bytedance.com wrote:
> >   
> > > From: Li Zhe <lizhe.67@bytedance.com>
> > > 
> > > When vfio_pin_pages_remote() is called with a range of addresses that
> > > includes hugetlbfs folios, the function currently performs individual
> > > statistics counting operations for each page. This can lead to significant
> > > performance overheads, especially when dealing with large ranges of pages.
> > > 
> > > This patch optimize this process by batching the statistics counting
> > > operations.
> > > 
> > > The performance test results for completing the 8G VFIO IOMMU DMA mapping,
> > > obtained through trace-cmd, are as follows. In this case, the 8G virtual
> > > address space has been mapped to physical memory using hugetlbfs with
> > > pagesize=2M.
> > > 
> > > Before this patch:
> > > funcgraph_entry:      # 33813.703 us |  vfio_pin_map_dma();
> > > 
> > > After this patch:
> > > funcgraph_entry:      # 15635.055 us |  vfio_pin_map_dma();
> > > 
> > > Signed-off-by: Li Zhe <lizhe.67@bytedance.com>
> > > ---
> > >  drivers/vfio/vfio_iommu_type1.c | 49 +++++++++++++++++++++++++++++++++
> > >  1 file changed, 49 insertions(+)  
> > 
> > Hi,
> > 
> > Thanks for looking at improvements in this area...  
> 
> Why not just use iommufd? Doesn't it already does all these
> optimizations?

We don't have feature parity yet (P2P DMA), we don't have libvirt
support, and many users are on kernels or product stacks where iommufd
isn't available yet.

> Indeed today you can use iommufd with a memfd handle which should
> return the huge folios directly from the hugetlbfs and we never
> iterate with 4K pages.

Good to know we won't need to revisit this, and maybe "good enough"
here, without tackling the batch size or gup page pointers is enough to
hold users over until iommufd.  Thanks,

Alex

