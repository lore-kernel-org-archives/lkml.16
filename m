Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com [95.215.58.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CA4D3BB48
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 16:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749831764; cv=none; b=Zez9zaS+x5H/ymh4w7NlC3yo6saz/bcXm2fKIrrVOVmysr8VqEcAodLHkMnNJJkCOPLjaSLfUrKqKTcBhE218wDKXecSvFLEUCECghLoPoDluEDqlUsm72ZzztVXvlZbuGPt44WFFhiMMNkNw3SqNPqXoRPsifwXHj4wYULjTPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749831764; c=relaxed/simple;
	bh=LDjtHlpn0gp3NwZiAFeYXi0uHXqcQmrxJa87CNTfMms=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lhz8tBeBYZogDqbJ4ZjFPKaRDyAqNqZmrx1eDqgqAKq/lj0WoKX9rcG1ccvUvnJSFx42TJrfwVCp5f91VgzIWe9mp3n2T9tn9m2X6zNguyrQhxxiMx2EFJmflVppRo4cCgGUy/f4JY6TYcHgbrc8CmeVzUvFilPUW7kU6Dp/eJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Qf7zq5Rx; arc=none smtp.client-ip=95.215.58.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Qf7zq5Rx"
Message-ID: <1688e772-3067-4277-ad45-6564b4fbbddf@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1749831760;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H1YhpgIgW1NbawS2cb3Hh7ubcsGLiTlGNXGsiU6ZaTc=;
	b=Qf7zq5RxdrLsiNa7ByBMUkcNbcGe5IV1Q77GGC6RmSD7IZX6wvdvU9QYk6Jb+Eo/L7x5zi
	o6D2q7GRCEQqxZQ4WSYlUfnwobZfu4RctT+lpTYsn+Sufj4l4ARyzJsjDGCOI06lCgtIlm
	e4iEcM4TvL7aoPP78VQKmxN1M/zRnf4=
Date: Fri, 13 Jun 2025 09:22:27 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH net 1/9] net/mlx5: Ensure fw pages are always allocated on
 same NUMA
To: Mark Bloch <mbloch@nvidia.com>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Eric Dumazet <edumazet@google.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Simon Horman <horms@kernel.org>
Cc: saeedm@nvidia.com, gal@nvidia.com, leonro@nvidia.com, tariqt@nvidia.com,
 Leon Romanovsky <leon@kernel.org>, netdev@vger.kernel.org,
 linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org,
 Moshe Shemesh <moshe@nvidia.com>
References: <20250610151514.1094735-1-mbloch@nvidia.com>
 <20250610151514.1094735-2-mbloch@nvidia.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Zhu Yanjun <yanjun.zhu@linux.dev>
In-Reply-To: <20250610151514.1094735-2-mbloch@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

在 2025/6/10 8:15, Mark Bloch 写道:
> From: Moshe Shemesh <moshe@nvidia.com>
> 
> When firmware asks the driver to allocate more pages, using event of
> give_pages, the driver should always allocate it from same NUMA, the
> original device NUMA. Current code uses dev_to_node() which can result
> in different NUMA as it is changed by other driver flows, such as
> mlx5_dma_zalloc_coherent_node(). Instead, use saved numa node for
> allocating firmware pages.

I'm not sure whether NUMA balancing is currently being considered or not.

If I understand correctly, after this commit is applied, all pages will 
be allocated from the same NUMA node — specifically, the original 
device's NUMA node. This seems like it could lead to NUMA imbalance.

By using dev_to_node, it appears that pages could be allocated from 
other NUMA nodes, which might help maintain better NUMA balance.

In the past, I encountered a NUMA balancing issue caused by the mlx5 
NIC, so using dev_to_node might be beneficial in addressing similar 
problems.

Thanks,
Zhu Yanjun

> 
> Fixes: 311c7c71c9bb ("net/mlx5e: Allocate DMA coherent memory on reader NUMA node")
> Signed-off-by: Moshe Shemesh <moshe@nvidia.com>
> Reviewed-by: Tariq Toukan <tariqt@nvidia.com>
> Signed-off-by: Mark Bloch <mbloch@nvidia.com>
> ---
>   drivers/net/ethernet/mellanox/mlx5/core/pagealloc.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/mellanox/mlx5/core/pagealloc.c b/drivers/net/ethernet/mellanox/mlx5/core/pagealloc.c
> index 972e8e9df585..9bc9bd83c232 100644
> --- a/drivers/net/ethernet/mellanox/mlx5/core/pagealloc.c
> +++ b/drivers/net/ethernet/mellanox/mlx5/core/pagealloc.c
> @@ -291,7 +291,7 @@ static void free_4k(struct mlx5_core_dev *dev, u64 addr, u32 function)
>   static int alloc_system_page(struct mlx5_core_dev *dev, u32 function)
>   {
>   	struct device *device = mlx5_core_dma_dev(dev);
> -	int nid = dev_to_node(device);
> +	int nid = dev->priv.numa_node;
>   	struct page *page;
>   	u64 zero_addr = 1;
>   	u64 addr;

