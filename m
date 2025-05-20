Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB621FFC54
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 15:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747755597; cv=none; b=QjPBagUqQB614PXuwTnCrgHLwm7o1b4bn6lVUOf16oFAAxvNpmaSku8ty93AVhYjw6bv5LOYEpKZtkLu6EfHF6fILgj9i++d7NH/UgGG8OBGxV3fEz50UZmxTtX/StfKQJtuhFTTzPra6bMt/d4eg8jUDuUovE0PDs3+ndSIJMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747755597; c=relaxed/simple;
	bh=Gp2hypGim6KPCTrYggCBys1rov6/WLmvezT/1tOHcoI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Y3X38Rmlz3lrtCXnm3J9WQyFsG4lJHz9Z+JdBmcZ1Zrbz4vBEaoH9m3afS/7+V52soxWhcsEe8S71CKB0PE/5m2hLkHnT8TKPqlsnMdD/TihgaQ/cLD/pTK1vdgUhZUTNL0lUHTqG9LKwEKsZdSLtnuoKU7/4AixA5lwdaVe4ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Rde3Ghgo; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Rde3Ghgo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747755593;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Qgw858aBfnJTsWLcya2ZIZLM65pgyUp/UWTU3v5tX6E=;
	b=Rde3Ghgo0iWe1ePZs0X/WJLS2wRQxw/N+G2reHsFqITVV25KLgeK/JO/xPwsKhUIfKwVZN
	l0eLg6nlbnQkXb9ksNdMsWuU6z0eW5wUpNA0iDmlM4aXxuz4saRn7S8Joyj5nbYg6KAZrX
	fZeNwsL7O6fE/rEAGo5XwkC37lDBssQ=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-472-fP7_FCLFPM-Ho9X_LMFWUQ-1; Tue, 20 May 2025 11:39:51 -0400
X-MC-Unique: fP7_FCLFPM-Ho9X_LMFWUQ-1
X-Mimecast-MFC-AGG-ID: fP7_FCLFPM-Ho9X_LMFWUQ_1747755591
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-85b5ea50d28so90725539f.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 08:39:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747755591; x=1748360391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qgw858aBfnJTsWLcya2ZIZLM65pgyUp/UWTU3v5tX6E=;
        b=iRJW2o3SUTeFrkoCaLpJPumJ1ZzaRBWVi7aKjEAX/ObzWXc0+8srbN3GIVKC1517vb
         zLZw/I5sB30AvkhG1wKKvM77jGG4HOEI/urTlqQ1Jl5Y108wZJpTj9f//b20fwWRrlEa
         CpQYVrw1DVFZ8ltMhiFZSzou2nkEkpiNg85bgTe3tjkJY0Xf6WxM+m4GvQ0abA6NYyV6
         C8GNkowYu2n2D3yaTnd4tEr/3GyhbT+fNn7qG9P0Qa0p4z4Ek8NPJ8BZ6MtYzqNDPjGe
         mLOuk8nzlmqy7W58uaqZnR6TWFpxQ3h3uKTS38y1jpKsKfn1yysKb6zDKHlj9jC4yEk9
         e0xA==
X-Forwarded-Encrypted: i=1; AJvYcCXI+UadTweC+Yo4oHGtpoJF895iOcD0vcDcWDGSMuWtB1c8LsaXHnYSTRT2D8DyTa9kU8wR/RdzOuQ8Dm0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZTtZTCPeACQYQeGCZOVgBrUqKSYQJtuu3XyZXvJwcOD4HVQOM
	F35sdMJOxhuNQfcdj1txKEXUbtaogZsNte4IxDF47ZDmYJDhSxIuf1XXWFKPiro9yME/AzTgkbU
	3tMNU5+vXspfsVLw+9mWsyzKfgB+BHLp+tAaJNu5EginweITCQ3LkX3TMpOt+P8XFYg==
X-Gm-Gg: ASbGncssAYNv8owmViTeRysulpEY7q/wfDPFv/dCkHAPoEBg9lAvmMWcB27ChOhnR5F
	em0UBFIHWNl0XaJuvFM8+ikPB9+4ACokUdjMPHm9Wio0+cEw0DHzqtmixaIqu8KM0w7SPl5K2/1
	TJjDHKSuRiZ8Zc22x3ieCgZpo3ZBjzQWkboWIakwYm24hJBMsQ3QsiJ8lmZJT6sfv3yRWPQUrEC
	5/GZxPo3sF2smLQOe1nFrYRd3MYBCndcL3tQ8NEfBvkrxq9cXPAxa4X7nOECDAL65OvPzoXlt6p
	HUF9UIQPpM7/BiY=
X-Received: by 2002:a05:6e02:3810:b0:3dc:787f:2bce with SMTP id e9e14a558f8ab-3dc787f2eb9mr15376435ab.2.1747755591083;
        Tue, 20 May 2025 08:39:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFwOHbonV8qiSQBLnfXYbx9Prhpc3EL9LanZ3fzLOv7nzBzsY/s+c9jTUwTOnix05087SeCPw==
X-Received: by 2002:a05:6e02:3810:b0:3dc:787f:2bce with SMTP id e9e14a558f8ab-3dc787f2eb9mr15376255ab.2.1747755590555;
        Tue, 20 May 2025 08:39:50 -0700 (PDT)
Received: from redhat.com ([38.15.36.11])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4fbcc3b19aasm2276374173.52.2025.05.20.08.39.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 08:39:49 -0700 (PDT)
Date: Tue, 20 May 2025 09:39:48 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Longfang Liu <liulongfang@huawei.com>
Cc: <jgg@nvidia.com>, <shameerali.kolothum.thodi@huawei.com>,
 <jonathan.cameron@huawei.com>, <kvm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linuxarm@openeuler.org>
Subject: Re: [PATCH v8 0/6] bugfix some driver issues
Message-ID: <20250520093948.7885dbe0.alex.williamson@redhat.com>
In-Reply-To: <20250510081155.55840-1-liulongfang@huawei.com>
References: <20250510081155.55840-1-liulongfang@huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 10 May 2025 16:11:49 +0800
Longfang Liu <liulongfang@huawei.com> wrote:

> As the test scenarios for the live migration function become
> more and more extensive. Some previously undiscovered driver
> issues were found.
> Update and fix through this patchset.
> 
> Change v7 -> v8
> 	Handle the return value of sub-functions.
> 
> Change v6 -> v7
> 	Update function return values.
> 
> Change v5 -> v6
> 	Remove redundant vf_qm_state status checks.
> 
> Change v4 -> v5
> 	Update version matching strategy
> 
> Change v3 -> v4
> 	Modify version matching scheme
> 
> Change v2 -> v3
> 	Modify the magic digital field segment
> 
> Change v1 -> v2
> 	Add fixes line for patch comment
> 
> Longfang Liu (6):
>   hisi_acc_vfio_pci: fix XQE dma address error
>   hisi_acc_vfio_pci: add eq and aeq interruption restore
>   hisi_acc_vfio_pci: bugfix cache write-back issue
>   hisi_acc_vfio_pci: bugfix the problem of uninstalling driver
>   hisi_acc_vfio_pci: bugfix live migration function without VF device
>     driver
>   hisi_acc_vfio_pci: update function return values.
> 
>  .../vfio/pci/hisilicon/hisi_acc_vfio_pci.c    | 121 +++++++++++++-----
>  .../vfio/pci/hisilicon/hisi_acc_vfio_pci.h    |  14 +-
>  2 files changed, 101 insertions(+), 34 deletions(-)
> 

Applied to vfio next branch for v6.16.  Thanks,

Alex

