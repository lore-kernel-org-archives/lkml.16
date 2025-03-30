Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B3BE1957FF
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 10:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743331036; cv=none; b=D1S1nadAJJqn7Q7XKKYyQepAUijmSzc3k1oyj+jU8005cnp1DjHZoZlaTqW7Qwrwr1/+a5dzyMqry0IpmwSJjfRkTRJvyXtcUvF0wAZJ6CNTmL1YcK3cARBhtq0CGGObds6PAIFz5f5LN4wffgs5U5pZbCNcQ1YSZ6DJuVyKzVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743331036; c=relaxed/simple;
	bh=y8WpKUwlxa5kJspVT1MLrXUwdTtXLPlaHzDoqqkPMZ8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nlaUXY2k+hDF/PuP+Z1P/ylptcuI9/jIjugIFTgGrwnbZ6G/UfThI0dmR53rViPRB27HPcqt1/zbsF4WvKCkWMtvRTgLdj5umraF99EOpDPAmvo4xuwDoC835QaAxSsFte4rZePtPlScsVImDlyrcuHhJWRp8zS9ypUt55KEgnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CmVTE+Zj; arc=none smtp.client-ip=209.85.214.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CmVTE+Zj"
Received: by mail-pl1-f193.google.com with SMTP id d9443c01a7336-227914acd20so70742495ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 03:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743331034; x=1743935834; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HxZdYDJAFQju6Y4CIsYcmH9hIt6XC3Q7NtFTO5w1vn4=;
        b=CmVTE+ZjgYIfzR1/gOEXxJQzeysmIEU3cqAg9CtLsi+UY73Zo8IdWt+pQy/7xHS/DE
         uru0l/wBEYevjOcnxdG3PVwv5COFOdlpxe7b/HL20sVaEL9xi83R308m/6FvlA6x0NAO
         VI/mr0+vylC/hbEeRh4uTS+yo2YW9xiFvSgKZF17u09hTz5rGOq+mLQqpZCQn4brBCRv
         9sBvfZG/Kz4lgMtZI6kZqu017dKWLRCQi4ZlVh0kt1T8w12WUhmHGN0Wra8LQPTJDd6r
         JhGIfRTiQjqwsn3D75wWsNA30aygaSaVORMI9eE8cz6RcIZ2+ECkm8/Y3z1v0ZuKMagk
         P2xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743331034; x=1743935834;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HxZdYDJAFQju6Y4CIsYcmH9hIt6XC3Q7NtFTO5w1vn4=;
        b=WwI6VE2bFo3yHZ3q1Jh5ri2awn8Zb7POaTY4Jox6SvaIJL82b+3Fa+p5WUSmGIGgnD
         D8popXU21TYREU4s2Xxi0uiYo7RyoPvm0v1AAcQDiqPLEaAoAqMN5j8Df4MihgfLv2a9
         2A1DMLqvggPl42Is7uTsY2fHH24BBSN3bNPkOwi7bYgMKWuBPocgKrQWHiKROLwky7rX
         ow2c4z+F9ozoSOxFs9GzUk9KhIcCS4pddndlkZkivxVwh0NtXfuksNLKpz+86eV94Xtd
         y60rP4CLPoUsSEkQEZihtQ3EttJYfX8iMWO6i0sFhmS/bwwZtlcejbjCdKz+eSWbkliV
         e/CA==
X-Forwarded-Encrypted: i=1; AJvYcCUTVpDfKrNfU1yytPnV/L+Eb1I2WTV6DlcmKO5FlIILY9nBE7wj2waaXyMBscLBaz4p3T/MIwZLyFpzjg0=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywm3JjZr0Tmr/yE2FsC7ucyTji4iDJNXUnKXVKWtcok4RJOQ1QV
	UMtHKxkW6+LEpAfy6jkZwB55I2dJdk/+nyMZMTIf9IYIOO3DmApB
X-Gm-Gg: ASbGnct3l+uzWN4rMnhiaTzIGL5RrU61EdmBnFqWon9Sq17gKYZ18mLpCZCBdOAZwBN
	QwV9C2Yi4T0iuBsealeGkJZFwjtzGo0sR9Mx5s02DXMmHYa+yDvM5wg1eTc4CGyro9qVRYa48wi
	QcFXRZONQWjn0p+mWpSaPYsui3u9lNvYG+bgMICUAiq/RyGzzFfEuYrBqneqJqsYUlrK4P7kVFc
	6mu/0PMZFvx6fHI8cMd0EnzuUl6uSCT6wKnGvo9GAO5uGF7WhYrVOeg7RE9E6oWW/M6+o2oT+RF
	3lqC21Bi15prNI1pdC+WoznoUxvSxKH/6jjuz0MFUCmJYoPqLoqWzi5wWXCGhm2rd4YK7BkS
X-Google-Smtp-Source: AGHT+IFXQMOUS9YRqishQwMfOJiVbs02looxdAwsW7EPfjDrWLYsaFYL8d3NHGN8PjUvWQhuNSFR/w==
X-Received: by 2002:a05:6a21:108e:b0:1fe:8f7c:c8e with SMTP id adf61e73a8af0-2009ee32aeemr8154339637.15.1743331034151;
        Sun, 30 Mar 2025 03:37:14 -0700 (PDT)
Received: from localhost (206.190.232.2.16clouds.com. [206.190.232.2])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-af93b6ae46esm4562286a12.21.2025.03.30.03.37.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Mar 2025 03:37:13 -0700 (PDT)
From: Woody Zhang <woodyzhang666@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Cc: Woody Zhang <woodyzhang666@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] platform: replace magic number with macro PLATFORM_DEVID_NONE
Date: Sun, 30 Mar 2025 18:36:27 +0800
Message-ID: <20250330103627.2370771-2-woodyzhang666@gmail.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace magic number with PLATFORM_DEVID_NONE to make it more
informative.

Signed-off-by: Woody Zhang <woodyzhang666@gmail.com>
---
 drivers/base/platform.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/base/platform.c b/drivers/base/platform.c
index 1813cfd0c4bd..63dfa41f0904 100644
--- a/drivers/base/platform.c
+++ b/drivers/base/platform.c
@@ -982,7 +982,7 @@ struct platform_device * __init_or_module __platform_create_bundle(
 	struct platform_device *pdev;
 	int error;
 
-	pdev = platform_device_alloc(driver->driver.name, -1);
+	pdev = platform_device_alloc(driver->driver.name, PLATFORM_DEVID_NONE);
 	if (!pdev) {
 		error = -ENOMEM;
 		goto err_out;
-- 
2.47.2

