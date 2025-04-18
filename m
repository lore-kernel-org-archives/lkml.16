Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A7E915F330
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 19:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745005791; cv=none; b=MB12QTEIFH4rF6sMBwqLXYxGNsRBLUb3lbgPbm6SsdvI0aJf3O7GJD0zED7CDG5EvAKhvEp6ITYEeZury3gSZuasjSTdioK+/TUGBw63ZYL4pw76F/2zFPUpzed4NAShbWyVJt3Kqb1QCe76gTdCMQPy5vVACTUrIrZPPdQ8mjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745005791; c=relaxed/simple;
	bh=Y3uL99Kqb5E5URdOgn/HDsBLA/QVSVh7R87wvzeJQZk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cFpRBY1I0Xq5D1UvcED/8AotF3Yd2KB0ok8QtrhMxsDW3wIZPB2sFuXLCZWOn0G/F/I5qi6TNaTC/3kzIG2t0a49zXNzdNFWp0ycWp5I/qAOqPrEGJfIaG9C5yQ6VBThLylBWM4Z0Zg5bF7Gh1MKuhAfNYkh0SDqdRp6rcTu9r0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=pI/aWJxC; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="pI/aWJxC"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-39ac9aea656so2619223f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 12:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745005787; x=1745610587; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SWcOQWb/FzwxcsBkXjqRrzLFD5Nt+phtJhswCCZfnng=;
        b=pI/aWJxCYYWAjFV+Udr0Z3ZlS3VhFm050iJ9NeQ1l7PcQ487LgmJPi9mJyr7YIZyGB
         sJwfwBFeNX9RNj2H3mVP7GQUL2n11yPCEsorDtpBpXirneApbkSq6AvlZNULxDjppyMY
         3NpuQ1qD0naRlf1GvI0HAi46wOVJgblfZvFoAi1r8Qb2WcdFqvw4ZPgOWl4hk5VlqugM
         5pBhbTRgkgBPWkOOVeB+xy7HjZt9TZusyiLpiK8K+7zNzWgxyRFbQ1wYPjRt7okjl4Ho
         0gy+tyqcSqsHV2dqySgCyibRpZTdlbTYGKcNlAexBTRvcu+DpQdVGszNEDKmAAm72R2A
         1XZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745005787; x=1745610587;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SWcOQWb/FzwxcsBkXjqRrzLFD5Nt+phtJhswCCZfnng=;
        b=MB4CDuikfkW9bXh6De5rghEhCKAu011/8PkNtVPYJ9NHpClU8Xpixi8Yu2/2xz8I8Q
         324ryxu8PIP76lPkObNmwh37A9KTr/k7a1MpIk3flr8Ko3QpQAOdhn5iKRsI86EOiAjl
         AGQXpbwsnIJjtt4jjkulO2CRRS5F9T5ByOWrblllwCM9M1+QPtC/JwVfnWw8rrO+vfOM
         JfYc1OBmsYu8chljDzdTIUNwicv+gMTJ8X3KiQhDflCVTTQlFv8G/MzJ0+gwM5EnNSUS
         C9I5VhDKb9dUsfMV99FYRgapZtHItD2Tjipps6Ta6FpePVt1XhznutUHy15OUPn/uFPf
         zc4w==
X-Forwarded-Encrypted: i=1; AJvYcCVCpJI3YQrGV0QMqX7C5yboKTQAaQjEsBxUNmHn+UV5yHq9uh6gslO+bCoZ9Yz0prEehskOaR9HjTPOwyo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyT+XV04W9jWtjXmZgyFC2uJuvscIwEksNRhLZ8aBiVyqfn3GYU
	Cps3HFuFh+74GDEvsUeqDXu29zaXcnmiaLKXwFgbTGXLj+49DIefWFMuUkwYOk4=
X-Gm-Gg: ASbGncs+iyBcpgfFfljhYjhRG5RA6BEPJvfpe120HDB9et93J4O4kw3Ur6W99TdlUwW
	36i//ZdSfcqgNh7/n0UtZ1Tqg7Wx54ry/YEkYWtW8HzCcdAAIt192txFoKUpRVLauiGnXpluqv4
	QQNglf5Gq2iyIMP1zlT5sxeMicextdlyii9wHThJgaAdab06rIP4UlzMYLWYrCm91JpBmZ7TxtL
	V5iSYG5oCbc5lFKsXNGKyp+Q38K41gscZC5A1IG+AMcYQ3rWyC3fqM8Hwhy0LfwWg2U/70rRG/V
	TDG776U1Gry8g6TWfmYE6CKmZzKPnNlDyPN+OsLJ
X-Google-Smtp-Source: AGHT+IGfV2eBKHkjGdNUHgY7tqbduGqKcd0lyO45b1jqOpy/gF1E7xdvbOat2/h/MTv/N6tXoS1yrw==
X-Received: by 2002:a05:6000:2907:b0:39e:f89b:85e2 with SMTP id ffacd0b85a97d-39efba5ae96mr3212423f8f.26.1745005786648;
        Fri, 18 Apr 2025 12:49:46 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:2c35:5ff2:b98f:4e61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa43be53sm3559480f8f.41.2025.04.18.12.49.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 12:49:46 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [GIT PULL] gpio fixes for v6.15-rc3
Date: Fri, 18 Apr 2025 21:49:44 +0200
Message-ID: <20250418194944.37742-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Linus,

Please pull the following fix for GPIO core addressing an issue in
the line value setter callback conversion.

Thanks,
Bartosz

The following changes since commit 8ffd015db85fea3e15a77027fda6c02ced4d2444:

  Linux 6.15-rc2 (2025-04-13 11:54:49 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.15-rc3

for you to fetch changes up to b424bb88afb6719b30340f059bf50953424cdd9d:

  gpiolib: Allow to use setters with return value for output-only gpios (2025-04-14 20:31:00 +0200)

----------------------------------------------------------------
gpio fixes for v6.15-rc3

- check for both the new AND old (deprecated) setter callback when
  changing GPIO direction to output

----------------------------------------------------------------
Mathieu Dubois-Briand (1):
      gpiolib: Allow to use setters with return value for output-only gpios

 drivers/gpio/gpiolib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
