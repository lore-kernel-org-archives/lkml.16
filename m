Received: from out30-112.freemail.mail.aliyun.com (out30-112.freemail.mail.aliyun.com [115.124.30.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72EC8190664
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 08:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.112
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750752340; cv=none; b=PV37o2qADihQiYym0A2JC9slRtgaA4iqQPcDR54IVZkfk0kb45O9sP/isl83UHZr/bKLhMApmlHCKyqjqOyZjut6pwAEDxRowMayzy0sk/5h6nOBGTUYc4gcbAyu8QO/iyCWVpuCcXwuHKWadfRltu/QeiGTdgXC/1M2kpVk8j4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750752340; c=relaxed/simple;
	bh=OOHl80Amv7LsMw/nLpiLiGVcG1W77N8pyOuxxY52d2c=;
	h=Message-ID:Subject:Date:From:To:Cc:References:In-Reply-To; b=LQljVrchFidzOxoWSOmfvXze+6GMSmQgHt8WM43uC7jjYG8YhgQD0+U/8ARFiIG0yJMwE7leLZ7O1WE4gBHr3e14YZlvKINxXz2NdkcS4DVyW3dxb/KR82iRqPWw65XLpulSlatggjz9SMpOyLraPt7DChee9baEq3syBnILmfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=wsHZCulC; arc=none smtp.client-ip=115.124.30.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="wsHZCulC"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1750752334; h=Message-ID:Subject:Date:From:To;
	bh=c4oc/DhyhfboKsUraQ8BYgRzmZfqoCc+i4h7UMv5VHY=;
	b=wsHZCulCclATlhkfrl7vKatPN9K5MGJHjb/0GAcebXALkdejONIEqX7OIiMtlBvF+E9u99XIwUKeQSB33048gIk8xSnMWtG1jOZfv1AM6wMvwc5Pfb/SoYNyc89wfzIT+shyjC/xLmzVjVB/6H+Ipj6u1DEVNJyj97999romCPg=
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com fp:SMTPD_---0Wefzrg-_1750752332 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 24 Jun 2025 16:05:33 +0800
Message-ID: <1750752321.449211-2-xuanzhuo@linux.alibaba.com>
Subject: Re: [PATCH] virtio: virtio_dma_buf: fix missing parameter documentation
Date: Tue, 24 Jun 2025 16:05:21 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: WangYuli <wangyuli@uniontech.com>
Cc: virtualization@lists.linux.dev,
 linux-kernel@vger.kernel.org,
 zhanjun@uniontech.com,
 niecheng1@uniontech.com,
 guanwentao@uniontech.com,
 WangYuli <wangyuli@uniontech.com>,
 mst@redhat.com,
 jasowang@redhat.com,
 eperezma@redhat.com
References: <241C7118259DA110+20250623065210.270237-1-wangyuli@uniontech.com>
In-Reply-To: <241C7118259DA110+20250623065210.270237-1-wangyuli@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

On Mon, 23 Jun 2025 14:52:10 +0800, WangYuli <wangyuli@uniontech.com> wrote:
> Add missing parameter documentation for virtio_dma_buf_attach()
> function to fix kernel-doc warnings:
>
> Warning: drivers/virtio/virtio_dma_buf.c:41 function parameter 'dma_buf' not described in 'virtio_dma_buf_attach'
> Warning: drivers/virtio/virtio_dma_buf.c:41 function parameter 'attach' not described in 'virtio_dma_buf_attach'
>
> The function documentation was missing descriptions for both the
> 'dma_buf' and 'attach' parameters. Add proper parameter documentation
> following kernel-doc format.
>
> Signed-off-by: WangYuli <wangyuli@uniontech.com>

Reviewed-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>

> ---
>  drivers/virtio/virtio_dma_buf.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/virtio/virtio_dma_buf.c b/drivers/virtio/virtio_dma_buf.c
> index 3fe1d03b0645..95c10632f84a 100644
> --- a/drivers/virtio/virtio_dma_buf.c
> +++ b/drivers/virtio/virtio_dma_buf.c
> @@ -36,6 +36,8 @@ EXPORT_SYMBOL(virtio_dma_buf_export);
>
>  /**
>   * virtio_dma_buf_attach - mandatory attach callback for virtio dma-bufs
> + * @dma_buf: [in] buffer to attach
> + * @attach: [in] attachment structure
>   */
>  int virtio_dma_buf_attach(struct dma_buf *dma_buf,
>  			  struct dma_buf_attachment *attach)
> --
> 2.50.0
>
