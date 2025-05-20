Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B1632505D8
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 14:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747750595; cv=none; b=VrW2rzdXYjZXfnCAlYIWR2jKkraFcGiGugRuhKGoDG0TBY29mkq2h33bE09Xo90G4AWCE6723rAYnwc4S/WH7QWiu2VeVSeIu9eKd+s0G8iWL+AMBczaq0iCkVG7XxT7T+6TyCuj+rJ92GPTtdMI+vwuB9ZX0Tu27aCMABmwzww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747750595; c=relaxed/simple;
	bh=SoMXZh2D0KD4V8N0v5ERJAEktD/6QD/dGnWO0/MEBqg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=HqPKYbL2oCtvbfMBb76kjhmt+lq2Y3AwjUNnPZ7D/J9dRTwEQ+JaRH7bbIUH8ndpq8TDPG35RAINOmn5zKvRv8y/cACvcBPoGDCt6W/VVGbbIrgmQjGYS/oEfHEMKLFEUOztP13isbXN25/E6LEX5PwDYDf8Mt+ZuU4DuxAwwxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=duUtg9kT; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="duUtg9kT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747750593;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=61iPeRzvAixq/R6SwHKeq0ei0vc55YLY4T4B2HYFAlE=;
	b=duUtg9kT+GZ/BbU8euQIK48OKF3qIBXJBMJ7TP9d/uMhw7pW9/GwX/gvt3MyRBC082ytcx
	8mavr2CfZaYgnUBEm+RrLA4J4yaX71u9TyfeaUQCM6GHR4g4JvupDEKsEkzvOuCuPyEGYJ
	QRpVJ8iEQD0AFNsJ0d/jj9ZBV37SRIg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-203-sHURQEXWO4O4hsaO_LR3UA-1; Tue, 20 May 2025 10:16:30 -0400
X-MC-Unique: sHURQEXWO4O4hsaO_LR3UA-1
X-Mimecast-MFC-AGG-ID: sHURQEXWO4O4hsaO_LR3UA_1747750590
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a362939f61so2051651f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 07:16:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747750589; x=1748355389;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=61iPeRzvAixq/R6SwHKeq0ei0vc55YLY4T4B2HYFAlE=;
        b=Dw0ygsB4Um92NDoJZfPeDCLckhKkTko8vy1g7nk+uaMj2g0KX4Nw38G6fFKvtylIKs
         rnBqqoheK1EpKoJJHjtKMvI/bv4BHbUSeWnmCzg145/y+OETB6GEEQTRdxdKHAY35p2V
         I261h/WcP4mMnsqmTaVuT8MZnLYB/5RRxixLw5osqZCMhgm4QzmU6PAarJjrGEo4dqqJ
         hiARItgs4FQyRLYBuZgavl+19uxeIJBpA4IpWnjPlXfZaTAn6dFgRvpEXAQZz8LALE0j
         9e0ozK/uJqVBWvIlta8MbP7985ydAsfpXGRtNBhJjO0/Qu+UH6mMDkhRfPEaWreo6pqR
         +IyA==
X-Forwarded-Encrypted: i=1; AJvYcCXKWZ6f+JXVTKv7zDJ1FBanvPn4F3zr2C7YfJ1YJTMxssWDwjZvP0tzer7VqSWdx5IweN4+0v7sr7fvRi0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwlQfDYOY5TJSoB7to88Ag9J7HGHV6wdpHtD95G9zMDi6e9iu3n
	/vh+KYXih1Gvym8Yc7Yowt/HnvNue2PTXkzHdxvw50w/TTNzCZkr/kf0T61g8uLHVYnpTm/NFMr
	UuJBcWbaPu1+2/SkNgI6nTUXfjoTaSQhgS6u2AuZYskmiXyv67OpqX308BPPon8gVTQ==
X-Gm-Gg: ASbGncsWpSAkvcdcAj5m7P7L8ACmXCJRnn/16eFWBLVkMfC8YT4q8utAdB+gNphctS+
	+5m4zycXEnCqOEIgSASSTXj5l4CFAwp0CWzPDim9JOLcMbceLL5+b9rql2OFGDLgp4SHK0SPfZ1
	D4F5jmcR1wfLqq5iJDinqSu0pyEPXX0yxRPSdKgnerWHckN2En5AGD1EmRhNkdeHWVSSZytVm1A
	hBaydOtDYOtKm2K4FOmICSNUeW36KwnEl9lrUG3K4RZsYH1pztuYf+7U5qOz8acSW/sgWTywQmi
	0rOuTbg2A1I8yII5nXnW98GjhsGpcOb3ovBQ96QQ/dlpEPGw9vo07bQ1CjZ57gP4GQWrzQ==
X-Received: by 2002:a05:6000:430d:b0:3a1:fed3:7108 with SMTP id ffacd0b85a97d-3a3600da40fmr14525830f8f.40.1747750589614;
        Tue, 20 May 2025 07:16:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHrGDGNPueP8M5oY1rssyDAAoA7kWAMi94I273UUlkBQWltVoKwRePTOwwFy/ypnlP9yt8vbw==
X-Received: by 2002:a05:6000:430d:b0:3a1:fed3:7108 with SMTP id ffacd0b85a97d-3a3600da40fmr14525794f8f.40.1747750589210;
        Tue, 20 May 2025 07:16:29 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca6254bsm16931304f8f.52.2025.05.20.07.16.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 07:16:28 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Geert Uytterhoeven
 <geert@linux-m68k.org>
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/sitronix: Fix broken backwards-compatibility layer
In-Reply-To: <990c04a5-6477-42c0-986d-9b63a30ac90b@suse.de>
References: <1682cd80989f9ab98a7a9910a086a3a4d9769cc6.1747744752.git.geert+renesas@glider.be>
 <07088966-73f4-4b5d-898d-b596dede53e4@suse.de>
 <CAMuHMdU6XD_tqXaf4-h9KeC58XDOodUWa0d-Wmp6zcr2BHTA1w@mail.gmail.com>
 <990c04a5-6477-42c0-986d-9b63a30ac90b@suse.de>
Date: Tue, 20 May 2025 16:16:27 +0200
Message-ID: <87plg3nz9g.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Hi
>
> Am 20.05.25 um 15:09 schrieb Geert Uytterhoeven:
>> Hi Thomas,
>>
>> On Tue, 20 May 2025 at 15:04, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>>> Am 20.05.25 um 14:40 schrieb Geert Uytterhoeven:
>>>> When moving the Sitronix DRM drivers and renaming their Kconfig symbols,
>>>> the old symbols were kept, aiming to provide a seamless migration path
>>>> when running "make olddefconfig" or "make oldconfig".
>>>>
>>>> However, the old compatibility symbols are not visible.  Hence unless
>>>> they are selected by another symbol (which they are not), they can never
>>>> be enabled, and no backwards compatibility is provided.
>>>>
>>>> Fix this by making them visible, and inverting the selection logic.
>>>> Add comments to make it clear why there are two symbols with the same
>>>> description.
>>> These symbols were only meant for variants of 'make oldconfig' to pick
>>> up th enew symbols. They where never for being selected manually.
>> But that pick-up does not work, unfortunately...
>> (I know, I had one of them enabled in one of my configs ;-)
>
> I see.
>
>>
>> The alternative is to just drop the old symbols, and ignore current users.
>> Which is not that uncommon...
>
> If there's no easy fix for the current setup, I'd prefer removing the 
> old symbols.
>

I agree. When this was discussed, I argued that we should just remove the
old symbols and let kernel packagers to deal with it. As Geert said, it's
not uncommon for Kconfig symbols names to change over time...

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

