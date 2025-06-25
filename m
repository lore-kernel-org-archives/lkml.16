Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89B9A33E1
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 02:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750817966; cv=none; b=I0AlEVyr2GPS7kmgHKNdU5PE0pOhWsdB/v5EZpUxdv4U+pKuCLBln439xK9B9NoU36qu0A6EFH+2fevJV3yAATV0sJim7kYGKTs6PBLG+157FIkr3Oxmu4FGoRHWGBMtTQsas5QGvlzsZmaFb+DR13TFPdJoy5GfH0K/jHwDB+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750817966; c=relaxed/simple;
	bh=eLSWsc8SCSNGTIFoRRKlzCezgqEA7Za59xcoybJc+TI=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=lgSK8Yd5Y+ihV316EnDBjc/DVYPUpo7TEa9lBd1MbOj8AZQNHSjtLsxvUZNEuBxRWhmxviaMVqP9ZWKUyYUXa20gK4vFQFYj+atC20DaiJ5pTKpFLD4IMH5dfvC67+kRsN9oFIpmAZOIxSHYFTXNqsFGtNGuTVj5Y5iCC7ONWiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZjY5qgZJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZjY5qgZJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7076DC4CEE3;
	Wed, 25 Jun 2025 02:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750817966;
	bh=eLSWsc8SCSNGTIFoRRKlzCezgqEA7Za59xcoybJc+TI=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=ZjY5qgZJVbM3eEGV4T3XRMR8Q9MJ+965a6ctIJYwxGTVtfCIEoNOu/X84Eqtfkw/F
	 J1I2yAym+j9Tb1c0NZ6YOaBbDnrUbt6ca46ykHLXyK3ofmAgYvolhVucHcRqxu3naI
	 aYwWq18A9F21lgRfzOGvx1+bZ+Dr0gyti9ALE7PcnqX2Vh15ZqbC1Rb4pW451v19b5
	 h9PmwkZ7MHbQKeX3GUKCKFnLs3HU6etNWwNMlWfFli59aiGjWGumeS/4p8rWLmvlz9
	 VYMHHxmVD1UTJMC/A7a3y2zm/d785Jy5LOsN+d+X6Fwqyxau/WJwXTeArkb6Z6AMHo
	 LwEWJbBSDkUCQ==
Message-ID: <29dac4f4-3f46-49b6-8a9f-c26ffcde11d0@kernel.org>
Date: Wed, 25 Jun 2025 10:19:22 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, abinashsinghlalotra@gmail.com, jaegeuk@kernel.org,
 linux-kernel@vger.kernel.org,
 syzbot+b8c1d60e95df65e827d4@syzkaller.appspotmail.com
Subject: Re: [PATCH v3] f2fs: fix KMSAN uninit-value in extent_info usage
To: Abinash Singh <abinashlalotra@gmail.com>,
 linux-f2fs-devel@lists.sourceforge.net
References: <1669c05c-7468-4347-a924-cfc4145c8c75@kernel.org>
 <20250624170948.59013-1-abinashsinghlalotra@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20250624170948.59013-1-abinashsinghlalotra@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/25/25 01:09, Abinash Singh wrote:
> KMSAN reported a use of uninitialized value in `__is_extent_mergeable()`
>  and `__is_back_mergeable()` via the read extent tree path.
> 
> The root cause is that `get_read_extent_info()` only initializes three
> fields (`fofs`, `blk`, `len`) of `struct extent_info`, leaving the
> remaining fields uninitialized. This leads to undefined behavior
> when those fields are accessed later, especially during 
> extent merging.
> 
> Fix it by zero-initializing the `extent_info` struct before population.
> 
> Reported-by: syzbot+b8c1d60e95df65e827d4@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=b8c1d60e95df65e827d4
> Fixes: a28ef1f5aebe ("f2fs: maintain extent cache in separated file")

Should use this instead?

Fixes: 94afd6d6e525 ("f2fs: extent cache: support unaligned extent")

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,

> Signed-off-by: Abinash Singh <abinashsinghlalotra@gmail.com>
> ---
> v3 : Added Fixes and Closes tags
> ---
>  fs/f2fs/extent_cache.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/extent_cache.c b/fs/f2fs/extent_cache.c
> index cfe925a3d555..4ce19a310f38 100644
> --- a/fs/f2fs/extent_cache.c
> +++ b/fs/f2fs/extent_cache.c
> @@ -414,7 +414,7 @@ void f2fs_init_read_extent_tree(struct inode *inode, struct folio *ifolio)
>  	struct f2fs_extent *i_ext = &F2FS_INODE(&ifolio->page)->i_ext;
>  	struct extent_tree *et;
>  	struct extent_node *en;
> -	struct extent_info ei;
> +	struct extent_info ei = {0};
>  
>  	if (!__may_extent_tree(inode, EX_READ)) {
>  		/* drop largest read extent */

