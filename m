Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5F341E7C28
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 08:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739263642; cv=none; b=bIIilj+J8VQ5KykfWhT2KMabIAupbDmCvP8ESgeIp9u4JsAw/5+c/ErmbYruUthx4LoA5GE13NX+k4zHANCyGlrAG7QXCRAv6NHMNolkNZ56MGXdK0m8m5KBzG800/lxDWz9pzsKF0zfLUqVlRhPRf36BAtwrXiR7TZnQ3OKcfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739263642; c=relaxed/simple;
	bh=iVbYYrqQ1mQ2Cprad1R2LJ8AdFTnuFSA+3S2hz0qL1g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SSdpG+5sN6IaDSu/s0Qk4+1URb8+1OSU+AmzrJ9pu1ZVRbWUeAzVDGU0jKGhC3nhnaZfi9LTJOeC9kXcbduGTKH4jVHIIXn9s1TzXpOO3YoIrJ8iAu1NR/uLaSc38AmgrHQ6QXlGn0UXZ5vX+ak1qQXrwoKNTyU/HV4478wyiTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=LN6yQShF; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="LN6yQShF"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-439350f1a0bso16045695e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 00:47:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739263639; x=1739868439; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Df8JKoLn0fhsTN66htWgdoYItZqEDiJiOAcY+N2P0cI=;
        b=LN6yQShFWtXNGZexoeM3N5Q3OO9d4qjrWFKugYfqRgOd6DY/JxwDDIi0HMz8lDehxG
         m8bHaQbSgqOzuUppzxdT7Se96YlrX2KyXN3qI+qTSLZgqGwSN+EMTxTZeUJcPkUNqQ2z
         8rLRQVrLKUMjAqcFATsCINIdTAnKkwUA8LIPsHKx2qTG+2T5Vw2B2eKgaXHv8JvJ7kIh
         NIRPthAflXzjJHMbSzpWWC4LCsWXK3KP/LWpu6fNvKqv39ngJy5m+BVYb1hM9549yClP
         77WevJ+RIOaupTSNLDjOgdWk9sE5QwRlRpKT9/OwIB+ECNT9HfFEdxwU+zobb8VXSbAd
         UbPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739263639; x=1739868439;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Df8JKoLn0fhsTN66htWgdoYItZqEDiJiOAcY+N2P0cI=;
        b=QeRIAzJ+PuFG6XGJfgWUs/Y/AXpzNqYdWzW/K9XoYDvEPlBAt/I2Pml9O/wKW+AY2n
         UEHda15TPFqTYzWuHY7dEZClzJUzO6nqGb/cC890MM8NzKXZHp+tPL/EcrwbQl2BshcZ
         gmyLmPC7Wht8vHbJtQYEklZYwOyrIhbgHY4NbaeL23bJzcm9c2Vzey+zY09shisdLwe5
         KbY95VP39IHkMybXKT7Sxd7MBLJeqZVZ3dcMsCN+57ZfL7AYoJHd0dSXFV0MyaS5qV//
         FOFs6cpxXUD/r3fT/7zu1uwposifA980ajUZ5cF4usfUcp4xqmenTjcx6aMGrS1nWf8H
         c12w==
X-Forwarded-Encrypted: i=1; AJvYcCWfz0tfE5EvZht+eC48ohg+LkuWaZ7QDOikPzuf56JEOWPEXBqnasBJXm/IRnfsL3VFSDmTPx8OHl5avMo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnLgua2tHbqdQCi1hAa3Q6ZUVpiFglc8E4o/yYGUb64WPhxsiM
	rSqXqHJQ95yobV8a8Ypdw5NLCudT1eejdFn9ABt5BGnxPOTFtG/e0okWHAjxqp0=
X-Gm-Gg: ASbGncurDaWM7UAZDXlQvMvJIrQGIoWdAM8dMhs3BGDltpx/v672y1pFcQqNa5PY4gr
	hG+5btd942DmV1HG9FWVBYCNryz0aelSLbTW7qdv4dsFpvHM/ezmkqtHnLPREtYZUGSgSLYYz4a
	X7ww/FCvzJktQeTKejYsFys+0gdZwWWDXv1CwnIZh/RDGKr/xXyNuyQ7DTZVJ5SM7RHYvoegsCt
	XatE2nYyJay0MVjvMsWMDD+0T0OkaGDe8Lm+GbMNFqBNDiyRuL1+Ov3WI32/YGb2QoAXpln6D00
	Vx3KGJDMSDYAlg==
X-Google-Smtp-Source: AGHT+IHS5iecuSebrclyDRAqCak70aSy0z/NxeoRyYZysKxGum0FCkMgqNH9w7KekV3YTd9p0vVLng==
X-Received: by 2002:a05:600c:450d:b0:434:ff08:202e with SMTP id 5b1f17b1804b1-4394cec568fmr20495795e9.8.1739263639156;
        Tue, 11 Feb 2025 00:47:19 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:561:8978:1d41:636a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4394136fb8bsm66203415e9.29.2025.02.11.00.47.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 00:47:18 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Ray Jui <rjui@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Markus Mayer <mmayer@broadcom.com>,
	Artur Weber <aweber.kernel@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v2 0/3] gpio: bcm-kona: Various GPIO fixups
Date: Tue, 11 Feb 2025 09:47:17 +0100
Message-ID: <173926363532.24083.14747999688184181987.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250206-kona-gpio-fixes-v2-0-409135eab780@gmail.com>
References: <20250206-kona-gpio-fixes-v2-0-409135eab780@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Thu, 06 Feb 2025 18:45:59 +0100, Artur Weber wrote:
> Fixes two issues that were preventing GPIO from working correctly:
> 
> - Lock/unlock functions tried to write the wrong bit to the unlock
>   registers for GPIOs with numbers larger than 32
> 
> - GPIOs only initialized as IRQs did not unlock the configuration
>   registers, causing IRQ-related configuration (e.g. setting the IRQ
>   type) to fail.
> 
> [...]

Applied, thanks!

[1/3] gpio: bcm-kona: Fix GPIO lock/unlock for banks above bank 0
      commit: de1d0d160f64ee76df1d364d521b2faf465a091c
[2/3] gpio: bcm-kona: Make sure GPIO bits are unlocked when requesting IRQ
      commit: 57f5db77a915cc29461a679a6bcae7097967be1a
[3/3] gpio: bcm-kona: Add missing newline to dev_err format string
      commit: 615279db222c3ac56d5c93716efd72b843295c1f

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
