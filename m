Received: from out199-2.us.a.mail.aliyun.com (out199-2.us.a.mail.aliyun.com [47.90.199.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE6BF2905
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 01:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=47.90.199.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743385839; cv=none; b=iNqlrrvTcP8xTjBK3WCbmXN9ifAuvOAOWSGb9rimYnqylV3qGFX0yhgKTKXLJsKO4BERt5zyDSUb+jXAtOP170pyguoMyCaXObOCqAhzqvR/oxZum0ikgQL7rHi7TE9C6vvtUDvp+JkftLhvUX1HcEzE1BVn2/+p1ZBkuNMcbDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743385839; c=relaxed/simple;
	bh=yz62TKK6huhFh0HWx99pfPawYWTuAWXT+s00Gpt22t8=;
	h=Message-ID:Subject:Date:From:To:Cc:References:In-Reply-To; b=Tf4VVnaX8Y1ENI8rYckEmTPHL7YHWqrumYSDbWyjfBjEHFHQrYN3F/yle+JpZEQuLALu3LxPXdM3qqK2SpsCNEg1AY0Gb+OFgUPQxqLy3YeDIHP8RrP7d2HDARtu36dsEjBxItFNzLxT01Ciq0nO6zm92G9OQxUZKWRdZ2oujDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=aQUqhZWl; arc=none smtp.client-ip=47.90.199.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="aQUqhZWl"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1743385819; h=Message-ID:Subject:Date:From:To;
	bh=jHOq3QtmwewmuGcfwHQ9jM68BB3uetbBtMD2GTM1Pxc=;
	b=aQUqhZWll5acCKjzyf8jKTt+v6TPzSN4Yi7YHGpLDDwOTO++ogETSbI1mG3L1t5nJYx9bbnvYHplzZPJ5ulIVyA5C9H26EgcHyRk2LoghCLEpLzLk+u6NlOYukU1CG2CjM0sM2XZdMIIEmLbnN25etKMaRES1JOAbBwwIS9u1fM=
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com fp:SMTPD_---0WTOXjik_1743385819 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 31 Mar 2025 09:50:19 +0800
Message-ID: <1743385770.0724318-1-xuanzhuo@linux.alibaba.com>
Subject: Re: [PATCH 00/19] virtio_ring in order support
Date: Mon, 31 Mar 2025 09:49:30 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: Jason Wang <jasowang@redhat.com>
Cc: eperezma@redhat.com,
 virtualization@lists.linux.dev,
 linux-kernel@vger.kernel.org,
 mst@redhat.com,
 jasowang@redhat.com
References: <20250324054333.1954-1-jasowang@redhat.com>
In-Reply-To: <20250324054333.1954-1-jasowang@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>


For series:

Reviewed-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>

Thanks.

On Mon, 24 Mar 2025 13:43:14 +0800, Jason Wang <jasowang@redhat.com> wrote:
> Hello all:
>
> This sereis tries to implement the VIRTIO_F_IN_ORDER to
> virtio_ring. This is done by introducing virtqueue ops so we can
> implement separate helpers for different virtqueue layout/features
> then the in-order were implmeented on top.
>
> Tests shows 5% imporvemnt in RX PPS with KVM guest + testpmd on the
> host.
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
>   virtio_ring: move next_avail_idx to vring_virtqueue
>   virtio_ring: factor out split indirect detaching logic
>   virtio_ring: add in order support
>
>  drivers/virtio/virtio_ring.c | 856 ++++++++++++++++++++++++++---------
>  1 file changed, 653 insertions(+), 203 deletions(-)
>
> --
> 2.42.0
>
