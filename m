Received: from mta20.hihonor.com (mta20.hihonor.com [81.70.206.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01C0E1FDA89
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 05:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.70.206.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749791476; cv=none; b=hyTFdGTdqjNkNMbuPkvsdjSksbd3eEYknlziVThpeDuBt3Ms7v6XJY/61jSLIkB+qMRrMu3NDrjHTUigglaa3Gbp+qzyIPBZUVgQQYDcY5RZS6eRb1YWlmAnPkc6U4m3gcwXh0mLAiokVZ2y2oGP0DAqDBKYJ5dMasc0GiSCX0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749791476; c=relaxed/simple;
	bh=UFAYzYZdIRVAOTWV2F59ryEn3DoxClQQ+mepY7xaCgg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iDnNMyPRjMuWCTZHibk6650FGTNpq2+P13fc68USYjsgtj+bTP36RCyjECT/SIoNAqqCqkqlUONJ62wc9Kn+QCThQk8qjAZm0zRPUK7gnWa3paNlVGFvADUqixDMCeRbFb42iqn8AjLQJbm4elg3Dgs3JVJiKcrnl0bNnn9aT30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=honor.com; spf=pass smtp.mailfrom=honor.com; arc=none smtp.client-ip=81.70.206.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=honor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=honor.com
Received: from w003.hihonor.com (unknown [10.68.17.88])
	by mta20.hihonor.com (SkyGuard) with ESMTPS id 4bJS9B67FHzYl3Ps;
	Fri, 13 Jun 2025 13:08:46 +0800 (CST)
Received: from a011.hihonor.com (10.68.31.243) by w003.hihonor.com
 (10.68.17.88) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 13 Jun
 2025 13:11:10 +0800
Received: from localhost.localdomain (10.144.23.14) by a011.hihonor.com
 (10.68.31.243) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 13 Jun
 2025 13:11:10 +0800
From: wangzijie <wangzijie1@honor.com>
To: <linux-f2fs-devel@lists.sourceforge.net>
CC: <chao@kernel.org>, <jaegeuk@kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [f2fs-dev] [PATCH] f2fs: introduce reserved_pin_section sysfs entry
Date: Fri, 13 Jun 2025 13:11:10 +0800
Message-ID: <20250613051110.1865186-1-wangzijie1@honor.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250612140526.6435-1-chao@kernel.org>
References: <20250612140526.6435-1-chao@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: w010.hihonor.com (10.68.28.113) To a011.hihonor.com
 (10.68.31.243)

> This patch introduces /sys/fs/f2fs/<dev>/reserved_pin_section for tuning
> @needed parameter of has_not_enough_free_secs(), if we configure it w/
> zero, it can avoid f2fs_gc() as much as possible while fallocating on
> pinned file.
> 
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>  Documentation/ABI/testing/sysfs-fs-f2fs | 9 +++++++++
>  fs/f2fs/f2fs.h                          | 3 +++
>  fs/f2fs/file.c                          | 5 ++---
>  fs/f2fs/super.c                         | 3 +++
>  fs/f2fs/sysfs.c                         | 9 +++++++++
>  5 files changed, 26 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
> index bf03263b9f46..c2a233f2a085 100644
> --- a/Documentation/ABI/testing/sysfs-fs-f2fs
> +++ b/Documentation/ABI/testing/sysfs-fs-f2fs
> @@ -861,3 +861,12 @@ Description:	This is a read-only entry to show the value of sb.s_encoding_flags,
>  		SB_ENC_STRICT_MODE_FL            0x00000001
>  		SB_ENC_NO_COMPAT_FALLBACK_FL     0x00000002
>  		============================     ==========
> +
> +What:		/sys/fs/f2fs/<disk>/reserved_pin_section
> +Date:		June 2025
> +Contact:	"Chao Yu" <chao@kernel.org>
> +Description:	This threshold is used to control triggering garbage collection while
> +		fallocating on pinned file, so, it can guarantee there is enough free
> +		reserved section before preallocating on pinned file.
> +		By default, the value is ovp_sections, especially, for zoned ufs, the
> +		value is 1.
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 9333a22b9a01..fa27498202a3 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -1724,6 +1724,9 @@ struct f2fs_sb_info {
>  	/* for skip statistic */
>  	unsigned long long skipped_gc_rwsem;		/* FG_GC only */
>  
> +	/* free sections reserved for pinned file */
> +	unsigned int reserved_pin_section;
> +
>  	/* threshold for gc trials on pinned files */
>  	unsigned short gc_pin_file_threshold;
>  	struct f2fs_rwsem pin_sem;
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 696131e655ed..a909f79db178 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -1887,9 +1887,8 @@ static int f2fs_expand_inode_data(struct inode *inode, loff_t offset,
>  			}
>  		}
>  
> -		if (has_not_enough_free_secs(sbi, 0, f2fs_sb_has_blkzoned(sbi) ?
> -			ZONED_PIN_SEC_REQUIRED_COUNT :
> -			GET_SEC_FROM_SEG(sbi, overprovision_segments(sbi)))) {
> +		if (has_not_enough_free_secs(sbi, 0,
> +				sbi->reserved_pin_section)) {
>  			f2fs_down_write(&sbi->gc_lock);
>  			stat_inc_gc_call_count(sbi, FOREGROUND);
>  			err = f2fs_gc(sbi, &gc_control);
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 57adeff5ef25..48b97a95fd63 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -4975,6 +4975,9 @@ static int f2fs_fill_super(struct super_block *sb, struct fs_context *fc)
>  	sbi->last_valid_block_count = sbi->total_valid_block_count;
>  	sbi->reserved_blocks = 0;
>  	sbi->current_reserved_blocks = 0;
> +	sbi->reserved_pin_section = f2fs_sb_has_blkzoned(sbi) ?
> +			ZONED_PIN_SEC_REQUIRED_COUNT :
> +			GET_SEC_FROM_SEG(sbi, overprovision_segments(sbi));
>  	limit_reserve_root(sbi);
>  	adjust_unusable_cap_perc(sbi);

Hi Chao,
It seems like we cannot use overprovision_segments(sbi) directly before f2fs_build_segment_manager().
 
> diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> index 75134d69a0bd..51be7ffb38c5 100644
> --- a/fs/f2fs/sysfs.c
> +++ b/fs/f2fs/sysfs.c
> @@ -824,6 +824,13 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
>  		return count;
>  	}
>  
> +	if (!strcmp(a->attr.name, "reserved_pin_section")) {
> +		if (t > GET_SEC_FROM_SEG(sbi, overprovision_segments(sbi)))
> +			return -EINVAL;
> +		*ui = (unsigned int)t;
> +		return count;
> +	}
> +
>  	*ui = (unsigned int)t;
>  
>  	return count;
> @@ -1130,6 +1137,7 @@ F2FS_SBI_GENERAL_RO_ATTR(unusable_blocks_per_sec);
>  F2FS_SBI_GENERAL_RW_ATTR(blkzone_alloc_policy);
>  #endif
>  F2FS_SBI_GENERAL_RW_ATTR(carve_out);
> +F2FS_SBI_GENERAL_RW_ATTR(reserved_pin_section);
>  
>  /* STAT_INFO ATTR */
>  #ifdef CONFIG_F2FS_STAT_FS
> @@ -1323,6 +1331,7 @@ static struct attribute *f2fs_attrs[] = {
>  	ATTR_LIST(last_age_weight),
>  	ATTR_LIST(max_read_extent_count),
>  	ATTR_LIST(carve_out),
> +	ATTR_LIST(reserved_pin_section),
>  	NULL,
>  };
>  ATTRIBUTE_GROUPS(f2fs);
> -- 
> 2.40.1
> 
> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

