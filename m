Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E24772550A9
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 13:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746450203; cv=none; b=GIDKjikJAcLxgRW7ZF4ig0DTk2YjEuZHLXyIbX9xA9LjR0p/AD9af3SM9RWPLGlNm2jDUD6tnjq6KOkbzpLAPpRy0gpyqPF/NtQkYXle+NZD8Dnhr+uB/iOUXGvSn4fyrw8/cQOdGMYCW46oMyj/lPA+O5VMKf2YEkMiWophd+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746450203; c=relaxed/simple;
	bh=GX3fOpHRpwTiNw/HHyGPbbI7DxqoGlKtOoxGwbPApAw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tff1TqvwjaNwSbpc/C5/gfhx0buH95CCKSSWm2HxKsS8FxGWu8lMOe+5zHp/0xBy050uYrAZV/4i0rLDo3v1AYEWmSrWMENxOK0S+8o9vdIPRnZSU6eUCswqSn/nDv8+FfaqIZTwXQhK7lzJMe/rrqQyFGrBvU+92J9j4HeMoi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=WeKYq+p7; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="WeKYq+p7"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43cf05f0c3eso25479615e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 06:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1746450199; x=1747054999; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=exQ9S0PkQmvIF3X9JD7ZxE0T6Y64rW4BPHjAOWOwk/o=;
        b=WeKYq+p7jRnFFg+HV9crL8pBJKgMEb8phT5399BOJ0Krj97eKMU0yTdohYhDt9EsX1
         oCkxE351at2bpPrvnK6vj3xMKwoOhnPMiMHGcM7PbBTNgBfkcozKdiMKYShQeaVsTowh
         yXP0EIoqYpBepRqPkdnE6mBdiD/SF6wSNmF2XXVaYZFxOV6kM/1fjrcjBLQ+5C9SR3L9
         +87lqmrBZzzLrJ1gEQUI+032ayImxIbHqdr8r706eg4KmhWA8UHUMa8hEOgl/V576+xU
         5xWQQqwuXPssPEgRlsZnjyQjMAxYRtXpl2ht3j5WK07uelDW8gCr7I/UsHJYKKP0Yoo8
         4ENw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746450199; x=1747054999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=exQ9S0PkQmvIF3X9JD7ZxE0T6Y64rW4BPHjAOWOwk/o=;
        b=hQAtiPU9WwqeYiiP/aDdF4ichaNNPzvvEWISoh/hy1TeP/lN2OKAinikmE3qyWJfSv
         QC0CCXdMwv/rIWQlbKkxs55omulrU0glkSj31JdwG5MpePAJ9MwWXJAtD7qiAdmN6kQw
         Xm/0g7h49RrQ5J8IwXsgAuEz+/XBk4XhD1QtBvxAptAyqB9FW6oiGMxyHxYpf5K1fPPY
         PHZdcBvu7C4jVIo4idOuU+ZfW55ox550RnkQeilONux7Js8h39Aj387CrhGaftfpNxzl
         Wa7TMH31vNwXUJpk9f2JM/3GZQPtRVMycY5Tju57sPrttN6R2JK4PLhZ75cxRX6VMGhy
         lM9g==
X-Forwarded-Encrypted: i=1; AJvYcCXGciXN/AuWWDNODAQaMuEgmnKMJaIanS8PwN4DtaFzHJNAgAhl2rVsnJSnHvu/vMeSn+8eTtv8FZTquZk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyiBJPtMtYXGo0+cXFGJ947/NdLeJ0tBKnmhDI16OFZTOq/EY2/
	PRkrjenWjnRazUlzknqmMdvB5fPAn8EFikw5+c5yzbq+/gXM8/xwHcMG11I0gZw=
X-Gm-Gg: ASbGncuzOsB+FbUluab7HTPCDHW+sa38TNllJHqaajlL7evYriuT1RzGd+JyO01eZO5
	yiRwpZ92hxAMJxc8Ffg8hRJBrWfvooMpP8qJVqYloToM/D4d+iySPyRtcIoTHoFeyrvCXQ+YNKP
	v3H/JkbYARvJH5nqaQS1840D7TtgI+sdMwUVNQCfms8yD5j3xnNecmrQXGoLVDdcJcCKbq7IGT1
	l97CVNZrKf9cWcI6Xyvy77sUX2J4XOak1Da8D+7fXY8qwjrzzWBPJ9T2CDyE/TY9eyi5yNM06Nw
	TUvTU8OGqAjVs1in2XfalUjcwHo+/mKhS7ZhvlkR
X-Google-Smtp-Source: AGHT+IGBSe9gkuaw/waiKDlvhi5qEhelecunE8RuxjCPPbdde/GxKzqd1CV9fdvHIVkiXv7IGpTfnA==
X-Received: by 2002:a05:600c:1d8f:b0:43d:7de:16e3 with SMTP id 5b1f17b1804b1-441c49237f4mr59652335e9.24.1746450197810;
        Mon, 05 May 2025 06:03:17 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:71f:4190:a04a:bb82])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b89ed4d4sm131276335e9.19.2025.05.05.06.03.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 06:03:17 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: James Cowgill <james.cowgill@blaize.com>,
	Matt Redfearn <matt.redfearn@blaize.com>,
	Neil Jones <neil.jones@blaize.com>,
	Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Arnd Bergmann <arnd@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: blzp1600: remove incorrect pf_match_ptr()
Date: Mon,  5 May 2025 15:03:15 +0200
Message-ID: <174645019201.54400.7798160459786801009.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250502203721.2117186-1-arnd@kernel.org>
References: <20250502203721.2117186-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Fri, 02 May 2025 22:37:07 +0200, Arnd Bergmann wrote:
> The blzp1600_gpio_of_match is defined unconditionally and can always be referenced
> by the driver, so don't use of_match_ptr() and avoid this warning:
> 
> drivers/gpio/gpio-blzp1600.c:263:34: error: 'blzp1600_gpio_of_match' defined but not used [-Werror=unused-const-variable=]
>   263 | static const struct of_device_id blzp1600_gpio_of_match[] = {
> 
> 
> [...]

Applied, thanks!

[1/1] gpio: blzp1600: remove incorrect pf_match_ptr()
      https://git.kernel.org/brgl/linux/c/3a1e07184d78f52c07f69b40bedbbebbc417e71b

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
