Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B8C62E11D4
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 22:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749853871; cv=none; b=vDy5VINzdFLJtlAiKoOc2mQAE0jbIySx5DC2o0wTi/6iOd+KKOkkWL2Ecwgc/qveEZHyhQhWFgLb4F/Ru4wREIV+k9tMM3pvQ35X6plcBHaK9JD9w2R114ivpvLNDLPUwiYsyWfAv+MdTozJMowXDys6SsXKrRZ0dKUi9HHvYP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749853871; c=relaxed/simple;
	bh=Nk6jcOHWQ9XN0LoO6Grgu9gvLJ9kvVaW7vPp8steIhM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mMuOOCIwJNTQuAlGNlHIU7l17t/QNYflb2HoqWfAmaCqELnKJPdRQQkjyAsgFdiRU/OwKAgc3eaabX9XwmQvFXR+D5j9mLrphW+T9PWEnwwdeNXy3VHaZ2r1zfzVar0JXt9hJKcWcTmfP7V3ZKtu/15NLgkmELOoD/aObgvHKf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ICbcrucE; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ICbcrucE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749853867;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vUxRtcllWvBP7izZoQXjnv9sUomqrHqol6vrBAIVRAY=;
	b=ICbcrucEyneLQMxFZfLvlKCCswOtGzhkBN7cIdR1eWExkodCAikiAcTiXPT0xpxfAoc3q5
	6BJ3JkgwTxEMdZVvpt4FTYnink/7FAYqtobk+x44N6bKDeNTUlhDN4wPCk4+vZ3gWElE2o
	liMhu4ywcviw565jMeB20l2dOLMFAXc=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-344-7tYVKXp2OTiFEPUcpS4FJA-1; Fri, 13 Jun 2025 18:31:06 -0400
X-MC-Unique: 7tYVKXp2OTiFEPUcpS4FJA-1
X-Mimecast-MFC-AGG-ID: 7tYVKXp2OTiFEPUcpS4FJA_1749853865
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3ddccf64e44so3466605ab.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 15:31:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749853865; x=1750458665;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vUxRtcllWvBP7izZoQXjnv9sUomqrHqol6vrBAIVRAY=;
        b=lL80Ho3bYm0PhPVAEtire9O9cbUS7DJGH8aOSSWz7jRZ9t5oQPwsc286Cr8Y0F7Ujj
         x2X3Pnucn8tHSMwhb4tdDAzk3nrQxr56PGwEFBPCevwgEZz6wKSoi66dDElFgW00TwYQ
         txqNPTVgcB170xCSOrw+A2wCUxnmX7GmCTOpGMJlcv979L5703S1iIzj0peJFXjNz9Co
         5XVZcuioj1eLFR3oHuB1B2w4LyAQq7TJYOLarf7DWZ5RvS08mMftN5yF/gHmJTMKl/E3
         6KnGOXccsRGQbBkGFo4964M+xcnG1uuC+cHAxC8jaFoZq65QVzcr9/yHtlpJtwsVglU5
         XXHA==
X-Gm-Message-State: AOJu0YzFq7tPWo4hjAjSv7HdcPOtCgloKaFs8yVsBLAV+UfnVoRhECVO
	52muZT8xq7X+etVr2/YWxvGlTgi1XJgVVmYQMtgLf7hcG6Z19m8xPMS1FZEqHmUtyuVoAApcki7
	FE3cpj1Ew0ZiMZ9maAmacxuAytbxu6ZBytoSNTyI8yidj7C5LQg/RfUYFmKzJZksjAA==
X-Gm-Gg: ASbGncsaqF2AVkI3mQmes9yL+gvkoMCADn5wDIuBdA5Casf3gYVTZtTkYD2WcS33A68
	cBuTXMy+N6SUiImVtdfZ2hsSsqVpDScZtev8APtafK4ldBlOUAwnXsVtxvs90jP6lyJU4PWvNOs
	3oTHo2pk/FnYy+whCBIU0nG2zwx6tPoh6t5kF7aZPykK1gshGoFZIJcoPcKaxVNmjGXSvysLXmh
	Ts8eJt/QTAODlfiav85dWc/B7WM+ykRZGtOenuTX5IJP0dhZffKxER/PQC2oJGLjEhvqmZC1GoL
	DmNKTyGUrZDUbtyLIHsxfn+fCw==
X-Received: by 2002:a05:6e02:1c25:b0:3db:72f7:d7c3 with SMTP id e9e14a558f8ab-3de07da97f8mr4097195ab.3.1749853865245;
        Fri, 13 Jun 2025 15:31:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELB0lUo8vO+HVO2w9/4P3nC6P0X2L0fugmGtGj/i2U/ixkoMFD+NrQuKaOoRdrPP2V26s/MA==
X-Received: by 2002:a05:6e02:1c25:b0:3db:72f7:d7c3 with SMTP id e9e14a558f8ab-3de07da97f8mr4097075ab.3.1749853864853;
        Fri, 13 Jun 2025 15:31:04 -0700 (PDT)
Received: from redhat.com ([38.15.36.11])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3de019b44b3sm5340065ab.10.2025.06.13.15.31.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 15:31:03 -0700 (PDT)
Date: Fri, 13 Jun 2025 16:31:00 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Jacob Pan <jacob.pan@linux.microsoft.com>
Cc: linux-kernel@vger.kernel.org, "iommu@lists.linux.dev"
 <iommu@lists.linux.dev>, "Liu, Yi L" <yi.l.liu@intel.com>, "jgg@nvidia.com"
 <jgg@nvidia.com>, Zhang Yu <zhangyu1@microsoft.com>, Easwar Hariharan
 <eahariha@linux.microsoft.com>, Saurabh Sengar
 <ssengar@linux.microsoft.com>
Subject: Re: [PATCH v2 1/2] vfio: Prevent open_count decrement to negative
Message-ID: <20250613163100.7efa6528.alex.williamson@redhat.com>
In-Reply-To: <20250603152343.1104-1-jacob.pan@linux.microsoft.com>
References: <20250603152343.1104-1-jacob.pan@linux.microsoft.com>
Organization: Red Hat
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi Jacob,

On Tue,  3 Jun 2025 08:23:42 -0700
Jacob Pan <jacob.pan@linux.microsoft.com> wrote:

> When vfio_df_close() is called with open_count=0, it triggers a warning in
> vfio_assert_device_open() but still decrements open_count to -1. This
> allows a subsequent open to incorrectly pass the open_count == 0 check,
> leading to unintended behavior, such as setting df->access_granted = true.
> 
> For example, running an IOMMUFD compat no-IOMMU device with VFIO tests
> (https://github.com/awilliam/tests/blob/master/vfio-noiommu-pci-device-open.c)
> results in a warning and a failed VFIO_GROUP_GET_DEVICE_FD ioctl on the
> first run, but the second run succeeds incorrectly.
> 
> Add checks to avoid decrementing open_count below zero.

The example above suggests to me that this is a means by which we could
see this, but in reality it seems it is the only means by which we can
create this scenario, right?

Why does VFIO_GROUP_GET_DEVICE_FD fail on the first iteration?  It
seems like things are pretty broken, we won't have access_granted set,
but I don't spot why the ioctl fails.

Doesn't this also (begin) to fix 6086efe73498 as well?  I think that
introduced skipping vfio_df_open() entirely for noiommu devices.  It
seems like this should have a Fixes: tag and the warning in the
assertion was unreachable until 608... so maybe it should be linked
here.  Thanks,

Alex


> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Reviewed-by: Yi Liu <yi.l.liu@intel.com>
> Signed-off-by: Jacob Pan <jacob.pan@linux.microsoft.com>
> ---
> v2: Added Reviewed-by tags
> ---
>  drivers/vfio/vfio_main.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
> index 1fd261efc582..5046cae05222 100644
> --- a/drivers/vfio/vfio_main.c
> +++ b/drivers/vfio/vfio_main.c
> @@ -583,7 +583,8 @@ void vfio_df_close(struct vfio_device_file *df)
>  
>  	lockdep_assert_held(&device->dev_set->lock);
>  
> -	vfio_assert_device_open(device);
> +	if (!vfio_assert_device_open(device))
> +		return;
>  	if (device->open_count == 1)
>  		vfio_df_device_last_close(df);
>  	device->open_count--;

