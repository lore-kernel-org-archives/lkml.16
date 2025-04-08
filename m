Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCCFB1CF8B
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 08:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744101808; cv=none; b=GQ9wSK9K6kQ8FhRnxLeyiAOvFxRwe/lvBWvrkaC400xZpLzvU97TOcJ2fhSZuSXac/uLBKiZ7Rfl/ZoI3GU3MFsYqYB8KsgxnRNUrvgWg1MpQvIha3kkgXPdd2/EYW809GlgaA4NaMTAylReZAe1YwuYM7lK70VTenAeMd/Wub8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744101808; c=relaxed/simple;
	bh=GXK3ZGW9tf6Q9chAz2456V+BotYGmE/J2SwhelVDqRc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TCBMZecVWACoOocPcojWqhYZxrvj9nzPjl87alQcN7EUKnoiaxaIGaoHL2Q9OvmPY1mM5z6DnNMDUcvplbGxtv2bonzqCVLYQoFGv8H2CSCMJhthmGPMNXnfsObQqDiTbviwUfhEOrbFKjUGdgKVhy9koedfz0rGtanY65d4ol8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=zLjGAeR0; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="zLjGAeR0"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-39c2688619bso3191985f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 01:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744101804; x=1744706604; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OePFKTyhdQdf/eaJWtXJyGR/G6HZO3R3hL0HNN3AkLo=;
        b=zLjGAeR0zAq5ImoYHeZVbsy2fU6FueyrusA0simpCwgi7YYHc+LsdkjrvovnMz3j7W
         QW1YRqYFmbM4gLqHAFSTBjlNv34Ei4SF36EOV+sJpnKuPoE0ChU3/S6Yy22KM+wxGK9l
         cbZYvIcEVRDR/+tJdtGNnB7J/GQ2vieqD25U6/8VqG5/lrveTxj6t1oqxB056XinUjYZ
         zHerYN5YroukP9ovMsp71PDixVz9vUksioactbdUubhUNmweNMgQFBeKKnEIcJvi9IZ5
         meissqGqMvCAaPp6v12rqMIuQk2zcZHL5coATQsU9HkotA/nTfMhaqY6u+hLDHjUnS0Y
         j5eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744101804; x=1744706604;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OePFKTyhdQdf/eaJWtXJyGR/G6HZO3R3hL0HNN3AkLo=;
        b=a8QBbp6z2THUnoP9J6UPG9suH+Ryb5NSXVuveXVg7Cc/4pMu/VVs/pdUjoQVs8Db6V
         Iz+8Hk8qvoyZnzZTBfeDunGMNqLACkhDDjmCFgW3D3SJipx8cnP3QAt9qAlXVbzDUh9d
         Jw8QVxXrsdj2YkBKzq4VoDJEcQd/oxdHUPiHxVZ6SBoIXK9bBcBOGCiOLC4NR3hAuJVD
         oA+ZH+0b4wp6Vy79p4ES2ThBlVihlc9Mtv+p0i8ZFAqpziFwLL6UrxuLZqJAhoaUEH5d
         v1dq2JRKV3bKoSbkkI+8ClcjuIzgECRdEmImJIAR8NCPbC7dsYE1QOhm/lQcx0VKe/jI
         fwGw==
X-Forwarded-Encrypted: i=1; AJvYcCXVhF7vz7GPJhR7FPlQv05sCtheKg5kZDqia6+QzRWG7xn3rphpKY6a/0fbct0wMOXt4FPQ5mumm1waqSU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzG+OyjsOWhBiZEXdYco1kUMGbBrLi5Bx7JWSmIMeXh3K9S6Ww
	ujNQ/iQu06yGcmdp9RhsEllBnG/X6DBgZbEo61Rn+LXXkUROZHf0dR5IehFBXzw=
X-Gm-Gg: ASbGncsJxpolBE+dnvTVUr8rA+nQc0gxaHbBENs/M8E1+3InmYLem6GGyEmlcJ8NaTj
	xuDL+lPKFEUN2/pis8Q7yXPs+TlRgDXfOwWsZhWgX4MXHD1QOM1iAHiLaeV8iMbJGUxJM4CvSBs
	LGiR5RlodGUHnr5nnX7AVsE3qhUUR+1Txcctt5J8TPqkI3t+bkxtKYaFgzMDkyx2rx3V6nASkKE
	5gWSkYZh2j0MbcfR+Mr19uiyYgRmjRaZj+kUBlR6VKflrV1na9cpaspAJaxmL+K4sdzRla1tccE
	BsTxBjp8p/WKAN+xW9/z/h1ThJQbn5QoneTJGtdpyQlq
X-Google-Smtp-Source: AGHT+IEGC1m/9gJgDIPNZJo3xHP2dSgiPLSh/AneDnG9bwnv4PbEsI/+WnvpUUlb/P2XY7yG+BFXkQ==
X-Received: by 2002:a05:6000:1aca:b0:390:fdba:ac7 with SMTP id ffacd0b85a97d-39cba97f346mr13060051f8f.51.1744101804000;
        Tue, 08 Apr 2025 01:43:24 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:2adf:eaae:f6ea:1a73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c30096ecasm14689544f8f.18.2025.04.08.01.43.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 01:43:23 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Mark Brown <broonie@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/4] gpio: deprecate and track the removal of GPIO workarounds for regulators
Date: Tue,  8 Apr 2025 10:43:22 +0200
Message-ID: <174410179723.40269.7114336096842145653.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250401-gpio-todo-remove-nonexclusive-v2-0-7c1380797b0d@linaro.org>
References: <20250401-gpio-todo-remove-nonexclusive-v2-0-7c1380797b0d@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Tue, 01 Apr 2025 14:46:41 +0200, Bartosz Golaszewski wrote:
> The GPIOD_FLAGS_BIT_NONEXCLUSIVE flag and devm_gpiod_unhinge() helpers
> were introduced as hacky workarounds for resource ownership issues in the
> regulator subsystem. Unfortunately, people started using the former in
> other places too and now it's in all kinds of drivers.
> 
> Let's deprecate both symbols officially, add them to the MAINTAINERS
> keywords so that it pops up on our radars when used again, add a task to
> track it and I plan to use the power sequencing subsystem to handle the
> cases where non-exclusive access to GPIOs is required.
> 
> [...]

Applied, thanks!

[1/4] gpio: deprecate the GPIOD_FLAGS_BIT_NONEXCLUSIVE flag
      https://git.kernel.org/brgl/linux/c/6deb8435f6bfcc9b6c7efe3b8a941ae2fb731495
[2/4] gpio: deprecate devm_gpiod_unhinge()
      https://git.kernel.org/brgl/linux/c/686e54ea31f3b7d9d20ac1fa2d0295d649c41f56
[3/4] MAINTAINERS: add more keywords for the GPIO subsystem entry
      https://git.kernel.org/brgl/linux/c/3af64f175b2405270bd0926153d9856a49b58352
[4/4] gpio: TODO: track the removal of regulator-related workarounds
      https://git.kernel.org/brgl/linux/c/2de1cf175c00927c286f8bd72e18602fe072af95

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
