Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A352A72627
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 07:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751355288; cv=none; b=SujJzF/DmSjm09vY5kyg032tkuHW72PyhCPZxWC1eByfZcCW2K4DcXoQAcE4QteCR1H/ImSm5MXmF7fUj6dYHubjxtQiq9R9hHoYIHtFcuJynflOTpBTSLEq5EaTFe7FlyvsaWXVaAnsnAhPE9M+CBFi4uV0Au+SslB9aRfc2BI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751355288; c=relaxed/simple;
	bh=CnJ7g+laoyIJRX+S6qFT+yJN9TWzFT3yscMkhR4S4tQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eqizba43VNoPecXi5USBEbVRmtFYlNA5Rhu+WhfZ9MsdkFE0wPbnDR0nsrrOnrkiR6OTndQ1u9x5uKh42BU6C2VlFXYiWmguSpExqiIpJqqtODxRPASafABUSiIfQ4twktj2vwndUjDTKk+YuDKoOGg/c+8gf9Cvq2d/0J5UswQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eyRHRfbM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eyRHRfbM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC704C4CEEB;
	Tue,  1 Jul 2025 07:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751355288;
	bh=CnJ7g+laoyIJRX+S6qFT+yJN9TWzFT3yscMkhR4S4tQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=eyRHRfbM/kmwdg3sev8ghbqT2/VaeYb950pDlPGq7nwjlY54SgWTdgCikexOvw66Q
	 wBr2e+atV8YuMXdJ1YvhmcJOuwL6rnhNY4rN4HUqXfat9urVOm4zXNA4gFPIaTrsx6
	 VPA/Pz8B/UV6Ub6DHEvO3Y1uc7NTm/PfjevygLBhreivsim36vZ+txAMnyZ58jwXIM
	 xlIh4R3Gvh8DXTXDOFi01t7gV/ADyw76lrKo2F26eNwGTw5Eyfn2a0mSjTapgGmxTq
	 4CoiXc/GKJ/Pj6b9EBZdKEQ9n+WUsP00t4baj0csl1TPOTIfeuw8HBis/SWegq+iUX
	 3ljrdYLLwe6qg==
Message-ID: <7c5b852d-4f29-41c7-a171-c0069771a5e0@kernel.org>
Date: Tue, 1 Jul 2025 16:32:36 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] nvmet: Make blksize_shift configurable
To: Richard Weinberger <richard@sigma-star.at>,
 Richard Weinberger <richard@nod.at>, linux-nvme@lists.infradead.org,
 upstream@sigma-star.at
Cc: linux-kernel@vger.kernel.org, kch@nvidia.com, sagi@grimberg.me,
 hch@lst.de, upstream+nvme@sigma-star.at
References: <20250630191341.1263000-1-richard@nod.at>
 <132c1bdf-e100-4e3a-883f-27f9e9b78020@kernel.org>
 <2920993.eCsiYhmirv@nailgun>
From: Damien Le Moal <dlemoal@kernel.org>
Content-Language: en-US
Organization: Western Digital Research
In-Reply-To: <2920993.eCsiYhmirv@nailgun>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/1/25 4:09 PM, Richard Weinberger wrote:
> On Dienstag, 1. Juli 2025 02:34 'Damien Le Moal' via upstream wrote:
>> On 7/1/25 4:13 AM, Richard Weinberger wrote:
>>> Currently, the block size is automatically configured, and for
>>> file-backed namespaces it is likely to be 4K.
>>> While this is a reasonable default for modern storage, it can
>>> cause confusion if someone wants to export a pre-created disk image
>>> that uses a 512-byte block size.
>>> As a result, partition parsing will fail.
>>>
>>> So, just like we already do for the loop block device, let the user
>>> configure the block size if they know better.
>>
>> Hmm... That fine with me but this explanation does not match what the patch
>> does: you allow configuring the block size bit shift, not the size. That is not
>> super user friendly :)
>>
>> Even if internally you use the block size bit shift, I think it would be better
>> if the user facing interface is the block size as that is much easier to
>> manipulate without having to remember the exponent for powers of 2 values :)
> 
> The initial intention of this patch was exposing the blksize_shift property.
> If we want to expose this as more user friendly, I'm fine with it.
> Maybe "minimum_io_size"?

That likely will be confusing with the existing device limit io_min. I think
block_size is clear.

>> Nit: to avoid the indented if, may be write this like this: ?
>>
>> 	if (!ns->blksize_shift)
>> 		ns->blksize_shift = bdev_blksize_shift;
>>
>> 	if (ns->blksize_shift < bdev_blksize_shift) {
>> 		pr_err("Configured blksize needs to be at least %u for device %s\n",
>> 			bdev_logical_block_size(ns->bdev),
>> 			ns->device_path);
>> 		return -EINVAL;
>> 	}
> 
> It's a matter of taste, but yes...

Absolutely :)

> 
>> Also, if the backend is an HDD, do we want to allow the user to configure a
>> block size that is less than the *physical* block size ? Performance will
>> suffer on regular HDDs and writes may fail with SMR HDDs.
> 
> I'm not sure whether it's worth putting more smartness into this logic.

This may be nice to avoid users shooting themselves in the foot with a bad
setup and us having to deal with bad performance complaints...
If we do not do anything special, we will be stuck with it as a more
restrictive setup later may break some (bad) user setups. That is why I raised
the point :)

>>>  	ns->pi_type = 0;
>>>  	ns->metadata_size = 0;
>>> diff --git a/drivers/nvme/target/io-cmd-file.c b/drivers/nvme/target/io-cmd-file.c
>>> index 2d068439b129c..a4066b5a1dc97 100644
>>> --- a/drivers/nvme/target/io-cmd-file.c
>>> +++ b/drivers/nvme/target/io-cmd-file.c
>>> @@ -49,12 +49,28 @@ int nvmet_file_ns_enable(struct nvmet_ns *ns)
>>>  
>>>  	nvmet_file_ns_revalidate(ns);
>>>  
>>> -	/*
>>> -	 * i_blkbits can be greater than the universally accepted upper bound,
>>> -	 * so make sure we export a sane namespace lba_shift.
>>> -	 */
>>> -	ns->blksize_shift = min_t(u8,
>>> -			file_inode(ns->file)->i_blkbits, 12);
>>> +	if (ns->blksize_shift) {
>>> +		if (!ns->buffered_io) {
>>> +			struct block_device *sb_bdev = ns->file->f_mapping->host->i_sb->s_bdev;
>>> +			struct kstat st;
>>> +
>>> +			if (!vfs_getattr(&ns->file->f_path, &st, STATX_DIOALIGN, 0) &&
>>> +			    (st.result_mask & STATX_DIOALIGN) &&
>>> +			    (1 << ns->blksize_shift) < st.dio_offset_align)
>>> +				return -EINVAL;
>>> +
>>> +			if (sb_bdev && (1 << ns->blksize_shift < bdev_logical_block_size(sb_bdev)))
>>> +				return -EINVAL;
>>
>> I am confused... This is going to check both... But if you got STATX_DIOALIGN
>> and it is OK, you do not need (and probably should not) do the second if, no ?
> 
> I was not sure about that.
> Is it guaranteed that STATX_DIOALIGN returns something sane?

If it is defined by the FS, yes. But it may not be defined, so in that case,
you have to use the fallback of the bdev block size.


-- 
Damien Le Moal
Western Digital Research
