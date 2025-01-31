Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A1341EE7D9
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 17:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738343867; cv=none; b=RfjKCgbNUeExRVWHkMrCZJEOc+5HsIxfFhatnaNRvGH7KBg3JoLUuQQWNSOsvQQfNa1oFEfysfvqrEYjVRqbjgJM3y7kBTQiQVXWp62g1SZAQyP0AHwK/8WsuQek8nGbMJwJyAjmT7uSG2HL5yiFlKVtohgN1ffoGZ2mmagZ5Kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738343867; c=relaxed/simple;
	bh=09kNXWhZHABetOB9h3rHP1FXl8owoT53i+dqjuQBYNE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GQ9hs+9IH41HxpDN6cvcC4p7yLlA3iYMSts530uWYu1Uvvc+lt3G0huNuO+Ppd/ErRgDQ58DLtvXfa5AutcXNc05BHNrJIt8O/IFZL6ARIc82+LttGGKm27TfPsaqIbY1E4hjQ99nMW3CoNZVcOr5A+SQFukMWk7xJ/qV7JsQ7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=I7VjqlPr; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="I7VjqlPr"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5dc7425ec5fso4069824a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 09:17:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1738343864; x=1738948664; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CL0BxI02OVOAaESH4fyNi8OWq4uuKna8aSMt4xy8CE0=;
        b=I7VjqlPr2NpRg3nJlXLfj6J9r08m6rcFxylJ7qLdTWHLMd/qQtgon1InD7ss4XsucB
         sLeMX/AJ+eJihM+A9DXzs+PLI1kN/gonmduGpXB2RgeRbId8nbtGUpao0hfHjhert8I2
         piDJDcF2hDIGPQrN85Bk0VnUGH2v8UduNBKPY0297BOu6qxXHnooe9fzL38zHM6vAooq
         b5Q6lgIb5X4zy+hCRj72hbkZy2JTXzbc4po5+YQNC+h9sN/IycnEThXujnI5JoJzTDs5
         DImqbNf/Qy/Q8nhY5upU+L8BomDibzZbThBZZmvGZo4GETRyC70+N2W85q4Cx4nClDzr
         dttw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738343864; x=1738948664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CL0BxI02OVOAaESH4fyNi8OWq4uuKna8aSMt4xy8CE0=;
        b=pzsJMA82xm425fv/MqK3vLglQ2DSnalfRyzYFazmR6sAGLjwHC1dowQlfM27xtBmHz
         C9x29ZVAbr7nKTiS8ZxQHVRWBfKgsczZY+lyjhVJ15psiSkKDP0LVzpy6dPVhBu276qO
         8jELzec71grqVhPnad8Zn9HhMrJcZofgBybenveGPe3k/sUS6D0Gf+ScN/yRVik6ICyK
         HHOjn/qFLdaSF4IRztlsgjmrs9wCVMd7gQyzGhDymw++wvr1G1IJtbVZwEVnYCiDQfOj
         uavBvJGRz7eIzF4vynMazAjI3CviwClLN3IadfZsd0+LLztrrua7mFTkIKx91C2Zkqad
         yORQ==
X-Forwarded-Encrypted: i=1; AJvYcCWa1hwqkZyoZCaNSRZ07H1f6+IThx2Tgrrl/kVGnPwgah1iUHqcHlyHiFsst8iT1GPyw37fPBwvcqLpPck=@vger.kernel.org
X-Gm-Message-State: AOJu0YwiaPY++xQV1CSIYNuRbOMq9WSRqzW7E3f4SfdKgDz21SSF7BJ4
	DUUMErsJ/jeNDOu8xp5tLP2MQHDsSppVpFMAd8b4b6wvkWN+MK6cu7fUygyv880=
X-Gm-Gg: ASbGnctLxV+UOwdls45Nkrx0RQoxlSgiPbJ7akybqIvWVjuGHmnqJI9CQNc3JfHybl9
	AJd5jQ7ua4GauM9fMNlRrLbZtb9xpX6yZZC0VITcHLe8YLovwwKwzXgKG26yZFPEZf4iuXSUNFP
	ZFHLkzEnB4EcPQDX6cQEAr6fUXjCqxXV0uVE08uG194YaAFSuD9IY1NplEERRnHFfeqwKadj0vE
	7lQ0iqcCZ0B5oIIrM+AWg3iLvvURFCvroIC+vK69cTAAKVfjHYLZZWg4S2pBK/zF/K8AfqCaVKq
	4/05Gc5KJfE77soQWf7R40bfqi5D21ZIpDF/aQk+gvSiWCJGVQYVmw==
X-Google-Smtp-Source: AGHT+IEDlONj5YvPq5c9lS9S2mmrtJaZ7pkc214uLF9lHWbxVzsLWKeCtK6iBKu7knG0EUXmxhqoWA==
X-Received: by 2002:a05:6402:5250:b0:5dc:63d:b0c1 with SMTP id 4fb4d7f45d1cf-5dc5effb039mr12390136a12.29.1738343864160;
        Fri, 31 Jan 2025 09:17:44 -0800 (PST)
Received: from fedora.. (cpe-188-129-44-249.dynamic.amis.hr. [188.129.44.249])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5dc723e4b6dsm3142413a12.24.2025.01.31.09.17.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 09:17:43 -0800 (PST)
From: Robert Marko <robert.marko@sartura.hr>
To: catalin.marinas@arm.com,
	will@kernel.org,
	lee@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	arnd@arndb.de
Cc: luka.perkov@sartura.hr,
	daniel.machon@microchip.com,
	Robert Marko <robert.marko@sartura.hr>,
	Nicolas Ferre <nicolas.ferre@microchip.com>
Subject: [PATCH v5 2/2] mfd: at91-usart: make it selectable for ARCH_LAN969X
Date: Fri, 31 Jan 2025 18:14:10 +0100
Message-ID: <20250131171739.1044701-2-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250131171739.1044701-1-robert.marko@sartura.hr>
References: <20250131171739.1044701-1-robert.marko@sartura.hr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

LAN969x uses the AT91 USART IP so make it selectable for ARCH_LAN969X.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>
Acked-by: Lee Jones <lee@kernel.org>
---
Changes in v5:
* Rebase on top of next-20250131

Changes in v4:
* Add the missing whitespace before COMPILE_TEST

Changes in v3:
* Pickup Acked-by from Lee

Changes in v2:
* Pickup Acked-by from Nicolas

 drivers/mfd/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 6b0682af6e32..d44c69bb3dfd 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -138,7 +138,7 @@ config MFD_AAT2870_CORE
 config MFD_AT91_USART
 	tristate "AT91 USART Driver"
 	select MFD_CORE
-	depends on ARCH_AT91 || COMPILE_TEST
+	depends on ARCH_AT91 || ARCH_LAN969X || COMPILE_TEST
 	help
 	  Select this to get support for AT91 USART IP. This is a wrapper
 	  over at91-usart-serial driver and usart-spi-driver. Only one function
-- 
2.48.1

