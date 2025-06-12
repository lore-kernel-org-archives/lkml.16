Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FAB71E51EB
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 07:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749714525; cv=none; b=f7xvJHlLhrk/f6qjMstL0/2mWpMPWT/ZoRycYYXyc4KAVUkaVhER9Fdu5ZMAeI3vUdva9QUi91KqjMIIgK0ay/gqh+swFTupk0Htuk3fQVBstuCeem1jyQaA54WW2yHe3Phl0fzC/8M0iCsJQ+qLUd+LGk/Xkifa8AxoVoZ6qrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749714525; c=relaxed/simple;
	bh=WkPpAAZN6wiya3x1lfspsnoQ69Jw3+KU8DkWcXoaPlQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Hw98o115h783xdxyaGql5nIR2gPyDZ2R2I4hgKDkS6xqCH/APQ5tmwGBEK6Vg4mTBuKhbg02kvRgMBUNPurTHilfnNYRcIldfpNU+NymyrIStWVNcCvQtpl04cZkUj+T0SskS7EcataGen1JHrmEfYopxzrE5Qv7U4zEWdi9UtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=SBXydNzh; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="SBXydNzh"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4531e146a24so3716345e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 00:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749714522; x=1750319322; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=M6kbazs5dYqqqHnTBGLekJlCVKFOup+/Gt2I17JMQJg=;
        b=SBXydNzhC5rByHXbAmTjGEC5yQTWwG73guwr7CDgfwJinOEfHKc/Byj4ahndCwvnD7
         trRvZa9kXh6o0TV9ICEmq6ZRQ6Ilf9bbt0abnz4ZGf/mbr4EtJbsOa8HtGrtFx5kAVEO
         mRq+zJGBiec6yqlgubRB7pB65f8GbIfQ86byO8HwhCKLllZnqw5Jrjjcm3ZmSwXZ4hVF
         NmCDJ4x5Kkx2zYuC4s76xC156I4vEuIXjszDtSpqZjgpEYfsxwc/FHAKaGPEH85xRRDM
         tFLSLe6gH5nfJ6Ml9lnpmkUiSHT8g/O/C6gEvV8/fFRIVYyGjJBNT18oMWwY2nIy8jUz
         pmFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749714522; x=1750319322;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M6kbazs5dYqqqHnTBGLekJlCVKFOup+/Gt2I17JMQJg=;
        b=c9DNqD9D/0LP7mSxGm2ieiq4XgwdLnxVd/wKgX5yLN51UxFcfGqX6op7HnY0eoXU9A
         9+Bn84tWfrtqZO/S1jIRqVZijDMOU6bnP/zp5WZ1yDs8/SDKUb+DZpE1CG7qAC86hofa
         qbIKnwOrOO4NNhy7S0jJyH8JTAu7E55sYTGA9f1uLX6+WCL0Sn6htPKQzEsZtldIbgjE
         +aEV/xDMJnzxltbM5chpeKtSYjEQqLhip/TGgt3GqvUNpH5q2SZUVtYIzBXfZiFayCLN
         AvKMdmd7LaRJBh8Aj8B3NLYJUek9dQ+EpC2zPYNP7WLaJwyl2m+XPXgtJbe0ScmylDk6
         3b1g==
X-Forwarded-Encrypted: i=1; AJvYcCX6ha9DNALyb0eEvqKp/0yC9joCB+fQKXGhr4pNcbux/hQLwMYr7OpswqFVdQ6pk6QOqiGMcIMHvF57/wc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6v7of1A3tSOBR08rzFG3w2gXRYU1ytPw75mEbda7nvDX3BxeL
	SWKkhT+xn28sHdPWmN+HtBQdWsCSe3sX7qRheUuGHnkUahmUmymAL+9/phS0CkHx30k=
X-Gm-Gg: ASbGncvzpAGNDtKJdqCBYsD5sXK7YqnSpD5Ey2LLpn/fYLxeIjDb3rX9iSPwPg4HC35
	+3dXxNcwIfcyB1hchyDZoFkzxDz42y4nn98tjGe9+EXUR+qRvOU/FH6dUCfTT7e48E5DgBjPq0n
	SdQ9thg27w/bAJZ9UWiTTC0vA0S0npElTmQuz9NaprlIxb64QPeGZR2IoDuEkbcxdEzWLWoAoWQ
	Kgo705Sy6Wy6F/AR4U2yiPoX2Sb75pvio/5HADnkxrxypolIIVF+GmoIKK3D2D1GdsjjPP02qvn
	8xFcL0y4LAx/ctYxx7mjlMcz4CBjvu3EjifwFq99BSpQPzUmsGxIejYBnyOCUZA7iumI0f/gxw=
	=
X-Google-Smtp-Source: AGHT+IGfspKVbS1RMGhdM0mqEwwSe16gt1zmT0hxrDLfPBZvEF5ETRkitqYhctrTwYTM+zUgT5aL1g==
X-Received: by 2002:a05:600c:8587:b0:450:cabd:160 with SMTP id 5b1f17b1804b1-453249d2072mr43594245e9.3.1749714521536;
        Thu, 12 Jun 2025 00:48:41 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:8b99:9926:3892:5310])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e268de2sm11983455e9.40.2025.06.12.00.48.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 00:48:41 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: platform-driver-x86@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2] platform/x86: silicom: remove unnecessary GPIO line direction check
Date: Thu, 12 Jun 2025 09:48:35 +0200
Message-ID: <20250612074835.13800-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

As of commit 92ac7de3175e3 ("gpiolib: don't allow setting values on input
lines"), the GPIO core makes sure values cannot be set on input lines.
Remove the unnecessary check.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Changes in v2:
- remove the now unused variable

 drivers/platform/x86/silicom-platform.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/platform/x86/silicom-platform.c b/drivers/platform/x86/silicom-platform.c
index 021f3fed197a6..63b5da410ed57 100644
--- a/drivers/platform/x86/silicom-platform.c
+++ b/drivers/platform/x86/silicom-platform.c
@@ -248,13 +248,9 @@ static int silicom_gpio_direction_input(struct gpio_chip *gc,
 static int silicom_gpio_set(struct gpio_chip *gc, unsigned int offset,
 			    int value)
 {
-	int direction = silicom_gpio_get_direction(gc, offset);
 	u8 *channels = gpiochip_get_data(gc);
 	int channel = channels[offset];
 
-	if (direction == GPIO_LINE_DIRECTION_IN)
-		return -EPERM;
-
 	silicom_mec_port_set(channel, !value);
 
 	return 0;
-- 
2.48.1

