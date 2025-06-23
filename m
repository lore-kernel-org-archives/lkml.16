Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 260F52A1C9
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 07:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750662997; cv=none; b=cEEkat06qybclKfEKMYmXxT9Ush5mh/C0RD5NIqE72rulDjBxRu9LPUo3CE/NB60QxOaXpDrxr07vNAvBgwLXoGfnGDlZFYDcy2R61YviZA4G41PiXH/w1x0eyGazBJ5CON9DJpxy9Leq8kmLrlh4klNBqxolj9if/lg5XtVoMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750662997; c=relaxed/simple;
	bh=8O3gEP3+T88+/ojbk5Me4OyvYjohYzBZc1dpuIx8xFQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jP/ldD8BBrloZzoJovhvWSiGkW2jU3w4kLdPdrqZ3GetT6YkYeqMVHMMYWNnpbYYiNxRuXWQFXJZ9mVaFwxdDEOTYOGCOugF7EQ24bfJSuO14ojVmlt9G07sZpg9kMfh0mDe56C0jlxIq82vlEbGQp+P14ohkw4qPJpwaPUzTr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=LuYKb2xU; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="LuYKb2xU"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-451d3f72391so34859905e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 00:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750662993; x=1751267793; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=liJJPl8dY//CdYSiJkeFpH4++k9pjjPDNYZyNxezwf8=;
        b=LuYKb2xUAfYl1wIPyyoyLP9z9reBK6z3qvAlj6uG8x+Yk7V+b0DH2Sz1fckIDi6Gzm
         ZZFn+diGS5rswhqotr+h/inVp8s+06sPek89sGs/nstWGgarubkXncCowgmzulw6a+q9
         bp1CYyNhiOz2/PsNG0290cv2TQWIblgPqfqSGXksPh8/iTouu+38NQDNUlyifNZbnbDZ
         VLS869ME0EKq2znK7xo8MaDOnCXa26E+udcbEQvf7p3GlsFSWtuaZ3hzJsY2mOyF20Fh
         CSVVKyEJgnKDqicgGexCDBnJNPrCZzHYFyXDdHiu0xZQByLAGJEZ8MiZSQinrJmdIAkL
         pFcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750662993; x=1751267793;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=liJJPl8dY//CdYSiJkeFpH4++k9pjjPDNYZyNxezwf8=;
        b=UCli7GbEn74nh72KXutAruu7kaeYLlcZHp17zy5GU7Kg/4ZmsRFiCPQVbZuJNL1Mqn
         Ux2eSUEcoWNwWuPid1sr+WMvuW9I6B2i+wcCF+zR6wUNVl6ouVxkOryrH5VQgAqWd0KH
         UphVQZVk6L5fBl1DNkp8pKciZ6w1fBZ4dkxEKcHwFjhy0X+XLOPFI+hq2ec5UozHn11K
         RpStt/ms0JLUxcnUu+Uf9FKSzmML+9W671JsBIW6erQmytWjUUE2L6Tj33AXbuWsRPbA
         cWwDvSDTp3ueJ8+ExbwUENRCcQWhe87sB+b8a7XBuqMsrGN28+qXXadgpI9RbesMjbEt
         GEtg==
X-Forwarded-Encrypted: i=1; AJvYcCUUJi4VgzGqz0gLap9CWMo1X0XBkh3ITJeg1lbTdi/fOOKXjBssKVrVN+7sc4sfzvnuo5SI7W/+gp5U5XQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHh7/mjcYF6n4Q4/mG1VjEoiGFBgKFHO9P8hibTiCm/h+3K8Vm
	ML/5q8kcnh1e2tbxmqAZswtv0ZvrhF3qKFjF5W0hvGPs9+gvs6Afqs3PSZl9waTEbxC8IX49q+u
	sSCIU+O8=
X-Gm-Gg: ASbGncuj6I+prXNLKa0n2KVKX37C6weY7rSDQYEZt+f+9kzy5FRsnQopHT3yE5+W/3M
	/Z+YOdHUKjhhEz9pIfHnQC3dFMnlAYDZQeiBoBCVG0q68XpthWNL5lkLklbMUCb9BbUfVbS1viK
	51lY2d5ompCp77jp2rtTn33XfDziJan3JgemK3YGedUBgfXWTFYpeiF5wjzz27HOKWiho10trBZ
	+gC3rjWC/IpENLMucnoPJ5Lblx9z7Qnc1TlN4+Oiw01BinWd2TdZQM5kqNK1rv4LnvU4hZQIMIf
	Rs0erJgDohbpUL6JvoaE8miSHWs6xjt9H/tSuMZzHkk3CCvRHFLCt46Wc2KQs3WJerFmfN2N
X-Google-Smtp-Source: AGHT+IHzyDpp2qGypLpfXfJVxyNiDlToFHj9XUgSVxBPe6NLXlydGzO5SPHyU+bIMznf3ug7wz4S1Q==
X-Received: by 2002:a05:600c:190b:b0:44a:b478:1387 with SMTP id 5b1f17b1804b1-453659eebd5mr115535635e9.17.1750662992653;
        Mon, 23 Jun 2025 00:16:32 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:5ce:238e:62a6:cbbc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535eac92c6sm134894595e9.22.2025.06.23.00.16.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 00:16:32 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linux-gpio@vger.kernel.org,
	Antonio Quartulli <antonio@mandelbit.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linus.walleij@linaro.org,
	brgl@bgdev.pl,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpiolib-sysfs: fix use-after-free in error path
Date: Mon, 23 Jun 2025 09:16:30 +0200
Message-ID: <175066296706.10516.10782817854642788186.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250622220221.28025-1-antonio@mandelbit.com>
References: <20250622220221.28025-1-antonio@mandelbit.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 23 Jun 2025 00:02:21 +0200, Antonio Quartulli wrote:
> When invoking device_create_with_groups() its return
> value is stored in `data->cdev_base`.
> However, in case of faiure, `data` is first
> freed and then derefernced in order to return
> `data->cdev_base`.
> 
> Fix the use-after-free by extracting the error
> code before free'ing `data`.
> 
> [...]

Thanks for the catch. I tweaked the commit message and added the Fixes: tag.
Applied, thanks!

[1/1] gpiolib-sysfs: fix use-after-free in error path
      https://git.kernel.org/brgl/linux/c/e6bb78570f7d531622ec572ef9ddbe6e66ff16ce

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
