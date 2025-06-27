Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D73C5223DEE
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 20:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751056368; cv=none; b=nT/0q+lTyZg+ClXIxjFcRpnGwU44C3PsNLymrRpkxCWgh+7q4FaBkZZnFzGlc4FoGX5Jre3zpUdlUy3D4alclwRVmpQYW0udRTRqeNvKct6kFT6UMOBiuti5LKe7vVomLAgxM5sum5qbF74utcu1YyhjWsgXqJUvjDF4j3wY8jY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751056368; c=relaxed/simple;
	bh=IDPrpIyVvRgSr2ZbdswIDGez7eFpJld3p2kUMrb9wuE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r9EPsOjrLD7tu3XpM8C88mrsnYopoyc3INc/vc38jfWu+VVy3RIHEiN8SmmGOydkLWN/bIZHh89eZdlxW0xK8DVNsLMSS8ZO2EwzQTB0evzLi45ZPPwN0kHcH1DwXtKumj+yaCrES58NUraeAHYFx9nDFqiHwsZbO+2XG2bz0R4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=U0p0qXbq; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="U0p0qXbq"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-72c27166ab3so208097a34.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 13:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751056365; x=1751661165; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fxxJVAuITfeFuKBhm74QOGA6/KTq2RtogFp6PLr2NWA=;
        b=U0p0qXbqjAER1E7atJ7/2ngWu6V8O8dyTdM2AjQx83YQ/lkkd6SLIXQkej6CQqHKDG
         GoGH5mBL2LCC6RSa7BZVJ4rAufiif4z+34psdHjuSBZedP2n5KrarBhiymBSbbKERcvY
         p8j6DWDjaI1KAIVbeYpENYBMlKXxSWpuq+PTp2sxUPYH3K3glK52Mp0ayynGa40ZxyaF
         Xet6rvKa1ZbR41mzxGXGvervcz2RTPEH/nyPIsuNr1RvwQXzWjU2Idk0AzDbBw7a8U/d
         Fd1ykWW27uFPTCRqkClt0qGjUX8seHN2uYCLzcxMCegySBHONDTHm3rUd657epIVkrCf
         hahA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751056365; x=1751661165;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fxxJVAuITfeFuKBhm74QOGA6/KTq2RtogFp6PLr2NWA=;
        b=s0z2t47rTyU7O4L1aQkU3sf4333BpZwfhBcPXERa1r+BFwLPXq8lv3mdRJtX5n3dGg
         zdOrTZXQ/7bSQUw0v4xEXJGQRJJ//olSDsnyu6z9pnQ+FYvyOTy47W5MJdq6brkiW1Fw
         R03Yq+UV17UOiZJj3RujdsceV6874YvTu1iA898HSSoB4h0JVXghuN+R4Kn9sXI4Fyy7
         sPMdaaXdJSSEBw+EWvAiq+9vZkv4Xmzl01f1UEP4xCVFBZH6P8W4SAgyDMvvTMovh37v
         paJgwQUrwdTuVjPy4Xyc2Y+DoXwVKKxb/Vl6uKTkkZM1AuSSOh1gxn7gwGMFS/ie8j7a
         Oupg==
X-Forwarded-Encrypted: i=1; AJvYcCXJTJ/ErmYwrtHaue6onsk/+s9FGg4pJmG9B2P06SMIyqHuYqQoZUixxJ2CABKT5JlvXMi3aTF4IcWbR7k=@vger.kernel.org
X-Gm-Message-State: AOJu0YxuTHf4wQQOpx/pfSqvMLQJC3at+qiAgmeRYFeXSEqYkGvSjik9
	0tVYX7sC2sbc3LucKe0dcfs8HiRJ/HKAQAdQvMOqqVT5vevwglwlcNbgNq5zTW/Ir9U=
X-Gm-Gg: ASbGnctI8s6MtuFPTKqQUp2zZ1usuHSXgZ2MNQ4axHLYrZsbIk+Wm3ZBKnPYFKkgIQt
	U8Zov00exqd+Nm+2tbfaxR/mBPOb4HnyTDvwzZOABURmRt9zVRmeYHNkoH0BmH0F2KukI+fPek3
	H0Rp938n7EHoNa0U0hzbKq0TZluwpVYQUkhqFPLUe5uSqGlFLgV28gJzm602fJX57HN7FEeddc5
	qw2RlUBo9Sxomu4UTWQWKbPsL8Gjkb7RiW5RTEFWkD0cgPHcj9H5guB0XON6xKOttYCe9bg3MX1
	tAr8gjUil2eXQIm6Fp3bNhbSFm26Xo3EyWX+CF+ukiTNAPWtk+7fpNDc23KW4C202JKAHJuOaCr
	TWLsEnhhTQJ8ph1jk2zsb21sIf0JamjwdXywwMi3JKaqANMo=
X-Google-Smtp-Source: AGHT+IGWKYpvpagCApwnJlXX3gZzQRWpYwcRUEZj3b9BUxUrQ3Di96C9uBw6U2LmMWpj7SyRsppMow==
X-Received: by 2002:a05:6830:358f:b0:72b:93a0:706e with SMTP id 46e09a7af769-73afc5fc0e1mr2924527a34.23.1751056364922;
        Fri, 27 Jun 2025 13:32:44 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:1715:453e:e133:7d6? ([2600:8803:e7e4:1d00:1715:453e:e133:7d6])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73afb100941sm499701a34.47.2025.06.27.13.32.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 13:32:44 -0700 (PDT)
Message-ID: <364b2846-e299-4be5-aadf-0668445c715d@baylibre.com>
Date: Fri, 27 Jun 2025 15:32:43 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drivers: staging: iio: frequency: ad9832.h: Fixed TODO
 note.
To: Abdalla Ahmad <Abdalla.Ahmad@sesame.org.jo>,
 Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Gabriel Shahrouzi <gshahrouzi@gmail.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>,
 "open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>
References: <20250627175114.548076-1-abdalla.ahmad@sesame.org.jo>
 <aF7kW6xRxRb0VN5H@smile.fi.intel.com>
 <AM9PR08MB6114261F0CA8CD89EC443E59A145A@AM9PR08MB6114.eurprd08.prod.outlook.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <AM9PR08MB6114261F0CA8CD89EC443E59A145A@AM9PR08MB6114.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/27/25 2:29 PM, Abdalla Ahmad wrote:
> Hi

...

> 
>> Ideally this should be dropped from any global header file. If one needs
>> something like this, it can be propagated via software nodes.> Well, Including it in include/linux/iio/ made sense to me, would you please elaborate?
> 

No one uses platform data anymore. We use linux/properties.h instead to give
named properties for this sort of thing. So the right thing to do would be to
create a proper devicetree binding for the chip to define the properties and
fix up the driver so that we can move it out of staging. Then the header file
would just be deleted as part of these changes when we stop using platform
data.

If you don't care about the driver and just want the TODO to go away, then
we can just delete the comment since it is no longer applicable. It doesn't
make sense to move the header out of staging without moving the rest of the
driver out of staging at the same time.

