Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DAA928A737
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 20:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750190485; cv=none; b=CbfLCUPaB/ZRlvbto30y69t35Ep8oTdqb39PmKxa7DSOjIwlu64etyHGqPUpSfHz+5FFv6voDq9e0Frta49k4UOBv6c9SzFmfbg7y8YTdqVUJgr+ARR4c7ToyGodLEPlJTl0Qft2AcEFea/k/JeZilsQ+R5X/10IxQr3DiAETX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750190485; c=relaxed/simple;
	bh=9qlryhIHS0Cc2X2BC+ex+dW7dnay/Akl42iZ5dW4L3c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m2NwsXMCBxXVjeZLxclMvzKXWuTuwBA1pgMjOfa9xszq46v3t4kTwa4w10Gp/Z3rQ64ZY+1q6tyif/QyWKHiuy4XWhiIhrlw6J54Dwhjtuc20pSbbxcs5M2r3tA55tsU1V990tu1Nna1pl+S1QwZjm9B0zsPUHHAcwcUuBpTewk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Izo9Lf2a; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Izo9Lf2a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750190482;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0Dm/YTY2gnD+c/gsISARFM2WYB8H4Eho9ZAM8VM6ubM=;
	b=Izo9Lf2aRuwAaoeDYJtN9dVUxN+ws7MxI7mGIB72hux1TJ7+S3pOUuSdTVM9SnFcikN298
	2A/b3FZdrEs5+17WXK1BmA/3S4sLp/pw3Vagmz5kvn1QL2PiX7PMpT4HUvtKcnKDZx2zaa
	+c98ThmahiVslaKF/Nf1nVWWp2aWAyA=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-649-cQ3T6vEoOwSv6ktlD3R0tA-1; Tue, 17 Jun 2025 16:01:18 -0400
X-MC-Unique: cQ3T6vEoOwSv6ktlD3R0tA-1
X-Mimecast-MFC-AGG-ID: cQ3T6vEoOwSv6ktlD3R0tA_1750190478
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3138f5e8ff5so5912705a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 13:01:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750190478; x=1750795278;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Dm/YTY2gnD+c/gsISARFM2WYB8H4Eho9ZAM8VM6ubM=;
        b=k3UnD2IvPiy5I89hN0pqvGtbHkIdH6FfSSQ0EToYS0/7YCfykCcI3RWeVn8IDuX4Xv
         2B99YROv/YPif2dRB4lIgg7L7YxumgiQiqEJ6ANlOQla4VuxGdggG9Z3OVZv5eBaVGZn
         Wj+w+gNseWzc4ql4eK0XIDpBeXFV/PEo4MLfHf7LeWfmcUGiaehntueuqOvagl0yGan/
         jjNo+D6WqC51G4qSXVeEsZH+lmSx0pD2ABFRJPM1rNjGCJQ8X1cVZM0SXjpbjESpkYuK
         rIyssSpErQeyGnjlw5N3FFw2wS9+G2fBWBzaJr2hAJztYk7EEN/tQbCvbJIG/DXadzKu
         ovrg==
X-Forwarded-Encrypted: i=1; AJvYcCUxw2lo4sL1z7vqAoj6oUnlqKtP15wOYYycxggzM8S/AotitulV0pA+1d+lgzUMdt9O/wYIxg6kl6cZgk4=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywsi6MhY8vwaN7rSF4acNPiknkrfJ/6hn+0KV5aJDilom+iWgbX
	6deJtSVV32IOj6pH8hjD4b1/mdW3gKJxQMBYEbHK4lBvcYkRG7pYMvoavag7JrtR3MwyoBXcGkv
	pj0j5nio5xsuQnGfpVMqanFw+eUkhTnKb9d5mp5Qy9twoJeadlAKRAkuJCNoP6O/QMQ==
X-Gm-Gg: ASbGnctP6hi1JhjW/bMM9fa/sgOZzAXXuQsavBY60N3u4l1pB8CnE3I3IfZSXf2oTJe
	gap/IbrIF5+AL6PFeleatwRwtroeJO9G1t58z0OgSHGA63imV2DFBFFIZm8fMDPCTLS/nIfh/hy
	dEdliXMgP37C9r1JEMKHlAc1E5IJTEcSNsErvYZumd6QB8wpnrtlGY8ugWr+lIfhyoJyVRcx5El
	UeJZYyIrcB2N7RaroJq01iNk+/HkdzQkxeRSCzSUrJIwOgIdN16FebVeh1oTn4COY1kalD0dLXW
	Gonkc3frJirZLQ==
X-Received: by 2002:a17:90b:39cb:b0:312:ec:412f with SMTP id 98e67ed59e1d1-313f1cc6475mr24162736a91.14.1750190477478;
        Tue, 17 Jun 2025 13:01:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE9mPY0K5+r6ESf4SrogrsmJ9SaqRUqc0sTfpN2AxqMlGxDMB0nD5J8Sn7aF0/Lb+05TfOe/g==
X-Received: by 2002:a17:90b:39cb:b0:312:ec:412f with SMTP id 98e67ed59e1d1-313f1cc6475mr24162674a91.14.1750190477030;
        Tue, 17 Jun 2025 13:01:17 -0700 (PDT)
Received: from x1.local ([85.131.185.92])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3142874a4f3sm2156795a91.22.2025.06.17.13.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 13:01:16 -0700 (PDT)
Date: Tue, 17 Jun 2025 16:01:11 -0400
From: Peter Xu <peterx@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: kernel test robot <lkp@intel.com>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, kvm@vger.kernel.org,
	oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Alex Williamson <alex.williamson@redhat.com>,
	Zi Yan <ziy@nvidia.com>, Alex Mastro <amastro@fb.com>,
	David Hildenbrand <david@redhat.com>,
	Nico Pache <npache@redhat.com>
Subject: Re: [PATCH 4/5] vfio: Introduce vfio_device_ops.get_unmapped_area
 hook
Message-ID: <aFHJh7sKO9CBaLHV@x1.local>
References: <20250613134111.469884-5-peterx@redhat.com>
 <202506142215.koMEU2rT-lkp@intel.com>
 <aFGMG3763eSv9l8b@x1.local>
 <20250617154157.GY1174925@nvidia.com>
 <aFGcJ-mjhZ1yT7Je@x1.local>
 <aFHEZw1ag6o0BkrS@x1.local>
 <20250617194621.GA1575786@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250617194621.GA1575786@nvidia.com>

On Tue, Jun 17, 2025 at 04:46:21PM -0300, Jason Gunthorpe wrote:
> > I just noticed this is unfortunate and special; I yet don't see a way to
> > avoid the fallback here.
> > 
> > Note that this is the vfio_device's fallback, even if the new helper
> > (whatever we name it..) could do fallback internally, vfio_device still
> > would need to be accessible to mm_get_unmapped_area() to make this config
> > build pass.
> 
> I don't understand this remark?
> 
> get_unmapped_area is not conditional on CONFIG_ARCH_SUPPORTS_HUGE_PFNMAP?
> 
> Some new mm_get_unmapped_area_aligned() should not be conditional on
> CONFIG_ARCH_SUPPORTS_HUGE_PFNMAP? (This is Lorenzo's and Liam's remark)

Yes, this will be addressed.

> 
> So what is VFIO doing that requires CONFIG_ARCH_SUPPORTS_HUGE_PFNMAP?

It's the fallback part for vfio device, not vfio_pci device.  vfio_pci
device doesn't need this special treatment after moving to the new helper
because that hides everything.  vfio_device still needs it.

So, we have two ops that need to be touched to support this:

        vfio_device_fops
        vfio_pci_ops 

For the 1st one's vfio_device_fops.get_unmapped_area(), it'll need its own
fallback which must be mm_get_unmapped_area() to keep the old behavior, and
that was defined only if CONFIG_MMU.

IOW, if one day file_operations.get_unmapped_area() would allow some other
retval to be able to fallback to the default (mm_get_unmapped_area()), then
we don't need this special ifdef.  But now it's not ready for that..

-- 
Peter Xu

