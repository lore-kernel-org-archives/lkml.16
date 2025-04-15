Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5959E28F520
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 14:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744725894; cv=none; b=OyhTQymPuvPGLqKskKdMGrW8PgsGXP2pPbXdi3/hkh/s4o976gZTluwDE4tyigScx8kyObz0+6OjgXMQsuLSHHYFkbSwJkrq1atnxrwJR+ssjnUWHWgec99+AX6NkHKgFsOKefBwK0sf4UqcXiHnFLYm7qfpTB/QFiARTqqkNCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744725894; c=relaxed/simple;
	bh=QXP9FxMrw7KNSGwJPkQN8Q4+F9sKVBVOP6V3LiUSFH4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sfNPJIeGEdLZrFVaq6LDfTtI59vKYrgelcyILG3Sj3f7BqBODHqd2p1eT5B1btbqyvuF2O8ISb7uq01TFg0B00q+uAbZV/PIp5wYHeKPOtdmQzi4XPhSo3mKqhaY/ov53/dU9lx8fr89rv70c5NByVeh6ZV5MqeIlnbkLK2WMOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BKxb5ptz; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BKxb5ptz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744725890;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PJjI0lY/xyReq3ZmWkhvSF6/rYPEyl6oWq19qSKGU2Q=;
	b=BKxb5ptzYCieGjbhUBpuISLlRTjvhxhXtdxZTgHmQf43cyAOnm2dRBLFH56ZhaI0kHb4g4
	0ibdiTKEMUOfg2uleC+LGKTdP+pwH7cR56SZLE4afWiYEJMyLaD6xSIDLIrnAnpb0tE9Dk
	0ZfvbVmcHe9jaHxZkfRqvCA3/TTQ0Rc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-240-hdTwJxlxMrOa9Xnj1stElA-1; Tue, 15 Apr 2025 10:04:48 -0400
X-MC-Unique: hdTwJxlxMrOa9Xnj1stElA-1
X-Mimecast-MFC-AGG-ID: hdTwJxlxMrOa9Xnj1stElA_1744725887
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43d6c65dc52so44352485e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 07:04:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744725887; x=1745330687;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PJjI0lY/xyReq3ZmWkhvSF6/rYPEyl6oWq19qSKGU2Q=;
        b=S6iH9EjgEuXHU+SkMnnP3AlX5mM2w8O+uJZx2PgZG/Koz5AyjAIUSK2Iecf2AS/xml
         oW5Vuw5n8VBsN9TgAQqZ5ckF9lHNDvG9GEUqiFt5r3YNAFLJ+tStr1tWUw/2PNGl9NIg
         GIVHUT1soLNFLbutzU9QPEgIZ5IXu1vRGWg4i8ukfYKAkKTqUGMQTs5fc65DMIPZeQzO
         0Zpin4D3sO69gL9SJHN2258DfQaaeAYcZI02tW9c1dmqLaAsGuYz1bMd82i3ThZYGGMU
         QuuuPenUWhpJlGUxzQuUcPcr5qrCmfs9xm6wkSa2OHoPel4UwRmPF3YillD2II5eGKV8
         nSqg==
X-Forwarded-Encrypted: i=1; AJvYcCXiV+lDGK9F68z25Q3EYhpYSG1i8EBREuVXcgcHdMaiSY2dpNMjDOmeQMQ2WieHWD4pHH2Ys9yRAkavCFE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZ55Yj6gOx9JUyUVEMhMHEUviVfT/qYFc0/tSYpFL31qW+RgiU
	DsUNjfWN36YTH420PVIm9Bgtn2wClrksUj/pKYJcS2UA7t+2OPZC69u/r4Lid/L83IMj/IRA38e
	S5RWl0L88Y8YfXeF97PXlrIzNU+Gi0IsIpaQXPaNBgIWqzWjzgth7ft7zbXeDFg==
X-Gm-Gg: ASbGncvE+n4oXv8VXp/+3TK++e98rm6ruVumvfApoCcdMr9mZcs3oOeEWp17v5JJg5y
	K0aF807ZvjO5QRROG42dI65B9KIzKPo6BSkCv/5pplCjST4Dtwsaw0eOaXTe2XyNFmos6M4lB/D
	fXdS8Z449GmfN2X9mtAJDg4cjxdxui4uKZSp3OMjzA1KuBAa/1COmh26ygJHM29DeslGJxKvokD
	IHbdMaO3FuP972DmpPMQkuR2Huf4SkDxscIWkyyEqN0ntDqu/AcM84oLCismFpFdGUvFH3b1agh
	qLVLLw==
X-Received: by 2002:a05:600c:3b93:b0:43c:f64c:44a4 with SMTP id 5b1f17b1804b1-43f3a93ce18mr130332805e9.8.1744725887395;
        Tue, 15 Apr 2025 07:04:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHITYoM+E4rIVBkVC+Zy7bnyx80+fEMQuQMdwZhPsCxD1+xYR+TZ77Lv7xvd8u4v2RkPh0L7w==
X-Received: by 2002:a05:600c:3b93:b0:43c:f64c:44a4 with SMTP id 5b1f17b1804b1-43f3a93ce18mr130331785e9.8.1744725886545;
        Tue, 15 Apr 2025 07:04:46 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f205ed041sm210253075e9.2.2025.04.15.07.04.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 07:04:45 -0700 (PDT)
Date: Tue, 15 Apr 2025 10:04:41 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Bui Quang Minh <minhquangbui99@gmail.com>
Cc: virtualization@lists.linux.dev, Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	"David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org
Subject: Re: [PATCH v3 0/3] virtio-net: disable delayed refill when pausing rx
Message-ID: <20250415100425-mutt-send-email-mst@kernel.org>
References: <20250415074341.12461-1-minhquangbui99@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415074341.12461-1-minhquangbui99@gmail.com>

On Tue, Apr 15, 2025 at 02:43:38PM +0700, Bui Quang Minh wrote:
> Hi everyone,
> 
> This series tries to fix a deadlock in virtio-net when binding/unbinding
> XDP program, XDP socket or resizing the rx queue.
> 
> When pausing rx (e.g. set up xdp, xsk pool, rx resize), we call
> napi_disable() on the receive queue's napi. In delayed refill_work, it
> also calls napi_disable() on the receive queue's napi. When
> napi_disable() is called on an already disabled napi, it will sleep in
> napi_disable_locked while still holding the netdev_lock. As a result,
> later napi_enable gets stuck too as it cannot acquire the netdev_lock.
> This leads to refill_work and the pause-then-resume tx are stuck
> altogether.
> 
> This scenario can be reproducible by binding a XDP socket to virtio-net
> interface without setting up the fill ring. As a result, try_fill_recv
> will fail until the fill ring is set up and refill_work is scheduled.
> 
> This fix adds virtnet_rx_(pause/resume)_all helpers and fixes up the
> virtnet_rx_resume to disable future and cancel all inflights delayed
> refill_work before calling napi_disable() to pause the rx.
> 
> Version 3 changes:
> - Patch 1: refactor to avoid code duplication
> 
> Version 2 changes:
> - Add selftest for deadlock scenario
> 
> Thanks,
> Quang Minh.


Acked-by: Michael S. Tsirkin <mst@redhat.com>

> Bui Quang Minh (3):
>   virtio-net: disable delayed refill when pausing rx
>   selftests: net: move xdp_helper to net/lib
>   selftests: net: add a virtio_net deadlock selftest
> 
>  drivers/net/virtio_net.c                      | 69 +++++++++++++++----
>  tools/testing/selftests/Makefile              |  2 +-
>  tools/testing/selftests/drivers/net/Makefile  |  2 -
>  tools/testing/selftests/drivers/net/queues.py |  4 +-
>  .../selftests/drivers/net/virtio_net/Makefile |  2 +
>  .../selftests/drivers/net/virtio_net/config   |  1 +
>  .../drivers/net/virtio_net/lib/py/__init__.py | 16 +++++
>  .../drivers/net/virtio_net/xsk_pool.py        | 52 ++++++++++++++
>  tools/testing/selftests/net/lib/.gitignore    |  1 +
>  tools/testing/selftests/net/lib/Makefile      |  1 +
>  .../{drivers/net => net/lib}/xdp_helper.c     |  0
>  11 files changed, 133 insertions(+), 17 deletions(-)
>  create mode 100644 tools/testing/selftests/drivers/net/virtio_net/lib/py/__init__.py
>  create mode 100755 tools/testing/selftests/drivers/net/virtio_net/xsk_pool.py
>  rename tools/testing/selftests/{drivers/net => net/lib}/xdp_helper.c (100%)
> 
> -- 
> 2.43.0

