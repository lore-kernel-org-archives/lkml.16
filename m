Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 111A520011B
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 20:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743712776; cv=none; b=tvmFwEPBvpuJiNGRIlyqLkj3FGY6dSXKwGJ35UjvBiZHJxjmYcRGx0mIlw+/KPkseML+pIXSt81iyW/0jf9TSk+ogi1StYZ35E1stvRKVghwSZzMKqV/3YLc5VWuAF9oEHJcfKwsKTpIW3tVWYuzjBvYQ4m5nE1mQBIzGAYsy+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743712776; c=relaxed/simple;
	bh=EShZpaMpcKMcXMarqyk0Jqf+GJAYVMRBIxLLbquNCms=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sWSUsSqrznJ8xUjKVXBalFp0Oyu0oNn+dj7fFdANRf8EJnRBmUFWOt9+9mU/aAZ6CxzJHmL6degJaklLqTtJmjzXulJ+7LOBpW+zrtE1B6Yhy3kg+H5u1D4pHjHVEVrEU4TxMszgVrIsJVvVzbnHciWpeVBvHVVdLtDzdjAwO90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BXmOX4GN; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BXmOX4GN"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-47666573242so118221cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 13:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743712773; x=1744317573; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9gzKoe90ZfM4o/7GbmHUnknhoKPfawda3x0icnfdTpk=;
        b=BXmOX4GNXGzFlPmDJmbFheub7HoZ8AOjIicnpZP9K+UprE0hFPephudU3B1sl5m+PO
         f1OfwLE3Rcp0OE/p8SZ04R9GBBvRo83zEZbrR6We2gYRfv6X9jDp6Gd2vNVgCiTf538w
         T7DFP6O//iuxS7tOY39a0nLNyBTsvez/RLW3+upscCw8u6+qPbfLhYzJX147hohsxcBs
         QS9oftqT9iSEsLZV8b/XpUvuQuSFO77vP3FW0YAdKEKrw/APu/KN4qNPBbSTJwtA5aWW
         WKKy+V8DDynM1XBt7WJqRBYAe9g/0j4h+pf93mCftbjb0dUmtBa6iDq91YGeZbRfltEB
         b/zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743712773; x=1744317573;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9gzKoe90ZfM4o/7GbmHUnknhoKPfawda3x0icnfdTpk=;
        b=ii1B0gkSoVmT2rBr9xMf4SVzeU3CF9x8Rhfnp4oxgTvMasKWrvNJc04OzW6iGHFgjn
         8C3WOPBK0f8BZXPC/ghp/A6/tB4UmWgZ0dRA57AC1Xa4d2wcURkS3MJv754kz64d6unY
         grifVLBCqlKAttY3WPJvUd04OCVZg8Oxl4S/jhrRM/99LCYFte/BGjVgAEQvCUt4+blj
         KVT7JBkEqVBck+QCUjrOB7MXrY7niZK2ENKWhTi9vJgIT6NWD/g/czfcWt2DSDepxTFp
         YDT6j6twCIqLywakZcZSIIHbNCrzMwzSwZt7LN9QIgHvebwnH6MJpzXMVSefOnm4mgOx
         kAEQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMJ1KgZcZR+OeQ5hWIHJX67/GgTp82Q/Mp4z1CrU10yXr8pFJR+GEe8Pc5veo+RT8tsGlcuPAZAC/vybE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9potF+YXF6RM5mnuhvzkrJNPjBv3x6rC+RBnx9ay3FpQn+IkS
	Xv/ADg9VHBgWHYp3DVERybQNHvaLntI7CIOH+67HCr9DADEjXASNnJjg8LRE6A==
X-Gm-Gg: ASbGnctLjtd+mqrfjz8nSdayrcNr++h5g0GcSH7QlttUfE3cqF5dj/7zT2XA4Ma9Y2Y
	c2lMRUDYd0MDgSzSkZ8D4GPDmf6+XZNR6i4WyibyLqB+049JxYoSv/HgBgwqQglFxV51tKj3yvd
	KXwfqBL6IKkkqrsFdnwaWEMUk4kxgq9Kq8MbknwkB7Lgmf7lw3hx5ndoYvTWmefb7GLren1jRyr
	cZB3q1mxElu56CEeytmIUzqOvPbDlCCl5o3hmkqjEZoKF50sD7hKfub12qT36WhkweWaBPeB2qM
	wBn0ecjERcROtmX2wh27dL6oNcIpYpA6/mZ/Q4bduospWtCsAa1XTP7In5h3HzRLkhEz4fDwpFE
	VdvU=
X-Google-Smtp-Source: AGHT+IHNyJ7vs36NQlUP+/ypTWRilwDQLm735Q4Rad62mUsm20rDamhxTRr00Zy4tOacBCXmKpd0yA==
X-Received: by 2002:ac8:59c3:0:b0:476:77be:9102 with SMTP id d75a77b69052e-47926715486mr32371cf.7.1743712772527;
        Thu, 03 Apr 2025 13:39:32 -0700 (PDT)
Received: from google.com (154.75.48.34.bc.googleusercontent.com. [34.48.75.154])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4791b071b86sm12031601cf.28.2025.04.03.13.39.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 13:39:32 -0700 (PDT)
Date: Thu, 3 Apr 2025 20:39:29 +0000
From: Brian Geffon <bgeffon@google.com>
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Richard Chang <richardycc@google.com>,
	Minchan Kim <minchan@kernel.org>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, sawlani@google.com
Subject: Re: [PATCHv2] zram: modernize writeback interface
Message-ID: <Z-7yAWG3IE7dnOKi@google.com>
References: <20250327015818.4148660-1-senozhatsky@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250327015818.4148660-1-senozhatsky@chromium.org>

On Thu, Mar 27, 2025 at 10:58:09AM +0900, Sergey Senozhatsky wrote:
> The writeback interface supports a page_index=N parameter which
> performs writeback of the given page.  Since we rarely need to
> writeback just one single page, the typical use case involves
> a number of writeback calls, each performing writeback of one
> page:
> 
>   echo page_index=100 > zram0/writeback
>   ...
>   echo page_index=200 > zram0/writeback
>   echo page_index=500 > zram0/writeback
>   ...
>   echo page_index=700 > zram0/writeback
> 
> One obvious downside of this is that it increases the number of
> syscalls.  Less obvious, but a significantly more important downside,
> is that when given only one page to post-process zram cannot perform
> an optimal target selection.  This becomes a critical limitation
> when writeback_limit is enabled, because under writeback_limit we
> want to guarantee the highest memory savings hence we first need
> to writeback pages that release the highest amount of zsmalloc pool
> memory.
> 
> This patch adds page_indexes=LOW-HIGH parameter to the writeback
> interface:
> 
>   echo page_indexes=100-200 page_indexes=500-700 > zram0/writeback
> 
> This gives zram a chance to apply an optimal target selection
> strategy on each iteration of the writeback loop.
> 
> We also now permit multiple page_index parameters per call (previously
> zram would recognize only one page_index) and a mix or single pages and
> page ranges:
> 
>   echo page_index=42 page_index=99 page_indexes=100-200 \
>        page_indexes=500-700 > zram0/writeback
> 
> Apart from that the patch also unifies parameters passing and resembles
> other "modern" zram device attributes (e.g. recompression), while the
> old interface used a mixed scheme: values-less parameters for mode and
> a key=value format for page_index.  We still support the "old" value-less
> format for compatibility reasons.
> 
> Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>

Reviewed-by: Brian Geffon <bgeffon@google.com>

> ---
>  Documentation/admin-guide/blockdev/zram.rst |  17 ++
>  drivers/block/zram/zram_drv.c               | 320 +++++++++++++-------
>  2 files changed, 232 insertions(+), 105 deletions(-)
> 
> diff --git a/Documentation/admin-guide/blockdev/zram.rst b/Documentation/admin-guide/blockdev/zram.rst
> index 9bdb30901a93..b8d36134a151 100644
> --- a/Documentation/admin-guide/blockdev/zram.rst
> +++ b/Documentation/admin-guide/blockdev/zram.rst
> @@ -369,6 +369,23 @@ they could write a page index into the interface::
>  
>  	echo "page_index=1251" > /sys/block/zramX/writeback
>  
> +In Linux 6.16 this interface underwent some rework.  First, the interface
> +now supports `key=value` format for all of its parameters (`type=huge_idle`,
> +etc.)  Second, the support for `page_indexes` was introduced, which specify
> +`LOW-HIGH` range (or ranges) of pages to be written-back.  This reduces the
> +number of syscalls, but more importantly this enables optimal post-processing
> +target selection strategy. Usage example::
> +
> +	echo "type=idle" > /sys/block/zramX/writeback
> +	echo "page_indexes=1-100 page_indexes=200-300" > \
> +		/sys/block/zramX/writeback
> +
> +We also now permit multiple page_index params per call and a mix of
> +single pages and page ranges::
> +
> +	echo page_index=42 page_index=99 page_indexes=100-200 \
> +		page_indexes=500-700 > /sys/block/zramX/writeback
> +

This new interface will be very useful, thanks for adding it Sergey!

>  If there are lots of write IO with flash device, potentially, it has
>  flash wearout problem so that admin needs to design write limitation
>  to guarantee storage health for entire product life.
> diff --git a/drivers/block/zram/zram_drv.c b/drivers/block/zram/zram_drv.c
> index fda7d8624889..9e8ed1bf308b 100644
> --- a/drivers/block/zram/zram_drv.c
> +++ b/drivers/block/zram/zram_drv.c
> @@ -734,114 +734,19 @@ static void read_from_bdev_async(struct zram *zram, struct page *page,
>  	submit_bio(bio);
>  }
>  
> -#define PAGE_WB_SIG "page_index="
> -
> -#define PAGE_WRITEBACK			0
> -#define HUGE_WRITEBACK			(1<<0)
> -#define IDLE_WRITEBACK			(1<<1)
> -#define INCOMPRESSIBLE_WRITEBACK	(1<<2)
> -
> -static int scan_slots_for_writeback(struct zram *zram, u32 mode,
> -				    unsigned long nr_pages,
> -				    unsigned long index,
> -				    struct zram_pp_ctl *ctl)
> +static int zram_writeback_slots(struct zram *zram, struct zram_pp_ctl *ctl)
>  {
> -	for (; nr_pages != 0; index++, nr_pages--) {
> -		bool ok = true;
> -
> -		zram_slot_lock(zram, index);
> -		if (!zram_allocated(zram, index))
> -			goto next;
> -
> -		if (zram_test_flag(zram, index, ZRAM_WB) ||
> -		    zram_test_flag(zram, index, ZRAM_SAME))
> -			goto next;
> -
> -		if (mode & IDLE_WRITEBACK &&
> -		    !zram_test_flag(zram, index, ZRAM_IDLE))
> -			goto next;
> -		if (mode & HUGE_WRITEBACK &&
> -		    !zram_test_flag(zram, index, ZRAM_HUGE))
> -			goto next;
> -		if (mode & INCOMPRESSIBLE_WRITEBACK &&
> -		    !zram_test_flag(zram, index, ZRAM_INCOMPRESSIBLE))
> -			goto next;
> -
> -		ok = place_pp_slot(zram, ctl, index);
> -next:
> -		zram_slot_unlock(zram, index);
> -		if (!ok)
> -			break;
> -	}
> -
> -	return 0;
> -}
> -
> -static ssize_t writeback_store(struct device *dev,
> -		struct device_attribute *attr, const char *buf, size_t len)
> -{
> -	struct zram *zram = dev_to_zram(dev);
> -	unsigned long nr_pages = zram->disksize >> PAGE_SHIFT;
> -	struct zram_pp_ctl *ctl = NULL;
> +	unsigned long blk_idx = 0;
> +	struct page *page = NULL;
>  	struct zram_pp_slot *pps;
> -	unsigned long index = 0;
> -	struct bio bio;
>  	struct bio_vec bio_vec;
> -	struct page *page = NULL;
> -	ssize_t ret = len;
> -	int mode, err;
> -	unsigned long blk_idx = 0;
> -
> -	if (sysfs_streq(buf, "idle"))
> -		mode = IDLE_WRITEBACK;
> -	else if (sysfs_streq(buf, "huge"))
> -		mode = HUGE_WRITEBACK;
> -	else if (sysfs_streq(buf, "huge_idle"))
> -		mode = IDLE_WRITEBACK | HUGE_WRITEBACK;
> -	else if (sysfs_streq(buf, "incompressible"))
> -		mode = INCOMPRESSIBLE_WRITEBACK;
> -	else {
> -		if (strncmp(buf, PAGE_WB_SIG, sizeof(PAGE_WB_SIG) - 1))
> -			return -EINVAL;
> -
> -		if (kstrtol(buf + sizeof(PAGE_WB_SIG) - 1, 10, &index) ||
> -				index >= nr_pages)
> -			return -EINVAL;
> -
> -		nr_pages = 1;
> -		mode = PAGE_WRITEBACK;
> -	}
> -
> -	down_read(&zram->init_lock);
> -	if (!init_done(zram)) {
> -		ret = -EINVAL;
> -		goto release_init_lock;
> -	}
> -
> -	/* Do not permit concurrent post-processing actions. */
> -	if (atomic_xchg(&zram->pp_in_progress, 1)) {
> -		up_read(&zram->init_lock);
> -		return -EAGAIN;
> -	}
> -
> -	if (!zram->backing_dev) {
> -		ret = -ENODEV;
> -		goto release_init_lock;
> -	}
> +	struct bio bio;
> +	int ret, err;
> +	u32 index;
>  
>  	page = alloc_page(GFP_KERNEL);
> -	if (!page) {
> -		ret = -ENOMEM;
> -		goto release_init_lock;
> -	}
> -
> -	ctl = init_pp_ctl();
> -	if (!ctl) {
> -		ret = -ENOMEM;
> -		goto release_init_lock;
> -	}
> -
> -	scan_slots_for_writeback(zram, mode, nr_pages, index, ctl);
> +	if (!page)
> +		return -ENOMEM;
>  
>  	while ((pps = select_pp_slot(ctl))) {
>  		spin_lock(&zram->wb_limit_lock);
> @@ -929,10 +834,215 @@ static ssize_t writeback_store(struct device *dev,
>  
>  	if (blk_idx)
>  		free_block_bdev(zram, blk_idx);
> -
> -release_init_lock:
>  	if (page)
>  		__free_page(page);
> +
> +	return ret;
> +}
> +
> +#define PAGE_WRITEBACK			0
> +#define HUGE_WRITEBACK			(1 << 0)
> +#define IDLE_WRITEBACK			(1 << 1)
> +#define INCOMPRESSIBLE_WRITEBACK	(1 << 2)
> +
> +static int parse_page_index(char *val, unsigned long nr_pages,
> +			    unsigned long *lo, unsigned long *hi)
> +{
> +	int ret;
> +
> +	ret = kstrtoul(val, 10, lo);
> +	if (ret)
> +		return ret;
> +	*hi = *lo + 1;
> +	if (*lo >= nr_pages || *hi > nr_pages)

I think you can do just:
if (*lo >= nr_pages)

The *hi > nr_pages check seems superfluous given the
assignment directly above this.

> +		return -ERANGE;
> +	return 0;
> +}
> +
> +static int parse_page_indexes(char *val, unsigned long nr_pages,
> +			      unsigned long *lo, unsigned long *hi)
> +{
> +	char *delim;
> +	int ret;
> +
> +	delim = strchr(val, '-');
> +	if (!delim)
> +		return -EINVAL;
> +
> +	*delim = 0x00;
> +	ret = kstrtoul(val, 10, lo);
> +	if (ret)
> +		return ret;
> +	if (*lo >= nr_pages)
> +		return -ERANGE;
> +
> +	ret = kstrtoul(delim + 1, 10, hi);
> +	if (ret)
> +		return ret;
> +	if (*hi >= nr_pages || *lo > *hi)
> +		return -ERANGE;
> +	*hi += 1;
> +	return 0;
> +}
> +
> +static int parse_mode(char *val, u32 *mode)
> +{
> +	*mode = 0;
> +
> +	if (!strcmp(val, "idle"))
> +		*mode = IDLE_WRITEBACK;
> +	if (!strcmp(val, "huge"))
> +		*mode = HUGE_WRITEBACK;
> +	if (!strcmp(val, "huge_idle"))
> +		*mode = IDLE_WRITEBACK | HUGE_WRITEBACK;
> +	if (!strcmp(val, "incompressible"))
> +		*mode = INCOMPRESSIBLE_WRITEBACK;
> +
> +	if (*mode == 0)
> +		return -EINVAL;
> +	return 0;
> +}
> +
> +static int scan_slots_for_writeback(struct zram *zram, u32 mode,
> +				    unsigned long lo, unsigned long hi,
> +				    struct zram_pp_ctl *ctl)
> +{
> +	u32 index = lo;
> +
> +	while (index < hi) {
> +		bool ok = true;
> +
> +		zram_slot_lock(zram, index);
> +		if (!zram_allocated(zram, index))
> +			goto next;
> +
> +		if (zram_test_flag(zram, index, ZRAM_WB) ||
> +		    zram_test_flag(zram, index, ZRAM_SAME))
> +			goto next;
> +
> +		if (mode & IDLE_WRITEBACK &&
> +		    !zram_test_flag(zram, index, ZRAM_IDLE))
> +			goto next;
> +		if (mode & HUGE_WRITEBACK &&
> +		    !zram_test_flag(zram, index, ZRAM_HUGE))
> +			goto next;
> +		if (mode & INCOMPRESSIBLE_WRITEBACK &&
> +		    !zram_test_flag(zram, index, ZRAM_INCOMPRESSIBLE))
> +			goto next;
> +
> +		ok = place_pp_slot(zram, ctl, index);
> +next:
> +		zram_slot_unlock(zram, index);
> +		if (!ok)
> +			break;
> +		index++;
> +	}
> +
> +	return 0;
> +}
> +
> +static ssize_t writeback_store(struct device *dev,
> +			       struct device_attribute *attr,
> +			       const char *buf, size_t len)
> +{
> +	struct zram *zram = dev_to_zram(dev);
> +	u64 nr_pages = zram->disksize >> PAGE_SHIFT;
> +	unsigned long lo = 0, hi = nr_pages;
> +	struct zram_pp_ctl *ctl = NULL;
> +	char *args, *param, *val;
> +	ssize_t ret = len;
> +	int err, mode = 0;
> +
> +	down_read(&zram->init_lock);
> +	if (!init_done(zram)) {
> +		up_read(&zram->init_lock);
> +		return -EINVAL;
> +	}
> +
> +	/* Do not permit concurrent post-processing actions. */
> +	if (atomic_xchg(&zram->pp_in_progress, 1)) {
> +		up_read(&zram->init_lock);
> +		return -EAGAIN;
> +	}
> +
> +	if (!zram->backing_dev) {
> +		ret = -ENODEV;
> +		goto release_init_lock;
> +	}
> +
> +	ctl = init_pp_ctl();
> +	if (!ctl) {
> +		ret = -ENOMEM;
> +		goto release_init_lock;
> +	}
> +
> +	args = skip_spaces(buf);
> +	while (*args) {
> +		args = next_arg(args, &param, &val);
> +
> +		/*
> +		 * Workaround to support the old writeback interface.
> +		 *
> +		 * The old writeback interface has a minor inconsistency and
> +		 * requires key=value only for page_index parameter, while the
> +		 * writeback mode is a valueless parameter.
> +		 *
> +		 * This is not the case anymore and now all parameters are
> +		 * required to have values, however, we need to support the
> +		 * legacy writeback interface format so we check if we can
> +		 * recognize a valueless parameter as the (legacy) writeback
> +		 * mode.
> +		 */
> +		if (!val || !*val) {
> +			err = parse_mode(param, &mode);
> +			if (err) {
> +				ret = err;
> +				goto release_init_lock;
> +			}
> +
> +			scan_slots_for_writeback(zram, mode, lo, hi, ctl);
> +			break;
> +		}
> +
> +		if (!strcmp(param, "type")) {
> +			err = parse_mode(val, &mode);
> +			if (err) {
> +				ret = err;
> +				goto release_init_lock;
> +			}
> +
> +			scan_slots_for_writeback(zram, mode, lo, hi, ctl);
> +			break;
> +		}
> +
> +		if (!strcmp(param, "page_index")) {
> +			err = parse_page_index(val, nr_pages, &lo, &hi);
> +			if (err) {
> +				ret = err;
> +				goto release_init_lock;
> +			}
> +
> +			scan_slots_for_writeback(zram, mode, lo, hi, ctl);
> +			continue;
> +		}
> +
> +		if (!strcmp(param, "page_indexes")) {
> +			err = parse_page_indexes(val, nr_pages, &lo, &hi);
> +			if (err) {
> +				ret = err;
> +				goto release_init_lock;
> +			}
> +
> +			scan_slots_for_writeback(zram, mode, lo, hi, ctl);
> +			continue;
> +		}
> +	}
> +
> +	err = zram_writeback_slots(zram, ctl);
> +	if (err)
> +		ret = err;
> +
> +release_init_lock:
>  	release_pp_ctl(zram, ctl);
>  	atomic_set(&zram->pp_in_progress, 0);
>  	up_read(&zram->init_lock);
> -- 
> 2.49.0.395.g12beb8f557-goog
> 
