Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C153722AE59
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 06:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747637769; cv=none; b=IYBwFpQx5MuzfQB/yBuWxvGxWx3lStqFOoqRcdIbtvVk9fP+AsvQ5Ow4tYiwbKbPszvhnbEUD4zJ3me4UGZIB4dbXjjvmwt0RoPU+E8D8qUon2BheaN6YK27Ye2CZ2Ax8DzOST7sri8xmJfOZGCbAk8Gh2Qg9z0HxBOVp0hAzs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747637769; c=relaxed/simple;
	bh=8NDJ9XwjY+Hw9ef5xraaEJ2PXeEup+WOftekfr63tZE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HqY/crtidye0lPjyPEScj/JLWTmsdd575+nc6AZ/gp4zQJ1NUh+TpJ7Y/rZCC+Q2B8OuXzC5URrqMpdCPffSkNwuL7TxTII4MqmBdMEyVqC0kIMBYQBWaO6D2VoXQFWAGdaWYOe4m3AGrwzCdzdGC/Kl3/oadEBgyy5lx9paQyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XUGKM+Gh; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XUGKM+Gh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747637764;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=uoYFGf22vXFHYoBtKGUddYJzSMczRem5Rut6KCdwPLw=;
	b=XUGKM+GhAtkVQ7Ql5mwGIuUHpQSMJSfrdCOGt2b2/XIWv0kQm5eWzu0p4LPWlIyYANNVSK
	f6fEpFqlup23f14azLeESHUZMfiNUFQ5HH6oE5AA6pImd0LzBW3YYARYW15pZJtptxA6S4
	jaRWQs8713h7qsZcFxvsNOuG2BF8+ek=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-317-wIj7I3faPc6GN2ZnCs1y1A-1; Mon, 19 May 2025 02:56:02 -0400
X-MC-Unique: wIj7I3faPc6GN2ZnCs1y1A-1
X-Mimecast-MFC-AGG-ID: wIj7I3faPc6GN2ZnCs1y1A_1747637762
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-ad51ceda1d9so322024466b.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 23:56:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747637761; x=1748242561;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uoYFGf22vXFHYoBtKGUddYJzSMczRem5Rut6KCdwPLw=;
        b=hYHumtgIo5ookf7qhdr02wNfWYqscmYwg5J9n/TUcx7dwB7XXmdgVllfCwkNcE/jw6
         sPRJEUCoABPSi4Sv/0zzLUxd6wwAU1+4JiokYNurtbNnWtaN4CwnAH+mKzEXa9I380Hb
         2T8Jru5Z3OsCL3abDeaWZZje8egURuhkl2fZQ+RLEdTru6+su2IP7gbJnY1nMOuayOHb
         cDnyZkRGNNk6BNJfFqXoPKZCOYDtgujxpL6ev+M7SVZq2t5iKR2h2Yq9zQmJm+hBRoep
         lyHMtt16bCTBGXzAupXaK+mxpuwPGXjJqUFunCiW8CDkRuToKjph3mJSxEwMxHu1c9C9
         mzyw==
X-Forwarded-Encrypted: i=1; AJvYcCUIvW8DJysr/eTvgvUQLMGLnTheXYpCen5oLsbefwZZhCmCVNXnEKy6ya6SzJMbVBqXIqlaoOflaqttZoU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMC1g3t0PaLoCaPxr0FGDeulv2gsAXMm0xhUQShHaGtXhMQA6L
	x/OWqLrK/tlbDZLsKycvckEOeSC7Y/+OsCOC7HrmA8uh+J1E5Z13XDjNaNISAoKyB7U740dq7Oz
	D83colmA8AffNKrRaoAe6MG47cfQQgQMnKNIJW4hodcxFxs+hRVj9NxTw3+ZJw9On0A==
X-Gm-Gg: ASbGnct9SBNoRrMOlu+y2+dcSxuM6WheWp1LTGKBCLSr+ZyyhMq0pInrcmylaz3WJMH
	ebTL1OjPs+0pWcx8zwCUXdyQAORCPgviq3KUCpVb4YCoK/fdjKeCXNKyjc7WXdUt3muMcb2zpKV
	qYOaGDEdWTGBYQFYWVM+FBLSU8SQ4+qzhzwLjhGUx6FVkVvvLEbL3IXdAZGbWzjOmXt+/QtyuuB
	hFaRPAwuhYOeiifakfwWjsfWiC3iDekFm6wYoH/V5MXU23/z0QftJuHnK+JlJBpki5OoRoNdq6z
	kqGwyz8G1rBBXmAVihiZbZgIVuC2g3J+xQwRQb8Zfw8I7Ok6RERkXtpy7LI=
X-Received: by 2002:a17:907:c21:b0:ad5:1b14:15f4 with SMTP id a640c23a62f3a-ad52fbfa34fmr875342766b.25.1747637761588;
        Sun, 18 May 2025 23:56:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG6XDR4x7P+w+zNIdbiwaUD7ggLJDGBPXBLLoGw0L3zesxGdykirkJT0v+7+kEm5cfIYzsfNQ==
X-Received: by 2002:a17:907:c21:b0:ad5:1b14:15f4 with SMTP id a640c23a62f3a-ad52fbfa34fmr875341366b.25.1747637761232;
        Sun, 18 May 2025 23:56:01 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb ([2a02:810d:7e01:ef00:bf5b:f273:a506:f71f])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d441fb5sm549446566b.108.2025.05.18.23.56.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 23:56:00 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <westeri@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	linux-gpio@vger.kernel.org,
	linux-acpi@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] MAINTAINERS: adjust file entry in GPIO ACPI SUPPORT
Date: Mon, 19 May 2025 08:55:57 +0200
Message-ID: <20250519065557.659674-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit babb541af627 ("gpiolib: acpi: Move quirks to a separate file")
splits drivers/gpio/gpiolib-acpi.c into two files, gpiolib-acpi-core.c and
gpiolib-acpi-quirks.c, but misses to adjust the file entry in GPIO ACPI
SUPPORT.

Adjust the file entry after this splitting into the two files.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 20e07e61a148..c816f8e0572e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10273,7 +10273,7 @@ L:	linux-acpi@vger.kernel.org
 S:	Supported
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-gpio-intel.git
 F:	Documentation/firmware-guide/acpi/gpio-properties.rst
-F:	drivers/gpio/gpiolib-acpi.c
+F:	drivers/gpio/gpiolib-acpi-*.c
 F:	drivers/gpio/gpiolib-acpi.h
 
 GPIO AGGREGATOR
-- 
2.49.0

