Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE7F215079
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 16:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744044981; cv=none; b=rsq7TqmmE0EwuPPrkUK/g2HqMsmdkcrIN0+yaijQHdQCgSKtO80nHSq8la6/r5Rk0bW9f37mfgq5CxOhD+SVBCtgaFZw/Z4c8u67Q265lCl2vrq/T3ocIxVL406NRbCj3jP/Pj88svfk9igBoJ41ueu40bkyFestI4P0qVG6zkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744044981; c=relaxed/simple;
	bh=Ipr7PYVaEn6nY3r5e5wreXLQTo72JtqtAbjgfUZeuiY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JLDhOBCiJqB/5JNRq5JRW36oviXfndvycpdLARiV0TrIlB7wp6dwaOqGxdVLgb0vywqZ9oURMFc4AEK1FZ4bN8rIBI9xxwyOLD+N8fBvri2dEhxKsKwpRmlbw3lPdJ3pn27PmxotgSIebJyb3KqK/NKFrsWMt7j37clurs5F1dA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SBqQ7107; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SBqQ7107"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ac3b12e8518so855018666b.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 09:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744044978; x=1744649778; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9m3SFcS7v9boR9MBhfKth1VUt84e9D1szZVnPdeXUm4=;
        b=SBqQ7107eg9R44ZutuftlrLO5TiXE39zYuU50gfLIFCSjnBIyDvEWxK+cGYf60x8i7
         525eycQnMZCdV7+zh5jzOuDnuWYlaLL78AljTB39wPwv3+DKxuzCm7W4juBmL5qYJSJi
         TwZoiDXCWtXJ3dxyL3VBbjxaQMX8zXlJVHoWiLg8XuubOztGEy6itWafMZbDzE8DmzhD
         XYWTSoneaqDGarv5vwsX0jXpJFu+eYpOxjrnYVIP3POCd8+xIb7xfGrCnw28zt0gRW5R
         qo8CEb1GOEud+sPu8bXFO7pOkUJ189+7N2rwSYP4Up5etdSS/SELR+LfxCYTl+Q4GfnF
         anyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744044978; x=1744649778;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9m3SFcS7v9boR9MBhfKth1VUt84e9D1szZVnPdeXUm4=;
        b=DqXijqeKxXie4cA5VLaFdr+bTJ2W/EXkmIDyeIOuMLFf/Jo36oaFTw3hAODKdDi0AB
         1HIT02BPCRL5gZP3QQjakoGVcYTqJvkf5NkAB97sDK9gfR1NazhkKnjT1j7BmQD0oWhL
         21066b5QM3iNJbxlbZGpo/NGdcf/4Bm7RiTK7xx6AKYFFgOP2O4yXl1yv2E5ovewravw
         dT8e84Ut7P/QdQ/wehQzaG2/ffkLMn+VwkZ3etJDzRoGTF4FItjSHvN3dZXk6ZDHdu7w
         DLeDFGqRYUMArbCRwI4bbh8Gj8x614N/TX+Xkz9KDBb9u+wBCtQWbjnofRcY147cgRew
         kJDQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUmpVf+4+xM7niTLabaS4jCVDifvaTwewYmhhFbr5jmusMfSFfK31e4FNOQZcT16/qQH18yju9dHYlcVI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWIlZvwJ4avrhXLEWpCW1yiDLftUpHdOGpgmremylcGO93srEf
	WEllvr2n/iWRpe7W42E1H7mzLMk8oN/SxO8ceUfjY9tN/Ic3GA/m
X-Gm-Gg: ASbGncsbrNHCvwZRFYOzeto8sI2oXYtXoHB9QTtuqogdJjQaJjTf7OQR/zQJrk48/5g
	HPxEYo3oE4wCX/p3z1OkzkZCIb5sRfYjhCOjNtRXKoM01owoIlbrG6TrA+koRVzs4KanidIByBD
	uCv4wenIzHYRMbuYjjyq/Kyl0BWo8UVX219an17YGIaA9OYuFNbW/iDRSTrYZ3zmSWrMzjzcbJM
	/VadgboDxT4LDKiXswGaZ0yVeM60N/O0GEFvr9B2BCcgoi11HJC9GE2B7kayvRPCjq9MFVJk775
	YURcI4Ggvrqu1SXaAZuiP/tyFcTsUwY2YXA=
X-Google-Smtp-Source: AGHT+IH1Kz/8T0WZNUgO1gJkkvC4vzCjMpU46O7x6SqVz8u3U8uFqTr3j9NeDtrPnjr1DizbTSckAQ==
X-Received: by 2002:a17:906:b293:b0:ac8:197f:3ff6 with SMTP id a640c23a62f3a-ac8197f4094mr33183066b.28.1744044977703;
        Mon, 07 Apr 2025 09:56:17 -0700 (PDT)
Received: from pc ([196.235.56.129])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7bfe5d46esm786264966b.19.2025.04.07.09.56.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 09:56:17 -0700 (PDT)
Date: Mon, 7 Apr 2025 17:56:14 +0100
From: Salah Triki <salah.triki@gmail.com>
To: Jim Cromie <jim.cromie@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org
Cc: salah.triki@gmail.com
Subject: [PATCH] drivers: char: scx200_gpio: check return value of cdev_add()
Message-ID: <Z_QDrlkYnmsVRe5w@pc>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Check return value of cdev_add() and in case of error unregister the
range of device numbers.

Signed-off-by: Salah Triki <salah.triki@gmail.com>
---
 drivers/char/scx200_gpio.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/char/scx200_gpio.c b/drivers/char/scx200_gpio.c
index 700e6affea6f..36efcc828e8e 100644
--- a/drivers/char/scx200_gpio.c
+++ b/drivers/char/scx200_gpio.c
@@ -107,10 +107,14 @@ static int __init scx200_gpio_init(void)
 	}
 
 	cdev_init(&scx200_gpio_cdev, &scx200_gpio_fileops);
-	cdev_add(&scx200_gpio_cdev, devid, MAX_PINS);
+	rc = cdev_add(&scx200_gpio_cdev, devid, MAX_PINS);
+	if (rc)
+		goto unregister_chrdev_region;
 
 	return 0; /* succeed */
 
+unregister_chrdev_region:
+	unregister_chrdev_region(devid, MAX_PINS);
 undo_platform_device_add:
 	platform_device_del(pdev);
 undo_malloc:
-- 
2.43.0

