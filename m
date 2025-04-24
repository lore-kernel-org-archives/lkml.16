Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A13F5BAF0
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 16:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745511746; cv=none; b=T5HjBZkucrhazKVVkdpM6edSy2VwKpfTyRb8Qvvuf2IZqF4UdEVhSsLPvljbaH0QkNFTE8NpJSNYg5RjEr6P6KpkAZPqbrcMwlKrQct6JGQg61HZUQj4JnyD0jQ/302jLj3etckVpWfnZSjJ+3d1CrJratCCpK355QKA145dnuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745511746; c=relaxed/simple;
	bh=maYrAQBgtGHC/aM1MrdDOMl6orK1rLU9r0i/S27VADE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Euom/7hKwfMOF1hnoa7yga3JB+ruUWuu1i9FqXypGIcjC21O0fWMM4Noq83a7Xgj907gJVglxzj0frdAHmUKJoKvLUxwsOxhh7pb3+zO5L6qX8/mV0IDsmfryNu5ZSSiA16P5fN9eNO0r8m09E0IQ3J/WTYVeqbqxDF79pHkfC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bFSQn1/j; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bFSQn1/j"
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-523eb86b31aso529459e0c.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745511743; x=1746116543; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BuYl9yiQ5nqrtQHfuB/fsPXeerfUH6qiA5Wia4ATlfM=;
        b=bFSQn1/jgNrJXnGnGUuWEc+hkJTdcFOgQ7Ya7erZtKIbwQCnwy061mD8HuA7hHuAO+
         0VVKuQMqU34Ez2qyQssIsS26wlevYRllTgn5TrcYezaOlY9IQSClmLz1hAaWJVXqSV49
         0lTbDaApedlV6OFidheqzx+UG0o9z5jBwVWxrn1DOe6J/5FBlXo5djNH9uzLYo8h+gs+
         TSbF0ipdB0DjZIbHMpAvx8fhx8hL66wHqpxwEj6SyK4mkiQjUn8zuRGvciH7xmgcCWdT
         CqxtbhBYYvHniN2kJ7iSC3MU7czEi8x7/FgoMd2GXTqwlTrc5QmvMWbG3AjZ/VTH5iVb
         LGlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745511743; x=1746116543;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BuYl9yiQ5nqrtQHfuB/fsPXeerfUH6qiA5Wia4ATlfM=;
        b=LDvxkLcXpp6xSmaW7PaJFXec+oIM/FVX5aXU+aMUCmh7A51+ikcNfZV6jk7102xO+5
         r0bnS5iSx6tPdQKLr49uSAMEKaDf3grbo+khr9pC42A2x8OARO31YubuPIriZ5YBLD/5
         SCpl5cM4d5H4l3iI+RAken+AiyM9x/AraN23wC2Zl4Js1GD7F88Q5SPuJNmD2T0UPsDh
         nb93r9sWEwQTH4VCJlOnelZMrk6SlFh9enscfHD6/3g8Bj6hS33CC7oymdlKgqUS7nsr
         jyLKM5h3CJhBcX0lVrlJASHgXc2rS71CZ7JvIVaXpvsE02ldNZqWzrtlK50JJvkhZ4SB
         m2rw==
X-Gm-Message-State: AOJu0Yw/N2ZZQKbk6axbpVrR2lZlGyMa0lnGBZJAVDYj+qkc3rbp7c0U
	4dpcRUHgYxw5a1ILnUCDAL9nXm77cJ7uL+4OU5hOKTqRK+07b9UFoa0yE+rEkMNghfFUXUjztyc
	K5KalXS5fDDiAmEGzsKiKCGDetug=
X-Gm-Gg: ASbGncul+47qvi2cqKZVjWdwNVt6qhqJVxN49x1fwTqPsdDdHmStvmbnhRRqaQLWiUJ
	ryTA6Lmnn1jADsPuynx/ytAmUwoRLKbV9AIZgiTR92yUrG5+r/teOYaiHTMXyIefQ3gkPvy2miv
	n25lJy8JyCySZX3s3io5FX4q6TBO62H2LIQot3IHR8hMbnYuPyz8P6
X-Google-Smtp-Source: AGHT+IHfqWBopM/+R8WtCyu9ty2oRqqZ1QWxOdtpCdvQosj13QuZHS1+4+6dizVl3GIQg/PYfn/Mw2E5gZaBrfWJUNs=
X-Received: by 2002:a05:6122:181b:b0:525:9ddc:381a with SMTP id
 71dfb90a1353d-52a85afeaa1mr344909e0c.6.1745511742694; Thu, 24 Apr 2025
 09:22:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250418165601.3050393-1-daeho43@gmail.com> <1f50d7cf-2c08-4dc5-8b64-2d30dc24f3bb@kernel.org>
In-Reply-To: <1f50d7cf-2c08-4dc5-8b64-2d30dc24f3bb@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Thu, 24 Apr 2025 09:22:11 -0700
X-Gm-Features: ATxdqUGxQQq8KNo2WKgzKuKQBCBYXnO3N6mBWDTZqUYNOudwd0KI45PMpNnYnrg
Message-ID: <CACOAw_wO+uO4FmAYujo1uV5=SGRUmxqh_O_vAuofdyUuH=_m2Q@mail.gmail.com>
Subject: Re: [f2fs-dev] [PATCH] f2fs-tools: introduce fault injection to fsck
To: Chao Yu <chao@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, 
	kernel-team@android.com, Daeho Jeong <daehojeong@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 23, 2025 at 7:01=E2=80=AFPM Chao Yu <chao@kernel.org> wrote:
>
> On 4/19/25 00:56, Daeho Jeong wrote:
> > From: Daeho Jeong <daehojeong@google.com>
> >
> > Due to the difficulty of intentionally corrupting specific metadata on
> > some storage devices like zoned storage devices, it is challenging to
> > effectively verify fsck functionality. To facilitate this verification,
> > it is necessary to add a fault injection mode.
>
> Daeho,
>
> What do you think of adding some stats for how many time it was injected
> for each fault type? then we can check whether all faults we needed have
> been triggered and also we can get the triggered count.

Sounds good. Then, can we show the result at the end of the fsck run?

>
> Thanks,
>
> >
> > Signed-off-by: Daeho Jeong <daehojeong@google.com>
> > ---
> >  fsck/fsck.c       | 106 +++++++++++++++++++++++++++++++++-------------
> >  fsck/main.c       |  22 ++++++++++
> >  fsck/mkquota.c    |   3 ++
> >  include/f2fs_fs.h |  54 +++++++++++++++++++++++
> >  man/fsck.f2fs.8   |  36 ++++++++++++++++
> >  5 files changed, 192 insertions(+), 29 deletions(-)
> >
> > diff --git a/fsck/fsck.c b/fsck/fsck.c
> > index 8155cbd..e879d8c 100644
> > --- a/fsck/fsck.c
> > +++ b/fsck/fsck.c
> > @@ -16,6 +16,20 @@
> >  char *tree_mark;
> >  uint32_t tree_mark_size =3D 256;
> >
> > +const char *f2fs_fault_name[FAULT_MAX] =3D {
> > +     [FAULT_SEG_TYPE]        =3D "invalid segment type",
> > +     [FAULT_SUM_TYPE]        =3D "invalid summary type",
> > +     [FAULT_SUM_ENT]         =3D "invalid summary entry",
> > +     [FAULT_NAT]             =3D "invalid nat entry",
> > +     [FAULT_NODE]            =3D "invalid node block",
> > +     [FAULT_XATTR_ENT]       =3D "invalid xattr entry",
> > +     [FAULT_COMPR]           =3D "invalid compression type",
> > +     [FAULT_INODE]           =3D "invalid inode info",
> > +     [FAULT_DENTRY]          =3D "invalid dentry",
> > +     [FAULT_DATA]            =3D "invalid data block",
> > +     [FAULT_QUOTA]           =3D "invalid quota",
> > +};
> > +
> >  int f2fs_set_main_bitmap(struct f2fs_sb_info *sbi, u32 blk, int type)
> >  {
> >       struct f2fs_fsck *fsck =3D F2FS_FSCK(sbi);
> > @@ -23,9 +37,9 @@ int f2fs_set_main_bitmap(struct f2fs_sb_info *sbi, u3=
2 blk, int type)
> >       int fix =3D 0;
> >
> >       se =3D get_seg_entry(sbi, GET_SEGNO(sbi, blk));
> > -     if (se->type >=3D NO_CHECK_TYPE)
> > -             fix =3D 1;
> > -     else if (IS_DATASEG(se->type) !=3D IS_DATASEG(type))
> > +     if (time_to_inject(FAULT_SEG_TYPE) ||
> > +                     (se->type >=3D NO_CHECK_TYPE) ||
> > +                     (IS_DATASEG(se->type) !=3D IS_DATASEG(type)))
> >               fix =3D 1;
> >
> >       /* just check data and node types */
> > @@ -168,7 +182,8 @@ static int is_valid_ssa_node_blk(struct f2fs_sb_inf=
o *sbi, u32 nid,
> >
> >       sum_blk =3D get_sum_block(sbi, segno, &type);
> >
> > -     if (type !=3D SEG_TYPE_NODE && type !=3D SEG_TYPE_CUR_NODE) {
> > +     if (time_to_inject(FAULT_SUM_TYPE) ||
> > +                     (type !=3D SEG_TYPE_NODE && type !=3D SEG_TYPE_CU=
R_NODE)) {
> >               /* can't fix current summary, then drop the block */
> >               if (!c.fix_on || type < 0) {
> >                       ASSERT_MSG("Summary footer is not for node segmen=
t");
> > @@ -189,7 +204,8 @@ static int is_valid_ssa_node_blk(struct f2fs_sb_inf=
o *sbi, u32 nid,
> >
> >       sum_entry =3D &(sum_blk->entries[offset]);
> >
> > -     if (le32_to_cpu(sum_entry->nid) !=3D nid) {
> > +     if (time_to_inject(FAULT_SUM_ENT) ||
> > +                     (le32_to_cpu(sum_entry->nid) !=3D nid)) {
> >               if (!c.fix_on || type < 0) {
> >                       DBG(0, "nid                       [0x%x]\n", nid)=
;
> >                       DBG(0, "target blk_addr           [0x%x]\n", blk_=
addr);
> > @@ -282,7 +298,7 @@ static int is_valid_ssa_data_blk(struct f2fs_sb_inf=
o *sbi, u32 blk_addr,
> >       struct f2fs_summary *sum_entry;
> >       struct seg_entry * se;
> >       u32 segno, offset;
> > -     int need_fix =3D 0, ret =3D 0;
> > +     int need_fix =3D 0, ret =3D 0, fault_sum_ent =3D 0;
> >       int type;
> >
> >       if (get_sb(feature) & F2FS_FEATURE_RO)
> > @@ -293,7 +309,8 @@ static int is_valid_ssa_data_blk(struct f2fs_sb_inf=
o *sbi, u32 blk_addr,
> >
> >       sum_blk =3D get_sum_block(sbi, segno, &type);
> >
> > -     if (type !=3D SEG_TYPE_DATA && type !=3D SEG_TYPE_CUR_DATA) {
> > +     if (time_to_inject(FAULT_SUM_TYPE) ||
> > +                     (type !=3D SEG_TYPE_DATA && type !=3D SEG_TYPE_CU=
R_DATA)) {
> >               /* can't fix current summary, then drop the block */
> >               if (!c.fix_on || type < 0) {
> >                       ASSERT_MSG("Summary footer is not for data segmen=
t");
> > @@ -314,7 +331,10 @@ static int is_valid_ssa_data_blk(struct f2fs_sb_in=
fo *sbi, u32 blk_addr,
> >
> >       sum_entry =3D &(sum_blk->entries[offset]);
> >
> > -     if (le32_to_cpu(sum_entry->nid) !=3D parent_nid ||
> > +     if (time_to_inject(FAULT_SUM_ENT))
> > +             fault_sum_ent =3D 1;
> > +
> > +     if (fault_sum_ent || le32_to_cpu(sum_entry->nid) !=3D parent_nid =
||
> >                       sum_entry->version !=3D version ||
> >                       le16_to_cpu(sum_entry->ofs_in_node) !=3D idx_in_n=
ode) {
> >               if (!c.fix_on || type < 0) {
> > @@ -333,7 +353,8 @@ static int is_valid_ssa_data_blk(struct f2fs_sb_inf=
o *sbi, u32 blk_addr,
> >                       DBG(0, "Target data block addr    [0x%x]\n", blk_=
addr);
> >                       ASSERT_MSG("Invalid data seg summary\n");
> >                       ret =3D -EINVAL;
> > -             } else if (is_valid_summary(sbi, sum_entry, blk_addr)) {
> > +             } else if (!fault_sum_ent &&
> > +                             is_valid_summary(sbi, sum_entry, blk_addr=
)) {
> >                       /* delete wrong index */
> >                       ret =3D -EINVAL;
> >               } else {
> > @@ -397,6 +418,9 @@ err:
> >  static int sanity_check_nat(struct f2fs_sb_info *sbi, u32 nid,
> >                                               struct node_info *ni)
> >  {
> > +     if (time_to_inject(FAULT_NAT))
> > +             return -EINVAL;
> > +
> >       if (!IS_VALID_NID(sbi, nid)) {
> >               ASSERT_MSG("nid is not valid. [0x%x]", nid);
> >               return -EINVAL;
> > @@ -436,6 +460,9 @@ static int sanity_check_nid(struct f2fs_sb_info *sb=
i, u32 nid,
> >       struct f2fs_fsck *fsck =3D F2FS_FSCK(sbi);
> >       int ret;
> >
> > +     if (time_to_inject(FAULT_NODE))
> > +             return -EINVAL;
> > +
> >       ret =3D sanity_check_nat(sbi, nid, ni);
> >       if (ret)
> >               return ret;
> > @@ -865,7 +892,7 @@ int chk_extended_attributes(struct f2fs_sb_info *sb=
i, u32 nid,
> >                               "end of list", nid);
> >               need_fix =3D true;
> >       }
> > -     if (need_fix && c.fix_on) {
> > +     if ((time_to_inject(FAULT_XATTR_ENT) || need_fix) && c.fix_on) {
> >               memset(ent, 0, (u8 *)last_base_addr - (u8 *)ent);
> >               write_all_xattrs(sbi, inode, xattr_size, xattr);
> >               FIX_MSG("[0x%x] nullify wrong xattr entries", nid);
> > @@ -907,7 +934,8 @@ void fsck_chk_inode_blk(struct f2fs_sb_info *sbi, u=
32 nid,
> >       if (!compressed)
> >               goto check_next;
> >
> > -     if (!compr_supported || (node_blk->i.i_inline & F2FS_INLINE_DATA)=
) {
> > +     if (time_to_inject(FAULT_COMPR) || !compr_supported ||
> > +                     (node_blk->i.i_inline & F2FS_INLINE_DATA)) {
> >               /*
> >                * The 'compression' flag in i_flags affects the traverse=
 of
> >                * the node tree.  Thus, it must be fixed unconditionally
> > @@ -943,12 +971,13 @@ check_next:
> >                       f2fs_set_main_bitmap(sbi, ni->blk_addr,
> >                                                       CURSEG_WARM_NODE)=
;
> >
> > -                     if (i_links =3D=3D 0 && (ftype =3D=3D F2FS_FT_CHR=
DEV ||
> > +                     if (time_to_inject(FAULT_INODE) ||
> > +                             (i_links =3D=3D 0 && (ftype =3D=3D F2FS_F=
T_CHRDEV ||
> >                               ftype =3D=3D F2FS_FT_BLKDEV ||
> >                               ftype =3D=3D F2FS_FT_FIFO ||
> >                               ftype =3D=3D F2FS_FT_SOCK ||
> >                               ftype =3D=3D F2FS_FT_SYMLINK ||
> > -                             ftype =3D=3D F2FS_FT_REG_FILE)) {
> > +                             ftype =3D=3D F2FS_FT_REG_FILE))) {
> >                               ASSERT_MSG("ino: 0x%x ftype: %d has i_lin=
ks: %u",
> >                                                       nid, ftype, i_lin=
ks);
> >                               if (c.fix_on) {
> > @@ -1008,7 +1037,8 @@ check_next:
> >               if (c.feature & F2FS_FEATURE_EXTRA_ATTR) {
> >                       unsigned int isize =3D
> >                               le16_to_cpu(node_blk->i.i_extra_isize);
> > -                     if (isize > 4 * DEF_ADDRS_PER_INODE) {
> > +                     if (time_to_inject(FAULT_INODE) ||
> > +                                     (isize > 4 * DEF_ADDRS_PER_INODE)=
) {
> >                               ASSERT_MSG("[0x%x] wrong i_extra_isize=3D=
0x%x",
> >                                               nid, isize);
> >                               if (c.fix_on) {
> > @@ -1038,8 +1068,9 @@ check_next:
> >                       unsigned int inline_size =3D
> >                               le16_to_cpu(node_blk->i.i_inline_xattr_si=
ze);
> >
> > -                     if (!inline_size ||
> > -                                     inline_size > MAX_INLINE_XATTR_SI=
ZE) {
> > +                     if (time_to_inject(FAULT_INODE) ||
> > +                                     (!inline_size ||
> > +                                     inline_size > MAX_INLINE_XATTR_SI=
ZE)) {
> >                               ASSERT_MSG("[0x%x] wrong inline_xattr_siz=
e:%u",
> >                                               nid, inline_size);
> >                               if (c.fix_on) {
> > @@ -1056,9 +1087,10 @@ check_next:
> >       }
> >       ofs =3D get_extra_isize(node_blk);
> >
> > -     if ((node_blk->i.i_flags & cpu_to_le32(F2FS_CASEFOLD_FL)) &&
> > -         (!S_ISDIR(le16_to_cpu(node_blk->i.i_mode)) ||
> > -          !(c.feature & F2FS_FEATURE_CASEFOLD))) {
> > +     if (time_to_inject(FAULT_INODE) ||
> > +              ((node_blk->i.i_flags & cpu_to_le32(F2FS_CASEFOLD_FL)) &=
&
> > +               (!S_ISDIR(le16_to_cpu(node_blk->i.i_mode)) ||
> > +                !(c.feature & F2FS_FEATURE_CASEFOLD)))) {
> >               ASSERT_MSG("[0x%x] unexpected casefold flag", nid);
> >               if (c.fix_on) {
> >                       FIX_MSG("ino[0x%x] clear casefold flag", nid);
> > @@ -1077,7 +1109,8 @@ check_next:
> >                       qf_szchk_type[cur_qtype] =3D QF_SZCHK_INLINE;
> >               block_t blkaddr =3D le32_to_cpu(node_blk->i.i_addr[ofs]);
> >
> > -             if (blkaddr !=3D NULL_ADDR) {
> > +             if (time_to_inject(FAULT_INODE) ||
> > +                             (blkaddr !=3D NULL_ADDR)) {
> >                       ASSERT_MSG("[0x%x] wrong inline reserve blkaddr:%=
u",
> >                                       nid, blkaddr);
> >                       if (c.fix_on) {
> > @@ -1088,7 +1121,8 @@ check_next:
> >                               need_fix =3D 1;
> >                       }
> >               }
> > -             if (i_size > inline_size) {
> > +             if (time_to_inject(FAULT_INODE) ||
> > +                             (i_size > inline_size)) {
> >                       ASSERT_MSG("[0x%x] wrong inline size:%lu",
> >                                       nid, (unsigned long)i_size);
> >                       if (c.fix_on) {
> > @@ -1118,7 +1152,7 @@ check_next:
> >               block_t blkaddr =3D le32_to_cpu(node_blk->i.i_addr[ofs]);
> >
> >               DBG(3, "ino[0x%x] has inline dentry!\n", nid);
> > -             if (blkaddr !=3D 0) {
> > +             if (time_to_inject(FAULT_INODE) || (blkaddr !=3D 0)) {
> >                       ASSERT_MSG("[0x%x] wrong inline reserve blkaddr:%=
u",
> >                                                               nid, blka=
ddr);
> >                       if (c.fix_on) {
> > @@ -1728,6 +1762,9 @@ static int f2fs_check_hash_code(int encoding, int=
 casefolded,
> >                       struct f2fs_dir_entry *dentry,
> >                       const unsigned char *name, u32 len, int enc_name)
> >  {
> > +     if (time_to_inject(FAULT_DENTRY))
> > +             return 1;
> > +
> >       /* Casefolded Encrypted names require a key to compute siphash */
> >       if (enc_name && casefolded)
> >               return 0;
> > @@ -1799,7 +1836,8 @@ static int __chk_dots_dentries(struct f2fs_sb_inf=
o *sbi,
> >       int fixed =3D 0;
> >
> >       if ((name[0] =3D=3D '.' && len =3D=3D 1)) {
> > -             if (le32_to_cpu(dentry->ino) !=3D child->p_ino) {
> > +             if (time_to_inject(FAULT_DENTRY) ||
> > +                             (le32_to_cpu(dentry->ino) !=3D child->p_i=
no)) {
> >                       ASSERT_MSG("Bad inode number[0x%x] for '.', paren=
t_ino is [0x%x]\n",
> >                               le32_to_cpu(dentry->ino), child->p_ino);
> >                       dentry->ino =3D cpu_to_le32(child->p_ino);
> > @@ -1809,13 +1847,16 @@ static int __chk_dots_dentries(struct f2fs_sb_i=
nfo *sbi,
> >
> >       if (name[0] =3D=3D '.' && name[1] =3D=3D '.' && len =3D=3D 2) {
> >               if (child->p_ino =3D=3D F2FS_ROOT_INO(sbi)) {
> > -                     if (le32_to_cpu(dentry->ino) !=3D F2FS_ROOT_INO(s=
bi)) {
> > +                     if (time_to_inject(FAULT_DENTRY) ||
> > +                                     (le32_to_cpu(dentry->ino) !=3D
> > +                                      F2FS_ROOT_INO(sbi))) {
> >                               ASSERT_MSG("Bad inode number[0x%x] for '.=
.'\n",
> >                                       le32_to_cpu(dentry->ino));
> >                               dentry->ino =3D cpu_to_le32(F2FS_ROOT_INO=
(sbi));
> >                               fixed =3D 1;
> >                       }
> > -             } else if (le32_to_cpu(dentry->ino) !=3D child->pp_ino) {
> > +             } else if (time_to_inject(FAULT_DENTRY) ||
> > +                             (le32_to_cpu(dentry->ino) !=3D child->pp_=
ino)) {
> >                       ASSERT_MSG("Bad inode number[0x%x] for '..', pare=
nt parent ino is [0x%x]\n",
> >                               le32_to_cpu(dentry->ino), child->pp_ino);
> >                       dentry->ino =3D cpu_to_le32(child->pp_ino);
> > @@ -1826,7 +1867,7 @@ static int __chk_dots_dentries(struct f2fs_sb_inf=
o *sbi,
> >       if (f2fs_check_hash_code(get_encoding(sbi), casefolded, dentry, n=
ame, len, enc_name))
> >               fixed =3D 1;
> >
> > -     if (name[len] !=3D '\0') {
> > +     if (time_to_inject(FAULT_DENTRY) || (name[len] !=3D '\0')) {
> >               ASSERT_MSG("'.' is not NULL terminated\n");
> >               name[len] =3D '\0';
> >               memcpy(*filename, name, len);
> > @@ -1889,7 +1930,8 @@ static int __chk_dentries(struct f2fs_sb_info *sb=
i, int casefolded,
> >                       i++;
> >                       continue;
> >               }
> > -             if (!IS_VALID_NID(sbi, le32_to_cpu(dentry[i].ino))) {
> > +             if (time_to_inject(FAULT_DENTRY) ||
> > +                             !IS_VALID_NID(sbi, le32_to_cpu(dentry[i].=
ino))) {
> >                       ASSERT_MSG("Bad dentry 0x%x with invalid NID/ino =
0x%x",
> >                                   i, le32_to_cpu(dentry[i].ino));
> >                       if (c.fix_on) {
> > @@ -1903,7 +1945,9 @@ static int __chk_dentries(struct f2fs_sb_info *sb=
i, int casefolded,
> >               }
> >
> >               ftype =3D dentry[i].file_type;
> > -             if ((ftype <=3D F2FS_FT_UNKNOWN || ftype > F2FS_FT_LAST_F=
ILE_TYPE)) {
> > +             if (time_to_inject(FAULT_DENTRY) ||
> > +                             (ftype <=3D F2FS_FT_UNKNOWN ||
> > +                              ftype > F2FS_FT_LAST_FILE_TYPE)) {
> >                       ASSERT_MSG("Bad dentry 0x%x with unexpected ftype=
 0x%x",
> >                                               le32_to_cpu(dentry[i].ino=
), ftype);
> >                       if (c.fix_on) {
> > @@ -1918,7 +1962,8 @@ static int __chk_dentries(struct f2fs_sb_info *sb=
i, int casefolded,
> >
> >               name_len =3D le16_to_cpu(dentry[i].name_len);
> >
> > -             if (name_len =3D=3D 0 || name_len > F2FS_NAME_LEN) {
> > +             if (time_to_inject(FAULT_DENTRY) ||
> > +                             (name_len =3D=3D 0 || name_len > F2FS_NAM=
E_LEN)) {
> >                       ASSERT_MSG("Bad dentry 0x%x with invalid name_len=
", i);
> >                       if (c.fix_on) {
> >                               FIX_MSG("Clear bad dentry 0x%x", i);
> > @@ -2153,6 +2198,9 @@ int fsck_chk_data_blk(struct f2fs_sb_info *sbi, s=
truct f2fs_inode *inode,
> >               return 0;
> >       }
> >
> > +     if (time_to_inject(FAULT_DATA))
> > +             return -EINVAL;
> > +
> >       if (!f2fs_is_valid_blkaddr(sbi, blk_addr, DATA_GENERIC)) {
> >               ASSERT_MSG("blkaddress is not valid. [0x%x]", blk_addr);
> >               return -EINVAL;
> > diff --git a/fsck/main.c b/fsck/main.c
> > index 47ba6c9..29792d8 100644
> > --- a/fsck/main.c
> > +++ b/fsck/main.c
> > @@ -91,6 +91,8 @@ void fsck_usage()
> >       MSG(0, "  --no-kernel-check skips detecting kernel change\n");
> >       MSG(0, "  --kernel-check checks kernel change\n");
> >       MSG(0, "  --debug-cache to debug cache when -c is used\n");
> > +     MSG(0, "  --fault_injection=3D%%d to enable fault injection with =
specified injection rate\n");
> > +     MSG(0, "  --fault_type=3D%%d to configure enabled fault injection=
 type\n");
> >       exit(1);
> >  }
> >
> > @@ -263,6 +265,8 @@ void f2fs_parse_options(int argc, char *argv[])
> >                       {"no-kernel-check", no_argument, 0, 2},
> >                       {"kernel-check", no_argument, 0, 3},
> >                       {"debug-cache", no_argument, 0, 4},
> > +                     {"fault_injection", required_argument, 0, 5},
> > +                     {"fault_type", required_argument, 0, 6},
> >                       {0, 0, 0, 0}
> >               };
> >
> > @@ -287,6 +291,24 @@ void f2fs_parse_options(int argc, char *argv[])
> >                       case 4:
> >                               c.cache_config.dbg_en =3D true;
> >                               break;
> > +                     case 5:
> > +                             val =3D atoi(optarg);
> > +                             if ((unsigned int)val <=3D 1) {
> > +                                     MSG(0, "\tError: injection rate m=
ust be larger "
> > +                                                     "than 1: %d\n", v=
al);
> > +                                     fsck_usage();
> > +                             }
> > +                             c.fault_info.inject_rate =3D val;
> > +                             c.fault_info.inject_type =3D F2FS_ALL_FAU=
LT_TYPE;
> > +                             break;
> > +                     case 6:
> > +                             val =3D atoi(optarg);
> > +                             if (val >=3D (1UL << (FAULT_MAX))) {
> > +                                     MSG(0, "\tError: Invalid inject t=
ype: %x\n", val);
> > +                                     fsck_usage();
> > +                             }
> > +                             c.fault_info.inject_type =3D val;
> > +                             break;
> >                       case 'a':
> >                               c.auto_fix =3D 1;
> >                               MSG(0, "Info: Automatic fix mode enabled.=
\n");
> > diff --git a/fsck/mkquota.c b/fsck/mkquota.c
> > index 2451b58..eb63fc9 100644
> > --- a/fsck/mkquota.c
> > +++ b/fsck/mkquota.c
> > @@ -372,6 +372,9 @@ errcode_t quota_compare_and_update(struct f2fs_sb_i=
nfo *sbi,
> >       dict_t *dict =3D qctx->quota_dict[qtype];
> >       errcode_t err =3D 0;
> >
> > +     if (time_to_inject(FAULT_QUOTA))
> > +             return -EINVAL;
> > +
> >       if (!dict)
> >               goto out;
> >
> > diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
> > index bb40adc..3e1056c 100644
> > --- a/include/f2fs_fs.h
> > +++ b/include/f2fs_fs.h
> > @@ -1476,6 +1476,33 @@ enum {
> >       F2FS_FEATURE_NAT_BITS =3D 0x0001,
> >  };
> >
> > +/* Fault inject control */
> > +enum {
> > +     FAULT_SEG_TYPE,
> > +     FAULT_SUM_TYPE,
> > +     FAULT_SUM_ENT,
> > +     FAULT_NAT,
> > +     FAULT_NODE,
> > +     FAULT_XATTR_ENT,
> > +     FAULT_COMPR,
> > +     FAULT_INODE,
> > +     FAULT_DENTRY,
> > +     FAULT_DATA,
> > +     FAULT_QUOTA,
> > +     FAULT_MAX
> > +};
> > +
> > +#define F2FS_ALL_FAULT_TYPE  ((1UL << (FAULT_MAX)) - 1)
> > +
> > +struct f2fs_fault_info {
> > +     int inject_ops;
> > +     int inject_rate;
> > +     unsigned int inject_type;
> > +};
> > +
> > +extern const char *f2fs_fault_name[FAULT_MAX];
> > +#define IS_FAULT_SET(fi, type) ((fi)->inject_type & (1UL << (type)))
> > +
> >  struct f2fs_configuration {
> >       uint32_t conf_reserved_sections;
> >       uint32_t reserved_segments;
> > @@ -1604,6 +1631,9 @@ struct f2fs_configuration {
> >               struct f2fs_journal nat_jnl;
> >               char nat_bytes[F2FS_MAX_BLKSIZE];
> >       };
> > +
> > +     /* Fault injection control */
> > +     struct f2fs_fault_info fault_info;
> >  };
> >
> >  extern int utf8_to_utf16(char *, const char *, size_t, size_t);
> > @@ -2131,4 +2161,28 @@ static inline void check_block_struct_sizes(void=
)
> >                       + NR_DENTRY_IN_BLOCK * F2FS_SLOT_LEN * sizeof(u8)=
 =3D=3D F2FS_BLKSIZE);
> >  }
> >
> > +/* Fault inject control */
> > +#define time_to_inject(type) __time_to_inject(type, __func__, \
> > +                                     __builtin_return_address(0))
> > +static inline bool __time_to_inject(int type, const char *func,
> > +             const char *parent_func)
> > +{
> > +     struct f2fs_fault_info *ffi =3D &c.fault_info;
> > +
> > +     if (!ffi->inject_rate)
> > +             return false;
> > +
> > +     if (!IS_FAULT_SET(ffi, type))
> > +             return false;
> > +
> > +     ffi->inject_ops++;
> > +     if (ffi->inject_ops >=3D ffi->inject_rate) {
> > +             ffi->inject_ops =3D 0;
> > +             MSG(0, "inject %s in %s of %p\n",
> > +                             f2fs_fault_name[type], func, parent_func)=
;
> > +             return true;
> > +     }
> > +     return false;
> > +}
> > +
> >  #endif       /*__F2FS_FS_H */
> > diff --git a/man/fsck.f2fs.8 b/man/fsck.f2fs.8
> > index e39a846..3762e6d 100644
> > --- a/man/fsck.f2fs.8
> > +++ b/man/fsck.f2fs.8
> > @@ -67,6 +67,42 @@ Enable to show every directory entries in the partit=
ion.
> >  Specify the level of debugging options.
> >  The default number is 0, which shows basic debugging messages.
> >  .TP
> > +.BI \-\-fault_injection=3D%d " enable fault injection"
> > +Enable fault injection in all supported types with specified injection=
 rate.
> > +.TP
> > +.BI \-\-fault_type=3D%d " configure fault injection type"
> > +Support configuring fault injection type, should be enabled with
> > +fault_injection option, fault type value is shown below, it supports
> > +single or combined type.
> > +.br
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D      =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +.br
> > +Type_Name                        Type_Value
> > +.br
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D      =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +.br
> > +FAULT_SEG_TYPE                   0x000000001
> > +.br
> > +FAULT_SUM_TYPE                   0x000000002
> > +.br
> > +FAULT_SUM_ENT                    0x000000004
> > +.br
> > +FAULT_NAT                        0x000000008
> > +.br
> > +FAULT_NODE                       0x000000010
> > +.br
> > +FAULT_XATTR_ENT                  0x000000020
> > +.br
> > +FAULT_COMPR                      0x000000040
> > +.br
> > +FAULT_INODE                      0x000000080
> > +.br
> > +FAULT_DENTRY                     0x000000100
> > +.br
> > +FAULT_DATA                       0x000000200
> > +.br
> > +FAULT_QUOTA                      0x000000400
> > +.TP
> >  .SH AUTHOR
> >  Initial checking code was written by Byoung Geun Kim <bgbg.kim@samsung=
.com>.
> >  Jaegeuk Kim <jaegeuk@kernel.org> reworked most parts of the codes to s=
upport
>
