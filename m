Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B24DC2D130B
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 08:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751531856; cv=none; b=Rs4ejq2BuVRE8QfoNXzCluHvvUn6s2mpV5FVMMDd5F4yEOUqBsCRGZFCpR3mkEbYb6f31OKvM1TvbA922ZeHqJh3WtGWiEtbRy7e6/iq1DlKCrfrPONnpFGztWQdvCD+pJaKVdCFY6N9XaJD6d7KlCpzMoALDrGVosnUfpMvFNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751531856; c=relaxed/simple;
	bh=EL7fxnWzACdRAlqj4sFLAfEFjyx3XEo9qg2XmEeP+os=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FI3uXFbtjtl8/765rRrcmI4HXBbpJwxyGEcG3C3qQTGrc47ovc0XJmXLTeeN28WLmMlWEEki/gv1YPnqVMMDAfTEGqB8MU9PSA+njZn3xRrkxdBjYjvJtbWqQOJVWK18CMXV5/BldiLZStit+JyLAgrGTin6mUzgiwH84Dn3DJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=LG6H2IZc; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="LG6H2IZc"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-451d6ade159so37946925e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 01:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751531853; x=1752136653; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LsnJDjWvIyMRZmla0dgd2yCyYBbavOFlWHTdn8YWhKo=;
        b=LG6H2IZchbVVabyQoQ59afP5JoWgQpqEZqj6eSOoOWUrnJbZGQuk/KWcCiyyiKdmBb
         jfQGFtDJHz8rsk2YEqXkuMoNRi5UwbnXWZPTB8jAhO6+/OvWBWzUXbwYUF/OdsyBCROK
         8SeiDE8+74tXhBOZcSH91ixZLIJ7TbMRNv56qOBGMUgJCQ/uugcST+OdhkWQd1pY7511
         tW+Fa1IZnCwatUKjYZax8Pws4uYCOJPhUq4hOL0Sn7vwDpsPQwLLuCdGOlBlYALX/Efl
         OhYbZ3ueHWCnRuQWO+C4DzOAoqfQhdF+P4MM/avJEJrK9LeohA/GAfULAlicoZqD5yRX
         j93Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751531853; x=1752136653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LsnJDjWvIyMRZmla0dgd2yCyYBbavOFlWHTdn8YWhKo=;
        b=sdfhLEnq7yx1A/1XHAQW0R5zM81qPbVhLrisb2xqfG3HP3J+4tm95kQENd6FdaJtjs
         TJwwg+N9g9GbPnBWBvE1bJwiV+pMYsa+Bj+xi4dDQ5DrmQU6hyelIZPoGc8o3lWzQns7
         46pXIQYzrI9JSWNJ9Pe8fMEMWANpHrwKZfUQQnyrxxB6JIl+rOonFly1aDm6qIFcvnGN
         JSJHx01WTPiM82oHNVtkRau2YUlmcqgmBid3zTD9VsGk3tCVHVKD6jptckjBnBy0BurJ
         4Yp9IOUURn97gKHWW94bpzOWG1GxzzU/b3fDUXWu+/U2etPZXiTiKx0YYZy4xrWLBFkk
         mhAA==
X-Forwarded-Encrypted: i=1; AJvYcCWHXD2d3P285op50aET4TL9ZGKnPjV76xAyK9DcPzO5N+zH3/J93iLaAFVSJsYGQrVTD2RAjXFf5pnvAUE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwraCNLzDFIi0ApedrPHgggsJsSlxxt3SAPSQccce/8Uyf2Z45G
	9XGS716mP4ZRsj7lr4saZUcSsGuyd1whpvoq3tGsY+Y+hXIzzAiR8tK/qsg3eTM6Sas=
X-Gm-Gg: ASbGncuHTs7R9j0jKuK6zvFS/n9pNyLfzbH8HHGJIZVqJ1ON/Fayh9ntwt4lKyw6RwK
	4cxi272m3Bkuua6qYaKZXCiZoAOdaLmsdE8K3gzLvJRZ9QhdID8stno/FHFROQCpK9i4zA8Lgal
	MlMNye46PmLUYU5SXqHSob6xYpzyQ1I0xWaY1QpF6Nt0JJTywHjx3x3+WuNIOgNX0AWVN28xrh0
	Oi4xzfa/C+SWMFgBzOSmouBzhdQ+AUO1216k8fPNa20vjt71/0AWRc/u6j/C38+EdwJ8e2Qtp4K
	zKUewD1JGJWeZSdINY9iPYprADzDL44vQibZuS6l9wnmZjyadcv7ggj96n8VM9YwVdCQfj+s
X-Google-Smtp-Source: AGHT+IFN8lHhDsBaVBn08/7EGgHGGjhNW+3EUJm67DCN2jPsbrvQ0jZZpq4c1aMyumtQlUjkxIwQ+Q==
X-Received: by 2002:a05:600c:45d2:b0:44b:1f5b:8c85 with SMTP id 5b1f17b1804b1-454a36e662cmr63009655e9.13.1751531852971;
        Thu, 03 Jul 2025 01:37:32 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:6c62:b70:3f0c:f58c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454a997e24bsm20046505e9.16.2025.07.03.01.37.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 01:37:32 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Aaron Kling <webgeek1234@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] gpio: palmas: Allow building as a module
Date: Thu,  3 Jul 2025 10:37:28 +0200
Message-ID: <175153184595.16233.13871397507891878072.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250702-gpio-palmas-gpio-v4-1-26ba48252f27@gmail.com>
References: <20250702-gpio-palmas-gpio-v4-1-26ba48252f27@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 02 Jul 2025 13:22:51 -0500, Aaron Kling wrote:
> The driver works fine as a module, so allowing building as such. This
> adds an exit handler to support module unload.
> 
> 

Applied, thanks!

[1/1] gpio: palmas: Allow building as a module
      https://git.kernel.org/brgl/linux/c/cfbbf275ffcf05c82994b8787b0d1974aa1569d8

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
