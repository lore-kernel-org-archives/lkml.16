Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58DA3202982
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 17:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743615784; cv=none; b=bKkBl833KCWSBTSr/Ng07D3kYQwlTlUWAWlnxnHAvPrAh+WEVS8SrEKQy2WDXVmLl/b5bTFt20yPsf8riOTEJAE9TdYjenawpGOxxE/RMuV0UGww2+BvFzTwZiX5uhQ+rIK7T+90SoUnox9wthvxhln0L2Pe3iRkkHaul0sTUw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743615784; c=relaxed/simple;
	bh=HYMxLPoXW6Y1QIruiib9Zo9L+bclQU5xJEqbXk6UmFk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JZtbir6FvfYiRKprc0kR1U2/DUc9ChJsEK8xHjkDHP5VQv5qS3Eck12KuYJCtvZYYo41uC6TRpXQAWnqb2fA8iIivtuakAJAT6MezuRjdkjV+qHDU6FdhBQuHCMlE35Ns16vxBh9OE2+GnLc++OqegTOFyCcn3NurSRn8DCWn8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JA3wSddJ; arc=none smtp.client-ip=209.85.166.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JA3wSddJ"
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-85b4170f1f5so417239f.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 10:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743615782; x=1744220582; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/NT2KOV5clgY+fvBVb0kMabH8vqyg2O7PfGhDz8vOzc=;
        b=JA3wSddJW56pecr4Ys5faL8XAZSu0VMoOeU2O8dHKnTNQ0tgaE9PemxKCoE+KX+u4A
         l0xAx7oO/k7Cz0zT/fIMYT/FawAvoKbLEyDpLj2OGg6sPvLhZRzVL0VytD18AJYfVqFW
         /lPTKtumnTkdOw50KYeHYdwPGUpylutze9CfMSuIZ997SjDiQy4su3emzTqgRliNI0vJ
         IK2gmhecTiOppKgLSs+SPRC7Rx1GX3A+KpxutlWcRrwJzXqIHa3GK6jlqCjYB53O6xn5
         WydL5JzieUBtooLE7VKWWW18FxV/lvEkd36QhNkN8T6aw02Y3MHUa+9aZOKsEGuaHHig
         ChQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743615782; x=1744220582;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/NT2KOV5clgY+fvBVb0kMabH8vqyg2O7PfGhDz8vOzc=;
        b=uOIhAvS+WuZ0r0kj5i/zAdBGQ+hn08jx3PLxmkHcqeWFOUl50RYL++ebzO6NMh9l0x
         ek9R2dabDdtZHcwjRJKMPQvQJcaQgO7TIa6wsaRVr1CqlOaVsPxBVmVjjZ0pYvZOdQUu
         kD89Y75VO3b5sf0agHLHoZ7ZYlrttG2rEVln4ecphNMpJ1uehd+4RPuaSKUHGayKAQWt
         8wlkwg/siKspQAJ3EZSgHAb1To/YhimjswFg4Oxuh8zz52oLrrUoTTn3y32bb40P3DLv
         nVX2ujcH0+tOzZJs9oNarKnfRr+MGcIjm+KZO+GopgZIaHdTaSkhB3NQiUFBfoJSBG/a
         tsgg==
X-Forwarded-Encrypted: i=1; AJvYcCUV5iUEiGEE63jms9UBgnr7FwnjW7zAT3XTvD3qd2HaMuhR2Qojk5CCnSeinyrLA66a6+68aZPWnvJcMko=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/YYSCzvKGEob2GxxkQoXhPI3ufk+YryTQZMSNP7R0WcjP/tIw
	kczjrbvKtVJysEE03le9hOHPeeTYkvNcXzD2ow0FoFSdNwjEF+hU
X-Gm-Gg: ASbGncuve2CopKbq/7wShY943ApCvxVqCQiOafjcotNODCkBu59HnICbBLNbGc03DJd
	06NkU2y/MV/hw9LAv0DbCm9xEyQCnol2tpAzlFZ77PnZ7yHQ/b3SzZY5U+LR1nDJjVon2Mdk1R5
	cX6pVmx7X7jCWFWD0NhvwIPNw/gJSZ8lLuZ59c/q2BOjksjzdAiXcnCcATW9wC8JTvhAOWtTFLt
	hm3iCie9Kw4uD3KOQxon1LpuQvTb/qmuHNIu+4RkD/oogwMRRA5BOpIRY2UONtxMA1yCU5Djs5u
	t3m94M9b/e/ogNRyD1q1MLD8I/KdPo+k+LWorCmwjNNN6Tv1eJ4mbtyQBcdZYy5qk+dq3y7He4O
	q3KbMij/LIuMK
X-Google-Smtp-Source: AGHT+IHugLKyVSM4152JdpDyO0IyiqFWhgdr4RcjxQiNgdLiEazciacIDXztJ7jfLMjeFRlO1pAg2Q==
X-Received: by 2002:a05:6e02:1a21:b0:3d5:d6ad:286a with SMTP id e9e14a558f8ab-3d6d54bba56mr37037015ab.13.1743615782473;
        Wed, 02 Apr 2025 10:43:02 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id e9e14a558f8ab-3d5d5af8369sm33439725ab.71.2025.04.02.10.43.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 10:43:02 -0700 (PDT)
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
Subject: [PATCH v3 50/54] drm-dyndbg: add DRM_CLASSMAP_USE to the gud driver
Date: Wed,  2 Apr 2025 11:41:52 -0600
Message-ID: <20250402174156.1246171-51-jim.cromie@gmail.com>
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

The gud driver has a number of DRM_UT_* debugs, make them
controllable when CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg
that the module uses them.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/gud/gud_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/gud/gud_drv.c b/drivers/gpu/drm/gud/gud_drv.c
index cb405771d6e2..3843c0e47169 100644
--- a/drivers/gpu/drm/gud/gud_drv.c
+++ b/drivers/gpu/drm/gud/gud_drv.c
@@ -32,6 +32,8 @@
 
 #include "gud_internal.h"
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 /* Only used internally */
 static const struct drm_format_info gud_drm_format_r1 = {
 	.format = GUD_DRM_FORMAT_R1,
-- 
2.49.0

