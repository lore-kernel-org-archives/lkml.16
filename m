Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58306207DE5
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 16:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744043163; cv=none; b=rNadAxzzidDsaTHmLCF4zZm+uvkAasWYHlesmdOZ8ZxF3QbKX0XPOyw+fFvt+QjqzFx97Ll/U1/zudoG007eCG/TARmFhc87N7Hw2PB+OQcqOCsgWL/mp5X4s/my/Z4cyKicchw3bVx6RC6JAZUQ4aYmpxpYHaUPOwKm+5zmGj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744043163; c=relaxed/simple;
	bh=GMvaB3Mzb4QuxEqJ77ptGlToNSrLtUC7nn+mY9oNs94=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GcjfVqaLQMp1GP/hctXtoGbArMOcys29tpZi1PVUCQrfR9ehxWvuAHF7Ldao3hbLqRG8R+yzVBgx4Tb/lrpmLGNronO6qGQPDSUw52dyGLa75cofzPnBNe5zM7WpzfNnQbdLfw9RA9d3JTmFQB6f4IwSs4ekbaJhBbn6Zkp26f0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=BEzljU0P; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="BEzljU0P"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6e8f7019422so41266346d6.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 09:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1744043160; x=1744647960; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+iCbhKN/vcDN+xhzXNKoawXibM8X0AG5KtFkzYcV9TI=;
        b=BEzljU0P+1J2qYRt5ZjzzhsUAzbCPxZj9HMuMV0Y+AGVW3zYemgEkl7LFdssaBQgP9
         IBgjTcfbxLsjwYaLL98VrqeDgFM4753fTj4yewr8IrJV9KDZKS/LbXuAsJwNTKHQw8d4
         KyWQLCv5fU7iIo6bGYMuXdBgGthxlrsoX4dRyoBzg+MgVI8vRBG6fCfiZu29lPw7HJ5+
         /LBlTko+INhtqOKllKeog96oEkFnjTidqonNlsRWweqQFBUZiAhA4HKDEJMZQo5gw+1H
         dLXt27ThzXgy5wfeOwmmvf9PmXOpedrbnt6gLBzOxLxRF8wNHyfhy1DxUAeV47HOqR2g
         NFVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744043160; x=1744647960;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+iCbhKN/vcDN+xhzXNKoawXibM8X0AG5KtFkzYcV9TI=;
        b=ptukBYy2D5XNswb5XqL/A132CAqOdhR4JK/SqvdD5+JWRJ9qf/5VTnNYHvvv4PtAb5
         L4tolG5RRlt0Yy/Bc6H9KqBqQ0OiU3cF1inhpTS7eLKSq7mPyb+POvFhv+rJtY0oE9ny
         bxdpDS7JSGwTKF/5U19Uv5BXR4+NUKFFKiW0G2DsUx3Raf5agJpTX9xSW5s7waIMFn11
         IGwEchJWLPsX4kQJvezfb4BM458aH15yWwYiayaRQfSTdjgzBCzsN9QeuOgSJCrRSB82
         M2GgHuzKK7JcVFsrWMjC8vCuWlSjQzBU4mUdONOl4vHib3YB6fAYYtMncdWSuJYo3mRY
         dvyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVeI4vL+iafh9ZQ/87VE+TEZmKMLr7vWKlj7wZNSzqA9PBGBhkbWHfbgh3qM5poO0kvzy/DO2cbfgozEkI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhnMjDggNv5QQ6XhW8eCwSZh8M5DlK9YRHTpvSaRklHSd3YNEm
	U+RvvU90aePCieHg9EPKer1X0afLtet1ZMK/MW9V47Aip0Ion9huZq48kXGtRYQ=
X-Gm-Gg: ASbGncvv1sjw1Ow1XXxuVZJBNFlEs0TXldBNtdducMs26qifQtubz0QAVlti6RGSkrf
	zWTskW7xniHUwf26z7cdEG/VMO5CjDQxIr2x/sWY4NY6eG6SCpzPZhyMmQ/3L7Nxvp+NHdzsUSe
	xaZeaC7ncf6MSEKVpxY2t9nelryspwDSmfsf+p7Xu7BBzuNFtyI5dGzvvn67f0zCaI+dk5d9HxR
	Gua0xTuFl050/ZTKwoORqrGdzMcJbPE6ylmDD1kAzNoMuAfe3PrJR0RnICrDFZ/6gGzcNC5OvTb
	45vdtSr9A/ucJ2yvHSFcpSU2Wc5eqRIsP+FNPSwbvjPOKSDPsZvY3DnUN3NFVh/oZniQjxfEOYJ
	RSfowy9FxThKRU76/zJMrAPQ=
X-Google-Smtp-Source: AGHT+IEg3Lx6+oE5FhUSj9L70cdQ4V88WkIK1cwdCX/+smOJLjX9bN7bqLLW99Cz3jwxXg7No7sDEQ==
X-Received: by 2002:a05:6214:2aa1:b0:6e4:3eb1:2bde with SMTP id 6a1803df08f44-6f00dfd7017mr269610496d6.19.1744043159997;
        Mon, 07 Apr 2025 09:25:59 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-219-86.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.219.86])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ef0f138c5bsm60200316d6.72.2025.04.07.09.25.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 09:25:59 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1u1pIN-00000007DAh-0BNd;
	Mon, 07 Apr 2025 13:25:59 -0300
Date: Mon, 7 Apr 2025 13:25:59 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: luoqing <l1138897701@163.com>
Cc: luoqing@kylinos.cn, Leon Romanovsky <leon@kernel.org>,
	linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rdma: infiniband: Added __alloc_cq request value Return
 value non-zero value determination
Message-ID: <20250407162559.GA1562048@ziepe.ca>
References: <20250407093341.3245344-1-l1138897701@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407093341.3245344-1-l1138897701@163.com>

On Mon, Apr 07, 2025 at 05:33:41PM +0800, luoqing wrote:
> From: luoqing <luoqing@kylinos.cn>
> 
> When the kernel allocates memory for completion queue object ib_cq on the specified
> InfiniBand device dev and ensures that the allocated memory is cleared to zero,
> if the ib_cq object is not initialized to 0, a non-null value is still returned,
> and the kernel should exit and give a warning.
> Avoid kernel crash when this memory is initialized.

?? This doesn't make any sense.

> ib_mad_init_device
> 	-->ib_mad_port_open
> 		-->__ib_alloc_cq
> 			-->rdma_zalloc_drv_obj(dev, ib_cq);

rdma_zalloc_drv_obj() must return memory that is validly castable to
the struct ib_cq.

> When ib_cq is zero, the return value of cq is ZERO_SIZE_PTR ((void *)16) and is not non-null
> cq = rdma_zalloc_drv_obj(dev, ib_cq);

It looks to me like the driver returned the wrong size for the ib_cq
in the ops->size_ib_cq. It is not allowed to be 0 if the driver is
supporting cq.

Arguably we should check that the size_* pointers have the requirement
minimum size when registering the driver.

Allocation time is too late.

Jason
