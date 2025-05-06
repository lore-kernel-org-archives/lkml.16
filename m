Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A33327A126
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 09:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746522569; cv=none; b=VtMJKPaeYv7LOevyaZThY49cJ+IliimChbJcfbb048KOcqodKhCMpKAGtAZUNJi3gBMJ2u64hJXUbNSxP/xnK/UolhWoZgUyhZSaSS5r3E3IMy3EORRICiGFis9JAGlo82XJRr+sD2r84ltfjrCu4eiApA7tJYhiguC1And7lxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746522569; c=relaxed/simple;
	bh=FAVp5gt8PSpT2EQxUuM5Z3ZpVFQzfkF4ChHcboUUy+E=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=DHdE/m/MqHjsjxnop9v7Ty2OpSmhbhd41eV96evyvUhV4HaUZqNgyFys7c8ukGKGe6m0Uar3zLBCnzkva2BU5Lj4feVDbayo8O6+qT2gjCGUKkjXXFN7J5rEztEaggz/n0NYvgtef6UzAnvXAWIn42qr38fCIRFjTluHmHmQSzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UNswAuDF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UNswAuDF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1CD5C4CEE4;
	Tue,  6 May 2025 09:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746522568;
	bh=FAVp5gt8PSpT2EQxUuM5Z3ZpVFQzfkF4ChHcboUUy+E=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=UNswAuDFp7+m3dYB43ly7MXiMujbuBIR7N0X2CDZcGdoREIfkrYH29B0GeDFBGDIu
	 D4TEKeQ8B4OC6yOEdHU8cy/sV6vugnPMAaVZwcNrWCv+qzTsb2jXlGLXTdVJYjDCCx
	 Fz7bthFBb3D1uK7bn2h6uzMXbwoolq/GLpoPr3QgfAFesiB8swJYAdJ6J2nCCxHMQo
	 mdFmOyG+hOEfKO5lULSe4nqX3oRiX34aPsR6r7qrgEaA3zwnPSIVyaUcEGtBprAuvI
	 CU2fQsKJoEKgq2U4E6iFx63ciqPpniyRPr8L1cBsx8YGZS9w7Dn2J1HDk7vVS3oyjz
	 hLjCAW1KrNYrA==
Message-ID: <1db80259-a29d-439e-aaff-2a7daac9c1e5@kernel.org>
Date: Tue, 6 May 2025 17:09:26 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, pilhyun.kim@sk.com
Subject: Re: [PATCH v2 1/2] f2fs: Add a method for calculating the remaining
 blocks in the current segment in LFS mode.
To: "yohan.joung" <yohan.joung@sk.com>, jaegeuk@kernel.org,
 daehojeong@google.com
References: <20250502044146.552-1-yohan.joung@sk.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20250502044146.552-1-yohan.joung@sk.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2025/5/2 12:41, yohan.joung wrote:
> In LFS mode, the previous segment cannot use invalid blocks,
> so the remaining blocks from the next_blkoff of the current segment
> to the end of the section are calculated.
> 
> Signed-off-by: yohan.joung <yohan.joung@sk.com>
> ---
>   fs/f2fs/segment.h | 21 +++++++++++++++++----
>   1 file changed, 17 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
> index 03c0f59be5a8..345da052f0e1 100644
> --- a/fs/f2fs/segment.h
> +++ b/fs/f2fs/segment.h
> @@ -582,8 +582,14 @@ static inline bool has_curseg_enough_space(struct f2fs_sb_info *sbi,
>   		if (unlikely(segno == NULL_SEGNO))
>   			return false;
>   
> -		left_blocks = CAP_BLKS_PER_SEC(sbi) -
> -				get_ckpt_valid_blocks(sbi, segno, true);
> +		if (f2fs_lfs_mode(sbi)) {

f2fs_lfs_mode() && __is_large_section(sbi)?

> +			left_blocks = CAP_BLKS_PER_SEC(sbi) -
> +				(segno - rounddown(segno, SEGS_PER_SEC(sbi))) * BLKS_PER_SEG(sbi) -

How about using SEGS_TO_BLKS() which will be more efficient? and what do you
think of introducing a new macro to improve code readability?

#define GET_START_SEG_FROM_SEC(sbi, segno)	(rounddown(segno, SEGS_PER_SEC(sbi)))

> +				CURSEG_I(sbi, i)->next_blkoff;
> +		} else {
> +			left_blocks = CAP_BLKS_PER_SEC(sbi) -
> +					get_ckpt_valid_blocks(sbi, segno, true);
> +		}
>   
>   		blocks = i <= CURSEG_COLD_DATA ? data_blocks : node_blocks;
>   		if (blocks > left_blocks)
> @@ -596,8 +602,15 @@ static inline bool has_curseg_enough_space(struct f2fs_sb_info *sbi,
>   	if (unlikely(segno == NULL_SEGNO))
>   		return false;
>   
> -	left_blocks = CAP_BLKS_PER_SEC(sbi) -
> -			get_ckpt_valid_blocks(sbi, segno, true);
> +	if (f2fs_lfs_mode(sbi)) {

Ditto,

> +		left_blocks = CAP_BLKS_PER_SEC(sbi) -
> +				(segno - rounddown(segno, SEGS_PER_SEC(sbi))) * BLKS_PER_SEG(sbi) -
> +				CURSEG_I(sbi, CURSEG_HOT_DATA)->next_blkoff;

Ditto,

Thanks,

> +	} else {
> +		left_blocks = CAP_BLKS_PER_SEC(sbi) -
> +				get_ckpt_valid_blocks(sbi, segno, true);
> +	}
> +
>   	if (dent_blocks > left_blocks)
>   		return false;
>   	return true;

