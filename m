Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94B415661
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 02:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751249700; cv=none; b=EuZbR9TqpBGcoXkCRg0iWISNPCDksJmSiuVeXS0aYKSy1yqS+043wiAuflZbCuQb0lMisBm7lP7s+1SIVVz5fP1VvmzEdZPUhQi45p46QKwcClVLNu/q/460kW+4gmS8bLm8qq/aJJFxejWu634c5mjDfjCSEsC/GqFLnQ0jYtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751249700; c=relaxed/simple;
	bh=2KoBE1QB7mRTAs5ECLw60gzYqVreQbPGQTrd4hrxh7s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GusL2/QMkoqpyeHcPV11rmBQr8Gwc//14cqKyVZAfxFXsjd9kGRpJ99rSRh+YrGa4f8zjuRD3pORts8vcaK48DO3XMCq24OAb4VDMGQm54cN2JuKkPLZaDlpvSFf8x/zsRC38i34YD0MJWUkULvDGQdu1k+z4m+E3EgkQEs+MyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=inZ8A3e+; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="inZ8A3e+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751249697;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wNJ+u7SJcGRviylYQXB2XQ5rM1G8Fa8LeI/dxuZO8A0=;
	b=inZ8A3e+sP5mkdIN4eeIYkPW3CEE8g6bcc+hMkVxBtpcX0d9BnpMOz7KaNEhYRtIXizLkv
	OaH6ozuhof30xapu7nCB6LIgnZFXxwA4NCakM168bhhPFljrHVhar5X+34KTOpDClR/gTd
	o+biZlLm6j/6Yk3xSxrpIEfgKVHMh0s=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-627-KPB3ktZ0OSW-7Hg3inxM6A-1; Sun, 29 Jun 2025 22:14:56 -0400
X-MC-Unique: KPB3ktZ0OSW-7Hg3inxM6A-1
X-Mimecast-MFC-AGG-ID: KPB3ktZ0OSW-7Hg3inxM6A_1751249695
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-31315427249so3391107a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 19:14:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751249695; x=1751854495;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wNJ+u7SJcGRviylYQXB2XQ5rM1G8Fa8LeI/dxuZO8A0=;
        b=MTl/4VejL520mIca8dAbqhYDwwZc/2C7qzlSVNyECyw7mURa7hnTGAj4lVe1E72Lp/
         uanTjDWfLNlF5Kf2UZmDYZBV97LV1LEWB9qMa94IxIvI7BKUj4PTchHQ8ld9AK9n8b/Q
         chsucaNviLqy50x6W1A3B82X44n6KKwtBRO/e0laHSc7WtpkcjTOVfoC6fLntZv9EjGx
         gzZPRpcAFOI0u23sWNR0/8m/UwSnp0dRIYc+R7KM/ukcDLCUslX8Ex1mh1DkfkGh20IH
         gZdehIW89kyKIf75Nb/d9lb1gSLpTAIVaDbxkEEJ89U2QDB34WcRUOTkYAw5/J2c2tfQ
         pMAA==
X-Forwarded-Encrypted: i=1; AJvYcCU8eqCmkDSL8j1lc2/fdjYOWQwmHfiJiRkgXAiluHKqDzPS0Kmv2P99eaRUDp7XEnO/Ps9T+98PTvmT7ro=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7okLdZO+eAvdEyJwEuDogLb6i6HbapLclJR0M2jPZYmXQlk2w
	uKuW12KD3dCTcxnudUjYBtTi2uCN936GrG83jTPuGJshpmBoBiMJo98p/ag1AU6MVu2rhnzpTVb
	xcbkQwSWeXIuxb2vXMu725pDUfJYZ3KEEme6DGBZWXqQLWh3ljF+gZwZ7PQSEsi9xqw==
X-Gm-Gg: ASbGncsujcG6l7S7znxD7dSJD8nxdM4UwDjPe4UYXcdPZ6oDvOb5ZdpZRQEIzIXEcCe
	Q3CulxBYX2+j+Hx11Ilh5Cchb4HoeBaIl9lTnrJFBUcSK7i1U3Sm9YRBXdDCZA1Y8VCednwCmIT
	PDtauOW6TRFEnbz7p0tMC3WQkTylS9iWm9Pcnc/UK4+tixAKByd3bBtX5QKNorXFVBbMrQoVl3b
	lnDFNQpSNQ3ExV9V+KekGATxV7RJ+AMdpc5jsoAJ8l9IYsw4eKUmNLNo/rudNYuZXOvGA0U1/iV
	rlaAfcTLDUfZ9k2T5D2BQFkAV/3zOQ==
X-Received: by 2002:a17:90b:2e0f:b0:313:bdbf:36c0 with SMTP id 98e67ed59e1d1-318c8cd2734mr19806780a91.0.1751249694932;
        Sun, 29 Jun 2025 19:14:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGCPlcpfQFTq/V6/gHThqQ9N4NTZ23eiYFz7gK1DAsMxkjeEIG9Lrvn+uquEaPWJf0Aq93UgQ==
X-Received: by 2002:a17:90b:2e0f:b0:313:bdbf:36c0 with SMTP id 98e67ed59e1d1-318c8cd2734mr19806747a91.0.1751249694486;
        Sun, 29 Jun 2025 19:14:54 -0700 (PDT)
Received: from [10.72.120.15] ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-318c139210bsm7911126a91.5.2025.06.29.19.14.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Jun 2025 19:14:53 -0700 (PDT)
Message-ID: <c76f44c0-fc61-41da-a16b-5a3510141487@redhat.com>
Date: Mon, 30 Jun 2025 10:14:47 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/23] md/md-llbitmap: implement bit state machine
To: Yu Kuai <yukuai1@huaweicloud.com>, hch@lst.de, colyli@kernel.org,
 song@kernel.org, yukuai3@huawei.com
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-raid@vger.kernel.org, yi.zhang@huawei.com, yangerkun@huawei.com,
 johnny.chenyi@huawei.com
References: <20250524061320.370630-1-yukuai1@huaweicloud.com>
 <20250524061320.370630-17-yukuai1@huaweicloud.com>
From: Xiao Ni <xni@redhat.com>
In-Reply-To: <20250524061320.370630-17-yukuai1@huaweicloud.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


在 2025/5/24 下午2:13, Yu Kuai 写道:
> From: Yu Kuai <yukuai3@huawei.com>
>
> Each bit is one byte, contain 6 difference state, see llbitmap_state. And
> there are total 8 differenct actions, see llbitmap_action, can change
> state:
>
> llbitmap state machine: transitions between states
>
> |           | Startwrite | Startsync | Endsync | Abortsync| Reload   | Daemon | Discard   | Stale     |
> | --------- | ---------- | --------- | ------- | -------  | -------- | ------ | --------- | --------- |
> | Unwritten | Dirty      | x         | x       | x        | x        | x      | x         | x         |
> | Clean     | Dirty      | x         | x       | x        | x        | x      | Unwritten | NeedSync  |
> | Dirty     | x          | x         | x       | x        | NeedSync | Clean  | Unwritten | NeedSync  |
> | NeedSync  | x          | Syncing   | x       | x        | x        | x      | Unwritten | x         |
> | Syncing   | x          | Syncing   | Dirty   | NeedSync | NeedSync | x      | Unwritten | NeedSync  |
>
> Typical scenarios:
>
> 1) Create new array
> All bits will be set to Unwritten by default, if --assume-clean is set,
> All bits will be set to Clean instead.
>
> 2) write data, raid1/raid10 have full copy of data, while raid456 donen't and
> rely on xor data
>
> 2.1) write new data to raid1/raid10:
> Unwritten --StartWrite--> Dirty
>
> 2.2) write new data to raid456:
> Unwritten --StartWrite--> NeedSync
>
> Because the initial recover for raid456 is skipped, the xor data is not build
> yet, the bit must set to NeedSync first and after lazy initial recover is
> finished, the bit will finially set to Dirty(see 5.1 and 5.4);
>
> 2.3) cover write
> Clean --StartWrite--> Dirty
>
> 3) daemon, if the array is not degraded:
> Dirty --Daemon--> Clean
>
> For degraded array, the Dirty bit will never be cleared, prevent full disk
> recovery while readding a removed disk.
>
> 4) discard
> {Clean, Dirty, NeedSync, Syncing} --Discard--> Unwritten
>
> 5) resync and recover
>
> 5.1) common process
> NeedSync --Startsync--> Syncing --Endsync--> Dirty --Daemon--> Clean
>
> 5.2) resync after power failure
> Dirty --Reload--> NeedSync
>
> 5.3) recover while replacing with a new disk
> By default, the old bitmap framework will recover all data, and llbitmap
> implement this by a new helper llbitmap_skip_sync_blocks:
>
> skip recover for bits other than dirty or clean;
>
> 5.4) lazy initial recover for raid5:
> By default, the old bitmap framework will only allow new recover when there
> are spares(new disk), a new recovery flag MD_RECOVERY_LAZY_RECOVER is add
> to perform raid456 lazy recover for set bits(from 2.2).
>
> Signed-off-by: Yu Kuai <yukuai3@huawei.com>
> ---
>   drivers/md/md-llbitmap.c | 83 ++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 83 insertions(+)
>
> diff --git a/drivers/md/md-llbitmap.c b/drivers/md/md-llbitmap.c
> index 1a01b6777527..f782f092ab5d 100644
> --- a/drivers/md/md-llbitmap.c
> +++ b/drivers/md/md-llbitmap.c
> @@ -568,4 +568,87 @@ static int llbitmap_cache_pages(struct llbitmap *llbitmap)
>   	return 0;
>   }
>   
> +static void llbitmap_init_state(struct llbitmap *llbitmap)
> +{
> +	enum llbitmap_state state = BitUnwritten;
> +	unsigned long i;
> +
> +	if (test_and_clear_bit(BITMAP_CLEAN, &llbitmap->flags))
> +		state = BitClean;
> +
> +	for (i = 0; i < llbitmap->chunks; i++)
> +		llbitmap_write(llbitmap, state, i);
> +}
> +
> +/* The return value is only used from resync, where @start == @end. */
> +static enum llbitmap_state llbitmap_state_machine(struct llbitmap *llbitmap,
> +						  unsigned long start,
> +						  unsigned long end,
> +						  enum llbitmap_action action)
> +{
> +	struct mddev *mddev = llbitmap->mddev;
> +	enum llbitmap_state state = BitNone;
> +	bool need_resync = false;
> +	bool need_recovery = false;
> +
> +	if (test_bit(BITMAP_WRITE_ERROR, &llbitmap->flags))
> +		return BitNone;
> +
> +	if (action == BitmapActionInit) {
> +		llbitmap_init_state(llbitmap);
> +		return BitNone;
> +	}
> +
> +	while (start <= end) {
> +		enum llbitmap_state c = llbitmap_read(llbitmap, start);
> +
> +		if (c < 0 || c >= nr_llbitmap_state) {
> +			pr_err("%s: invalid bit %lu state %d action %d, forcing resync\n",
> +			       __func__, start, c, action);
> +			state = BitNeedSync;
> +			goto write_bitmap;
> +		}
> +
> +		if (c == BitNeedSync)
> +			need_resync = true;
> +
> +		state = state_machine[c][action];
> +		if (state == BitNone) {
> +			start++;
> +			continue;
> +		}

For reload action, it runs continue here.

And doesn't it need a lock when reading the state?

> +
> +write_bitmap:
> +		/* Delay raid456 initial recovery to first write. */
> +		if (c == BitUnwritten && state == BitDirty &&
> +		    action == BitmapActionStartwrite && raid_is_456(mddev)) {
> +			state = BitNeedSync;
> +			need_recovery = true;
> +		}
> +
> +		llbitmap_write(llbitmap, state, start);

Same question here, doesn't it need a lock when writing bitmap bits?

Regards

Xiao

> +
> +		if (state == BitNeedSync)
> +			need_resync = true;
> +		else if (state == BitDirty &&
> +			 !timer_pending(&llbitmap->pending_timer))
> +			mod_timer(&llbitmap->pending_timer,
> +				  jiffies + mddev->bitmap_info.daemon_sleep * HZ);
> +
> +		start++;
> +	}
> +
> +	if (need_recovery) {
> +		set_bit(MD_RECOVERY_NEEDED, &mddev->recovery);
> +		set_bit(MD_RECOVERY_LAZY_RECOVER, &mddev->recovery);
> +		md_wakeup_thread(mddev->thread);
> +	} else if (need_resync) {
> +		set_bit(MD_RECOVERY_NEEDED, &mddev->recovery);
> +		set_bit(MD_RECOVERY_SYNC, &mddev->recovery);
> +		md_wakeup_thread(mddev->thread);
> +	}
> +
> +	return state;
> +}
> +
>   #endif /* CONFIG_MD_LLBITMAP */

