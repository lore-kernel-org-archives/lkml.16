Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C11582AE66
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 09:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744969037; cv=none; b=CR5YeU1l1yLsqJftbW0GzjgjRZJlbx/qaaeMrR3odB1YgjBsu/Gc0oljj0tIey3dHmWg8OFZUay/oZ1zEGuVoPw8wg8nUCpK9EgL0qZf+pNgSdpoh/FqELyZPsPVInyXfIRXhYhWKQy1TOWM9NMsCY6NsRPkROFfyXzH1WJqPLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744969037; c=relaxed/simple;
	bh=U2qVuo/RpKSkmtroRaqI+s1mXX43CzeMJ3Wnjjr7Dag=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H/mkbqgYUnMKe+BidJ3e4nqvAgOoJvlC1kDmOUnXpbj2TRxWSSNkvJnUMaaoSvmCLXq1KcTfVXVszAA4rI9T/6HgOj2FSEXJnZ8bA8drcd5NCjshrhr6zsXtoJ6gLFkDQ3ga2zk2QHjuD0Wg2+gy2EDOemZof3cze6qhVWu17HM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=paoItzaU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="paoItzaU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E214C4CEE2;
	Fri, 18 Apr 2025 09:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744969037;
	bh=U2qVuo/RpKSkmtroRaqI+s1mXX43CzeMJ3Wnjjr7Dag=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=paoItzaU9isehD2ywFP7hzAMAUXiRrArBqI3hsWK936mylQH+GA/ZdAJpHvOWh4hg
	 l8QKlbr1JVvjIqDOhvu3bhwB9PYZk/UKGKfBf5b5tisDE4wlRGijoAnZ7T7oSVVBPt
	 XGosINofvYmi8xC3+xTkfHacjaAL63o4FKDniRKQ/Tw6W9DBPOzh46JXt46OObaJIc
	 XVXw85AOM9iejPbtN/oM18kqY7B6bkLefQkfFAde5feJ1TPbUNN8oAx3tNx8Saa6A5
	 6smM8ItFny8EuOfF8AT+w0/6+Y0WxKBI44/N6127Gx/VnJe9t8gZ+HRFESxb/dy8Et
	 bJ6qZOYeKmkzQ==
Message-ID: <0e61c6e9-10bc-4272-b446-31e0d67547ce@kernel.org>
Date: Fri, 18 Apr 2025 18:37:15 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] nvmet: Make blksize_shift configurable
To: Richard Weinberger <richard@nod.at>, linux-nvme@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, kch@nvidia.com, sagi@grimberg.me,
 hch@lst.de, upstream+nvme@sigma-star.at
References: <20250418090834.2755289-1-richard@nod.at>
Content-Language: en-US
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <20250418090834.2755289-1-richard@nod.at>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/18/25 18:08, Richard Weinberger wrote:
> Currently, the block size is automatically configured, and for
> file-backed namespaces it is likely to be 4K.
> While this is a reasonable default for modern storage, it can
> cause confusion if someone wants to export a pre-created disk image
> that uses a 512-byte block size.
> As a result, partition parsing will fail.
> 
> So, just like we already do for the loop block device, let the user
> configure the block size if they know better.
> 
> Signed-off-by: Richard Weinberger <richard@nod.at>
> ---
>  drivers/nvme/target/configfs.c    | 30 ++++++++++++++++++++++++++++++
>  drivers/nvme/target/io-cmd-bdev.c |  4 +++-
>  drivers/nvme/target/io-cmd-file.c | 15 +++++++++------
>  3 files changed, 42 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/nvme/target/configfs.c b/drivers/nvme/target/configfs.c
> index e44ef69dffc2..2fd9cc3b1d00 100644
> --- a/drivers/nvme/target/configfs.c
> +++ b/drivers/nvme/target/configfs.c
> @@ -797,6 +797,35 @@ static ssize_t nvmet_ns_resv_enable_store(struct config_item *item,
>  }
>  CONFIGFS_ATTR(nvmet_ns_, resv_enable);
>  
> +static ssize_t nvmet_ns_blksize_shift_show(struct config_item *item, char *page)
> +{
> +	return sysfs_emit(page, "%d\n", to_nvmet_ns(item)->blksize_shift);
> +}
> +
> +static ssize_t nvmet_ns_blksize_shift_store(struct config_item *item,
> +		const char *page, size_t count)
> +{
> +	struct nvmet_ns *ns = to_nvmet_ns(item);
> +	u32 shift;
> +	int ret;
> +
> +	ret = kstrtou32(page, 0, &shift);
> +	if (ret)
> +		return ret;
> +
> +	mutex_lock(&ns->subsys->lock);
> +	if (ns->enabled) {
> +		pr_err("the ns:%d is already enabled.\n", ns->nsid);
> +		mutex_unlock(&ns->subsys->lock);
> +		return -EINVAL;
> +	}
> +	ns->blksize_shift = shift;
> +	mutex_unlock(&ns->subsys->lock);
> +
> +	return count;
> +}
> +CONFIGFS_ATTR(nvmet_ns_, blksize_shift);
> +
>  static struct configfs_attribute *nvmet_ns_attrs[] = {
>  	&nvmet_ns_attr_device_path,
>  	&nvmet_ns_attr_device_nguid,
> @@ -806,6 +835,7 @@ static struct configfs_attribute *nvmet_ns_attrs[] = {
>  	&nvmet_ns_attr_buffered_io,
>  	&nvmet_ns_attr_revalidate_size,
>  	&nvmet_ns_attr_resv_enable,
> +	&nvmet_ns_attr_blksize_shift,
>  #ifdef CONFIG_PCI_P2PDMA
>  	&nvmet_ns_attr_p2pmem,
>  #endif
> diff --git a/drivers/nvme/target/io-cmd-bdev.c b/drivers/nvme/target/io-cmd-bdev.c
> index 83be0657e6df..a86010af4670 100644
> --- a/drivers/nvme/target/io-cmd-bdev.c
> +++ b/drivers/nvme/target/io-cmd-bdev.c
> @@ -100,7 +100,9 @@ int nvmet_bdev_ns_enable(struct nvmet_ns *ns)
>  	}
>  	ns->bdev = file_bdev(ns->bdev_file);
>  	ns->size = bdev_nr_bytes(ns->bdev);
> -	ns->blksize_shift = blksize_bits(bdev_logical_block_size(ns->bdev));
> +
> +	if (!ns->blksize_shift)
> +		ns->blksize_shift = blksize_bits(bdev_logical_block_size(ns->bdev));

If the user set logical block size is smaller than the block dev logical block
size, this is not going to work... No ? Am I missing something ?

>  
>  	ns->pi_type = 0;
>  	ns->metadata_size = 0;
> diff --git a/drivers/nvme/target/io-cmd-file.c b/drivers/nvme/target/io-cmd-file.c
> index 2d068439b129..5893b64179fb 100644
> --- a/drivers/nvme/target/io-cmd-file.c
> +++ b/drivers/nvme/target/io-cmd-file.c
> @@ -49,12 +49,15 @@ int nvmet_file_ns_enable(struct nvmet_ns *ns)
>  
>  	nvmet_file_ns_revalidate(ns);
>  
> -	/*
> -	 * i_blkbits can be greater than the universally accepted upper bound,
> -	 * so make sure we export a sane namespace lba_shift.
> -	 */
> -	ns->blksize_shift = min_t(u8,
> -			file_inode(ns->file)->i_blkbits, 12);
> +	if (!ns->blksize_shift) {
> +		/*
> +		 * i_blkbits can be greater than the universally accepted
> +		 * upper bound, so make sure we export a sane namespace
> +		 * lba_shift.
> +		 */
> +		ns->blksize_shift = min_t(u8,
> +				file_inode(ns->file)->i_blkbits, 12);

This will work for any block size, regardless of the FS block size, but only if
ns->buffered_io is true. Doesn't this require some more checks with regards to
O_DIRECT (!ns->buffered_io case) ?

> +	}
>  
>  	ns->bvec_pool = mempool_create(NVMET_MIN_MPOOL_OBJ, mempool_alloc_slab,
>  			mempool_free_slab, nvmet_bvec_cache);


-- 
Damien Le Moal
Western Digital Research
