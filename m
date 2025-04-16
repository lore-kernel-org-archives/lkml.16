Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35D2E22AE7F
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 06:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744784854; cv=none; b=MqwsTRnt/d/78DiSkiwLuCqSMcizBto1Viycgof+RkovcAg8cd5g8sj8tI67ZACC/RhTscdQkPicBzvQOXh9IHpYRQ8MmWzLT6wItCFoTFLezjV4phUe6cTjMgsNL2K0VWx0aDKmgo06rQks5a9BFKAxpJEEJj6VbonjTtuTez4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744784854; c=relaxed/simple;
	bh=KjFq3ynfOWjZNsyInKkKjA/dyH3wqhE4YtixTLTY+4I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q5HJtSjK5KQLyPJ4779btNP0eOI8hzBIhhqZcMNkQDyURFYCFWcPP2TK9cllhxB1LGyfcJaKYLl7RtMfwmSRNAG0b9pSB1hM0zv4onl11k673kCq0MjFE/vxLrvP0+OY7t0p6E3b0dSKjWleQuX2nu7vXH0ddtA1yqAZXWgMVAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RQYhh9TI; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RQYhh9TI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744784850;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LTqsEaqfQoRzUYlJ/wtXYrZAFHrCEWxlQ9NWGQ3mbUg=;
	b=RQYhh9TIoaVREtkQuXg4QOycspXJ0KvIIPg/jfYdEKUYkxY9TyUmmK294Qznr0aoWOwijV
	/sVE37RCYJJejo2CWP3loNewh4YXSjTvZVT8p/BKaqoUnd+/ZnE0cLR3Lj6auAX6n6Qrsy
	GIBn716WqZtZsY132dnO0mkcISih2oI=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-678-XLJQKouoN0m8qisCFKmJQw-1; Wed, 16 Apr 2025 02:27:28 -0400
X-MC-Unique: XLJQKouoN0m8qisCFKmJQw-1
X-Mimecast-MFC-AGG-ID: XLJQKouoN0m8qisCFKmJQw_1744784847
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b090c7c2c6aso1752566a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 23:27:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744784847; x=1745389647;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LTqsEaqfQoRzUYlJ/wtXYrZAFHrCEWxlQ9NWGQ3mbUg=;
        b=Nd2hJBfaHbsrEjfB8DRlQjBbJH+UM9Ps9xfXFq3l1VGaVufTDXbWttWBElgzstIgla
         OEmnZGgGQnekZNQ8Dlz86Cze8ptB5WH+SUMKBkE7JhUtMWw7OqJVaIrRIVpXj/kKmVMh
         6itTqeMCBlh1EOQVYwVN1Rv05vIMZr/tSi4xN0MY3PTPemmA9kA88J5JFWVKK0kcTaGP
         Pfq8wmcnfCJGyy7pOUFc4KXmKvCjWY503nlEwFqEBIfFgkzO8tpEMef390T+q2NZ6hbW
         hW2S2sCNyrqJ8B3LlOnkD3Qg1mY3rE/lE7tLAqaYBsmeZChGuqAAKur03szyXjdogSuS
         NJeg==
X-Forwarded-Encrypted: i=1; AJvYcCWP+EJiA2MHneuUVZGEOwaTfMNPGYbAsR2O2X1BJrucMmYc2RviXFqcHxh3dntx7GtAkpw9DaTv7bBL8x0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhQAR//YdkmUpNV0N6J4MGwQ/Ba+qMnTq+rSt1yT+hzUUOExMT
	yiuGwuaSM4gQUxW4ZMkOBdUc5t1XZz+k5YOjfCdba63P3gd2z+KJQMFsuI0Fw+vuoyYjgoBVJas
	sFs+husJVFPvmsy9/evkZdtq3VC+WYseLI5SZgbS1lH3aShoosHtstYwGGLonYQ==
X-Gm-Gg: ASbGncuvSCHZ3EV8HsudnvZWwf6YbektAVNMfEJT2raRFzm7V0rvhSsr88E7CpYk081
	3lpsc9SsHyKPV6vW0EfUOitPq8/hSa7A7njfIl3b2XWRCeZbuvcm69xVhMNQGSdYoKky3S4wh1V
	eRpz/z+gMqg94AyTYOTqKPIU1hgP6PAwwc8vZvup6jlEH6Gy+48DAdJQ5NpgkryWh0kW8KlYOrJ
	9gTFvFm7R5Jwct1cHcWQBA03INtCKZ4PAfX8iEIq+kiD43U/UM7eGW8UcjdKKTk5Wfus8yF4N74
	Xv86vwWjhluoIafrHA==
X-Received: by 2002:a17:902:ce88:b0:21f:4b01:b978 with SMTP id d9443c01a7336-22c3597436cmr11166265ad.36.1744784847372;
        Tue, 15 Apr 2025 23:27:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH65SPAk/t8wIySGFu6g6N8vPfjCaLNMJi9CRSCpVVdQZvYfu4SCB2iJn99ol3s5Ctog3UPcQ==
X-Received: by 2002:a17:902:ce88:b0:21f:4b01:b978 with SMTP id d9443c01a7336-22c3597436cmr11166055ad.36.1744784847063;
        Tue, 15 Apr 2025 23:27:27 -0700 (PDT)
Received: from [10.72.120.8] ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33feb339sm6113475ad.257.2025.04.15.23.27.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 23:27:26 -0700 (PDT)
Message-ID: <a2444c8a-7c76-44de-a8e8-4023dbdaeb4b@redhat.com>
Date: Wed, 16 Apr 2025 14:27:21 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] md: cleanup accounting for issued sync IO
To: Yu Kuai <yukuai1@huaweicloud.com>, axboe@kernel.dk, song@kernel.org,
 yukuai3@huawei.com
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-raid@vger.kernel.org, yi.zhang@huawei.com, yangerkun@huawei.com
References: <20250412073202.3085138-1-yukuai1@huaweicloud.com>
 <20250412073202.3085138-5-yukuai1@huaweicloud.com>
From: Xiao Ni <xni@redhat.com>
In-Reply-To: <20250412073202.3085138-5-yukuai1@huaweicloud.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


在 2025/4/12 下午3:32, Yu Kuai 写道:
> From: Yu Kuai <yukuai3@huawei.com>
>
> It's no longer used and can be removed, also remove the field
> 'gendisk->sync_io'.
>
> Signed-off-by: Yu Kuai <yukuai3@huawei.com>
> ---
>   drivers/md/md.h        | 11 -----------
>   drivers/md/raid1.c     |  3 ---
>   drivers/md/raid10.c    |  9 ---------
>   drivers/md/raid5.c     |  8 --------
>   include/linux/blkdev.h |  1 -
>   5 files changed, 32 deletions(-)
>
> diff --git a/drivers/md/md.h b/drivers/md/md.h
> index 95cf11c4abc6..6233ec9f10a3 100644
> --- a/drivers/md/md.h
> +++ b/drivers/md/md.h
> @@ -716,17 +716,6 @@ static inline int mddev_trylock(struct mddev *mddev)
>   }
>   extern void mddev_unlock(struct mddev *mddev);
>   
> -static inline void md_sync_acct(struct block_device *bdev, unsigned long nr_sectors)
> -{
> -	if (blk_queue_io_stat(bdev->bd_disk->queue))
> -		atomic_add(nr_sectors, &bdev->bd_disk->sync_io);
> -}
> -
> -static inline void md_sync_acct_bio(struct bio *bio, unsigned long nr_sectors)
> -{
> -	md_sync_acct(bio->bi_bdev, nr_sectors);
> -}
> -
>   struct md_personality
>   {
>   	struct md_submodule_head head;
> diff --git a/drivers/md/raid1.c b/drivers/md/raid1.c
> index de9bccbe7337..657d481525be 100644
> --- a/drivers/md/raid1.c
> +++ b/drivers/md/raid1.c
> @@ -2382,7 +2382,6 @@ static void sync_request_write(struct mddev *mddev, struct r1bio *r1_bio)
>   
>   		wbio->bi_end_io = end_sync_write;
>   		atomic_inc(&r1_bio->remaining);
> -		md_sync_acct(conf->mirrors[i].rdev->bdev, bio_sectors(wbio));
>   
>   		submit_bio_noacct(wbio);
>   	}
> @@ -3055,7 +3054,6 @@ static sector_t raid1_sync_request(struct mddev *mddev, sector_t sector_nr,
>   			bio = r1_bio->bios[i];
>   			if (bio->bi_end_io == end_sync_read) {
>   				read_targets--;
> -				md_sync_acct_bio(bio, nr_sectors);
>   				if (read_targets == 1)
>   					bio->bi_opf &= ~MD_FAILFAST;
>   				submit_bio_noacct(bio);
> @@ -3064,7 +3062,6 @@ static sector_t raid1_sync_request(struct mddev *mddev, sector_t sector_nr,
>   	} else {
>   		atomic_set(&r1_bio->remaining, 1);
>   		bio = r1_bio->bios[r1_bio->read_disk];
> -		md_sync_acct_bio(bio, nr_sectors);
>   		if (read_targets == 1)
>   			bio->bi_opf &= ~MD_FAILFAST;
>   		submit_bio_noacct(bio);
> diff --git a/drivers/md/raid10.c b/drivers/md/raid10.c
> index ba32bac975b8..dce06bf65016 100644
> --- a/drivers/md/raid10.c
> +++ b/drivers/md/raid10.c
> @@ -2426,7 +2426,6 @@ static void sync_request_write(struct mddev *mddev, struct r10bio *r10_bio)
>   
>   		atomic_inc(&conf->mirrors[d].rdev->nr_pending);
>   		atomic_inc(&r10_bio->remaining);
> -		md_sync_acct(conf->mirrors[d].rdev->bdev, bio_sectors(tbio));
>   
>   		if (test_bit(FailFast, &conf->mirrors[d].rdev->flags))
>   			tbio->bi_opf |= MD_FAILFAST;
> @@ -2448,8 +2447,6 @@ static void sync_request_write(struct mddev *mddev, struct r10bio *r10_bio)
>   			bio_copy_data(tbio, fbio);
>   		d = r10_bio->devs[i].devnum;
>   		atomic_inc(&r10_bio->remaining);
> -		md_sync_acct(conf->mirrors[d].replacement->bdev,
> -			     bio_sectors(tbio));
>   		submit_bio_noacct(tbio);
>   	}
>   
> @@ -2583,13 +2580,10 @@ static void recovery_request_write(struct mddev *mddev, struct r10bio *r10_bio)
>   	d = r10_bio->devs[1].devnum;
>   	if (wbio->bi_end_io) {
>   		atomic_inc(&conf->mirrors[d].rdev->nr_pending);
> -		md_sync_acct(conf->mirrors[d].rdev->bdev, bio_sectors(wbio));
>   		submit_bio_noacct(wbio);
>   	}
>   	if (wbio2) {
>   		atomic_inc(&conf->mirrors[d].replacement->nr_pending);
> -		md_sync_acct(conf->mirrors[d].replacement->bdev,
> -			     bio_sectors(wbio2));
>   		submit_bio_noacct(wbio2);
>   	}
>   }
> @@ -3757,7 +3751,6 @@ static sector_t raid10_sync_request(struct mddev *mddev, sector_t sector_nr,
>   		r10_bio->sectors = nr_sectors;
>   
>   		if (bio->bi_end_io == end_sync_read) {
> -			md_sync_acct_bio(bio, nr_sectors);
>   			bio->bi_status = 0;
>   			submit_bio_noacct(bio);
>   		}
> @@ -4880,7 +4873,6 @@ static sector_t reshape_request(struct mddev *mddev, sector_t sector_nr,
>   	r10_bio->sectors = nr_sectors;
>   
>   	/* Now submit the read */
> -	md_sync_acct_bio(read_bio, r10_bio->sectors);
>   	atomic_inc(&r10_bio->remaining);
>   	read_bio->bi_next = NULL;
>   	submit_bio_noacct(read_bio);
> @@ -4940,7 +4932,6 @@ static void reshape_request_write(struct mddev *mddev, struct r10bio *r10_bio)
>   			continue;
>   
>   		atomic_inc(&rdev->nr_pending);
> -		md_sync_acct_bio(b, r10_bio->sectors);
>   		atomic_inc(&r10_bio->remaining);
>   		b->bi_next = NULL;
>   		submit_bio_noacct(b);
> diff --git a/drivers/md/raid5.c b/drivers/md/raid5.c
> index 6389383166c0..ca5b0e8ba707 100644
> --- a/drivers/md/raid5.c
> +++ b/drivers/md/raid5.c
> @@ -1240,10 +1240,6 @@ static void ops_run_io(struct stripe_head *sh, struct stripe_head_state *s)
>   		}
>   
>   		if (rdev) {
> -			if (s->syncing || s->expanding || s->expanded
> -			    || s->replacing)
> -				md_sync_acct(rdev->bdev, RAID5_STRIPE_SECTORS(conf));
> -
>   			set_bit(STRIPE_IO_STARTED, &sh->state);
>   
>   			bio_init(bi, rdev->bdev, &dev->vec, 1, op | op_flags);
> @@ -1300,10 +1296,6 @@ static void ops_run_io(struct stripe_head *sh, struct stripe_head_state *s)
>   				submit_bio_noacct(bi);
>   		}
>   		if (rrdev) {
> -			if (s->syncing || s->expanding || s->expanded
> -			    || s->replacing)
> -				md_sync_acct(rrdev->bdev, RAID5_STRIPE_SECTORS(conf));
> -
>   			set_bit(STRIPE_IO_STARTED, &sh->state);
>   
>   			bio_init(rbi, rrdev->bdev, &dev->rvec, 1, op | op_flags);
> diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
> index e39c45bc0a97..f3a625b00734 100644
> --- a/include/linux/blkdev.h
> +++ b/include/linux/blkdev.h
> @@ -182,7 +182,6 @@ struct gendisk {
>   	struct list_head slave_bdevs;
>   #endif
>   	struct timer_rand_state *random;
> -	atomic_t sync_io;		/* RAID */
>   	struct disk_events *ev;
>   
>   #ifdef CONFIG_BLK_DEV_ZONED


Looks good to me.

Acked-by: Xiao Ni <xni@redhat.com>

