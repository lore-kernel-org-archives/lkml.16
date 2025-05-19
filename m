Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 591401FAA
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 03:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747627140; cv=none; b=lgm/Ub3FzEc6zcOr4+DYozIob7q5eLbmeT0kDnNEnYdgTbkjpTrjYNxVEAKvJwvRdC9//fWTm3ukORFar/WJ4dCqhXmbZa2iFOrIkRQUg3b5iRXHVdCk7J5EwQxD9ymnaXUL6HnmP5WPAg6MRYgh2DzxsEbpvO8pqUYKDZZYmb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747627140; c=relaxed/simple;
	bh=W02+nxHxqA3ZusFK/xVMg3wNd35f1JT4coL0rPnFNIg=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ggqGTNkS6EJ2pxT9gw6PEHSXBxDIqsyHCETcPqd9gQKaPYb9GB4TY8BmYpXAsjkBS3qQEDqnWuHqBznVkk4fVuU3JjLlZ4yZiZzW0tHoHRASG53z+2sAAZxM9vLskUQ1AVEtD2S1Xg/97AVEe+P7MHlH6KeOvZs5plVa9dnskAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fZP8+Oee; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fZP8+Oee"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-30e8daea8c6so1904694a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 20:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747627138; x=1748231938; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Jkk4NMafQXIS7Y0gvgk+dRyrvshPt3WFYQPSP11ctnA=;
        b=fZP8+OeepJCFLmv2FUnQblOQFNZh1ZC7uFmScnzCvzlUME2ubr1M3lDG7gjtn4on+i
         n9OAtHwIf1F8FhCh3Hn5cvcpnaQURrpyqlrVRRhaX78jEHxATXCt4gP0bBqEQ+gMY4ha
         v50Gw77tZ61PqImNEkL5VuVZf+1Nwj62B1awXeae307fo8OlDNa9HB91StY2vSpoHzHz
         QVNGaUHnerFHKCeXYjLiMau1hcBQpC+N92RO6R6Kf922LB8nRv0fpTW8UxlsR8q0pT8o
         WjwcZg319UeEh/Z1LD9gmSZNWmP7bzjhPQaeJnR+ZF8S5AyQFC1yuaCSJuLVZIqUfovj
         n9Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747627138; x=1748231938;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Jkk4NMafQXIS7Y0gvgk+dRyrvshPt3WFYQPSP11ctnA=;
        b=mXnzAExFmN/yoOGnVJjMIYveyq7+s1QY4JzMTincVb6xqsh3zNuWCv0Oj0QnForLJA
         ObOIZSNfWax7hLgL5PPDjuYiM71RXw6+jwo3Vwx6pxHTchTSiyWUWAdp1s45fOUrsoam
         lbci6RJKGyOAgDga4VzHKbH1ercvdVPr5Q8XDBCQUZEDK1AH/8YlChVBj3RLHA/Cy0ow
         lyHS47CRZHVZSC4n6EZC1+6lrwWIsmTo+pjDePlPDdrDXFwGfL8qKSVOtPeUtU6xTO6s
         XPBoN/gcgFjSEBYqBYct2n+OCxTFliIA7Y5zFJaVf6tKGbbsWs9X5KT8g/cwTdBvFQbe
         eYHw==
X-Forwarded-Encrypted: i=1; AJvYcCU1Zki/LGeCDAOdkUyXsp4WdetBuGF2OzPnhYQR5Qdz2j3sH29Bz3iJcA1aqPlFTKs+t0mHxfOYEtJzapE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVKfbdMCl4+aapbN0TXRz2Gj7l9GThvGRU0cGt/7KLi6cQyeWI
	7JKd7ptZrXkjVuRrj1RkZy/Z5jjlPRS7cnNKujZf5NqVpev69fQlpyid
X-Gm-Gg: ASbGncsG7CaZ5B+55N5pF6uiqwJGZH32eDVAaTLN3n9PfrVORCzApUCBgigUplrqN6b
	Uy/QiH79SEcsdl7oSYg1lvm8f1ifo+Y+xAN83ma52tAsVdC2Zkued05E4iTk6VX2PRbBzTc/E2o
	Q4k03zmiZhPMrRuIq41sNTd6VLVLihjWkfN25AELS/R1Fs6PzJky7RhFIB4YmnX4GBpDfwm2/CU
	o5Yi+mRWJXmhD+TyQ6MB3FJhhbnUqUvnN5uEZrHw2LgK2gXuCNd67Mo/hGakP082+Ew7LU2L1wQ
	CeFcq0XDW87AUwjDQzIHNz3JEd/Sn0olfTZS2OqyAahsbK4GXXYWBVWbGkwewe8=
X-Google-Smtp-Source: AGHT+IEkC+lVM+ew9wvZdD7GrkR5/c3J8KLVLcGyoBLbeJcpSdeKeSSpIcQpyH9IBHalV5KBOc9Tfg==
X-Received: by 2002:a17:90b:3e8e:b0:2fe:d766:ad8e with SMTP id 98e67ed59e1d1-30e7d507e75mr17053952a91.4.1747627138499;
        Sun, 18 May 2025 20:58:58 -0700 (PDT)
Received: from [10.189.144.225] ([43.224.245.249])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30e7d46ef3bsm5582201a91.10.2025.05.18.20.58.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 May 2025 20:58:58 -0700 (PDT)
Message-ID: <c45b46f0-65c9-4a4a-8622-c8ef2b9e69b4@gmail.com>
Date: Mon, 19 May 2025 11:58:54 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: shengyong2021@gmail.com
Subject: Re: [PATCH v7] erofs: add 'fsoffset' mount option to specify
 filesystem offset
To: hsiangkao@linux.alibaba.com, chao@kernel.org, zbestahu@gmail.com,
 jefflexu@linux.alibaba.com, dhavale@google.com, lihongbo22@huawei.com,
 linux-erofs@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Sheng Yong <shengyong1@xiaomi.com>, Wang Shuai <wangshuai12@xiaomi.com>
References: <20250517090544.2687651-1-shengyong1@xiaomi.com>
 <aCqrceu67F3rh3JM@debian>
Content-Language: en-US, fr-CH
From: Sheng Yong <shengyong2021@gmail.com>
In-Reply-To: <aCqrceu67F3rh3JM@debian>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/19/25 11:54, Gao Xiang wrote:
> Hi Yong,
> 
> On Sat, May 17, 2025 at 05:05:43PM +0800, Sheng Yong wrote:
>> From: Sheng Yong <shengyong1@xiaomi.com>
>>
>> When attempting to use an archive file, such as APEX on android,
>> as a file-backed mount source, it fails because EROFS image within
>> the archive file does not start at offset 0. As a result, a loop
>> or a dm device is still needed to attach the image file at an
>> appropriate offset first. Similarly, if an EROFS image within a
>> block device does not start at offset 0, it cannot be mounted
>> directly either.
>>
>> To address this issue, this patch adds a new mount option `fsoffset=x'
>> to accept a start offset for the primary device. The offset should be
>> aligned to the block size. EROFS will add this offset before performing
>> read requests.
>>
>> Signed-off-by: Sheng Yong <shengyong1@xiaomi.com>
>> Signed-off-by: Wang Shuai <wangshuai12@xiaomi.com>
> 
> I applied the following diff to fulfill the Hongbo's previous suggestion
> and refine an error message:

Hi, Xiang,

I'm fine with the update, thank you for improving the change :-)

thanks,
shengyong

> 
> diff --git a/Documentation/filesystems/erofs.rst b/Documentation/filesystems/erofs.rst
> index 11b0f8635f04..d93b30287110 100644
> --- a/Documentation/filesystems/erofs.rst
> +++ b/Documentation/filesystems/erofs.rst
> @@ -128,7 +128,7 @@ device=%s              Specify a path to an extra device to be used together.
>   fsid=%s                Specify a filesystem image ID for Fscache back-end.
>   domain_id=%s           Specify a domain ID in fscache mode so that different images
>                          with the same blobs under a given domain ID can share storage.
> -fsoffset=%lu           Specify image offset for the primary device.
> +fsoffset=%lu           Specify block-aligned filesystem offset for the primary device.
>   ===================    =========================================================
>   
>   Sysfs Entries
> diff --git a/fs/erofs/super.c b/fs/erofs/super.c
> index 3185bb90f549..e1e9f06e8342 100644
> --- a/fs/erofs/super.c
> +++ b/fs/erofs/super.c
> @@ -654,9 +654,9 @@ static int erofs_fc_fill_super(struct super_block *sb, struct fs_context *fc)
>   	}
>   
>   	if (sbi->dif0.fsoff) {
> -		if (sbi->dif0.fsoff & ((1 << sbi->blkszbits) - 1))
> -			return invalfc(fc, "fsoffset %llu not aligned to block size",
> -				       sbi->dif0.fsoff);
> +		if (sbi->dif0.fsoff & (sb->s_blocksize - 1))
> +			return invalfc(fc, "fsoffset %llu is not aligned to block size %lu",
> +				       sbi->dif0.fsoff, sb->s_blocksize);
>   		if (erofs_is_fscache_mode(sb))
>   			return invalfc(fc, "cannot use fsoffset in fscache mode");
>   	}

