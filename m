Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F3F4366
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 01:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738891830; cv=none; b=EtQF/AK6deB41whTylpgwKRqnI5A7DHlLetNDZVEBbA1LpbNSNVhXrGzDV+4YHyDP1xWUtKxZlCLGVBvmyTqRFWnr6MebSNc/Q8fCXy1aoqJXxFQxdoC7sFcQ2mKRDhhlRB1/jdmtmhZbcch5QyfUzJbsTfuuWtrERkFvUKADF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738891830; c=relaxed/simple;
	bh=HOlojcPVA2pMcRCwGp2So65C1t2r3TvpJ/j7rQ9tRd8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WsN3sd3Dn9hBKSa2At4AYdOE/+BEc+KMa1UWy7mSBAYwmD2QEBPwLYAceTWu1HL0H+NCd7eCH+D17zSCp7ocY0cyNhXux4Vw+FukKJ8ITHIkgmtBPT19AdrgVjJw6qzAR1Fr5CAkOozfVNtt2D0RDodxhNYPHWnshnNHsDeCn0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dhu6l7v6; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dhu6l7v6"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-38dc33a4426so126767f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 17:30:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738891827; x=1739496627; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1uMOzFUJ0RWEOZyqokJBL9zPhE0ILKpWtf9ZWvrFRXM=;
        b=dhu6l7v6CB7V3IFQxfOYI+z0XfpUEj0UTrPzpCDRH8XEXJ2p+MRmcDErQ2fdpGXSwX
         do+GKhQ0wCe+GiUCGusMNDRXYMfenGZtPh0lyU5gKWxSVXmRZ9mBS8hk8n6iBkVY7Lmi
         j1CYRpc5pSUoH9f2P/1OTfmuUN44123C8tmTS/4U2tRgyoEni+pTYiJYJVId/Syn/YR2
         BAsBeNZMoURMQ+g+J7W7KhAAOK41u+RbWafKfU/RxZj12P3GTj5eQeo7UavDq4r2CHYy
         ytgnETGUMoU1fkNYe4aanGjgzO5j79lkVqejaTf9UbT3NMeNpT5RWTc/yRholaZ80YYN
         RZAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738891827; x=1739496627;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1uMOzFUJ0RWEOZyqokJBL9zPhE0ILKpWtf9ZWvrFRXM=;
        b=CZAplJp7y3HEtVboLdI5xiqDxOhgOvdFrZTrA7cAOOrxaZibiN7saZwn6rXM6YOtUk
         DVstjufrL6VKD4yg8z3fUP0JP3zB3joIPYgjrFD3C2cuFBi82uLN5SekrNq+witD2MSz
         4YAwnOm9Dl9Y05657Y9nya6qPLx18C10xcAaUpmPsLlbQXdjCNhazZXhVHwbOrNYihw7
         IPLjXFBjRqeOu+Gt83CSSG8ubcMzH+OyhvUBNZ+sMkWNJtNuvH8YGe3Gg61Vpt2X/L8D
         yDdNt78eIvEnXH0sHhW/vzbvW0Pzc7XLyTJ0zklp5dFQezqGztQ2HwGtva2acBPAuSGa
         3BbA==
X-Forwarded-Encrypted: i=1; AJvYcCWXUu2NeKkmdPB92uFr1Ksac39P27ZKeY0D0WiacjA5y61aa7QbGfSefCEvjovn8krn6SjvS9Ng5fU+zdA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfGCMH3nXsrSBeJaXA5jP/v+gpkDVnZgohfesdaBDknV1mrY6y
	aAAWL8/y/wdee+DeScWyFvuyqNXwUsSb6j/TIs2GdVQJoDe0CncUeJzGnCAFL+7zPrgTCOPgoEe
	ZgvVtXe+UtVm4bXipLVFjCDcuHXw=
X-Gm-Gg: ASbGncvTnd5TyDBrVKg86yWIzTBZY8iolA8jSjLxCSKrzjTkQkGewaR8ONZZjdWPE3L
	2qRq63jHqcox31HQh/TGYcAP898iQ2Q1uRuqiCLIJFzbe/B9pjhf6r7Mg/g12jyRdaoQ/TKEo7A
	==
X-Google-Smtp-Source: AGHT+IHkKqk36wyLNWQXPc1rTH5oqjNZtdra7Wh0WBbQU5p7HtzkfQwNBwQYN6hWb3yB370iRKkjiASFgG+oH8H8HgY=
X-Received: by 2002:a5d:5f46:0:b0:385:edd4:1242 with SMTP id
 ffacd0b85a97d-38dc9134bf7mr258920f8f.10.1738891826302; Thu, 06 Feb 2025
 17:30:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250206064451.3088028-1-chao@kernel.org>
In-Reply-To: <20250206064451.3088028-1-chao@kernel.org>
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Fri, 7 Feb 2025 09:30:14 +0800
X-Gm-Features: AWEUYZlOojNoY1jkzCfM7QS23nbqroecnxx-dkl-XPZh_DFq3wgurfRi7IG0Ru0
Message-ID: <CAHJ8P3+4RVNN0xB48D8aQ54ox399O0wc51YX2_At1heXWQrt4A@mail.gmail.com>
Subject: Re: [f2fs-dev] [PATCH] f2fs: quota: fix to avoid warning in dquot_writeback_dquots()
To: Chao Yu <chao@kernel.org>
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org, 
	linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
=E4=BA=8E2025=E5=B9=B42=E6=9C=886=E6=97=A5=E5=91=A8=E5=9B=9B 14:50=E5=86=99=
=E9=81=93=EF=BC=9A
>
> F2FS-fs (dm-59): checkpoint=3Denable has some unwritten data.
>
> ------------[ cut here ]------------
> WARNING: CPU: 6 PID: 8013 at fs/quota/dquot.c:691 dquot_writeback_dquots+=
0x2fc/0x308
> pc : dquot_writeback_dquots+0x2fc/0x308
> lr : f2fs_quota_sync+0xcc/0x1c4
> Call trace:
> dquot_writeback_dquots+0x2fc/0x308
> f2fs_quota_sync+0xcc/0x1c4
> f2fs_write_checkpoint+0x3d4/0x9b0
> f2fs_issue_checkpoint+0x1bc/0x2c0
> f2fs_sync_fs+0x54/0x150
> f2fs_do_sync_file+0x2f8/0x814
> __f2fs_ioctl+0x1960/0x3244
> f2fs_ioctl+0x54/0xe0
> __arm64_sys_ioctl+0xa8/0xe4
> invoke_syscall+0x58/0x114
>
> checkpoint and f2fs_remount may race as below, resulting triggering warni=
ng
> in dquot_writeback_dquots().
>
> atomic write                                    remount
>                                                 - do_remount
>                                                  - down_write(&sb->s_umou=
nt);
>                                                   - f2fs_remount
> - ioctl
>  - f2fs_do_sync_file
>   - f2fs_sync_fs
>    - f2fs_write_checkpoint
>     - block_operations
>      - locked =3D down_read_trylock(&sbi->sb->s_umount)
>        : fail to lock due to the write lock was held by remount
>                                                  - up_write(&sb->s_umount=
);
>      - f2fs_quota_sync
>       - dquot_writeback_dquots
>        - WARN_ON_ONCE(!rwsem_is_locked(&sb->s_umount))
>        : trigger warning because s_umount lock was unlocked by remount
>
> If checkpoint comes from mount/umount/remount/freeze/quotactl, caller of
> checkpoint has already held s_umount lock, calling dquot_writeback_dquots=
()
> in the context should be safe.
>
> So let's record task to sbi->umount_lock_holder, so that checkpoint can
> know whether the lock has held in the context or not by checking current
> w/ it.
>
> In addition, in order to misrepresent caller of checkpoint, we should not
> allow to trigger async checkpoint for those callers: mount/umount/remount=
/
> freeze/quotactl.
>
> Fixes: af033b2aa8a8 ("f2fs: guarantee journalled quota data by checkpoint=
")
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>  fs/f2fs/checkpoint.c | 17 ++++++++-----
>  fs/f2fs/f2fs.h       |  3 ++-
>  fs/f2fs/super.c      | 59 +++++++++++++++++++++++++++++++++++---------
>  3 files changed, 60 insertions(+), 19 deletions(-)
>
> diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
> index efda9a022981..baff639ac0c4 100644
> --- a/fs/f2fs/checkpoint.c
> +++ b/fs/f2fs/checkpoint.c
> @@ -1237,7 +1237,8 @@ static int block_operations(struct f2fs_sb_info *sb=
i)
>  retry_flush_quotas:
>         f2fs_lock_all(sbi);
>         if (__need_flush_quota(sbi)) {
> -               int locked;
> +               bool need_lock =3D sbi->umount_lock_holder !=3D current;
> +               bool locked =3D false;
>
>                 if (++cnt > DEFAULT_RETRY_QUOTA_FLUSH_COUNT) {
>                         set_sbi_flag(sbi, SBI_QUOTA_SKIP_FLUSH);
> @@ -1246,10 +1247,13 @@ static int block_operations(struct f2fs_sb_info *=
sbi)
>                 }
>                 f2fs_unlock_all(sbi);
>
> -               /* only failed during mount/umount/freeze/quotactl */
> -               locked =3D down_read_trylock(&sbi->sb->s_umount);
> -               f2fs_quota_sync(sbi->sb, -1);
> -               if (locked)
> +               /* don't grab s_umount lock during mount/umount/remount/f=
reeze/quotactl */
> +               if (need_lock && !down_read_trylock(&sbi->sb->s_umount)) =
{
> +                       cond_resched();
> +                       goto retry_flush_quotas;
> +               }
> +               f2fs_do_quota_sync(sbi->sb, -1);
> +               if (need_lock)
>                         up_read(&sbi->sb->s_umount);
>                 cond_resched();
>                 goto retry_flush_quotas;
> @@ -1867,7 +1871,8 @@ int f2fs_issue_checkpoint(struct f2fs_sb_info *sbi)
>         struct cp_control cpc;
>
>         cpc.reason =3D __get_cp_reason(sbi);
> -       if (!test_opt(sbi, MERGE_CHECKPOINT) || cpc.reason !=3D CP_SYNC) =
{
> +       if (!test_opt(sbi, MERGE_CHECKPOINT) || cpc.reason !=3D CP_SYNC |=
|
> +               sbi->umount_lock_holder =3D=3D current) {
>                 int ret;
>
>                 f2fs_down_write(&sbi->gc_lock);
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 62b7fed1514a..7174dea641e9 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -1670,6 +1670,7 @@ struct f2fs_sb_info {
>
>         unsigned int nquota_files;              /* # of quota sysfile */
>         struct f2fs_rwsem quota_sem;            /* blocking cp for flags =
*/
> +       struct task_struct *umount_lock_holder; /* s_umount lock holder *=
/
>
>         /* # of pages, see count_type */
>         atomic_t nr_pages[NR_COUNT_TYPE];
> @@ -3652,7 +3653,7 @@ int f2fs_inode_dirtied(struct inode *inode, bool sy=
nc);
>  void f2fs_inode_synced(struct inode *inode);
>  int f2fs_dquot_initialize(struct inode *inode);
>  int f2fs_enable_quota_files(struct f2fs_sb_info *sbi, bool rdonly);
> -int f2fs_quota_sync(struct super_block *sb, int type);
> +int f2fs_do_quota_sync(struct super_block *sb, int type);
>  loff_t max_file_blocks(struct inode *inode);
>  void f2fs_quota_off_umount(struct super_block *sb);
>  void f2fs_save_errors(struct f2fs_sb_info *sbi, unsigned char flag);
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index ef639a6d82e5..cb9d7b6fa3ad 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -1740,22 +1740,28 @@ int f2fs_sync_fs(struct super_block *sb, int sync=
)
>
>  static int f2fs_freeze(struct super_block *sb)
>  {
> +       struct f2fs_sb_info *sbi =3D F2FS_SB(sb);
> +
>         if (f2fs_readonly(sb))
>                 return 0;
>
>         /* IO error happened before */
> -       if (unlikely(f2fs_cp_error(F2FS_SB(sb))))
> +       if (unlikely(f2fs_cp_error(sbi)))
>                 return -EIO;
>
>         /* must be clean, since sync_filesystem() was already called */
> -       if (is_sbi_flag_set(F2FS_SB(sb), SBI_IS_DIRTY))
> +       if (is_sbi_flag_set(sbi, SBI_IS_DIRTY))
>                 return -EINVAL;
>
> +       sbi->umount_lock_holder =3D current;
> +
>         /* Let's flush checkpoints and stop the thread. */
> -       f2fs_flush_ckpt_thread(F2FS_SB(sb));
> +       f2fs_flush_ckpt_thread(sbi);
> +
> +       sbi->umount_lock_holder =3D NULL;
>
>         /* to avoid deadlock on f2fs_evict_inode->SB_FREEZE_FS */
> -       set_sbi_flag(F2FS_SB(sb), SBI_IS_FREEZING);
> +       set_sbi_flag(sbi, SBI_IS_FREEZING);
>         return 0;
>  }
>
> @@ -2332,6 +2338,8 @@ static int f2fs_remount(struct super_block *sb, int=
 *flags, char *data)
>         org_mount_opt =3D sbi->mount_opt;
>         old_sb_flags =3D sb->s_flags;
>
> +       sbi->umount_lock_holder =3D current;
> +
>  #ifdef CONFIG_QUOTA
>         org_mount_opt.s_jquota_fmt =3D F2FS_OPTION(sbi).s_jquota_fmt;
>         for (i =3D 0; i < MAXQUOTAS; i++) {
> @@ -2555,6 +2563,8 @@ static int f2fs_remount(struct super_block *sb, int=
 *flags, char *data)
>
>         limit_reserve_root(sbi);
>         *flags =3D (*flags & ~SB_LAZYTIME) | (sb->s_flags & SB_LAZYTIME);
> +
> +       sbi->umount_lock_holder =3D NULL;
>         return 0;
>  restore_checkpoint:
>         if (need_enable_checkpoint) {
> @@ -2595,6 +2605,8 @@ static int f2fs_remount(struct super_block *sb, int=
 *flags, char *data)
>  #endif
>         sbi->mount_opt =3D org_mount_opt;
>         sb->s_flags =3D old_sb_flags;
> +
> +       sbi->umount_lock_holder =3D NULL;
>         return err;
>  }
>
> @@ -2911,7 +2923,7 @@ static int f2fs_quota_sync_file(struct f2fs_sb_info=
 *sbi, int type)
>         return ret;
>  }
>
> -int f2fs_quota_sync(struct super_block *sb, int type)
> +int f2fs_do_quota_sync(struct super_block *sb, int type)
>  {
>         struct f2fs_sb_info *sbi =3D F2FS_SB(sb);
>         struct quota_info *dqopt =3D sb_dqopt(sb);
> @@ -2959,6 +2971,16 @@ int f2fs_quota_sync(struct super_block *sb, int ty=
pe)
>         return ret;
>  }
>
> +static int f2fs_quota_sync(struct super_block *sb, int type)
> +{
> +       int ret;
> +
> +       F2FS_SB(sb)->umount_lock_holder =3D current;
> +       ret =3D f2fs_do_quota_sync(sb, type);
> +       F2FS_SB(sb)->umount_lock_holder =3D NULL;
> +       return ret;
> +}
> +
>  static int f2fs_quota_on(struct super_block *sb, int type, int format_id=
,
>                                                         const struct path=
 *path)
>  {
> @@ -2974,30 +2996,33 @@ static int f2fs_quota_on(struct super_block *sb, =
int type, int format_id,
>         if (path->dentry->d_sb !=3D sb)
>                 return -EXDEV;
>
> -       err =3D f2fs_quota_sync(sb, type);
> +       F2FS_SB(sb)->umount_lock_holder =3D current;
> +
> +       err =3D f2fs_do_quota_sync(sb, type);
>         if (err)
> -               return err;
> +               goto out;
>
>         inode =3D d_inode(path->dentry);
>
>         err =3D filemap_fdatawrite(inode->i_mapping);
>         if (err)
> -               return err;
> +               goto out;
>
>         err =3D filemap_fdatawait(inode->i_mapping);
>         if (err)
> -               return err;
> +               goto out;
>
>         err =3D dquot_quota_on(sb, type, format_id, path);
>         if (err)
> -               return err;
> +               goto out;
>
>         inode_lock(inode);
>         F2FS_I(inode)->i_flags |=3D F2FS_QUOTA_DEFAULT_FL;
>         f2fs_set_inode_flags(inode);
>         inode_unlock(inode);
>         f2fs_mark_inode_dirty_sync(inode, false);
> -
> +out:
> +       F2FS_SB(sb)->umount_lock_holder =3D NULL;
>         return 0;
Hi Chao,
Here should return err? and init err=3D0 in the beginning?
thanks=EF=BC=81
>  }
>
> @@ -3009,7 +3034,7 @@ static int __f2fs_quota_off(struct super_block *sb,=
 int type)
>         if (!inode || !igrab(inode))
>                 return dquot_quota_off(sb, type);
>
> -       err =3D f2fs_quota_sync(sb, type);
> +       err =3D f2fs_do_quota_sync(sb, type);
>         if (err)
>                 goto out_put;
>
> @@ -3032,6 +3057,8 @@ static int f2fs_quota_off(struct super_block *sb, i=
nt type)
>         struct f2fs_sb_info *sbi =3D F2FS_SB(sb);
>         int err;
>
> +       F2FS_SB(sb)->umount_lock_holder =3D current;
> +
>         err =3D __f2fs_quota_off(sb, type);
>
>         /*
> @@ -3041,6 +3068,9 @@ static int f2fs_quota_off(struct super_block *sb, i=
nt type)
>          */
>         if (is_journalled_quota(sbi))
>                 set_sbi_flag(sbi, SBI_QUOTA_NEED_REPAIR);
> +
> +       F2FS_SB(sb)->umount_lock_holder =3D NULL;
> +
>         return err;
>  }
>
> @@ -4715,6 +4745,7 @@ static int f2fs_fill_super(struct super_block *sb, =
void *data, int silent)
>         if (err)
>                 goto free_compress_inode;
>
> +       sbi->umount_lock_holder =3D current;
>  #ifdef CONFIG_QUOTA
>         /* Enable quota usage during mount */
>         if (f2fs_sb_has_quota_ino(sbi) && !f2fs_readonly(sb)) {
> @@ -4841,6 +4872,8 @@ static int f2fs_fill_super(struct super_block *sb, =
void *data, int silent)
>         f2fs_update_time(sbi, CP_TIME);
>         f2fs_update_time(sbi, REQ_TIME);
>         clear_sbi_flag(sbi, SBI_CP_DISABLED_QUICK);
> +
> +       sbi->umount_lock_holder =3D NULL;
>         return 0;
>
>  sync_free_meta:
> @@ -4945,6 +4978,8 @@ static void kill_f2fs_super(struct super_block *sb)
>         struct f2fs_sb_info *sbi =3D F2FS_SB(sb);
>
>         if (sb->s_root) {
> +               sbi->umount_lock_holder =3D current;
> +
>                 set_sbi_flag(sbi, SBI_IS_CLOSE);
>                 f2fs_stop_gc_thread(sbi);
>                 f2fs_stop_discard_thread(sbi);
> --
> 2.48.1.502.g6dc24dfdaf-goog
>
>
>
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
