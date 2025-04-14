Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BCBE18FDA5
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 11:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744631187; cv=none; b=Wa57YtxwawbaTlstD0KOCE6Dejxdu3WrDAbAIT9EUiN8V+b1/YjY3eC35rcHBZAv3u/k9fMNJzQdnYi02ctSLMID6izaARDAcvYsmO2q3Pu8El1vwS1LheJc2lSlqGVev9qBZEGbEk3X9Jtqgsx5QfGD5IbIwyeRH+5beNaQTVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744631187; c=relaxed/simple;
	bh=TGa5A74hhJRFatKtiDaBCJm3bNAxG+RmuZi9KC/N3rk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mBJjBI9FuFbDjDaZxjfQHvp4BrMSF79/PlAlqNx5ShzOqh+s/w0bp+UiMVH1tVWwdjzdlO/ALerMlIGwdrKjTHZbj3t4QTihCW9XdiSQLjrH5b/2BqJKdPNSZV5RwRjGweuwO3FpIRXsA6xlB6qwhC/Es8N21UgAYiLUWvx8+/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YyW+Ri1L; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YyW+Ri1L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744631184;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zjO+mv63DF8OWXZ5ZxlPzpl6bC2oyYwvBcdRfK7EHgs=;
	b=YyW+Ri1LouoYiQ6jEOLNP7tC7xviKPrPKuKXiEml4RBIDw7tE3C/Xk2aIzrhjtoZpsNyYm
	rZtinFTAy0Iefsaof/nQodpoF/JMvyWojruxjTtJ/R0DDtNzQqS5D06PImqK3rtPT1aEI4
	EXWzpklgoqJZLrm1MHO/l4w8ICotJL0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-549-cqVsQh85NQeM0qyv_mqLNA-1; Mon, 14 Apr 2025 07:46:22 -0400
X-MC-Unique: cqVsQh85NQeM0qyv_mqLNA-1
X-Mimecast-MFC-AGG-ID: cqVsQh85NQeM0qyv_mqLNA_1744631182
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43eea5a5d80so23779925e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 04:46:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744631181; x=1745235981;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zjO+mv63DF8OWXZ5ZxlPzpl6bC2oyYwvBcdRfK7EHgs=;
        b=jQubBV8kHseb0gxN6dl/VZMJi+zj7d6UAeOUnrBLwqgj/HBhUgiBqwgGVahJDM5Rq9
         bkXfxzMb7L2YBlc7ma0sOniYaRO60GS10v8n3MCWR5QRwsZ2Eh7dpH0lv3qAiXhwL8jE
         h/0Plw9jS4q6psJ2GKZ4bH1mQz+CYf8iHDUoY7X2SxP1RtTDX6p2YFSdmbxXU14yHGDE
         OJ1vqdIXj+aTu5IjdO2OI4ZfayzdlMRgOS1do7SUxMe4/1q6qJTOYS8rCGWZq5xtoHav
         8hX85iMYtrmpuJFw1pDOW5CNTqD2aOZD/zGLhw/DwYF7ixsVJFg6TnwWz9mNAHKQO2UZ
         /UzA==
X-Forwarded-Encrypted: i=1; AJvYcCW5gif+ETYZrwL0d2xSr2RimUJYYxbkPwGguKp2EU2nax9S+9DnR3pPXIeJ4MumFQG4yUFPQgTbZCU0E7g=@vger.kernel.org
X-Gm-Message-State: AOJu0YynnqsxmRkjjqnae6/iP23MfpIJIREi4aLvXdSiKKRoya9/aDPR
	je5HjfvLIZmvXBwom2viB1Y93YHdHIYiIT6PPzxCX5mb99DpirYFpD+BMfIPNOwaKvtSyjJt065
	NFKkXWPRLBrLbqLcdgOJuNzODZjIe2mWQ1PL5zEw3h0V9fHFrYO8vnCSVkutosg==
X-Gm-Gg: ASbGncuKxx8ArPVyLpyIFIjrJ05bnf9rJ0/dBkteaInsu0mZtwPFOweJmYwCZ5KCKZB
	Cr1rp5zdt8xhE/frfNES1gg6cxVxrEpReyLeN6R546aUAuwAL8ufX9KLr2iX/X5w8aPSEZYlYf4
	61R+gf56teMBp7xudVthZ+QI9V+wSgLtHOQpSKE0Jjg7SJLbIOzQF6kXFGmx5v5lOMfCZ3C8Zy7
	eWMDdrsEiTtUZ5urMeAVIC5CR/kB4cIPSjWvCeySNNkV/c1ecdeBRCink1CvDgwcwppEGxxjp1V
	Xho99Q==
X-Received: by 2002:a05:600c:810b:b0:43c:f61e:6ea8 with SMTP id 5b1f17b1804b1-43f3a926c29mr101650555e9.2.1744631181504;
        Mon, 14 Apr 2025 04:46:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFq+5ke4eamrk9xDN2am47+k03CAk53gsv1lkSszP4cGrTySTbHEceig7E6SA/uputECe8AcA==
X-Received: by 2002:a05:600c:810b:b0:43c:f61e:6ea8 with SMTP id 5b1f17b1804b1-43f3a926c29mr101650165e9.2.1744631181039;
        Mon, 14 Apr 2025 04:46:21 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae96c074sm10536365f8f.28.2025.04.14.04.46.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 04:46:20 -0700 (PDT)
Date: Mon, 14 Apr 2025 07:46:17 -0400
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
Subject: Re: [PATCH v2 1/3] virtio-net: disable delayed refill when pausing rx
Message-ID: <20250414074407-mutt-send-email-mst@kernel.org>
References: <20250414050837.31213-1-minhquangbui99@gmail.com>
 <20250414050837.31213-2-minhquangbui99@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250414050837.31213-2-minhquangbui99@gmail.com>

On Mon, Apr 14, 2025 at 12:08:35PM +0700, Bui Quang Minh wrote:
> When pausing rx (e.g. set up xdp, xsk pool, rx resize), we call
> napi_disable() on the receive queue's napi. In delayed refill_work, it
> also calls napi_disable() on the receive queue's napi.  When
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
> This commit adds virtnet_rx_(pause/resume)_all helpers and fixes up the
> virtnet_rx_resume to disable future and cancel all inflights delayed
> refill_work before calling napi_disable() to pause the rx.
> 
> Fixes: 413f0271f396 ("net: protect NAPI enablement with netdev_lock()")
> Signed-off-by: Bui Quang Minh <minhquangbui99@gmail.com>
> ---
>  drivers/net/virtio_net.c | 60 ++++++++++++++++++++++++++++++++++------
>  1 file changed, 51 insertions(+), 9 deletions(-)


Thans for the patch! Yes something to improve:

> diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
> index 7e4617216a4b..4361b91ccc64 100644
> --- a/drivers/net/virtio_net.c
> +++ b/drivers/net/virtio_net.c
> @@ -3342,10 +3342,53 @@ static netdev_tx_t start_xmit(struct sk_buff *skb, struct net_device *dev)
>  	return NETDEV_TX_OK;
>  }
>  
> +static void virtnet_rx_pause_all(struct virtnet_info *vi)
> +{
> +	bool running = netif_running(vi->dev);
> +
> +	/*
> +	 * Make sure refill_work does not run concurrently to
> +	 * avoid napi_disable race which leads to deadlock.
> +	 */
> +	disable_delayed_refill(vi);
> +	cancel_delayed_work_sync(&vi->refill);
> +	if (running) {
> +		int i;
> +
> +		for (i = 0; i < vi->max_queue_pairs; i++) {
> +			virtnet_napi_disable(&vi->rq[i]);
> +			virtnet_cancel_dim(vi, &vi->rq[i].dim);

duplicates a bit of code from virtnet_rx_pause_all.


> +		}
> +	}
> +}
> +
> +static void virtnet_rx_resume_all(struct virtnet_info *vi)
> +{
> +	bool running = netif_running(vi->dev);
> +	int i;
> +
> +	enable_delayed_refill(vi);
> +	for (i = 0; i < vi->max_queue_pairs; i++) {
> +		if (i < vi->curr_queue_pairs) {
> +			if (!try_fill_recv(vi, &vi->rq[i], GFP_KERNEL))
> +				schedule_delayed_work(&vi->refill, 0);
> +		}
> +
> +		if (running)
> +			virtnet_napi_enable(&vi->rq[i]);
> +	}
> +}
> +
>  static void virtnet_rx_pause(struct virtnet_info *vi, struct receive_queue *rq)
>  {
>  	bool running = netif_running(vi->dev);
>  
> +	/*
> +	 * Make sure refill_work does not run concurrently to
> +	 * avoid napi_disable race which leads to deadlock.
> +	 */
> +	disable_delayed_refill(vi);
> +	cancel_delayed_work_sync(&vi->refill);


Maybe rename this e.g. __virtnet_rx_pause ?


>  	if (running) {
>  		virtnet_napi_disable(rq);
>  		virtnet_cancel_dim(vi, &rq->dim);
> @@ -3356,6 +3399,7 @@ static void virtnet_rx_resume(struct virtnet_info *vi, struct receive_queue *rq)
>  {
>  	bool running = netif_running(vi->dev);
>  
> +	enable_delayed_refill(vi);
>  	if (!try_fill_recv(vi, rq, GFP_KERNEL))
>  		schedule_delayed_work(&vi->refill, 0);
>  
> @@ -5959,12 +6003,12 @@ static int virtnet_xdp_set(struct net_device *dev, struct bpf_prog *prog,
>  	if (prog)
>  		bpf_prog_add(prog, vi->max_queue_pairs - 1);
>  
> +	virtnet_rx_pause_all(vi);
> +
>  	/* Make sure NAPI is not using any XDP TX queues for RX. */
>  	if (netif_running(dev)) {
> -		for (i = 0; i < vi->max_queue_pairs; i++) {
> -			virtnet_napi_disable(&vi->rq[i]);
> +		for (i = 0; i < vi->max_queue_pairs; i++)
>  			virtnet_napi_tx_disable(&vi->sq[i]);
> -		}
>  	}
>  
>  	if (!prog) {
> @@ -5996,13 +6040,12 @@ static int virtnet_xdp_set(struct net_device *dev, struct bpf_prog *prog,
>  		vi->xdp_enabled = false;
>  	}
>  
> +	virtnet_rx_resume_all(vi);
>  	for (i = 0; i < vi->max_queue_pairs; i++) {
>  		if (old_prog)
>  			bpf_prog_put(old_prog);
> -		if (netif_running(dev)) {
> -			virtnet_napi_enable(&vi->rq[i]);
> +		if (netif_running(dev))
>  			virtnet_napi_tx_enable(&vi->sq[i]);
> -		}
>  	}
>  
>  	return 0;
> @@ -6014,11 +6057,10 @@ static int virtnet_xdp_set(struct net_device *dev, struct bpf_prog *prog,
>  			rcu_assign_pointer(vi->rq[i].xdp_prog, old_prog);
>  	}
>  
> +	virtnet_rx_resume_all(vi);
>  	if (netif_running(dev)) {
> -		for (i = 0; i < vi->max_queue_pairs; i++) {
> -			virtnet_napi_enable(&vi->rq[i]);
> +		for (i = 0; i < vi->max_queue_pairs; i++)
>  			virtnet_napi_tx_enable(&vi->sq[i]);
> -		}
>  	}
>  	if (prog)
>  		bpf_prog_sub(prog, vi->max_queue_pairs - 1);
> -- 
> 2.43.0

