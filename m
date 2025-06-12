Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBE442147EA
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 08:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749717072; cv=none; b=VBigTj5Kvv6WB/O0KuYkMD4cx7km5nUrgRR3nep3yFOMycs4U0aD9uHgbMGdOGkywm3PM52/UKorsI3LZadAEVp/RRsKkKkWlR8b+T3VheyVd2vSF4VNdNyg1vesy1K+XX14UanZokFyw3LUi0VAqO8cM6wRI0CY2KY0a0LazZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749717072; c=relaxed/simple;
	bh=KiXTzl6QEJUXCDIz97CX32nBSoUsT6AJdzJ9NXwvmRs=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=bnQ8YW8g0HOex25GwyemKxuOm+jJiVcDRCebdOsQJ2hyzswpvWENiNsmojiUIHl5GihNWtb0dgbPReqKkPlVzBXOCKCDQjEfNmO26KPixvJFFLefiZzSEKclv5sPcKK9ARwp9+R1c9HD7GSSUkGISP2SOicFc1ERPC6c8uGSQ9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pbUaTiVk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pbUaTiVk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B7B1C4CEEA;
	Thu, 12 Jun 2025 08:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749717072;
	bh=KiXTzl6QEJUXCDIz97CX32nBSoUsT6AJdzJ9NXwvmRs=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=pbUaTiVkyd+eccgV1xQpVu3H8Afn1UqFuzIlX8s69JZzk1yK0yaHj6YjU5Y1efAKJ
	 cLliInKdjJztdzQ/kKyZ+ja1DCnrTQ6pxleYEB9uWSiXHw2itQw9a6j/41EMNiQ7lJ
	 OZmTkYlPTA+n3C8cixytNRTUWS4OFq6MBa+pWyZZzRYQaWm4uZp4vwOCY8eel4L9tT
	 wq0rE1g3vM9ATgeMKRWyfTqDk559EA5YadgLdhyxfw65PEStHpILDuRkL6hZYKrns2
	 MYfnxypKcFW9IeFq2E1RQYH49zldN7FZoY4sGCPsiZJLqEaZPwxuot+gE4NoYMW1io
	 ziPLJOWnTMgsQ==
Message-ID: <f1b9209e-c2fb-4a53-8d15-a3e42dea8bca@kernel.org>
Date: Thu, 12 Jun 2025 16:31:09 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, bo.wu@vivo.com, linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org
Subject: Re: [f2fs-dev] [PATCH] f2fs: continue to allocate pinned section when
 gc happens EAGAIN
To: wangzijie <wangzijie1@honor.com>, jaegeuk@kernel.org
References: <20250612032742.1734852-1-wangzijie1@honor.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20250612032742.1734852-1-wangzijie1@honor.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/12/25 11:27, wangzijie wrote:
> Wu Bo once mentioned a fallocate fail scenario in this link[1].
> After commit 3fdd89b452c2("f2fs: prevent writing without fallocate()
> for pinned files"), we cannot directly generate 4K size file and
> pin it, but we can still generate non-segment aligned pinned file:
> 
> touch test_file
> ./f2fs_io pinfile set test_file
> ./f2fs_io fallocate 0 0 8192 test_file
> truncate -s 4096 test_file

Well, shouldn't we avoid such case by adding check condition in setattr?

> 
> By doing this, pin+fallocate failure(gc happens EAGAIN but f2fs shows
> enough spare space) may occurs.
> 
> From message in commit 2e42b7f817ac("f2fs: stop allocating pinned sections
> if EAGAIN happens"), gc EAGAIN doesn't guarantee a free section, so we stop
> allocating. But after commit 48ea8b200414 ("f2fs: fix to avoid panic once 
> fallocation fails for pinfile"), we have a way to avoid panic caused by
> concurrent pinfile allocation run out of free section, so I think that we 
> can continue to allocate pinned section when gc happens EAGAIN. Even if we
> don't have free section, f2fs_allocate_pinning_section() can fail with ENOSPC.

What do you think of introduce /sys/fs/f2fs/<dev>/reserved_pin_section to
tune @needed parameter of has_not_enough_free_secs()? If we configure it
w/ zero, it can avoid f2fs_gc() before preallocation.

---
 fs/f2fs/f2fs.h  | 3 +++
 fs/f2fs/file.c  | 5 ++---
 fs/f2fs/super.c | 3 +++
 fs/f2fs/sysfs.c | 9 +++++++++
 4 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 785537576aa8..ffb15da570d7 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1731,6 +1731,9 @@ struct f2fs_sb_info {
 	/* for skip statistic */
 	unsigned long long skipped_gc_rwsem;		/* FG_GC only */

+	/* free sections reserved for pinned file */
+	unsigned int reserved_pin_section;
+
 	/* threshold for gc trials on pinned files */
 	unsigned short gc_pin_file_threshold;
 	struct f2fs_rwsem pin_sem;
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 696131e655ed..a909f79db178 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1887,9 +1887,8 @@ static int f2fs_expand_inode_data(struct inode *inode, loff_t offset,
 			}
 		}

-		if (has_not_enough_free_secs(sbi, 0, f2fs_sb_has_blkzoned(sbi) ?
-			ZONED_PIN_SEC_REQUIRED_COUNT :
-			GET_SEC_FROM_SEG(sbi, overprovision_segments(sbi)))) {
+		if (has_not_enough_free_secs(sbi, 0,
+				sbi->reserved_pin_section)) {
 			f2fs_down_write(&sbi->gc_lock);
 			stat_inc_gc_call_count(sbi, FOREGROUND);
 			err = f2fs_gc(sbi, &gc_control);
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 57adeff5ef25..48b97a95fd63 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -4975,6 +4975,9 @@ static int f2fs_fill_super(struct super_block *sb, struct fs_context *fc)
 	sbi->last_valid_block_count = sbi->total_valid_block_count;
 	sbi->reserved_blocks = 0;
 	sbi->current_reserved_blocks = 0;
+	sbi->reserved_pin_section = f2fs_sb_has_blkzoned(sbi) ?
+			ZONED_PIN_SEC_REQUIRED_COUNT :
+			GET_SEC_FROM_SEG(sbi, overprovision_segments(sbi));
 	limit_reserve_root(sbi);
 	adjust_unusable_cap_perc(sbi);

diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 75134d69a0bd..51be7ffb38c5 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -824,6 +824,13 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 		return count;
 	}

+	if (!strcmp(a->attr.name, "reserved_pin_section")) {
+		if (t > GET_SEC_FROM_SEG(sbi, overprovision_segments(sbi)))
+			return -EINVAL;
+		*ui = (unsigned int)t;
+		return count;
+	}
+
 	*ui = (unsigned int)t;

 	return count;
@@ -1130,6 +1137,7 @@ F2FS_SBI_GENERAL_RO_ATTR(unusable_blocks_per_sec);
 F2FS_SBI_GENERAL_RW_ATTR(blkzone_alloc_policy);
 #endif
 F2FS_SBI_GENERAL_RW_ATTR(carve_out);
+F2FS_SBI_GENERAL_RW_ATTR(reserved_pin_section);

 /* STAT_INFO ATTR */
 #ifdef CONFIG_F2FS_STAT_FS
@@ -1323,6 +1331,7 @@ static struct attribute *f2fs_attrs[] = {
 	ATTR_LIST(last_age_weight),
 	ATTR_LIST(max_read_extent_count),
 	ATTR_LIST(carve_out),
+	ATTR_LIST(reserved_pin_section),
 	NULL,
 };
 ATTRIBUTE_GROUPS(f2fs);
-- 
2.49.0


> 
> [1] https://lore.kernel.org/linux-f2fs-devel/20231030094024.263707-1-bo.wu@vivo.com/t/#u
> 
> Signed-off-by: wangzijie <wangzijie1@honor.com>
> ---
>  fs/f2fs/file.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 6bd3de64f..05c80d2b5 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -1859,7 +1859,7 @@ static int f2fs_expand_inode_data(struct inode *inode, loff_t offset,
>  			f2fs_down_write(&sbi->gc_lock);
>  			stat_inc_gc_call_count(sbi, FOREGROUND);
>  			err = f2fs_gc(sbi, &gc_control);
> -			if (err && err != -ENODATA) {
> +			if (err && err != -ENODATA && err != -EAGAIN) {
>  				f2fs_up_write(&sbi->pin_sem);
>  				goto out_err;
>  			}

