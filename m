Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C17912E7E
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 04:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751086093; cv=none; b=ReNtgAASxVQ71D/fCydUIfbUNNyrJ6f84DPiyJhAdHd3jLECriEI3pOWeEn+dJvv9w8wBpvYxTTo+wDjsdYF0QDCmv91tl8l2KM2i1tencVE79Mvn3niwwqpBGh+KWqILwt7iReipH24kfvfJxf9HjQwUO3l/76+aY40v7xY6Iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751086093; c=relaxed/simple;
	bh=B5Pn09+Ho8sZg1JGFA1Exg0+AmzzKLgmb9GeiTazc10=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tjCRzmDDRkQAmd6soOpfwWFYDiG8ZT509kQaP8/qH1paGBeyNMuWhymj730VbNsDJOEjfs5yRkyba2je5vSiTyoHOA7q0RAmyo3BvFF1m2ZCHMQZdIpEH+mAMtxT79860JI+ZNA20+F1vM117hYmGes2ZFBSIOhdH8sbI77KFo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Vhv2pZ1+; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Vhv2pZ1+"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a522224582so1384542f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 21:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751086088; x=1751690888; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3pOdb7vkaoZ2ojSybxNJlVg/xXJ4xkyAki8K90GztNY=;
        b=Vhv2pZ1+OMGBl/iPzhgvJ9SH6wj8iVMhrP/CFqEONMyyohX25OmEbJPX3OT3mdeRgu
         2wgCCvxKSYAQpyQtEinZ6E2lIl2JZJXlkOk5fajjxrIoipVMyUiXIJlKcM8WGgj7LwU7
         ITWTvk59Ncb7M8DEiXt2dYUOpkfN/143FQTfeUwf8Nfmyb16Vlb3CltI7wqw3ay2bGB2
         MQQUssWk3pBw/iojs5az/FhuF9HEn3om3v46NfSlG8OXeEXtcX63qag+QQXLttVwJHND
         x3jZYbcFSloG/gDJoAQFt2GX0yWSxT4nkmnfO3q+kdZJFQz8E0fWKJ4OgfJpn9aRNNlU
         r9rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751086088; x=1751690888;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3pOdb7vkaoZ2ojSybxNJlVg/xXJ4xkyAki8K90GztNY=;
        b=du4QARMaXsOESJO7GzrG05zy0Fq7pFFcUwOBVEGuho5PKiGgWQjqD8vWrwrVYYk9t3
         IfQqP9TwoBD935dqfUe19vfC1LXiNu+LtjChVGlDcPhhwVF7LCVIKPvVy/FuUF20Ko4h
         xdr/eD2sue1wiPK0FM6S/8bOuk882SIbLcpmEIOjHU17yPH/M+lMNDCwIpYn3g4Uq2IN
         UhgSTNP7yxM4TofwWIEePMn9CKOygHya4CrCAocvls5kJlOkUt0qBH8gi95k1K3SAI+i
         OfPxxQgGUjfb7c1oep0YRgxBzq5eSEOYrKX8L8Nh/stYcxOpQRzYTCDj440XLjKBNpXW
         fkqw==
X-Forwarded-Encrypted: i=1; AJvYcCUOhAkR6SYjfNi2rd7ID4bA3ZOZsdzAXFnMB5UcdHUVRWbwRG8M+GF31gXnNbZeHgBDG1jyB3CfZZ+KEuc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKQCEL2eCcPIE8k9AeTfta0C47aZUDpvrRld7t0m8dtYK/9vG8
	wXnT3bK3lvoBhirlfsyXfN46LshBLSCb2HiGpuKsC09hPHblnyWBUCQvBAdxkTF2AuM=
X-Gm-Gg: ASbGncvOQa821yLWS96gvx18mg+TmF3frexVl0oYW7lMie9iuY0vEBsMTFMr8j9Xzr5
	WfJOLX8OEy5tGxSdcODL/hmh9/tiBxMD1G+QvjmhdVp89xYSC4qaoVmmsm+LjWe94iG0PVfLIjO
	924G/eMhvOtD4+c5m3Ju30AUxVhsPDWcTs60FDfI6PqyOmZQXsshIcTMmVGvQI7l2kfKLKJ6+1l
	BUYv//4CgFZWEuclCtwDwBMr6HR4G3wEajyD8/yL5yBqFByuIRXIF7Q1DmKpw2aIoUy5GF3/NqN
	xYmmasEnx7jX2c9k/yRAZl1dPdXVchzy116GCC7HPBgVBna7Qp1n4qSScFw3ea0pHoP7hEh3MYm
	lgJ71tio0S5Y0ogidWq2EY20Y
X-Google-Smtp-Source: AGHT+IG6RY6s9pOfviGEaWn8f+6ILurq5R+1HmPSqY8/p4o3Ed04Mq5knETyuC0AKQCAM+bmp7yXNA==
X-Received: by 2002:a5d:5f55:0:b0:3a4:edf5:b942 with SMTP id ffacd0b85a97d-3a90b8c9779mr5849874f8f.57.1751086088127;
        Fri, 27 Jun 2025 21:48:08 -0700 (PDT)
Received: from ?IPV6:2403:580d:fda1::299? (2403-580d-fda1--299.ip6.aussiebb.net. [2403:580d:fda1::299])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb2f2183sm30874435ad.75.2025.06.27.21.48.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 21:48:07 -0700 (PDT)
Message-ID: <669773b7-4428-43ca-ab80-d7ed1c71886c@suse.com>
Date: Sat, 28 Jun 2025 14:18:03 +0930
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] btrfs: replace nested usage of min & max with clamp in
 btrfs_compress_set_level()
To: George Hu <integral@archlinux.org>, Chris Mason <clm@fb.com>,
 Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>
Cc: linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250628043235.29900-1-integral@archlinux.org>
Content-Language: en-US
From: Qu Wenruo <wqu@suse.com>
Autocrypt: addr=wqu@suse.com; keydata=
 xsBNBFnVga8BCACyhFP3ExcTIuB73jDIBA/vSoYcTyysFQzPvez64TUSCv1SgXEByR7fju3o
 8RfaWuHCnkkea5luuTZMqfgTXrun2dqNVYDNOV6RIVrc4YuG20yhC1epnV55fJCThqij0MRL
 1NxPKXIlEdHvN0Kov3CtWA+R1iNN0RCeVun7rmOrrjBK573aWC5sgP7YsBOLK79H3tmUtz6b
 9Imuj0ZyEsa76Xg9PX9Hn2myKj1hfWGS+5og9Va4hrwQC8ipjXik6NKR5GDV+hOZkktU81G5
 gkQtGB9jOAYRs86QG/b7PtIlbd3+pppT0gaS+wvwMs8cuNG+Pu6KO1oC4jgdseFLu7NpABEB
 AAHNGFF1IFdlbnJ1byA8d3F1QHN1c2UuY29tPsLAlAQTAQgAPgIbAwULCQgHAgYVCAkKCwIE
 FgIDAQIeAQIXgBYhBC3fcuWlpVuonapC4cI9kfOhJf6oBQJnEXVgBQkQ/lqxAAoJEMI9kfOh
 Jf6o+jIH/2KhFmyOw4XWAYbnnijuYqb/obGae8HhcJO2KIGcxbsinK+KQFTSZnkFxnbsQ+VY
 fvtWBHGt8WfHcNmfjdejmy9si2jyy8smQV2jiB60a8iqQXGmsrkuR+AM2V360oEbMF3gVvim
 2VSX2IiW9KERuhifjseNV1HLk0SHw5NnXiWh1THTqtvFFY+CwnLN2GqiMaSLF6gATW05/sEd
 V17MdI1z4+WSk7D57FlLjp50F3ow2WJtXwG8yG8d6S40dytZpH9iFuk12Sbg7lrtQxPPOIEU
 rpmZLfCNJJoZj603613w/M8EiZw6MohzikTWcFc55RLYJPBWQ+9puZtx1DopW2jOwE0EWdWB
 rwEIAKpT62HgSzL9zwGe+WIUCMB+nOEjXAfvoUPUwk+YCEDcOdfkkM5FyBoJs8TCEuPXGXBO
 Cl5P5B8OYYnkHkGWutAVlUTV8KESOIm/KJIA7jJA+Ss9VhMjtePfgWexw+P8itFRSRrrwyUf
 E+0WcAevblUi45LjWWZgpg3A80tHP0iToOZ5MbdYk7YFBE29cDSleskfV80ZKxFv6koQocq0
 vXzTfHvXNDELAuH7Ms/WJcdUzmPyBf3Oq6mKBBH8J6XZc9LjjNZwNbyvsHSrV5bgmu/THX2n
 g/3be+iqf6OggCiy3I1NSMJ5KtR0q2H2Nx2Vqb1fYPOID8McMV9Ll6rh8S8AEQEAAcLAfAQY
 AQgAJgIbDBYhBC3fcuWlpVuonapC4cI9kfOhJf6oBQJnEXWBBQkQ/lrSAAoJEMI9kfOhJf6o
 cakH+QHwDszsoYvmrNq36MFGgvAHRjdlrHRBa4A1V1kzd4kOUokongcrOOgHY9yfglcvZqlJ
 qfa4l+1oxs1BvCi29psteQTtw+memmcGruKi+YHD7793zNCMtAtYidDmQ2pWaLfqSaryjlzR
 /3tBWMyvIeWZKURnZbBzWRREB7iWxEbZ014B3gICqZPDRwwitHpH8Om3eZr7ygZck6bBa4MU
 o1XgbZcspyCGqu1xF/bMAY2iCDcq6ULKQceuKkbeQ8qxvt9hVxJC2W3lHq8dlK1pkHPDg9wO
 JoAXek8MF37R8gpLoGWl41FIUb3hFiu3zhDDvslYM4BmzI18QgQTQnotJH8=
In-Reply-To: <20250628043235.29900-1-integral@archlinux.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



在 2025/6/28 14:02, George Hu 写道:
> Refactor the btrfs_compress_set_level() function by replacing the
> nested usage of min() and max() macro with clamp() to simplify the
> code and improve readability.

Can you please only touch the "level != 0" branch using clamp()?

With a not-that-short expression used in the conditional operator, I do 
not think the final result is easier to read.

Thanks,
Qu

> 
> Signed-off-by: George Hu <integral@archlinux.org>
> ---
>   fs/btrfs/compression.c | 7 +------
>   1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/fs/btrfs/compression.c b/fs/btrfs/compression.c
> index 48d07939fee4..662736d94814 100644
> --- a/fs/btrfs/compression.c
> +++ b/fs/btrfs/compression.c
> @@ -972,12 +972,7 @@ static int btrfs_compress_set_level(unsigned int type, int level)
>   {
>   	const struct btrfs_compress_op *ops = btrfs_compress_op[type];
>   
> -	if (level == 0)
> -		level = ops->default_level;
> -	else
> -		level = min(max(level, ops->min_level), ops->max_level);
> -
> -	return level;
> +	return level == 0 ? ops->default_level : clamp(level, ops->min_level, ops->max_level);
>   }
>   
>   /*

