Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB71C1F9EB9
	for <linux-kernel@vger.kernel.org>; Sun,  2 Feb 2025 14:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738506493; cv=none; b=tAb9A/uH8qURhqHcK0PIvJQr1Q524UEZnMH4kjfBiDLTKzmt9dRAIb6pk2sqHdkFT04IFSQZtTGjCnOpY60xxx6twwAH1S3EwNYhp+QJLvFqo6gjTWok0oPpzfOPENzLxQNCCbj17CR+ZOD8CZTgdL+P1RGGEz2LO6uY+sNz1kY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738506493; c=relaxed/simple;
	bh=vyjwJ0cfsI76VSZJ7zxCnm+mRZiP8T0erE8fSRPtUXk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b9WeXUR4MJVygp0dx0FpIndWHYtKB7+SUE9qnS7Lm4tx0jWkJB1VBb+6nlVEdd9Oil/jyb/r6yhBd5zDylj0T3zT6+be8yAOOYBp9OHkrOcGiIoffrlTETj1kqXCUXj0d/ym+1nOCrD+22adbxuUfmW3l2o6dR+aS/eEIzfrPHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bZKwsjEL; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bZKwsjEL"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2163b0c09afso59555575ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 02 Feb 2025 06:28:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738506491; x=1739111291; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=/I6rSMAKEl7cAPHfSJ/klXATUxOewzlsZpepTuhR4cc=;
        b=bZKwsjELuFJWZmn90AQH3Z+xUqYA5IEtOf9SqHirCAX0m6xsDq3uZg21MOzvSEZd93
         YCNcVx9+nBirlOyQUrZ+gHqNcrvrm16BwITXOcS+k0HYUTJTtI0e/+fpKyVTf1gZT+dF
         DcglIyZ5ynDS3XulaXOx6bE33jfvQbRWMJZE+VWAzHIsjeGfgOTU6zoprm2eub3WbJ8K
         3iiUmYMsfjCY8HOOMYgJDO3Xv01hNbHjOnzuqRlUWhIpZegewX3D7O12FtDLNW84fye2
         GCR0VtV72Hj1m52vPSQSUZBxXwRHjsnIkbNWRoEe2sxVQOjR9UOk6JlGaODM+UZ1SwgZ
         +MUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738506491; x=1739111291;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/I6rSMAKEl7cAPHfSJ/klXATUxOewzlsZpepTuhR4cc=;
        b=XRj/fTfeSQaTMdC4E5Dy3cY67ocQLt/BLsk6TEKW79dnnUdKEZnVIkO/CYbskgL8Qp
         AUDHSufkaNALG6fL+HoeBo3OuRAwCuEbnjlzuA67mqYxRDPT+SGmN2ortpWm74TuR2P2
         TgP/XEJQXn4BEjd3zJ/pox2/3Qk/TnZYFWug0IxHE9zuNpH/aANcuICn10CI+K45hTmw
         WknyCzqeZKkDZP94kJ+/QhE0gqECvmVqERan1p94UN0ihOKfmrVGEhveoz7UnQA0nC6I
         tgrYRiOQMOuYuVqEeYODVJpD1toO36BGM6WpY6FG8863YiOnfjbRGnukpyU/ECF+Y79p
         VdmQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpnhEpoqe/2coeRpWKOLwDotLqXU+z20bqVonYJJFoL1MMo/AVEF1ubeikLwkxXNSc5fIakK+eTgopL9Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YxsAB8I4152z4CZliaYCXYNNfzgj04v4T6mYfQJyYhMPs1rpdLK
	UWGtx5RtCFIMY1RXKGSPQu47x+5wsZLqAz6wSO43BAWwJPNg6bcZ
X-Gm-Gg: ASbGncuuOgxC8CAFEPWqoLHbd1BvwpvXOm+W2q8/ba7VcHUcpR/HvYLADyYguRNyEwE
	8f+31tBWynYF5ZufTw8UeGQOM3BBX0nlMtMKLy5pEyGr1rXj9xCdrds55ETCGcxr1qpVPV2Hrn2
	+y5i4IDe+jHj3knoA+tB49AtI/p0DObUMYy5mSI/9Xev+l8v2a+3ZW4CgNDya5henk87n/wvp2T
	NxpljGiEURG5G/eFvZVvLISC9lZI8536Dn6DdW6kIRdlCX9dw5x/fbuT0NS0qhOHOPcWuhYbFcE
	90pJE2Pck/RsFh5YUJws/58zE1LfsBhi1HUw+DhWCJnAqOManGCI9SkyZGMWS6xo
X-Google-Smtp-Source: AGHT+IHACnzm1wEujooiBkXO9oiLminIt0LT5rD6xhd8TufkGNtfudg03xLfdwCdTzGjXHR/S9DqPw==
X-Received: by 2002:a17:902:ea12:b0:215:9a73:6c45 with SMTP id d9443c01a7336-21dd7d6e17bmr283864935ad.22.1738506490906;
        Sun, 02 Feb 2025 06:28:10 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f83bd0ce4dsm9458541a91.27.2025.02.02.06.28.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Feb 2025 06:28:10 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <27c1243c-15e8-4c24-a0a4-cc433000ad38@roeck-us.net>
Date: Sun, 2 Feb 2025 06:28:08 -0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/i915/backlight: Return immediately when scale()
 finds invalid parameters
To: David Laight <david.laight.linux@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20250121145203.2851237-1-linux@roeck-us.net>
 <Z5AmlJ8stVQ4L5jS@intel.com>
 <CAHk-=wix3Rgt+8yBHDdeb_F+c8TzL5aidtCiUEpF+TBc6SCLiQ@mail.gmail.com>
 <20250202132709.3ab54376@pumpkin>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250202132709.3ab54376@pumpkin>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/2/25 05:27, David Laight wrote:
> On Tue, 21 Jan 2025 15:15:09 -0800
> Linus Torvalds <torvalds@linux-foundation.org> wrote:
> 
>> On Tue, 21 Jan 2025 at 14:59, Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
>>>
>>> I'm pushing this soon to drm-intel-next, unless Linus want to take
>>> this one directly to his tree
>>
>> Let's just go through the proper channels and go through the drm tree.
>>
>> Unless I've issed something, I think this is only an active issue on
>> parisc (and only with certain compiler versions at that), so it isn't
>> some super-urgent thing that needs to be expedited.
> 
> It probably wants pushing into rc-2.
> The build bot is complaining again.
> 

The patch didn't make it into linux-next (as of next-20250131).
I assume it either got lost or it was dropped for some reason.

Guenter

