Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A94F19007D
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 13:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749821874; cv=none; b=efzT+H9GAYPFJw3BcKwE/LwzmuO2xm7hVMEDY6KSlm2RrvjefnA0/Qv66FH0WUlCMTFUw3kDBdyU88AsXdTQ0TGcNaxdYlJz986gGdZEGLp9WDNoNJIVmbRvU5UkM/TLwRwSAppA818T8M6r2ujJ3ufWKRHObBb5xm/b/SGaMKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749821874; c=relaxed/simple;
	bh=BJoef0xWSj+7ZrFt5m5fWdPbULwYKZEpkk2JZYAFbMo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bF3Dj6nkijNYwi6oLK6ftbHPQ9fafDR9rpSENmtgKiX6UShbeuME1d7Ls7qLD+ifIHnPvXoaNrEll7mTu3nRFCHXOEKMpzIdxADYBl0jK/ERc7FvC5INKfA/hr1pZcU+VqwGAH9Ews7iajJco9N0LrNwfYtcRkP1kxkZBS5UAPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ieee.org; spf=pass smtp.mailfrom=ieee.org; dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b=W80yf5Jc; arc=none smtp.client-ip=209.85.166.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b="W80yf5Jc"
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-3ddff24fdc4so14554795ab.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 06:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1749821869; x=1750426669; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J+r+Bp65bEAZWnWid1OsBGNzxx17ZgRBrVVBgeYnd6A=;
        b=W80yf5JcFnxbJBJE2+czvUHP+lSXhYAfwc9Fh1A+x1zrJuA8/mCBU4R9VxWdZnsc5S
         PMbfGFM0Cj4tQLwuxqkqHZfpIlX8syRXYFRBEWWMMG0HMbZ9VQDRozUo6pJR53daBDzT
         tbRXmBsGrlxQmd5Sex5UTc1HGuoEKnfr4tzEI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749821869; x=1750426669;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J+r+Bp65bEAZWnWid1OsBGNzxx17ZgRBrVVBgeYnd6A=;
        b=ZiFlRyrxNRX0Gjtp63DMXcY1EXCUSeijJ7LpgBLj4jxzp4uYaDisynpN1hmmuGLPxo
         FZa9OPGvIpeQQ+uHkR3hehft4yhl2OTtvUUPX9/5Sr90BaeR2TUHSnDIvd72dUmplY1d
         0ufwZNJZvOYTz7p0v3pwaL0+GMo1K1prBi842IcGhzPV+FmCMC0f6L8cP/FBvbTQ4+I9
         +9qFyfslqj7QF4DlYNL9OZF7TW5VPRtXhBo7TWmQ2M3cbG2gjp42JFCRYpZZJmsfyQFp
         dgRPCbiCQU4+UUrrBl7qsmW+wiVnxy2mGBlYhC+CWKmbNpiqrNUbdTyLeb/4nAOthO+w
         aCRA==
X-Forwarded-Encrypted: i=1; AJvYcCVe0qjtoV0DQPbZybooW8pBa3XhZg+cUnd+5uDhWOyPz8PcwqXjnUYGj1wqnngveLoM9MNqd+RM1NSegMM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGOMUFcIuYqXL8Xrn3Pw97VVQKDgfatqVt7wq6/DmQ9+DqnZtF
	5gUioV1WnKp3DMNbD32pbyMdoTO7EUqoWcV2s5iu/L4NwqPvDk7zE5qv7mSS/NXFZQ==
X-Gm-Gg: ASbGncv9U4H9a7kt9lU9Iym+GBT2xdFndkX1xk6fPd+n17n/NDSsb8dJl4Hi4s9pWXm
	OjO2TdwsFfuq/3WJbT4HhaC2l0B3e3ddxm1+U4H/K8baqaXA4omhjpMtL5gbkzvvtawQn3Aql5x
	84DBYnhX4HHeWUtv7vtf+r+9CnMYx6pizcV65jbR3Hn+00cIUmby1twT5U1GqKdQLUdii3VG8ML
	IPp9tyBMeNFjWuEM9c6iPJBjTSE4IVaUS7Hukk5jJ73xfdrRyZEc3IZAaPKx0yvhyIOvJycYJ+Z
	zK+bFh724XMZldVCcMckd3pk7XI/GJlSFyrhl5E6XDTjEG/Dl/huufIWtxePAzogm85eK19SP4w
	VebNQtfpKsVTjw20ovvz6
X-Google-Smtp-Source: AGHT+IHmsqeaMGQ+A9VzBjS2uR5emsuPjFhHVVeYjhQKAzqV/edqTdOsFGFmJAYO4yUNC+PGzl3SQQ==
X-Received: by 2002:a05:6e02:178d:b0:3dc:87c7:a5b5 with SMTP id e9e14a558f8ab-3de00ad78d0mr34635405ab.3.1749821867585;
        Fri, 13 Jun 2025 06:37:47 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-50149b7a47dsm301397173.22.2025.06.13.06.37.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 06:37:47 -0700 (PDT)
Message-ID: <9dfa0d6b-e28d-4e83-acd0-1ad7803d2387@ieee.org>
Date: Fri, 13 Jun 2025 08:37:45 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] ceph: convert to use secs_to_jiffies
To: Yuesong Li <liyuesong@vivo.com>, Ilya Dryomov <idryomov@gmail.com>,
 Xiubo Li <xiubli@redhat.com>, ceph-devel@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com
References: <20250613102322.3074153-1-liyuesong@vivo.com>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20250613102322.3074153-1-liyuesong@vivo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/13/25 5:23 AM, Yuesong Li wrote:
> Since secs_to_jiffies()(commit:b35108a51cf7) has been introduced, we can
> use it to avoid scaling the time to msec.
> 
> Signed-off-by: Yuesong Li <liyuesong@vivo.com>

Looks good.

Reviewed-by: Alex Elder <elder@riscstar.com>

> ---
>   net/ceph/ceph_common.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/net/ceph/ceph_common.c b/net/ceph/ceph_common.c
> index 4c6441536d55..9ef326b0d50e 100644
> --- a/net/ceph/ceph_common.c
> +++ b/net/ceph/ceph_common.c
> @@ -530,26 +530,26 @@ int ceph_parse_param(struct fs_parameter *param, struct ceph_options *opt,
>   		if (result.uint_32 < 1 || result.uint_32 > INT_MAX / 1000)
>   			goto out_of_range;
>   		opt->osd_keepalive_timeout =
> -		    msecs_to_jiffies(result.uint_32 * 1000);
> +		    secs_to_jiffies(result.uint_32);
>   		break;
>   	case Opt_osd_idle_ttl:
>   		/* 0 isn't well defined right now, reject it */
>   		if (result.uint_32 < 1 || result.uint_32 > INT_MAX / 1000)
>   			goto out_of_range;
> -		opt->osd_idle_ttl = msecs_to_jiffies(result.uint_32 * 1000);
> +		opt->osd_idle_ttl = secs_to_jiffies(result.uint_32);
>   		break;
>   	case Opt_mount_timeout:
>   		/* 0 is "wait forever" (i.e. infinite timeout) */
>   		if (result.uint_32 > INT_MAX / 1000)
>   			goto out_of_range;
> -		opt->mount_timeout = msecs_to_jiffies(result.uint_32 * 1000);
> +		opt->mount_timeout = secs_to_jiffies(result.uint_32);
>   		break;
>   	case Opt_osd_request_timeout:
>   		/* 0 is "wait forever" (i.e. infinite timeout) */
>   		if (result.uint_32 > INT_MAX / 1000)
>   			goto out_of_range;
>   		opt->osd_request_timeout =
> -		    msecs_to_jiffies(result.uint_32 * 1000);
> +		    secs_to_jiffies(result.uint_32);
>   		break;
>   
>   	case Opt_share:

