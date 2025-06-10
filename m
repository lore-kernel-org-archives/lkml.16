Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17E3D2949F4
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 12:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749559187; cv=none; b=Ua5ldXfMsohh0sfZPp2vFN+eiOxvTN+TlMTSRtEYtgjtSjl5fix6YMC+bsYnv7kNyEjzyac2o9ijdGGQgM7vXLmiqExpqEJpGRkVL4xAYR5aYQafz4qtE1zF/mSumgGjCb8sp2shHpVNMx4apGFPhm7R1VlR49QJBdmmHMQWZak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749559187; c=relaxed/simple;
	bh=KXTXXP3gmXsNBhYbI2pbPJi+i5iUcrgAC6+iwNI9gfY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=c3MaXYEVrySoJV4vhclBPf4M+o6sIzgnKsVY+zO9cOu7PB0Lp8XPe+nEHa4ZSyj8JNdS2lYNFUnk367W6qPlMwWv8UZlXdSEWfYMEHY//TrSc1cmAoweSCl5msma825ou8HxGrgpkq/VQtohhDpt46nBD/fK0sdkd3yM/DtWNZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=eJq0kpHD; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="eJq0kpHD"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a365a6804eso3397955f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 05:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749559184; x=1750163984; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YPKfuOMVlbRpUw4IXBiIuvItt2oYtJYUzHdFDWi/ifU=;
        b=eJq0kpHDLxVySOglWhoLTtw1bXg0mYNYuBO9ysd8SWZ8Fcu7Uwn2QLv1OVI1hPwLg+
         jV925U8OjcR7LBj4YQye9Yq2yzTSaeTgALrOvDkrGxjEo3f89dvK1iKlgfS/NuLbEcNW
         JEN7ZYa8o2xdbc9znHhNmgwcBGRmZqKsTaL+qXvSD0yz9oVfvDZMG0xVZP0649vJuo6G
         RbK8idyIqrgzWg4FR7shZ+djKi/pGWqUTYhj2Wkh+vIxYrS+YlspQzC1FAW1CvxIpnU/
         4xDjioDVtmQ78W38AojeFcSdI8Y2cMMiHg5CKwyAgUcpsZWH4nJK7sKlFzroyWq7jTSr
         kcQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749559184; x=1750163984;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YPKfuOMVlbRpUw4IXBiIuvItt2oYtJYUzHdFDWi/ifU=;
        b=CtG8lb/ieldhvLWmDTBOtvxw0VoMVzyYDccFlqO62GC+IDWjcU7qS+UZZqFa8+Ia0h
         xrWitTcX30plE+DQnYS48QoBQTiCvnX0I2zgwq1hPWP6R9X+cmA+m/FbwLXGf847atIJ
         e5akBoYG06ECeX4vR7ElETDjRnF1alTwSk8g4Sps+wVbWyVmT1qZhN+KR8RSVifZvDCq
         VosNXRA2hzSaJoWD+B+Tka0t8aar/Mz9SgXtLs8dHufFQ6qwMOcJge8bTH7ODIzzQCJf
         2/TcqmYL6C4YxzKn3UAfp3Tr6Eal4UyUJjbkP8gUiqf1oJx0w6/K/cizxzLR9pn+yCsK
         1t8g==
X-Forwarded-Encrypted: i=1; AJvYcCVmO/UIO35qTs0OhkLT4utmFMFsAKjZ988t4gmhuSk1KbKvpUAHyZHFFDrpDvV7jQZP1r/PgKsvj445ey8=@vger.kernel.org
X-Gm-Message-State: AOJu0YynZsgFKlXZbWmvKSxFqJMcDp2IXFLi5rHhv1qD7BRXxxIV38Ic
	/UxD/hmROBuM5HAznE8AwViINSAdjkyFnNbRrzyw2+mtd1rEeEyLr+I+/m12b81cIH8=
X-Gm-Gg: ASbGnctI8HltHvnSH+Ujrg1ju9XRt8k3YFu7uX/iRP9gB7jbhZ3qRGjgL7azK4Xd1Aw
	H/+0fQoUCfT2pf2cD4c9X9pQnWjnn25hnR1oeVlZyomvrmec+siKtrw20++6m++OC3sUJIjc+v2
	uu0rYRm31IVu3Y63BJ1e4icjk4f4zkpOhCACMj8bTXAz760Mf4HmxChTNJijAXjpi+Nnbk0LPES
	RUsUWHNyqPQpCffu/jS/LMTXbyc3VaREtbS38Z02Uamk1WSQe/EWRW3ZkdV0N7lrw6Ul8Wb0RJY
	swY4enZcL58C8cOj+kYomf1r/V5jYbS1nDuwxEIrRj3zL+8AFHmpdN3yNUnPT9A=
X-Google-Smtp-Source: AGHT+IF1pGVxA2n06a4mUJOaPcUC12E4n2SYkwvR8YbpfWzpR+In3E2l3SO02IrOhVsK0sOOVrY45g==
X-Received: by 2002:a5d:588a:0:b0:3a4:ee40:715c with SMTP id ffacd0b85a97d-3a552270e62mr2300700f8f.14.1749559184285;
        Tue, 10 Jun 2025 05:39:44 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-452730c66a1sm136875645e9.27.2025.06.10.05.39.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 05:39:44 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 10 Jun 2025 14:39:42 +0200
Subject: [PATCH] ssb: use new GPIO line value setter callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-gpiochip-set-rv-ssb-v1-1-0bee5b45b411@linaro.org>
X-B4-Tracking: v=1; b=H4sIAI0nSGgC/x3MQQqAIBBA0avErBswTaKuEi3SxppNiRMSSHdPW
 r7F/wWEEpPA1BRIlFn4Oiu6tgF/rOdOyFs1aKWtsnrAPfLlD44odGPKKOKwHx1ZMyrjQoBaxkS
 Bn/86L+/7AWMW25xlAAAA
X-Change-ID: 20250527-gpiochip-set-rv-ssb-49be53903bff
To: Michael Buesch <m@bues.ch>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2075;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=x0asc55yG8x1b/JqLeRyMXrXUOrKy+YdFo9YcQyCb6U=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSCePqJx2yizehDQ4d2fDi4+3GA5zrBrzZlpJv
 r7JcVS2EACJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEgnjwAKCRARpy6gFHHX
 cvAJD/9kjEs6DFFeU9UuqOju+HHgkywwjEjXJQD7d2XOk/Aslcrdq4iL3IFcTT0+S5gvjy+M4qB
 +I9Y59j7B2lNRRGVMBXdHt6wnhvo1qPUogiEX4fNKMjMZp7IGp/iQaUsu/SmeEwPPoKBkBEFwt3
 ACQaK5iMMC8uDT0LP/v3BP/YNKJM/FKBi5UjHIpCAWkFA073h8d+2XifBGHDLhYhvR2Jw8JkQ7J
 TIJojQ3uOjnkhuSq0BQ5L8S8rL2adh3wVo5yZqMAETNJS2rdlL4ru/D5jB5oyxyaguvCSPRvxSX
 VppYKUybKedmBY/UqPeiXgT7Htp5+vkJstQnOZPgTvFEdlCRKzeZAImQdUYid7uwx+OEGxrThxd
 Wf/LeQy2+OsvROH+AYnt2RqmHYgqyFcAp6kd/kU3gIAEfHjQzVm2jgnkE+Z94zA6OozWneaoO/7
 gWDjcxh9uXmyl+1YG4dLzGLB9nQOiBvh3HfCeuWA77nYaBRgOMPnEkEETlLH4sZJEJObpJdiXEu
 WC7soYHhkKr+Q8tjnjsRlZfFQPCsOdlVNGtfciN9rXkE0zS3y9kcl9RAB5aCRwfyuQrq8e/FQFj
 gwft6AX6zqTGz9vgoLL8a+q6nFobkfVPR0tfyhEWeLSKp+RqfEHQt3r5fMc3JHrnpMG+YJJtfAT
 Q08UeU0tirxhroQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
values") added new line setter callbacks to struct gpio_chip. They allow
to indicate failures to callers. We're in the process of converting all
GPIO controllers to using them before removing the old ones
---
 drivers/ssb/driver_gpio.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/ssb/driver_gpio.c b/drivers/ssb/driver_gpio.c
index f9426a58665365e3f85bc6515049f9c551a78589..14ad57954a662383ec0f0741835da55cbd21a44e 100644
--- a/drivers/ssb/driver_gpio.c
+++ b/drivers/ssb/driver_gpio.c
@@ -45,12 +45,14 @@ static int ssb_gpio_chipco_get_value(struct gpio_chip *chip, unsigned int gpio)
 	return !!ssb_chipco_gpio_in(&bus->chipco, 1 << gpio);
 }
 
-static void ssb_gpio_chipco_set_value(struct gpio_chip *chip, unsigned int gpio,
-				      int value)
+static int ssb_gpio_chipco_set_value(struct gpio_chip *chip, unsigned int gpio,
+				     int value)
 {
 	struct ssb_bus *bus = gpiochip_get_data(chip);
 
 	ssb_chipco_gpio_out(&bus->chipco, 1 << gpio, value ? 1 << gpio : 0);
+
+	return 0;
 }
 
 static int ssb_gpio_chipco_direction_input(struct gpio_chip *chip,
@@ -223,7 +225,7 @@ static int ssb_gpio_chipco_init(struct ssb_bus *bus)
 	chip->request		= ssb_gpio_chipco_request;
 	chip->free		= ssb_gpio_chipco_free;
 	chip->get		= ssb_gpio_chipco_get_value;
-	chip->set		= ssb_gpio_chipco_set_value;
+	chip->set_rv		= ssb_gpio_chipco_set_value;
 	chip->direction_input	= ssb_gpio_chipco_direction_input;
 	chip->direction_output	= ssb_gpio_chipco_direction_output;
 #if IS_ENABLED(CONFIG_SSB_EMBEDDED)

---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250527-gpiochip-set-rv-ssb-49be53903bff

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

