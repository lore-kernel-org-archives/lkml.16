Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B001FECC6
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 17:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743615776; cv=none; b=LYakmA9X/ERywSIhzx8SrgHih5hyznz+kzdaG9qONrVdDTBP7yF6C3Q7xr/+LGMMGkCX6zD7Kbg/cQWz3oYkqTdNEWH1fZDUDH3Nrt7AfPpnwffPFj5lLoQvTEgdcUN6SC7xJnrLIz8gM70rkfqluEFuOQ1mOAr2YGa0f3wa50E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743615776; c=relaxed/simple;
	bh=9NtscGLERKvma6MVRefJ14MqvdE12lJjU+jsKPBV/DE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gG7/Hdt6MV+MKqdS0ASSC8HLMWrBWwMkMEt43H6bbR6XzZTYlYyslyBrE+/jeLqtbHOSPhmiXd2Z34Ow4ZeZMR7re8h2fXZ7OrK9gT45ljVk2wOrHBSQfMN2HJPLNDKV+BAyV1577ns20vz9mqdyMOkK+kBYnJS3S7dKn8cA9tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ccfje/TA; arc=none smtp.client-ip=209.85.166.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ccfje/TA"
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-3d5e43e4725so476935ab.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 10:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743615774; x=1744220574; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/3ieg6OYf20TvXEjKUEioS2vPpvBZB2Yv38SKV0x07E=;
        b=Ccfje/TAscJ+rkVO9dLkXzXLWegm21kxoz1GcUvCFhDs1XV1e8us/wvRaJE91Tbu4z
         1STvfYrYp1KresmZHjxTUJTYy/G/gIGYXaeln5wf1nNw+xU3ZkwCRt4K9Q5XSjJS3wmH
         DO3Y/arZ6xFJeqyY02cmGLum5yw1p5m1sDHmYERYkUtpAPo9nu9cEeZLUF7ygZJu0/PJ
         thCdEj6CFN7VI384zwbEt3HWWb0TDkAjpCkyIL6woFGkgSI43KnwGp7pLp+gOAFirD+N
         SBjA9MK6K6krjvXZrplJrcZL36OYuYrXJAUqbvnD6eDYr6l30Qo2ItZXRCQ+a9meEKg5
         vV4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743615774; x=1744220574;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/3ieg6OYf20TvXEjKUEioS2vPpvBZB2Yv38SKV0x07E=;
        b=iRCHsfBXjgZybrZlOiXJp9vhqebtbMgzGCuDs5xKI3Iu5PHtk8GprCNMj8NdTe/T+4
         n4lAtDh1gtGks5jIA0RyvaLTAwL0wEBCJFM/Ul8B8mu+tQyayDJZoWBp13Kg+EEbxRfX
         5R0yKioNBm1bPfW4fwav44+s9hglsibdGaQ9rvAlpLYuzghHK0fo5n60jvRpzkNRVzeo
         +dAMgeT7ApciKg+E9idEVBe/i1DKneQdPqpqY+kbzdivizxVnM/iv4lOXnP2GqRhFtdR
         0vYkPCA6V9OMJNb2jYMInF/6try866b8XsVitsWHI1WLWJVRnMQzYtlUcM866L8vCxcv
         FFeg==
X-Forwarded-Encrypted: i=1; AJvYcCV62oxC9ENp167auHxwmRXJQIBmh4NEm1tcZxa2dVTrE7f6B76ua+mIv6zfvqA/UWhLB6gXeO477wHWq3U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6zJgShWLPJfp5reE8dyb84kCJvflXMMFVc18a6bn149l8Q0+c
	gZJ9UnshH9tn8gWU08GfMsA0QbUEuqcf6xTJPRAA8DWD6G7nuPk5
X-Gm-Gg: ASbGncvBcMe384rGh2+1Ic2eXEUQqD+cMnl2Oy2NUSkYis+8PVxN81LRMpsa9Alaedk
	IAxVN7G1xCkqoLvOb6fc0V7KWiwDd+zUQh+PDlwHHpTzhF8rEHf0FA5s5Ad97u/dtmNbJFh6W9g
	STJN696yUqP9zb0dcTt7UBh/2GZ3d/FaYlvIzc2CqAmU2JHrkc92QEu3nQDFadwzC++ctichngp
	KCAy3dzpsgxljwMhZJD0c6eX/Cqw2z9OetBj+k2iR2KhsGXQ2czuuxyx5vBR/Dnn2EqTzE1sp+3
	k5heSjvPzVsZBdWYacyMyaNL++Nb/4gPG6fBtxIl61s8zvj8f/WNZaIBqPrbJ5LpP4DbDw1EKkE
	lmw==
X-Google-Smtp-Source: AGHT+IHe/pqeVfJKwU/w9Mu6w5oW6sxJF8LlG8OrV986EBMutyzx2qa4fxPX6enM0iFttCFAiE+Ekg==
X-Received: by 2002:a05:6e02:1a8f:b0:3d3:ff5c:287 with SMTP id e9e14a558f8ab-3d6d5535a0amr31645515ab.14.1743615774357;
        Wed, 02 Apr 2025 10:42:54 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id e9e14a558f8ab-3d5d5af8369sm33439725ab.71.2025.04.02.10.42.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 10:42:53 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com,
	gregkh@linuxfoundation.org,
	ukaszb@chromium.org,
	louis.chauvet@bootlin.com,
	linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org,
	intel-gvt-dev@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	daniel.vetter@ffwll.ch,
	tvrtko.ursulin@linux.intel.com,
	jani.nikula@intel.com,
	ville.syrjala@linux.intel.com,
	Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v3 41/54] drm-dyndbg: add DRM_CLASSMAP_USE to simpledrm
Date: Wed,  2 Apr 2025 11:41:43 -0600
Message-ID: <20250402174156.1246171-42-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250402174156.1246171-1-jim.cromie@gmail.com>
References: <20250402174156.1246171-1-jim.cromie@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tiny/simpledrm has 3 DRM_UT_DRIVER debugs, make them controllable when
CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg that the module has
class'd debugs.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/tiny/simpledrm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
index 5d9ab8adf800..bcf2cccac0ec 100644
--- a/drivers/gpu/drm/tiny/simpledrm.c
+++ b/drivers/gpu/drm/tiny/simpledrm.c
@@ -34,6 +34,8 @@
 #define DRIVER_MAJOR	1
 #define DRIVER_MINOR	0
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 /*
  * Helpers for simplefb
  */
-- 
2.49.0

