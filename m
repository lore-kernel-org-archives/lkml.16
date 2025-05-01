Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E4EF1B85FD
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 13:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746107086; cv=none; b=n0SxSL1A+NN2EK0JQQCdNiLSf5v41I4Q9bNAAN2LFMaENNipWfbycXQ09b61Ba/NJsAEX9yT0PKPf8Be6VIrubQb5i5wzYxszf+DPkKy8RK/jQm3pcik5FL1keNRZgQ3DPB1CmOgeVjFarUzwwYw1Pp6Vqh4u/ypXCev0ei7skg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746107086; c=relaxed/simple;
	bh=TW6LWoRqtypIzn7B58qijKmL0w5gLK2466Q2vxKzNkw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XBiropsqMf3LpDqpLvkilTtIOhGUNsYsdu7qzyWmichy03WVFBq2kBtvy4u4caNlx0FdRRVAq7NbWI8S94+tGxcYVGDn+KS3o7OaEeADRZtrMOn/Ou1AX1UuzMyUyQ2nobynFqlucWSGiaf2dQcTyPm5Dko9/aaNWmlHD2nVrJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=jRzxo8GC; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jRzxo8GC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746107084;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6UI0tYMue0gvJhLpVqoCbZ1TmzhnaUoOZcJGxHDR+D8=;
	b=jRzxo8GCUniyTfS9pciDsdBT8Wv8O8gMilVBIjcVd5P/kB+9OHmHrukDURo4BTJ4rEvhu+
	HsLLnon6dutsywzmdqxW+y6H9AfZ3nun0w0EljTvf9Px+l6pQZKOdT5kJrJ5eNCp3yYwDD
	2XGp1vvq2ZTWru4MAd1asE9ScXSFz4A=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-538--aDPing9MYWM5RaCLZY2qw-1; Thu, 01 May 2025 09:44:43 -0400
X-MC-Unique: -aDPing9MYWM5RaCLZY2qw-1
X-Mimecast-MFC-AGG-ID: -aDPing9MYWM5RaCLZY2qw_1746107082
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-39143311936so285112f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 06:44:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746107082; x=1746711882;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6UI0tYMue0gvJhLpVqoCbZ1TmzhnaUoOZcJGxHDR+D8=;
        b=NpKwu3sgH+JXbVaRRA+HeKdNWVkKQBw7A3vvozNHa9cGuxb6Rp2rsFERmR/6PRUjPP
         /LaFMohahp9AffPmuBOOoH66X1RYEBXkUQOwnE5Aha9G+BJid/ehsYDSRv2YgEsXFa1V
         1dw57qvbW3LVZBa6x+HzBPiwEE5rCRAwf6rYVSlzpyEJ8tZ9k5CZz00enbo96rYzM1uP
         iz8ODxs11y0u7mB3AE7LdBu+015nmaMgwe4Jw0lR5pIkue3f0+hrzI6FSUzQGjak9tDt
         BVWAplkONpBHk/RtOMPhVcfjBpnsnLX7y2BIrAple6ZJli9poC0I+C4fH5zvvNq0gc3o
         wq/w==
X-Forwarded-Encrypted: i=1; AJvYcCXkMTC3F+u5Cqj+VF+jcjvcrY+n8/x8kqgFz1A8cCIaltVmFv8pNtiTjDbjE+Xjs4X4wfsNzdEAd5yOWfE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzdwdY8fb2pPbmz6K98oqiJsSj+HY8kRyHbZSpBtT0jzLLYc7T
	2HcMwnKAKHe7czMP5fghTUnciIFmGj8/KjeC6nI48OQ6Ixbd4END9v/iRIg2iKrhpIi6ELz21ZW
	i9G6FyhVIUwFYEC2JrsO5DsVEe8iHK9WQMk+ZHvRHNWa/FVV2z73vVLgfofGa0A==
X-Gm-Gg: ASbGncuadv0gMLnSRSQ6xWjbnw285lAmLTwS4p+0QvHwRoHAok58hhs2bhF/o96b3g1
	A3d3nxtd3EkXPW7oDeMKwDel8q11he+vxkL7scILcRqcWFJCpTtMN9aLryfT4/po99caJlwIs7Z
	aRkZSXTEJbJaq3NQx4Ce0TVYPHOnLkk3yec3un6Z2NjDlVVqiYfwzTc+ONM7tV+8oO2f2AOzNxb
	3Vn3cEh/EKf5kGkZvzNNEUkgf1du9kIsnOJf5eQ+u5ZAxFFKCpCY+7TFlHZBHSh92KJ91wGshB7
	24d89g==
X-Received: by 2002:a05:6000:1acd:b0:3a0:6ac1:93a1 with SMTP id ffacd0b85a97d-3a09404452amr1721872f8f.7.1746107081633;
        Thu, 01 May 2025 06:44:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGD96yZkZMPIxtx9G7hGbxzu9GrBoqR4jN2AHFouxYn7cwL/a8mhV9pFuiwTxsci9UDPZbEJA==
X-Received: by 2002:a05:6000:1acd:b0:3a0:6ac1:93a1 with SMTP id ffacd0b85a97d-3a09404452amr1721860f8f.7.1746107081298;
        Thu, 01 May 2025 06:44:41 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a095a3e04asm917945f8f.18.2025.05.01.06.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 06:44:40 -0700 (PDT)
Date: Thu, 1 May 2025 09:44:38 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jon Kohler <jon@nutanix.com>
Cc: Jason Wang <jasowang@redhat.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	kvm@vger.kernel.org, virtualization@lists.linux.dev,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v3] vhost/net: Defer TX queue re-enable until
 after sendmsg
Message-ID: <20250501094427-mutt-send-email-mst@kernel.org>
References: <20250501020428.1889162-1-jon@nutanix.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250501020428.1889162-1-jon@nutanix.com>

On Wed, Apr 30, 2025 at 07:04:28PM -0700, Jon Kohler wrote:
> In handle_tx_copy, TX batching processes packets below ~PAGE_SIZE and
> batches up to 64 messages before calling sock->sendmsg.
> 
> Currently, when there are no more messages on the ring to dequeue,
> handle_tx_copy re-enables kicks on the ring *before* firing off the
> batch sendmsg. However, sock->sendmsg incurs a non-zero delay,
> especially if it needs to wake up a thread (e.g., another vhost worker).
> 
> If the guest submits additional messages immediately after the last ring
> check and disablement, it triggers an EPT_MISCONFIG vmexit to attempt to
> kick the vhost worker. This may happen while the worker is still
> processing the sendmsg, leading to wasteful exit(s).
> 
> This is particularly problematic for single-threaded guest submission
> threads, as they must exit, wait for the exit to be processed
> (potentially involving a TTWU), and then resume.
> 
> In scenarios like a constant stream of UDP messages, this results in a
> sawtooth pattern where the submitter frequently vmexits, and the
> vhost-net worker alternates between sleeping and waking.
> 
> A common solution is to configure vhost-net busy polling via userspace
> (e.g., qemu poll-us). However, treating the sendmsg as the "busy"
> period by keeping kicks disabled during the final sendmsg and
> performing one additional ring check afterward provides a significant
> performance improvement without any excess busy poll cycles.
> 
> If messages are found in the ring after the final sendmsg, requeue the
> TX handler. This ensures fairness for the RX handler and allows
> vhost_run_work_list to cond_resched() as needed.
> 
> Test Case
>     TX VM: taskset -c 2 iperf3  -c rx-ip-here -t 60 -p 5200 -b 0 -u -i 5
>     RX VM: taskset -c 2 iperf3 -s -p 5200 -D
>     6.12.0, each worker backed by tun interface with IFF_NAPI setup.
>     Note: TCP side is largely unchanged as that was copy bound
> 
> 6.12.0 unpatched
>     EPT_MISCONFIG/second: 5411
>     Datagrams/second: ~382k
>     Interval         Transfer     Bitrate         Lost/Total Datagrams
>     0.00-30.00  sec  15.5 GBytes  4.43 Gbits/sec  0/11481630 (0%)  sender
> 
> 6.12.0 patched
>     EPT_MISCONFIG/second: 58 (~93x reduction)
>     Datagrams/second: ~650k  (~1.7x increase)
>     Interval         Transfer     Bitrate         Lost/Total Datagrams
>     0.00-30.00  sec  26.4 GBytes  7.55 Gbits/sec  0/19554720 (0%)  sender
> 
> Acked-by: Jason Wang <jasowang@redhat.com>
> Signed-off-by: Jon Kohler <jon@nutanix.com>

Acked-by: Michael S. Tsirkin <mst@redhat.com>

> ---
> v2->v3: Address MST's comments regarding busyloop_intr
> 	https://patchwork.kernel.org/project/netdevbpf/patch/20250420010518.2842335-1-jon@nutanix.com/
> v1->v2: Move from net to net-next (no changes)
> 	https://patchwork.kernel.org/project/netdevbpf/patch/20250401043230.790419-1-jon@nutanix.com/
> ---
>  drivers/vhost/net.c | 30 +++++++++++++++++++++---------
>  1 file changed, 21 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/vhost/net.c b/drivers/vhost/net.c
> index b9b9e9d40951..7cbfc7d718b3 100644
> --- a/drivers/vhost/net.c
> +++ b/drivers/vhost/net.c
> @@ -755,10 +755,10 @@ static void handle_tx_copy(struct vhost_net *net, struct socket *sock)
>  	int err;
>  	int sent_pkts = 0;
>  	bool sock_can_batch = (sock->sk->sk_sndbuf == INT_MAX);
> +	bool busyloop_intr;
>  
>  	do {
> -		bool busyloop_intr = false;
> -
> +		busyloop_intr = false;
>  		if (nvq->done_idx == VHOST_NET_BATCH)
>  			vhost_tx_batch(net, nvq, sock, &msg);
>  
> @@ -769,13 +769,10 @@ static void handle_tx_copy(struct vhost_net *net, struct socket *sock)
>  			break;
>  		/* Nothing new?  Wait for eventfd to tell us they refilled. */
>  		if (head == vq->num) {
> -			if (unlikely(busyloop_intr)) {
> -				vhost_poll_queue(&vq->poll);
> -			} else if (unlikely(vhost_enable_notify(&net->dev,
> -								vq))) {
> -				vhost_disable_notify(&net->dev, vq);
> -				continue;
> -			}
> +			/* Kicks are disabled at this point, break loop and
> +			 * process any remaining batched packets. Queue will
> +			 * be re-enabled afterwards.
> +			 */
>  			break;
>  		}
>  
> @@ -825,7 +822,22 @@ static void handle_tx_copy(struct vhost_net *net, struct socket *sock)
>  		++nvq->done_idx;
>  	} while (likely(!vhost_exceeds_weight(vq, ++sent_pkts, total_len)));
>  
> +	/* Kicks are still disabled, dispatch any remaining batched msgs. */
>  	vhost_tx_batch(net, nvq, sock, &msg);
> +
> +	if (unlikely(busyloop_intr))
> +		/* If interrupted while doing busy polling, requeue the
> +		 * handler to be fair handle_rx as well as other tasks
> +		 * waiting on cpu.
> +		 */
> +		vhost_poll_queue(&vq->poll);
> +	else
> +		/* All of our work has been completed; however, before
> +		 * leaving the TX handler, do one last check for work,
> +		 * and requeue handler if necessary. If there is no work,
> +		 * queue will be reenabled.
> +		 */
> +		vhost_net_busy_poll_try_queue(net, vq);
>  }
>  
>  static void handle_tx_zerocopy(struct vhost_net *net, struct socket *sock)
> -- 
> 2.43.0

