Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A6D2FC3CB
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 12:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751633951; cv=none; b=opATA32e949nMdSdn7mXrejZVH59bCWeecCQEow/iDd0PGiQYfwevUDI4FpLrtaUsKhGOC7i6AlqaUGFUXRY7aNvR7jWglQuY8gkw2NNbGx6BqmjVPbv/k9LB2Lp9Jtot8if0hvv1LwJ3TGHV1VW84rx0aqT6etU2/KIZYcCLAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751633951; c=relaxed/simple;
	bh=x4xWfBZSqqfz/V5ti2RqViVSuu/gEOo2Z1Y+BDm0ySQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ofJwGEmeNoseVYcEHMYvIRNc8W1O57l9TvpOh0ClWMfk6RkOAiKPh4480TEhVEH2uZCKvlbEi2mnULfAyCCk2S//wrhsQAuFWxscS3UW+Jkp+YmdYtsLlIH9dn204zk0q0gL3hzSFJ5DmRDd1VxKKuVAUCe/cVIAWoI8tFMJbc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Iexd9i7P; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Iexd9i7P"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-451dbe494d6so10131035e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 05:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751633948; x=1752238748; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O1S5vg6OWEI5vYVJXplRjZaK0cXCptPKall+ODc6zBI=;
        b=Iexd9i7P5Hb2gfg7ldPWwiTIDC96dTfslmqZHY+BjdpkDw7q9kqJpEf4D/r+iKA3k0
         s0p6/KBj04MwNjFLkyeJMxzv8QlbL9U+bl+p9Ov8fwVG33sA+DtEHO3VuNePf/xSynzW
         NbJtH/lAjbihWb1k3pL3wckP5tgQ8MrK0Nq/Lpnfms08ccni3iDMPvQXer8+dbXbOAU7
         0jY/JcH+mnO3wtS4Iv2PEvKJdcOT+DNsnWIpctPLn8pyi72lUgV6X0zNoD37kCrfvnCD
         dMz/XpIwXmjkRBof/zUXb0GE0HBYic6zgoVpoxkONA2f3FyJdZPvdJd0lPcFrPSMvSoT
         1gsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751633948; x=1752238748;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O1S5vg6OWEI5vYVJXplRjZaK0cXCptPKall+ODc6zBI=;
        b=gewcSKe7aL9k6rcfIaNUqhhyeVZLF3g4zxBXyRJNpWrTnE7qsezbAzEmhYKiUNu6XT
         rws8PMr2IXPserl0psKrl2HHqSsYNnyGX/d01457sdZZHjkNT1RAecqK1FXTGwwOYcvD
         5SrDtYwWpNNYW/oWgPAZcNVrQGnY+nm8kTn7orTdelnMxjm5wNk5OU1ddyzw1XMqup/a
         GFDdRcZv1iHRcNg4oHD1h0Nz31E1HY+4lPRcWPdceQ+0ORDz2nNy7v6U61JIHS6v0gcD
         9yvf8CB5UWZh9BY/z9r51L1OmzSYk2bMODirWa3m67055nhSQlOxqx9ok5T1PQhEnaZm
         foYg==
X-Forwarded-Encrypted: i=1; AJvYcCWK/tbvk8lR1qny7eGrGuZH+nltEulsHL1s+MUSlAFRG22SBQNBfU7ihVPZ7cBIEs7jLo60yNlu+lhnfZ4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbRLMNSGDcsg+fKTlo6CvQz/F+Dm12W360r3c+SE2gPx6fjYm3
	4yCO0u9oLa6bQnwH7gfv5zDyJG4RpGprCak10rwdtrcGRKQ/RhUlbYmjk1xD7jzfwB8=
X-Gm-Gg: ASbGncuUJIZU0gSWdM1cvzrYdky7yNfE5bde8/jAF334ah4CV+searVgiOHACHNXWao
	Y1uDXH/ZIqAJO2ay797aZgbR9lsASS55t8L2Lu8GC952xHySfdK09eX7+D116JyE7jgTG2UDZoP
	dA8AK8xef9Ty1R0gU8QfZ1sql4oQSygl2sfj8TnLBey2hnonfLU5o63S+3BK4PSi4/Qdx3ydSRF
	kip4mEfc79sA1bjeBtLCVB4FbOkRUJiwnBPggnhYl6/N89sDro3BpP1ihXKln1YQLU8zq7PQWf/
	t/fdbPwLKL5IoT5LqGJfr3diM2FqrkUw2Ouoh3VxwE5qyz1PLcujupBZ0g08jTdHcA==
X-Google-Smtp-Source: AGHT+IHw2SDNQnrLSf6mtAGpuLA0PvMaMpcKRIrXgIkWxcTLslTfhWTRqmBlsbaFprLv6XxZ8AR2Pg==
X-Received: by 2002:a05:600c:a4b:b0:453:1e14:6387 with SMTP id 5b1f17b1804b1-454b4ec46d0mr17230335e9.32.1751633948210;
        Fri, 04 Jul 2025 05:59:08 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:876:27c7:55ac:40ab])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454a9bcebf7sm56129665e9.21.2025.07.04.05.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 05:59:07 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 04 Jul 2025 14:58:57 +0200
Subject: [PATCH v4 10/10] gpio: TODO: remove the task for the sysfs rework
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-gpio-sysfs-chip-export-v4-10-9289d8758243@linaro.org>
References: <20250704-gpio-sysfs-chip-export-v4-0-9289d8758243@linaro.org>
In-Reply-To: <20250704-gpio-sysfs-chip-export-v4-0-9289d8758243@linaro.org>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>, 
 Kent Gibson <warthog618@gmail.com>, 
 =?utf-8?q?Jan_L=C3=BCbbe?= <jlu@pengutronix.de>, 
 Marek Vasut <marex@denx.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1713;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=hbJzVlaN/lD1PsifIIzsmeGvG4x8/iKN55oce2s//80=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoZ9AMhgzqbaNK9jpMW2hC8Ldf9/XWXB52+g6VM
 M0T4sNvzo6JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaGfQDAAKCRARpy6gFHHX
 cibOEACqCTqMfX2NBWUAWz7eZ57c2kHYnRvO8kcE6Hx+ww6XJfK0pHuTb8OOCdW7h76LjLsyRSQ
 a6/C7aorGp9Mo6ICdnmAw2Er2MDdIrHObkjIF0BxtWCxBfXPtJ0CL1vL1robY5oJeg0YYEZAu4J
 Qa5tmE9PLd8mi2PYIKtqjCz/+dYPwia23OdWihxcHbTjTsmtXOYmhv0AkB9K2W46G6WTm03WrbR
 ElFjhOoOWt0w9BYZ4CngqoZ6yhyzxdKfiNaFbfeGIhT/6D01MdeiFhqavByMUIyENMWkdqTe8Xc
 kuDPE2qwHakbs54aB2ODFSLcDCbWJx8iKJtGNMrqUYwxI6QpF/DLW92oEl/FtNMVyNY7CaFggQl
 gDh6Trb2JfNGA9L2uLLuFzft1cYfRJeH6f9f5iPesJf+NBcUjOI/VEgkSd1uNfli8Sw/q+XKLxZ
 +4JAxmj+livwF4BHj60w2UNu00fojX3vWI/A7FYHIRn1JAWc/SnJ8qZD2ZQvh7w2Sp9CmQSzNl+
 80Vft5t1fXODZbbk6OnvlmhKJ3iAu6Vz3pO2WD4ZWoGj1lGaciKD8qbrqpaxwR7Tl2oS6wXlJ51
 YbOAF4/7T8BvjeL2Io67GqMlUpxNe0pkRGuJF/9FwOQcN5r+j7nnncZbfaVOkb5KJxgs9S38CpW
 QFJ+2fbt40R1icw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Remove the completed task tracking the rework of the sysfs interface and
add a new task to track the removal of the legacy bits and pieces.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/TODO | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/TODO b/drivers/gpio/TODO
index ef53892cb44d7c01d100f10f1b805c0aca561b46..7a09a4f58551b51c55938c278a47a04e86ef4106 100644
--- a/drivers/gpio/TODO
+++ b/drivers/gpio/TODO
@@ -188,16 +188,12 @@ remove the old ones and finally rename the new ones back to the old names.
 
 -------------------------------------------------------------------------------
 
-Extend the sysfs ABI to allow exporting lines by their HW offsets
+Remove legacy sysfs features
 
-The need to support the sysfs GPIO class is one of the main obstacles to
-removing the global GPIO numberspace from the kernel. In order to wean users
-off using global numbers from user-space, extend the existing interface with
-new per-gpiochip export/unexport attributes that allow to refer to GPIOs using
-their hardware offsets within the chip.
-
-Encourage users to switch to using them and eventually remove the existing
-global export/unexport attribues.
+We have two parallel per-chip class devices and per-exported-line attribute
+groups in sysfs. One is using the obsolete global GPIO numberspace and the
+second relies on hardware offsets of pins within the chip. Remove the former
+once user-space has switched to using the latter.
 
 -------------------------------------------------------------------------------
 

-- 
2.48.1

