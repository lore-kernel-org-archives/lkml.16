Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D9C22750F4
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 08:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750926333; cv=none; b=XwtYixJiQXBY7+NzZjFnk2wB+cLHSW6QxdvJ1TKhTw36KMlXYjg7nL6bqXPWWxE/jqlIHwB7KH/pWAH4A372dZea5pIcJ1nJNaIc+UynRme1wC/QbuiiZmJaZ3ApIKRq9No7scOy8a/Ps2MeJgIU+FXhb6c5Rd/sO+kGlV2dig0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750926333; c=relaxed/simple;
	bh=E6RxwVgu3vJOGn9XwWkokHd+a3MGchz9iKAQcu64ajw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cACGGfbZVOI8TVEkfS/RWS0I6hCtnuBbcw7eYHTUoU73PzOA13d8LUlNSU5OA5/R4dW5mrReHtTO4eEXPA7Ksj83JYj8GoscpSCjONNXVsNe1visYgcgdY9pO2jSy9l+zAPeaDXvn7ZO91RBpoPqW8zKH9Z3+0Dr426TI/6NG8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=fIHvI5y9; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="fIHvI5y9"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a4e62619afso85600f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 01:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750926328; x=1751531128; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cCmPWaL2JK+cBGwDex8PVmJ2qL8B4VvzgJkSQY0fv8Q=;
        b=fIHvI5y9uA7z+9SVCLSwjJNWJ31FldYS9TZ+oWsEpIjcbRMtf8JeuPBFSI7MXCo5fh
         CEtTfyH1WG1a9Aj4whhRRn7jFXCKybbnJ8q6leh1D9vEBB6slRLx/1P+F9hVZKvwjkbC
         8ffZGsPpXhN7JY8thi7NQDqYNgBeygmTn6KSlSwX1ToQK/tqclNlWAuAhMNg/kKuv9WU
         fegoFtcxTsdSbWgP1vkZgTIg3pwEjeB9RqIxRZ2xpcTaOEpO/aMdee2f4+ByH0iqntVf
         hGbjaJMjAGNX0fadYWjZf0yZAVrH3Xw/oVc8ZnjGIb7BDyn/GdJcNJehe7HCv6xYFtrF
         opww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750926328; x=1751531128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cCmPWaL2JK+cBGwDex8PVmJ2qL8B4VvzgJkSQY0fv8Q=;
        b=Bglrvzx8IXMJJ8xcwiWVUOopzBqEhhKQNEvc+cdKWKe4jieGNsAyMfeiOd6jlOHeKw
         Gxvz3JafXylu0DXD2Xmrhl0SPdIeeHllyg4lYhuDwUEdSQv3BaO+zY4PXULHV/YXuoqW
         peeDTJzZGDgRwGYgaSg+ghEE0cM6bg+ugntA2Y0fb3P4T24+EUaVNaXaleXNSWwm4fVx
         y9kPd4hMJ3nbEI2jQ3ARTvdBPXnXty27GA6e06GuZRX8sN5a0Od+qylsUPR+k6FPAGv5
         9vRBjVNx2LKlZAT9laqy8ErXsz83BGr4l0mZTGDpQ+STXLquJKMs2cjG2ZiPtEjj6xlZ
         S1lA==
X-Forwarded-Encrypted: i=1; AJvYcCVkHjilUqFOK15YWOnDL8wVs3Z48vcMaAIm57er9jjGpM1t2JDc2PgTaAwgGJwYZla4arX2LCHLVV1cfU4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwrfPluP0KxyvoNn3q9B90tLNLsxXvqTFooxUySs3dZG6DHJ/aB
	l8n0vK9T8/Q1IWuhFxWXptug/9H0jQ9B1Clgm9XLnkBk/IMZisx57NYnOlvrr+r6LYA=
X-Gm-Gg: ASbGnctvIt2PNQKe/aJccayvhc/K3mJrLMXyvnACk5f/bfPQpROshwK4qcv+Yx0M6um
	/DsdK5FF7tEP3lm5g5mDz+o7NaLy3LxvVGons2uhFJ3iGLgk2ndrwHV3pm0mnFQmLMrrcfW6a2Z
	OWzeqEeq4tAg3L9B+WgMoLAx2cazp601OQYwKKOvUu6u24MInbmUVuRW2MrSUnobqBsf6xvJtgJ
	6w8SYfRGP0CvnPOpC/U6xSsoyd3wWlYfsMnI3PrugIinbdkKmQgcckMlujjvEZEE0cjQX5ouB8K
	Bp+4j8KjyBqfLeUszOSxLXzv0/ZnQ20MDA5eKDtqJjIT3+L9imoqk/5huggCXQ4H+U7aT6EJNal
	CWwS+
X-Google-Smtp-Source: AGHT+IEAZclUIfVDj/VGqSj8bLrUwvlFXbhpUIBVmE+AmsJhrhTCCer2N8+5GHrDmt4Q6t7t8SSboQ==
X-Received: by 2002:adf:9d8b:0:b0:3a5:781c:6956 with SMTP id ffacd0b85a97d-3a6ed6206eamr1852279f8f.6.1750926328320;
        Thu, 26 Jun 2025 01:25:28 -0700 (PDT)
Received: from mordecai.tesarici.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b34c429b3f1sm1005625a12.15.2025.06.26.01.25.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 01:25:27 -0700 (PDT)
Date: Thu, 26 Jun 2025 10:25:12 +0200
From: Petr Tesarik <ptesarik@suse.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Robin Murphy <robin.murphy@arm.com>, Bagas Sanjaya
 <bagasdotme@gmail.com>, Jonathan Corbet <corbet@lwn.net>, Andrew Morton
 <akpm@linux-foundation.org>, Leon Romanovsky <leon@kernel.org>, Keith Busch
 <kbusch@kernel.org>, Caleb Sander Mateos <csander@purestorage.com>, Sagi
 Grimberg <sagi@grimberg.me>, Jens Axboe <axboe@kernel.dk>, John Garry
 <john.g.garry@oracle.com>, "open list:DOCUMENTATION"
 <linux-doc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
 "open list:MEMORY MANAGEMENT" <linux-mm@kvack.org>, iommu@lists.linux.dev
Subject: Re: [PATCH 7/8] docs: dma-api: update streaming DMA API physical
 address constraints
Message-ID: <20250626102512.57ac20e5@mordecai.tesarici.cz>
In-Reply-To: <1312ef41-1f7c-4b6a-9d04-aa49faaf9b17@samsung.com>
References: <20250624133923.1140421-1-ptesarik@suse.com>
	<20250624133923.1140421-8-ptesarik@suse.com>
	<aFynHWAYtKPFT55P@archie.me>
	<CGME20250626050612eucas1p166c9c423aa791a0f3f65ae6140e3e807@eucas1p1.samsung.com>
	<20250626070602.3d42b607@mordecai.tesarici.cz>
	<1312ef41-1f7c-4b6a-9d04-aa49faaf9b17@samsung.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.50; x86_64-suse-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 26 Jun 2025 09:09:34 +0200
Marek Szyprowski <m.szyprowski@samsung.com> wrote:

> On 26.06.2025 07:06, Petr Tesarik wrote:
> > On Thu, 26 Jun 2025 08:49:17 +0700
> > Bagas Sanjaya <bagasdotme@gmail.com> wrote:
> >  
> >> On Tue, Jun 24, 2025 at 03:39:22PM +0200, Petr Tesarik wrote:  
> >>> diff --git a/Documentation/core-api/dma-api.rst b/Documentation/core-api/dma-api.rst
> >>> index cd432996949c..65132ec88104 100644
> >>> --- a/Documentation/core-api/dma-api.rst
> >>> +++ b/Documentation/core-api/dma-api.rst
> >>> @@ -210,18 +210,12 @@ DMA_BIDIRECTIONAL	direction isn't known
> >>>   	this API should be obtained from sources which guarantee it to be
> >>>   	physically contiguous (like kmalloc).
> >>>   
> >>> -	Further, the DMA address of the memory must be within the dma_mask of
> >>> -	the device.  To ensure that the memory allocated by kmalloc is within
> >>> -	the dma_mask, the driver may specify various platform-dependent flags
> >>> -	to restrict the DMA address range of the allocation (e.g., on x86,
> >>> -	GFP_DMA guarantees to be within the first 16MB of available DMA
> >>> -	addresses, as required by ISA devices).
> >>> -
> >>> -	Note also that the above constraints on physical contiguity and
> >>> -	dma_mask may not apply if the platform has an IOMMU (a device which
> >>> -	maps an I/O DMA address to a physical memory address).  However, to be
> >>> -	portable, device driver writers may *not* assume that such an IOMMU
> >>> -	exists.
> >>> +	Mapping may also fail if the memory is not within the DMA mask of the
> >>> +	device.  However, this constraint does not apply if the platform has
> >>> +	an IOMMU (a device which maps an I/O DMA address to a physical memory
> >>> +	address), or the kernel is configured with SWIOTLB (bounce buffers).
> >>> +	It is reasonable to assume that at least one of these mechanisms
> >>> +	allows streaming DMA to any physical address.  
> > Now I realize this last sentence may be contentious...
> >
> > @Marek, @Robin Do you agree that device drivers should not be concerned
> > about the physical address of a buffer passed to the streaming DMA API?
> >
> > I mean, are there any real-world systems with:
> >    * some RAM that is not DMA-addressable,
> >    * no IOMMU,
> >    * CONFIG_SWIOTLB is not set?
> >
> > FWIW if _I_ received a bug report that a device driver fails to submit
> > I/O on such a system, I would politely explain the reporter that their
> > kernel is misconfigured, and they should enable CONFIG_SWIOTLB.  
> 
> What about the systems with legacy 16/24bit ZONE_DMA (i.e. ISA bus)? 
> AFAIR they don't use SWIOTLB and probably they won't be able to use 
> streaming DMA API for all system RAM.

ISA is probably dead, but yeah, there may still be some systems with
LPC, which inherits the same addressing limitations.

I haven't really tested, but I believe these systems should be able to
enable SWIOTLB. Is there a specific reason they can't use SWIOTLB?

But if there is doubt, I can probably test such configuration.

Petr T
