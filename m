Received: from out30-97.freemail.mail.aliyun.com (out30-97.freemail.mail.aliyun.com [115.124.30.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 401532F4317
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 01:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749779598; cv=none; b=bmIHXzJ/A7OGHAJ63MIU8+w9JGiax09hGClg2kRq5Bj4kkubxY93ScMjdj7wZDoGIczbjwTCxLRSZQOCvI91TIaqBLnPKCPuVvn+7eTFp+ql4heKPvdLAjPsUkl/ChQXZ7JugjTXT+w070dQNhZPhfb7JKy0wxBTTWWiyzhSxtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749779598; c=relaxed/simple;
	bh=q2CeiThjXnBn+PX0vpfkOk8gxArW4doBcjm6JOl6Xd4=;
	h=Message-ID:Subject:Date:From:To:Cc:References:In-Reply-To; b=TkY5x72TvF0ht2EAsU+i1C+SgiZQtaxpLElrXmqXrj9YKaVs+4e7+YRSMPRgDeR5MuCuvBpzjBt6JViSUkViD+qpPA/LFwqRbzvQjukbWe+0Txuz1NKhqcZR291SMpqnP1IFjnWOXAOGhKrTln67auUseWi93XRVaQ73azaRW9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=tQylNxta; arc=none smtp.client-ip=115.124.30.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="tQylNxta"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1749779592; h=Message-ID:Subject:Date:From:To;
	bh=5Oe5PaQlPk7LtILWAf2eOzYErXMVWS9+usSmUJzI5Dc=;
	b=tQylNxtaR2P7w5byKAgb+jUb12BRRt1IVVZqcRDVi4YQxIN85Z4H7hhjpeS8XSr191m8wnkb+ZffU2BxdzyKlENlzctkrWc9mvKiyljYuwXYfjHWZ12hof2oDVkAsz3zgycpJ3+Ba8SYGErAZmMW9YigpNPRp/hOudSf2Quh7XI=
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com fp:SMTPD_---0WdifYuV_1749779592 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 13 Jun 2025 09:53:12 +0800
Message-ID: <1749779585.8414617-4-xuanzhuo@linux.alibaba.com>
Subject: Re: [PATCH] virtio: document ENOSPC
Date: Fri, 13 Jun 2025 09:53:05 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Parav Pandit <parav@nvidia.com>,
 Jason Wang <jasowang@redhat.com>,
 =?utf-8?q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>,
 virtualization@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <2e6ec46b8d5e6755be291cec8e2ec57ef286e97b.1748356035.git.mst@redhat.com>
In-Reply-To: <2e6ec46b8d5e6755be291cec8e2ec57ef286e97b.1748356035.git.mst@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

On Tue, 27 May 2025 10:27:19 -0400, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> drivers handle ENOSPC specially since it's an error one can
> get from a working VQ. Document the semantics.
>
> Reported-by: Parav Pandit <parav@nvidia.com>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

Reviewed-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>

> ---
>  drivers/virtio/virtio_ring.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
> index b784aab66867..97ab0cce527d 100644
> --- a/drivers/virtio/virtio_ring.c
> +++ b/drivers/virtio/virtio_ring.c
> @@ -2296,6 +2296,10 @@ static inline int virtqueue_add(struct virtqueue *_vq,
>   * at the same time (except where noted).
>   *
>   * Returns zero or a negative error (ie. ENOSPC, ENOMEM, EIO).
> + *
> + * NB: ENOSPC is a special code that is only returned on an attempt to add a
> + * buffer to a full VQ. It indicates that some buffers are outstanding and that
> + * the operation can be retried after some buffers have been used.
>   */
>  int virtqueue_add_sgs(struct virtqueue *_vq,
>  		      struct scatterlist *sgs[],
> --
> MST
>
