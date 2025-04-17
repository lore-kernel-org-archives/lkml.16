Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22F3E1DB37B
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 07:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744876021; cv=none; b=W/+8sALwurrD6TBmGb+xpwT+ko0B/qstmWRFf/PwYYfBANyqa/bTkwlFHvTLdg6O52/a0pGY9NwFIecafyGqYOVAId8xIRvkpEKz6MDw2vGxFYPWY1SFqRYCWLk6+9pzeWCPtyXFz3kBgCd0UXRXY52DjhTG1xGgLa77PWc/77E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744876021; c=relaxed/simple;
	bh=VfUJWNXRAdPQmpRhxM5fhbACYIFrjEZEGf0083dQb08=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hoK/uNkafEAR8VDxCCJEwwwKNVFZnbkHQVj/yqW8HxVCv0qJZEubR7NsmXpluuGfJl44He/GX4itCbMqWczxpgSk58h55xKiPhnlC+J8bZ31mHkRYIw+T6/uCVWV2A8+18uAs+bvAktIli+FlJpqprmiK2jmXP1PPc6AINxr3gY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gcgnfpm9; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gcgnfpm9"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3912ebb8e88so71489f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 00:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744876018; x=1745480818; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kQygXXjOvP6zFryL01i6DHpfHx1syZgEKrRCnclIt18=;
        b=gcgnfpm9KRnjSz4t3LxSGJ2aeZL6c+p1rdBPGhlFBaeZ63MXWxuna7mKT6N8GYGzJP
         8JvsGSy6fr/dMAF18ibVJcHZX8IO6eYTnR2OFo2bDoQEB3vAVysrHaj9a2TioNJLsQmY
         KtBrwqqx7Eu2/ePASOatNF9xi7ENaRX8DwEKUnF8hReWC9CXO36Lf4A48JNt8jx7SW29
         b89qXVV7q8ruZuNy48SS11URJEOwyleiwTOk4OeubrjjabY61zCMqgcZ9ZUJ3/DDILC4
         yiyRpQUUS/WCule2PGlTM2DJHu8HxQq9Oye+YnCoYMfok/GAmrZ+AgUrmik9gW5uY5Sa
         2Dzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744876018; x=1745480818;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kQygXXjOvP6zFryL01i6DHpfHx1syZgEKrRCnclIt18=;
        b=t7nQPPrFFTl498Pc5x3E8xFuS06TbYN6edrWWQWEx7lu8dtuANXBEomzxNYdZi/Rax
         kc7mRnD7+mwTJ72AEUE6gIIqFV7VtD2FXfDO7b/4P8qyU+/gLaOFKFrYR91PjFbOAvD0
         VkaScd0qPvKhhrTh3WNRiWHuTk/TCFFaiHMapcQ+wnxZ4NYDpj5nVVb/tuGkkDGhKvyY
         blXv0GPW+wE1Z9wP9BJlrg1hT+3UvCFoB0HeM/vu/NhwcdjrVqjlHlUuwnwBPvixAShj
         9XI8FIL2lIZshsVnFA8GOhPu6UATxorGYy5o4Vg+IiGrXuDElolqeahuyx5lmT5uDRDD
         Z3qA==
X-Forwarded-Encrypted: i=1; AJvYcCX9yUoz3scrrCgxViKUil5ExgNmM9O4V+8wYovzPnwpfVy4u+z0owYX7dYmw9qoEe0G1EQadDxEYxi7IDQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YysEYwC90pZmyTZHdm4TuTK6kP6j3VQA/SN8OHzC6TVa64B5Fp6
	kiAGdFpOsNZMSHUnzhh+FlumRJQNo+1GJfLQL4hZZ46ZL6mT5WzF+E4wf8Y8FFg=
X-Gm-Gg: ASbGncuZlWgd9v/MFTseLEFlw6YAGTiZs9ltxfIx/csC/j9+aPazuM5x4xcmcU4EX/z
	0/eVeiXjDSoBxDj8WKcaaThFzz6Y3PAnAhhhuMjXZDaLs4o/Guuw08My0xp5kZ6R9TYLSZadeyX
	KYTkyPBzTuZFO/2CfkR2Ba84tRzewH8wwIf4pU/ufomVLi6k0XCrSi66WTUYiCliWATZ9aKKrHx
	GTZ2uIlbJgSL9defSr/zXiIyq0OAsHUsVj2wngGD0Lhi9vOut9U5H9DoXQc+DCmW8ijGdu0eTTz
	P22Z68GijJ3sz2qktiVcfnQlB0vmXVR42BDiJUchZwkKyDtDXIBO6eAYkKi46Ct9P+nnu7//Wgg
	evMQjyw==
X-Google-Smtp-Source: AGHT+IG/Ti5uRMFgrnm9lDxH8A1EGSvNAdEZO1mK0GxpdKH8aALTdnnu3mTzhGSyWkdAN7OmEx7OMA==
X-Received: by 2002:a5d:584d:0:b0:39c:1258:2c31 with SMTP id ffacd0b85a97d-39ee5bafe20mr1509665f8f.15.1744876018396;
        Thu, 17 Apr 2025 00:46:58 -0700 (PDT)
Received: from kuoka.. (46.150.74.144.lvv.nat.volia.net. [46.150.74.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf445270sm18949243f8f.81.2025.04.17.00.46.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 00:46:57 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] leds: Do not enable by default during compile testing
Date: Thu, 17 Apr 2025 09:46:56 +0200
Message-ID: <20250417074656.81626-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enabling the compile test should not cause automatic enabling of all
drivers, but only allow to choose to compile them.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

For longer rationale:
https://lore.kernel.org/all/191543a8-2e2e-4ac4-9b2b-d253820a0c9f@app.fastmail.com/
---
 drivers/leds/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index a104cbb0a001..b107dbe1fa90 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -735,7 +735,7 @@ config LEDS_NS2
 	tristate "LED support for Network Space v2 GPIO LEDs"
 	depends on LEDS_CLASS
 	depends on MACH_KIRKWOOD || MACH_ARMADA_370 || COMPILE_TEST
-	default y
+	default y if MACH_KIRKWOOD || MACH_ARMADA_370
 	help
 	  This option enables support for the dual-GPIO LEDs found on the
 	  following LaCie/Seagate boards:
@@ -750,7 +750,7 @@ config LEDS_NETXBIG
 	depends on LEDS_CLASS
 	depends on MACH_KIRKWOOD || COMPILE_TEST
 	depends on OF_GPIO
-	default y
+	default MACH_KIRKWOOD
 	help
 	  This option enables support for LEDs found on the LaCie 2Big
 	  and 5Big Network v2 boards. The LEDs are wired to a CPLD and are
-- 
2.45.2

