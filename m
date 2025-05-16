Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50C5F242D8B
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 13:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747400995; cv=none; b=JSX5xvWyFwKToYcU/Dn5uRj60JjwVbGhVikmZaeikDXuxKaP5u68NHUHqQO3M6+b0cMs7Q7rxEsJs5nwRXKdNgRiYZcF0BqhvHNJp4iAkpjv6H+pdUxh9BLFx/iiRgEBVoKuP0mv0YBErgPDOHYrlpwD8ag2W6qB4rJpyF2GTKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747400995; c=relaxed/simple;
	bh=KeeqOAOGD2IxZktca9/VQWKsKkXiMamtPhRfiYyinBE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HgeQedNJBG9IXbrdauV/lAtgiO6/ywCzdSWh9lHgnQ54qzhKkoXSucPkGVk5u5RqoJzE54GKkQnMOhVdd08+uDufFQ/9FIIqu1TdvcSsLutYPozU+PIuWL267b/AFUdJ3cBFXj58HLp1x2mXviF6jkIvRU1KG++b5LErRQAKAa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=N6aK/QuY; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="N6aK/QuY"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4775ccf3e56so37417711cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 06:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1747400992; x=1748005792; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WBkLgz+xs0k99ZNtnJXNN8FdEZvlmytfCxgniwbp1fs=;
        b=N6aK/QuY/aBobCo1Y4KMAlQpboDW2ZkhOjnQiPxpwYCo2C2bv6G8pjpvI0U/VcV07w
         iKB09xqesGfk4M6naEJuR1tunrC8xRT+7uep7DXRuSCMl6ZOm3A2gfeSb3vEKLgTRUg8
         5ZlxHh5YFlQv7hEjd/NmrY2ARqArwsl6gwVNVL5PltoCKzHr/ORWfZ8ka358rMgNj7aM
         OltfMFww5Ut6y7lVyx8RmlSvsK0w06CwEDq+tCa2pjdHBdfMDNb175TnD4DMR6K7aySs
         7kZajIY4nzaVqxY6+s/76B+eZxXWAo7Wkr+6ShiQZVyazb1P82zoWstqXwNSU9oMlzzy
         OZyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747400992; x=1748005792;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WBkLgz+xs0k99ZNtnJXNN8FdEZvlmytfCxgniwbp1fs=;
        b=fbBLu2/roHcSR/aL22IJcjzGGdhyt164h7ckVSluXyEVP+pSmn4L/v7YPzB4ueejTT
         zDPKvyo2UBH1SxDizpdCka4q3oTdbzdEaZzE4iBxMDLouFBjVELcIDvy8w2E+lvtbu2G
         2PTlCY+PjRVKAH7zKxznQFkU3LAnL1AsJAFzbRQdL0KS1aT8Yf1wJXFkl0i18Ou9nTiP
         Ugi/JIZ4zddId98mNS7U3REN9IjGxHE2ajNmF0buDgZSELhaZuHesV2uVsGB3Arfc+qH
         wQTsFeJASOrZF2DLMFTyEaD5fK30+P1hjrwpIKWR6bH2vPfiAGhmcW032ybQsBDFu934
         kfhg==
X-Forwarded-Encrypted: i=1; AJvYcCVXaQ9eb0bYQTcfE017QOeOBFGmt9mCPnTIok9GSOPZRhgVas6+V5aLXmXWJccHQYusGg8Dd+P957F89kQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgNmlHKhNrwan6vvtQrh15FTzx8GF0t+8TXLawFQKdaNxETGrX
	/mR46IJlwD4LVNN2fAbL75SYRAVktZXsOCNSg3VQzQCTNn8qBjzx5iHqLuutBNZKbp4=
X-Gm-Gg: ASbGncsWh6fKB13qUZNxJb0Mhtaq8InT4HRiZ/aAq9C6ZszMnYvi0Idd40PpNFE8uIK
	IPfMEpHHgLU3bhqTLSdUsMHy/SiovU3O/Aa6iE7B1OlZzIUDYSfyMce+jCEniSMSMx4YbfYPst7
	CD0lPRA8r4Nj2VD5LblpBjOYC6XkuYsjoRKt++eIhhhA6UtJffoEEopnhO4JrWMqS08jm1UnwbC
	uoNQbYmacVn2asMNc12BvsH8rqWjyCMOI4WMajVShwjE8VS+Rz6zkP/QIcZ7OsH7LbNu7fcK+3W
	Yf022PCn6vnldEP/phK2XXj0aHfFG+cleFa5o7yJOb1yY2AFWhXFg5U1ObSXLjMCVRcrYCNXJB2
	6huAF6ZroaMTn5KNFVk/n+R5odAI=
X-Google-Smtp-Source: AGHT+IHPCApkxTW848mw2pAvy0O37cjq5r1nPCJEjsfJzIZSF+v0PF+8hsJhAhsmje7cLGzcj8IimA==
X-Received: by 2002:a05:6214:2428:b0:6e2:4da9:4e2d with SMTP id 6a1803df08f44-6f8b124984bmr51931186d6.9.1747400991725;
        Fri, 16 May 2025 06:09:51 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f8b097a59fsm11761186d6.102.2025.05.16.06.09.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 06:09:50 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uFuow-00000002fSS-05ik;
	Fri, 16 May 2025 10:09:50 -0300
Date: Fri, 16 May 2025 10:09:50 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Sean Christopherson <seanjc@google.com>
Cc: Rick P Edgecombe <rick.p.edgecombe@intel.com>,
	Vishal Annapurve <vannapurve@google.com>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	"catalin.marinas@arm.com" <catalin.marinas@arm.com>,
	Jun Miao <jun.miao@intel.com>,
	"nsaenz@amazon.es" <nsaenz@amazon.es>,
	"pdurrant@amazon.co.uk" <pdurrant@amazon.co.uk>,
	"vbabka@suse.cz" <vbabka@suse.cz>,
	"peterx@redhat.com" <peterx@redhat.com>,
	"x86@kernel.org" <x86@kernel.org>,
	"tabba@google.com" <tabba@google.com>,
	"keirf@google.com" <keirf@google.com>,
	"quic_svaddagi@quicinc.com" <quic_svaddagi@quicinc.com>,
	"amoorthy@google.com" <amoorthy@google.com>,
	"pvorel@suse.cz" <pvorel@suse.cz>,
	"quic_eberman@quicinc.com" <quic_eberman@quicinc.com>,
	"mail@maciej.szmigiero.name" <mail@maciej.szmigiero.name>,
	"vkuznets@redhat.com" <vkuznets@redhat.com>,
	"anthony.yznaga@oracle.com" <anthony.yznaga@oracle.com>,
	Wei W Wang <wei.w.wang@intel.com>, "jack@suse.cz" <jack@suse.cz>,
	Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>,
	Yan Y Zhao <yan.y.zhao@intel.com>,
	Dave Hansen <dave.hansen@intel.com>,
	"ajones@ventanamicro.com" <ajones@ventanamicro.com>,
	"paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
	"quic_mnalajal@quicinc.com" <quic_mnalajal@quicinc.com>,
	"aik@amd.com" <aik@amd.com>,
	"usama.arif@bytedance.com" <usama.arif@bytedance.com>,
	"willy@infradead.org" <willy@infradead.org>,
	"rppt@kernel.org" <rppt@kernel.org>,
	"bfoster@redhat.com" <bfoster@redhat.com>,
	"quic_cvanscha@quicinc.com" <quic_cvanscha@quicinc.com>,
	Fan Du <fan.du@intel.com>, "fvdl@google.com" <fvdl@google.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"thomas.lendacky@amd.com" <thomas.lendacky@amd.com>,
	"mic@digikod.net" <mic@digikod.net>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"steven.price@arm.com" <steven.price@arm.com>,
	"muchun.song@linux.dev" <muchun.song@linux.dev>,
	"binbin.wu@linux.intel.com" <binbin.wu@linux.intel.com>,
	Zhiquan1 Li <zhiquan1.li@intel.com>,
	"rientjes@google.com" <rientjes@google.com>,
	"mpe@ellerman.id.au" <mpe@ellerman.id.au>,
	Erdem Aktas <erdemaktas@google.com>,
	"david@redhat.com" <david@redhat.com>,
	"hughd@google.com" <hughd@google.com>,
	Haibo1 Xu <haibo1.xu@intel.com>,
	"jhubbard@nvidia.com" <jhubbard@nvidia.com>,
	"anup@brainfault.org" <anup@brainfault.org>,
	"maz@kernel.org" <maz@kernel.org>,
	Isaku Yamahata <isaku.yamahata@intel.com>,
	"jthoughton@google.com" <jthoughton@google.com>,
	"steven.sistare@oracle.com" <steven.sistare@oracle.com>,
	"jarkko@kernel.org" <jarkko@kernel.org>,
	"quic_pheragu@quicinc.com" <quic_pheragu@quicinc.com>,
	Kirill Shutemov <kirill.shutemov@intel.com>,
	"chenhuacai@kernel.org" <chenhuacai@kernel.org>,
	Kai Huang <kai.huang@intel.com>,
	"shuah@kernel.org" <shuah@kernel.org>,
	"dwmw@amazon.co.uk" <dwmw@amazon.co.uk>,
	"pankaj.gupta@amd.com" <pankaj.gupta@amd.com>,
	Chao Peng <chao.p.peng@intel.com>,
	"nikunj@amd.com" <nikunj@amd.com>, Alexander Graf <graf@amazon.com>,
	"viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>,
	"pbonzini@redhat.com" <pbonzini@redhat.com>,
	"yuzenghui@huawei.com" <yuzenghui@huawei.com>,
	"jroedel@suse.de" <jroedel@suse.de>,
	"suzuki.poulose@arm.com" <suzuki.poulose@arm.com>,
	"jgowans@amazon.com" <jgowans@amazon.com>,
	Yilun Xu <yilun.xu@intel.com>,
	"liam.merwick@oracle.com" <liam.merwick@oracle.com>,
	"michael.roth@amd.com" <michael.roth@amd.com>,
	"quic_tsoni@quicinc.com" <quic_tsoni@quicinc.com>,
	"richard.weiyang@gmail.com" <richard.weiyang@gmail.com>,
	Ira Weiny <ira.weiny@intel.com>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
	Xiaoyao Li <xiaoyao.li@intel.com>,
	"qperret@google.com" <qperret@google.com>,
	"kent.overstreet@linux.dev" <kent.overstreet@linux.dev>,
	"dmatlack@google.com" <dmatlack@google.com>,
	"james.morse@arm.com" <james.morse@arm.com>,
	"brauner@kernel.org" <brauner@kernel.org>,
	"roypat@amazon.co.uk" <roypat@amazon.co.uk>,
	"ackerleytng@google.com" <ackerleytng@google.com>,
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
	"pgonda@google.com" <pgonda@google.com>,
	"quic_pderrin@quicinc.com" <quic_pderrin@quicinc.com>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"will@kernel.org" <will@kernel.org>,
	"hch@infradead.org" <hch@infradead.org>
Subject: Re: [RFC PATCH v2 00/51] 1G page support for guest_memfd
Message-ID: <20250516130950.GA530183@ziepe.ca>
References: <cover.1747264138.git.ackerleytng@google.com>
 <ada87be8b9c06bc0678174b810e441ca79d67980.camel@intel.com>
 <CAGtprH9CTsVvaS8g62gTuQub4aLL97S7Um66q12_MqTFoRNMxA@mail.gmail.com>
 <24e8ae7483d0fada8d5042f9cd5598573ca8f1c5.camel@intel.com>
 <aCaM7LS7Z0L3FoC8@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aCaM7LS7Z0L3FoC8@google.com>

On Thu, May 15, 2025 at 05:57:57PM -0700, Sean Christopherson wrote:

> You're conflating two different things.  guest_memfd allocating and managing
> 1GiB physical pages, and KVM mapping memory into the guest at 1GiB/2MiB
> granularity.  Allocating memory in 1GiB chunks is useful even if KVM can only
> map memory into the guest using 4KiB pages.

Even if KVM is limited to 4K the IOMMU might not be - alot of these
workloads have a heavy IO component and we need the iommu to perform
well too.

Frankly, I don't think there should be objection to making memory more
contiguous. There is alot of data that this always brings wins
somewhere for someone.

> The longer term goal of guest_memfd is to make it suitable for backing all VMs,
> hence Vishal's "Non-CoCo VMs" comment.  Yes, some of this is useful for TDX, but
> we (and others) want to use guest_memfd for far more than just CoCo VMs.  And
> for non-CoCo VMs, 1GiB hugepages are mandatory for various workloads.

Yes, even from an iommu perspective with 2D translation we need to
have the 1G pages from the S2 resident in the IOTLB or performance
falls off a cliff.

Jason
