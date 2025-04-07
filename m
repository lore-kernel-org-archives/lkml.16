Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2156B20F061
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 16:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744044233; cv=none; b=Nf3AtMC4y7EtleO60IdZWgyD+kNp/OJsobZOgTstEmyOoEva0Fb8dXAqkQtCBuTBqZPmDTiNC1AEZSWOzsZ18C29mgwDNroscvYyIw9heYMxqI+xZusazCM15WMWRlkyVPQ4lp8cg2rUIAVWfvZZ+oPwFq61VmZManezno5CFaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744044233; c=relaxed/simple;
	bh=cvAoqYYxoVMrWTFQTgtR+e3WJRdshdcv4fcS4uv/p7U=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=YeHx1DsXft9bdos7d7UX50E/pbaExta2wRhMJjl3ImGV4dNYETfidar7OxNK/y8gWVwmjgDDZVSCyksEzEG9W9ywdXSW3y1IibV+VCJ0umXThUiEvHW/3tb7cVB96pMKu18sA4oybXYQaVgnzZDCqcqsROmbunVYdbVcAu4L7Gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jbyGMIgn; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jbyGMIgn"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-736d30d2570so3932766b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 09:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744044231; x=1744649031; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=yZnT3kn0lZwBedm0uGPv3h/z1Jk4dbKRxwN+6F5eRc0=;
        b=jbyGMIgnJ5TYN8YHX65tcA9bwq/lzeA5KK1mDAZ8lPNqo/zVWjsjalrU3i534t0RSa
         MSp5AeYUt92roveKjIzHuxo9t4mt6P6Suzt2DLGZlAoSOvXdZM6m3Dvdip2lrsdtQJpH
         JN3uTLtcx2SDuNXav8wopqJhOIb3KrRZ9iIXCGmRuQQyXWLV8yxm6XalRNhSHtVaH94L
         MIm6UBp82R3f0cgTN4Vhb2/lsNq2XwT9Jdys6FPCPhLHwbGVMCCzhVjHw3V286mMX+RA
         60k0d5Fdou7k1y+BLfuLIWq6uKSvMmRfrb0B5va5Dpmpe0uwYyrj+AUmYme9DC6PNH7I
         oxgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744044231; x=1744649031;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yZnT3kn0lZwBedm0uGPv3h/z1Jk4dbKRxwN+6F5eRc0=;
        b=I1WFBCLkF7+CZYbOKrw53IOZFYT00IT0LeXz1ZUsohSdMSp5OlFOB9BlFA3ueanawj
         bHJag6eXCPJj2clXaxbYvO4rhSifjTdReqtp7fShiEy92j2UOsbUny68Ti/iKLYgHDCM
         7hEX7oEXHi9t5ocVBwVPFvXQl5QYbiukM81XgSZ0DCnrCgYLJE8DE93hD6fLBrCuRn7Z
         LT09Vj/7+ZQptVYD1Q8063ytCeCN+kgEmgMnDrOI3Phu12CQCTgI/Y23ZqVP+fABTyZO
         EE16+iWUnCOr5x9vF58IZ12qDhf6S3b+mA2dV0NqyWK00OmvRgtBVkKLrRl3d7UHr6or
         RvWA==
X-Forwarded-Encrypted: i=1; AJvYcCXsFgGpffDdTgSI3imvlKr31Dc2jNfjtA6NiOXnihFJ9XfUwIB5pNEOlWCMvkIGvf3HMxHVlC3eD7pQd9w=@vger.kernel.org
X-Gm-Message-State: AOJu0YxcwpgsWOmez+skSXyf5aETwkw6bIXdXAhz94UHj37ysaMbLfvJ
	iDZRwpxbQjgH+kZLg/HvkOtUPWvy//8rKx8D8V2TaBny6lxuG7jRj8FPW8/mxSnow4PFldz9oD3
	I7w==
X-Google-Smtp-Source: AGHT+IGF8eBnjAYFXIPI8U2dRPCijHocf42fEz6xwJrtVSsRVB6bz3zjqLRx5gwWh1OyqfcDjPG12qk0yPY=
X-Received: from pfbhu13.prod.google.com ([2002:a05:6a00:698d:b0:732:51fc:618f])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:2d04:b0:1f5:7b6f:f8e8
 with SMTP id adf61e73a8af0-20113c095fdmr14665309637.6.1744044231220; Mon, 07
 Apr 2025 09:43:51 -0700 (PDT)
Date: Mon, 7 Apr 2025 09:43:50 -0700
In-Reply-To: <20250407161540.GG1557073@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <Z9s7r2JocpoM_t-m@arm.com> <SA1PR12MB7199C7BD48EB39F536DD34DBB0A62@SA1PR12MB7199.namprd12.prod.outlook.com>
 <Z-QU7qJOf8sEA5R8@google.com> <86y0wrlrxt.wl-maz@kernel.org>
 <Z-QnBcE1TKPChQay@google.com> <86wmcbllg2.wl-maz@kernel.org>
 <Z-RGYO3QVj5JNjRB@google.com> <20250331145643.GF10839@nvidia.com>
 <Z_PtKWnMPzwPb4sp@google.com> <20250407161540.GG1557073@nvidia.com>
Message-ID: <Z_QAxiEWEyMpfLgL@google.com>
Subject: Re: [PATCH v3 1/1] KVM: arm64: Allow cacheable stage 2 mapping using
 VMA flags
From: Sean Christopherson <seanjc@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Marc Zyngier <maz@kernel.org>, Ankit Agrawal <ankita@nvidia.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Oliver Upton <oliver.upton@linux.dev>, 
	"joey.gouly@arm.com" <joey.gouly@arm.com>, "suzuki.poulose@arm.com" <suzuki.poulose@arm.com>, 
	"yuzenghui@huawei.com" <yuzenghui@huawei.com>, "will@kernel.org" <will@kernel.org>, 
	"ryan.roberts@arm.com" <ryan.roberts@arm.com>, "shahuang@redhat.com" <shahuang@redhat.com>, 
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>, "david@redhat.com" <david@redhat.com>, 
	Aniket Agashe <aniketa@nvidia.com>, Neo Jia <cjia@nvidia.com>, 
	Kirti Wankhede <kwankhede@nvidia.com>, "Tarun Gupta (SW-GPU)" <targupta@nvidia.com>, 
	Vikram Sethi <vsethi@nvidia.com>, Andy Currid <acurrid@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, Dan Williams <danw@nvidia.com>, 
	Zhi Wang <zhiw@nvidia.com>, Matt Ochs <mochs@nvidia.com>, Uday Dhoke <udhoke@nvidia.com>, 
	Dheeraj Nigam <dnigam@nvidia.com>, Krishnakant Jaju <kjaju@nvidia.com>, 
	"alex.williamson@redhat.com" <alex.williamson@redhat.com>, 
	"sebastianene@google.com" <sebastianene@google.com>, "coltonlewis@google.com" <coltonlewis@google.com>, 
	"kevin.tian@intel.com" <kevin.tian@intel.com>, "yi.l.liu@intel.com" <yi.l.liu@intel.com>, 
	"ardb@kernel.org" <ardb@kernel.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, 
	"gshan@redhat.com" <gshan@redhat.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>, 
	"ddutile@redhat.com" <ddutile@redhat.com>, "tabba@google.com" <tabba@google.com>, 
	"qperret@google.com" <qperret@google.com>, "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"

On Mon, Apr 07, 2025, Jason Gunthorpe wrote:
> On Mon, Apr 07, 2025 at 08:20:09AM -0700, Sean Christopherson wrote:
> > On Mon, Mar 31, 2025, Jason Gunthorpe wrote:
> > > On Wed, Mar 26, 2025 at 11:24:32AM -0700, Sean Christopherson wrote:
> > > > > I don't know how you reconcile the lack of host mapping and cache
> > > > > maintenance. The latter cannot take place without the former.
> > > > 
> > > > I assume cache maintenance only requires _a_ mapping to the physical memory.
> > > > With guest_memfd, KVM has the pfn (which happens to always be struct page memory
> > > > today), and so can establish a VA=>PA mapping as needed.
> > > 
> > > This is why we are forcing FWB in this work, because we don't have a
> > > VA mapping and KVM doesn't have the code to create one on demand.
> > 
> > I don't follow.  As it exists today, guest_memfd doesn't touch the direct map,
> > i.e. there's already a kernel mapping, KVM doesn't need to create one.
> 
> This is not about guest_memfd..

Heh, my part of the thread was.  I was responding to Marc's comment:

 : Remind me how this work with stuff such as guestmemfd, which, by
 : definition, doesn't have a userspace mapping?

I'm pretty sure we're on the same page.
