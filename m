Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEBE42BEC51
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 22:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747954711; cv=none; b=BQ3G205ir5OgB3IrZGAgFu015pDimxZH2x+EX29kWI2Y05s03v4jprQ0cUX/47V8jn0ukLnIA0S7aRI6gG1MBeUT3d7Uvs24iQbCfGVqYAcjDLFf+43p/SziXSqk2cQJ5OteIZXL2ADGs6f8efJ3X6h7of9jrFij8B2QN4Nd3+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747954711; c=relaxed/simple;
	bh=Hc0JPcPl68y6C0hdcL7gbZ8AMjRkQxPCg50ZfHFH9Zw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HS9m6eZesH06Vc/0JZ+8uPLZOvEODqcv2mYB7SzxQPgqK3CwOJovvO8t4H42Teg2rGqZIww79HoPmVquM1hMdJRJGVoQrrYWxSc4m2jVfxLsDi0l4Tq18GZPVNSgaLxqjc5+0p/0ReHFu/LMSMtXXAF2vKzXg6n9X0TvsrNhpno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=FURSHTWL; arc=none smtp.client-ip=209.85.166.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="FURSHTWL"
Received: by mail-io1-f53.google.com with SMTP id ca18e2360f4ac-85b3f92c8f8so789931939f.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 15:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1747954707; x=1748559507; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LifDm7A2s/glTLRHRleF9EaeJkLoBTqPk54K6bg46PY=;
        b=FURSHTWLV58s1Xn2iH4rQQI8NFDxkL134WNpCyLPuv0Y3dS4Y2eK+n0/vr9NjrLWlV
         Sr0RVDnhpZtlM59jIA1/kFskIA+jZX07cCKh7XQngeb3EEGyNQu4eifgMtH9djPDUUzi
         FHcUQTt8HhqwINh5XgGPI1ZVMmbAArojD+Hpg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747954707; x=1748559507;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LifDm7A2s/glTLRHRleF9EaeJkLoBTqPk54K6bg46PY=;
        b=PdYJHzxh2xqVw8RuX15ujE3Uzro6ArLtuUlwauvbYK06nCJ84/MIrzllkZp2gro3li
         FqDC6OYDlumOV0xeU/8HKXJJGInkqzEufcK39dfP1dBIqB+7RAOpyNKwN8VuCNbwZN6I
         9qMlP40FoJHTc0owGuk5PnbcB6VvMOu7N8ihDSdDILSTF324TG080M1WZKzT+iJTIy1W
         BF5/bM/louUmAit8og3Xwob6M4A3LwqD9+RCwWgyGbdpQrYJCDnxzV6OEvxmyhlwGXSk
         8oKpqUY3QdUBgbaEmIc4mMEMic1shBclss3BWX7XpWy1JO/oGVV8D/fALch5K/UcSD57
         6WtA==
X-Gm-Message-State: AOJu0YyUg/SfVAMFAfUqwEgCK54YpTdE3XHdf9TKfJTPCoTLSBpLRkit
	TnF3NLR3qlqfgHorWxEAuvpYrhqlxjxTY1rYkAAMhUo3pN01u7/pRxvzg8JtcCnHgNc=
X-Gm-Gg: ASbGncvs5WONgHLfPrSElnasgjDWH4ZXrjxgYz6NK0MbzQiZT57/z4s3qqmeyO8wF/O
	p+m0FFkJAEzHmmCuAiMAElfziggZTfvBwkbPcp3+b9pcpH14b++3IYetnqNjIsgfHj6MU3fQoQj
	HRiDfO1ue+OxUDvFrRMeNz41yvRNCR2TckzP1fse9sRp0JG6LHGxyyyx+ORYC3/zffmP1bYKCJR
	gTYZfHtkBl/HEb3dx2oM5SGXsb+KkSxbfjleXRvHQr0ZKRlIO3nWbE0cxzw+pHiBkRq3fV+RgNZ
	hzh2dZ3Min7dh2HYAAdTup5IniJArxG0fQ4KZI5EjfN44ZI9Xkjgv8LhYbObEg==
X-Google-Smtp-Source: AGHT+IHAGSdQbUlxXzwcnENTVeYrRQfzTmXk0ARVU7ftTHOp+/8ZyfmjGdb4tKBcU6VK1raUF+dbew==
X-Received: by 2002:a05:6e02:b43:b0:3dc:7c44:cff9 with SMTP id e9e14a558f8ab-3dc7c44db95mr143962145ab.8.1747954707464;
        Thu, 22 May 2025 15:58:27 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4fbcc4ea4d3sm3384858173.134.2025.05.22.15.58.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 15:58:26 -0700 (PDT)
Message-ID: <a0f5b68d-e321-4ed3-a22c-24f80f4d906f@linuxfoundation.org>
Date: Thu, 22 May 2025 16:58:26 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: ABI: Fix "diasble" to "disable"
To: Sumanth Gavini <sumanth.gavini@yahoo.com>
Cc: linux-kernel@vger.kernel.org
References: <20250517091814.1263768-1-sumanth.gavini.ref@yahoo.com>
 <20250517091814.1263768-1-sumanth.gavini@yahoo.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250517091814.1263768-1-sumanth.gavini@yahoo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/17/25 03:18, Sumanth Gavini wrote:
>   Fix misspelling reported by codespell
> 
> Signed-off-by: Sumanth Gavini <sumanth.gavini@yahoo.com>
> ---
>   Documentation/ABI/testing/sysfs-devices-power | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-devices-power b/Documentation/ABI/testing/sysfs-devices-power
> index 54195530e97a..d3da88b26a53 100644
> --- a/Documentation/ABI/testing/sysfs-devices-power
> +++ b/Documentation/ABI/testing/sysfs-devices-power
> @@ -56,7 +56,7 @@ Date:		January 2009
>   Contact:	Rafael J. Wysocki <rjw@rjwysocki.net>
>   Description:
>   		The /sys/devices/.../async attribute allows the user space to
> -		enable or diasble the device's suspend and resume callbacks to
> +		enable or disable the device's suspend and resume callbacks to
>   		be executed asynchronously (ie. in separate threads, in parallel
>   		with the main suspend/resume thread) during system-wide power
>   		transitions (eg. suspend to RAM, hibernation).

cc linux-pm, documentation list and PM maintainers on this patch. Looks like
get_maintainers.pl doesn't give you the complete list.

thanks,
-- Shuah
