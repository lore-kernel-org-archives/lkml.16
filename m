Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD2AD261564;
	Tue, 11 Feb 2025 17:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739296433; cv=none; b=aZati1S3Dj30Nt83j6mp0vA1HdgISS2bBbYpzLwFPoc6hXj3A7D7sbrYFtoqgwj6a0gl1ZpvLUbsX7dbsTH8b32Vpi449NrgQ91zJIIU9Oqn4EzwA9yh5rCbSn7lhlJaT6/9rnnGRv66jPYF6vhSFu84zK8oYLAL3g2VNT2qVfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739296433; c=relaxed/simple;
	bh=rt0Gef4TnDtQk7JAlFpOz9to8HGKq0GwmS+KV8x9Hrs=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=Wd2tEg06Wh//yAdKtE3xGzQXyaC4WuNU4ase7ug3bZktBQJD+6oxEG41dVHs0qTfj1qURImWZUatXkuGtMPJ/WTod7B/YmZkv+NfO+rfklNU55co5adEGBvPvhlXADyInv0C5uBrRVAb5lDYprBfTzrnTYiiN4qczqVP9Naykxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H8Fr9V7G; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H8Fr9V7G"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6f9c6d147edso31555597b3.3;
        Tue, 11 Feb 2025 09:53:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739296431; x=1739901231; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vbOCYeStl6BHQvZou7tuoNC9oWGGMmKxWp+c7w+iGIo=;
        b=H8Fr9V7G8nZEk37WYDRRepxhR8EyvuxXJflS0WG0ESHvFsLt97oPTCQCMdepmkEGUG
         PAjABVkfe/QCq8qsXr7t0QR40ex1eOSxfmCTmMB18HKzHQPXAA9FJoTpkxvw01VMiPoH
         nvrrlaGEhDWsSauyDnILW/cKx8I6cVXk0MD6slyrob3Ic9q84+qWQTzz6XzUKgiXg1Si
         HsNdPIXkM5o6wN5EwS8TqW4qZtrIDTBWUFn86ApMsHGgPbWOTkU4M+lJ2WYqVlAsQ3F6
         1sZ6lAMUMBVp0r8YTLgU1PjGRxKyI0tXnXDWToJxju2MHGqngka5CYPDVtct2FRtVEFJ
         nuaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739296431; x=1739901231;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vbOCYeStl6BHQvZou7tuoNC9oWGGMmKxWp+c7w+iGIo=;
        b=S1t5+RBAKk7PZ1JcWPa9PZP/POnsojewklrtXIdVqlef0Zmy15cLRBHdapLrKa9lQe
         5uStCa/tae0HkL3icQhFwKzkc6UMypcPb4uqt8BN3sXGwnI8toufUh5MJoPTgnHKM4+I
         TsfyFYwGKiMb1fTqrHBDoFUPlvVkULtoJC4efbG7EWqA7tDhMNYpfsDUjHOYYOD5uTG2
         pu2nHt7VNR3VJtqOafKnIdznUfoG+1WsPle53zkeiWsDie9Jqd/jBoRf0lensX9R66hN
         FJPWmdSUgpgX7g7XIZ7cH7udLmLPl4ju16a9CATX3/2Gt4zB6bk8m1LA0J0zMl4zoGHN
         zAiw==
X-Forwarded-Encrypted: i=1; AJvYcCXgRc/we/8wswvS6rkadNrDEnwLpZfAjp6e8JPWEtc7U2H+WH8pWvXPZ2h+XBd7TknljruHma4Oo4wcFbE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yykwj2gWEMbrRS099gVUHiwKZdG8IxYhV33f87YhngwirI4CqgO
	ZK76aDgkcgWmcSiB2IPlgtqUupFEK6cLLhs2Hbi1KCQmgDOyW+G8
X-Gm-Gg: ASbGncuwFml6tOhrd7WIYSVOPUs1rHzK16m/1icuMYTarT80H6MSk7xmdEYYM702YyA
	I6wCXd0ksCMDoMgFrGb9g4PUzeoLpVsvCf+DnAowEgrLSFDoBL8a2UuyJVaQjSwIg0UdRyibDN7
	R0qth/aaxEkRDUvhueDoW0to59I0+v68mib8bcpGcW1FDHmKIYiIP0ejj/zgyGRo6+751lFLrse
	H6QWDz4ehYgq684MmpWXFhAJdkUAgcmM2/aKohnoQXKcB3wcbGfJYfHWdWvHMdfTkZIp15d5l40
	+5FaSiq0
X-Google-Smtp-Source: AGHT+IGDSoVNRbQPz007PS0sRL4EVQ5MKfKukYuKpRw1EvyR+A+fYaI8q6AJb+UQgT9Yo+15wFX5Vw==
X-Received: by 2002:a05:690c:a86:b0:6ef:8122:282f with SMTP id 00721157ae682-6fb1f286688mr4779367b3.24.1739296430640;
        Tue, 11 Feb 2025 09:53:50 -0800 (PST)
Received: from localhost ([2800:bf0:61:1288:72d5:e7e1:d832:2e3d])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6f99fd1bb65sm22530837b3.29.2025.02.11.09.53.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 09:53:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 11 Feb 2025 12:53:48 -0500
Message-Id: <D7PT4KOCJTP4.2LJWH5X14M2D3@gmail.com>
Subject: Re: [PATCH v10 10/14] platform/x86: Add alienware-wmi.h
From: "Kurt Borja" <kuurtb@gmail.com>
To: "Andy Shevchenko" <andriy.shevchenko@intel.com>
Cc: <platform-driver-x86@vger.kernel.org>, =?utf-8?q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>, "Armin Wolf" <W_Armin@gmx.de>, "Mario
 Limonciello" <mario.limonciello@amd.com>, "Hans de Goede"
 <hdegoede@redhat.com>, <Dell.Client.Kernel@dell.com>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250207154610.13675-1-kuurtb@gmail.com>
 <20250207154610.13675-11-kuurtb@gmail.com>
 <Z6t-msAAi1lVHzN9@black.fi.intel.com>
In-Reply-To: <Z6t-msAAi1lVHzN9@black.fi.intel.com>

On Tue Feb 11, 2025 at 11:45 AM -05, Andy Shevchenko wrote:
> On Fri, Feb 07, 2025 at 10:46:06AM -0500, Kurt Borja wrote:
>> Add a header file for alienware-wmi with shared resources to support the
>> upcoming file split.
>
> ...
>
>>  static const struct attribute_group *alienfx_groups[] =3D {
>>  	&zone_attribute_group,
>> -	&hdmi_attribute_group,
>> -	&amplifier_attribute_group,
>> -	&deepsleep_attribute_group,
>> +	WMAX_DEV_GROUPS
>>  	NULL
>
> I don't like this change as it makes code harder to understand (at one gl=
ance
> you can't answer the question "what are the groups that being listed here=
?".
>
>>  };
>
> ...
>
>> +#include <linux/leds.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/wmi.h>
>
> This should follow IWYU principle, now it looks like random stuff which t=
his
> header does *not* use.

I will check these.

--=20
 ~ Kurt


