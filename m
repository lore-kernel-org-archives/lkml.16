Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73AA0223707
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 06:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751353144; cv=none; b=h6CvETzS//YE32X0JyDWp84krS9sFy8xqFaYx01fyfM8rrryYuVDTF0jp1bkwACxxlrfOgC6WjzU6V1qMoZL1zJyMQRMmJ68r/zgNro8zPYZAGtZ4Bi27RN7GU7FV09F0wUzl2/yidzYZxeZoxfYpril+v9R2UikiMhXGRl6tPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751353144; c=relaxed/simple;
	bh=8IWAZwihcyMgNOqUo1jIrL+a9PnnaXKKk8vOvAd6M58=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sOkyapvJ1bf9Si5luSpEz1V2y+HAiXUp3r/K349AWfxwiZFZjo7r6uVVs7TxY+b3NnBnjUGSR/LogOyI1Iym8aprtcAPyA/z5uNRkhYR3PZdiZ4lip1hCxYd/+3ha6yRoNt3JRCJZrtr2N7aKos8EVhc0bT0u9fHRSD62w9OWKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GEJZ6oGf; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GEJZ6oGf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751353137;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=g/xX6Vj1UFoxmOqMARiAbHnNR0YGwcx4fQwDyXkDkaY=;
	b=GEJZ6oGfBcjXzjp3pJlzomyzE8RHer3eUFsh+I3yqYJ0VqmjgyrMUZtyJiAEsvzUb4PSul
	QLWWNc9KVoXjbDzu9QT3hQOue+UynQl4Pa2OgVbs16CD+Z5TVjqpnP7BCKh8IOyaPY336p
	mH6+jw3heg+xFCgPAE9MGSNgjOoJRrU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-562-hueP0NbeP4yBeyDTKWo5PA-1; Tue, 01 Jul 2025 02:58:56 -0400
X-MC-Unique: hueP0NbeP4yBeyDTKWo5PA-1
X-Mimecast-MFC-AGG-ID: hueP0NbeP4yBeyDTKWo5PA_1751353130
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a3696a0d3aso1279511f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 23:58:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751353130; x=1751957930;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g/xX6Vj1UFoxmOqMARiAbHnNR0YGwcx4fQwDyXkDkaY=;
        b=X5bRrl73z6K4liGbLoG+0/PIOHiXvxUcilx1xaL4k7XUBQfNosKiJzxBj12CiyZsoJ
         mtpSIXix6aX6wj9TvLTgoePBPiQj+eeGeFy5MGi9RKsuAA/wco8oZ3f9Vy24ld26w3Rs
         7MCPPB27tZ/COYrCVpbR2mWys28M6PSmmKyNC+IPs3l+xSrE1J3qfrcO2sQR/Q4GYR2p
         XmAsAuG9gST5IYY1f0TXjo9GOFuJh+Uo3CFILJ92yGagkLstNyGdwS/3KbLsZvDATiE3
         wadoD9Eqv0mDR4fF1aBzsuKGvOPUzw8z2cDDzwZKwgivqlm4VuGmWQ8qYhy0jCW/u5y4
         kPtA==
X-Forwarded-Encrypted: i=1; AJvYcCUlP+5pxE3ik4UUjGr2v9huaLe6tNVmVZvmXqB1sqbduRs3ZXeC8TQ0geWIZBEOyX8bwY5uTKhfy0w+VfE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsevRnBWhsXSKkaqzcMqKfZVqG7Jf8o8poBoytyvX4SpZlXcxP
	8l5+hRmJm3Jjr6u4yxjoTGsV/S8lyTbkFEF/zA6IV0UiW3BLNBlTMVQZ0yzBSYwLggY5sM6/ivR
	YOHKz0GgGNc2d9AO4KAJFqGMBkpnLhvYXuWmLrLPmT4phPL4a4bOuArruMDQJ/mtbrQ==
X-Gm-Gg: ASbGnct3jMi4yo/qXhgDg4fDbdkmyYaghFqAGcTkqsTaZl7CfDu1/Jt0XsmBz8GN0of
	5UXzDj67avm3tDWOtJVXuiQhlNUZmt1gXzFMTSX3Dv7m5czVQy3UJK5y1ILpFj2TVkKO4+rWQVX
	y0r5apW1zNeR4NvdWsQhEz+k85SrKRZp8Rj/PetNBHdpl/cUqE3b59UZG9KBZ/XZWyArOrj8ElR
	+N4/vMQx1grOL5YU0sXCAchOd6IR7XAOYUkbefvhA9fiI/BXi0RifOxWEMpwSz1LeOrtZn3D+km
	TW/ioQmNTkhh8co8
X-Received: by 2002:adf:f44c:0:b0:3a6:d93e:5282 with SMTP id ffacd0b85a97d-3a9000a8138mr12229227f8f.59.1751353129525;
        Mon, 30 Jun 2025 23:58:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHs9r/PJXYoXVnQuInmZ2C5taF6dc/FQeBFJwuoW0qiinCPLiV68OdDQjGkGS53kRHnNC0Pxw==
X-Received: by 2002:adf:f44c:0:b0:3a6:d93e:5282 with SMTP id ffacd0b85a97d-3a9000a8138mr12229211f8f.59.1751353129112;
        Mon, 30 Jun 2025 23:58:49 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:152e:1400:856d:9957:3ec3:1ddc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e59720sm12293700f8f.73.2025.06.30.23.58.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 23:58:48 -0700 (PDT)
Date: Tue, 1 Jul 2025 02:58:46 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: xuanzhuo@linux.alibaba.com, eperezma@redhat.com,
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V3 00/19] virtio_ring in order support
Message-ID: <20250701025759-mutt-send-email-mst@kernel.org>
References: <20250616082518.10411-1-jasowang@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250616082518.10411-1-jasowang@redhat.com>

On Mon, Jun 16, 2025 at 04:24:58PM +0800, Jason Wang wrote:
> Hello all:
> 
> This sereis tries to implement the VIRTIO_F_IN_ORDER to
> virtio_ring. This is done by introducing virtqueue ops so we can
> implement separate helpers for different virtqueue layout/features
> then the in-order were implemented on top.
> 
> Tests shows 3%-5% imporvment with packed virtqueue PPS with KVM guest
> testpmd on the host.

Thanks very much. I think this is going in the right direction,
though some things to improve remain.
Sent comments, thanks!


> Changes since V2:
> 
> - Fix build warning when DEBUG is enabled
> 
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
> 2.34.1

