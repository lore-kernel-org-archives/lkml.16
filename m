Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 853ED1DB546
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 17:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743354419; cv=none; b=ObP9hSqQ8SEe+kU680aOnoj0DPjuYXoQj4AbF5jq/MHoJ42W7ZASbkMHElFZAGi0J/uzz8+FVuu1balW+SlJv27hYV7274xJ1+zavOujBGbcfCbtenGsfvS5DQG2XpZLTYkroIwfYbJI+M9EqNYOwep6JHs49Qwm4YRx5DHPCIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743354419; c=relaxed/simple;
	bh=5UmCN6T9Cr1gCtDDz08QVciKcS4TNX6bP4xhWdD/03c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fMK4ImmkSTdcxVuV15bmvzo3JD6R2zsqY0LvXnio+wWuAxiYtYovDhYZOWTa0L2n8Vi7t15cUa1k4VTZLwSjqC+8w6qfv5vPGDsKtDEpvkymXM8oLA5tplSAGA+sr0Zn2Wxye2L+FgnFELy8GnwrxMgpwCxeNZB1cKlvcPBDqck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gnsH83w+; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gnsH83w+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743354416;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q3mk6TbPcxIg/goVXurjT8cjd9wFt7uMusUUceOMSw4=;
	b=gnsH83w+LEvnz/9UzYJxOSwl0DD3U4YQF62i+QZPC3hocp/LTC5bu5oMMAiWKKf3auiR5M
	SOybO3X3P5MLBzWwLubmq/5bZB5tTHSEGiMj2hsfC2fXyPQbZuAtjqeu1U6nzZdq7CPyWA
	mmdqmcvS7lkNSuVxJ/T3JfoEEIzoeQU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-661--p_g3TguNk68BNRmiDx5yg-1; Sun, 30 Mar 2025 13:06:55 -0400
X-MC-Unique: -p_g3TguNk68BNRmiDx5yg-1
X-Mimecast-MFC-AGG-ID: -p_g3TguNk68BNRmiDx5yg_1743354414
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43d51bd9b41so33281435e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 10:06:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743354414; x=1743959214;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q3mk6TbPcxIg/goVXurjT8cjd9wFt7uMusUUceOMSw4=;
        b=mDqDlzweSQ+YSaU4b+qCuL1MybwtugL8tUxNPQv5qNAiHFkz2dnb1bhQOFIc9WeSw3
         qsuXgiQlKx9sTC03jez5/9YjfKAPav2ZmB1neatabBLtas7gKKjJYpQLyOUTBI1G9Y9X
         BgL/Ir/diJ44y/SLz9KFljg2jsiwBZI8IC/5uHgh0JUXuzd9Zk6onHXkU9zCNVOmn7Ha
         bzgbgvKEPTuB47LTg4ND2qvAQE71zQP3KAeExQaZTg5dv9ex6eIrl9kBLnKX2dk6jsYo
         vC4xVnvf7M5A1WOtt1xIZrHMAW0DfaUPYWi2W4ZdLU7aSAEw3uS8bV5epqvdBUDuN3SE
         ZqAw==
X-Forwarded-Encrypted: i=1; AJvYcCWW5PLIk/JN3qFyh9Td0nndkN+rEyukrVgZRAgUHzsiUMBmotyRXVt4iYqGp0qOwaxvnHzZc1deR7X8z+c=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnY4FgZYOg8d/jTcWMjdmFckZnH3vDC3dKTEzdZmhJ1g1k9D9l
	DZhuipwmckLFDUrMAKmpF8n0xNqS82+nM/zAsf7A6Zb69k2TATo5Yt26dWTufNaiU5QAHxQJOic
	sYp3q8gBs1rgOB7gBTrh8Z5FkklUNafoPCX4blUyXdxZLOrU0F7u3A9QVDGB03w==
X-Gm-Gg: ASbGnctNbR5IyW++PCJ8r1ABTUA2h+6KYyF+0pM53mqpIb4gOHCwydq8Y1rZNJglM4b
	VkPkVuXNNTbS5S5e5hqRQazEdx5EzZijHnWLX4UIl79HTl8qd2POoCSber/f4J5VMkpUSV/UiZZ
	EEiO1Y4E+nIxpBfZ5eaW39mrG0eGtFkn5aqZM++wzj2mQkd4DeAiyfQcwki672DT0AVMfi43WDV
	JpCKE6/23uNOx10AXYNVaLSLRPCGM72JKPzKXUVzb6hatfI6MtElHuXZyiJJJcWwde7MyofcsOC
	F3Pa734I1Q==
X-Received: by 2002:a05:6000:290f:b0:390:f552:d291 with SMTP id ffacd0b85a97d-39c120dc53emr6045349f8f.22.1743354413860;
        Sun, 30 Mar 2025 10:06:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGHnojfMbGERAUL3k9pGdjXNeKSJM3z6oVNts7beynMJRyZ4qGr50Up8p35T+/D9THLJjAJmw==
X-Received: by 2002:a05:6000:290f:b0:390:f552:d291 with SMTP id ffacd0b85a97d-39c120dc53emr6045310f8f.22.1743354413473;
        Sun, 30 Mar 2025 10:06:53 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d8ff02e75sm96683605e9.30.2025.03.30.10.06.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Mar 2025 10:06:52 -0700 (PDT)
Date: Sun, 30 Mar 2025 13:06:47 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Claire Chang <tientzu@chromium.org>, Rob Herring <robh+dt@kernel.org>,
	mpe@ellerman.id.au, Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	boris.ostrovsky@oracle.com, jgross@suse.com,
	Christoph Hellwig <hch@lst.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	heikki.krogerus@linux.intel.com, peterz@infradead.org,
	benh@kernel.crashing.org, grant.likely@arm.com, paulus@samba.org,
	mingo@kernel.org, sstabellini@kernel.org,
	Saravana Kannan <saravanak@google.com>, xypron.glpk@gmx.de,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
	Bartosz Golaszewski <bgolaszewski@baylibre.com>,
	xen-devel@lists.xenproject.org, Thierry Reding <treding@nvidia.com>,
	linux-devicetree <devicetree@vger.kernel.org>,
	linuxppc-dev@lists.ozlabs.org,
	Nicolas Boichat <drinkcat@chromium.org>,
	Dan Williams <dan.j.williams@intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	lkml <linux-kernel@vger.kernel.org>,
	"list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
	Jim Quinlan <james.quinlan@broadcom.com>,
	Robin Murphy <robin.murphy@arm.com>, hch@infradead.org,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	virtualization@lists.linux.dev, graf@amazon.de
Subject: Re: Using Restricted DMA for virtio-pci
Message-ID: <20250330125929-mutt-send-email-mst@kernel.org>
References: <20210209062131.2300005-1-tientzu@chromium.org>
 <979b6a34ca5724ced1d4871b58bf227065d7da57.camel@infradead.org>
 <20250321142947-mutt-send-email-mst@kernel.org>
 <d1382a6ee959f22dc5f6628d8648af77f4702418.camel@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d1382a6ee959f22dc5f6628d8648af77f4702418.camel@infradead.org>

On Fri, Mar 21, 2025 at 06:42:20PM +0000, David Woodhouse wrote:
> On Fri, 2025-03-21 at 14:32 -0400, Michael S. Tsirkin wrote:
> > On Fri, Mar 21, 2025 at 03:38:10PM +0000, David Woodhouse wrote:
> > > On Tue, 2021-02-09 at 14:21 +0800, Claire Chang wrote:
> > > > This series implements mitigations for lack of DMA access control on
> > > > systems without an IOMMU, which could result in the DMA accessing the
> > > > system memory at unexpected times and/or unexpected addresses, possibly
> > > > leading to data leakage or corruption.
> > > 
> > > Replying to an ancient (2021) thread which has already been merged...
> > > 
> > > I'd like to be able to use this facility for virtio devices.
> > > 
> > > Virtio already has a complicated relationship with the DMA API, because
> > > there were a bunch of early VMM bugs where the virtio devices where
> > > magically exempted from IOMMU protection, but the VMM lied to the guest
> > > and claimed they weren't.
> > > 
> > > With the advent of confidential computing, and the VMM (or whatever's
> > > emulating the virtio device) not being *allowed* to arbitrarily access
> > > all of the guest's memory, the DMA API becomes necessary again.
> > > 
> > > Either a virtual IOMMU needs to determine which guest memory the VMM
> > > may access, or the DMA API is wrappers around operations which
> > > share/unshare (or unencrypt/encrypt) the memory in question.
> > > 
> > > All of which is complicated and slow, if we're looking at a minimal
> > > privileged hypervisor stub like pKVM which enforces the lack of guest
> > > memory access from VMM.
> > > 
> > > I'm thinking of defining a new type of virtio-pci device which cannot
> > > do DMA to arbitrary system memory. Instead it has an additional memory
> > > BAR which is used as a SWIOTLB for bounce buffering.
> > > 
> > > The driver for it would look much like the existing virtio-pci device
> > > except that it would register the restricted-dma region first (and thus
> > > the swiotlb dma_ops), and then just go through the rest of the setup
> > > like any other virtio device.
> > > 
> > > That seems like it ought to be fairly simple, and seems like a
> > > reasonable way to allow an untrusted VMM to provide virtio devices with
> > > restricted DMA access.
> > > 
> > > While I start actually doing the typing... does anyone want to start
> > > yelling at me now? Christoph? mst? :)
> > 
> > 
> > I don't mind as such (though I don't understand completely), but since
> > this is changing the device anyway, I am a bit confused why you can't
> > just set the VIRTIO_F_ACCESS_PLATFORM feature bit?  This forces DMA API
> > which will DTRT for you, will it not?
> 
> That would be necessary but not sufficient. The question is *what* does
> the DMA API do?
> 
> For a real passthrough PCI device, perhaps we'd have a vIOMMU exposed
> to the guest so that it can do real protection with two-stage page
> tables (IOVA→GPA under control of the guest, GPA→HPA under control of
> the hypervisor). For that to work in the pKVM model though, you'd need
> pKVM to be talking the guest's stage1 I/O page tables to see if a given
> access from the VMM ought to be permitted?
> 
> Or for confidential guests there could be DMA ops which are an
> 'enlightenment'; a hypercall into pKVM to share/unshare pages so that
> the VMM can actually access them, or SEV-SNP guests might mark pages
> unencrypted to have the same effect with hardware protection.
> 
> Doing any of those dynamically to allow the VMM to access buffers in
> arbitrary guest memory (when it wouldn't normally have access to
> arbitrary guest memory) is complex and doesn't perform very well. And
> exposes a full 4KiB page for any byte that needs to be made available.
> 
> Thus the idea of having a fixed range of memory to use for a SWIOTLB,
> which is fairly much what the restricted DMA setup is all about.
> 
> We're just proposing that we build it in to a virtio-pci device model,
> which automatically uses the extra memory BAR instead of the
> restricted-dma-pool DT node.
> 
> It's basically just allowing us to expose through PCI, what I believe
> we can already do for virtio in DT.

I am not saying I am against this extension.
The idea to restrict DMA has a lot of merit outside pkvm.
For example, with a physical devices, limiting its DMA
to a fixed range can be good for security at a cost of
an extra data copy.

So I am not saying we have to block this specific hack.

what worries me fundamentally is I am not sure it works well
e.g. for physical virtio cards.
Attempts to pass data between devices will now also require
extra data copies.


Did you think about adding an swiotlb mode to virtio-iommu at all?
Much easier than parsing page tables.



-- 
MST

