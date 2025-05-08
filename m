Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A900A19D891
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 12:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746708801; cv=none; b=D4vWKbNi77Wf2AmF8dpqqNkeIb5S4DoadSqMJ590t+qjqedCO3DbdTr04TO9azi/7JSu8VH9bpjhQ2RxDqm/m5CUnyo1J7vF9jOD4kAG0WXE0m4Khv/tcHWPcu4qbQ2T9u3ESXJ+CTSkhfdvUUtALKzHeVD9Nnn7rMp6dIrP1RE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746708801; c=relaxed/simple;
	bh=MO7AvdqOlFy/SOhn30F4wpqxq56DaDUKnlWbBDMHtuo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IuzRhv7k/jZLGbDXdDR8fZ0NaTI4NZbUXuDh7nFuC2sS4ct/aDzCPJtcSfxTuJsCc2L28H2mHbco7h5OR6zzjZPZiDtpCX29kI4/cQqhX2ZZTflaUY9dRe+hMFC6aoOeP76V9I/E53LvPQCzDzHLlji4buw6ae47RhA+bebYj3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ecq2CBxc; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ecq2CBxc"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-22e16234307so10721895ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 05:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746708799; x=1747313599; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A2jdQICSbrWpPSzC616u74O39zxpPw10REWcsnl5lv4=;
        b=Ecq2CBxcMuhgWZ3a5ItJYGzaRSMA5csSIHAfCBzM/Ca+ES/YLA+xlDQJz3kf5XKmSd
         mTaeJkDSgCoCSxqKg/KA1sDJ0KmrKSxwDli6dgwgerHhuPY0Vz5V6Vy2PzOOAyptYyV8
         eCurUqRiTpMx9KI7VfMv2FSvADZWo7Sa65TGHgH3RVWc1wO4fue02P2eu+LCq1pqnHLk
         aqhy/BU8C2OSZrUIbljjW/G6m4JEJQMctdXaLBfsy5iDEiKasQWLT57GDrz0bdbyQTaE
         DaFsCLAXN/w2r7zovWTFIzNHQzhIGTXnQQvWGnyvybav8zspzh05DO2coMURNYMJs58C
         jvEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746708799; x=1747313599;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A2jdQICSbrWpPSzC616u74O39zxpPw10REWcsnl5lv4=;
        b=av6KyZYKc1pa2d3cPFvBPxyG8GVBZbVT33FeR/2zHfeBhpWGzHPUGKHXJhIR5BIPX5
         0g+PiesP5ZKNWkh1gtjT/TmDxdsWyeg0HRlkeSsOkd7DbpSKdTZndt9Io+AVhsc1u/OW
         SupZHQSOP9L3nHxdly47qfgpVN1arFyWEoAbWAOUiKn99LxpqyXEGf0LPMWPg/4jw68B
         HqGUNoBD8oCYkDGstYjqQ/oWTM2SlU3k8vB41u3uBjgtWk7ISc/Qn21MY5SBs2xrDOqT
         BUf9npmb7VoX5Emi2djDs2+wIvjKgOmhrVn3xHYFM6NDNHL7xVGwXy4GIXHDQzulOLla
         gCVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUS/INMx2VgcMscxz2Qu5xIlkEczlWNML2ROWA/RuEqhhexUO68uxajJJHlRZg9/ARqeuTV6QlstNndssc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyeP9tjsxkpvL+nh6rsIuGF2GUqnKMRb7sCVyOpjRVEdcvx5EQB
	M9RMRuBrLNraN3GVni5zsbWUOkR7jc3M3owRByTj7v8bKCkpKBt0
X-Gm-Gg: ASbGncvMYmIaCJfYA/KGwtMRGVuu//fbQQf1lPVo+i5z37LoLxDHbkVjUvZauay1wHA
	/v2cfBTw/uFea/GUYGJM45QyzgIrDVwrzKodUgIJFuod90/lvMw7o+FwHY/v+7Gv2nSqpBP5Bbb
	eGeQpCNavs07uMgzdzhxUsfUbJ8MUGLkO1svceL7a/nSjqN0vH3jOH95QnFnfMFnfVBrfGW9FFQ
	Vxx4ODMhldP6ocprZUB0upKbO1xf+Frd1lfdDqpRwvSuDE5cJTOQJZcSyR/tXzTKGuYMckVSNKX
	LKyE3cQx8eDLvOjglKOnb69VLhHz9GMk4HjngGM+YKXqh5Cnvcfa
X-Google-Smtp-Source: AGHT+IFwxfSao0kgRqnrILMlXsP5Q8tpHiPhGviH4oQ88rh5sv1UYwb+YKX9PMzCmcphLtnW6R4sAA==
X-Received: by 2002:a17:903:2307:b0:22d:e57a:27b0 with SMTP id d9443c01a7336-22e846e080dmr46241045ad.2.1746708798807;
        Thu, 08 May 2025 05:53:18 -0700 (PDT)
Received: from [10.189.144.225] ([43.224.245.227])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e1521fca5sm111609795ad.136.2025.05.08.05.53.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 05:53:18 -0700 (PDT)
Message-ID: <93df9b24-3a37-48ff-aa21-5f27a76ecf90@gmail.com>
Date: Thu, 8 May 2025 20:53:14 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] erofs: add 'fsoffset' mount option for file-backed
 & bdev-based mounts
To: Gao Xiang <hsiangkao@linux.alibaba.com>, xiang@kernel.org,
 chao@kernel.org, zbestahu@gmail.com, jefflexu@linux.alibaba.com,
 dhavale@google.com, kzak@redhat.com
Cc: linux-erofs@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 wangshuai12@xiaomi.com, Sheng Yong <shengyong1@xiaomi.com>
References: <20250408122351.2104507-1-shengyong1@xiaomi.com>
 <20250408122351.2104507-2-shengyong1@xiaomi.com>
 <6389156c-c6df-4e02-ab46-3aaf6230ef76@linux.alibaba.com>
Content-Language: en-US
From: Sheng Yong <shengyong2021@gmail.com>
In-Reply-To: <6389156c-c6df-4e02-ab46-3aaf6230ef76@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/8/25 12:09, Gao Xiang wrote:
> Hi Yong,
> 
[...]
>> diff --git a/fs/erofs/internal.h b/fs/erofs/internal.h
>> index 4ac188d5d894..10656bd986bd 100644
>> --- a/fs/erofs/internal.h
>> +++ b/fs/erofs/internal.h
>> @@ -43,6 +43,7 @@ struct erofs_device_info {
>>       char *path;
>>       struct erofs_fscache *fscache;
>>       struct file *file;
>> +    loff_t off;
>>       struct dax_device *dax_dev;
>>       u64 dax_part_off;
> 
> I wonder if it's possible to combine off as dax_part_off since
> they are the same functionality...

Hi, Xiang,

Thanks for the review. Yes, they almost have the same functionality.
Will combine them.
> 
>> @@ -199,6 +200,7 @@ enum {
>>   struct erofs_buf {
>>       struct address_space *mapping;
>>       struct file *file;
>> +    loff_t off;
> 
> I wonder if there is some other way to check
> if it's a metabuf, so that we could just use sbi->dif0.off..
> 
> But not sure.

It seems no specific fields could tell directly whether a buf is a
metabuf. But I'll have a try.
> 
>>       struct page *page;
>>       void *base;
>>   };
> 
> ..
> 
>> +        if (sb->s_bdev)
>> +            devsz = bdev_nr_bytes(sb->s_bdev);
>> +        else if (erofs_is_fileio_mode(sbi))
>> +            devsz = i_size_read(file_inode(sbi->dif0.file));
>> +        else
>> +            return invalfc(fc, "fsoffset only supports file or bdev 
>> backing");
>> +        if (sbi->dif0.off + (1 << sbi->blkszbits) > devsz)
>> +            return invalfc(fc, "fsoffset exceeds device size");
> 
> I wonder if those checks are really necessary? even it exceeds
> the device size, it won't find the valid on-disk superblock then.

Will remove this check.
> 
>> +    }
>> +
[...]
>> diff --git a/fs/erofs/zdata.c b/fs/erofs/zdata.c
>> index 0671184d9cf1..671527b63c6d 100644
>> --- a/fs/erofs/zdata.c
>> +++ b/fs/erofs/zdata.c
>> @@ -1624,7 +1624,8 @@ static void z_erofs_submit_queue(struct 
>> z_erofs_frontend *f,
>>                    bool *force_fg, bool readahead)
>>   {
>>       struct super_block *sb = f->inode->i_sb;
>> -    struct address_space *mc = MNGD_MAPPING(EROFS_SB(sb));
>> +    struct erofs_sb_info *sbi = EROFS_SB(sb);
>> +    struct address_space *mc = MNGD_MAPPING(sbi);
>>       struct z_erofs_pcluster **qtail[NR_JOBQUEUES];
>>       struct z_erofs_decompressqueue *q[NR_JOBQUEUES];
>>       struct z_erofs_pcluster *pcl, *next;
>> @@ -1673,12 +1674,15 @@ static void z_erofs_submit_queue(struct 
>> z_erofs_frontend *f,
>>               if (bio && (cur != last_pa ||
>>                       bio->bi_bdev != mdev.m_bdev)) {
>>   drain_io:
>> -                if (erofs_is_fileio_mode(EROFS_SB(sb)))
>> +                if (erofs_is_fileio_mode(sbi)) {
>>                       erofs_fileio_submit_bio(bio);
>> -                else if (erofs_is_fscache_mode(sb))
>> +                } else if (erofs_is_fscache_mode(sb)) {
>>                       erofs_fscache_submit_bio(bio);
>> -                else
>> +                } else {
>> +                    bio->bi_iter.bi_sector +=
>> +                        sbi->dif0.off >> SECTOR_SHIFT;
> 
> How about multi-device? I guess we should modify
> erofs_map_dev() directly rather than callers.
Will fix fsoffset on multi device in the next version.

thanks,
shengyong
> 
> Thanks,
> Gao Xiang

