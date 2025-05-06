Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C171F4C85
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 17:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746550823; cv=none; b=lYuINEGXEpDiL9krDeEmb5iAwgturZSJXMhcd09CdjsugDt++Jkt/kI6ekWJSBE2xF7bVRPpPDU1iH5s18DZ0HIGUIIQKSfFcz3/loG4z8mBXtr4dmZQe0xZewKOuwikmaWH+u/AOJDU0f1ZL7XQGoUjevuNb7pIOdiM9K8jzXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746550823; c=relaxed/simple;
	bh=rMT0xdQQt+3r2qtKrekqHV+J40aw9Vry4Sfm4EzwYgE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KjF5zUgcHcVaYX2NmtLPlXDgW5cYCg3upuJgA0BJ3zDsKfNFKY/b8cDZHwdKq5mZ1K/wSmuwt0YhLgnACsSQQoX1uLrMQA0dtgSDBQTC++8xAqBazVGr/+7SLHRUn+2h/sRolq5kBbBg7zBk2wBLhQEmrzEQeLW5czOvU7LTWvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=j/IIUOf9; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="j/IIUOf9"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-72b0626c785so4786895a34.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 10:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746550820; x=1747155620; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xowZWkm/X/sMYc/KKOP8flO/U1/kVq3qKvxE/W0L3a8=;
        b=j/IIUOf9BexEyHGjaJmxI6TDjN99j297fHbw/1LjK/L4DGCdJCwuqlWbr7puXKz+eF
         /LpjxztpXlEvlyfxzbBqaB5tYmEdqUFEsSZgYSsFPEnNxMOrLi6+q3MW71thgwplhCY3
         +GOtCNXDopmfazRsFnNTMXgmsdlL1VJNnOzwnI8EzIP8JC6AZSgMXNaBHOSLgfB2ji9i
         R4I3VGqvwdYEoRlwAqDxXwy4RVU9ro5zOPNuVQXkXWycEolrimS/7af/UMkuRwWtF1q9
         SykVmgqQ6gUoGMMXOwVuhYweuZPyTfPUJ/A/c9PDB32bWDAMlnW+LazPL1Q/JIKNjkYa
         L1NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746550820; x=1747155620;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xowZWkm/X/sMYc/KKOP8flO/U1/kVq3qKvxE/W0L3a8=;
        b=SGzMtayWw/IBXOtVsWhUec/v/xYHqXFIKfaOOub0NI7KcH49VafwwLOVYil8AgEvro
         ywkbo2s+hseVO2TO6GOmuL+qHABt3U/M8ZNYEsc51lg0skNDjqwkccWNONgD6bnZuM8T
         tAuP+SHJT04eOK6dJ9bPUvKQls2PoPyXtt8xujqZP3MUZfcr9cWj26MOIg/zW4TX3MQU
         yhUBa9WTye9/ARbhu4y8RJpwMU49gMO1OsUMuqP0lsmmAw41KZTU0qFQHbLzXumPOlDK
         BLjM2MTK8V0B+hCTvdGWZb5H0lLeTIYyJ6//Qt65D3w+fBMsMUwEhLx4jSZDCAff6VeL
         mRLg==
X-Forwarded-Encrypted: i=1; AJvYcCWtLlTzfoVRqSK44vpjj+1hYludjnWhDKsz6yxtrS9a/8gMUtv0hHjXCKZt2XSyfN/2a0hV895EkkncRlo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzANeNU4q+AQvOxkevjtyDBLyUXk8YNphZ8UNPaEGbtNLVQ64PA
	buMIT8Xmw3uuV0UM6EfYS0zdzb8Jn/+qgTJJThL80FdP+cr2eVJJ7HRNwOUlyjAvuI1t2VdgacU
	s
X-Gm-Gg: ASbGncsDSVWav3yeKYogxX+R5P6vnKQ+YFxTNdP66yaf+Z8lbb1NlpriUNPYrNwPjUj
	aVRjtlJyVdCF9aQ/hAfTeSgRiFNZawnLQLbrdxPaScvoUmDypsBloPS+DSPSSEUP05KTsQm7Fqi
	w4YkcGRPJ16qi0rylbqvghhTRChwTn+4VoaRBl8E0Zg5+7FmdPJmRGJSj2mFlmz4fpz7Rcwolp3
	kMSMxUigdN8IkcqHwYXxHvtfw1ujNsIo0oFiJ907WJ6kmqNqxJrLT7NWPXQPyzeLvUV7+iZHViT
	Fz1tfumV0+AZ/GbUipjZOeGRrrqxmOhaS5DHVgMTqQ+7LFE634GARE+HtEGqTUMuSL2Ynv2pUrk
	aV/cSvHgbsZv73O0QHQ==
X-Google-Smtp-Source: AGHT+IFNPKlrUp5qRyXmpfL7F/ah602Gc3+IjI75vJg0+e7TbpPzmIhUUjvuHpOtYUHtumXvXy+COg==
X-Received: by 2002:a05:6830:2a9e:b0:72b:872f:efc8 with SMTP id 46e09a7af769-731eae95b90mr8191432a34.24.1746550820406;
        Tue, 06 May 2025 10:00:20 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:5172:9f6c:997a:41ea? ([2600:8803:e7e4:1d00:5172:9f6c:997a:41ea])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-731d31c71aasm2135889a34.20.2025.05.06.10.00.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 May 2025 10:00:20 -0700 (PDT)
Message-ID: <aa7f18ce-9330-4a30-93e5-85489f507a42@baylibre.com>
Date: Tue, 6 May 2025 12:00:19 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] iio: backend: fix out-of-bound write
To: Markus Burri <markus.burri@mt.com>, linux-kernel@vger.kernel.org
Cc: Nuno Sa <nuno.sa@analog.com>, Olivier Moysan
 <olivier.moysan@foss.st.com>, Jonathan Cameron <jic23@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, linux-iio@vger.kernel.org,
 Markus Burri <markus.burri@bbv.ch>
References: <20250505203830.5117-1-markus.burri@mt.com>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <20250505203830.5117-1-markus.burri@mt.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/5/25 3:38 PM, Markus Burri wrote:
> The buffer is set to 80 character. If a caller write more characters,
> count is truncated to the max available space in "simple_write_to_buffer".
> But afterwards a string terminator is written to the buffer at offset count
> without boundary check. The zero termination is written OUT-OF-BOUND.
> 
> Add a check that the given buffer is smaller then the buffer to prevent.
> 
> Fixes: 035b4989211d ("iio: backend: make sure to NULL terminate stack buffer")
> Signed-off-by: Markus Burri <markus.burri@mt.com>
> ---
>  drivers/iio/industrialio-backend.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iio/industrialio-backend.c b/drivers/iio/industrialio-backend.c
> index a43c8d1bb3d0..4a364e038449 100644
> --- a/drivers/iio/industrialio-backend.c
> +++ b/drivers/iio/industrialio-backend.c
> @@ -155,11 +155,14 @@ static ssize_t iio_backend_debugfs_write_reg(struct file *file,
>  	ssize_t rc;
>  	int ret;
>  
> +	if (count >= sizeof(buf) - 1)

Isn't it OK if count == sizeof(buf) - 1? In other words, should be:

	if (count >= sizeof(buf))

> +		return -ENOSPC;
> +
>  	rc = simple_write_to_buffer(buf, sizeof(buf) - 1, ppos, userbuf, count);
>  	if (rc < 0)
>  		return rc;
>  
> -	buf[count] = '\0';
> +	buf[rc] = '\0';
>  
>  	ret = sscanf(buf, "%i %i", &back->cached_reg_addr, &val);
>  
> 
> base-commit: b4432656b36e5cc1d50a1f2dc15357543add530e

It looks like we have the same or similar bugs in:

drivers/accel/ivpu/ivpu_debugfs.c
drivers/gpio/gpio-virtuser.c
drivers/iio/industrialio-core.c
drivers/iio/dac/ad3552r-hs.c

Do you plan to fix these as well? 
