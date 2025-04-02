Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D344B238D56
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 13:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743599569; cv=none; b=k3iCQbSTNNM6d4ykSZ2rAZlUkklIVWAAnBXHz+tSI1BzzE+ZeGCYTeCjiCdvRJQ6QjG/Di2mdqotyS0PPHWxtXQoXUXwDAQHpP02c+yZzdiW75+mGNcBDpD0g40UI2DJrhsra/B1/SKFFLdRQuEKvYZVGYvZIntc5+oGRw7+TFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743599569; c=relaxed/simple;
	bh=tOcpGZ8f5Tb47JNS5BNoknblBrTyos3un4K9kSh6yAg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Jfjm6CzO3nMLKTlWbRG0Px+pDLaVjLwRvX5gt87qLsa4eJERk6axFtBsd16Tc5UE7lZiB7CnnqKvS/UH5ZYe0JQTKkyb8x2rwuOnJwjuvaH+Lpp3cDSotDgn7iPZ9jlGbJQGoEXCizm4MAQGLepEnNDzdA5BzmFCFkTwKZcD5/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=JVwcPq7A; arc=none smtp.client-ip=209.85.166.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="JVwcPq7A"
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-3d43c972616so2668705ab.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 06:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1743599566; x=1744204366; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6BQoS285p3ACMznO/yhKhIxe+5v4IUlbAZzIu1YF/lI=;
        b=JVwcPq7A1wYLI6HanfRZBwxUCnBFUCgL0DDsnUb3R/6kPoICi5KThFMKUWWuXNe20d
         dvie86+AaCAFFwgbWtkm07CLw+wvm0pbpQIBlcbXpDQGncvC9WESUz85Plyj44w3w+yM
         wSpnMR2N0aQ19mXj8oeKAbdALSn8insFOIWv9nQU6DmXsmhDpgexcBnX/EHB7ziFviUQ
         /9bE8i3UBc6yg2EiP0+XtGXEs24qTx0YAnowkoJml6ZYSwArI/lQM7+yTKI78ctPQ+lQ
         A2hUxXMvt20o9JpSbTmmsrs/8QxTf6z1L8ANJ1hYsNpE6RybIKMkJObwC3Sz1EuIwPA4
         X6OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743599566; x=1744204366;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6BQoS285p3ACMznO/yhKhIxe+5v4IUlbAZzIu1YF/lI=;
        b=p0coXMScHf7zVTB5++QBZK2KTztcqLEq+MJVjLaI12XEfKNxIZC+9/1bgXIlry76ze
         RO5Q1AZb0E2+TheL0bo2z6zjEHt33nD7aikJxiM+DrdRipDnhlwBzOEslvqmqC4uoXqT
         4U20KwQfQus/k7muZRKua28MgMwsKs8MBIinehyEnsZGJlVnN7jpBNT5rjFN8YClQxKN
         zzm1BFkFGfqsX1BhukCbdGSAJT/1/4684iifBzkWsHQEsljvev7eV5DA7G1Hcp8PLR9u
         oVhimBqCHKGFw3Aqresa+0CJ0GQaTE7gJPJJPSFUFV8g+zWMfgd63Ya98Oi7d+TOvCkA
         npQw==
X-Forwarded-Encrypted: i=1; AJvYcCW/+VmWHVbKbWGWZ89MZ+ZczBX7Z3zFFUemBL1tbqxaUMRijmcnNVOcE9Yg3RiO8eKV8AUQquXvrJcRGMw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6cm4QVlOKvKm3DhVzOmOkCkHGFhBSDG7SredDLuWYth+rokpJ
	Ey+AYk/dAs4yj+VFXbAebYdBe5lMqftsNI2B9Er9lizXGw7RM/EF88XbXyOUSzY=
X-Gm-Gg: ASbGncv4Zd+8ncvxiq9ZEFaE/CN58SZ5IFuMC0g9YLs5+M1WzAk0uGMUqR7j/IP85sU
	DkGe40CPw/+uWFIjNpEhysc5Npn8J+7lojpLhepR8j/RYgeYuja0kXvQh4KSCLmsIYKdVVN4Ng0
	sFOlUPODgTq8GXiKHh3xJk3AyxN7zYh56BhBHUb5zBur7inzNsSvCJuo6Y0qe2h72javnGBfu+e
	9LOQ60SwPSFCF/+A4lnwJjkEWPXUZQRNHiGIIAj6H4PucmQMWOL4ffefETxm8pwOc4GYYs6mHC5
	amtl+3hUqm7lCG6tVv/NM8NY29WaCJILaE8=
X-Google-Smtp-Source: AGHT+IGYEtc0rVmUripwItyyW0bmRlCGHyKYzRGoLqwNlAxm5qK9125/20/ajFem/q54Yg0ZLMrZLw==
X-Received: by 2002:a05:6e02:2783:b0:3d3:fa69:6755 with SMTP id e9e14a558f8ab-3d6d6d17acbmr14537565ab.5.1743599566623;
        Wed, 02 Apr 2025 06:12:46 -0700 (PDT)
Received: from [127.0.0.1] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d5d5a6ca4bsm32985265ab.22.2025.04.02.06.12.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 06:12:45 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Ming Lei <ming.lei@redhat.com>, Shuah Khan <shuah@kernel.org>, 
 Uday Shankar <ushankar@purestorage.com>
Cc: linux-block@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250401-ublk_selftests-v1-0-98129c9bc8bb@purestorage.com>
References: <20250401-ublk_selftests-v1-0-98129c9bc8bb@purestorage.com>
Subject: Re: [PATCH 0/2] ublk: fixes for selftests
Message-Id: <174359956539.20480.17105268115889494986.b4-ty@kernel.dk>
Date: Wed, 02 Apr 2025 07:12:45 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3-dev-7b9b9


On Tue, 01 Apr 2025 14:49:07 -0600, Uday Shankar wrote:
> Fix a couple of issues I saw when developing selftests for ublk. These
> patches are split out from the following series:
> 
> https://lore.kernel.org/linux-block/20250325-ublk_timeout-v1-0-262f0121a7bd@purestorage.com/T/#t
> 
> 

Applied, thanks!

[1/2] selftests: ublk: kublk: use ioctl-encoded opcodes
      (no commit info)
[2/2] selftests: ublk: kublk: fix an error log line
      (no commit info)

Best regards,
-- 
Jens Axboe



