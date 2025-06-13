Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 285F4A48
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 00:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749775662; cv=none; b=si73i7+lyf1z7AWC2uAcxpgBU1HFbX+cEZTbiw5VbBiFBv24Ra91PUyo4POCC/aLevD/fbA+5R3T57dosXX4A46J3rW6H7CIUQlI/fePz2FToys+Ojk6CI5boNiFSim3AAScaD3Syb4VDQrOpPsIU2WbCvz1/5I3oUjEhzhdDOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749775662; c=relaxed/simple;
	bh=FcwAaUnFzLm16huHjizGe95MQwCLo8XGRMUUruWoPVg=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=GeyCGM3ny+SlNfFJni6JVNqhHwIAPVoM3oBMpublnRPfiU9fWON+Djhjetb5I+cVoBIITdgMXP72T3e3yZbySxPBlPBDiZ6eeUdJvMEQPUjwpLBMW2idpVKOV7VX7cCNYODxVHxA3e6rmRpyPuV7ySnphNPf1w/i5COW0Jn9CT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HWHdOwG5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HWHdOwG5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96CC8C4CEEA;
	Fri, 13 Jun 2025 00:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749775661;
	bh=FcwAaUnFzLm16huHjizGe95MQwCLo8XGRMUUruWoPVg=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=HWHdOwG5fGCvoZ49mhZwo4E9DXck8Oz8r0w31CBPt18AjO4MpfcIrFxRWBhve3lP9
	 cmyVSDOLrvV5NbRPF2jP8b9fbEXnFecMlRvcDapqsejU8Bi/avxo0LipQUmFEymapS
	 YD6V3mzWB5FvhN8C1Y/OzqLCNx+pgFcTlT81jHl73iYHMHkJDkfiw00+Zqstcpldkm
	 sAqEBgKVy+zZ++1xyI77WmMgvA8BGYsEdJP+jex+u7ueRTHFjnHgX/58JtrwxraOUh
	 spQFP35GxU6O8gfhey8/LwW+5aguAflbQAuF9RL4HxRqA6KX1YH2y+lvg9mNGIr6ub
	 ighIGGihzzCYw==
Message-ID: <b3ecfa66-31c4-435e-918b-097c385848bf@kernel.org>
Date: Fri, 13 Jun 2025 08:47:47 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] f2fs: use ioprio hint for hot and pinned files
To: Daniel Lee <chullee@google.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20250611233706.572784-1-chullee@google.com>
 <20250611233706.572784-3-chullee@google.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20250611233706.572784-3-chullee@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2025/6/12 7:37, Daniel Lee wrote:
> Apply the `ioprio_hint` to set `F2FS_IOPRIO_WRITE` priority
> on files identified as "hot" at creation and on files that are
> pinned via ioctl.
> 
> Signed-off-by: Daniel Lee <chullee@google.com>
> ---
>   fs/f2fs/f2fs.h  | 21 +++++++++++++++++++++
>   fs/f2fs/file.c  |  3 +++
>   fs/f2fs/namei.c | 11 +++++++----
>   3 files changed, 31 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 162d79a3c1a5..0b05b3b6386b 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -3441,6 +3441,27 @@ static inline void set_file(struct inode *inode, int type)
>   	f2fs_mark_inode_dirty_sync(inode, true);
>   }
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
> +	f2fs_mark_inode_dirty_sync(inode, true);

We don't need to mark inode dirty? IIRC, .ioprio_hint is just in-memory variable?

> +}
> +
> +static inline void clear_ioprio(struct inode *inode)
> +{
> +	if (get_ioprio(inode) == 0)
> +		return;
> +	F2FS_I(inode)->ioprio_hint = 0;
> +	f2fs_mark_inode_dirty_sync(inode, true);

Ditto,

> +}
> +
>   static inline void clear_file(struct inode *inode, int type)
>   {
>   	if (!is_file(inode, type))
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 4fd45e94661a..95a3b4b59dd1 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -3496,6 +3496,7 @@ static int f2fs_ioc_set_pin_file(struct file *filp, unsigned long arg)
>   
>   	if (!pin) {
>   		clear_inode_flag(inode, FI_PIN_FILE);
> +		clear_ioprio(inode);
>   		f2fs_i_gc_failures_write(inode, 0);
>   		goto done;
>   	} else if (f2fs_is_pinned_file(inode)) {
> @@ -3529,6 +3530,8 @@ static int f2fs_ioc_set_pin_file(struct file *filp, unsigned long arg)
>   	}
>   
>   	set_inode_flag(inode, FI_PIN_FILE);
> +	file_set_hot(inode);
> +	set_ioprio(inode, F2FS_IOPRIO_WRITE);
>   	ret = F2FS_I(inode)->i_gc_failures;
>   done:
>   	f2fs_update_time(sbi, REQ_TIME);
> diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
> index 07e333ee21b7..0f96a0b86c40 100644
> --- a/fs/f2fs/namei.c
> +++ b/fs/f2fs/namei.c
> @@ -191,9 +191,10 @@ static void set_compress_new_inode(struct f2fs_sb_info *sbi, struct inode *dir,
>   }
>   
>   /*
> - * Set file's temperature for hot/cold data separation
> + * Set file's temperature (for hot/cold data separation) and
> + * I/O priority, based on filename extension
>    */
> -static void set_file_temperature(struct f2fs_sb_info *sbi, struct inode *inode,
> +static void set_file_temp_prio(struct f2fs_sb_info *sbi, struct inode *inode,
>   		const unsigned char *name)
>   {
>   	__u8 (*extlist)[F2FS_EXTENSION_LEN] = sbi->raw_super->extension_list;
> @@ -212,8 +213,10 @@ static void set_file_temperature(struct f2fs_sb_info *sbi, struct inode *inode,
>   
>   	if (i < cold_count)
>   		file_set_cold(inode);
> -	else
> +	else {
>   		file_set_hot(inode);
> +		set_ioprio(inode, F2FS_IOPRIO_WRITE);
> +	}
>   }
>   
>   static struct inode *f2fs_new_inode(struct mnt_idmap *idmap,
> @@ -317,7 +320,7 @@ static struct inode *f2fs_new_inode(struct mnt_idmap *idmap,
>   		set_inode_flag(inode, FI_INLINE_DATA);
>   
>   	if (name && !test_opt(sbi, DISABLE_EXT_IDENTIFY))
> -		set_file_temperature(sbi, inode, name);
> +		set_file_temp_prio(sbi, inode, name);
>   
>   	stat_inc_inline_xattr(inode);
>   	stat_inc_inline_inode(inode);

