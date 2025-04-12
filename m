Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD9213AD1C
	for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 10:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744452901; cv=none; b=O6X7gRnBrBKbIKBXzpNFaPL9XQEVsrzPe8cOYD761Su2qCWvgpCY3okTIArj5mqgFrnksSsRxGEBCk8vIM3stAkvNO3i+qZXeSO12CzxftBl9VjO5GC5NxN0BvXyM3UccOga5pi/eXPVm2GHY342TjRSgmahSstqthpPLJx/PGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744452901; c=relaxed/simple;
	bh=OUaqaenZQK40EKCZ5x5D+sjoF6j3O559xsJm3HomQC0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cZEClb5cbPx9EaHWgPts8HvdKh91dLRsKWwD080Njou3Fkmviv+68RPqIFyMNHNnzLnrciKyFAfYKVKgYFWVlnJXwVUjNC2DX25lAZ6KYNj1hmoLJlDxweZHXr7xdNfizGv7txBoOK6kvNfWZZtWLXcFKF6YpI/IC6lz+QnTyTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DcuUp8d5; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DcuUp8d5"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4394a0c65fcso29165595e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 03:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744452898; x=1745057698; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ADz2UHdhn6VlUtCxoXIDmk2qzKdPwe5zasSgeJVB5z4=;
        b=DcuUp8d5N7CwSxEYROiNlwQ4bGCKhy18TJO5ecjLFPm8kfMb0HqKcZZpRrbEl1xeZT
         KpYoRrIXuTaGuIfPXcJb5A0fx1LVGR1pqYS/ebIDDgiACeP/wiKj3LBeJS9gkO5Bo/jh
         oOs9RVJC05ioaz2lhWGEIpATl0uLX592H/z1NBx+12YnWpmDjeBcOP6SEQgmkG/ditVS
         lOxRMYJ6BO3R1iBtuoNs8q1NehD6C85f4Cf87yL0BQyg3XKw5DDDFXozcmFHW39VAXXw
         RaYEzYEgYBVdec1Dqa5MOa9AA+MviyXLqTL3LjmsiX0TLbTIYKkr5axKO87Qw19Csps9
         sJLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744452898; x=1745057698;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ADz2UHdhn6VlUtCxoXIDmk2qzKdPwe5zasSgeJVB5z4=;
        b=DHiSmxBgJa8V7A0DJobdUbhIhP7hgz6nJsMpjt076lW5bQH/l6Wc7Xi4Uh7ZUh/8Gd
         N9bersm1zdXAhLZVzz7MdhFS7aS8H7PmJXEVMTH8uO38JAukDEMiHLSQ4ETFx3iLIUM0
         AW9bwQpQgLk4uLh31nUyAwtTD3P9mzQrsN5B9HPl3LXZ/FK6Yu7wsZIDY6jiCuRSe18F
         bVpNAyh4P+KDz7R/zaYr9Q2ELSgawJleyZ2tCQS0Wx3pswcAgzFb5AnazrjFoW7BiRWq
         4gEsUoimGEt0cSSw/7ZM7QguXI1fr0a/s3AD+2xfXC3qsm6nOeW666ZNaQdei7DNvFiR
         vWgQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVc2D80O5aKRdw/6rfTfdr4V3JSI8x3KcAJmBJDIG7XwES7uuX2U2ZM8kTrXnfpGb89ykQNlH2ZESeIhQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywg8h/fVMXflRV2bh65VL7qAmjt2EC4eiqww713aWXDvvjFTdBC
	GuKh/2WLCnmeXUn/sucI0ht7YfrLVx/YH59rhWcGSL50KBhrUmkeGIRDL/RPHMM=
X-Gm-Gg: ASbGnctg74e2eUZqOaKYzxGv8N1pT304dCs0LZ0fl9hLg1inpGnCj6oc1oACf+SB5qg
	2bHPZEqzY7qYKmNyJLwyxz3WjOh+8Y14FuSm9vwtBig7JcCYzG8HibmaLyhnmLSGQex13tV7nDT
	zCXEIGGlknPsCvDU4HVcZJrdCEDRTiWmp4LCDSRT10YDdYuKsGAvEsqeC8Pn9IuHyvPfaD9OjTb
	c5E3zuscXq2w17Rt8gGPW9xhWgy3dvthBfzddTTE1JBexshbJp5o5uxWA6jgjsbOAvf9asAp9bE
	QENimVovB4IxtPhibT++Dqk8gtqdt9bq6kTJ/r4NX0EfsFOROUDu1WvK
X-Google-Smtp-Source: AGHT+IHxVaO0Q6A5zfZJplMfUr/1H1I3HvmVPXjbMZB/QaHYgFmax6t6yrpQoZxMY7sOOsN7U44WiQ==
X-Received: by 2002:a05:600c:3b0d:b0:43c:ec28:d31b with SMTP id 5b1f17b1804b1-43f3a93d1d8mr64377345e9.10.1744452897722;
        Sat, 12 Apr 2025 03:14:57 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39eae964048sm4713549f8f.2.2025.04.12.03.14.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Apr 2025 03:14:57 -0700 (PDT)
Date: Sat, 12 Apr 2025 13:14:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Koichiro Den <koichiro.den@canonical.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] gpio: aggregator: Fix Smatch warnings
Message-ID: <cover.1744452787.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Fix some static checker warnings from Smatch:
https://github.com/error27/smatch

Dan Carpenter (5):
  gpio: aggregator: fix "_sysfs" prefix check in
    gpio_aggregator_make_group()
  gpio: aggregator: Fix gpio_aggregator_line_alloc() checking
  gpio: aggregator: Return an error if there are no GPIOs in
    gpio_aggregator_parse()
  gpio: aggregator: Fix error code in gpio_aggregator_activate()
  gpio: aggregator: Fix leak in gpio_aggregator_parse()

 drivers/gpio/gpio-aggregator.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

-- 
2.47.2

