Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A4CC3398A
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 12:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748436663; cv=none; b=l6aXy/OcscEc4SDHml7XdtwPUskNypVg09Fef94QJVCIfBs/9cfR/w7nKclRnLCxNM5kuBS0vnnd+3j95vhm7xu7yT2W5qIQuvvLd30gk5pYzVtWTg2GupnWHgmFGEuyLqu1zP7KQ5ZL8MpLyVYtm03douICinneY82nuaNivDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748436663; c=relaxed/simple;
	bh=QQICW+CypoFjK5BqJ6heT+1m+k+pLORcZ4vDWH1R5VQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rryqr7ZnQGN/wwZr37wYYbZ0WXf/n6fsqrpAZlDOnlJyVYrTenzbLqRxP43XUanZXQJh109oV8tpSF2A2JPsHJgKDD2s3rJNoah26gWLnw5gv7DkuL5lojZs7CWz4PPK0Hou/5pyu+1wEysi7YXLVZuwFBBcAkdYqahmhT0goC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=C/Kny2Ua; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="C/Kny2Ua"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748436661;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VWR+5p6ptUR6spJK+eA+18Unm4RrTl1BPCG1yFI4dP4=;
	b=C/Kny2Uaw1MQvIC9jWoc2DFg11zc1C6yZjp5tEn7V+49KiGfwL4G2bcjJGlJV5ttFhNJO3
	OO/n0iRXFUIJl2LkG0Sp8scDtG3CJoFIDZeURQY2WmXqmbidD221F4T/MjwPvl/InQrYje
	ev+axCfar1FaK0/AIxq2ZnjoJzfiHXE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-515-hJqwx2FPPEOAZybcE2atKQ-1; Wed, 28 May 2025 08:50:59 -0400
X-MC-Unique: hJqwx2FPPEOAZybcE2atKQ-1
X-Mimecast-MFC-AGG-ID: hJqwx2FPPEOAZybcE2atKQ_1748436658
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a35ec8845cso2081568f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 05:50:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748436658; x=1749041458;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VWR+5p6ptUR6spJK+eA+18Unm4RrTl1BPCG1yFI4dP4=;
        b=DrQyrZIP9nZQkYH/TJXfUPYiViImIQ4ingmzo00afE/IOzoF9cosYbp9jA7n2bEt5k
         t7zzPKM3NixEgMhJkSz0SWA07RDA6b9X21yrPIp6w9voX3EwYllfOR85joFOdLlD3Qe3
         9mWSdhTMDYwZlLBev47KUX+s03o1aSIqVey50HBy4+LEvV6tfwntd2vIDUw8RXg5XMks
         z8zfD2hN0AKsdaaEr6omlht+mkpagqLBVuVp+rM1uyWZx2jeX/EDPkmuLM96aNPFAy1r
         SEGZRLHn+pPJPL+QgzlY+oH4bdB7qGSEJxVEewmWkHzMxkz96aVEM0XANOhK/qyLTUTa
         U6BQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1+Z96oABtnXhtRGeIoz1e1HEMIBnstyMt6xXvkcGkO4YfAthGS0Su0vplhGqywWO0yqkenXnPnPfGk1Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5e/PV1sUqFJ+6CC+VzAZWRdMXJ+LJN21WmQscKHWOdlUi9mIf
	ZR+h+njUvcEZhQZDmFDkI64wnFF5Lyxi1BXyUjAXTBGBHEtHLcN+R4h3w7/HXj5IhMfJSbVAxjc
	/Xu62o0ErYZoXWkJhMsoTbZiS1nWQBnaxj06f/Bxqvr2jQNrVmRafFuZ9pfK0LHykTFA+fDxRug
	==
X-Gm-Gg: ASbGncteWyHCfwhE6uMzLtmGDQZK3LGhzHxSDQzsM8A/R1PUh7skHW3/mjfrjXDvuPk
	xgOJWnLWmqqEp52eivL45WnXex20nJWNraWWUNeLz+GPloCT2/nAqnxuj8q/tquVJIdB/tDA+l0
	jkYPZmx2Ej9lIo2APAMl0Q8pkbO7GeOs8A3BT5hh93irLytPODZBXW290Eq2RLtl3OOQ93AVqx5
	HgI1k7xto4BaPsk+sD9HDs8uiHDrJFGa+zsHAAHcHoZsd71CQT5PS5hSk5mJEbKhc2yGMi3XMJm
	ofZPxg==
X-Received: by 2002:a05:6000:2dc4:b0:3a4:dfc2:2a3e with SMTP id ffacd0b85a97d-3a4e957b210mr1631504f8f.39.1748436658022;
        Wed, 28 May 2025 05:50:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHGDT3PcePhhoStWwOcSwIXapMw5WkiamBsXKooLqximtwBRdLGBqfc9aCDPZLpSSxOK/eQEQ==
X-Received: by 2002:a05:6000:2dc4:b0:3a4:dfc2:2a3e with SMTP id ffacd0b85a97d-3a4e957b210mr1631488f8f.39.1748436657639;
        Wed, 28 May 2025 05:50:57 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4500e1dd6c8sm20848545e9.37.2025.05.28.05.50.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 05:50:56 -0700 (PDT)
Date: Wed, 28 May 2025 08:50:54 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: xuanzhuo@linux.alibaba.com, eperezma@redhat.com,
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 00/19] virtio_ring in order support
Message-ID: <20250528084904-mutt-send-email-mst@kernel.org>
References: <20250528064234.12228-1-jasowang@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250528064234.12228-1-jasowang@redhat.com>

On Wed, May 28, 2025 at 02:42:15PM +0800, Jason Wang wrote:
> Hello all:
> 
> This sereis tries to implement the VIRTIO_F_IN_ORDER to
> virtio_ring. This is done by introducing virtqueue ops so we can
> implement separate helpers for different virtqueue layout/features
> then the in-order were implemented on top.
> 
> Tests shows 3%-5% imporvment with packed virtqueue PPS with KVM guest
> testpmd on the host.

ok this looks quite clean. We are in the merge window so not merging new
intrusive stuff, but after rc2 or so pls ping me I will put it in next.

> Changes since V1:
> 
> - use const global array of function pointers to avoid indirect
>   branches to eliminate retpoline when mitigation is enabled
> - fix used length calculation when processing used ids in a batch
> - fix sparse warnings
> 
> Please review.
> 
> Thanks
> 
> Jason Wang (19):
>   virtio_ring: rename virtqueue_reinit_xxx to virtqueue_reset_xxx()
>   virtio_ring: switch to use vring_virtqueue in virtqueue_poll variants
>   virtio_ring: unify logic of virtqueue_poll() and more_used()
>   virtio_ring: switch to use vring_virtqueue for virtqueue resize
>     variants
>   virtio_ring: switch to use vring_virtqueue for virtqueue_kick_prepare
>     variants
>   virtio_ring: switch to use vring_virtqueue for virtqueue_add variants
>   virtio: switch to use vring_virtqueue for virtqueue_add variants
>   virtio_ring: switch to use vring_virtqueue for enable_cb_prepare
>     variants
>   virtio_ring: use vring_virtqueue for enable_cb_delayed variants
>   virtio_ring: switch to use vring_virtqueue for disable_cb variants
>   virtio_ring: switch to use vring_virtqueue for detach_unused_buf
>     variants
>   virtio_ring: use u16 for last_used_idx in virtqueue_poll_split()
>   virtio_ring: introduce virtqueue ops
>   virtio_ring: determine descriptor flags at one time
>   virtio_ring: factor out core logic of buffer detaching
>   virtio_ring: factor out core logic for updating last_used_idx
>   virtio_ring: factor out split indirect detaching logic
>   virtio_ring: factor out split detaching logic
>   virtio_ring: add in order support
> 
>  drivers/virtio/virtio_ring.c | 896 ++++++++++++++++++++++++++---------
>  1 file changed, 684 insertions(+), 212 deletions(-)
> 
> -- 
> 2.31.1

