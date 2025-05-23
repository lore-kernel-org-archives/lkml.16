Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04C932DCBE6
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 02:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747965999; cv=none; b=pQval+1WWS4mMz6MeDDs3P1HC8J4EImvxNZ0xgO3dHWpaDfPxx5XFXxruExfUH0tQEQP0xl/otiDiINbzvI7jV4Z3HXUwy0ypAu1XYg/7xE6hrjujuJZdW2vOZm34lGCJjPDfs91BMMoxrFdUC/wavJT9YCsygI4V3V/VhwbFZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747965999; c=relaxed/simple;
	bh=bsverSMWOBBf3YTQTuwFn4B8Z1u7ywDlbc3NJ9mtuHE=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=uNk9beJPfbNMGjHXfWLgL/LJ/ugWB2pflgnd8uYlA2xZ1WpsS+AOYYKhaVUc3RqhYY/kGrZEHRz7KNeUV5wWifSJbvN81i2sTprfBDm+QY9tdTjHGp7jhtfHEz1V1lcbCYXbi2W0Ei958lR7sjspx2S3vxeJcU0+BYc/LXvxMdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HrkTlmDM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HrkTlmDM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F20BAC4CEE4;
	Fri, 23 May 2025 02:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747965998;
	bh=bsverSMWOBBf3YTQTuwFn4B8Z1u7ywDlbc3NJ9mtuHE=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=HrkTlmDM9HrHEZrrwQj1ikqE1gQgWqYdJkQ2qLOfGVOxez6YN3JSqQVi6RB0LTZnO
	 xRZqNhrmtmiyODMsXCG3j/oTUDDs5o9cSXw7RBebcTdMy7j41vdUxmIENF/w19uvC1
	 IscMWZZhPCoAAQl2zM/fUfLkjt4jtJPbXkX8xCFsNKCTmIaxu+HdTSC1yIKh7z/Nw1
	 6IQsiQx7n8/Z4ObGqmLpfUIG41e9C1ZF6nNxqPu0NOQ5wHcS5YQChdDoGHx6xD3fsD
	 XPfxwwBDxGz313GDR8IBhOWHH/IbzDpOeP3cLLiSkYtR6htb6UyS8jQwqtRVqSxuwW
	 9eNge7XM22R/A==
Message-ID: <52eee781-f53c-46a9-8ce4-96c5a0589240@kernel.org>
Date: Fri, 23 May 2025 10:06:34 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, Daeho Jeong <daehojeong@google.com>
Subject: Re: [f2fs-dev] [PATCH v2] mkfs.f2fs: ensure zone size is equal or
 bigger than segment size
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20250522182644.2176645-1-daeho43@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20250522182644.2176645-1-daeho43@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/23/25 02:26, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> Otherwise, it doesn't work with a crash.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> ---
> v2: relocate the code
> ---
>  lib/libf2fs.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/lib/libf2fs.c b/lib/libf2fs.c
> index d2579d7..148dc12 100644
> --- a/lib/libf2fs.c
> +++ b/lib/libf2fs.c
> @@ -1347,6 +1347,11 @@ int f2fs_get_f2fs_info(void)
>  			}
>  			c.zone_blocks = c.devices[i].zone_blocks;
>  		}
> +		if (c.zone_blocks < DEFAULT_BLOCKS_PER_SEGMENT) {

If c.zone_blocks can not be aligned to DEFAULT_BLOCKS_PER_SEGMENT, do we need to
handle below code?

		/*
		 * Align sections to the device zone size and align F2FS zones
		 * to the device zones. For F2FS_ZONED_HA model without the
		 * BLKZONED feature set at format time, this is only an
		 * optimization as sequential writes will not be enforced.
		 */
		c.segs_per_sec = c.zone_blocks / DEFAULT_BLOCKS_PER_SEGMENT;

Thanks,

> +			MSG(0, "\tError: zone size should not be less "
> +				"than segment size\n");
> +			return -1;
> +		}
>  
>  		/*
>  		 * Align sections to the device zone size and align F2FS zones

