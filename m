Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB67823E22B
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 09:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744103236; cv=none; b=NlQ31QfO9MSPKg3+jfNiSbVGTr/BCq1DNJpavN4SaapQuwCdd3DFxUtw+EWwk9eYQkxh6+106QCegIu1nA2BBYJQfWhMQk9ITb+ruY45q3LQ5bmJuc0VkLsxoqdhVQltzHEfyCSiKRwHOw4Tmyes+9Pt8uSC6I8BYR9OFgNwW+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744103236; c=relaxed/simple;
	bh=ECKU9VRa9SZdC4Y2qpEahVNrW+AgpNO+ao3cSKtCDaU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qjrVRB/oB9bNM2w4upcCs7J8NYVGstSHTd0DEyp4+Qzf2o7eyVUcY8G9GRcYcUVak9u+MrOfXUYLMU1kLIQLEHs3uSyJE4Vf/zbRM4F+RZOqWI4yxdCZjnJoDK66M1z7aFmTleuWB6/ep89Fa8OvPqeXhn4qMzYTYrYae/kL/A4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=A2qVtnb0; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="A2qVtnb0"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3912fdddf8fso4050378f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 02:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744103233; x=1744708033; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yL8NonFDAFn9CCY3B6fe4kxf++Mi5GuZ+sS3OjKRTAw=;
        b=A2qVtnb0KS92QF0sn0yX9qJQphNN6SpAKqKQgYEcfRXQRclsnNkaMmLDZ3qWL3hQ3G
         DdCEldQMZOxm1PCs9On0XAkEAAVNx0i9PyF2mufq6FvA1ia+lVxkuX8UeqZuMw0zth9z
         NIyg9LRPeYaqX39BMXsfKdVvuaqYWvZIDWuDeMHerYVQVQI6BsZ0/ZlGLo7ZDraJjyFi
         cksfSFHkHQlSPXvJYDU893pvAEDA2qCOv+B+Jl497WGnrPZTSflE5kqcVOksM7VqB14T
         A61eTcciTcAeR11PCvod8ET/QDWmWd/TgGOAGQTC6/30yG2hTdwUQrk8mWWXwjbyWSev
         Pfmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744103233; x=1744708033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yL8NonFDAFn9CCY3B6fe4kxf++Mi5GuZ+sS3OjKRTAw=;
        b=QQbCRvf5WtI9KvAvbL4iavmCQfGfnCAvvQh+SIB5w+LvDMuCd/FMsr9C3iAN7ETC36
         GpRykH+XzTYvDKQ7s5QG2YF+5acpVptJ6Luz/5a2cUudwyCfqqDRElTS0C/Kd1n8oN84
         MzY9u6YILwrJ3wKgrfxXAF1SukeJrIcwQeibcHh5qAgXkejloJ3ROd98pukVL4INipB2
         M+ex93d1ktk688uHNEvlzCG57V8+84e1y6aHfAVXx5DAZhRtjLjyBsRsoGGeAQKo01PR
         J9R5h3ardIctTb73ItqqA6csk/JAfutPpVyMJl8bAnu/KeFGcr85RorQiYA2rxZdrgHE
         daDw==
X-Forwarded-Encrypted: i=1; AJvYcCXiGhkZPRSkrU+NbGnAWSgFASTR1gBXaBV25rbML0MV/GwwApBaGGcAkdLYNnrNUKvnFFjyXuH5o8RO6oA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbhA2VdHH+Ywp92dBT+iMmT8vPB+WA7y7pBY+ortKLw7TUyk9W
	FHeYNUJ5pAeHFVXDPjKTwxMKxvWufZVC6fqcfrtT82iQUDcgdZqunqoC3AhAPaI=
X-Gm-Gg: ASbGncsu0zm/VQilxLKGPHVr5w8HV1AB8MwZddDtH6Kj/vc8JVBpU0/RafnY1rtuKss
	ujOD9/dtay5E6+foFXTLpC0unDdkgvPDxk0hFxavbWGVsULQc94TYxn6TIrVnDSfN7/9hmjlmD9
	u32n5EAyqa9BotRW+LsnQJIRzDJQP6rI9psKaASwK2slJPtsJlEnxkBAj+NfBZnls9LtUsIlxD9
	i7DOdBTSTqyaQHTegUwVsl5Obd/iDPgkD2qvXESkdqQ4Pp9P+MlUxrRv3JUloAO4ixQXV8A+gZi
	H9GrpLg6pfiHe3bxBCOZSUW6cjfAnl87oXDjx10kYvTCXqIj+heMXdI=
X-Google-Smtp-Source: AGHT+IEEUUCdQ8+KWeardc7yL2m3M66AWEIdgm7xhoUfYk5I4by5eAm7Hv06t/LMCbKlhAwYRn2RHQ==
X-Received: by 2002:a05:6000:2483:b0:390:e535:8750 with SMTP id ffacd0b85a97d-39d820b09f9mr2086926f8f.9.1744103233156;
        Tue, 08 Apr 2025 02:07:13 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:2adf:eaae:f6ea:1a73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301a79aasm14580113f8f.35.2025.04.08.02.07.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 02:07:12 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v1 0/2] gpiolib: of: Fix and amendment of OF quirks
Date: Tue,  8 Apr 2025 11:07:08 +0200
Message-ID: <174410322474.42503.2626843932782716503.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250402122058.1517393-1-andriy.shevchenko@linux.intel.com>
References: <20250402122058.1517393-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 02 Apr 2025 15:19:59 +0300, Andy Shevchenko wrote:
> Just a couple of minor updates to the GPIO OF quirks.
> 
> Andy Shevchenko (2):
>   gpiolib: of: Fix the choice for Ingenic NAND quirk
>   gpiolib: of: Move Atmel HSMCI quirk up out of the regulator comment
> 
> drivers/gpio/gpiolib-of.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> [...]

Applied, thanks!

[1/2] gpiolib: of: Fix the choice for Ingenic NAND quirk
      https://git.kernel.org/brgl/linux/c/2b9c536430126c233552cdcd6ec9d5077454ece4
[2/2] gpiolib: of: Move Atmel HSMCI quirk up out of the regulator comment
      https://git.kernel.org/brgl/linux/c/b8c7a1ac884cc267d1031f8de07f1a689a69fbab

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
