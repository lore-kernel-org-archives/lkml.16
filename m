Received: from out30-101.freemail.mail.aliyun.com (out30-101.freemail.mail.aliyun.com [115.124.30.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83CDA13C9D4
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 01:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749779169; cv=none; b=Tekz7ZmzYpww8T8jnNuUODsVBqOjj8nVEYOyA8zfOvbKjuOn4XVOcyfwLt3GNj9/jfTLU6q/7mWJy+khnJ92t65oHrs/MPz7n6LdkO/HXnwxYsbpWGqofV94pt5sTO/kflhsgUpQyo69Oc34ljDer2VJI/aM+uaqqQ/0XMuPLyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749779169; c=relaxed/simple;
	bh=AIEFXSNFIQ8wHSdxmdtHNoIPh/Lc/0SGjlWekdE0oNU=;
	h=Message-ID:Subject:Date:From:To:Cc:References:In-Reply-To; b=IvdxqoM4ggJC468LARZW5hlZKBW+1k5Pp1Ce0cxiXTOZfxfDTnFxWdQGAHsyg3/zpb6Yio0cBR2Ji0SxVMjC3bbRu2nH2pzly63KLccGMBfBlvialTa/ha0kpmfGs83Fe42RRHh7+lpGzAuumg47j88df8jy+jwySQDFvMiE8mU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=lr6F0E45; arc=none smtp.client-ip=115.124.30.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="lr6F0E45"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1749779164; h=Message-ID:Subject:Date:From:To;
	bh=I1iitAfuyNfHL08DWYkuTZtILYFZ/AGD1QTYq1Beu+c=;
	b=lr6F0E45OH3/cNii0gAVbMPjCFnVWWrO84d2X1Ndazfb0Nehb0FaubBRDtbKSboWJxtV2blNTXNeLHwdCeLYlNVGjYb1jHw4gfo8V7SPGbaeDtp93kZSH4QBZIEGPTybHoGpmbLBEboluQJ7HI01uWQAGTL0Ms/fX/nc3TLmeDY=
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com fp:SMTPD_---0WdiV4L5_1749779163 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 13 Jun 2025 09:46:03 +0800
Message-ID: <1749779153.2349436-2-xuanzhuo@linux.alibaba.com>
Subject: Re: [PATCH v2 1/3] virtio: Fix typo in register_virtio_device() doc comment
Date: Fri, 13 Jun 2025 09:45:53 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: Alok Tiwari <alok.a.tiwari@oracle.com>
Cc: alok.a.tiwari@oracle.com,
 linux-kernel@vger.kernel.org,
 darren.kenny@oracle.com,
 david@redhat.com,
 mst@redhat.com,
 jasowang@redhat.com,
 eperezma@redhat.com,
 virtualization@lists.linux.dev
References: <20250529084350.3145699-1-alok.a.tiwari@oracle.com>
In-Reply-To: <20250529084350.3145699-1-alok.a.tiwari@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

On Thu, 29 May 2025 01:42:39 -0700, Alok Tiwari <alok.a.tiwari@oracle.com> wrote:
> Corrected "suceess" to "success" in the function documentation
> for clarity.
>
> Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>
> Acked-by: Jason Wang <jasowang@redhat.com>

Reviewed-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>

> ---
> v1 -> v2
> No changes; only added Acked-by: Jason Wang.
> ---
>  drivers/virtio/virtio.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/virtio/virtio.c b/drivers/virtio/virtio.c
> index 95d5d7993e5b..2c022640ec4b 100644
> --- a/drivers/virtio/virtio.c
> +++ b/drivers/virtio/virtio.c
> @@ -506,7 +506,7 @@ static int virtio_device_of_init(struct virtio_device *dev)
>   * On error, the caller must call put_device on &@dev->dev (and not kfree),
>   * as another code path may have obtained a reference to @dev.
>   *
> - * Returns: 0 on suceess, -error on failure
> + * Returns: 0 on success, -error on failure
>   */
>  int register_virtio_device(struct virtio_device *dev)
>  {
> --
> 2.47.1
>
