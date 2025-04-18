Received: from smtp.smtpout.orange.fr (smtp-16.smtpout.orange.fr [80.12.242.16])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB6D22DFA7
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 05:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744955631; cv=none; b=VXhvqwua5mZEAlpV2apmQbukyI21C/7lBW6tnOVvqwpageFzRMyPJSU+pHP0EN5j/dys/f5h+lcUYTxbnprGKD9iy8EzMQHm7RFs1K96Vz9jWVqc3734qfi12YxfpLFg6qSlXSnA6BnUf8YwGXWptqYDvVcXYwXjkwkzgWabejg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744955631; c=relaxed/simple;
	bh=9M4ma31fDn61V5fHb34AqaRvBRIY1n1BlpDnVHz2ej0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y6NY6UTPPqFdFI6G1eDnEHMC4ARcqTqA1Dsm62gZ9exwMxLisnQknzsReRbC64tc+fGFlG5+rvFIulJSrYfWiFIntiO4uKnrr3pVKkm8jQWWSP7Cq1oMsQrChayvaq3KSAg0/EKfuZZMb6HMaVy2u9OSmoYVlfWrk+lZVH5CHZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=dtVNp0qP; arc=none smtp.client-ip=80.12.242.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="dtVNp0qP"
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id 5edwul0TZtvMG5ee0uVAiY; Fri, 18 Apr 2025 07:52:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1744955531;
	bh=beKcvPKn4gWz14KY1u+Jl21S7uykusGB6oklth52zpc=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=dtVNp0qP4EdAppUn1VjXkQGHWgp1+kHydnwG6wE4eS1tejUL0hoAsq30zKK+mvZg9
	 Uy6eMhS/xyu72Noti/dG3GzLqBx4bRtSyIdky0rw2qj4Tb1BfX6wh5iSScW1KurKcT
	 JgWQzR7N1tLJH0b+O1TH0JC/OBBz+mpIfUNpLVdMjI8sHihgBhpg/kUCsSgsvPx0xp
	 WchdA0ow1RLxSmJdHIMyGUeMWCyB4+V9rHxXtM4nhTI3Woz0bfWWykmw7tMxUminke
	 LfqKcBmYOlDP76FAxHl+/fQYcXQJTJ0oNAKNpUWF1MXBkU/QPf7vDZfoAseI5G+7id
	 nZ60afh9PqtnA==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Fri, 18 Apr 2025 07:52:11 +0200
X-ME-IP: 90.11.132.44
Message-ID: <ab85b3c9-46cc-4148-9de5-dcaabea130ea@wanadoo.fr>
Date: Fri, 18 Apr 2025 07:52:27 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] drm/radeon: Remove unused radeon_doorbell_free
To: linux@treblig.org, alexander.deucher@amd.com, harry.wentland@amd.com,
 sunpeng.li@amd.com, siqueira@igalia.com, christian.koenig@amd.com
Cc: airlied@gmail.com, simona@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250418002117.130612-1-linux@treblig.org>
 <20250418002117.130612-3-linux@treblig.org>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20250418002117.130612-3-linux@treblig.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 18/04/2025 à 02:21, linux@treblig.org a écrit :
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
> 
> radeon_doorbell_free() was added in 2013 by
> commit 75efdee11b5d ("drm/radeon: implement simple doorbell page
> allocator")
> but never used.

Hi,

I think than instead of being removed, it should be used in the error 
handling path of cik_init() and in cik_fini().

CJ

> 
> Remove it.
> 
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> ---
>   drivers/gpu/drm/radeon/radeon.h        |  1 -
>   drivers/gpu/drm/radeon/radeon_device.c | 14 --------------
>   2 files changed, 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/radeon/radeon.h b/drivers/gpu/drm/radeon/radeon.h
> index 8605c074d9f7..58111fdf520d 100644
> --- a/drivers/gpu/drm/radeon/radeon.h
> +++ b/drivers/gpu/drm/radeon/radeon.h
> @@ -686,7 +686,6 @@ struct radeon_doorbell {
>   };
>   
>   int radeon_doorbell_get(struct radeon_device *rdev, u32 *page);
> -void radeon_doorbell_free(struct radeon_device *rdev, u32 doorbell);
>   
>   /*
>    * IRQS.
> diff --git a/drivers/gpu/drm/radeon/radeon_device.c b/drivers/gpu/drm/radeon/radeon_device.c
> index bbd39348a7ab..4127ffb4bb6f 100644
> --- a/drivers/gpu/drm/radeon/radeon_device.c
> +++ b/drivers/gpu/drm/radeon/radeon_device.c
> @@ -392,20 +392,6 @@ int radeon_doorbell_get(struct radeon_device *rdev, u32 *doorbell)
>   	}
>   }
>   
> -/**
> - * radeon_doorbell_free - Free a doorbell entry
> - *
> - * @rdev: radeon_device pointer
> - * @doorbell: doorbell index
> - *
> - * Free a doorbell allocated for use by the driver (all asics)
> - */
> -void radeon_doorbell_free(struct radeon_device *rdev, u32 doorbell)
> -{
> -	if (doorbell < rdev->doorbell.num_doorbells)
> -		__clear_bit(doorbell, rdev->doorbell.used);
> -}
> -
>   /*
>    * radeon_wb_*()
>    * Writeback is the method by which the GPU updates special pages

