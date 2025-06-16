Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 001AD292B50
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 12:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750078218; cv=none; b=txPt2UvwU6REec165zM5FmV7uHShUcVTHvXtWbimbrp51OcvnPOI/jHG+tT5f4k9kqUaH0p2lSUKmIUniPkrQbOBfGARBHdHRr9jCigsAdDhiFuYwOn+lZiPvksOiY18dmC9ybP7lg/0yR1RsW+HZW+NjJ0KRutbb/PC4DZqHGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750078218; c=relaxed/simple;
	bh=5B0GDypy6woAYzSY9aHY7htf77d3A3ENXwrDkuTjJK8=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=q7mVaGywN5Zqw1390TpzH5DMt5fVqrzOqjD2Arr6J1dV2xJ8KOPHRsD59Ji7c2SKTQdzlZCXOt+Tuu1xHaxiPdRVjEpIYy+RJU1g+DENSYHvSEqh7wmlWvNm4a4d99Y2nL3ZnpggTOlvqTH6+yuY+k6p1mrdX1DZWl0OvZoIoHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ao/+Im09; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ao/+Im09"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6142EC4CEEA;
	Mon, 16 Jun 2025 12:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750078217;
	bh=5B0GDypy6woAYzSY9aHY7htf77d3A3ENXwrDkuTjJK8=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=Ao/+Im09ikS3XYNJif4IPzCZVPI1rLzBr2hkK5fQi5W+mQhbzAjuFoCmdVYUus5G5
	 iAsrj9MC5DiaqctCBweLZ9P0wrywMKO9w1CHFmM4gQoV2uSfqzAptfRc1AIAcUL6Am
	 zuKvJC4174ktQCdROvzMsSLvGQ5D/+FG6qNiTRRMRjCTTEBe9WR0hrf9mp5qgi0xNn
	 gYvmNk805qMhSUBPKNt7+uDd5FszJx+mmK+hWdE189GL2AUw722N7SYEpthsERw0R/
	 OgLPmJQ8j6iL7tVXud3Epilgoybkzl1tmYP/KqpPBZJb9LUNpiqmBuvLi/IZAsyVSs
	 myTmzPYTwBwlg==
Message-ID: <c8389c1a-16d2-4de4-bc3f-7a5e4ccdbc34@kernel.org>
Date: Mon, 16 Jun 2025 20:50:14 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] f2fs: use ioprio hint for hot and pinned files
To: Daniel Lee <chullee@google.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20250615144235.1836469-1-chullee@google.com>
 <20250615144235.1836469-3-chullee@google.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20250615144235.1836469-3-chullee@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/15/25 22:42, Daniel Lee wrote:
> Apply the `ioprio_hint` to set `F2FS_IOPRIO_WRITE` priority
> on files identified as "hot" at creation and on files that are
> pinned via ioctl.
> 
> Signed-off-by: Daniel Lee <chullee@google.com>
> ---
>  fs/f2fs/f2fs.h  | 19 +++++++++++++++++++
>  fs/f2fs/file.c  |  3 +++
>  fs/f2fs/namei.c | 11 +++++++----
>  3 files changed, 29 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 3e02687c1b58..0c4f52892ff7 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -3440,6 +3440,25 @@ static inline void set_file(struct inode *inode, int type)
>  	f2fs_mark_inode_dirty_sync(inode, true);
>  }
>  
> +static inline int get_ioprio(struct inode *inode)
> +{
> +	return F2FS_I(inode)->ioprio_hint;
> +}
> +
> +static inline void set_ioprio(struct inode *inode, int level)
> +{
> +	if (get_ioprio(inode) == level)
> +		return;
> +	F2FS_I(inode)->ioprio_hint = level;
> +}
> +
> +static inline void clear_ioprio(struct inode *inode)
> +{
> +	if (get_ioprio(inode) == 0)
> +		return;
> +	F2FS_I(inode)->ioprio_hint = 0;
> +}
> +
>  static inline void clear_file(struct inode *inode, int type)
>  {
>  	if (!is_file(inode, type))
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 3eb40d7bf602..a18fb7f3d019 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -3496,6 +3496,7 @@ static int f2fs_ioc_set_pin_file(struct file *filp, unsigned long arg)
>  
>  	if (!pin) {
>  		clear_inode_flag(inode, FI_PIN_FILE);
> +		clear_ioprio(inode);

I guess there are more places clearing FI_PIN_FILE? we need to cover
them all?

>  		f2fs_i_gc_failures_write(inode, 0);
>  		goto done;
>  	} else if (f2fs_is_pinned_file(inode)) {
> @@ -3529,6 +3530,8 @@ static int f2fs_ioc_set_pin_file(struct file *filp, unsigned long arg)
>  	}
>  
>  	set_inode_flag(inode, FI_PIN_FILE);
> +	file_set_hot(inode);

Unnecessary file_set_hot() invoking? Or am I missing anything?

Thanks,

> +	set_ioprio(inode, F2FS_IOPRIO_WRITE);
>  	ret = F2FS_I(inode)->i_gc_failures;
>  done:
>  	f2fs_update_time(sbi, REQ_TIME);
> diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
> index 07e333ee21b7..0f96a0b86c40 100644
> --- a/fs/f2fs/namei.c
> +++ b/fs/f2fs/namei.c
> @@ -191,9 +191,10 @@ static void set_compress_new_inode(struct f2fs_sb_info *sbi, struct inode *dir,
>  }
>  
>  /*
> - * Set file's temperature for hot/cold data separation
> + * Set file's temperature (for hot/cold data separation) and
> + * I/O priority, based on filename extension
>   */
> -static void set_file_temperature(struct f2fs_sb_info *sbi, struct inode *inode,
> +static void set_file_temp_prio(struct f2fs_sb_info *sbi, struct inode *inode,
>  		const unsigned char *name)
>  {
>  	__u8 (*extlist)[F2FS_EXTENSION_LEN] = sbi->raw_super->extension_list;
> @@ -212,8 +213,10 @@ static void set_file_temperature(struct f2fs_sb_info *sbi, struct inode *inode,
>  
>  	if (i < cold_count)
>  		file_set_cold(inode);
> -	else
> +	else {
>  		file_set_hot(inode);
> +		set_ioprio(inode, F2FS_IOPRIO_WRITE);
> +	}
>  }
>  
>  static struct inode *f2fs_new_inode(struct mnt_idmap *idmap,
> @@ -317,7 +320,7 @@ static struct inode *f2fs_new_inode(struct mnt_idmap *idmap,
>  		set_inode_flag(inode, FI_INLINE_DATA);
>  
>  	if (name && !test_opt(sbi, DISABLE_EXT_IDENTIFY))
> -		set_file_temperature(sbi, inode, name);
> +		set_file_temp_prio(sbi, inode, name);
>  
>  	stat_inc_inline_xattr(inode);
>  	stat_inc_inline_inode(inode);

