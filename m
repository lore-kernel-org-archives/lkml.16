Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C644B226545
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 07:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744010003; cv=none; b=b2zdLCKmD/zueVeLU9yISwtDTM2LssbfFGV6Y/OnX7Ehf04w4j+n7SP9uPgrQzf9VGUFchzGxzm4o/4CTXy5UYy8LxOACRHkcHhsErGW9XvOP6Zi8jALNHdxLrCeahjup+6hDmg33TTpLmuxIzplfBhJ5SVvLJ5/I/pOXMxnQzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744010003; c=relaxed/simple;
	bh=mlVNd4QzbWckE0pUZqiiANKAP30ys4cnmjE4RIMXci0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CelObB0juRlfusj2Z6NXFRcKSh3Jisq4E7wd/LvIjXK7HBfy5w7Sy7lKZbDgndw7vTF7VF1uQjUh3UZQ252I2NcmOTFgUbEDiaceXbjVuBFO3dxcbZZc+OS82gIdchPlmOkHlMw7HuxtkwuVBTxYj+FYK3hYymkz6kgAhdzh/xY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=MHYJpc5f; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="MHYJpc5f"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43690d4605dso25834075e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 00:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744010000; x=1744614800; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uGiQ86zVLb8JBWVTSCwg7M8Ca/EW2/+PddB7ADI5980=;
        b=MHYJpc5fDJ/qXwa0o/oh+gFKMpoQetwNZCVxw/J+N7xWlXmyVX8ZzG/A45bZg1kTWV
         wU9ByJ2RRCSD47gP0JY+sWWjKrVgnRTklrh37tj8OpAuUCymZ43p3b7Txm7DkFGtUCOT
         PS+BILJaIys5Sx1oNrDUaMiFA1ISjdivmXQywDK1KDEvxDP3kgchGHzWUXxNE95sjYEj
         fkveT571BZpoP0RISjGs35ec9srkBZeaW3o2/82KsLlPoC7Gt2RSujDU/1O/HpOS+Q1r
         Mxr1BUB+9wEoqlRqhBLoeLsw274km5277Ec7hmSCwZd22el1HXHzdm1SC0DNMDv3eDtV
         p+GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744010000; x=1744614800;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uGiQ86zVLb8JBWVTSCwg7M8Ca/EW2/+PddB7ADI5980=;
        b=Eop/bztzo1wVcsqXKOmdpSzmjX20LSRVmVU0RfFl0bJvzleoQORnMNrW7A18qwOFMk
         wKZpctybqeUA8WfqgnjVbM6M9qONi4oGqxBKqf37JuKzADWraijqqIAab53SofL5PnQQ
         APNPCRuCyjm97kKeHLVedXJxaYiaubj5qdgczrhtHfhxm7YAw+wrEOfga50JD+knZGtz
         5zCnXXd8BaFJR9pRdKaNoRLwdtqojMYZWO7LsSlRwsAGZxNALjHktU0eszwy6z19ROUK
         a2MLiQYxilRP/zTDbJa9uCCuKTT11H4ruXzL7S5UMKAVd4GSpaBT9bh5638BsdY1Zc1S
         hl9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVRkYTFwpsGZVWE9j3esFC3uY7UWcwWJSdWaTP+oTFm/2F/iz4fVTxpVzOvTG25qNOlPpQeU/8LQPlZkEs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzD8XOVOlQ7iaUBulmE0FHmfsKZxSmCsIq7qKuP5ZM66TNuAiLm
	Lr7kEKe+EEwdV+MJIgNwCPUOhoRAnc14vEyZgoH+THu0Cw6R6+GU5Qt7K+aLmTE=
X-Gm-Gg: ASbGncsc9fpTc7k7Y403Nia46uYL4Jw71wfWJcSyFXKqbrU9AR9mv1Szm7Z+nBD7Jmc
	KP4UKSRT4fEI+77zqNF3ZmuL8a7EeOObuCUAHjqww6nIAE5Slr4zGj21+EXiB7qpKGJasCnq8UO
	3OVVr/rTyQDMoo3yJbcUHhDCXJPnUe7lQgxhJo9eeANkC63bxgWngfG8qlRoNx0z6PoBGKx8dt+
	1HG2TDxJ6Kh5/PfRS7E3445QxS6PRanlQioYdRjgBqt6IUcD6siUdJ4y27WVjLE2Ud6jLQW9/0Y
	bC00lUw6P7SH89kvAd9bnJfG9St+iNgC8/6QlA==
X-Google-Smtp-Source: AGHT+IFMnQWMuXkai5VCXN90Uk17NVhGiPupnkywvYdtceCZWC66wkfhrPo8RcuQDGcdn6iuyHqaJA==
X-Received: by 2002:a05:600c:3487:b0:43c:f3e4:d6f6 with SMTP id 5b1f17b1804b1-43ecfa19260mr116571865e9.31.1744010000060;
        Mon, 07 Apr 2025 00:13:20 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8c64:734d:705a:39a7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ea97895e1sm145267115e9.1.2025.04.07.00.13.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 00:13:19 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 07 Apr 2025 09:13:14 +0200
Subject: [PATCH 05/12] gpio: allow building port-mapped GPIO drivers with
 COMPILE_TEST=y
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-gpiochip-set-rv-gpio-part1-v1-5-78399683ca38@linaro.org>
References: <20250407-gpiochip-set-rv-gpio-part1-v1-0-78399683ca38@linaro.org>
In-Reply-To: <20250407-gpiochip-set-rv-gpio-part1-v1-0-78399683ca38@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, Andy Shevchenko <andy@kernel.org>, 
 Peter Tyser <ptyser@xes-inc.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=700;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=ksPOnrqfUjMkoYZLGB0SWQFHhunit4ITjl2uJIRK0Yg=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn83sIDZLdYKCIe/P9+rZTbVOSO0B1bCxS4//IB
 3GXgNF/C2uJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/N7CAAKCRARpy6gFHHX
 ch/oEADNhrWFl02g6tVUm0/cA9jsOsiNTwNcnBwCuDN79Rt4qiexiZbteq21vXqTooFxS63bA72
 W6G5cAh26pJlvvhYhprqALqd/sm25sgLImAiDn8SBb3XPsVMzwoqHvXl+th412fMREFfW963Y81
 leLjIZ8M3Om09FS/7XTEMMc9n/qfiIJ8MRnJMvl5cliLlJ166xZwTwQBxn8ae4VIXrqPFDS6XDt
 elwBlZNgyBIt2SfNtfL4qy2uKZgLG+BWCcNo6++0KtsTa+eE01VR2EJIQbIVH1/WnSshLa7yAba
 6vtjej0fx2nScSz2EuOe7j/pnDzj1zG3AvgwiZX5L7gtIVT6j37ekiPvjFJ3WnVkq5Jxt0nZ6gl
 v5Mh7qBhMkh7lASXOYYKOxUVF46ZzBD8h0ew0C/P83rbX7snnPZNzBB8fk2i09u2GUmGySdPWeQ
 YHB4EqZRol9OX7E6ETcjVj+u5reO7prWA/USytpHLzS7KLYeBQi8RSrEzrnLNNlKDSOvWLMukpc
 7tUodVghIv0pVo2hTkRbLNe0smarjiKo0Aup06HfCpUfMolFZZr9Bxae+7wMEFZBZekmd4AoYxJ
 e3T5sv1CDezEySaexV8NhwaZ+nZJKILew4WcC+twGVIwpL6/poQqr3+ubwShlFHj/AIbgilIYP4
 8NiXhKDPZMJEmdg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Extend the build coverage by allowing the port-mapped drivers to be
build with COMPILE_TEST enabled.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index f2c39bbff83a..5bbc7f724a09 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -889,7 +889,7 @@ config GPIO_IDT3243X
 endmenu
 
 menu "Port-mapped I/O GPIO drivers"
-	depends on X86 && HAS_IOPORT # I/O space access
+	depends on (X86 && HAS_IOPORT) || COMPILE_TEST # I/O space access
 
 config GPIO_VX855
 	tristate "VIA VX855/VX875 GPIO"

-- 
2.45.2

