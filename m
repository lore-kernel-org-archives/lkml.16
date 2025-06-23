Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 472291EE01A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 06:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750661103; cv=none; b=RFvetHXdMH7TfF2UQ1BnPWqI+iwvgoXXqWM7L4NYYeZcYy8SifWXniY2Vq0HU1cKDznhJLg+f5pWFhq940c6rk1QbBRmj/CL2569n6kPRs1rWkJDtHsJMdWVVXwNjKwUfxDM77P6xkD3/3jk2m6pKraj6MGea1lTd7N4nAQTz/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750661103; c=relaxed/simple;
	bh=FuWpotRDIyEvFRCG/nxmNN/jO2swjOVfbhbhqHJw88c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IXsj67tK+iNwlzRBQ7a/IwXafSeh1lgjaoTX7ExA84WDSiva8aas9tHXs7kmrhwieoF4QATtrE/7SAmRTAqUihcafR8rr3c2Xg4oqXGpH2iBExEnor0++5vDOSq6e1VQWnVI7ZmcVehhOqwvosHOeg+sjZMLRafKc+aLyYA6tr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=G1OUBWLo; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="G1OUBWLo"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6077dea37easo7243026a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 23:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750661100; x=1751265900; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W8j0earuMk91sZoSa/Jgd1WatXgxkmiiaUFmqx99Roc=;
        b=G1OUBWLoRGJO5hYXNyYDrAC9ZlJGqa6YS9GWQBWHQXacu1WKYLBvL+jI/JG94SplEK
         HVBxpc5HVXz1xFpG3n+TKkptVlCosGg1jMhKOi0crexvFzVlaLDKUMMLMYJBx9qwRgUu
         QOrI+iddwSwsFzXKIv75vNHGgD6bdIRhL8oa2lnrpsAmv+cQQ6bsh6620LiqrkIaTgXR
         brpgt3P2buMYeJpQW2vuQhBd+r7/IltDu6STgxfbNsk2ICN/Vh4g7P/1UOI18uxEFlHa
         CMNE+I97Jj/Kz1zlubLVfKdaSe1Sy2pl1eXOvTSXatGyQOMEDv1qSrRLKk0MFXJ3zHBT
         CAIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750661100; x=1751265900;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W8j0earuMk91sZoSa/Jgd1WatXgxkmiiaUFmqx99Roc=;
        b=eOILiOgtp3kcudGpCcrVOH0zJY03sHDUya+2eu57OqXSEb/ArsV8cYmuEGsJPQQmo/
         WrrHTIqaQ9V6pP9HXe4G5EksbT8LwISDk6XVnfDkCC1X/DA6Bv8FWLdJi4Q7QXEUY6om
         qIPA5f7O+2WBa+vsS2ywljR82jPBMzhiRGalYl+chWGQRAyA6Z8dVGOdb74vkjH2Y/mk
         lmqkWLSBhN5qZ//TaXuUMcRi7VtNWc85XA9KKYurCc6FtlaHcmrVbruZHsKUPfZgHA/O
         fiOLGLCpXAaOlOTWRpOSFuwsakH2ljQ7kZFO1SAaeM00mH6B0mujrsoU4CydyoDT5Ndt
         jdpA==
X-Forwarded-Encrypted: i=1; AJvYcCVwwjlNBmggqENQqCnlgeGEx7i8uB0KYwxzVaVw9y7QZKnDE6JiuJCXf23DpgnKbuFqQxiCPGhkANbrfPw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0jbMM0rpAvu7g/bTpnQNoYeboGOgQw87xdSvg9pK0WhSrM0y9
	z69JLyYnA5MaxLgtKg0Xz2FPOea4XC9rPg+ICAzEaNYpeLknBfgZFXNZBwfucJ4JigY=
X-Gm-Gg: ASbGnctK9AbzAPn/YtvBZ0MeGLOLBNtvHeepIY2tiSXYTCHS0EVzy5U2WMgGu731psa
	+lAr88aIQguG5mGM2jYbsKRD/Jtos5Ey7cYgYrfhojRA/Ce5o/nR7i94vhnI5Fy/y67FRkUHZLX
	MOJQFKTOQUMs4PYGVeD8y9hFxWNNQjAO4JdF0ZDpiKdlohdB4CjS6xrNMpjp1n1wCCEJGwGNj3C
	nQ2QpnKftZXUD0mGOTFDBwMha+E7zAcI8ALW+KGmJZue8QMI3dIiHGRmuYL2LKU8tvbu8bU5QCP
	vWtx5gykxTF6j1N2EJXwNixw96lX8/bFlA6aJ6qenmVuaEItb19LdqKH2lsdUgq7GzAkxE4pq66
	w8XHTOz0tuOpHKi3GJIvewDCYKOvqCaE/
X-Google-Smtp-Source: AGHT+IE8m6sV6mGT4W4Z3eOR9YDBYYzBxtwk7TVZKt44W93HSiVrTunOecK2T81aA/Q+qJNWY1i1yg==
X-Received: by 2002:a17:907:1c95:b0:adb:449c:7621 with SMTP id a640c23a62f3a-ae057c0f672mr1169047266b.29.1750661099726;
        Sun, 22 Jun 2025 23:44:59 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae053ee4ce9sm659258266b.69.2025.06.22.23.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jun 2025 23:44:59 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Mon, 23 Jun 2025 08:44:48 +0200
Subject: [PATCH v2 4/5] fbdev/simplefb: Sort headers correctly
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250623-simple-drm-fb-icc-v2-4-f69b86cd3d7d@fairphone.com>
References: <20250623-simple-drm-fb-icc-v2-0-f69b86cd3d7d@fairphone.com>
In-Reply-To: <20250623-simple-drm-fb-icc-v2-0-f69b86cd3d7d@fairphone.com>
To: Hans de Goede <hdegoede@redhat.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Javier Martinez Canillas <javierm@redhat.com>, Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750661095; l=1094;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=FuWpotRDIyEvFRCG/nxmNN/jO2swjOVfbhbhqHJw88c=;
 b=kXVSPEOY4GhdxIVGXUvtFGyi8NaioGV03rhp+XgPSoKPhDZTGGSFak070HpEI5tJff8X94PQS
 azxFMPS9dLaDcaEfVYWwQaXl3Ps5kdOPKrCiKnmBij4JtYNIp525Z22
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Make sure the headers are sorted alphabetically to ensure consistent
code.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/video/fbdev/simplefb.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/video/fbdev/simplefb.c b/drivers/video/fbdev/simplefb.c
index be95fcddce4c8ca794826b805cd7dad2985bd637..db27d51046af5cc3c46a0bc81ad9d9ed9a0783cc 100644
--- a/drivers/video/fbdev/simplefb.c
+++ b/drivers/video/fbdev/simplefb.c
@@ -13,18 +13,18 @@
  */
 
 #include <linux/aperture.h>
+#include <linux/clk.h>
 #include <linux/errno.h>
 #include <linux/fb.h>
 #include <linux/io.h>
 #include <linux/module.h>
-#include <linux/platform_data/simplefb.h>
-#include <linux/platform_device.h>
-#include <linux/clk.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/of_clk.h>
 #include <linux/of_platform.h>
 #include <linux/parser.h>
+#include <linux/platform_data/simplefb.h>
+#include <linux/platform_device.h>
 #include <linux/pm_domain.h>
 #include <linux/regulator/consumer.h>
 

-- 
2.50.0

