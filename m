Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F77522D7A7
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 13:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744030977; cv=none; b=VqzAgZLawk6gocVYH3Zm1ZD7FAeciojmeE2BLlwrkAPYEKSQcKSPQ7taRQ7MZNiVwUkxFGSD0HfAL/ThTi1svVZ2j2FUzMpLd58bAF8OZqQBstw7npX4MZZzjRVSjRExUynx3GLNse2LJaRSTo/AGZKqnNePI/u6SthvINlXUVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744030977; c=relaxed/simple;
	bh=4wEfAfpNpyVRT1KG4Jp7NXlVFJTUhte98RFnNHbj9lk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U9pr+SNElbQ1RdtpqBMjzZdQXH8VsW5NOYEzxQWW5sE9JFn6pNP4rZY7CgJkvuhKlKuGQKGWXrI8p9Hlmy3J/gjLompmdrv0CQ+YCtQ/hv+HvzDu67YoT9/09m1vdLlTuVpR8Er6vSZtYtXXQfD77RpCsWF0YFLIWuFnrEAODAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UGrue1fB; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UGrue1fB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744030974;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QN5V11JQJn749B7yJB3Rd7WNs8XT3qNDgGSI4GX9Fqw=;
	b=UGrue1fBXMY4WZv9meHdwJCvShXPLHo6IDBLd02Ox7LNR3o7eqH+HdQHIrXS76lfceQfhZ
	4PLZUCR6wWlblAJMIdXIXjiNHvmHT5MUpofRXJbBw16K3o1HTRejrn1tpVGFNfCBJlxB5h
	Es82VJdGHBXgkyZeI6JD1c476dZRsn0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-156-kIq4na_ZOoCN5IIa4iz_aQ-1; Mon, 07 Apr 2025 09:02:49 -0400
X-MC-Unique: kIq4na_ZOoCN5IIa4iz_aQ-1
X-Mimecast-MFC-AGG-ID: kIq4na_ZOoCN5IIa4iz_aQ_1744030969
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43d3b211d0eso26420975e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 06:02:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744030968; x=1744635768;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QN5V11JQJn749B7yJB3Rd7WNs8XT3qNDgGSI4GX9Fqw=;
        b=jMYq2F5tofrBymb+SaSU2VRzYVspCrwa9+3x1+O54Ppc4XYUw/uItHJ9XSmaaJ+ajY
         opevNQb7BXtbsuMgOQ5BZGnzHw90D3J+uT2jvsMPKz0CgEWbFF1awArCiyiIGoTz+pCc
         Dbnn7cVr8Ry7jxNq+wbaVR3zoFabHUO+qITY4+p4CbKsM8srHTIOjB55sajylEET961a
         73Ts8GqERDj+3GZsaM7gHNByUIaQDn8RUMomGbSgz+Gh0RqbRTvT2px6u+NRB+C/Hxfi
         PKWxR332ycu/qvfut/c0NQtr2qR6LfMJUxWVgl5wcBVHByyInXnHu0t6Q0bFOztSGudd
         leNA==
X-Forwarded-Encrypted: i=1; AJvYcCVLE1368HOhOxInJfUxlhyCYS1fuEOqrCcCJPVPLAhZ3ZeCsCOpVRbiHrV2WYTYdicohip8uGL9GYqVRPM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjbNxSqnFItSfkMuKAf/zMBPUkSwC8cF1TSy7dy370ntdJJhHf
	uEwR3wkG6LdYoCvmKOPhWsPLptTaoJ+M+orQyTpwkqF8YHB6m+UfpANLT9hnyhvOIRFTbHGHLe1
	YP6d8fAANL9rcHTUqDTYm9ii/gB6JJ43Vf83XgiJtKjYF/7C338/8GrGzjPwsCUSUlrQduA==
X-Gm-Gg: ASbGncsWrZKmr3bFJ3K5xgvrNhhl8COYEmoLXMp5PPUBW21m2/RRmI3WIcE2OoxCpAW
	+wqF0sB9MmUiqSuToCXHg9yUDmo3X47YHWOCHpT5k5sm+UOflYcMHThQsaJXyWozIPvJLXnOslR
	fiS4jYZHmwFvB8Ul9bLDDuvmtM/uahXlNd694GmcUAZhSbkbK+IxuD1tkvG2G8KwE0dg9DyjtPT
	1XMFHm+P2Gn4cE4g4KzaKu94R24s3Pjvzow0PDNDCM2K1044DDbR0LIkHctS2c0d3B2l4G6LHso
	KYqSObeuP3eKVLEMYF4=
X-Received: by 2002:a05:600c:1991:b0:43c:f509:2bbf with SMTP id 5b1f17b1804b1-43ebefb7f50mr167012965e9.15.1744030966646;
        Mon, 07 Apr 2025 06:02:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGLU7pKg+nMPuiI5SurCH5seyxqbkaxqIDvfQwhDA/jiwqcW6EvfKlSq2nokduCEknwmGQoag==
X-Received: by 2002:a05:600c:1991:b0:43c:f509:2bbf with SMTP id 5b1f17b1804b1-43ebefb7f50mr167011895e9.15.1744030965707;
        Mon, 07 Apr 2025 06:02:45 -0700 (PDT)
Received: from [10.40.98.122] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ea8d1673dsm151308495e9.0.2025.04.07.06.02.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Apr 2025 06:02:44 -0700 (PDT)
Message-ID: <c80da442-c35a-4336-9a49-5a6745e4ce6b@redhat.com>
Date: Mon, 7 Apr 2025 15:02:43 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] media: uvcvideo: Rollback non processed entities
 on error
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@kernel.org
References: <20250224-uvc-data-backup-v2-0-de993ed9823b@chromium.org>
 <20250224-uvc-data-backup-v2-3-de993ed9823b@chromium.org>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250224-uvc-data-backup-v2-3-de993ed9823b@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Ricardo,

On 24-Feb-25 11:34, Ricardo Ribalda wrote:
> If we wail to commit an entity, we need to restore the

s/wail/fail/

I've fixed this up while merging this series and
I've pushed the entire series to:
https://gitlab.freedesktop.org/linux-media/users/uvc/ next now.

Note I had to manually fix some conflicts due to the granular power
saving series being merged first. I'm pretty sure I got things correct
but a double check would be appreciated.

Regards,

Hans




> UVC_CTRL_DATA_BACKUP for the other uncommitted entities. Otherwise the
> control cache and the device would be out of sync.
> 
> Cc: stable@kernel.org
> Fixes: b4012002f3a3 ("[media] uvcvideo: Add support for control events")
> Reported-by: Hans de Goede <hdegoede@redhat.com>
> Closes: https://lore.kernel.org/linux-media/fe845e04-9fde-46ee-9763-a6f00867929a@redhat.com/
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 32 ++++++++++++++++++++++----------
>  1 file changed, 22 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 7d074686eef4..89b946151b16 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -1864,7 +1864,7 @@ static int uvc_ctrl_commit_entity(struct uvc_device *dev,
>  	unsigned int processed_ctrls = 0;
>  	struct uvc_control *ctrl;
>  	unsigned int i;
> -	int ret;
> +	int ret = 0;
>  
>  	if (entity == NULL)
>  		return 0;
> @@ -1893,8 +1893,6 @@ static int uvc_ctrl_commit_entity(struct uvc_device *dev,
>  				dev->intfnum, ctrl->info.selector,
>  				uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT),
>  				ctrl->info.size);
> -		else
> -			ret = 0;
>  
>  		if (!ret)
>  			processed_ctrls++;
> @@ -1906,10 +1904,14 @@ static int uvc_ctrl_commit_entity(struct uvc_device *dev,
>  
>  		ctrl->dirty = 0;
>  
> -		if (ret < 0) {
> +		if (ret < 0 && !rollback) {
>  			if (err_ctrl)
>  				*err_ctrl = ctrl;
> -			return ret;
> +			/*
> +			 * If we fail to set a control, we need to rollback
> +			 * the next ones.
> +			 */
> +			rollback = 1;
>  		}
>  
>  		if (!rollback && handle &&
> @@ -1917,6 +1919,9 @@ static int uvc_ctrl_commit_entity(struct uvc_device *dev,
>  			uvc_ctrl_set_handle(handle, ctrl, handle);
>  	}
>  
> +	if (ret)
> +		return ret;
> +
>  	return processed_ctrls;
>  }
>  
> @@ -1947,7 +1952,8 @@ int __uvc_ctrl_commit(struct uvc_fh *handle, int rollback,
>  	struct uvc_video_chain *chain = handle->chain;
>  	struct uvc_control *err_ctrl;
>  	struct uvc_entity *entity;
> -	int ret = 0;
> +	int ret_out = 0;
> +	int ret;
>  
>  	/* Find the control. */
>  	list_for_each_entry(entity, &chain->entities, chain) {
> @@ -1958,17 +1964,23 @@ int __uvc_ctrl_commit(struct uvc_fh *handle, int rollback,
>  				ctrls->error_idx =
>  					uvc_ctrl_find_ctrl_idx(entity, ctrls,
>  							       err_ctrl);
> -			goto done;
> +			/*
> +			 * When we fail to commit an entity, we need to
> +			 * restore the UVC_CTRL_DATA_BACKUP for all the
> +			 * controls in the other entities, otherwise our cache
> +			 * and the hardware will be out of sync.
> +			 */
> +			rollback = 1;
> +
> +			ret_out = ret;
>  		} else if (ret > 0 && !rollback) {
>  			uvc_ctrl_send_events(handle, entity,
>  					     ctrls->controls, ctrls->count);
>  		}
>  	}
>  
> -	ret = 0;
> -done:
>  	mutex_unlock(&chain->ctrl_mutex);
> -	return ret;
> +	return ret_out;
>  }
>  
>  int uvc_ctrl_get(struct uvc_video_chain *chain,
> 

