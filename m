Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D47AB1D63F2
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 09:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743411623; cv=none; b=nfsgLcQXvhZCNVD3y2ljpQ7nxBzR8Ftm+OSYTmlrdrIT8Zp5SAW93stj+Xeu8RCu5niuSRQam5yugs6Z9HaszenynVOznveCz9dENvTtZ6vPpfWFDZ1qK6+rxi914A2pSc5GLC55OqrezO9QleTTQlW1qTEtSdqc8uvzeUwSe7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743411623; c=relaxed/simple;
	bh=iIjFuDSz7TM8J093yEORo9E+opFPN91TH30u9539yF4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FH96nrDPabuQs6K5MKnG5jZjc+UkC59g3vnDD1pR1q+pN7frmidMbFZXBbE8n1xc/cBcNWJQaTzX5/l+JkuazZTRKWgmGpKTxOaJ4tBKljWWuU7ljq13sbENtKDHUAzBGwYP8o2sHaEFZFe4Qcbba85DjOREwY6N3UHbm9dQDcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=n25reWxl; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="n25reWxl"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43cef035a3bso29619065e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 02:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1743411620; x=1744016420; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FmGqW8ctXGewuU2RFTizao0zHQ9DjSIWUAdzeyWvdpI=;
        b=n25reWxlLVfVIP507UgipMsxs7ehQrgTGRcmpwEpx7g7g8Rn47pXwM/MFN46XMxBAC
         SzozgcIzdCNLaYXrj/ZeDFqH2Mf1hTV2tEOKXZ8JClYFhrGH+eiDHt/zeXc2HBvw6+fp
         OgOkOyjavJGEiK6wiHasmUjz/JeMRCtbrIkV5AZSJuy843mUXIRCkqo20gHqnWHT7SCp
         cCyxBWwqUsk2XtcM+n4tZ5TXz0p5FqHirD7t3bAsWfaZhqVBOpc+kWY37eYl2CViS+Iu
         KqyTxiYAf1NH7DEutIbPY7/FWgph7wA2GsjwWilu/GZaBBaX6taxvlMI7WmFLZKtQYD4
         SWRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743411620; x=1744016420;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FmGqW8ctXGewuU2RFTizao0zHQ9DjSIWUAdzeyWvdpI=;
        b=WllZ3CncG4y/QFocs5atG97VhhbLjr27W/JlzXR1qnE/VQ3K5Q507NznYNpgg65Maf
         9KDK0IovQsWbCgUjbo5dMu1pw+rYhM5ViOZ+vesPjj3WWk5B0OjpnGsn9Id3LAqei5fI
         Q9uFMRvl8KVEr4rDTJavsuE+0UwaLFRlAIJSm9yvlRHc/ALhrjdBi6bts8eXvaY4UkLr
         SRTMCJu5ocSneJYfUmtKTPpy0QVrwvc8grt6FFU/7a3Xei5NZezmdpLH6D3pPM6KuIWL
         QbSscQnPdpwkKYYUiXsdQI6PS3e16jHjINs+nfop2UE3+txiTmLmpf503e5ceodYaFZE
         2tcA==
X-Forwarded-Encrypted: i=1; AJvYcCVlAkq53spB8MWgX1BBhRgqmOyi3NYywgj7e5xMp7TzBnrGY2GdoUJXoG62/tbQIvcgxld2GU/+VUZGmWY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzt7H/tmj1IlKfhfCl9jvteYm0k1zXdmqIkSIjRAgsJmkR8Jj3h
	YKTxok8gozMTy4mSkZp692bGLpXVpjLitAXSGbnz4EwP4NOLuzdWDbqzCdFg9JlG2++NuDZVF5s
	8
X-Gm-Gg: ASbGncu/mBgC66lohyfUJUmel5ksVvT3rTWSoeQN1cjPxHRTW2cWiQwtjpCryr+d+Q7
	6FGM7/uzDo69Sup7UsbDYupw3w7NnH3qHwHF3YgvCKXhw6wGGKga4bkMj6ugkIEOCxNOgCNB6s5
	mvzZMY/+IrmUN1maqeX/JZcfzCgnpkkgl1xCUypkZ/psw5q1FZhta+IiGZxRuqp/mshjuVbAHsK
	FWc2xE5jYRaelrUAGDcmfjuJukR9nJSvrFrY4ovwS5b+rQhCy6DwmRWAKc+1RbNQ2UIL9rW38OD
	AlMozE9IYoPNYYbqPiBH/VzF/4j+KctCOYtjYA==
X-Google-Smtp-Source: AGHT+IFb+nygrsOy6hY5Ldf7kV62G9wUGquIhxXH0vOhNExwquzxd6yk0q4dZyzsyOyVvCWluCwe7w==
X-Received: by 2002:a05:600c:4e0d:b0:43a:b8eb:9e5f with SMTP id 5b1f17b1804b1-43db61d79b8mr61955775e9.3.1743411619734;
        Mon, 31 Mar 2025 02:00:19 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c1db:ad07:29d1:fc13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d8ff042bcsm114534115e9.28.2025.03.31.02.00.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 02:00:18 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 31 Mar 2025 11:00:10 +0200
Subject: [PATCH 2/3] MAINTAINERS: add another keyword for the GPIO
 subsystem
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250331-gpio-todo-remove-nonexclusive-v1-2-25f72675f304@linaro.org>
References: <20250331-gpio-todo-remove-nonexclusive-v1-0-25f72675f304@linaro.org>
In-Reply-To: <20250331-gpio-todo-remove-nonexclusive-v1-0-25f72675f304@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=657;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=gfY/H/V12uXoSsJmrHz3UuUvF78SLhvsuBi8QiZKJQo=;
 b=kA0DAAoBEacuoBRx13IByyZiAGfqWaCibHhmmJ//+xhwclCoTEszFdJIK2dg6xTLLQhpwmeV6
 okCMwQAAQoAHRYhBBad62wLw8RgE9LHnxGnLqAUcddyBQJn6lmgAAoJEBGnLqAUcddyOCQP/2XU
 AZaDpVKHU6zkmAYAkAO8EgYb5Kq/h4wyUaq8jD+RIlWDNyZyEmIYvNdIC8xQK8cYaVK8y/7VVvM
 0BhRkRaH41DGvTxIXOE5SzJMNHGijofpJyojwADvfAjTMip56Q78Zq9M5GuIoB859tavHHKHlEU
 GjTljRtchSu8MMSqJe9gPAOqxm5fYGVwN5w9VbyUQLS6PNAJf0CI9cnCI7kLZD3XztdwahOMATQ
 anGUD1eN+V72KcMwqf9taCDZ06JS9JZoDyg40N9DGFvQtMK+DoCZuZKUaPKqA7Ypf/DKaIE0KoE
 gQE0qoTfXG4I7HHFfp6BuDAFLrZfGS8g1C49uuFHr/K+ep3FdI9cu6TKRRuHULFXPRbMEt0mN5e
 OABf+o8MJ4HOiufX6AGt+GrqOuVTll+QQ36i1GGcoHJFtSVtMNcpABWYQZi3YLzCnjchv3n6Y+V
 xInziU4iEwPRW8jVqt3WfL6jVpcX4t8h3u6I6/u2puM9d9GGjfzvtrZuKm2PAqm0E43LjDJz9L4
 EYb6tjCymXY8Vm9boK5gyfR6iPb4/JxmKUUUmPynsE09h2dUX1xhuYAWizWI4R6iy134IWs54UN
 1Kddt2rkAmGSb8u/cZ6JzPyBZHwMWDsFtLj8o2nkPNNc+L9LMp/ZnR4aOyxiU2IJ4/+aQmsirmv
 Pq9f4
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add GPIOD_FLAGS_BIT_NONEXCLUSIVE as a keyword to the GPIO entry so that
we get notified if anybody tries to use it as it's a deprecated symbol.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index ce2b64f4568d5..210fbca61ad37 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10151,6 +10151,7 @@ F:	include/linux/gpio.h
 F:	include/linux/gpio/
 F:	include/linux/of_gpio.h
 K:	(devm_)?gpio_(request|free|direction|get|set)
+K:	GPIOD_FLAGS_BIT_NONEXCLUSIVE
 
 GPIO UAPI
 M:	Bartosz Golaszewski <brgl@bgdev.pl>

-- 
2.45.2

