Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 835D819DF9A
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 18:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738866751; cv=none; b=j20/Cyqv+bl+ObFX1aj9A1KEFFXXegqXJh9xu7C87GNU04e2rgdSa1FoIPthGRjPBfU6jwHv13CUCz59+5DdjNMspzfTDSW+Sp4ntdVIIMYgfUqyH7oexWgVmoxcQjtxQTTN5rVZulPkmHypOvuDz+KGr7pO5SuNHWmpf8HV16g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738866751; c=relaxed/simple;
	bh=TudbWSZ9hbuIUueVirbV+U/z5E1Ct/eLnAojV+h6kbQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=jqC/r8wuvFwWsf9T/tn5O+WsdNWqmAWgfcv+cvlbS2XBDuseD9i3OkzVWgDPWvtSN9LqLAE8p/YFHCWQuwSwWBiPYg2PVVFJ2oKyq/t3lPoUH3fLlIFglULDvQIN9WVJUgZF/VoubnH3yAfeKnlwlghjz5fj6NULqAEB1v3yZKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=OggGcuF1; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="OggGcuF1"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-436341f575fso15046195e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 10:32:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738866748; x=1739471548; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5bkPbVg2KC6dG7s84fE6dszhKHnTxUqxh8FlNk2DaP0=;
        b=OggGcuF1cR3RE6Q9brV2VTntRDBcz3Vl/Bym9jQZSHBTFgTirHD8kgsAk+lZXmA29J
         +G1ig4cyj/DCRUkysSjdNCn3hDVH1Pi3ltPKwvt+odOrQB1dTBgVgJ+OpEVdMRIsEH4D
         vgOfakc/X86rzy5oSxGBGDpHprnrJxWtGh2GPF3pGBk6wJ6mwGXoEEUJYMHE4zKid5JB
         HYKoD2wNlPI6vX5Du6uj/V9OLiEH+uHME6iycZFl+oziWb+4/brA/Efig/rrhAgPOMdb
         Kg6BFrj06fGrptIA6fJFVrprVZHdpEfUjmVv+UJ8gzy6D2NHIiF5v568ozGFdrxEQFkF
         gR4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738866748; x=1739471548;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5bkPbVg2KC6dG7s84fE6dszhKHnTxUqxh8FlNk2DaP0=;
        b=MWQKOKwNHe4/AWR1hqGSrpIvWrZ7kM2TL4oXJeCMTrA79qrRjoZdSfkmqPGYmVsIIS
         buC84avMZlZnzgr+nLwaPyeK1cFWzoPwO3pjAuWoEa4DdaL/i9hgC2wAySNjAvDgPRHf
         ulPYzIiuNN3F1oFxqIPbF+leXPMPq8JHYmdubEd1vp+w0ivPz1iMnls5iTCpfWDI0EGC
         EAMflCCHSTBTJfMO/bsWEUSyBxqIHmS90OF9729Gy/3WmhPKaZPC0IIP+QRpYkzOzEyl
         UW1h77YaYMnBi5KGXBqCy1EfsgsREgXC2WSGl3dvi0DZ7WeAAbRl8aamqJtefLiuV8BD
         etDw==
X-Forwarded-Encrypted: i=1; AJvYcCWTc89fiE9c1qcYahJoaIgQ9DDIVO/3jndaQjyO/DCvcA5f7In+xe+uK8cGrybqTFecyNYHY2Zwxihyk+w=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEz1YefmdidsvYtXX3laJ1Xqya6/GvneUmj49rTaIs1a8VXxEb
	eOLWc5WtKlyubpdKWyzJoYCThNO0ACVBFExLonj0LhNUR14MDjOs6m5k7NsosuEu6EC0+k144nL
	Yzxc=
X-Gm-Gg: ASbGncsgxmKV3xHf+7zcrC46Zf53/OzSI6JE8QMTNySx+1wuBBC1g+oaqF/rzs+oizX
	7FulNtm1sNbaHR2gM8/kV33/f1LojNQnqEqs3YfjjunT4mcQoL3zpky05xbGe3Ry+YmXSErmo46
	aJwlP7kX7RCjU57hC+6DVWL8te9KBdCsYxTGBw2nAT066TFsLhwsEY0eqD+xgPnP45CNTnqNzms
	6n5gYr0NHaX3eq+fRd4z5XbtMV2H2yIYYwP7M7qgF6GI0KcusDv9F8bLSoW7WA5T0Ilc6nT33Pb
	UpSbHVfqK6qriZE=
X-Google-Smtp-Source: AGHT+IHlwax+lkEEDntmPZ9rottxOZJF4fLw4TqmF3JMlQ8USMBtJyGPYyhjqiw7zqBrg2EV4Lj1LQ==
X-Received: by 2002:a05:6000:1f88:b0:38d:a948:f00c with SMTP id ffacd0b85a97d-38dc933c7b6mr29082f8f.50.1738866747614;
        Thu, 06 Feb 2025 10:32:27 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:a0d6:294f:5246:28d4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dc050d688sm1876663f8f.24.2025.02.06.10.32.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 10:32:27 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dave Ertman <david.m.ertman@intel.com>,  Ira Weiny
 <ira.weiny@intel.com>,  "Rafael J. Wysocki" <rafael@kernel.org>,  Stephen
 Boyd <sboyd@kernel.org>,  Arnd Bergmann <arnd@arndb.de>,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/7] driver core: auxiliary bus: add device creation
 helper
In-Reply-To: <20250206-aux-device-create-helper-v2-0-fa6a0f326527@baylibre.com>
	(Jerome Brunet's message of "Thu, 6 Feb 2025 19:23:10 +0100")
References: <20250206-aux-device-create-helper-v2-0-fa6a0f326527@baylibre.com>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Thu, 06 Feb 2025 19:32:26 +0100
Message-ID: <1j8qqi2abp.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu 06 Feb 2025 at 19:23, Jerome Brunet <jbrunet@baylibre.com> wrote:

> The suggestion for this change was initially discussed here: [1]
>
> This patchset adds and use a helper to create a simple auxiliary device.
> The goal is to remove boilerplate code that tends to get repeated for
> simple cases.
>
> Only the last change was tested on actual HW. The other usage of the helper
> have only been compile tested with x64_64 allmodconfig. There are many other
> simple cases of auxiliary device creation but those tend to use the
> 'container_of' trick to allocate the auxiliary device. It is possible to
> convert these drivers to use the provided helper but the conversion is
> slightly more complex.
>
> [1]: https://lore.kernel.org/linux-clk/df0a53ee859e450d84e81547099f5f36.sboyd@kernel.org

Hi Greg,

Since the examples of usage touch several subsystems, this should have
spamed a lot of people. I took the liberty to send this v2 to the same
people as the v1 only, to collect feedback on the core helper and get
this right first.

If you are fine with the change, I'll resend, spamming all the necessary
people.

>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
> Changes in v2:
> - Add usage examples, as requested.
> - Add 'id' as function parameter:  Adding the example usage showed that
>   handling IDA allocation was not appropriate and making the usage more
>   complex for simple use case.
> - Also add 'modname' as parameter: Most driver have been using
>   KBUILD_MODNAME and this actually rarely align with the driver name.
> - Link to v1: https://lore.kernel.org/r/20241210-aux-device-create-helper-v1-1-5887f4d89308@baylibre.com
>
> ---
> Jerome Brunet (7):
>       driver core: auxiliary bus: add device creation helper
>       reset: mpfs: use the auxiliary device creation helper
>       drm/bridge: ti-sn65dsi86: use the auxiliary device creation helper
>       platform: arm64: lenovo-yoga-c630: use the auxiliary device creation helper
>       clk: eyeq: use the auxiliary device creation helper
>       clk: clk-imx8mp-audiomix: use the auxiliary device creation helper
>       clk: amlogic: axg-audio: use the auxiliary reset driver - take 2
>
>  drivers/base/auxiliary.c                  |  88 +++++++++++++++++++++++
>  drivers/clk/clk-eyeq.c                    |  57 ++++-----------
>  drivers/clk/imx/clk-imx8mp-audiomix.c     |  57 ++-------------
>  drivers/clk/meson/Kconfig                 |   2 +-
>  drivers/clk/meson/axg-audio.c             | 114 ++++--------------------------
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c     |  88 +++++++----------------
>  drivers/platform/arm64/lenovo-yoga-c630.c |  43 ++---------
>  drivers/reset/reset-mpfs.c                |  53 ++------------
>  include/linux/auxiliary_bus.h             |   6 ++
>  9 files changed, 160 insertions(+), 348 deletions(-)
> ---
> base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
> change-id: 20241210-aux-device-create-helper-93141524e523
>
> Best regards,

-- 
Jerome
