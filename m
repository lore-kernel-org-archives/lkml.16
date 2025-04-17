Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F063A25485D
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 16:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744906344; cv=none; b=qR52BENgZCDafY2hzTzfKxGLuLl+xx30pVvNTqstoJC4FV5Yj39TFOIniciXhG0BlobIv1u1WGvs/6Gz1K78rAV5OShWyrIYhJ6Ja68t5rn9b/M8jCCuXz71Z4aHjl0d+Y0Gd2lOUUwrDbOicnftq5mH3v2QlqRS7UkEaZ1zHNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744906344; c=relaxed/simple;
	bh=0Q0DWe19utyA4ej4AtI6DyRYM1+ASdVetqE8CuoDjt0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Y3/28HXNT/RheYnsuSRK1yIRjRU0FOH3gJPP+IDDbvq4qtSefNjBpR3mcPbIYZ55fJdp1tQyPp1wzEvCn8qx6x17x7BDkr/zxPYm2UorRQnCu5ua5WmMqbxyhHFKkiWfzqlOnM1yGW1oC15OIecEfvsjLLk82s75nkS4Wl0r9LY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m/v2lM77; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m/v2lM77"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-54b10956398so1182709e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 09:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744906341; x=1745511141; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XKhggK0iP4H5P0sO/10YkMOJNAlvYeGYtR/+VEiaaSw=;
        b=m/v2lM77EkhpGjG5oFeqN96/Xjggub8B+KLXe/15Jf3RRenEPIognMZELXaWEKF9Ao
         5MQ0pa4kV/U7eGl+I6SIXrFt1d39WDii9sQXrb69ihOLSiIhvafBG44Jm+WSEAX2Vuqz
         4wIeIl6CGQ7tG2mQfmO0FBODR/4NhmrgI2OUWSXdn3FTQCzepjwXsvltAjEGJAzzJFRx
         fYPScq4d+5uxbxPGXLgGzGsUw9lA4inIiGx5D/dIOp+5AcQNN2xCzW37uBONkSRHhj7i
         dRJq7nAS3dqTY0y3TfCsLsQogx9uoXhVU0oVAdjaXmoTP8b35HRZ5YfOvtIrHvY3Bl74
         cy/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744906341; x=1745511141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XKhggK0iP4H5P0sO/10YkMOJNAlvYeGYtR/+VEiaaSw=;
        b=ehS29Lp/Df+KkQzH3PeLjVZC8NeEAXRQl/dEMEA6NBKQaOr+SHAcoj12ypTRhnAxM0
         Stv3w3IgH3DiiahJHDqk23y8BkGKAjugbf69OHZ9f8smJwkFc0bFBg7RjNBA0oZFMren
         AgZoBF0e47a8ZnrtK3IjN1vYtZAZT2IlhYtbuUxngXewJUG5HUhfhgknzUlMiaiLKLMo
         0+4UdOMsJaakY/4oYlvyQoMhA+QJ2IUkNYutxvBnLqKCmDp4oo75vts9z86EqkDVjZkT
         UUzU0HMk9eAS0VPu+cenoJh3awjKaDtKm809vaT+Bi3KXQ3lYAcWpVEYtRMBuMlwgO3f
         A9mQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwOEQ/i414pnu2pslSUmdKlGBEQDeibAEe6TN1PyW4nPeW6NYzuNsfvY/73gpFSxhbDd16nGMlJQXRsRI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxngIsSAUDupO47+0YoaUaeeFb836oR9mNAzlzfmHYXJy3DCJ2A
	JulWqGx1BGQOvkAbMluwyuaQhyvkIgWyZPzyqkzE3A8/UhYe0xJu
X-Gm-Gg: ASbGncscBApwKjdCPtsIJhOttdCeVCF/hftTfVgLbfzVG2A09a3+DPWRdS+sUxNEO3m
	uAOd6KWbLXEyAxRsWFUCc4Hcrze0UycqwUyo7nC1g5UcvDsN4vrOGqfZUX03QilUxel8MIvigxw
	pdRDFX7BVla0F6l2qTrCy96Zp6YAINJDmibXv49oVGk4O7lXnuypQPsDTA9WOgydzrfus07ASaf
	ud5JzpHitLl03Gb+D5lQNUekSkXSbHUDkAIptWULCHUNRiLa/JrvTgcaCTHpeC+9pLNQPO5vmZ5
	8oar5AyHVFvo1RT5APFkBz8d4X9paIJFaCjRWx1fHMINh98=
X-Google-Smtp-Source: AGHT+IGh7I+jBQr7/0yO8FtaSB6NaNAo61mH5JNRvIsJ3e/mPOwTiyea8rKQrKdbmrErMCqFG66OkQ==
X-Received: by 2002:a05:6512:32cb:b0:54b:e70:4122 with SMTP id 2adb3069b0e04-54d6dbf65b7mr196315e87.21.1744906340739;
        Thu, 17 Apr 2025 09:12:20 -0700 (PDT)
Received: from pc638.lan ([2001:9b1:d5a0:a500:2d8:61ff:fec9:d743])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6df60cf6sm2882e87.66.2025.04.17.09.12.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 09:12:20 -0700 (PDT)
From: "Uladzislau Rezki (Sony)" <urezki@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org,
	LKML <linux-kernel@vger.kernel.org>,
	Baoquan He <bhe@redhat.com>,
	Christoph Hellwig <hch@infradead.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Oleksiy Avramchenko <oleksiy.avramchenko@sony.com>
Subject: [PATCH 3/4] MAINTAINERS: Add test_vmalloc.c to VMALLOC section
Date: Thu, 17 Apr 2025 18:12:15 +0200
Message-Id: <20250417161216.88318-3-urezki@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250417161216.88318-1-urezki@gmail.com>
References: <20250417161216.88318-1-urezki@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A vmalloc subsystem includes "lib/test_vmalloc.c" test suite.
Add an "F:" entry under VMALLOC section to track this file as
part of the subsystem.

Signed-off-by: Uladzislau Rezki (Sony) <urezki@gmail.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 17ed0b5ffdd20..8e62b09e4c9e4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25874,6 +25874,7 @@ W:	http://www.linux-mm.org
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
 F:	include/linux/vmalloc.h
 F:	mm/vmalloc.c
+F:	lib/test_vmalloc.c
 
 VME SUBSYSTEM
 L:	linux-kernel@vger.kernel.org
-- 
2.39.5

