Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C8841D61BC
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 07:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746601779; cv=none; b=UigXrfXYSXED89khqLJLuIIWeQUKiIH3YpMarOXhBLhLQ/Pzwhf/5QFd4hzF9ivLB13wCMrqsA5x2LSqXlQ3Ns4SEp8i20VRVV7qqJMRnFTba5LU0/E5BFPkJfyxnI8MDbOqugmFGjT38UMIVgG36PaVilssMpHgTwDHtFFE+u4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746601779; c=relaxed/simple;
	bh=QdsZwbUfeSm//b7NNqX/50NGWSbdSUMX1Gm8cyHuCXw=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=sEb1xONDoh+7h0EcQfKgXEkYEywN/38R6fEPQTqE2RyfmF33ElzIHd0oJ9edEd+rHJr1o7JY713gZ2hRpZ6gFQbxgx+ZJFdEYzi0afs26ISaZEf6QXhynHi4BRsEGPlMiwD4x6qw3ZcqZdZWkgbkN01B83ZG885NFEPSeHJAQhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sJ30fFQL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sJ30fFQL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27951C4CEE7;
	Wed,  7 May 2025 07:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746601778;
	bh=QdsZwbUfeSm//b7NNqX/50NGWSbdSUMX1Gm8cyHuCXw=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=sJ30fFQLJ/5HlQtH851cjhL9gN6YAiW7d2ZmkZoV2IMchhlaLleIorpmmDjHU2IV3
	 F4B1cUJxRQro/bT6yeKppu18oU9TJ1GvdupZ9/zDQL9pYoqtgd5x5/4qs/38eS/Mlg
	 pdoFiD3JQmpXSq0KN6TnwdSzyn4H+RUY8YljEdg9pPJfZ8Oh4D+LskuWnWk4Jt2uJL
	 LTar5q8HLohse9V3qKf44Y+aAe2wYdvoZgQ9zYzTJgDJIOiCtsYNgbSdW+AIVxZiyK
	 FDRouWHzq28mxwVwBvsLDpPZcieL4RjKRBMf34txMPtfdhPFXKFQnJxbTacsKMf2jU
	 gWYaf4+dkEDTA==
Message-ID: <9b8e24ac-500e-4d53-acbe-a9f97794a498@kernel.org>
Date: Wed, 7 May 2025 15:09:35 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] f2fs: don't return AOP_WRITEPAGE_ACTIVATE from
 f2fs_write_single_data_page
To: Christoph Hellwig <hch@lst.de>
References: <20250505092613.3451524-1-hch@lst.de>
 <20250505092613.3451524-3-hch@lst.de>
 <aab08ad6-22db-44f3-9924-97e096cb0619@kernel.org>
 <20250507064437.GA31135@lst.de>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20250507064437.GA31135@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/7/25 14:44, Christoph Hellwig wrote:
> On Wed, May 07, 2025 at 02:28:55PM +0800, Chao Yu wrote:
>>> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
>>> index e016b0f96313..ce63b3bfb28f 100644
>>> --- a/fs/f2fs/compress.c
>>> +++ b/fs/f2fs/compress.c
>>> @@ -1565,10 +1565,7 @@ static int f2fs_write_raw_pages(struct compress_ctx *cc,
>>>  						NULL, NULL, wbc, io_type,
>>>  						compr_blocks, false);
>>>  		if (ret) {
>>> -			if (ret == AOP_WRITEPAGE_ACTIVATE) {
>>> -				folio_unlock(folio);
>>> -				ret = 0;
>>
>> Previously, for this case, it will goto out label rather than writing
>> left pages?
> 
> Indeed.  Is that the right thing to do here?

IIRC, once it failed to write one page, it redirties all left pages, and tries
to rewrite them again, it can avoid fragment as much as possible.

So can we keep original implementation here?

Thanks,

