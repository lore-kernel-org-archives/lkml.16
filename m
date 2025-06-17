Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B602E2ECD3D
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 15:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750174758; cv=none; b=UkdcphnvRZXLw2ux+KO9ea5Iy1XormiOL3i6B8z+QX/UZND60X2a/f/CqR1uM4T3jfk5hRASoXoylWI2CCBHF0l2NU0h27pHF/aCafppB/zF/FvG13tll0CqYMOW8E/m1M6hkvWEwHNNDP8QEe/hRQw+TGM6KmJPv6ZCyGg7kqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750174758; c=relaxed/simple;
	bh=zfy6EHe5CDOTdqnNoMOjf4o/PnjkL+mkfT4gkUjbFyk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n+SFsph0S0iq9lh4Zp3jCSkDf4SFQHKxRxBdbBHDgeEKTkyKUcrYmykUNcnRkgcSuyZkHBLoSvlU9fPQiriEBOB82z75TIVArZGNpCADH7iuvglDLEMRcKOb/49IiuFenPoCxQkzwnu4Jrx4Mp+fvoljo0nHraN6W17DmeyZLiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WpShGJTa; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WpShGJTa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750174755;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bYA4vNkR1STXIkkbeACF7/tlzHC3egoFZWTXFv+IW1c=;
	b=WpShGJTaJ99/b5uTM0YAWWv+7PAqLiNlQrdFQ7p5uSgYHJS6mVQZaSnL4A3jDAOsJS49u4
	33VRukNojiaFc8YQmE2dh1pSiF0vDEH+0lMqblNsCLR3FUsfEzaavSlIi9l58SlpzUrHQN
	A5jqJiC3M3dTzEdf/xJyZGZ6MmGkiaE=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-68-_VhuvVnoP_6G48f2E2yZFw-1; Tue, 17 Jun 2025 11:39:14 -0400
X-MC-Unique: _VhuvVnoP_6G48f2E2yZFw-1
X-Mimecast-MFC-AGG-ID: _VhuvVnoP_6G48f2E2yZFw_1750174753
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4a585dc5f6aso128335991cf.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 08:39:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750174753; x=1750779553;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bYA4vNkR1STXIkkbeACF7/tlzHC3egoFZWTXFv+IW1c=;
        b=v//O/xNFUwdKgXVyFWXST4dOkTGWWV4ttsrWSPRCppX2m2hH/SfR/aASa8/QXDoDQL
         7/pxjFzPmsXKOV9rF3CmFYz7PtTWJ0DtGnvNseKq6ABtJzhmwzVe/yCdkupFE0o0n0Hv
         DyRWUSa7HAFXdGO4c6kaUUxUXxNjtkwuua003GwZr6FfyhOjnLj0LxdPVhlLRmJX/9oB
         ffFVVqf4SPKqFm4cuqurUSlsSsxdJ5bWvUDUcnrhCsku/vbcxLx+bh4AgYa6HRjEMa0T
         97kLzE0EiF79reaWNE2npflA8MUjGsmKKwfOFjcgCPj/QjMSKLjJYSD8kOuk0sLmqSf4
         Ljgw==
X-Gm-Message-State: AOJu0YzMx34h2/clAt7UI36GTS/tZvUOD9rqqPwaetxkTRVaTmEyG3oW
	HX4xh8MQ8IW0ITXO7nLbUHo2lHQJaPmNlQQyZ3UzJQr5/LK7ELn3L+rGwC97XuGnlvypbUfl7Jb
	C01OCAPoiXhVsXJtwBlND4c1V6rGB93TaDp0zeztShpSpafJprDBamHL8F4G1rl/z9w==
X-Gm-Gg: ASbGnctkdAjiRHUBnHNT6JQ5gcwW8dKDCEa//sffW9xKx/aEYi61ZzNEvKjR3G7bPIi
	ccIdfnwsZsXRCePU5p1Yp4oMW+OZ9Pv4RR/sK7GE3R+RmwaL7yx43jyO/RaNniRF6f+BB+IMf3q
	C7VtN+ObsG7qN9Bxcenikdq44Ujqj8JLlTCT9j6E74//inAOZBama2GaLi5WrtgTRIEsDtH2bQP
	7B4Xn+GZG2UGRBQl565PBwYNW+J9jUVZD7lDgyHI1nDobqWroknVB2he72LBbGJbH2ODnoWBsmP
	9NFC1l3N/8dRQw==
X-Received: by 2002:a05:622a:446:b0:4a5:a4e9:1333 with SMTP id d75a77b69052e-4a73c656171mr237038031cf.49.1750174752358;
        Tue, 17 Jun 2025 08:39:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEPIM43/kJAMEA2z+DJQLz3Nfj5J/K0A7FFjpnjYR1h2Y4Z5A/KK2hrX/uNeaSpJOy3GeFrSQ==
X-Received: by 2002:a05:622a:446:b0:4a5:a4e9:1333 with SMTP id d75a77b69052e-4a73c656171mr237037031cf.49.1750174751109;
        Tue, 17 Jun 2025 08:39:11 -0700 (PDT)
Received: from x1.local ([85.131.185.92])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a72a308f55sm62628021cf.28.2025.06.17.08.39.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 08:39:10 -0700 (PDT)
Date: Tue, 17 Jun 2025 11:39:07 -0400
From: Peter Xu <peterx@redhat.com>
To: kernel test robot <lkp@intel.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, kvm@vger.kernel.org,
	oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Alex Williamson <alex.williamson@redhat.com>,
	Zi Yan <ziy@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
	Alex Mastro <amastro@fb.com>, David Hildenbrand <david@redhat.com>,
	Nico Pache <npache@redhat.com>
Subject: Re: [PATCH 4/5] vfio: Introduce vfio_device_ops.get_unmapped_area
 hook
Message-ID: <aFGMG3763eSv9l8b@x1.local>
References: <20250613134111.469884-5-peterx@redhat.com>
 <202506142215.koMEU2rT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202506142215.koMEU2rT-lkp@intel.com>

On Sat, Jun 14, 2025 at 10:46:45PM +0800, kernel test robot wrote:
> Hi Peter,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on akpm-mm/mm-everything]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Peter-Xu/mm-Deduplicate-mm_get_unmapped_area/20250613-214307
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
> patch link:    https://lore.kernel.org/r/20250613134111.469884-5-peterx%40redhat.com
> patch subject: [PATCH 4/5] vfio: Introduce vfio_device_ops.get_unmapped_area hook
> config: sh-randconfig-002-20250614 (https://download.01.org/0day-ci/archive/20250614/202506142215.koMEU2rT-lkp@intel.com/config)
> compiler: sh4-linux-gcc (GCC) 12.4.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250614/202506142215.koMEU2rT-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202506142215.koMEU2rT-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    drivers/vfio/vfio_main.c: In function 'vfio_device_get_unmapped_area':
> >> drivers/vfio/vfio_main.c:1367:24: error: implicit declaration of function 'mm_get_unmapped_area'; did you mean 'get_unmapped_area'? [-Werror=implicit-function-declaration]
>     1367 |                 return mm_get_unmapped_area(current->mm, file, addr,
>          |                        ^~~~~~~~~~~~~~~~~~~~
>          |                        get_unmapped_area
>    cc1: some warnings being treated as errors
> 
> 
> vim +1367 drivers/vfio/vfio_main.c
> 
>   1356	
>   1357	static unsigned long vfio_device_get_unmapped_area(struct file *file,
>   1358							   unsigned long addr,
>   1359							   unsigned long len,
>   1360							   unsigned long pgoff,
>   1361							   unsigned long flags)
>   1362	{
>   1363		struct vfio_device_file *df = file->private_data;
>   1364		struct vfio_device *device = df->device;
>   1365	
>   1366		if (!device->ops->get_unmapped_area)
> > 1367			return mm_get_unmapped_area(current->mm, file, addr,
>   1368						    len, pgoff, flags);
>   1369	
>   1370		return device->ops->get_unmapped_area(device, file, addr, len,
>   1371						      pgoff, flags);
>   1372	}
>   1373	

This is "ARCH_SH + VFIO + !MMU".. I'll make sure to cover this config when
repost.  I'll squash below into the patch:

diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
index 19db8e58d223..cc14884d282f 100644
--- a/drivers/vfio/vfio_main.c
+++ b/drivers/vfio/vfio_main.c
@@ -1354,6 +1354,7 @@ static int vfio_device_fops_mmap(struct file *filep, struct vm_area_struct *vma)
        return device->ops->mmap(device, vma);
 }
 
+#ifdef CONFIG_ARCH_SUPPORTS_HUGE_PFNMAP
 static unsigned long vfio_device_get_unmapped_area(struct file *file,
                                                   unsigned long addr,
                                                   unsigned long len,
@@ -1370,6 +1371,7 @@ static unsigned long vfio_device_get_unmapped_area(struct file *file,
        return device->ops->get_unmapped_area(device, file, addr, len,
                                              pgoff, flags);
 }
+#endif
 
 const struct file_operations vfio_device_fops = {
        .owner          = THIS_MODULE,
@@ -1380,7 +1382,9 @@ const struct file_operations vfio_device_fops = {
        .unlocked_ioctl = vfio_device_fops_unl_ioctl,
        .compat_ioctl   = compat_ptr_ioctl,
        .mmap           = vfio_device_fops_mmap,
+#ifdef CONFIG_ARCH_SUPPORTS_HUGE_PFNMAP
        .get_unmapped_area = vfio_device_get_unmapped_area,
+#endif
 };
 
 static struct vfio_device *vfio_device_from_file(struct file *file)

-- 
Peter Xu

