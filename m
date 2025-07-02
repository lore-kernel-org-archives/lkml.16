Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E8B12A1AA;
	Wed,  2 Jul 2025 08:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751446153; cv=none; b=GvK4g21tKId7qR0GN44nVw5oacq+95VylG3Fvxv4LlVyHOXMp4CS8jM//jsI66cH3IxXXacpZC8/fJC+31h7ByzHrQ48pwbxp9x9nh71D2QepksYdNYT+P6dLD11CVDRCPzPHyygTc7Ydm4YU4olk07hLdYA6+4GyvrO7MtwbW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751446153; c=relaxed/simple;
	bh=pN6S6Kr2awGyzUosjuLOvo1Cjly8ude4L4r2H8Ykeg8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=o4cNdE60xyMXKz230/Ff0JOfbx8cAofXa5asuhCC3a2fLYg078A5iMgnFVBp0+51cRTaYCG/q1XmV7ZjdNfmSTdkzgliAnczc7/iFQ5u+SZ2RNh6BFAqGA1GFuN6++j84vhHMxx090o8/uaj4D28wGDZ3163uo98a16lcTZRJLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Weoz0dYb; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Weoz0dYb"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-451ebd3d149so21772825e9.2;
        Wed, 02 Jul 2025 01:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751446149; x=1752050949; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iziNAMdJAZIDx33n/pmbnZ5EW53u9SNG08MJ3g31k6s=;
        b=Weoz0dYbFWVuSqGdIuBrds4fDaGzmCPJg+b+uWYpi8gJos4A45RMqmApXx6VMqutqy
         P+xFZpJuQaN/9w0Fs/9CihjQ6a7HFeqx5et6bfsxaGbV/GtIhl2dIUIjU62bkX2GgQsK
         ounsZpSdc8GxRRJuwRjGRv1LtQDK/KTeyhgiDrwFBELjQubQNyWYZ/wU6lcU4YNsSj0E
         zDgCVCMWCTMTjUZKeRI8ZYW+lT7yTRxp3LP03HY8ottnyru3gOgGvDU98JxgVGPBoNML
         U5fWEP5zfaMaezVqa1upaD9t6bCwqIU5hHkIEO9JAhYYrKkAhYLroXTyI4U/WRDrYkLl
         umOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751446149; x=1752050949;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iziNAMdJAZIDx33n/pmbnZ5EW53u9SNG08MJ3g31k6s=;
        b=aqtV18xO1snRXn3I01hqpbMZWnMU2acQ7366OLDAM5hhh0mPPWCyysmoN8ZkuXM8Lt
         Ie8tq5PO4cniOuKcUPRIyxDA6nWhQXzrcdaOh2nyY82y1Q5X76NodfqcAD6PeBlfuHEB
         VNnCP2TaMDtTIkQwOOzw0vzv5InRHlT7VeByF+a6SKOlZLfZnwJwNMJYpMdGE7GNcNVU
         DXv4Wq41GyT4nLX4JBaDxxEZIMczs4VKgbd8Z9Yng5qHgwm3pz/Wy16oJKxivz/KfsDI
         +REC0d55lqe3oeXgrn6ploV3Nk2CXEwrioM44LhJCoSKBKjjM8mQkE3YJ7pik55cmUvl
         xjKA==
X-Forwarded-Encrypted: i=1; AJvYcCWbAgmFOA2hlZk1tR+M1pBo1isItcZvQMWPBB3iLxTupq50tBMA+fdvfa/Ll5p9Dx3WFkL82qtOiXTiVds=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsYdaZK56tl1i96oxao/b0GU0aFKMY5XDu1pF5xeBZaVcl1zmH
	ubI8Taq4k6v+44TLKT+YM8VTipxWEZhJsIeEz5IUD7VrwCo6y3NBnBEvp3W1ldAIH/yOJ7RN
X-Gm-Gg: ASbGncukRdYwrTpT6RrGM81QWhB710ulyHSm/flVi1BgN8GVgvbUnjJEJ9C4grMnl1b
	k6xk3EshSQsMXO5hDRZJzeIyUbFuyDwpbYW1PSJKT2fpi3fDInXPtnyrHJzN0xCx2lb6prcRuWU
	+1r9QdYGgB5PwMg1GBjI/rk1l4naEL+AqBVZTYYdpy5XrkXn1SnCeIWdfnILCZxOo1Z9/1Z9CH9
	qnirGBGCBnlY0gPeSVSzYgf3D+xb0UlbwTf9XqmwmFrS5Ybpz+kV9/sIin8tVmK37viTpFWj4rC
	mZ5/TSeJlx8Enp9+HbKdkw7mqYHrQk1ajZUBVeuSB6i+Y4bvIuBhrwVQseDb
X-Google-Smtp-Source: AGHT+IFxiYecp4uZ8N06XdkoxoWRIDA9NFEdTiYseV/L9zVDNrtz7gti0tX6H09Zso27sqM6lEyn8w==
X-Received: by 2002:a05:600c:8692:b0:453:62e9:125a with SMTP id 5b1f17b1804b1-454a37fe36cmr14424645e9.18.1751446148516;
        Wed, 02 Jul 2025 01:49:08 -0700 (PDT)
Received: from localhost ([87.254.0.133])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a892e6214fsm15636752f8f.98.2025.07.02.01.49.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 01:49:08 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Jyri Sarha <jyri.sarha@iki.fi>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] drm/tidss: remove redundant assignment to variable ret
Date: Wed,  2 Jul 2025 09:48:44 +0100
Message-ID: <20250702084844.966199-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

The assignment of zero to variable is redundant as the following
continue statement loops back to the start of the loop where
ret is assigned a new value from the return to the call to
get_parent_dss_vp. Remove assignment.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/tidss/tidss_oldi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/tidss/tidss_oldi.c b/drivers/gpu/drm/tidss/tidss_oldi.c
index 8223b8fec8ce..182a69354424 100644
--- a/drivers/gpu/drm/tidss/tidss_oldi.c
+++ b/drivers/gpu/drm/tidss/tidss_oldi.c
@@ -464,7 +464,6 @@ int tidss_oldi_init(struct tidss_device *tidss)
 				 * which may still be connected.
 				 * Continue to search for that.
 				 */
-				ret = 0;
 				continue;
 			}
 			goto err_put_node;
-- 
2.50.0

