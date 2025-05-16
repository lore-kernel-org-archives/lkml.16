Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B764B1E73
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 13:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747403423; cv=none; b=gbDvqIskYypKG2yrCDEG+oj/CJ3bW20cAldgBFVh4VBQ+AkuJAvfPWXPE+EJycBGOkWek+47a3TTxJjlM9bP8PZ4LJoIawYTNjRjcbQZuxfqXqdWka1qfMlStqhg+Yc5HgDNGLgjmm+F7vGrgabapuWE4PdpMg2pQ0UJzhSAfrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747403423; c=relaxed/simple;
	bh=SIxnaViebb8SJO0kPsSvZwZDgxllKGzKOTbgQ323x4E=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=bqBU5EN2Vl2nQlojx6FuJBdUA9qEAsKQcUFA7r5gzPMGV4SzJ6Dksnl4QUzE6SrCtInk2mbAD09W5lhCCgthpToyuP5ZS/XGEwY5rsMAgbvl3Nwuzx/XFWt9RidHwOinRPGCg9VhMFzN8BaaVeEbgJDw/pWHZI8P0UwOJGXGAxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ug1QzWi/; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ug1QzWi/"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7426c44e014so2296157b3a.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 06:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747403421; x=1748008221; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mbTN8OiwD5zdwfgv2rkO0h5HgYpmF/CJHvXv3sUMCYQ=;
        b=Ug1QzWi/uSWyhU309XYx0hYFQfUvdTZMUKh4WXFUkP9uwxOMigz0yuTEY/7c/f1+19
         9noFyrZ4HOmUtd6oFD8p/EaDo8qLYAniz6I+jcm8/zYNEaOhwMQIKzqK5uAVtX1PPA30
         d0NPrqkb898q9iaO3nuXiHDOSEV6aznmEGyKng5kGABldutK2BgxANMbO7fQlW8AxIlm
         eRfVvHpYXxFBWr6ekTgcZho4H5kyJHGCdX6PkbPvygKL13DcHoHwuUOEy4zHoKJhT5Ra
         lL+E/gF047traDGIjKG7ejyBSF3dbAFquFasIx4Veb5f0atROiGWTZrs0LE+brn+rCnf
         Yvcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747403421; x=1748008221;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mbTN8OiwD5zdwfgv2rkO0h5HgYpmF/CJHvXv3sUMCYQ=;
        b=i9q2+2etmMkjR4vkKTmjvQ3sr16ogGOyW/IqavM35hS+jWcN4jhvy5UyAZvZfG1xme
         +h3zXAEJGQPaND/9LjAdJmisOuthL7vKKpnw57DRxU8uLCzoCoRcwUJkHERe/Bh0H6vX
         1OutHkYWKA3TdA7F1ZUCkiXvH2x7FA9eMCIVRvciCJv893AUGiEYXKCq12SXmXN1Isjx
         rh9Fqx2u1UPXUhI7Au91MHa8KH/DHKo8vLO9wJcZ8M7y1dSRuXE8OUEe67BnhWA25YjB
         K+ovOJHlEONEvEtRx1LqiZ8Y6rRqEwTpOI9fqoAxAyKUvZy6YAl6yMJq1krSOYsdNejL
         wJMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDrrTAy6ISbWOtydBHbiw4+gjTWmSQQmKS4AVzdbUYTyTzmNB8Ld2TYu+XNvqpGr11V8zhjd/2Nd37WdA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUqCKf6WbAmOEDRyEDPrqMNQCkZjOjZXfMgQ58R4AHZtjcDIyo
	S5vgEcQvpNPKZ7LhfFCiX2f+fLPEqIedVujL5rl1LgDvmz9sVY7AQBBV
X-Gm-Gg: ASbGnctQR5EYEXsf3fH7YP/1TtWAThmtiEYTGvoGo7XUpzf+jaOXVsdf3NbX7WE1syq
	d4yan19//atrPQBekM3YZrSx7QsAQZwktdrTfjANNKlE8iO0yctMdKF0SavADFE7rnPZXvYLX1d
	w2svgs0Lw9fId9jNcpUaaWFElxuBeqFBKn8ypEs7GPOQNdaJt3vAid0wc8XkjHb60jQ51zAwra+
	PECBdRBC8Dwuqy8FHxLA6ExchXszD46hEafK38gPHg6BIfeb4+1AxqhQnc3qmXY0DIbBfJR7L81
	QRA5RJdX2QnrRVpTBWUWPfPGGC2XX5s4TpNmSW5fOVWeGsdqCn8tIwobKLYm3tQ=
X-Google-Smtp-Source: AGHT+IENqp8l1SqhqATNaENvpHyiis/Yg7n1lv5p90HaZKZVWGv7mVdgeRU8YtBlXUFoYfiXsgUdyQ==
X-Received: by 2002:a05:6a00:2401:b0:736:ab1d:83c4 with SMTP id d2e1a72fcca58-742a9633dfamr4227851b3a.0.1747403421034;
        Fri, 16 May 2025 06:50:21 -0700 (PDT)
Received: from [10.189.144.225] ([43.224.245.249])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eaf8e13csm1564506a12.45.2025.05.16.06.50.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 May 2025 06:50:20 -0700 (PDT)
Message-ID: <4f26b365-bca1-4ca7-99b7-f4b80cff26be@gmail.com>
Date: Fri, 16 May 2025 21:50:16 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Sheng Yong <shengyong2021@gmail.com>
Subject: Re: [PATCH v6] erofs: add 'fsoffset' mount option for file-backed &
 bdev-based mounts
To: Gao Xiang <hsiangkao@linux.alibaba.com>, xiang@kernel.org,
 chao@kernel.org, zbestahu@gmail.com, jefflexu@linux.alibaba.com,
 dhavale@google.com, lihongbo22@huawei.com
Cc: linux-erofs@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Sheng Yong <shengyong1@xiaomi.com>, Wang Shuai <wangshuai12@xiaomi.com>
References: <20250516090055.3343777-1-shengyong1@xiaomi.com>
 <b91b9f2c-3a07-4726-95d9-75d36bb59871@linux.alibaba.com>
Content-Language: en-US, fr-CH
In-Reply-To: <b91b9f2c-3a07-4726-95d9-75d36bb59871@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Xiang,

On 5/16/25 17:15, Gao Xiang wrote:
> Hi Yong,
> 
> On 2025/5/16 17:00, Sheng Yong wrote:
> 
> ...
> 
>> diff --git a/Documentation/filesystems/erofs.rst b/Documentation/ 
>> filesystems/erofs.rst
>> index c293f8e37468..b24cb0d5d4d6 100644
>> --- a/Documentation/filesystems/erofs.rst
>> +++ b/Documentation/filesystems/erofs.rst
>> @@ -128,6 +128,7 @@ device=%s              Specify a path to an extra 
>> device to be used together.
>>   fsid=%s                Specify a filesystem image ID for Fscache 
>> back-end.
>>   domain_id=%s           Specify a domain ID in fscache mode so that 
>> different images
>>                          with the same blobs under a given domain ID 
>> can share storage.
>> +fsoffset=%lu           Specify image offset for file-backed or bdev- 
>> based mounts.
> 
> Maybe document it as:
> fsoffset=%lu              Specify filesystem offset for the primary device.

OK, this makes sense. But if we need to handle offset for extra devices,
we might need to use an array or a string to temporarily store the values.
This is because devices are not initialized during parsing parameters.
And set `off' for each extra device during scan devices.
For now, I prefer to add fsoffset for the primary device only. I think
the primary device which has an offset is the more generic case.

> 
> Since I'm not sure if we need later
> fsoffset=%lu,[%lu,...]    Specify filesystem offset for all devices.
> 
>>   ===================    
>> =========================================================
>>   Sysfs Entries
>> diff --git a/fs/erofs/data.c b/fs/erofs/data.c
>> index 2409d2ab0c28..599a44d5d782 100644
>> --- a/fs/erofs/data.c
>> +++ b/fs/erofs/data.c
>> @@ -27,9 +27,12 @@ void erofs_put_metabuf(struct erofs_buf *buf)
>>   void *erofs_bread(struct erofs_buf *buf, erofs_off_t offset, bool 
>> need_kmap)
>>   {
>> -    pgoff_t index = offset >> PAGE_SHIFT;
>> +    pgoff_t index;
> 
> How about just
>      pgoff_t index = (offset + buf->off) >> PAGE_SHIFT;
> 
> since it's not complex to break it into two statements..
> 
>>       struct folio *folio = NULL;
>> +    offset += buf->off;
>> +    index = offset >> PAGE_SHIFT;
>> +
>>       if (buf->page) {
>>           folio = page_folio(buf->page);
>>           if (folio_file_page(folio, index) != buf->page)
>> @@ -54,6 +57,7 @@ void erofs_init_metabuf(struct erofs_buf *buf, 
>> struct super_block *sb)
>>       struct erofs_sb_info *sbi = EROFS_SB(sb);
>>       buf->file = NULL;
>> +    buf->off = sbi->dif0.off;
>>       if (erofs_is_fileio_mode(sbi)) {
>>           buf->file = sbi->dif0.file;    /* some fs like FUSE needs it */
>>           buf->mapping = buf->file->f_mapping;
>> @@ -299,7 +303,7 @@ static int erofs_iomap_begin(struct inode *inode, 
>> loff_t offset, loff_t length,
>>           iomap->private = buf.base;
>>       } else {
>>           iomap->type = IOMAP_MAPPED;
>> -        iomap->addr = mdev.m_pa;
>> +        iomap->addr = mdev.m_dif->off + mdev.m_pa;
> 
> I mean, could we update erofs_init_device() and then
> `mdev.pa` is already an number added by `mdev.m_dif->off`...
> 
> Is it possible? since mdev.pa is already a device-based
> offset.

I think in most cases we can add `off' to mdev.m_pa directly in
erofs_map_dev(). But for readdir, erofs_read_metabuf(mdev.m_pa)
is called after erofs_map_dev() in dir's erofs_iomap_begin().
However, read metabuf needs `off'.

> 
>>           if (flags & IOMAP_DAX)
>>               iomap->addr += mdev.m_dif->dax_part_off;
>>       }
>> diff --git a/fs/erofs/fileio.c b/fs/erofs/fileio.c
>> index 60c7cc4c105c..a2c7001ff789 100644
>> --- a/fs/erofs/fileio.c
>> +++ b/fs/erofs/fileio.c
>> @@ -147,7 +147,8 @@ static int erofs_fileio_scan_folio(struct 
>> erofs_fileio *io, struct folio *folio)
>>                   if (err)
>>                       break;
>>                   io->rq = erofs_fileio_rq_alloc(&io->dev);
>> -                io->rq->bio.bi_iter.bi_sector = io->dev.m_pa >> 9;
>> +                io->rq->bio.bi_iter.bi_sector =
>> +                    (io->dev.m_dif->off + io->dev.m_pa) >> 9;
> 
> So we don't need here.
> 
>>                   attached = 0;
>>               }unambiguous
>>               if (!bio_add_folio(&io->rq->bio, folio, len, cur))
>> diff --git a/fs/erofs/internal.h b/fs/erofs/internal.h
>> index 4ac188d5d894..cd8c738f5eb8 100644
>> --- a/fs/erofs/internal.h
>> +++ b/fs/erofs/internal.h
>> @@ -43,6 +43,7 @@ struct erofs_device_info {
>>       char *path;
>>       struct erofs_fscache *fscache;
>>       struct file *file;
>> +    u64 off;
>>       struct dax_device *dax_dev;
>>       u64 dax_part_off;
> 
> Maybe `u64 off, dax_part_off;` here?
> 
> Also I'm still not quite sure `off` is unambiguous...
> Maybe `dataoff`? not quite sure.

What about fsoff accroding to fsoffset?

> 
>> @@ -199,6 +200,7 @@ enum {
>>   struct erofs_buf {
>>       struct address_space *mapping;
>>       struct file *file;
>> +    u64 off;
>>       struct page *page;
>>       void *base;
>>   };
>> diff --git a/fs/erofs/super.c b/fs/erofs/super.c
>> index da6ee7c39290..512877d7d855 100644
>> --- a/fs/erofs/super.c
>> +++ b/fs/erofs/super.c
>> @@ -356,7 +356,7 @@ static void erofs_default_options(struct 
>> erofs_sb_info *sbi)
>>   enum {
>>       Opt_user_xattr, Opt_acl, Opt_cache_strategy, Opt_dax, Opt_dax_enum,
>> -    Opt_device, Opt_fsid, Opt_domain_id, Opt_directio,
>> +    Opt_device, Opt_fsid, Opt_domain_id, Opt_directio, Opt_fsoffset,
>>   };
>>   static const struct constant_table erofs_param_cache_strategy[] = {
>> @@ -383,6 +383,7 @@ static const struct fs_parameter_spec 
>> erofs_fs_parameters[] = {
>>       fsparam_string("fsid",        Opt_fsid),
>>       fsparam_string("domain_id",    Opt_domain_id),
>>       fsparam_flag_no("directio",    Opt_directio),
>> +    fsparam_u64("fsoffset",        Opt_fsoffset),
>>       {}
>>   };
>> @@ -506,6 +507,9 @@ static int erofs_fc_parse_param(struct fs_context 
>> *fc,
>>           errorfc(fc, "%s option not supported", 
>> erofs_fs_parameters[opt].name);
>>   #endif
>>           break;
>> +    case Opt_fsoffset:
>> +        sbi->dif0.off = result.uint_64;
>> +        break;
>>       }
>>       return 0;
>>   }
>> @@ -599,6 +603,10 @@ static int erofs_fc_fill_super(struct super_block 
>> *sb, struct fs_context *fc)
>>                   &sbi->dif0.dax_part_off, NULL, NULL);
>>       }
>> +    if (sbi->dif0.off & ((1 << sbi->blkszbits) - 1))
>> +        return invalfc(fc, "fsoffset %lld not aligned to block size",
> 
> is `sbi->blkszbits` valid here? I think it should be moved down
> to "erofs_read_superblock(sb)".
> 
>              "fsoffset %llu is not aligned to block size %u",
>              sbi->dif0.off, (1 << sbi->blkszbits)
> 
>> +                   sbi->dif0.off);
> 
> If fscache doesn't work, we might need to fail out here too.
> 
OK, will fix that in the next version.

thanks,
shengyong
> 
> 
>> +
>>       err = erofs_read_superblock(sb);
>>       if (err)
>>           return err;
>> @@ -947,6 +955,8 @@ static int erofs_show_options(struct seq_file 
>> *seq, struct dentry *root)
>>       if (sbi->domain_id)
>>           seq_printf(seq, ",domain_id=%s", sbi->domain_id);
>>   #endif
>> +    if (sbi->dif0.off)
>> +        seq_printf(seq, ",fsoffset=%lld", sbi->dif0.off);
>>       return 0;
>>   }
>> diff --git a/fs/erofs/zdata.c b/fs/erofs/zdata.c
>> index b8e6b76c23d5..4f910d7ffb2f 100644
>> --- a/fs/erofs/zdata.c
>> +++ b/fs/erofs/zdata.c
>> @@ -1707,7 +1707,8 @@ static void z_erofs_submit_queue(struct 
>> z_erofs_frontend *f,
>>                       bio = bio_alloc(mdev.m_bdev, BIO_MAX_VECS,
>>                               REQ_OP_READ, GFP_NOIO);
>>                   bio->bi_end_io = z_erofs_endio;
>> -                bio->bi_iter.bi_sector = cur >> 9;
>> +                bio->bi_iter.bi_sector =
>> +                        (mdev.m_dif->off + cur) >> 9;
> 
> So we don't need here as well.
> 
> Thanks,
> Gao Xiang

