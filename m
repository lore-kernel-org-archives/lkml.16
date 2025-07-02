Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9CB22D0C68
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 15:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751471615; cv=none; b=Lei25KPHIEwsVqDTCDrCPpqVg7GasatkRrPubWvhhBhO6AMHS/77jbwb28Au/zTyn91kcslzh9bKeMRXk3IgZcWQSnbRUjzjjs2I4woLQXCtmMPsrF3JCjVjn/R+zJs5ae9jLR5NrYhLg+cKJM178NavCd3ki2HeUBz+cZaqRpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751471615; c=relaxed/simple;
	bh=SnlgmvXX9oBJ2pQVKACQLITc0HfSCd9SV1QSCI/mbkY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k/HUeuqZi8Qk1KyuHUclszik/xlRffNpL+pKEAg8z3Xf9jbm+rcZXjH3LZXVItDCYS9SoB1mvEm8FCCZjiJ6RKgH7wGim8YqCSU49Vy7gM0JubBozhAFEZM2S4jgo3e4dU2xzZ7nz6NeYhQVpkE5zmHTZgAAI+dJ9vxNhrt0Wzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=W0KQKoGq; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="W0KQKoGq"
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-2ef891cd058so3588146fac.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 08:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751471613; x=1752076413; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9Kino+XqZYEqgWvIyTiqrJSAa+M+qswg1+WCL0GmDq8=;
        b=W0KQKoGqIUOcxiksiji1jTpJYnhg68zabcFq5EA+TFgLq0oWijZKfcg8SrJMDbVj5/
         4DEDaacT3x4OMNDe3IFKzkhHUQaHS9WBOXFjkHYHSC9Q15hDxmURDuLFGSKjxRooZBYL
         AYv+sH512FTt8l7yE78pwDS/4bvPlIEc3a4cPoyWTgPV20Zua+bgZIZp5mVpCJtnxpk8
         RjEqYi01wUJE3unzjytv9c6bvQVvHEGz9VJw06H99wyEAOcP/D7cBzfudl/d0eewSDAJ
         TL0uE7VXeRbJdBF+CarTyBpGR1+Zo7ADj8FUa2Rssf8EK/Hd/2vOfopsr0VOrGsPBd3s
         0ASQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751471613; x=1752076413;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9Kino+XqZYEqgWvIyTiqrJSAa+M+qswg1+WCL0GmDq8=;
        b=T0SgPCiPxmrYIZgMY8/la+bIi1W3gLHSCJwy7JtSOUrmYUK4gp1jHMUd82JjDAdUql
         u+iEWqufoXOC4H2UuXVQ8LBVCqi6R3bLIxC4mAQD+Wrd7KKm7t5Je3FcwY/SWrAzm2qT
         soAb2Z41FtyvCehbfeTm+XHnjV1cPXAGleAUvg5C5pF68DjAIklc9bjqR46drdHKzzoz
         5Gqk/ahYEVRFSHjECvHaJiAhMp/GxCCJ1puDhzIZlMcAeVCVwRWGvIvE3PpPKdQOy54Z
         9jQXEKPe/lgDTG5HpNh6YcHulGQUWHnNs5HWtIZYbvFx/vriTMKYGFrXTgFRmOwe0bCp
         YP/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVaXNxXLlWscQiv6hzstqi8vkvb8AKlKbq2LA5ZI2LSXRpVdCjHpcn9dmFFpgKkyqTq94wcwkehBOjUNoE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzX+Lp6DRFrPM+ljmprkHIrBjLaP8ZONg04y130g+gLH+t+A0Di
	iXVbxnG3uc3Fj4DmQ415oeQSoJYJavCxj5bA/5nDmClT13GjXiR1oxMyfT2ByIYRUzL+bDF4+Uk
	a74nqfnk=
X-Gm-Gg: ASbGncszPkDZuVyw10ySp4OYZGcaqR934gukWkevN0+g9qfl0MFcvBbB5DMjEkokMkL
	GqbTCRxmwUWZSJ1kTPM/TRio6ilu3O8NnsKWbOvbOa/9dYlII6BVz17QWfS0u2wbBq+oqq9hCpj
	He7X1kSreDvuw9XZBBN2tmZWP5BAbc0Q2zcW54sMIcHMizqmmIgsCuX3/3OojNymyZkbge2mUr+
	ZmvlhTJeM3vFQuN1UCzuBU1ebI1CT1+HQPLoPfR2gTmg/afbhthCrR7C+W8RSnL4yYwcLd62QJo
	qRDoMxzMH4htQvOCt0h36OQLXmT7SEmNA64ZGkNKb2Dipxl9PlZFb/Pj0RyydUTVEjoYrYY3O8c
	wNoMHi/dCX4S+28PMW44h8SCA4zs/egDUL63Jd/8nznqLMgFDyw==
X-Google-Smtp-Source: AGHT+IHqyqv4bHA7mWxBx95w1LJXjzoruqsxFeBP7aW/iw0Ov87EOi4MTilwG8uSt/H50TBf7IQPGg==
X-Received: by 2002:a05:6870:944c:b0:2d6:667c:511f with SMTP id 586e51a60fabf-2f5a89fd32dmr2992756fac.9.1751471612809;
        Wed, 02 Jul 2025 08:53:32 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:5c00:24f0:997b:5458? ([2600:8803:e7e4:1d00:5c00:24f0:997b:5458])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2efd4eab4e3sm3980916fac.4.2025.07.02.08.53.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 08:53:32 -0700 (PDT)
Message-ID: <3361875b-712e-423f-88ed-baf41af5ad22@baylibre.com>
Date: Wed, 2 Jul 2025 10:53:31 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iio: st_lsm6dsx: Replace scnprintf with sysfs_emit
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
 Akshay Bansod <akbansd@gmail.com>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250702135855.59955-1-akbansd@gmail.com>
 <f96b68a5-d750-45f0-8cdd-9761b5daca1d@baylibre.com>
 <aGVIcBLgXZj_YR7B@smile.fi.intel.com>
 <e474db53-1b52-48b0-9253-2f62a3861bb4@baylibre.com>
 <20250702163342.00003c66@huawei.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20250702163342.00003c66@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/2/25 10:33 AM, Jonathan Cameron wrote:
> On Wed, 2 Jul 2025 10:04:23 -0500
> David Lechner <dlechner@baylibre.com> wrote:
> 
>> On 7/2/25 9:55 AM, Andy Shevchenko wrote:
>>> On Wed, Jul 02, 2025 at 09:16:51AM -0500, David Lechner wrote:  
>>>> On 7/2/25 8:58 AM, Akshay Bansod wrote:  
>>>>> Update the sysfs interface for sampling frequency and scale attributes.
>>>>> Replace `scnprintf()` with `sysfs_emit_at()` which is PAGE_SIZE-aware
>>>>> and recommended for use in sysfs.  
>>>
>>> ...
>>>   
>>>>> +		len += sysfs_emit_at(buf, len, "%d.%03d ",
>>>>>  				 odr_table->odr_avl[i].milli_hz / 1000,
>>>>>  				 odr_table->odr_avl[i].milli_hz % 1000);  
>>>>
>>>> Let's keep checkpatch happy and change the indent of the wrapped lines to
>>>> line up with ( since the ( moved.  
>>>
>>> While I see the point, wouldn't be better to have 1000 replaced with MILLI
>>> at the same time?
>>>   
>>
>> For anything with 3 zeros, I don't consider MILLI better (or worse).
>> Science shows that the average human can easily see 3 or 4 things
>> without having to count them [1]. So it is only when we start getting
>> more 0s than that is when I think we should be picky about using macros
>> instead.
>>
>> And in this particular case, we are converting milli to micro so `1000`
>> should be replaced by `(MICRO / MILLI)` if we are going to do that.
> No we aren't.
> 
> This one is converting from milli_hz to hz + sticking to milli for the decimal
> part.
> 
> Lots of other IIO cases where you would have been right, but I think not here.

Oops. The %03d instead of %06d should have given it away!

>>
>> [1]: https://www.scientificamerican.com/article/your-brain-finds-it-easy-to-size-up-four-objects-but-not-five-heres-why/
>>
>>
> 

