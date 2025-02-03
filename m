Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD01D20408E;
	Mon,  3 Feb 2025 12:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738584386; cv=none; b=AjweHLFpg9V5TgFZdC/NKa8WA7rSFXP/nlaHy+xc+fzmpfpv0NwlpP7XnrVZftYfGOnoNEQ9ti/uzkiZ2rispaJw4QIepAcsQTVQnCbEJ8xIuFIsPHrcIRgDxhvb9SrhdrLb1c6K9UfbofwDC01MuxeUpB1Zt+aPnSybiYh1rF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738584386; c=relaxed/simple;
	bh=UC77tBUYihm4TJLMVPQovLMUNJxXgwJzQKpQoC5pMLM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=CunkGOvvp0xElej8mhwgBByaTKAXiXK+qW/RUgJEZWTyDJulmJeXO1Dndljzo+j8yZjh5rGw4vmaYr+wLMVqQgjjaxkrCsAJwh8fmNq0u18qBFszo9jv4nH8TEHwjXbw1sB76YSH8fvcxUOfOIGDLafzs8osWUAzpU9TAxlo2rM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AjIby00O; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AjIby00O"
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-4b24bc0cc65so2570813137.2;
        Mon, 03 Feb 2025 04:06:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738584383; x=1739189183; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WBks1p3HuaanKAv1MelJvhkgBAnNTXer0epgh2CDHxI=;
        b=AjIby00O3DWO8ljUes8ecRK5YPFrRuKlWWBztW8PGScjsrbWqnIZDbrTjSbYB0vYdM
         1GYwUg7rr0lDdk4VjSyvcE2ZUK74jVyOoNoLAd6G1hMuVRbTYNj4GoWj1g3sblSNkuie
         r0WSPoO2WH+aNZA82nl8ApEzbyG9C/oaGHqOs8EQjSYEOH3FbtN9LLAm4KP6x7W+ke+n
         t3953pYP/zfXLaoFjgpXBiNJec94Q30foMADHen6zHjD/b4Ldt4JECoXq+5sgShIX/fi
         UG5H9Gdi+EBH2+zDck9W2sfC8auGM7vGc0EwzaoublI9rNahqFZacbIZf861jWiwdkic
         rh7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738584383; x=1739189183;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WBks1p3HuaanKAv1MelJvhkgBAnNTXer0epgh2CDHxI=;
        b=ALmhQgL1WjHxS33WY20vxYaBD2ilkreSUfGe0OO8BkPq0ua3NL6zwFpEsyokiqpKQ8
         IYWgd3SEhseE0+indf6Mw93KFu5+W4bUct5aJqiNUJF4M3X/v8rqjkyHK7zVX1u38SW3
         i8Vq6dLmFp6rQf4pRq5UTRpFFiZuqZzgrPM9K92auJ2X4Vbd1ivv7mgoLNv53cT20NDM
         X0AFxPWKFLJI3jYVtOwONBQ/4mZFd7gwfET9DQ6E+Ps97MEBC7ZTyKPhjpYmdiGCSRza
         /acgeuLLqt96XEgoF8pJN7PVXGMOqqjhbe6JkmB1tjxuAxeHaoljRhLlXBdentJtGJ+7
         moLA==
X-Forwarded-Encrypted: i=1; AJvYcCXuRfK12TZrGJBFlimltQOu+lizTw9VFsLRZ46zB2FwACDjIjjKfSvbinSRo83hYSXv82qRNfFU4UZb7jc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQO64tP6ZHIY5US8vH/UCOuH/THvmxAQLRJTJ5lNCqzDdrcT5O
	aqsYsrYOA5Y6+FfPUZTpJyqVBcQDhbu8Dg/f4uJyGDOkIeqGnibM
X-Gm-Gg: ASbGnctVQpqhCgVegCUHX6DJOj6mHRXvSKvyi2EpNt4vwWmKzr7DS6UPu2S7RO4x5+q
	8WyzjmC8S6ZsT6SvXjY1WLwi0IDyz7x96fo5HtKLB/RiTjkn9oCjpzKNH17r+zHu7uD83AbMOde
	ID+PDjhCG8AcN1zdR68YPo8QINSC6Dr0h7m6agpR4xfIM+3opJ77ikpnDnuf6QoJ2s/9pjLZ0xX
	dSove1kLBSEDhcyvqv11xOMh2eQl+CKC40NvCkTrF8hql5j+7r7IOokHosgT35kUJcGt3WDFJ9c
	+Ssi9Rc=
X-Google-Smtp-Source: AGHT+IH8/wKo00/Hi7bQTDQs8iUPuASkIx3fb/hoNgFGGzkm+7nY5GlPIULdOyaZwdrbZTGjrrfUzw==
X-Received: by 2002:a05:6102:8087:b0:4af:b94a:3c3e with SMTP id ada2fe7eead31-4b9a4ecbdb2mr14156169137.5.1738584382371;
        Mon, 03 Feb 2025 04:06:22 -0800 (PST)
Received: from localhost ([2800:bf0:82:3d2:4207:a956:ebad:2a64])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b9baccb0d0sm1533080137.24.2025.02.03.04.06.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 04:06:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 03 Feb 2025 07:06:19 -0500
Message-Id: <D7ISQ5PQLOLR.2P6D3M7W54PA3@gmail.com>
Subject: Re: [PATCH v7 00/14] platform/x86: alienware-wmi driver rework
From: "Kurt Borja" <kuurtb@gmail.com>
To: =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: <platform-driver-x86@vger.kernel.org>, "Armin Wolf" <W_Armin@gmx.de>,
 "Mario Limonciello" <mario.limonciello@amd.com>, "Hans de Goede"
 <hdegoede@redhat.com>, <Dell.Client.Kernel@dell.com>, "LKML"
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250203062055.2915-1-kuurtb@gmail.com>
 <c6e10cdd-6fba-6e8b-0913-66766cb9248e@linux.intel.com>
In-Reply-To: <c6e10cdd-6fba-6e8b-0913-66766cb9248e@linux.intel.com>

On Mon Feb 3, 2025 at 4:20 AM -05, Ilpo J=C3=A4rvinen wrote:
> On Mon, 3 Feb 2025, Kurt Borja wrote:
>
>> Hi!
>>
>> I bring some last minute modifications.
>>=20
>> I found commit
>>=20
>> 	8d8fc146dd7a ("nvmem: core: switch to use device_add_groups()")
>>=20
>> which states that it's unnecesary to call device_remove_groups() when
>> the device is removed, so I dropped it to simplify things.
>
> Hi Kurt,

Hi Ilpo,

>
>> I also found commit
>>=20
>> 	957961b6dcc8 ("hwmon: (oxp-sensors) Move tt_toggle attribute to dev_gro=
ups")
>>=20
>> which states that no driver should add sysfs groups while probing the
>> device as it races with userspace, so I re-added PROBE_FORCE_SYNCHRONOUS
>> to the platform driver, so groups are added only after the device has
>> finished probing.
>>
>> I'm not 100% sure that the second commit message applies here, but it is
>> revd-by Greg K-H so I added it just in case.
>
> Which is why .dev_groups should be used as it is able to avoid those=20
> races on driver core level.

In previous discussions with Armin we agreed it made more sense to move
WMAX-only groups from alienware-wmi-base.c to alienware-wmi-wmax.c when
splitting.

I have no problem in moving them back to .dev_groups though.

>
> Why you call device_add_groups() at all? Can't you just insert it into=20
> .dev_groups member in alienware_wmax_wmi_driver?

I'd love to do this as it would simplify things a LOT, but some
user-space tools might expect this attributes to be exposed by the
"fake" platform device located at

/sys/devices/platform/alienware-wmi

If it were not for this, I would expose every attribute in the WMI
device.

~ Kurt

