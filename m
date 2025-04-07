Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A16CB1F8BC6
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 15:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744039213; cv=none; b=bKFmmUjyLl2hFSU8jLRCIrm+1jkjrlnanuaCfCGC6XiG668TiKTYXq0ZIWm1dfBfMt4qFF2uuiFwfRz87R5nXQ4PsVJFKsSGSncA0To9GSlSWAIfkMXLwP4uv7kzKvZhItSWoIIoBwkc63e2PfVHc2Ca/Hm+jA1CmhgSfnq32/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744039213; c=relaxed/simple;
	bh=u/+KVCI1VmXvlYSWB0tmccv0ERLAgE83Zf8S0Xrnhz0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=bGgPz4dJIRuCeWZTfI2mQgcewXO1ifeUwO4qBCmwIZgoNej1ryHVg280fukvZsoc+q/azFc5vUTBj1AJUeaHyChemSWmZN+hGiNNRw1IfYHAmVMqywlhkr5q2h6MPyUgcUiZZPGEI6Ui394W+uzNj+sCMGtIGGKyFWKgOxfYELs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1aQY5ZgR; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1aQY5ZgR"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-b00aa1f50d1so148411a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 08:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744039211; x=1744644011; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=JTNpEax445O2ynSr3XUTtKC9NAWm3dqDTuE2ry3Vens=;
        b=1aQY5ZgRYYcT5+UDvfqhWt897f8dVa478ykKnfkhsFhDN8g6oy08FXW/CODVuW6WqM
         u8rdyWymGtPewMxw8DWYcuxvG/MYV4r3U5GeLXYsUdt7y862tyGUjMOpMh4hIFKBMrPH
         rQ754qF7ngfNKSbvz1SEcqWPC0SjPAI5SHPvI3istBTccMRo+L2gB8KqzSKJN0wAX0bg
         OmNH5nht2jR6JQVpwDX7+hV9G3g7+77dBiivY/zl6ZfuNTME6z14es5UkzTdlDLWda/c
         2jZ+DR09AYeuCvNLKXaaGiUl1Ogf+R6iViwOI3iwlRCJO2ZrBNCJHFz5NtNIgglPiD2P
         hfQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744039211; x=1744644011;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JTNpEax445O2ynSr3XUTtKC9NAWm3dqDTuE2ry3Vens=;
        b=dbLsfwXk7vobimSdaQAodLTj0JGpQOpIWNLJA+IV0jAysw9AGPngafh28CWhPBLKEt
         TcNlr3bYoLgRTIrQYcGc7Lx7FiA7cYYeJyYLOgjyGLNs1Pe3hi3/ceOxvOl3ryDao/s3
         DHmhLGARUrWsGUOPFXWtj0Zh9cYpDc+Ki8tTxYz5cTi5FuYko4T0EBcNIb+ckJr6PFfo
         aSvbE/VYgvzAJELmi2LEg4wy9cryB+FNohUtzWVr6wOHEWNyfyeh/2xjLsjo/8713aQ/
         22pNECBPvI631tWlLg1wfPqwkFVOgqHAmQ79XI55isZWfnxjPKkca+MJdxamP715smP6
         g1TQ==
X-Forwarded-Encrypted: i=1; AJvYcCUU2LNnp2tTLalC8Gb1RFy5ZBSnbTgkLeZiYN8ptXL+WUyjY3/IIU1Gfcwf3cUtJQLzZySfi0eA4u7o49k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+bDnDVODg6ajii7xN36OBnNplLu/0xOpeHq4udOQJ0bseYx3L
	nRY32jCBwBDQeSfDSz8bX8Cn6ApOWpRIVGvyXcAWqcUqKu0kfYGhTrZLGo7Qn2w3DHUgmWt8h/I
	AUw==
X-Google-Smtp-Source: AGHT+IHFT5IWpb0wEWYBsgf38l3iAGlVDr2qHVuyYE70TQA84d8Gl7Htq0vtNTpBGTTuOvXXCqA42VAV2Ds=
X-Received: from pfbhg1.prod.google.com ([2002:a05:6a00:8601:b0:736:3d80:706e])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:3bc8:b0:223:5124:a16e
 with SMTP id d9443c01a7336-22a8a048ffamr208407455ad.5.1744039210859; Mon, 07
 Apr 2025 08:20:10 -0700 (PDT)
Date: Mon, 7 Apr 2025 08:20:09 -0700
In-Reply-To: <20250331145643.GF10839@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <Z9sItt8BIgvbBY8M@arm.com> <20250319192246.GQ9311@nvidia.com>
 <Z9s7r2JocpoM_t-m@arm.com> <SA1PR12MB7199C7BD48EB39F536DD34DBB0A62@SA1PR12MB7199.namprd12.prod.outlook.com>
 <Z-QU7qJOf8sEA5R8@google.com> <86y0wrlrxt.wl-maz@kernel.org>
 <Z-QnBcE1TKPChQay@google.com> <86wmcbllg2.wl-maz@kernel.org>
 <Z-RGYO3QVj5JNjRB@google.com> <20250331145643.GF10839@nvidia.com>
Message-ID: <Z_PtKWnMPzwPb4sp@google.com>
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

On Mon, Mar 31, 2025, Jason Gunthorpe wrote:
> On Wed, Mar 26, 2025 at 11:24:32AM -0700, Sean Christopherson wrote:
> > > I don't know how you reconcile the lack of host mapping and cache
> > > maintenance. The latter cannot take place without the former.
> > 
> > I assume cache maintenance only requires _a_ mapping to the physical memory.
> > With guest_memfd, KVM has the pfn (which happens to always be struct page memory
> > today), and so can establish a VA=>PA mapping as needed.
> 
> This is why we are forcing FWB in this work, because we don't have a
> VA mapping and KVM doesn't have the code to create one on demand.

I don't follow.  As it exists today, guest_memfd doesn't touch the direct map,
i.e. there's already a kernel mapping, KVM doesn't need to create one.
