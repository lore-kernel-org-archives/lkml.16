Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEABE2F3650
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 09:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751619795; cv=none; b=NtHbg0gpzYAx+F/fbogUa1pjBODsBvVMouCPHlIfFQs03Lad6ih3HMLSxMgpxTM8d7hbU9Ch2Wd2KTJ7igtSps3HhosZOYHHKqAg42CiHkyCZ/fxkq7XxT5RfxAEofNGASEanLKfV84YPM/WbC27ulGR1sFx1ZYlXrZplSJV1K4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751619795; c=relaxed/simple;
	bh=uUzWrBnkFKaNbXlvQ2xhOAf3ndFwok8mFUMeM+8JcOQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oT3FIDPF+5DvO/D+NjIc1mPYHWVnU4nszxbbW8DwIPZqCIZ2MobnkzkzYlJBCPj4wgGrBDEZBpUXXtGOP7E91T1hDyZFzV3MvfgGzEvxoRSu5XcdFMo2iV/cqn8/skE13395XBihyUei/w8Yxg6WsV5ew+072qnSAJ1Av10j+74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Wvrla4Nm; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Wvrla4Nm"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-710bbd7a9e2so6424477b3.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 02:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751619792; x=1752224592; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BTFilYJNXAPNrxQ7dAl/LQhftsdOQUS9mV4AV4qlL04=;
        b=Wvrla4Nm7R5IIaHIoxQpv16Gj/+qsggTePwrC2TLxJGP8pLOgMn4y3CbrHt7dmtJwz
         IQPK+Ow+rrYHnX8qqLG3gGn/2ZCcdfYCi3E3DrJz6u0tLbccgHuos3nMjrj29AXlhWdy
         iaWtUN/FdbAnDYAPP5JD00IHJ/De2zwFj7V8yZJ7V085w9YyreCxEMooYCDpWcX33PUq
         L5oqLiJv4QUUFi9w4LPIBAO4X6k7lw3QmNx5oJzTrshOblFkAdbELhvVDEzyo4ZIcbhH
         9xgH9AERT8L1NMBmyCbWPKDvXugNKlnrfEymdLQ2MISj2r0dhTVDtJz2e2gTK+sgoQ28
         RZHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751619792; x=1752224592;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BTFilYJNXAPNrxQ7dAl/LQhftsdOQUS9mV4AV4qlL04=;
        b=JcXl3I/tApNlfqfXImGzvkXm9aG3MX7i7vJuJWpmSH2EFFQJWs2xWRcYNxEbs4ul+b
         dqRk8JgIT5FAPEPJ9vtDl3Hr7nZZS1/PDWv18MVQpd6rg5+eMc0qLEMDjxVDlzAnvOJN
         VBgVshsB3vTUWEzSqCQKerWQBcC6FtUQhCruGdKfLV089WliDkZkSxNnIlKFi5Cd5knu
         wS7erJyyWF3XJu+oig1A4cxafqkg0Z+4UtrlJoXTwe2+jI5S0eVfqcL5iwgrV0Mn5681
         mWYBr42G0IS/yaKakoB9OVmbfhHTk9h+uW6STd3mQuuYDKbqWHcyppwbllFXC9kET9CU
         cIyw==
X-Forwarded-Encrypted: i=1; AJvYcCXDZFegREa3sGoEairaf6PpV+mhpTdCvyCsmtHBGXTFCSM4gBdoPMl2RMV/tKUS129FTsKjMk6vah540fY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBcp7hhPjxRbpVN0NLU7PfAn1+5Pz5qezhMMmkBVzAC5xez3A3
	VwToZIpDsGSCUO+/Shekq10A6vd8yTDPP4KYfBGzBKJ+N7f7qYlqnTCulNWhFWInnTnJwHh/7vb
	sVkYW5w8/StM3Kj0k4w2KWATzKF0vJL0GsqpV7dcA
X-Gm-Gg: ASbGnctkr+XDs5SJA1yKvR/3eKtlMVWis0oE1tdNxapMY+AEfoJcAn4Kdq0SRpkQFQf
	vNQJgFcdd0L0jkQkWEyzvE4zvXvMfp7B4bGl25roy++WbOq3PyoN0uHad/xPeyJr/J12ZjGDbF3
	dMlu4Vc8x1C4nybUkALqXq8h3WN1tPbT9/01FSswhFi6yp
X-Google-Smtp-Source: AGHT+IGSkKvJXDwp3Qlxewac1A95jZijcHa2HWTON+RGUIumk5bR5gd04+WBy2wsJXVwGh73pzqbDoGsvMyM/CYfBqA=
X-Received: by 2002:a05:690c:386:b0:714:21c:5553 with SMTP id
 00721157ae682-7166b5d65a0mr12737017b3.3.1751619792400; Fri, 04 Jul 2025
 02:03:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250624110028.409318-1-dawidn@google.com> <aF5N5jrRUlj3SUGS@google.com>
 <CAJ_BA_CppC58kc-Uv49PSmWFcCih-ySuGDuRcO5-AWQQqcqWVQ@mail.gmail.com>
 <aGOiu-sXFj1EUQAB@google.com> <CAJ_BA_CZWvC2=i8riNe5LReLKzPXK1vPwymiG2dzLEntda7TRg@mail.gmail.com>
 <aGSuS81Psqm_Ie4N@google.com> <CAJ_BA_BQOQe61r9t9rL=UiOqpHwOoTSbQcZNe=CrCcjMha_YQg@mail.gmail.com>
 <aGZrhe8Ku7eEIRqm@google.com>
In-Reply-To: <aGZrhe8Ku7eEIRqm@google.com>
From: =?UTF-8?Q?Dawid_Nied=C5=BAwiecki?= <dawidn@google.com>
Date: Fri, 4 Jul 2025 11:03:01 +0200
X-Gm-Features: Ac12FXyja0jg_LweiVgDD_zMC00gBd5URyWe4Lg_tLXCva5kdNJ_qsJNwacpodY
Message-ID: <CAJ_BA_AMaz0GWxOHJYws95h3fRdErghqUXPBkhrB1_eYegOJ0A@mail.gmail.com>
Subject: Re: [PATCH] platform/chrome: Add ChromeOS EC USB driver
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org, chromeos-krk-upstreaming@google.com, 
	=?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>
Content-Type: text/plain; charset="UTF-8"

> We have seen a similar crash before but I didn't come out with a solution
> at that time. Could you please try [3]?
>
> [3]: https://patchwork.kernel.org/project/chrome-platform/cover/20250703113509.2511758-1-tzungbi@kernel.org/
>

Sure, I'll try the fix once it gets its final shape.

> Given that:
> - The crash you encountered is a common issue for all cros_ec_X drivers.
> - I prefer to keep cros_ec_X drivers simple and similar rather than have
>   something special (e.g. the memorized `struct cros_ec_device` in current
>   cros_ec_usb) for fixing the crash.
> Could you give [3] a try to see if it fixes the crash and also call
> cros_ec_register()/cros_ec_unregister() everytime in the probe/disconnect?

I agree that the drivers should be simple and similar as much as possible.
But to be precise, I think, it should behave in a similar way as much
as possible
(e.g. reboot EC device doesn't cause re-registering), not be implemented in the
same way. That's why I believe the current implementation of the drivers follows
the already present drivers in a better way.

The specification of a certain interface influences the driver
implementation a lot.
E.g. the SPI driver never frees the cros_ec_device struct [1], because
it is very rare
that the driver is removed and reprobed (only manual unbind/bind). I believe the
SPI device structure is constant in the system. On the other hand, the
USB device
structures are recreated every unplug/plug (reboot, sysjump etc. in
this case), so
this approach is unacceptable.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/platform/chrome/cros_ec_spi.c#n752
