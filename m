Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D90961917F1
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 07:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751353471; cv=none; b=J5U49GRUQSGdKwn3C2RsD4hfcnxX/R0fZurECr1NgOZN1fXk/K7j56nLOi6g54xiAVr9vX582mf+WZpr0/j8AIzcauktKWJT5yd1XGEtAId2cos4JkjfnGPWH5zuMZPAq2z1R46iPniadDgtsqKKmnn9kUSxSbT8Ixxif5avbw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751353471; c=relaxed/simple;
	bh=UBHCbWmJ6VDNppNkhkingW/F47Rfl4Wt7VARuw3yTLg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=co8QX37sF2/jve9Z/72EdQS8nPVjqs1UAERI57rezQxWeNlOj5oRm5CwrYHtvAwVveTV6T+eQRrKe6aIbulGB4cITvcQhbje3SMJ2UhK5uvGJc4R7n50XdZuZuD/uomMpi/u9mheRg4Ug7mVax2aXtbAWbIZaifNAhOK4Buv1Yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iXF3EI1W; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iXF3EI1W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751353468;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LMIP2QD/B6zrGBadq9ojc0NiQgqEZqri/vutr0V7/RY=;
	b=iXF3EI1WXosGBqij9Vj+C4UHUtc9o7UcB0mEqNXbp4tEm4JC/hqA6hQ4mUMQ9wBZakpmeA
	TT97BL1eYXZpXyRoG/ZBRyAOI9kXiMZcupyBnomo1G/ypWV2pApyFwWlKJDJpJcCuwM/87
	e5xd0iwhOLwczducHqnOhGWsf+imW20=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-630-zLREI3RlMIilOFJ_Sq2c0A-1; Tue, 01 Jul 2025 03:04:23 -0400
X-MC-Unique: zLREI3RlMIilOFJ_Sq2c0A-1
X-Mimecast-MFC-AGG-ID: zLREI3RlMIilOFJ_Sq2c0A_1751353458
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a6d1394b07so3363475f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 00:04:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751353458; x=1751958258;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LMIP2QD/B6zrGBadq9ojc0NiQgqEZqri/vutr0V7/RY=;
        b=e//tFNOikaX2luo7hS893fFs53YQukGiTn/rQKVo4/SVIysTOEc467KJI6kdXo8sC3
         W9htDTGZ1gEQrRaM8vXQc+azKcqMa8EtTr12T08BTnlEqPZR895HaQX0JRX8FSe5wKwp
         isIu6Pp6R0G2ZljVD3sW/ptqRM4xP8vtAhMPe8q3xc0w41Dj8XN0r+vr76Fs9bwyC6M6
         OHz/ayd08EJ/nNzNRU/7aZNqP5bW5/UtEJ2oOUH+fMYqhBFTy3W0ZLItLlKBVdTojdKK
         bZhT0ng+HlBJk/yhxChuYaOu5ePk2oeVH9rKwwEKDsYa+NqNgzPB6tQtWDiOpo9zWKs6
         40dw==
X-Forwarded-Encrypted: i=1; AJvYcCVrhqcX+HY25xfpRg2O6T1LKdP421vBum4+HNDzB5q3+8xLNF2u/8mb5k0SLxy3KWK9jQSeUuKq7RmUbxE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTHMGSbaRxQZnTScUVJQ3fh8vquu7RkkTbsJNB2Wdg+DFmWnCs
	FJQXQBnmbugKwj0P8cCxdtdutWOTaYsU1g9DlUUXTWiZDhpVsWBjbJ46+7Yhpinv1RjZ17bng2e
	FzDqCcBpfr+6weGZAwswRY8kJmQTvu9SrCQfkVPKoLefU0CZxuRSHsF+96Sgde48wJw==
X-Gm-Gg: ASbGncueMHgLNDuQVDMduwVQlT1acNWcwpyUD6ArjtHB9047CVOVCCO64soOEoTyXiP
	Ic8aGSB6Y82mmV7m40Hg0Ni5G2jqLXq7tZZEah5X4+eE4+5fikS+X3FLNLMjZeWMIk1h8Dn/nNu
	+dCvhjJSB2BE/tOailTLKt+Qh8Rd5hBWiigOl9cwSnV3ig2JB2nl0Mg7uA+a8moOl6zcRQALgzE
	DhyiSWOuV4IR03BJiwcbNegQDG1pwrDX90ds1iukFYgFAQLDECQEU3X+o4Ln6S0xUun6qVsAPiv
	JWBCakte+NEr0pkh
X-Received: by 2002:a5d:4525:0:b0:3a5:8e0e:108b with SMTP id ffacd0b85a97d-3a90d69ccddmr12919901f8f.21.1751353457811;
        Tue, 01 Jul 2025 00:04:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEiBXyBSwI/7gO4KGgVTDm7SOZoXqDq7xHmIjgvJ6o86dgNWXInCjLchqsXAjGYhqWuzah/jA==
X-Received: by 2002:a5d:4525:0:b0:3a5:8e0e:108b with SMTP id ffacd0b85a97d-3a90d69ccddmr12919861f8f.21.1751353457319;
        Tue, 01 Jul 2025 00:04:17 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:152e:1400:856d:9957:3ec3:1ddc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e52cbasm12485993f8f.62.2025.07.01.00.04.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 00:04:16 -0700 (PDT)
Date: Tue, 1 Jul 2025 03:04:14 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: xuanzhuo@linux.alibaba.com, eperezma@redhat.com,
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org,
	hch@infradead.org, xieyongji@bytedance.com
Subject: Re: [PATCH 0/9] Refine virtio mapping API
Message-ID: <20250701030150-mutt-send-email-mst@kernel.org>
References: <20250701011401.74851-1-jasowang@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250701011401.74851-1-jasowang@redhat.com>

On Tue, Jul 01, 2025 at 09:13:52AM +0800, Jason Wang wrote:
> Hi all:
> 
> Virtio used to be coupled with DMA API. This works fine for the device
> that do real DMA but not the others. For example, VDUSE nees to craft
> with DMA API in order to let the virtio-vdpa driver to work.
> 
> This series tries to solve this issue by introducing the mapping API
> in the virtio core. So transport like vDPA can implement their own
> mapping logic without the need to hack with DMA API. The mapping API
> are abstracted with a new map operations in order to be re-used by
> transprot or device. So device like VDUSE can implement its own
> mapping loigc.
> 
> Please review.
> 
> Thanks

Cost of all this extra indirection? Especially on systems with
software spectre mitigations/retpoline enabled.

> Jason Wang (9):
>   virtio_ring: constify virtqueue pointer for DMA helpers
>   virtio_ring: switch to use dma_{map|unmap}_page()
>   virtio: rename dma helpers
>   virtio: rename dma_dev to map_token
>   virtio_ring: rename dma_handle to map_handle
>   virtio: introduce map ops in virtio core
>   vdpa: rename dma_dev to map_token
>   vdpa: introduce map ops
>   vduse: switch to use virtio map API instead of DMA API
> 
>  drivers/net/virtio_net.c                 |  32 +-
>  drivers/vdpa/alibaba/eni_vdpa.c          |   5 +-
>  drivers/vdpa/ifcvf/ifcvf_main.c          |   5 +-
>  drivers/vdpa/octeon_ep/octep_vdpa_main.c |   6 +-
>  drivers/vdpa/pds/vdpa_dev.c              |   3 +-
>  drivers/vdpa/solidrun/snet_main.c        |   4 +-
>  drivers/vdpa/vdpa.c                      |   5 +-
>  drivers/vdpa/vdpa_sim/vdpa_sim.c         |   4 +-
>  drivers/vdpa/vdpa_user/iova_domain.c     |   8 +-
>  drivers/vdpa/vdpa_user/iova_domain.h     |   5 +-
>  drivers/vdpa/vdpa_user/vduse_dev.c       |  34 +-
>  drivers/vdpa/virtio_pci/vp_vdpa.c        |   5 +-
>  drivers/vhost/vdpa.c                     |  11 +-
>  drivers/virtio/virtio_ring.c             | 440 ++++++++++++++---------
>  drivers/virtio/virtio_vdpa.c             |  15 +-
>  include/linux/vdpa.h                     |  22 +-
>  include/linux/virtio.h                   |  36 +-
>  include/linux/virtio_config.h            |  68 ++++
>  include/linux/virtio_ring.h              |   6 +-
>  19 files changed, 476 insertions(+), 238 deletions(-)
> 
> -- 
> 2.34.1

