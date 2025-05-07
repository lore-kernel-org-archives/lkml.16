Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3899221723
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 08:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746606329; cv=none; b=tlSYIKZZ/vMKe6sqoRs7OsofX1EdcsuMx5juDk4yvQw3U4Ybejiz1RzrTI5yvo6q2cxe8qvJiR14hR0ibbzdpMBuqpM0XUuB77ih7S4yV+Nh50Yrb6P4kXdBn/oK4BdSizNl1qqUTO5ri7fQPBAE2nQJBn9FIXbz8TUYdLNQRmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746606329; c=relaxed/simple;
	bh=OHTRZaNtriLqkULeuZpFqR5miAeK7XH76kJ1OIoEIp8=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=dCbvcMqJWmv5Si3S/KkzMH8SxTxsGEtaP1iH/6Bvrti93rMnioRu/ksD6j/1kIemJnY7fRfj+/W9cUM5O1FSVxD16qMwg/nEgQCyGnlVz3pqRRQqeYmZq+VjCLmfoVh/aJS/UwsgzoEi11Q6FWsEF9MuxNkDX99NcwIDEe0WSXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Iz2x9TX7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Iz2x9TX7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C6F5C4CEE7;
	Wed,  7 May 2025 08:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746606328;
	bh=OHTRZaNtriLqkULeuZpFqR5miAeK7XH76kJ1OIoEIp8=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=Iz2x9TX7mItLvPjvCTtG/DtUzTG7cG+vx3C67sliDFTZCVNDt+RugtMjL0Alnr541
	 RG7XUUgt+11Go+hjm2B5WUUklfqlRugw4kon/1qwToK7HyQaEU/LRPq4uMxjY2t7hg
	 TeLOU927tc9BG8gTdsGJJaCY9FIiJ6wdsCXTZ48WFRr+fXTxzm5NbRZe7S56OW1/Tl
	 m1XsqwJnz+wZFBS0aO/3yKJ8vBvyVcofv1qdRKw8K5hY8OyrpjK9y6OEpooW8F9Q1+
	 EdfkJxV42kihFZIpSVTZ4UKrxGG7K7rtYPI9vWzFHpkcAMcQL8D+HXpLPWJc2lAmaS
	 uM9zTsk6FzQMg==
Message-ID: <ddbb5e57-5a50-40fe-96ef-c2a3c0c72a13@kernel.org>
Date: Wed, 7 May 2025 16:25:25 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, pilhyun.kim@sk.com
Subject: Re: [PATCH v3 1/2] f2fs: add a method for calculating the remaining
 blocks in the current segment in LFS mode.
To: "yohan.joung" <yohan.joung@sk.com>, jaegeuk@kernel.org,
 daehojeong@google.com
References: <20250507043038.591-1-yohan.joung@sk.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20250507043038.591-1-yohan.joung@sk.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/7/25 12:30, yohan.joung wrote:
> In LFS mode, the previous segment cannot use invalid blocks,
> so the remaining blocks from the next_blkoff of the current segment
> to the end of the section are calculated.
> 
> Signed-off-by: yohan.joung <yohan.joung@sk.com>
> ---
>  fs/f2fs/segment.h | 23 +++++++++++++++++++----
>  1 file changed, 19 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
> index 03c0f59be5a8..f5d30f32ebdb 100644
> --- a/fs/f2fs/segment.h
> +++ b/fs/f2fs/segment.h
> @@ -102,6 +102,8 @@ static inline void sanity_check_seg_type(struct f2fs_sb_info *sbi,
>  #define CAP_SEGS_PER_SEC(sbi)					\
>  	(SEGS_PER_SEC(sbi) -					\
>  	BLKS_TO_SEGS(sbi, (sbi)->unusable_blocks_per_sec))
> +#define GET_START_SEG_FROM_SEC(sbi, segno)			\
> +	(rounddown(segno, SEGS_PER_SEC(sbi)))
>  #define GET_SEC_FROM_SEG(sbi, segno)				\
>  	(((segno) == -1) ? -1 : (segno) / SEGS_PER_SEC(sbi))
>  #define GET_SEG_FROM_SEC(sbi, secno)				\
> @@ -582,8 +584,14 @@ static inline bool has_curseg_enough_space(struct f2fs_sb_info *sbi,
>  		if (unlikely(segno == NULL_SEGNO))
>  			return false;
>  
> -		left_blocks = CAP_BLKS_PER_SEC(sbi) -
> -				get_ckpt_valid_blocks(sbi, segno, true);
> +		if (f2fs_lfs_mode(sbi) && __is_large_section(sbi)) {
> +			left_blocks = CAP_BLKS_PER_SEC(sbi) -
> +				(segno - GET_START_SEG_FROM_SEC(sbi, segno)) * BLKS_PER_SEG(sbi) -

SEGS_TO_BLKS(sbi, (segno - GET_START_SEG_FROM_SEC(sbi, segno))) ?

> +				CURSEG_I(sbi, i)->next_blkoff;
> +		} else {
> +			left_blocks = CAP_BLKS_PER_SEC(sbi) -
> +					get_ckpt_valid_blocks(sbi, segno, true);
> +		}
>  
>  		blocks = i <= CURSEG_COLD_DATA ? data_blocks : node_blocks;
>  		if (blocks > left_blocks)
> @@ -596,8 +604,15 @@ static inline bool has_curseg_enough_space(struct f2fs_sb_info *sbi,
>  	if (unlikely(segno == NULL_SEGNO))
>  		return false;
>  
> -	left_blocks = CAP_BLKS_PER_SEC(sbi) -
> -			get_ckpt_valid_blocks(sbi, segno, true);
> +	if (f2fs_lfs_mode(sbi) && __is_large_section(sbi)) {
> +		left_blocks = CAP_BLKS_PER_SEC(sbi) -
> +				(segno - GET_START_SEG_FROM_SEC(sbi, segno)) * BLKS_PER_SEG(sbi) -

Ditto,

> +				CURSEG_I(sbi, CURSEG_HOT_DATA)->next_blkoff;
> +	} else {
> +		left_blocks = CAP_BLKS_PER_SEC(sbi) -
> +				get_ckpt_valid_blocks(sbi, segno, true);
> +	}
> +
>  	if (dent_blocks > left_blocks)
>  		return false;
>  	return true;

