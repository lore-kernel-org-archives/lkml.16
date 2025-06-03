Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF27C22FF22
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 13:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748957921; cv=none; b=lWkAJUzr9K3mwObfYLFT4vUo2nxL3SDrRHJl3GlM9Pj3MLWza+Sn5Gdea5NSL576filmP6H142Z07gtSF/hNoFX7fUp+KO9RwhP58TobUDdUf4vrfRvA/xAGcEFqsCMYufmst3J2Rygnw19oeE+BlPn+KsW5/707iRslHp24lQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748957921; c=relaxed/simple;
	bh=FJcBKj5IOAP4zBarRXTdKou4i5eFgR4+RYmNBOBDDmA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hbXVAkjrSr2T+9nMGXF3us/5wV2TLFFt6cWnbBy82gov9ug5ThJZwuWcA4PFQSmdKV+hPX21InMb1n6BIwvxPXE3V5KH/Y7hVXt2QDwNadlut+EC4YgsqMtAexdTGeqUYLlxfwwY3ELjXamD7MgO5mgMPkQRwesR+qKh2iGYdRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=LvjshFQd; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="LvjshFQd"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6fad4a1dc33so40437906d6.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 06:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1748957919; x=1749562719; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2YoBzO9/Vr83m9kWgElnZwYJY0cXKTy7GFrgVmwfY4k=;
        b=LvjshFQdboJOpxr+fB+fWrWhsunI9eeF4CbIQoy588EWAkzdFlgW2ulud0QOLPt26s
         6+PgfGnnw/oyKJHU0QVcB0yUH5b4yx0aMkjI6rJE/SCLq97nnZ5KM0QVqvtvDGC5nHyu
         Wwzk7vssC4s8Jw6WaGJUPLroYsdOKq9vO3byex6fd5NgL0ljJeWOP0neFYHZBQdh9aVl
         1yVrZLUig/vc1Srd4fTVyB1w/JIumebqwlNiowovwMIVaZvQjn1RG7c+bPOFaykPwtLe
         b7nIMyfXi+EC/zVXO77jX2CahfKKPwlV7rE9q+zpmLUMzSPkZ31zjIh9aiG+GXaKR1OW
         QVkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748957919; x=1749562719;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2YoBzO9/Vr83m9kWgElnZwYJY0cXKTy7GFrgVmwfY4k=;
        b=GrbD7h8xJmT9FoqiU0A7gG7PG/DbAUAXTKrI5btyCztzfUAxTQFpJRV1zlNT3ENKjf
         lxXzIjoZ+NEhSoZpnu6cl+UryATgSfkmQ+7TBz5QJet+RVoKj3fla19BXqq6Ge5MOJZ7
         Kewhdej9r2qro5TOb564lZ12yZcwaNNo/I/nXUu/lOsSTEXKBIiZsqpBbkHueZRaqajr
         td24SHCe+ts9uZtQ22wPzLvOmQOnucI0LFp6bkwQaxuxq8mNmu3f5YT1CX3a6kACKS1r
         tYJUX+gYIkf8VPh/ZV5sy9sarbloRQIl5xssqHY/Tnkm2H4KItu4rNx9dcoBoaYzKqWm
         Cu4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUKKFumfa5Be0TYylFd+GzSW8XsLnwmZ0x86dd35lM52Jv9mHaBG6xyCKEImEPNF5FkpTEBTmsL1Z46MwY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMv/UehAtNFb+XpMmTvwL069Uw2FbJzERnLJQ2Sgd2VNDUpD6m
	xz79izDKJa16fdR5nsFRFrWsqLLtTtnbBk9Za9bIhJV/Mm4whhZHBVwf+hk7oA0moNU=
X-Gm-Gg: ASbGncs3LjbSDNAHz22ZHulK+e5bJxh/GxXagV2tD34wgP8IcFUir44yr9f+p1GWimV
	Fbc9OxsEe1NJIdnOBfApikR6iR3cG1p7mEbvnlFu2TBUCbqbIsD16ss9zWAAkWAlVmWHik4+9ci
	4oXYWc8O3KVd68s+ceI/W4eXokGHFxoAy8SF1R8EksuZQKUlFD+MJ3DnBCXc1RixXMD9lXYybYy
	FdMV6wzSMqDwXmhrvVZg7406dajGPW0aCfN6bYHQOWw7+UEVZSzk2ha1Z16P0Wjr8yt26cjQSm5
	42whVBg/bYWnv2PllA8Wiqt99iVijYzsZbSp76o4zkxEqpM4wMWuj16Sct6Fdr68FThK63XIqqy
	UNGuf0DrxsACvFWuvsIW5PbIKAV8=
X-Google-Smtp-Source: AGHT+IFNNgr1gOgNIDIKGgPc3bhuHOtoZeZOnCuhf1c+LALW25Lvqo21bVxhfooiSUL50e5IoEYUCA==
X-Received: by 2002:a05:6214:194d:b0:6f5:3a79:a4b2 with SMTP id 6a1803df08f44-6fad191b357mr264142056d6.14.1748957918424;
        Tue, 03 Jun 2025 06:38:38 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fac6e1a681sm80140746d6.98.2025.06.03.06.38.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 06:38:37 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uMRqf-00000001h6M-29EG;
	Tue, 03 Jun 2025 10:38:37 -0300
Date: Tue, 3 Jun 2025 10:38:37 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Alistair Popple <apopple@nvidia.com>
Cc: linux-mm@kvack.org, gerald.schaefer@linux.ibm.com,
	dan.j.williams@intel.com, willy@infradead.org, david@redhat.com,
	linux-kernel@vger.kernel.org, nvdimm@lists.linux.dev,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-xfs@vger.kernel.org, jhubbard@nvidia.com, hch@lst.de,
	zhang.lyra@gmail.com, debug@rivosinc.com, bjorn@kernel.org,
	balbirs@nvidia.com, lorenzo.stoakes@oracle.com,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-cxl@vger.kernel.org, dri-devel@lists.freedesktop.org,
	John@groves.net
Subject: Re: [PATCH 05/12] mm: Remove remaining uses of PFN_DEV
Message-ID: <20250603133837.GF386142@ziepe.ca>
References: <cover.541c2702181b7461b84f1a6967a3f0e823023fcc.1748500293.git-series.apopple@nvidia.com>
 <ee89c9f307c6a508fe8495038d6c3aa7ce65553b.1748500293.git-series.apopple@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ee89c9f307c6a508fe8495038d6c3aa7ce65553b.1748500293.git-series.apopple@nvidia.com>

On Thu, May 29, 2025 at 04:32:06PM +1000, Alistair Popple wrote:
> PFN_DEV was used by callers of dax_direct_access() to figure out if the
> returned PFN is associated with a page using pfn_t_has_page() or
> not. However all DAX PFNs now require an assoicated ZONE_DEVICE page so can
> assume a page exists.
> 
> Other users of PFN_DEV were setting it before calling
> vmf_insert_mixed(). This is unnecessary as it is no longer checked, instead
> relying on pfn_valid() to determine if there is an associated page or not.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/gpu/drm/gma500/fbdev.c     |  2 +-
>  drivers/gpu/drm/omapdrm/omap_gem.c |  5 ++---
>  drivers/s390/block/dcssblk.c       |  3 +--
>  drivers/vfio/pci/vfio_pci_core.c   |  6 ++----
>  fs/cramfs/inode.c                  |  2 +-
>  include/linux/pfn_t.h              | 25 ++-----------------------
>  mm/memory.c                        |  4 ++--
>  7 files changed, 11 insertions(+), 36 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
