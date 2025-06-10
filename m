Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C653423D281
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 15:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749568566; cv=none; b=I/9i8IdlbYP2l58VRRJwE/0SNi8YOYEkHG4OVgBFdJuLPgpcaw8+RcZV11efAYzvYaf7jzECRa26JXZWpt1fYgLW57fmi4Ksgb1W9KT4rfYlUKt2bVFdAu/6e6FgUthruptcJoZ4bjL+JQrVpu47cSHT09ZTB98PIdwinxWJYpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749568566; c=relaxed/simple;
	bh=bXZQ7o36EMz4WGW+YYGbt37kKEh0DWrz9B/gcC34k2c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UzX6oIQ6h95DJxDllxWLL1SDQx+464P+Ua+RaDl4awMrPk+PHJMSvbdPes8O1nhyW41uOOBa/xbYSa1mMuYeDXVfHnYe/k5d9d5PJ4RYLoyXUMiI4I98QkhV5QaHPPLcuMZB+ra11J/BoQOXyymCowVOb8qxz3jm5mvYqvg9zj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=AcdnXO82; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="AcdnXO82"
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-40a55314d06so269733b6e.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 08:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1749568564; x=1750173364; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Lpq9pZAYXAByb+LJPROy6HG7zgtnlujLYfg81KL91Tg=;
        b=AcdnXO82dz8krrZj6klWK1juhxGd0apYR3XkdbtvJtr5BgDxi6d4wamk4A6fqG7FLk
         top0rh02RPDPjeA96RRuZpZlJhJvL7LeJ+LJlxIUkQA5At1dYpABjfQMKKdG1XoUyNWY
         G+8MTmlsZIF8TQiubkvPI8megDT4W2kUyTTvk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749568564; x=1750173364;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Lpq9pZAYXAByb+LJPROy6HG7zgtnlujLYfg81KL91Tg=;
        b=H+IgfVc2gkAWE+TIHUjNGrPjmt9JvCv6XrkV1CGKSPJ7t4GO1WVUgPQXNxZpbQRQ8d
         N2aSsAJFJM+V4HhhSjmB5bJuRfX+R0iM2BJLvBW8ETM5kSE/vJPn5LzQ9VE6Z4qyjcPi
         RiKjsLDb2XyZMdrdIl6bsqCOb0OkZMtO9aEnbh/BTxSbB2z/Ey0nkkdRrAHFp4U435po
         SMBeL1Rt1+VU30EntjWZWU+X2BMv6LoWyKECiBaHmNwH/UyA3nyIS9IcFDv/xwBtoDGD
         m3ozHuld0WNGJVHQL+z+c/udvJYlYMYLTeI46tSmNnJqshSjEnLOcrSPbfg3o8mRXhGj
         xuig==
X-Forwarded-Encrypted: i=1; AJvYcCWU9RWAmiEZZC4VGH8tfGcZfPBPTkidkp8iNQXNlWvEQgWpAJl53S/OwfhK//KCoHIkVwZKTui5RLpW6bc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxmxO1pFot5Y0FNcBzf6Qwrdr9EXbO+Z9kPc9bA0Td36thg38bg
	bX0OCVHJNONLxVg+RLKHJK4uEqBikIBYVExpEhKhuaT+tWdk5efddGSo3qJPAA8jTjGUikUUCsc
	IuYp1
X-Gm-Gg: ASbGnctPkZmEscnJc4y3KUFAD1pnk5vDHKgXnVAZwi8042D7DDe/tKbv5hvzffnapDb
	KtKIc6tj4llZhyxdrByJKSFAQGCYQxVWcFCRNYo7En3931emGhX5g98KKvcqYjO2iO1AklJqlzv
	Ig3FhEyWekCpDqqVCDXlVAXIQ9Kq9/BXa+rEubnrpmLafpr8RLJSr/lTiOJIRApE9IGRsNTHv6t
	hQIxo6MNTC+CpX7sVoiZZOiLyzcrSV+/739oJDpGSAZQC4vugwxIxJ8xvlYiop2Lrx3tfBZtCOX
	U+Xrh5hD4nWjJ+9lLrSRJed1nZFlbngK2qZ+hUYojzSp0ViXSWKgldV1D4dPmFT58elTyULqJ0r
	xi3YBf2eKrrA=
X-Google-Smtp-Source: AGHT+IHvjKLUH4aILJb7na3KJkxtnNMmv5oRYWORhBi1NhvFUiJ7dWxHiE8oEqBuLTsqSDzZ66pK0A==
X-Received: by 2002:a05:6214:627:b0:6fa:9b1c:740b with SMTP id 6a1803df08f44-6fb0905c04cmr277414796d6.42.1749568552703;
        Tue, 10 Jun 2025 08:15:52 -0700 (PDT)
Received: from [10.212.144.179] ([12.216.155.19])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fb09b2a1b6sm67051666d6.100.2025.06.10.08.15.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 08:15:52 -0700 (PDT)
Message-ID: <1a9cea94-c198-4cc4-bd69-d36f6511a121@linuxfoundation.org>
Date: Tue, 10 Jun 2025 09:15:51 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] usbip: convert to use faux_device
To: Zongmin Zhou <min_halo@163.com>, gregkh@linuxfoundation.org,
 shuah@kernel.org
Cc: valentina.manea.m@gmail.com, i@zenithal.me, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, zhouzongmin@kylinos.cn,
 Shuah Khan <skhan@linuxfoundation.org>
References: <2a327b520760271471717fff9b222cdc34967489.1746662386.git.zhouzongmin@kylinos.cn>
 <20250604065410.76069-1-min_halo@163.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250604065410.76069-1-min_halo@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/4/25 00:54, Zongmin Zhou wrote:
> From: Zongmin Zhou <zhouzongmin@kylinos.cn>
> 
> The vhci driver does not need to create a platform device,
> it only did so because it was simple to do that in order to
> get a place in sysfs to hang some device-specific attributes.
> Now the faux device interface is more appropriate,change it
> over to use the faux bus instead.
> 
> Signed-off-by: Zongmin Zhou <zhouzongmin@kylinos.cn>
> ---
> Changes in v2:
> - don't change faux create api,just call probe on vhci_hcd_init.

I will defer the review to Greg on this.

I am fine with the change if Greg is happy with it. :)

Acked-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah
