Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 041B628EA63
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 14:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745333586; cv=none; b=kw7S4d2Q8UTSeydkPG37wrtgFBYl69Fq/akEsX3Pr8f1uoj81PW1vS1udJPd32wd4RYuuBa8UwqMWUyf5/Xghi3QZ77vk3wlIRP47F3ZZx50KfTixk9u33VszsQGDP5ABgKXjXePFPNNkS34+tnw/uc1S5em9Xdp+jsH6k1rYBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745333586; c=relaxed/simple;
	bh=qT84d97/AkxTKwpR/m+Rfq7YQ6rDibD+K221GdCA8j8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=V5s8oE0yT1wt0iFiSyocKbq8/yERSqzjjMdAby26tlyGdIVv2XUbzR/eq4RIEi45EwRxwhuFfTE11W9CmzJ2jLYIEq51/hDOF+t1PzFCAUW1J0TXFgER8AkQ8UwYPA6PxiD4a1Zcj3YjJBUEM94nkbX9ciQzUWIUwOm4vYwwAEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AXEkladn; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AXEkladn"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-73c205898aaso3838511b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 07:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745333584; x=1745938384; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ooGcU85uLmvlzkjhi9UMrJ/GcNbNjtlDBh2b9XJHwJc=;
        b=AXEkladngdu9zuT0D2hiScX1he8MfGEHpuPVGHibIQXypUb5WOAWEHbPXhWoYO7eOd
         yFt8fs/bjupWBrDWtHDDcp9SzoAtreq+zPGR3kV1Sl2hM3no5Xx3wLGtqYVjMfElyjU6
         cRjFd59xIsq8r6GDgijkd8b0e5X+HvveEU/Hnh+wxa0Lx2eW9P04rkT24u9odJ/W4lrU
         BhXu3S77UI4ZE+0KMdvl57GoWMezYmdfCIjcNTPGQ0fCnojRSR4oJhXJLvr8pImhyFt6
         4eAhGFnYz6j7fXLIzK73s/fjMqhvdJFc78kQReBWLfxJP5H7+oeZ4X+ajMkltOXUeU8R
         k5xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745333584; x=1745938384;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ooGcU85uLmvlzkjhi9UMrJ/GcNbNjtlDBh2b9XJHwJc=;
        b=Gn2tmIqueV1RVg0Kahx0cwiFTPUC5cFsm8yFna+xaVYLoHTVYNDzPGuXoZs9rMKZPO
         TnT7w45fVHruCXXJpa5ZX0UR0lDDPIgrE84HiVFf+/cg3OAE3t2O5ma1RAaIJTnq8SYi
         3FpJcYvRKF68+qIshxEyW7EEM2vitRW/nyWhCMbKhvbqPoxVsFnqCjIEpSxDGYsn2JLp
         Ui4xNEO2n4xiF0vk+YvL7yMJAxonT9JVD9jJmz1JjrXofmUBlRKA1RHboVh6HGEdAxjO
         aKXjRxgikNJ46IObWcT/Xhlkcwv+88bsnRhQEELfQmac1GA4zN6uuLCS4GRTHJEWAYhA
         sITg==
X-Forwarded-Encrypted: i=1; AJvYcCVqs4/1DBGcjxNKWf6AVncv3KWs0+YzVROuIx45ckBkjKGiS9XcXTbNkPQjdRW+Yls93KH9Gv7jU3gxOJk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxyCn9/U3yMGKPPOCyVpoeYQUduNGQdw179vy1hCajMLoueInyb
	JWzcgs/HApS8k8gSzKYo6KBRVP0Hkcb5J66cQaE8DicvNWHFTN6B3Defp6EjxHdcyY0Nsm1bmWu
	LDg==
X-Google-Smtp-Source: AGHT+IEx25gCkpttQgdXEdRCmM9tOpB/Y3lOr09cr6TIRqh2wKfoCLxMxZ/On7rEEuVhXVHqBKJaHk715hw=
X-Received: from pfbfc7.prod.google.com ([2002:a05:6a00:2e07:b0:736:9c55:9272])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:888:b0:736:5544:7ad7
 with SMTP id d2e1a72fcca58-73dc14e8128mr18167922b3a.14.1745333584127; Tue, 22
 Apr 2025 07:53:04 -0700 (PDT)
Date: Tue, 22 Apr 2025 07:53:02 -0700
In-Reply-To: <aAdKCGCuwlUeUXKY@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <86y0wrlrxt.wl-maz@kernel.org> <Z-QnBcE1TKPChQay@google.com>
 <86wmcbllg2.wl-maz@kernel.org> <Z-RGYO3QVj5JNjRB@google.com>
 <20250331145643.GF10839@nvidia.com> <Z_PtKWnMPzwPb4sp@google.com>
 <20250407161540.GG1557073@nvidia.com> <Z_QAxiEWEyMpfLgL@google.com>
 <SA1PR12MB719976799AD7F9FC4407A5A9B0BD2@SA1PR12MB7199.namprd12.prod.outlook.com>
 <aAdKCGCuwlUeUXKY@linux.dev>
Message-ID: <aAetTj1U4BWSmqQV@google.com>
Subject: Re: [PATCH v3 1/1] KVM: arm64: Allow cacheable stage 2 mapping using
 VMA flags
From: Sean Christopherson <seanjc@google.com>
To: Oliver Upton <oliver.upton@linux.dev>
Cc: Ankit Agrawal <ankita@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>, Marc Zyngier <maz@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, "joey.gouly@arm.com" <joey.gouly@arm.com>, 
	"suzuki.poulose@arm.com" <suzuki.poulose@arm.com>, "yuzenghui@huawei.com" <yuzenghui@huawei.com>, 
	"will@kernel.org" <will@kernel.org>, "ryan.roberts@arm.com" <ryan.roberts@arm.com>, 
	"shahuang@redhat.com" <shahuang@redhat.com>, "lpieralisi@kernel.org" <lpieralisi@kernel.org>, 
	"david@redhat.com" <david@redhat.com>, Aniket Agashe <aniketa@nvidia.com>, Neo Jia <cjia@nvidia.com>, 
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

On Tue, Apr 22, 2025, Oliver Upton wrote:
> Hi,
> 
> On Wed, Apr 16, 2025 at 08:51:05AM +0000, Ankit Agrawal wrote:
> > Hi, summarizing the discussion so far and outlining the next steps. The key points
> > are as follows:
> > 1. KVM cap to expose whether the kernel supports mapping cacheable PFNMAP:
> > If the host doesn't have FWB, then the capability doesn't exist. Jason, Oliver, Caitlin
> > and Sean points that this may not be required as userspace do not have
> > much choice anyways. KVM has to follow the PTEs and userspace cannot ask
> > for something different. However, Marc points that enumerating FWB support
> > would allow userspace to discover the support and prevent live-migration
> > across FWB and non-FWB hosts. Jason suggested that this may still be fine as
> > we have already built in VFIO side protection where a live migration can be
> > attempted and then fail because of late-detected HW incompatibilities.
> > 
> > 2. New memslot flag that VMM passes at memslot registration:
> > Discussion point that this is not necessary and KVM should just follow the
> > VMA pgprot.
> > 
> > 3. Fallback path handling for PFNMAP when the FWB is not set:
> > Discussion points that there shouldn't be any fallback path and the memslot
> > should just fail. i.e. KVM should not allow degrading cachable to non-cachable
> > when it can't do flushing. This is to prevent the potential security issue
> > pointed by Jason (S1 cacheable, S2 noncacheable).
> > 
> > 
> > So AIU, the next step is to send out the updated series with the following patches:
> > 1. Block cacheable PFN map in memslot creation (kvm_arch_prepare_memory_region)
> > and during fault handling (user_mem_abort()).
> 
> Yes, we need to prevent the creation of stage-2 mappings to PFNMAP memory
> that uses cacheable attributes in the host stage-1. I believe we have alignment
> that this is a bugfix.
> 
> > 2. Enable support for cacheable PFN maps if S2FWB is enabled by following
> > the vma pgprot (this patch).
> > 
> > 3. Add and expose the new KVM cap to expose cacheable PFNMAP (set to false
> > for !FWB), pending maintainers' feedback on the necessity of this capability.
> 
> Regarding UAPI: I'm still convinced that we need the VMM to buy in to this
> behavior. And no, it doesn't matter if this is some VFIO-based mapping
> or kernel-managed memory.
> 
> The reality is that userspace is an equal participant in remaining coherent with
> the guest. Whether or not FWB is employed for a particular region of IPA
> space is useful information for userspace deciding what it needs to do to access guest
> memory. Ignoring the Nvidia widget for a second, userspace also needs to know this for
> 'normal', kernel-managed memory so it understands what CMOs may be necessary when (for
> example) doing live migration of the VM.
> 
> So this KVM CAP needs to be paired with a memslot flag.
>
>  - The capability says KVM is able to enforce Write-Back at stage-2
> 
>  - The memslot flag says userspace expects a particular GFN range to guarantee
>    Write-Back semantics. This can be applied to 'normal', kernel-managed memory
>    and PFNMAP thingies that have cacheable attributes at host stage-1.

I am very strongly opposed to adding a memslot flag.  IMO, it sets a terrible
precedent, and I am struggling to understand why a per-VM CAP isn't sufficient
protection for the VMM.

>  - Under no situation do we allow userspace to create non-cacheable mapping at
>    stage-2 for something PFNMAP cacheable at stage-1.
> 
> No matter what, my understanding is that we all agree the driver which provided the
> host stage-1 mapping is the authoritative source for memory attributes compatible
> with a given device. The accompanying UAPI is necessary for the VMM to understand how
> to handle arbitrary cacheable mappings provided to the VM.
> 
> Thanks,
> Oliver
