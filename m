Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 330C924EAB1
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 14:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750774570; cv=none; b=QYLC1DHn2FMgsyCcqyfDyxV3mJ2np6UKpU/lMby2xfOM87qGkEFyMG/p3rS883haRYwidh+BVaetBO2gllIyb1UjlzNv2pICm0x1hqv52nVdmk/NpFKDawjwUvFfJcRL+Md+rArvFqzbsFKl13YXqQUs3ASqtF3iFqGJb/9bjo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750774570; c=relaxed/simple;
	bh=APRJ75gDDgjrFelZorQyx/we/9Q0+eEodhRUdBFHpAQ=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=TV/Dypz+kFnjppNRILa6V+uxp3V1IOmF7C//I/KQFElc6hqo03ELYxzWZ4c6e47MMQyOC38TAeQLSkphXlf7NErowodd2q7QVldhsJA+Rf3PCJF0693/mpLjmP8+XNL4bggK/HKOP6/ixsJlc5eGurLj2PqtYXXbp00GWKnnsz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rAk4Wn24; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rAk4Wn24"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0381C4CEE3;
	Tue, 24 Jun 2025 14:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750774569;
	bh=APRJ75gDDgjrFelZorQyx/we/9Q0+eEodhRUdBFHpAQ=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=rAk4Wn249dTFd5Emt922vdewi1qVT7QCVZohFukFQw4dcOVJku25zBI3VpJP2lK69
	 SJyBwiuT35xOz3jIg99MsQ05HgliYrr1dVFnuPYOB/ED+wTvq3t/mnGAvmT9bj5jDt
	 2QlqM2ZYFz5t40L4dU2eZDbELsneQxQJZX4pySq4zXhKELBwgR75s1vfOMalbo6Jhg
	 EohaP61uzhO8jsTzsdEUmIBDNvEMDOjhqUo5sH1qqsO71nGMaeWMRpsGodVjeM1M+R
	 rWzjx78pUfMR0fC0wV9WjlsGCi8rm56Ot+wHIxA/W534CLbSlMnG4nd7tETauMZylk
	 NONDtjPx9F4dQ==
Message-ID: <1669c05c-7468-4347-a924-cfc4145c8c75@kernel.org>
Date: Tue, 24 Jun 2025 22:16:05 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 Abinash Singh <abinashsinghlalotra@gmail.com>,
 syzbot+b8c1d60e95df65e827d4@syzkaller.appspotmail.com
Subject: Re: [PATCH v2] f2fs: fix KMSAN uninit-value in extent_info usage
To: Abinash Singh <abinashlalotra@gmail.com>,
 linux-f2fs-devel@lists.sourceforge.net
References: <20250619120933.125932-1-abinashsinghlalotra@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20250619120933.125932-1-abinashsinghlalotra@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2025/6/19 20:09, Abinash Singh wrote:
> KMSAN reported a use of uninitialized value in `__is_extent_mergeable()` and
> `__is_back_mergeable()` via the read extent tree path.
> 
> The root cause is that `get_read_extent_info()` only initializes three fields
> (`fofs`, `blk`, `len`) of `struct extent_info`, leaving the remaining fields
> uninitialized. This leads to undefined behavior when those fields are accessed
> later, especially during extent merging.
> 
> Fix it by zero-initializing the `extent_info` struct before population.
> 

It needs to add a fixes line, otherwise, it looks good to me.

Thanks,

> Reported-by: syzbot+b8c1d60e95df65e827d4@syzkaller.appspotmail.com
> Signed-off-by: Abinash Singh <abinashsinghlalotra@gmail.com>
> 
> ---
> v2 : Corrected Author name
> ---
>   fs/f2fs/extent_cache.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/extent_cache.c b/fs/f2fs/extent_cache.c
> index cfe925a3d555..4ce19a310f38 100644
> --- a/fs/f2fs/extent_cache.c
> +++ b/fs/f2fs/extent_cache.c
> @@ -414,7 +414,7 @@ void f2fs_init_read_extent_tree(struct inode *inode, struct folio *ifolio)
>   	struct f2fs_extent *i_ext = &F2FS_INODE(&ifolio->page)->i_ext;
>   	struct extent_tree *et;
>   	struct extent_node *en;
> -	struct extent_info ei;
> +	struct extent_info ei = {0};
>   
>   	if (!__may_extent_tree(inode, EX_READ)) {
>   		/* drop largest read extent */

