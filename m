Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC96E270EAF
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 10:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744971790; cv=none; b=L/thS70MxiAtMRpi930rOy4y4UA0ky7Hdmx6xj8KhzRQOP0H372xTEQhjQQd+H3vIXOjVr1alfuvZTSUpGOJww3QFHr9TeeknVP8I2rvEqyN9l1pi/yZcioxIzS/pIVrdg0jThU/a5BZW6mM7R5KzJdN4lE06RThuu5KPhZTs90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744971790; c=relaxed/simple;
	bh=qQmApRLfNFtMFt8N8RV6ge+DooDi7AWtQxPYr8Nsjo8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ibMcAEa/udBriaW4m9NXt+nTEjJwwxe63ef62BxHYollXiH9iZWnQMBiS9WZUPP7dq+HS8p+91XLSkJWr1934h7kvA4FpdxNtBk0RCagCE9RBUTwmY1bWPVPucekcTBD2nW1X08vzvbg9vkjBWJ9bh8S742mYg9vyrmgOvnwCX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AD6zzTbJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AD6zzTbJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2BAEC4CEE2;
	Fri, 18 Apr 2025 10:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744971789;
	bh=qQmApRLfNFtMFt8N8RV6ge+DooDi7AWtQxPYr8Nsjo8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AD6zzTbJkwmGuA9TxCDNzuZMV5weZlpx5THuHECOGQ/BRqd3iBzCKFwJQt9KuCpkL
	 3AMKj4AFOwH91rQoHgeHhI9N8Pp0nCb2LTOP0aoxxR6paDDSxVXDn1kgKjHwzpi/4d
	 L7QBr1MoC13i0d7AN5rbiffEvpbVuJ19otYkzQlmtRG5yELxwiTEX6uQOMQmKftblu
	 x3zen0J5BPGBwQ+2OIejCLcQ23YpQo91YE5ujZeUTxIm6HlQ1XGJHYLjqy0kDRCfQM
	 h8Y1YYIVWjYkrME7EyHgw7enQ+/+L12npmnancAnTSy3n+1B3vKWO/mxyCpQEvfasN
	 6mi1baq6BsR1Q==
Message-ID: <9f8fdcc0-53ae-4255-b221-b4e787320c44@kernel.org>
Date: Fri, 18 Apr 2025 19:23:07 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] nvmet: Make blksize_shift configurable
To: Richard Weinberger <richard@sigma-star.at>,
 linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Richard Weinberger <richard@nod.at>, kch@nvidia.com, sagi@grimberg.me,
 hch@lst.de, upstream+nvme@sigma-star.at
References: <20250418090834.2755289-1-richard@nod.at>
 <0e61c6e9-10bc-4272-b446-31e0d67547ce@kernel.org> <8418057.aG60p0z9Xu@anvil>
Content-Language: en-US
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <8418057.aG60p0z9Xu@anvil>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/18/25 18:56, Richard Weinberger wrote:
> On Freitag, 18. April 2025 11:37 'Damien Le Moal' via upstream wrote:
>>> +	if (!ns->blksize_shift)
>>> +		ns->blksize_shift = blksize_bits(bdev_logical_block_size(ns->bdev));
>>
>> If the user set logical block size is smaller than the block dev logical block
>> size, this is not going to work... No ? Am I missing something ?
> 
> Likely, yes.
> TBH, I'm not sure whether it makes actually sense for the bdev case to make
> blksize_shift configurable.

Probably not... I do understand the value for the file case though.

> The case I see most benefit is the backing file case.
> 
>>> +	if (!ns->blksize_shift) {
>>> +		/*
>>> +		 * i_blkbits can be greater than the universally accepted
>>> +		 * upper bound, so make sure we export a sane namespace
>>> +		 * lba_shift.
>>> +		 */
>>> +		ns->blksize_shift = min_t(u8,
>>> +				file_inode(ns->file)->i_blkbits, 12);
>>
>> This will work for any block size, regardless of the FS block size, but only if
>> ns->buffered_io is true. Doesn't this require some more checks with regards to
>> O_DIRECT (!ns->buffered_io case) ?
> 
> Good catch. I'll add a check.

And by the way, you need to check for STATX_DIOALIGN since some FS (e.g. xfs)
can handle direct IOs that are not aligned to the FS block size. See the recent
changes in drivers/block/loop.c to improve direct IO handling, specifically, the
function loop_query_min_dio_size().

-- 
Damien Le Moal
Western Digital Research
